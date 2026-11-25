import os
import sys
import re
import json
import shutil
import xml.etree.ElementTree as ET


def parse_public_xml(path):
    res = {}
    with open(path, "r", encoding="utf-8", errors="ignore") as f:
        for line in f:
            m = re.search(r'type="([^"]+)"\s+name="([^"]+)"\s+id="(0x[0-9a-fA-F]+)"', line)
            if m:
                res[(m.group(1), m.group(2))] = m.group(3).lower()
    return res


def merge_values_xml(values_dir, xml_name, items):
    path = os.path.join(values_dir, xml_name)
    if os.path.isfile(path):
        tree = ET.parse(path)
        root = tree.getroot()
    else:
        root = ET.Element("resources")
        tree = ET.ElementTree(root)

    existing = {child.attrib.get("name") for child in root if child.attrib.get("name")}
    added = 0
    for snippet in items:
        el = ET.fromstring(snippet)
        name = el.attrib.get("name")
        if name and name not in existing:
            root.append(el)
            existing.add(name)
            added += 1
    ET.indent(tree, space="    ")
    tree.write(path, encoding="utf-8", xml_declaration=True)
    return added


def find_smali_file(root_dir, rel_path):
    for sd in sorted(os.listdir(root_dir)):
        if sd.startswith("smali"):
            p = os.path.join(root_dir, sd, rel_path)
            if os.path.isfile(p):
                return p
    return None


def prep_secsettings(settings_dir, payload_dir):
    # 1. Copy layouts & menu
    res_src = os.path.join(payload_dir, "secsettings", "res")
    res_dst = os.path.join(settings_dir, "res")
    for dp, _, fns in os.walk(res_src):
        for fn in fns:
            rel = os.path.relpath(os.path.join(dp, fn), res_src)
            target = os.path.join(res_dst, rel)
            os.makedirs(os.path.dirname(target), exist_ok=True)
            shutil.copy2(os.path.join(dp, fn), target)

    # 2. Merge missing dimens, strings, styles & ids
    with open(os.path.join(payload_dir, "secsettings", "values.json"), "r", encoding="utf-8") as f:
        vals = json.load(f)
    values_dir = os.path.join(res_dst, "values")
    merge_values_xml(values_dir, "dimens.xml", vals.get("dimen", []))
    merge_values_xml(values_dir, "strings.xml", vals.get("string", []))
    merge_values_xml(values_dir, "styles.xml", vals.get("style", []))
    merge_values_xml(values_dir, "ids.xml", vals.get("id", []))

    # 3. Replace legacy privacy entry in sec_other_privacy_settings.xml with One UI 9.5 native entry
    privacy_xml = os.path.join(res_dst, "xml", "sec_other_privacy_settings.xml")
    if os.path.isfile(privacy_xml):
        with open(privacy_xml, "r", encoding="utf-8") as f:
            txt = f.read()
        txt = re.sub(
            r'\s*<SecPreferenceScreen[^>]*android:key="key_applock_privacy".*?</SecPreferenceScreen>',
            "",
            txt,
            flags=re.S,
        )
        txt = re.sub(
            r'\s*<SecPreference[^>]*android:key="app_lock"[^>]*/?>',
            "",
            txt,
        )
        anchor = 'android:key="samsung_privacy_category" android:order="-1000" settings:controller="com.samsung.android.settings.privacy.SamsungPrivacyCategoryPreferenceController" />'
        native_pref = (
            '    <SecPreference android:title="@string/sec_applock_title" android:key="app_lock" '
            'android:order="-952" android:fragment="com.samsung.android.settings.privacy.applock.AppLockSettingsFragment" '
            'settings:controller="com.samsung.android.settings.privacy.applock.AppLockPreferenceController" />'
        )
        if anchor in txt:
            txt = txt.replace(anchor, anchor + "\n" + native_pref, 1)
            with open(privacy_xml, "w", encoding="utf-8") as f:
                f.write(txt)
            print("- Updated sec_other_privacy_settings.xml with One UI 9.5 AppLock entry")

    # 4. Disable legacy Usefulfeature AppLock entry (One UI 9.5 uses More privacy settings)
    useful_xml = os.path.join(res_dst, "xml", "sec_useful_feature.xml")
    if os.path.isfile(useful_xml):
        with open(useful_xml, "r", encoding="utf-8") as f:
            utxt = f.read()
        utxt = re.sub(
            r'(<SecPreferenceScreen[^>]*com\.samsung\.android\.settings\.usefulfeature\.applock\.AppLockPreferenceController[^>]*?)(\s*/?>)',
            lambda m: m.group(0) if 'settings:searchable="false"' in m.group(1) else m.group(1) + ' settings:searchable="false"' + m.group(2),
            utxt,
        )
        with open(useful_xml, "w", encoding="utf-8") as f:
            f.write(utxt)

    # 5. Add Settings$AppLockSettingsActivity to AndroidManifest.xml
    manifest_path = os.path.join(settings_dir, "AndroidManifest.xml")
    with open(manifest_path, "r", encoding="utf-8") as f:
        man = f.read()
    if "com.android.settings.Settings$AppLockSettingsActivity" not in man:
        act_xml = (
            '        <activity android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|screenSize|smallestScreenSize" '
            'android:exported="true" android:label="@string/sec_applock_title" '
            'android:name="com.android.settings.Settings$AppLockSettingsActivity" '
            'android:parentActivityName="com.android.settings.Settings$MoreSecurityPrivacySettingsActivity">\n'
            '            <intent-filter android:priority="999">\n'
            '                <action android:name="android.settings.APP_LOCK_SETTINGS"/>\n'
            '                <category android:name="android.intent.category.DEFAULT"/>\n'
            '            </intent-filter>\n'
            '            <meta-data android:name="com.android.settings.FRAGMENT_CLASS" '
            'android:value="com.samsung.android.settings.privacy.applock.AppLockSettingsFragment"/>\n'
            '            <meta-data android:name="com.android.settings.HIGHLIGHT_MENU_KEY" '
            'android:value="@string/menu_key_privacy"/>\n'
            '        </activity>\n'
        )
        man = man.replace("    </application>", act_xml + "    </application>", 1)
        with open(manifest_path, "w", encoding="utf-8") as f:
            f.write(man)
        print("- Added Settings$AppLockSettingsActivity to SecSettings AndroidManifest.xml")


