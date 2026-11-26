import os
import sys
import json
import shutil
import xml.etree.ElementTree as ET


TYPE_TO_XML = {
    "bool": ("bools.xml", "resources"),
    "color": ("colors.xml", "resources"),
    "dimen": ("dimens.xml", "resources"),
    "id": ("ids.xml", "resources"),
    "integer": ("integers.xml", "resources"),
    "plurals": ("plurals.xml", "resources"),
    "string": ("strings.xml", "resources"),
    "style": ("styles.xml", "resources"),
}

APPLOCK_PERMISSIONS = [
    (
        "android.permission.LOCK_APPS",
        '    <permission android:name="android.permission.LOCK_APPS" android:protectionLevel="internal|recents|role"/>',
    ),
    (
        "android.permission.TEST_LOCK_APPS",
        '    <permission android:name="android.permission.TEST_LOCK_APPS" android:protectionLevel="signature"/>',
    ),
]

APPLOCK_ACTIVITIES = [
    (
        "com.android.internal.app.AppLockActivity",
        '        <activity android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize" android:excludeFromRecents="true" android:exported="false" android:name="com.android.internal.app.AppLockActivity" android:permission="android.permission.LOCK_APPS" android:process=":ui" android:resizeableActivity="false" android:theme="@style/Theme.DeviceDefault.AppLockActivity">\n'
        '            <meta-data android:name="com.samsung.android.multiwindow.nonresizeable" android:value="true"/>\n'
        '            <intent-filter android:priority="100">\n'
        '                <action android:name="android.content.pm.action.SET_APP_LOCK"/>\n'
        '                <category android:name="android.intent.category.DEFAULT"/>\n'
        '            </intent-filter>\n'
        '        </activity>',
    ),
    (
        "com.android.internal.app.AppLockUserEducationActivity",
        '        <activity android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize" android:excludeFromRecents="true" android:exported="false" android:name="com.android.internal.app.AppLockUserEducationActivity" android:process=":ui" android:theme="@style/Theme.DeviceDefault.AppLockActivity"/>',
    ),
    (
        "com.android.internal.app.AppLockPermissionReviewActivity",
        '        <activity android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize" android:excludeFromRecents="true" android:exported="false" android:name="com.android.internal.app.AppLockPermissionReviewActivity" android:process=":ui" android:theme="@style/Theme.DeviceDefault.AppLockActivity"/>',
    ),
    (
        "com.android.internal.app.SamsungAppLockUserEducationActivity",
        '        <activity android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|screenSize|smallestScreenSize" android:enableOnBackInvokedCallback="true" android:excludeFromRecents="true" android:exported="false" android:name="com.android.internal.app.SamsungAppLockUserEducationActivity" android:process=":ui" android:theme="@style/Theme.Dialog.Confirmation"/>',
    ),
    (
        "com.android.internal.app.SamsungAppLockPermissionReviewActivity",
        '        <activity android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|screenSize|smallestScreenSize" android:enableOnBackInvokedCallback="true" android:excludeFromRecents="true" android:exported="false" android:name="com.android.internal.app.SamsungAppLockPermissionReviewActivity" android:process=":ui" android:theme="@style/Theme.Dialog.Confirmation"/>',
    ),
    (
        "com.android.internal.app.SamsungAppLockSettingsPromotionActivity",
        '        <activity android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|screenSize|smallestScreenSize" android:enableOnBackInvokedCallback="true" android:excludeFromRecents="true" android:exported="false" android:name="com.android.internal.app.SamsungAppLockSettingsPromotionActivity" android:process=":ui" android:theme="@style/Theme.DeviceDefault.AppLockSettingsPromotion"/>',
    ),
    (
        "com.android.internal.app.LockedAppActivity",
        '        <activity android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize" android:enableOnBackInvokedCallback="true" android:exported="false" android:name="com.android.internal.app.LockedAppActivity" android:process=":ui" android:screenOrientation="behind"/>',
    ),
    (
        "com.android.internal.app.LockedAppActivity$InterceptActivity",
        '        <activity android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize" android:excludeFromRecents="true" android:exported="false" android:name="com.android.internal.app.LockedAppActivity$InterceptActivity" android:process=":ui" android:screenOrientation="behind" android:theme="@style/Theme.DeviceDefault.Panel"/>',
    ),
]