def patch_smali_secsettings(settings_dir, payload_dir, compiled_pub_xml):
    # Remove legacy usefulfeature AppLock availability if forced to 0 earlier
    old_ctrl = find_smali_file(settings_dir, "com/samsung/android/settings/usefulfeature/applock/AppLockPreferenceController.smali")
    if old_ctrl:
        with open(old_ctrl, "r", encoding="utf-8") as f:
            octxt = f.read()
        octxt = re.sub(
            r'(\.method public getAvailabilityStatus\(\)I.*?\.locals \d+\n\n)(?:    const/4 [vp]\d+, 0x0\n\n    return [vp]\d+)',
            r'\1    const/4 v0, 0x3\n\n    return v0',
            octxt,
            flags=re.S,
        )
        with open(old_ctrl, "w", encoding="utf-8") as f:
            f.write(octxt)

    # 1. Build resource ID remap table (S26 0x7f... -> M51 compiled public.xml 0x7f...)
    with open(os.path.join(payload_dir, "secsettings", "s26_id_map.json"), "r", encoding="utf-8") as f:
        s26_map = json.load(f)
    m51_pub = parse_public_xml(compiled_pub_xml)
    remap = {}
    missing_ids = []
    for old_hex, (rtype, rname) in s26_map.items():
        new_hex = m51_pub.get((rtype, rname))
        if new_hex:
            remap[old_hex.lower()] = new_hex.lower()
        else:
            missing_ids.append((old_hex, rtype, rname))
    if missing_ids:
        raise RuntimeError(f"Unresolved SecSettings IDs after build: {missing_ids}")

    # 2. Deduplicate and copy privacy/applock & Settings$AppLockSettingsActivity smali into next smali_classesN dir
    src_smali_root = os.path.join(payload_dir, "secsettings", "smali")
    payload_rels = set()
    for dp, _, fns in os.walk(src_smali_root):
        for fn in fns:
            if fn.endswith(".smali"):
                payload_rels.add(os.path.relpath(os.path.join(dp, fn), src_smali_root).replace(os.sep, "/"))

    for sd in sorted(os.listdir(settings_dir)):
        if not sd.startswith("smali"):
            continue
        sd_path = os.path.join(settings_dir, sd)
        for dp, _, fns in os.walk(sd_path):
            for fn in fns:
                if not fn.endswith(".smali"):
                    continue
                fp = os.path.join(dp, fn)
                rel = os.path.relpath(fp, sd_path).replace(os.sep, "/")
                if rel in payload_rels or rel.startswith("com/samsung/android/settings/privacy/applock/"):
                    os.remove(fp)

    smali_nums = [1]
    empty_trailing = []
    for sd in sorted(os.listdir(settings_dir)):
        if sd.startswith("smali_classes"):
            sd_path = os.path.join(settings_dir, sd)
            try:
                smali_nums.append(int(sd.replace("smali_classes", "")))
            except ValueError:
                pass
            if not any(fns for _, _, fns in os.walk(sd_path)):
                empty_trailing.append(sd_path)
    target_smali_root = empty_trailing[0] if empty_trailing else os.path.join(settings_dir, f"smali_classes{max(smali_nums) + 1}")

    copied = 0
    for dp, _, fns in os.walk(src_smali_root):
        for fn in fns:
            if not fn.endswith(".smali"):
                continue
            src = os.path.join(dp, fn)
            rel = os.path.relpath(src, src_smali_root)
            with open(src, "r", encoding="utf-8") as f:
                txt = f.read()
            txt = re.sub(
                r'0x7f[0-9a-fA-F]{6}',
                lambda m: remap.get(m.group(0).lower(), m.group(0)),
                txt,
            )
            # Bridge AbsAdapter.mOnBindListener if M51 AbsAdapter has SeslAppPickerView instead of AppPickerAdapter$OnBindListener
            if fn == "GalleryLockConfirmDialogHelper$$ExternalSyntheticLambda1.smali":
                abs_p = find_smali_file(settings_dir, "androidx/picker/adapter/AbsAdapter.smali")
                if abs_p and "AppPickerAdapter$OnBindListener" not in open(abs_p, errors="ignore").read():
                    txt = txt.replace(
                        "    iget-object v8, v8, Landroidx/picker/adapter/HeaderFooterAdapter;->wrappedAdapter:Landroidx/picker/adapter/AbsAdapter;\n\n"
                        "    iput-object v9, v8, Landroidx/picker/adapter/AbsAdapter;->mOnBindListener:Landroidx/picker/adapter/AppPickerAdapter$OnBindListener;",
                        "    # skipped mOnBindListener bridge for S911B AppPicker",
                    )
            dst = os.path.join(target_smali_root, rel)
            os.makedirs(os.path.dirname(dst), exist_ok=True)
            with open(dst, "w", encoding="utf-8") as f:
                f.write(txt)
            copied += 1

    # 3. Patch GroupTitleViewData.<init>(GroupAppData) if missing
    gt_p = find_smali_file(settings_dir, "androidx/picker/model/viewdata/GroupTitleViewData.smali")
    if gt_p:
        with open(gt_p, "r", encoding="utf-8") as f:
            gtxt = f.read()
        if ".method public constructor <init>(Landroidx/picker/model/appdata/GroupAppData;)V" not in gtxt:
            ctor = (
                "\n# direct methods\n"
                ".method public constructor <init>(Landroidx/picker/model/appdata/GroupAppData;)V\n"
                "    .locals 0\n\n"
                "    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;\n\n"
                "    invoke-direct {p0}, Ljava/lang/Object;-><init>()V\n\n"
                "    iput-object p1, p0, Landroidx/picker/model/viewdata/GroupTitleViewData;->appData:Landroidx/picker/model/appdata/GroupAppData;\n\n"
                "    return-void\n"
                ".end method\n"
            )
            gtxt = gtxt.replace("# virtual methods", ctor + "\n# virtual methods", 1)
            with open(gt_p, "w", encoding="utf-8") as f:
                f.write(gtxt)

    # 4. Add SALogging.insertSALog(String, String, int, Map) if missing
    sa_p = find_smali_file(settings_dir, "com/samsung/android/settings/logging/SALogging.smali")
    if sa_p:
        with open(sa_p, "r", encoding="utf-8") as f:
            satxt = f.read()
        sig = ".method public static insertSALog(Ljava/lang/String;Ljava/lang/String;ILjava/util/Map;)V"
        if sig not in satxt:
            helper = (
                "\n.method public static insertSALog(Ljava/lang/String;Ljava/lang/String;ILjava/util/Map;)V\n"
                "    .locals 2\n\n"
                "    int-to-long v0, p2\n\n"
                "    invoke-static {p0, p1, p3, v0, v1}, Lcom/samsung/android/settings/logging/SALogging;->insertSALog(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;J)V\n\n"
                "    return-void\n"
                ".end method\n"
            )
            # Fallback if (String,String,Map,J) doesn't exist, check exact overload or no-op safely
            if "insertSALog(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;J)V" not in satxt:
                helper = (
                    "\n.method public static insertSALog(Ljava/lang/String;Ljava/lang/String;ILjava/util/Map;)V\n"
                    "    .locals 0\n\n"
                    "    invoke-static {p0, p1}, Lcom/samsung/android/settings/logging/SALogging;->insertSALog(Ljava/lang/String;Ljava/lang/String;)V\n\n"
                    "    return-void\n"
                    ".end method\n"
                )
            satxt = satxt + helper
            with open(sa_p, "w", encoding="utf-8") as f:
                f.write(satxt)

    # 5. Register AppLockSettingsFragment in SettingsGateway.SAMSUNG_ENTRY_FRAGMENTS
    gw_p = find_smali_file(settings_dir, "com/android/settings/core/gateway/SettingsGateway.smali")
    if gw_p:
        with open(gw_p, "r", encoding="utf-8") as f:
            gw = f.read()
        if "privacy/applock/AppLockSettingsFragment;" not in gw:
            pat = re.compile(
                r'(    filled-new-array/range \{v(\d+) \.\. v(\d+)\}, \[Ljava/lang/String;\s+'
                r'move-result-object v0\s+'
                r'sput-object v0, Lcom/android/settings/core/gateway/SettingsGateway;->SAMSUNG_ENTRY_FRAGMENTS:\[Ljava/lang/String;)'
            )
            m_arr = pat.search(gw)
            if not m_arr:
                raise RuntimeError("Could not locate SAMSUNG_ENTRY_FRAGMENTS array in SettingsGateway.smali")
            start_v = int(m_arr.group(2))
            end_v = int(m_arr.group(3))
            new_v = end_v + 1
            if new_v > 255:
                raise RuntimeError(f"Register overflow {new_v} in SettingsGateway.<clinit>")
            m_loc = re.search(r'\.locals\s+(\d+)', gw)
            if m_loc and int(m_loc.group(1)) <= new_v:
                gw = gw[:m_loc.start(1)] + str(new_v + 1) + gw[m_loc.end(1):]
                m_arr = pat.search(gw)
            insert_block = (
                f"    const-class v0, Lcom/samsung/android/settings/privacy/applock/AppLockSettingsFragment;\n\n"
                f"    invoke-virtual {{v0}}, Ljava/lang/Class;->getName()Ljava/lang/String;\n\n"
                f"    move-result-object v{new_v}\n\n"
                f"    filled-new-array/range {{v{start_v} .. v{new_v}}}, [Ljava/lang/String;\n\n"
                f"    move-result-object v0\n\n"
                f"    sput-object v0, Lcom/android/settings/core/gateway/SettingsGateway;->SAMSUNG_ENTRY_FRAGMENTS:[Ljava/lang/String;"
            )
            gw = gw[:m_arr.start(1)] + insert_block + gw[m_arr.end(1):]
            with open(gw_p, "w", encoding="utf-8") as f:
                f.write(gw)
    # 6. Register in SAStatusClassList
    sa_cls_p = find_smali_file(settings_dir, "com/samsung/android/settings/logging/SAStatusClassList.smali")
    if sa_cls_p:
        with open(sa_cls_p, "r", encoding="utf-8") as f:
            st = f.read()
        if "AppLockSettingsFragment" not in st:
            st = st.replace(
                '"com.samsung.android.settings.usefulfeature.applock.AppLockPreferenceController"',
                '"com.samsung.android.settings.privacy.applock.AppLockSettingsFragment"',
            )
            with open(sa_cls_p, "w", encoding="utf-8") as f:
                f.write(st)

    print(f"- Patched SecSettings smali: {copied} classes, remapped {len(remap)} resource IDs")


if __name__ == "__main__":
    mode = sys.argv[1]
    if mode == "prep":
        prep_secsettings(sys.argv[2], sys.argv[3])
    elif mode == "smali":
        patch_smali_secsettings(sys.argv[2], sys.argv[3], sys.argv[4])
    else:
        print("Usage: patch_secsettings.py <prep|smali> ...")
        sys.exit(1)