def merge_values_xml(values_dir, xml_name, items):
    path = os.path.join(values_dir, xml_name)
    if os.path.isfile(path):
        tree = ET.parse(path)
        root = tree.getroot()
    else:
        root = ET.Element("resources")
        tree = ET.ElementTree(root)

    existing = set()
    by_name = {}
    for child in list(root):
        n = child.attrib.get("name")
        if n:
            existing.add(n)
            by_name[n] = child

    added = 0
    for snippet in items:
        el = ET.fromstring(snippet)
        name = el.attrib.get("name")
        if not name:
            continue
        if name == "config_enableAppLock" and name in by_name:
            by_name[name].text = "true"
            continue
        if name not in existing:
            root.append(el)
            existing.add(name)
            added += 1

    ET.indent(tree, space="    ")
    tree.write(path, encoding="utf-8", xml_declaration=True)
    return added


def patch_manifest(fwres_dir):
    manifest_path = os.path.join(fwres_dir, "AndroidManifest.xml")
    with open(manifest_path, "r", encoding="utf-8") as f:
        text = f.read()

    perm_added = 0
    missing_perms = [
        line for name, line in APPLOCK_PERMISSIONS
        if f'android:name="{name}"' not in text
    ]
    if missing_perms:
        perm_block = "\n".join(missing_perms)
        anchors = [
            '    <permission android:name="android.permission.SUSPEND_APPS" android:protectionLevel="signature|verifier|role"/>',
            '    <permission android:description="@string/permdesc_bluetoothAdmin"',
            '    <application ',
        ]
        inserted = False
        for idx, anchor in enumerate(anchors):
            if anchor in text:
                if idx == 0:
                    text = text.replace(anchor, anchor + "\n" + perm_block, 1)
                else:
                    text = text.replace(anchor, perm_block + "\n" + anchor, 1)
                inserted = True
                break
        if not inserted:
            raise RuntimeError("Could not find permission anchor in framework-res AndroidManifest.xml")
        perm_added = len(missing_perms)

    act_added = 0
    missing_acts = [
        block for name, block in APPLOCK_ACTIVITIES
        if f'android:name="{name}"' not in text
    ]
    if missing_acts:
        act_block = "\n".join(missing_acts)
        anchor = '        <activity android:excludeFromRecents="true" android:lockTaskMode="always" android:name="com.android.internal.app.BlockedAppActivity"'
        if anchor not in text:
            anchor = '        <activity android:excludeFromRecents="true" android:name="com.android.internal.app.UnlaunchableAppActivity"'
        if anchor not in text:
            raise RuntimeError("Could not find activity anchor in framework-res AndroidManifest.xml")
        text = text.replace(anchor, act_block + "\n" + anchor, 1)
        act_added = len(missing_acts)

    # Validate well-formed XML before writing
    ET.fromstring(text)
    with open(manifest_path, "w", encoding="utf-8") as f:
        f.write(text)
    return perm_added, act_added


def patch_fwres(fwres_dir, payload_dir):
    res_src = os.path.join(payload_dir, "fwres", "res")
    res_dst = os.path.join(fwres_dir, "res")
    copied = 0
    for dp, _, fns in os.walk(res_src):
        for fn in fns:
            rel = os.path.relpath(os.path.join(dp, fn), res_src)
            target = os.path.join(res_dst, rel)
            os.makedirs(os.path.dirname(target), exist_ok=True)
            shutil.copy2(os.path.join(dp, fn), target)
            copied += 1

    values_path = os.path.join(payload_dir, "fwres", "values.json")
    with open(values_path, "r", encoding="utf-8") as f:
        values = json.load(f)

    values_dir = os.path.join(res_dst, "values")
    total_added = 0
    for res_type, items in values.items():
        if res_type not in TYPE_TO_XML or not items:
            continue
        xml_name, _ = TYPE_TO_XML[res_type]
        total_added += merge_values_xml(values_dir, xml_name, items)

    perm_added, act_added = patch_manifest(fwres_dir)
    print(f"- Patched framework-res.apk: {copied} res files, {total_added} values entries, {perm_added} perms, {act_added} activities")


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: patch_fwres.py <decoded_fwres_dir> <payload_dir>")
        sys.exit(1)
    patch_fwres(sys.argv[1], sys.argv[2])
