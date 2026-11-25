#!/usr/bin/env python3
import glob
import json
import os
import re
import sys
import xml.etree.ElementTree as ET


def find_smali_file(root_dir, rel_path):
    hits = sorted(glob.glob(os.path.join(root_dir, "smali*", rel_path)))
    return hits[0] if hits else None


def get_next_smali_dir(root_dir):
    nums = [1]
    for p in glob.glob(os.path.join(root_dir, "smali*")):
        b = os.path.basename(p)
        if b == "smali":
            nums.append(1)
        elif b.startswith("smali_classes"):
            try:
                nums.append(int(b.replace("smali_classes", "")))
            except ValueError:
                pass
    return os.path.join(root_dir, f"smali_classes{max(nums) + 1}")


def load_public_xml(public_xml_path):
    tree = ET.parse(public_xml_path)
    by_type_name = {}
    for elem in tree.getroot().findall("public"):
        t = elem.attrib.get("type")
        n = elem.attrib.get("name")
        i = elem.attrib.get("id")
        if t and n and i:
            by_type_name.setdefault(t, {})[n] = int(i, 16)
    return by_type_name


def build_fw_remap(s26_map_path, public_xml_path):
    with open(s26_map_path, "r", encoding="utf-8") as f:
        s26 = json.load(f)
    m51 = load_public_xml(public_xml_path)
    remap = {}
    missing = []
    for k, v in s26.items():
        if k == "s26_to_meta":
            continue
        if isinstance(v, (list, tuple)) and len(v) == 2:
            t, name = v
            old_id = int(k, 16)
            t_m51 = m51.get(t, {})
            if name in t_m51:
                new_id = t_m51[name]
                if old_id != new_id:
                    remap[old_id] = new_id
            else:
                missing.append((t, name, k))
        elif isinstance(v, dict):
            t_m51 = m51.get(k, {})
            for s26_hex, name in v.items():
                if name in t_m51:
                    old_id = int(s26_hex, 16)
                    new_id = t_m51[name]
                    if old_id != new_id:
                        remap[old_id] = new_id
                else:
                    missing.append((k, name, s26_hex))
    return remap, m51, missing


def remap_hex_in_smali(txt, remap):
    if not remap:
        return txt

    def repl(m):
        val = int(m.group(0), 16)
        new_val = remap.get(val)
        return f"0x{new_val:x}" if new_val is not None else m.group(0)

    return re.sub(r'\b0x1[0-9a-fA-F]{6}\b', repl, txt)


def add_fields(txt, fields):
    added = []
    for fld in fields:
        name = fld.split()[-1].split(":")[0]
        if not re.search(rf'^\.field\s+[^\n]*\b{re.escape(name)}:', txt, re.M):
            added.append(fld)
    if not added:
        return txt
    block = "\n\n".join(added) + "\n\n"
    for marker in ("# direct methods", "# virtual methods"):
        if marker in txt:
            return txt.replace(marker, block + marker, 1)
    return txt + "\n" + block


def append_methods(txt, methods):
    changed = txt
    for hdr, body in methods:
        sig = hdr.split()[-1]
        if f" {sig}\n" not in changed and not changed.endswith(f" {sig}"):
            changed = changed.rstrip() + "\n\n" + body.strip() + "\n"
    return changed


def replace_or_append_method(txt, sig, body):
    pat = re.compile(rf'\.method\s+[^\n]*\s+{re.escape(sig)}\n.*?\.end method', re.S)
    if pat.search(txt):
        return pat.sub(body.strip(), txt, count=1)
    return txt.rstrip() + "\n\n" + body.strip() + "\n"


def get_stub_max_tx(txt):
    vals = [
        int(m.group(1), 16)
        for m in re.finditer(r'\.field\s+static\s+final\s+\w*\s*TRANSACTION_\w+:I\s*=\s*(0x[0-9a-fA-F]+)', txt)
    ]
    return max(vals) if vals else 0


def insert_before_packed_switch(body, code_reg, insert_smali):
    m = re.search(rf'^(    packed-switch\s+{re.escape(code_reg)},\s+:pswitch_data_0)', body, re.M)
    if not m:
        raise RuntimeError(f"Could not find packed-switch {code_reg} in method")
    return body[:m.start()] + insert_smali + "\n" + body[m.start():]


def copy_payload(fw_dir, payload_dir, remap):
    prefixes = [
        "com/android/internal/app/AppLock",
        "com/android/internal/app/LockedAppActivity",
        "com/android/internal/app/SamsungAppLock",
        "android/security/applock/",
        "com/samsung/android/animation/SemPredictiveBackTranslateHelper",
        "com/samsung/android/core/pm/SALogger",
    ]
    src_root = os.path.join(payload_dir, "smali")
    payload_rels = set()
    for root, _, files in os.walk(src_root):
        for fn in files:
            if fn.endswith(".smali"):
                sp = os.path.join(root, fn)
                payload_rels.add(os.path.relpath(sp, src_root).replace(os.sep, "/"))

    removed = 0
    for sdir in glob.glob(os.path.join(fw_dir, "smali*")):
        for root, _, files in os.walk(sdir):
            for fn in files:
                if not fn.endswith(".smali"):
                    continue
                fp = os.path.join(root, fn)
                rel = os.path.relpath(fp, sdir).replace(os.sep, "/")
                if rel in payload_rels or any(rel.startswith(p) for p in prefixes):
                    os.remove(fp)
                    removed += 1

    # Reuse trailing empty smali_classesN if a prior run emptied it, otherwise allocate next
    empty_trailing = [
        p for p in sorted(glob.glob(os.path.join(fw_dir, "smali_classes*")))
        if not any(True for _ in os.walk(p) if _[2])
    ]
    dst_root = empty_trailing[0] if empty_trailing else get_next_smali_dir(fw_dir)
    copied = 0
    for root, _, files in os.walk(src_root):
        for fn in files:
            if not fn.endswith(".smali"):
                continue
            sp = os.path.join(root, fn)
            rel = os.path.relpath(sp, src_root)
            dp = os.path.join(dst_root, rel)
            os.makedirs(os.path.dirname(dp), exist_ok=True)
            with open(sp, "r", encoding="utf-8") as f:
                txt = f.read()
            txt = remap_hex_in_smali(txt, remap)
            with open(dp, "w", encoding="utf-8") as f:
                f.write(txt)
            copied += 1
    print(f"- Copied {copied} framework AppLock smali into {os.path.basename(dst_root)} (removed {removed} old)")


def patch_r_classes(fw_dir, m51_pub):
    specs = {
        "com/android/internal/R$bool.smali": ("bool", ["config_enableAppLock"]),
        "com/android/internal/R$integer.smali": ("integer", ["config_appLockGracePeriodMs"]),
        "com/android/internal/R$plurals.smali": ("plurals", ["sem_applock_prompt_title"]),
        "com/android/internal/R$string.smali": (
            "string",
            [
                "config_appLockHelpLink",
                "sem_applock_default_home_app_exempt_toast_message",
                "sem_applock_default_phone_app_exempt_toast_message",
                "sem_applock_default_search_engine_app_exempt_toast_message",
            ],
        ),
    }
    for rel, (rtype, names) in specs.items():
        p = find_smali_file(fw_dir, rel)
        if not p:
            raise RuntimeError(f"Missing {rel}")
        with open(p, "r", encoding="utf-8") as f:
            txt = f.read()
        flds = []
        for n in names:
            rid = m51_pub.get(rtype, {}).get(n)
            if rid is None:
                raise RuntimeError(f"Missing {rtype}/{n} in compiled framework-res public.xml")
            # Remove stale line if re-running
            txt = re.sub(rf'^\.field[^\n]*\b{re.escape(n)}:I[^\n]*\n+', "", txt, flags=re.M)
            flds.append(f".field public static final blacklist {n}:I = 0x{rid:x}")
        txt = add_fields(txt, flds)
        with open(p, "w", encoding="utf-8") as f:
            f.write(txt)


def patch_flags(fw_dir):
    p = find_smali_file(fw_dir, "com/android/internal/hidden_from_bootclasspath/android/security/Flags.smali")
    with open(p, "r", encoding="utf-8") as f:
        txt = f.read()
    txt = add_fields(
        txt,
        [
            '.field public static final blacklist FLAG_APP_LOCK_BACKUP_RESTORE:Ljava/lang/String; = "android.security.app_lock_backup_restore"',
            '.field public static final blacklist FLAG_APP_LOCK_INCOMING_CALLS:Ljava/lang/String; = "android.security.app_lock_incoming_calls"',
            '.field public static final blacklist FLAG_APP_LOCK_KEYGUARD_REEVALUATION:Ljava/lang/String; = "android.security.app_lock_keyguard_reevaluation"',
            '.field public static final blacklist FLAG_APP_LOCK_PRESERVE_BUBBLES:Ljava/lang/String; = "android.security.app_lock_preserve_bubbles"',
            '.field public static final blacklist FLAG_APP_LOCK_SEARCH_ROLE_EXEMPT:Ljava/lang/String; = "android.security.app_lock_search_role_exempt"',
            '.field public static final blacklist FLAG_RETAIN_APP_LOCK_WIDGET_PROVIDERS:Ljava/lang/String; = "android.security.retain_app_lock_widget_providers"',
        ],
    )
    flag_vals = {
        "appLockCore()Z": 1,
        "appLockApis()Z": 1,
        "appLockIncomingCalls()Z": 1,
        "appLockBackupRestore()Z": 0,
        "appLockKeyguardReevaluation()Z": 0,
        "appLockPreserveBubbles()Z": 0,
        "appLockSearchRoleExempt()Z": 0,
        "retainAppLockWidgetProviders()Z": 0,
    }
    for sig, val in flag_vals.items():
        body = (
            f".method public static blacklist {sig}\n"
            f"    .locals 1\n\n"
            f"    const/4 v0, 0x{val}\n\n"
            f"    return v0\n"
            f".end method"
        )
        txt = replace_or_append_method(txt, sig, body)
    with open(p, "w", encoding="utf-8") as f:
        f.write(txt)


def patch_search_manager(fw_dir):
    p = find_smali_file(fw_dir, "android/app/SearchManager.smali")
    with open(p, "r", encoding="utf-8") as f:
        txt = f.read()
    txt = append_methods(
        txt,
        [
            (
                "addOnSearchEngineRoleAvailabilityChangedListenerAsUser(Landroid/os/UserHandle;Ljava/util/concurrent/Executor;Ljava/util/function/Consumer;)V",
                ".method public blacklist addOnSearchEngineRoleAvailabilityChangedListenerAsUser(Landroid/os/UserHandle;Ljava/util/concurrent/Executor;Ljava/util/function/Consumer;)V\n"
                "    .locals 0\n\n"
                "    return-void\n"
                ".end method",
            ),
            (
                "isSearchEngineRoleAvailable()Z",
                ".method public blacklist isSearchEngineRoleAvailable()Z\n"
                "    .locals 1\n\n"
                "    const/4 v0, 0x0\n\n"
                "    return v0\n"
                ".end method",
            ),
        ],
    )
    with open(p, "w", encoding="utf-8") as f:
        f.write(txt)


def patch_runes_and_metadata(fw_dir):
    cr_p = find_smali_file(fw_dir, "com/samsung/android/rune/CoreRune.smali")
    with open(cr_p, "r", encoding="utf-8") as f:
        txt = f.read()
    txt = add_fields(
        txt,
        [
            ".field public static final blacklist FW_DEVICE_CONTROL:Z = false",
            ".field public static final blacklist FW_SUPPORT_PRIVACY_DISPLAY_FOR_APPLOCK:Z = false",
            ".field public static final blacklist FW_SUPPORT_SAMSUNG_APPLOCK_ACTIVITY_BYPASS_METADATA:Z = true",
            ".field public static final blacklist FW_SUPPORT_SAMSUNG_APPLOCK_ALLOW_OVERLAY_SHOWING:Z = true",
            ".field public static final blacklist FW_SUPPORT_SAMSUNG_APPLOCK_BATCH_LAUNCH:Z = true",
            ".field public static final blacklist FW_SUPPORT_SAMSUNG_APPLOCK_DEFER_LOCK_IN_RECENTS:Z = true",
            ".field public static final blacklist FW_SUPPORT_SAMSUNG_APPLOCK_DROP_CALLER_REMOTE_TRANSITION:Z = false",
            ".field public static final blacklist FW_SUPPORT_SAMSUNG_APPLOCK_DW_CONCEPT:Z = true",
            ".field public static final blacklist FW_SUPPORT_SAMSUNG_APPLOCK_FOLDERLOCK:Z = true",
            ".field public static final blacklist FW_SUPPORT_SAMSUNG_APPLOCK_GROUP:Z = true",
            ".field public static final blacklist FW_SUPPORT_SAMSUNG_APPLOCK_MW_CONCEPT:Z = true",
            ".field public static final blacklist FW_SUPPORT_SAMSUNG_APPLOCK_OVER_KEYGUARD:Z = true",
            ".field public static final blacklist FW_SUPPORT_SAMSUNG_APPLOCK_PIP_CONCEPT:Z = true",
            ".field public static final blacklist FW_SUPPORT_SAMSUNG_APPLOCK_REMOTE_TRANSITION:Z = false",
            ".field public static final blacklist FW_SUPPORT_SAMSUNG_APPLOCK_ROLE_EXEMPT:Z = true",
            ".field public static final blacklist FW_SUPPORT_SAMSUNG_APPLOCK_ROLE_EXEMPT_DIALER:Z = true",
            ".field public static final blacklist FW_SUPPORT_SAMSUNG_APPLOCK_ROLE_EXEMPT_HOME:Z = true",
            ".field public static final blacklist FW_SUPPORT_SAMSUNG_APPLOCK_ROLE_EXEMPT_TOAST:Z = true",
            ".field public static final blacklist FW_SUPPORT_SAMSUNG_APPLOCK_SA_LOGGING:Z = true",
            ".field public static final blacklist FW_SUPPORT_SAMSUNG_APPLOCK_SETTING:Z = true",
            ".field public static final blacklist FW_SUPPORT_SAMSUNG_APPLOCK_TRANSITION:Z = true",
        ],
    )
    with open(cr_p, "w", encoding="utf-8") as f:
        f.write(txt)

    pm_p = find_smali_file(fw_dir, "com/samsung/android/rune/PMRune.smali")
    with open(pm_p, "r", encoding="utf-8") as f:
        pm = f.read()
    pm = add_fields(
        pm,
        [
            ".field public static final blacklist PM_APPLOCK_AUTHENTICATION_LABEL_VALIDATION:Z = true",
            ".field public static final blacklist PM_APPLOCK_DIALOG_APP_ICON:Z = true",
            ".field public static final blacklist PM_APPLOCK_SHORTCUT_USER_UNLOCK_CHECK:Z = true",
        ],
    )
    with open(pm_p, "w", encoding="utf-8") as f:
        f.write(pm)

    cm_p = find_smali_file(fw_dir, "com/samsung/android/rune/CoreMetaData.smali")
    with open(cm_p, "r", encoding="utf-8") as f:
        cm = f.read()
    cm = add_fields(cm, ['.field public static final blacklist APP_LOCK_BYPASS:Ljava/lang/String; = "com.samsung.android.applock.bypass"'])
    with open(cm_p, "w", encoding="utf-8") as f:
        f.write(cm)


def patch_misc_helpers(fw_dir):
    # CoreSaLogger
    sa_p = find_smali_file(fw_dir, "com/samsung/android/core/CoreSaLogger.smali")
    with open(sa_p, "r", encoding="utf-8") as f:
        sa = f.read()
    sa = append_methods(
        sa,
        [
            (
                "logForAppLock(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V",
                ".method public static blacklist logForAppLock(Ljava/lang/String;Ljava/lang/String;Ljava/util/HashMap;)V\n"
                "    .locals 8\n"
                '    const/4 v4, 0x0\n'
                '    const-wide/16 v5, -0x1\n'
                '    const-string v0, "4F4-399-995755"\n'
                '    const/4 v1, 0x0\n'
                '    move-object v2, p0\n'
                '    move-object v3, p1\n'
                '    move-object v7, p2\n'
                '    invoke-static/range {v0 .. v7}, Lcom/samsung/android/core/CoreSaLogger;->sendLogToServer(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;JLjava/util/HashMap;)V\n'
                "    return-void\n"
                ".end method",
            )
        ],
    )
    with open(sa_p, "w", encoding="utf-8") as f:
        f.write(sa)

    # MultiWindowUtils
    mw_p = find_smali_file(fw_dir, "com/samsung/android/multiwindow/MultiWindowUtils.smali")
    with open(mw_p, "r", encoding="utf-8") as f:
        mw = f.read()
    mw = append_methods(
        mw,
        [
            (
                "isAppLockActivity(Ljava/lang/String;)Z",
                ".method public static blacklist isAppLockActivity(Ljava/lang/String;)Z\n"
                "    .locals 0\n\n"
                "    invoke-static {p0}, Lcom/android/internal/app/LockedAppActivity;->isLockedAppActivityClassName(Ljava/lang/String;)Z\n\n"
                "    move-result p0\n\n"
                "    return p0\n"
                ".end method",
            )
        ],
    )
    with open(mw_p, "w", encoding="utf-8") as f:
        f.write(mw)

    # SemDualAppManager
    da_p = find_smali_file(fw_dir, "com/samsung/android/app/SemDualAppManager.smali")
    with open(da_p, "r", encoding="utf-8") as f:
        da = f.read()
    da = append_methods(
        da,
        [
            (
                "getDualAppParentId()I",
                ".method public static blacklist getDualAppParentId()I\n"
                "    .locals 2\n\n"
                "    invoke-static {}, Landroid/os/UserManager;->isHeadlessSystemUserMode()Z\n\n"
                "    move-result v0\n\n"
                "    if-nez v0, :cond_0\n\n"
                "    const/4 v0, 0x0\n\n"
                "    return v0\n\n"
                "    :cond_0\n"
                "    invoke-static {}, Lcom/samsung/android/app/SemDualAppManager;->getDualAppParentIdFromProperty()I\n\n"
                "    move-result v0\n\n"
                "    const/16 v1, -0x2710\n\n"
                "    if-ne v0, v1, :cond_1\n\n"
                "    invoke-static {}, Landroid/os/UserHandle;->myUserId()I\n\n"
                "    move-result v0\n\n"
                "    :cond_1\n"
                "    return v0\n"
                ".end method",
            ),
            (
                "getDualAppParentIdFromProperty()I",
                ".method private static blacklist getDualAppParentIdFromProperty()I\n"
                "    .locals 3\n\n"
                '    const-string/jumbo v0, "sys.dualapp.parent_id"\n\n'
                "    const/4 v1, 0x0\n\n"
                "    invoke-static {v0, v1}, Landroid/os/SystemProperties;->get(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;\n\n"
                "    move-result-object v0\n\n"
                "    if-eqz v0, :cond_0\n\n"
                "    :try_start_0\n"
                "    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z\n\n"
                "    move-result v1\n\n"
                "    if-nez v1, :cond_0\n\n"
                "    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I\n\n"
                "    move-result v0\n"
                "    :try_end_0\n"
                "    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0\n\n"
                "    return v0\n\n"
                "    :catch_0\n"
                "    new-instance v1, Ljava/lang/StringBuilder;\n\n"
                '    const-string/jumbo v2, "getDualAppParentIdFromProperty: invalid value "\n\n'
                "    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V\n\n"
                "    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;\n\n"
                "    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;\n\n"
                "    move-result-object v0\n\n"
                '    const-string/jumbo v1, "SemDualAppManager"\n\n'
                "    invoke-static {v1, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I\n\n"
                "    :cond_0\n"
                "    const/16 v0, -0x2710\n\n"
                "    return v0\n"
                ".end method",
            ),
            (
                "isDualAppParentId(I)Z",
                ".method public static blacklist isDualAppParentId(I)Z\n"
                "    .locals 1\n\n"
                "    invoke-static {}, Lcom/samsung/android/app/SemDualAppManager;->getDualAppParentId()I\n\n"
                "    move-result v0\n\n"
                "    if-ne p0, v0, :cond_0\n\n"
                "    const/4 p0, 0x1\n\n"
                "    return p0\n\n"
                "    :cond_0\n"
                "    const/4 p0, 0x0\n\n"
                "    return p0\n"
                ".end method",
            ),
        ],
    )
    with open(da_p, "w", encoding="utf-8") as f:
        f.write(da)

    # Notification
    notif_p = find_smali_file(fw_dir, "android/app/Notification.smali")
    with open(notif_p, "r", encoding="utf-8") as f:
        ntxt = f.read()
    ntxt = add_fields(
        ntxt,
        [
            '.field public static final blacklist EXTRA_APP_LOCK_ENABLED:Ljava/lang/String; = "android.appLock.enabled"',
            '.field public static final blacklist EXTRA_APP_LOCK_REDACTION:Ljava/lang/String; = "android.appLock.redaction"',
        ],
    )
    with open(notif_p, "w", encoding="utf-8") as f:
        f.write(ntxt)

    # Settings$Secure
    ss_p = find_smali_file(fw_dir, "android/provider/Settings$Secure.smali")
    with open(ss_p, "r", encoding="utf-8") as f:
        stxt = f.read()
    stxt = add_fields(
        stxt,
        [
            '.field public static final blacklist APP_LOCK_SETTINGS_DISCOVERED:Ljava/lang/String; = "app_lock_settings_discovered"',
            ".field public static final blacklist APP_LOCK_SETTINGS_DISCOVERED_STATE_DISCOVERED:I = -0x1",
            ".field public static final blacklist APP_LOCK_SETTINGS_DISCOVERED_STATE_INITIAL:I = 0x0",
            ".field public static final blacklist APP_LOCK_SETTINGS_DISCOVERED_STATE_THRESHOLD:I = 0x2",
        ],
    )
    with open(ss_p, "w", encoding="utf-8") as f:
        f.write(stxt)


def patch_applock_internal(fw_dir):
    p = find_smali_file(fw_dir, "android/app/AppLockInternal.smali")
    with open(p, "r", encoding="utf-8") as f:
        txt = f.read()
    methods = [
        (
            "checkAndAcceptIncomingCall(Ljava/lang/String;ILandroid/content/ComponentName;Landroid/os/IBinder;)Z",
            ".method public abstract blacklist checkAndAcceptIncomingCall(Ljava/lang/String;ILandroid/content/ComponentName;Landroid/os/IBinder;)Z\n.end method",
        ),
        (
            "clearAllCallStatesForPackage(Ljava/lang/String;I)V",
            ".method public abstract blacklist clearAllCallStatesForPackage(Ljava/lang/String;I)V\n.end method",
        ),
        (
            "getAppLockEnabledPackagesForUser(I)Ljava/util/Set;",
            ".method public abstract blacklist getAppLockEnabledPackagesForUser(I)Ljava/util/Set;\n"
            "    .annotation system Ldalvik/annotation/Signature;\n"
            "        value = {\n"
            '            "(I)',
            'Ljava/util/Set<',
            'Ljava/lang/String;',
            '>;',
        ),
    ]
    raw_methods = [
        ".method public abstract blacklist checkAndAcceptIncomingCall(Ljava/lang/String;ILandroid/content/ComponentName;Landroid/os/IBinder;)Z\n.end method",
        ".method public abstract blacklist clearAllCallStatesForPackage(Ljava/lang/String;I)V\n.end method",
        ".method public abstract blacklist getAppLockEnabledPackagesForUser(I)Ljava/util/Set;\n    .annotation system Ldalvik/annotation/Signature;\n        value = {\n            \"(I)\",\n            \"Ljava/util/Set<\",\n            \"Ljava/lang/String;\",\n            \">;\"\n        }\n    .end annotation\n.end method",
        ".method public abstract blacklist handleTaskPinnedStateChanged(Ljava/util/List;IZ)V\n    .annotation system Ldalvik/annotation/Signature;\n        value = {\n            \"(\",\n            \"Ljava/util/List<\",\n            \"Ljava/lang/String;\",\n            \">;IZ)V\"\n        }\n    .end annotation\n.end method",
        ".method public abstract blacklist handleTaskVisibilityChanged(Ljava/util/List;IZ)V\n    .annotation system Ldalvik/annotation/Signature;\n        value = {\n            \"(\",\n            \"Ljava/util/List<\",\n            \"Ljava/lang/String;\",\n            \">;IZ)V\"\n        }\n    .end annotation\n.end method",
        ".method public abstract blacklist hasOngoingCallForPackage(Ljava/lang/String;I)Z\n.end method",
        ".method public abstract blacklist isAppLockSupportedForDevice()Z\n.end method",
        ".method public abstract blacklist isAppLockSupportedForUser(I)Z\n.end method",
        ".method public abstract blacklist isPackageAppLockDynamicallyExempt(Ljava/lang/String;I)Z\n.end method",
        ".method public abstract blacklist matchesAnsweredIncomingCall(Ljava/lang/String;ILandroid/content/ComponentName;)Z\n.end method",
        ".method public abstract blacklist registerPackageLockedStateListener(Landroid/security/applock/IPackageLockedStateListener;)V\n.end method",
        ".method public blacklist setAppLockRecentsDeferredPackages(IILjava/util/List;)V\n    .locals 0\n    return-void\n.end method",
        ".method public blacklist setSpcStateForUser(IZ)Z\n    .locals 0\n    const/4 p0, 0x0\n    return p0\n.end method",
        ".method public blacklist setSpcStateRefreshCallback(Ljava/util/function/IntConsumer;)V\n    .locals 0\n    return-void\n.end method",
        ".method public abstract blacklist unregisterPackageLockedStateListener(Landroid/security/applock/IPackageLockedStateListener;)V\n.end method",
    ]
    for m in raw_methods:
        sig = [ln for ln in m.splitlines() if ln.startswith(".method ")][0].split()[-1]
        if f" {sig}\n" not in txt:
            txt = txt.rstrip() + "\n\n" + m + "\n"
    with open(p, "w", encoding="utf-8") as f:
        f.write(txt)


def patch_task_info(fw_dir):
    p = find_smali_file(fw_dir, "android/app/TaskInfo.smali")
    with open(p, "r", encoding="utf-8") as f:
        txt = f.read()
    txt = add_fields(txt, [".field public blacklist isAppLockActivityOnTop:Z"])
    if "->isAppLockActivityOnTop:Z" in txt and txt.count("->isAppLockActivityOnTop:Z") > 2:
        with open(p, "w", encoding="utf-8") as f:
            f.write(txt)
        return

    # 1. Copy ctor: after isRealActivityAppLockEnabled assignment
    m_ctor = re.search(
        r'(\.method constructor blacklist <init>\(Landroid/app/TaskInfo;\)V.*?\.end method)', txt, re.S
    )
    if m_ctor and "isAppLockActivityOnTop" not in m_ctor.group(1):
        b = m_ctor.group(1)
        b2 = b.replace(
            "iput-boolean v0, p0, Landroid/app/TaskInfo;->isRealActivityAppLockEnabled:Z",
            "iput-boolean v0, p0, Landroid/app/TaskInfo;->isRealActivityAppLockEnabled:Z\n\n"
            "    iget-boolean v0, p1, Landroid/app/TaskInfo;->isAppLockActivityOnTop:Z\n\n"
            "    iput-boolean v0, p0, Landroid/app/TaskInfo;->isAppLockActivityOnTop:Z",
            1,
        )
        txt = txt.replace(b, b2, 1)

    # 2. equalsForTaskOrganizer
    m_eq = re.search(
        r'(\.method public blacklist equalsForTaskOrganizer\(Landroid/app/TaskInfo;\)Z.*?\.end method)', txt, re.S
    )
    if m_eq and "isAppLockActivityOnTop" not in m_eq.group(1):
        b = m_eq.group(1)
        b2 = b.replace(
            "    iget-object v1, p0, Landroid/app/TaskInfo;->lastNonFullscreenBounds:Landroid/graphics/Rect;",
            "    iget-boolean v1, p0, Landroid/app/TaskInfo;->isAppLockActivityOnTop:Z\n\n"
            "    iget-boolean v2, p1, Landroid/app/TaskInfo;->isAppLockActivityOnTop:Z\n\n"
            "    if-ne v1, v2, :cond_10\n\n"
            "    iget-object v1, p0, Landroid/app/TaskInfo;->lastNonFullscreenBounds:Landroid/graphics/Rect;",
            1,
        )
        if b2 == b:
            raise RuntimeError("TaskInfo.equalsForTaskOrganizer anchor not found")
        txt = txt.replace(b, b2, 1)

    # 3. readTaskFromParcel
    m_rd = re.search(r'(\.method blacklist readTaskFromParcel\(Landroid/os/Parcel;\)V.*?\.end method)', txt, re.S)
    if m_rd and "isAppLockActivityOnTop" not in m_rd.group(1):
        b = m_rd.group(1)
        b2 = b.replace(
            "    iput-boolean v0, p0, Landroid/app/TaskInfo;->isRealActivityAppLockEnabled:Z",
            "    iput-boolean v0, p0, Landroid/app/TaskInfo;->isRealActivityAppLockEnabled:Z\n\n"
            "    invoke-virtual {p1}, Landroid/os/Parcel;->readBoolean()Z\n\n"
            "    move-result v0\n\n"
            "    iput-boolean v0, p0, Landroid/app/TaskInfo;->isAppLockActivityOnTop:Z",
            1,
        )
        txt = txt.replace(b, b2, 1)

    # 4. toString
    m_ts = re.search(r'(\.method public whitelist test-api toString\(\)Ljava/lang/String;.*?\.end method)', txt, re.S)
    if m_ts and "isAppLockActivityOnTop" not in m_ts.group(1):
        b = m_ts.group(1)
        b2 = b.replace(
            "    iget-boolean v1, p0, Landroid/app/TaskInfo;->isRealActivityAppLockEnabled:Z\n\n"
            "    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;",
            "    iget-boolean v1, p0, Landroid/app/TaskInfo;->isRealActivityAppLockEnabled:Z\n\n"
            "    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;\n\n"
            '    const-string v1, " isTopActivityLocked = "\n\n'
            "    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;\n\n"
            "    iget-boolean v1, p0, Landroid/app/TaskInfo;->isAppLockActivityOnTop:Z\n\n"
            "    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;",
            1,
        )
        txt = txt.replace(b, b2, 1)

    # 5. writeTaskToParcel
    m_wr = re.search(r'(\.method public blacklist writeTaskToParcel\(Landroid/os/Parcel;I\)V.*?\.end method)', txt, re.S)
    if m_wr and "isAppLockActivityOnTop" not in m_wr.group(1):
        b = m_wr.group(1)
        b2 = b.replace(
            "    iget-boolean v0, p0, Landroid/app/TaskInfo;->isRealActivityAppLockEnabled:Z\n\n"
            "    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBoolean(Z)V",
            "    iget-boolean v0, p0, Landroid/app/TaskInfo;->isRealActivityAppLockEnabled:Z\n\n"
            "    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBoolean(Z)V\n\n"
            "    iget-boolean v0, p0, Landroid/app/TaskInfo;->isAppLockActivityOnTop:Z\n\n"
            "    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeBoolean(Z)V",
            1,
        )
        txt = txt.replace(b, b2, 1)

    with open(p, "w", encoding="utf-8") as f:
        f.write(txt)


def patch_itask_stack_listener(fw_dir):
    # Interface
    p_i = find_smali_file(fw_dir, "android/app/ITaskStackListener.smali")
    with open(p_i, "r", encoding="utf-8") as f:
        t = f.read()
    t = append_methods(
        t,
        [
            (
                "onPackageAppLockStateChanged(ILjava/lang/String;Z)V",
                ".method public abstract blacklist onPackageAppLockStateChanged(ILjava/lang/String;Z)V\n"
                "    .annotation system Ldalvik/annotation/Throws;\n"
                "        value = {\n"
                "            Landroid/os/RemoteException;\n"
                "        }\n"
                "    .end annotation\n"
                ".end method",
            )
        ],
    )
    with open(p_i, "w", encoding="utf-8") as f:
        f.write(t)

    # Default & TaskStackListener
    for rel in ("android/app/ITaskStackListener$Default.smali", "android/app/TaskStackListener.smali"):
        p = find_smali_file(fw_dir, rel)
        with open(p, "r", encoding="utf-8") as f:
            t = f.read()
        t = append_methods(
            t,
            [
                (
                    "onPackageAppLockStateChanged(ILjava/lang/String;Z)V",
                    ".method public blacklist onPackageAppLockStateChanged(ILjava/lang/String;Z)V\n"
                    "    .locals 0\n"
                    "    .annotation system Ldalvik/annotation/Throws;\n"
                    "        value = {\n"
                    "            Landroid/os/RemoteException;\n"
                    "        }\n"
                    "    .end annotation\n\n"
                    "    return-void\n"
                    ".end method",
                )
            ],
        )
        with open(p, "w", encoding="utf-8") as f:
            f.write(t)

    # Stub
    p_s = find_smali_file(fw_dir, "android/app/ITaskStackListener$Stub.smali")
    with open(p_s, "r", encoding="utf-8") as f:
        t = f.read()
    if "TRANSACTION_onPackageAppLockStateChanged" not in t:
        tx = get_stub_max_tx(t) + 1
        t = add_fields(t, [f".field static final blacklist TRANSACTION_onPackageAppLockStateChanged:I = 0x{tx:x}"])
        m_name = re.search(r'(\.method public static blacklist getDefaultTransactionName\(I\)Ljava/lang/String;.*?\.end method)', t, re.S)
        b_name = m_name.group(1)
        ins_name = (
            f"    const/16 v0, 0x{tx:x}\n\n"
            f"    if-ne p0, v0, :cond_applock_tx\n\n"
            f'    const-string/jumbo p0, "onPackageAppLockStateChanged"\n\n'
            f"    return-object p0\n\n"
            f"    :cond_applock_tx"
        )
        b_name2 = insert_before_packed_switch(b_name, "p0", ins_name)
        b_name2 = re.sub(r'\.locals\s+0\b', '.locals 1', b_name2, count=1)
        t = t.replace(b_name, b_name2, 1)

        m_tr = re.search(r'(\.method public whitelist onTransact\(ILandroid/os/Parcel;Landroid/os/Parcel;I\)Z.*?\.end method)', t, re.S)
        b_tr = m_tr.group(1)
        ins_tr = (
            f"    const/16 v1, 0x{tx:x}\n\n"
            f"    if-ne p1, v1, :cond_applock_tr\n\n"
            f"    invoke-virtual {{p2}}, Landroid/os/Parcel;->readInt()I\n\n"
            f"    move-result p1\n\n"
            f"    invoke-virtual {{p2}}, Landroid/os/Parcel;->readString()Ljava/lang/String;\n\n"
            f"    move-result-object p3\n\n"
            f"    invoke-virtual {{p2}}, Landroid/os/Parcel;->readBoolean()Z\n\n"
            f"    move-result p4\n\n"
            f"    invoke-virtual {{p2}}, Landroid/os/Parcel;->enforceNoDataAvail()V\n\n"
            f"    invoke-virtual {{p0, p1, p3, p4}}, Landroid/app/ITaskStackListener$Stub;->onPackageAppLockStateChanged(ILjava/lang/String;Z)V\n\n"
            f"    return v0\n\n"
            f"    :cond_applock_tr"
        )
        b_tr2 = insert_before_packed_switch(b_tr, "p1", ins_tr)
        t = t.replace(b_tr, b_tr2, 1)
        with open(p_s, "w", encoding="utf-8") as f:
            f.write(t)

        # Proxy
        p_px = find_smali_file(fw_dir, "android/app/ITaskStackListener$Stub$Proxy.smali")
        with open(p_px, "r", encoding="utf-8") as f:
            pt = f.read()
        pt = append_methods(
            pt,
            [
                (
                    "onPackageAppLockStateChanged(ILjava/lang/String;Z)V",
                    f".method public blacklist onPackageAppLockStateChanged(ILjava/lang/String;Z)V\n"
                    f"    .locals 2\n"
                    f"    .annotation system Ldalvik/annotation/Throws;\n"
                    f"        value = {{\n"
                    f"            Landroid/os/RemoteException;\n"
                    f"        }}\n"
                    f"    .end annotation\n\n"
                    f"    invoke-virtual {{p0}}, Landroid/app/ITaskStackListener$Stub$Proxy;->asBinder()Landroid/os/IBinder;\n\n"
                    f"    move-result-object v0\n\n"
                    f"    invoke-static {{v0}}, Landroid/os/Parcel;->obtain(Landroid/os/IBinder;)Landroid/os/Parcel;\n\n"
                    f"    move-result-object v0\n\n"
                    f"    :try_start_0\n"
                    f'    const-string/jumbo v1, "android.app.ITaskStackListener"\n\n'
                    f"    invoke-virtual {{v0, v1}}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V\n\n"
                    f"    invoke-virtual {{v0, p1}}, Landroid/os/Parcel;->writeInt(I)V\n\n"
                    f"    invoke-virtual {{v0, p2}}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V\n\n"
                    f"    invoke-virtual {{v0, p3}}, Landroid/os/Parcel;->writeBoolean(Z)V\n\n"
                    f"    iget-object p0, p0, Landroid/app/ITaskStackListener$Stub$Proxy;->mRemote:Landroid/os/IBinder;\n\n"
                    f"    const/4 p1, 0x0\n\n"
                    f"    const/4 p2, 0x1\n\n"
                    f"    const/16 p3, 0x{tx:x}\n\n"
                    f"    invoke-interface {{p0, p3, v0, p1, p2}}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z\n"
                    f"    :try_end_0\n"
                    f"    .catchall {{:try_start_0 .. :try_end_0}} :catchall_0\n\n"
                    f"    invoke-virtual {{v0}}, Landroid/os/Parcel;->recycle()V\n\n"
                    f"    return-void\n\n"
                    f"    :catchall_0\n"
                    f"    move-exception p0\n\n"
                    f"    invoke-virtual {{v0}}, Landroid/os/Parcel;->recycle()V\n\n"
                    f"    throw p0\n"
                    f".end method",
                )
            ],
        )
        with open(p_px, "w", encoding="utf-8") as f:
            f.write(pt)


def patch_iactivity_task_manager(fw_dir):
    p_i = find_smali_file(fw_dir, "android/app/IActivityTaskManager.smali")
    with open(p_i, "r", encoding="utf-8") as f:
        t = f.read()
    t = append_methods(
        t,
        [
            (
                "setAppLockFolderState(IZ)V",
                ".method public abstract blacklist setAppLockFolderState(IZ)V\n"
                "    .annotation system Ldalvik/annotation/Throws;\n"
                "        value = {\n"
                "            Landroid/os/RemoteException;\n"
                "        }\n"
                "    .end annotation\n"
                ".end method",
            )
        ],
    )
    with open(p_i, "w", encoding="utf-8") as f:
        f.write(t)

    p_d = find_smali_file(fw_dir, "android/app/IActivityTaskManager$Default.smali")
    with open(p_d, "r", encoding="utf-8") as f:
        td = f.read()
    td = append_methods(
        td,
        [
            (
                "setAppLockFolderState(IZ)V",
                ".method public blacklist setAppLockFolderState(IZ)V\n"
                "    .locals 0\n"
                "    .annotation system Ldalvik/annotation/Throws;\n"
                "        value = {\n"
                "            Landroid/os/RemoteException;\n"
                "        }\n"
                "    .end annotation\n\n"
                "    return-void\n"
                ".end method",
            )
        ],
    )
    with open(p_d, "w", encoding="utf-8") as f:
        f.write(td)

    p_s = find_smali_file(fw_dir, "android/app/IActivityTaskManager$Stub.smali")
    with open(p_s, "r", encoding="utf-8") as f:
        ts = f.read()
    if "TRANSACTION_setAppLockFolderState" not in ts:
        tx = get_stub_max_tx(ts) + 1
        ts = add_fields(ts, [f".field static final blacklist TRANSACTION_setAppLockFolderState:I = 0x{tx:x}"])
        ts = append_methods(
            ts,
            [
                (
                    "setAppLockFolderState_enforcePermission()V",
                    ".method protected blacklist setAppLockFolderState_enforcePermission()V\n"
                    "    .locals 3\n"
                    "    .annotation system Ldalvik/annotation/Throws;\n"
                    "        value = {\n"
                    "            Ljava/lang/SecurityException;\n"
                    "        }\n"
                    "    .end annotation\n\n"
                    "    iget-object p0, p0, Landroid/app/IActivityTaskManager$Stub;->mEnforcer:Landroid/os/PermissionEnforcer;\n\n"
                    "    invoke-static {}, Landroid/app/IActivityTaskManager$Stub;->getCallingPid()I\n\n"
                    "    move-result v0\n\n"
                    "    invoke-static {}, Landroid/app/IActivityTaskManager$Stub;->getCallingUid()I\n\n"
                    "    move-result v1\n\n"
                    '    const-string/jumbo v2, "android.permission.LOCK_APPS"\n\n'
                    "    invoke-virtual {p0, v2, v0, v1}, Landroid/os/PermissionEnforcer;->enforcePermission(Ljava/lang/String;II)V\n\n"
                    "    return-void\n"
                    ".end method",
                )
            ],
        )
        m_name = re.search(r'(\.method public static blacklist getDefaultTransactionName\(I\)Ljava/lang/String;.*?\.end method)', ts, re.S)
        bn = m_name.group(1)
        ins_n = (
            f"    const/16 v0, 0x{tx:x}\n\n"
            f"    if-ne p0, v0, :cond_applock_tx\n\n"
            f'    const-string/jumbo p0, "setAppLockFolderState"\n\n'
            f"    return-object p0\n\n"
            f"    :cond_applock_tx"
        )
        bn2 = insert_before_packed_switch(bn, "p0", ins_n)
        bn2 = re.sub(r'\.locals\s+0\b', '.locals 1', bn2, count=1)
        ts = ts.replace(bn, bn2, 1)

        m_tr = re.search(r'(\.method public whitelist onTransact\(ILandroid/os/Parcel;Landroid/os/Parcel;I\)Z.*?\.end method)', ts, re.S)
        bt = m_tr.group(1)
        # In M51 IActivityTaskManager$Stub.onTransact: v0=p0, v1=p1(code), v2=p2(data), v13=p3, v14=1
        ins_t = (
            f"    const/16 v3, 0x{tx:x}\n\n"
            f"    if-ne v1, v3, :cond_applock_tr\n\n"
            f"    invoke-virtual {{v2}}, Landroid/os/Parcel;->readInt()I\n\n"
            f"    move-result v3\n\n"
            f"    invoke-virtual {{v2}}, Landroid/os/Parcel;->readBoolean()Z\n\n"
            f"    move-result v4\n\n"
            f"    invoke-virtual {{v2}}, Landroid/os/Parcel;->enforceNoDataAvail()V\n\n"
            f"    invoke-virtual {{v0, v3, v4}}, Landroid/app/IActivityTaskManager$Stub;->setAppLockFolderState(IZ)V\n\n"
            f"    return v14\n\n"
            f"    :cond_applock_tr"
        )
        bt2 = insert_before_packed_switch(bt, "v1", ins_t)
        ts = ts.replace(bt, bt2, 1)
        with open(p_s, "w", encoding="utf-8") as f:
            f.write(ts)

        p_px = find_smali_file(fw_dir, "android/app/IActivityTaskManager$Stub$Proxy.smali")
        with open(p_px, "r", encoding="utf-8") as f:
            px = f.read()
        px = append_methods(
            px,
            [
                (
                    "setAppLockFolderState(IZ)V",
                    f".method public blacklist setAppLockFolderState(IZ)V\n"
                    f"    .locals 2\n"
                    f"    .annotation system Ldalvik/annotation/Throws;\n"
                    f"        value = {{\n"
                    f"            Landroid/os/RemoteException;\n"
                    f"        }}\n"
                    f"    .end annotation\n\n"
                    f"    invoke-virtual {{p0}}, Landroid/app/IActivityTaskManager$Stub$Proxy;->asBinder()Landroid/os/IBinder;\n\n"
                    f"    move-result-object v0\n\n"
                    f"    invoke-static {{v0}}, Landroid/os/Parcel;->obtain(Landroid/os/IBinder;)Landroid/os/Parcel;\n\n"
                    f"    move-result-object v0\n\n"
                    f"    :try_start_0\n"
                    f'    const-string/jumbo v1, "android.app.IActivityTaskManager"\n\n'
                    f"    invoke-virtual {{v0, v1}}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V\n\n"
                    f"    invoke-virtual {{v0, p1}}, Landroid/os/Parcel;->writeInt(I)V\n\n"
                    f"    invoke-virtual {{v0, p2}}, Landroid/os/Parcel;->writeBoolean(Z)V\n\n"
                    f"    iget-object p0, p0, Landroid/app/IActivityTaskManager$Stub$Proxy;->mRemote:Landroid/os/IBinder;\n\n"
                    f"    const/4 p1, 0x0\n\n"
                    f"    const/4 p2, 0x1\n\n"
                    f"    const/16 v1, 0x{tx:x}\n\n"
                    f"    invoke-interface {{p0, v1, v0, p1, p2}}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z\n"
                    f"    :try_end_0\n"
                    f"    .catchall {{:try_start_0 .. :try_end_0}} :catchall_0\n\n"
                    f"    invoke-virtual {{v0}}, Landroid/os/Parcel;->recycle()V\n\n"
                    f"    return-void\n\n"
                    f"    :catchall_0\n"
                    f"    move-exception p0\n\n"
                    f"    invoke-virtual {{v0}}, Landroid/os/Parcel;->recycle()V\n\n"
                    f"    throw p0\n"
                    f".end method",
                )
            ],
        )
        with open(p_px, "w", encoding="utf-8") as f:
            f.write(px)


def patch_ivold(fw_dir):
    p_i = find_smali_file(fw_dir, "android/os/IVold.smali")
    with open(p_i, "r", encoding="utf-8") as f:
        ti = f.read()
    ti = append_methods(
        ti,
        [
            (
                "autoLockKeepStorageAppLock([Ljava/lang/String;I)I",
                ".method public abstract blacklist autoLockKeepStorageAppLock([Ljava/lang/String;I)I\n"
                "    .annotation system Ldalvik/annotation/Throws;\n"
                "        value = {\n"
                "            Landroid/os/RemoteException;\n"
                "        }\n"
                "    .end annotation\n"
                ".end method",
            )
        ],
    )
    with open(p_i, "w", encoding="utf-8") as f:
        f.write(ti)

    p_d = find_smali_file(fw_dir, "android/os/IVold$Default.smali")
    with open(p_d, "r", encoding="utf-8") as f:
        td = f.read()
    td = append_methods(
        td,
        [
            (
                "autoLockKeepStorageAppLock([Ljava/lang/String;I)I",
                ".method public blacklist autoLockKeepStorageAppLock([Ljava/lang/String;I)I\n"
                "    .locals 0\n"
                "    .annotation system Ldalvik/annotation/Throws;\n"
                "        value = {\n"
                "            Landroid/os/RemoteException;\n"
                "        }\n"
                "    .end annotation\n\n"
                "    const/4 p0, 0x0\n\n"
                "    return p0\n"
                ".end method",
            )
        ],
    )
    with open(p_d, "w", encoding="utf-8") as f:
        f.write(td)

    p_px = find_smali_file(fw_dir, "android/os/IVold$Stub$Proxy.smali")
    with open(p_px, "r", encoding="utf-8") as f:
        px = f.read()
    # Native S911B vold binary doesn't implement KeepStorage AppLock ioctl; return 0 cleanly
    px = append_methods(
        px,
        [
            (
                "autoLockKeepStorageAppLock([Ljava/lang/String;I)I",
                ".method public blacklist autoLockKeepStorageAppLock([Ljava/lang/String;I)I\n"
                "    .locals 0\n"
                "    .annotation system Ldalvik/annotation/Throws;\n"
                "        value = {\n"
                "            Landroid/os/RemoteException;\n"
                "        }\n"
                "    .end annotation\n\n"
                "    const/4 p0, 0x0\n\n"
                "    return p0\n"
                ".end method",
            )
        ],
    )
    with open(p_px, "w", encoding="utf-8") as f:
        f.write(px)


def patch_package_managers(fw_dir):
    # 1. PackageManager.smali
    p_pm = find_smali_file(fw_dir, "android/content/pm/PackageManager.smali")
    with open(p_pm, "r", encoding="utf-8") as f:
        pm = f.read()
    pm = add_fields(
        pm,
        [
            '.field public static final blacklist ACTION_APP_LOCK_RESULT:Ljava/lang/String; = "android.content.pm.action.APP_LOCK_RESULT"',
            ".field public static final blacklist APP_LOCK_FOLDER_FLOW_ITEMS_ADDED:I = 0x1",
            ".field public static final blacklist APP_LOCK_FOLDER_FLOW_LOCK:I = 0x0",
            ".field public static final blacklist APP_LOCK_RESULT_AUTH_CANCELED:I = 0x4",
            ".field public static final blacklist APP_LOCK_RESULT_FAILURE:I = 0x3",
            ".field public static final blacklist APP_LOCK_RESULT_SUCCESS:I = 0x0",
            '.field public static final blacklist EXTRA_APP_LOCK_CHANGED_PACKAGES:Ljava/lang/String; = "android.content.pm.extra.APP_LOCK_CHANGED_PACKAGES"',
            '.field public static final blacklist EXTRA_APP_LOCK_FAILED_PACKAGES:Ljava/lang/String; = "android.content.pm.extra.APP_LOCK_FAILED_PACKAGES"',
            '.field public static final blacklist EXTRA_APP_LOCK_FOLDER_FLOW:Ljava/lang/String; = "android.content.pm.extra.APP_LOCK_FOLDER_FLOW"',
            '.field public static final blacklist EXTRA_APP_LOCK_FOLDER_ID:Ljava/lang/String; = "android.content.pm.extra.APP_LOCK_FOLDER_ID"',
            '.field public static final blacklist EXTRA_APP_LOCK_RESULT_CODE:Ljava/lang/String; = "android.content.pm.extra.APP_LOCK_RESULT_CODE"',
            '.field public static final blacklist EXTRA_APP_LOCK_SUCCESS:Ljava/lang/String; = "android.content.pm.extra.APP_LOCK_SUCCESS"',
            ".field public static final whitelist GET_APP_LOCK_INFO:J = 0x800000000L",
            ".field public static final blacklist INVALID_APP_LOCK_FOLDER_ID:I = -0x1",
            '.field public static final blacklist PROPERTY_APP_LOCK_PARENT_PACKAGE:Ljava/lang/String; = "com.samsung.android.applock.PARENT_PACKAGE"',
        ],
    )
    pm = append_methods(
        pm,
        [
            (
                "getAppLockBackupTokens()Landroid/os/Bundle;",
                ".method public blacklist getAppLockBackupTokens()Landroid/os/Bundle;\n    .locals 1\n    new-instance p0, Ljava/lang/UnsupportedOperationException;\n    const-string/jumbo v0, \"getAppLockBackupTokens has not been implemented\"\n    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V\n    throw p0\n.end method",
            ),
            (
                "getEnableAppLockIntentForFolderItems([Ljava/lang/String;[I)Landroid/app/PendingIntent;",
                ".method public blacklist getEnableAppLockIntentForFolderItems([Ljava/lang/String;[I)Landroid/app/PendingIntent;\n    .locals 0\n    new-instance p0, Ljava/lang/UnsupportedOperationException;\n    const-string/jumbo p1, \"getEnableAppLockIntentForFolderItems has not been implemented\"\n    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V\n    throw p0\n.end method",
            ),
            (
                "getEnableAppLockIntentForPackage(Ljava/lang/String;ZI)Landroid/app/PendingIntent;",
                ".method public blacklist getEnableAppLockIntentForPackage(Ljava/lang/String;ZI)Landroid/app/PendingIntent;\n    .locals 0\n    new-instance p0, Ljava/lang/UnsupportedOperationException;\n    const-string/jumbo p1, \"getEnableAppLockIntentForPackage has not been implemented\"\n    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V\n    throw p0\n.end method",
            ),
            (
                "getEnableAppLockIntentForPackages(ILandroid/graphics/Bitmap;Ljava/lang/String;[Ljava/lang/String;[IZ)Landroid/app/PendingIntent;",
                ".method public blacklist getEnableAppLockIntentForPackages(ILandroid/graphics/Bitmap;Ljava/lang/String;[Ljava/lang/String;[IZ)Landroid/app/PendingIntent;\n    .locals 0\n    new-instance p0, Ljava/lang/UnsupportedOperationException;\n    const-string/jumbo p1, \"getEnableAppLockIntentForPackages has not been implemented\"\n    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V\n    throw p0\n.end method",
            ),
            (
                "restoreAppLockTokens(Landroid/os/Bundle;)V",
                ".method public blacklist restoreAppLockTokens(Landroid/os/Bundle;)V\n    .locals 0\n    new-instance p0, Ljava/lang/UnsupportedOperationException;\n    const-string/jumbo p1, \"restoreAppLockTokens has not been implemented\"\n    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V\n    throw p0\n.end method",
            ),
            (
                "setPackageAppLockEnabledAsUser(Ljava/lang/String;ZI)Z",
                ".method public blacklist setPackageAppLockEnabledAsUser(Ljava/lang/String;ZI)Z\n    .locals 0\n    new-instance p0, Ljava/lang/UnsupportedOperationException;\n    const-string/jumbo p1, \"setPackageAppLockEnabledAsUser has not been implemented\"\n    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V\n    throw p0\n.end method",
            ),
        ],
    )
    with open(p_pm, "w", encoding="utf-8") as f:
        f.write(pm)

    # 2. ApplicationPackageManager.smali
    p_apm = find_smali_file(fw_dir, "android/app/ApplicationPackageManager.smali")
    with open(p_apm, "r", encoding="utf-8") as f:
        apm = f.read()
    apm = append_methods(
        apm,
        [
            (
                "getEnableAppLockIntentForPackage(Ljava/lang/String;ZI)Landroid/app/PendingIntent;",
                ".method public blacklist getEnableAppLockIntentForPackage(Ljava/lang/String;ZI)Landroid/app/PendingIntent;\n"
                "    .locals 0\n\n"
                "    :try_start_0\n"
                "    iget-object p0, p0, Landroid/app/ApplicationPackageManager;->mPM:Landroid/content/pm/IPackageManager;\n\n"
                "    invoke-interface {p0, p1, p2, p3}, Landroid/content/pm/IPackageManager;->getEnableAppLockIntentForPackageAsUser(Ljava/lang/String;ZI)Landroid/app/PendingIntent;\n\n"
                "    move-result-object p0\n"
                "    :try_end_0\n"
                "    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0\n\n"
                "    return-object p0\n\n"
                "    :catch_0\n"
                "    move-exception p0\n\n"
                "    invoke-virtual {p0}, Landroid/os/RemoteException;->rethrowFromSystemServer()Ljava/lang/RuntimeException;\n\n"
                "    move-result-object p0\n\n"
                "    throw p0\n"
                ".end method",
            ),
            (
                "getEnableAppLockIntentForPackages(ILandroid/graphics/Bitmap;Ljava/lang/String;[Ljava/lang/String;[IZ)Landroid/app/PendingIntent;",
                ".method public blacklist getEnableAppLockIntentForPackages(ILandroid/graphics/Bitmap;Ljava/lang/String;[Ljava/lang/String;[IZ)Landroid/app/PendingIntent;\n"
                "    .locals 1\n\n"
                "    :try_start_0\n"
                "    iget-object p0, p0, Landroid/app/ApplicationPackageManager;->mPM:Landroid/content/pm/IPackageManager;\n\n"
                "    invoke-interface/range {p0 .. p6}, Landroid/content/pm/IPackageManager;->getEnableAppLockIntentForPackagesAsUsers(ILandroid/graphics/Bitmap;Ljava/lang/String;[Ljava/lang/String;[IZ)Landroid/app/PendingIntent;\n\n"
                "    move-result-object p0\n"
                "    :try_end_0\n"
                "    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0\n\n"
                "    return-object p0\n\n"
                "    :catch_0\n"
                "    move-exception v0\n\n"
                "    move-object p0, v0\n\n"
                "    invoke-virtual {p0}, Landroid/os/RemoteException;->rethrowFromSystemServer()Ljava/lang/RuntimeException;\n\n"
                "    move-result-object p0\n\n"
                "    throw p0\n"
                ".end method",
            ),
            (
                "getEnableAppLockIntentForFolderItems([Ljava/lang/String;[I)Landroid/app/PendingIntent;",
                ".method public blacklist getEnableAppLockIntentForFolderItems([Ljava/lang/String;[I)Landroid/app/PendingIntent;\n"
                "    .locals 0\n\n"
                "    :try_start_0\n"
                "    iget-object p0, p0, Landroid/app/ApplicationPackageManager;->mPM:Landroid/content/pm/IPackageManager;\n\n"
                "    invoke-interface {p0, p1, p2}, Landroid/content/pm/IPackageManager;->getEnableAppLockIntentForFolderItemsAsUsers([Ljava/lang/String;[I)Landroid/app/PendingIntent;\n\n"
                "    move-result-object p0\n"
                "    :try_end_0\n"
                "    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0\n\n"
                "    return-object p0\n\n"
                "    :catch_0\n"
                "    move-exception p0\n\n"
                "    invoke-virtual {p0}, Landroid/os/RemoteException;->rethrowFromSystemServer()Ljava/lang/RuntimeException;\n\n"
                "    move-result-object p0\n\n"
                "    throw p0\n"
                ".end method",
            ),
            (
                "setPackageAppLockEnabledAsUser(Ljava/lang/String;ZI)Z",
                ".method public blacklist setPackageAppLockEnabledAsUser(Ljava/lang/String;ZI)Z\n"
                "    .locals 0\n\n"
                "    :try_start_0\n"
                "    iget-object p0, p0, Landroid/app/ApplicationPackageManager;->mPM:Landroid/content/pm/IPackageManager;\n\n"
                "    invoke-interface {p0, p1, p3, p2}, Landroid/content/pm/IPackageManager;->setPackageAppLockEnabled(Ljava/lang/String;IZ)Z\n\n"
                "    move-result p0\n"
                "    :try_end_0\n"
                "    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0\n\n"
                "    return p0\n\n"
                "    :catch_0\n"
                "    move-exception p0\n\n"
                "    invoke-virtual {p0}, Landroid/os/RemoteException;->rethrowFromSystemServer()Ljava/lang/RuntimeException;\n\n"
                "    move-result-object p0\n\n"
                "    throw p0\n"
                ".end method",
            ),
            (
                "getAppLockBackupTokens()Landroid/os/Bundle;",
                ".method public blacklist getAppLockBackupTokens()Landroid/os/Bundle;\n"
                "    .locals 3\n\n"
                "    :try_start_0\n"
                "    iget-object v0, p0, Landroid/app/ApplicationPackageManager;->mPM:Landroid/content/pm/IPackageManager;\n\n"
                "    iget-object v1, p0, Landroid/app/ApplicationPackageManager;->mContext:Landroid/app/ContextImpl;\n\n"
                "    invoke-virtual {v1}, Landroid/app/ContextImpl;->getPackageName()Ljava/lang/String;\n\n"
                "    move-result-object v1\n\n"
                "    invoke-virtual {p0}, Landroid/app/ApplicationPackageManager;->getUserId()I\n\n"
                "    move-result p0\n\n"
                "    invoke-interface {v0, v1, p0}, Landroid/content/pm/IPackageManager;->getAppLockBackupTokens(Ljava/lang/String;I)Landroid/os/Bundle;\n\n"
                "    move-result-object p0\n"
                "    :try_end_0\n"
                "    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0\n\n"
                "    return-object p0\n\n"
                "    :catch_0\n"
                "    move-exception p0\n\n"
                "    invoke-virtual {p0}, Landroid/os/RemoteException;->rethrowFromSystemServer()Ljava/lang/RuntimeException;\n\n"
                "    move-result-object p0\n\n"
                "    throw p0\n"
                ".end method",
            ),
            (
                "restoreAppLockTokens(Landroid/os/Bundle;)V",
                ".method public blacklist restoreAppLockTokens(Landroid/os/Bundle;)V\n"
                "    .locals 2\n\n"
                "    :try_start_0\n"
                "    iget-object v0, p0, Landroid/app/ApplicationPackageManager;->mPM:Landroid/content/pm/IPackageManager;\n\n"
                "    iget-object v1, p0, Landroid/app/ApplicationPackageManager;->mContext:Landroid/app/ContextImpl;\n\n"
                "    invoke-virtual {v1}, Landroid/app/ContextImpl;->getPackageName()Ljava/lang/String;\n\n"
                "    move-result-object v1\n\n"
                "    invoke-virtual {p0}, Landroid/app/ApplicationPackageManager;->getUserId()I\n\n"
                "    move-result p0\n\n"
                "    invoke-interface {v0, v1, p1, p0}, Landroid/content/pm/IPackageManager;->restoreAppLockTokens(Ljava/lang/String;Landroid/os/Bundle;I)V\n"
                "    :try_end_0\n"
                "    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0\n\n"
                "    return-void\n\n"
                "    :catch_0\n"
                "    move-exception p0\n\n"
                "    invoke-virtual {p0}, Landroid/os/RemoteException;->rethrowFromSystemServer()Ljava/lang/RuntimeException;\n\n"
                "    move-result-object p0\n\n"
                "    throw p0\n"
                ".end method",
            ),
        ],
    )
    with open(p_apm, "w", encoding="utf-8") as f:
        f.write(apm)

    # 3. IPackageManager + $Default + $Stub + $Stub$Proxy
    new_pm_methods = [
        ("getEnableAppLockIntentForPackageAsUser(Ljava/lang/String;ZI)Landroid/app/PendingIntent;", "0", "return-object p0"),
        ("getEnableAppLockIntentForPackagesAsUsers(ILandroid/graphics/Bitmap;Ljava/lang/String;[Ljava/lang/String;[IZ)Landroid/app/PendingIntent;", "0", "return-object p0"),
        ("getEnableAppLockIntentForFolderItemsAsUsers([Ljava/lang/String;[I)Landroid/app/PendingIntent;", "0", "return-object p0"),
        ("setPackagesAppLockEnabledAsUsers([Ljava/lang/String;[IZ)Landroid/os/Bundle;", "0", "return-object p0"),
        ("getAppLockBackupTokens(Ljava/lang/String;I)Landroid/os/Bundle;", "0", "return-object p0"),
        ("restoreAppLockTokens(Ljava/lang/String;Landroid/os/Bundle;I)V", None, "return-void"),
    ]

    p_i = find_smali_file(fw_dir, "android/content/pm/IPackageManager.smali")
    with open(p_i, "r", encoding="utf-8") as f:
        ti = f.read()
    ti = append_methods(
        ti,
        [
            (
                sig,
                f".method public abstract blacklist {sig}\n"
                f"    .annotation system Ldalvik/annotation/Throws;\n"
                f"        value = {{\n            Landroid/os/RemoteException;\n        }}\n"
                f"    .end annotation\n"
                f".end method",
            )
            for sig, _, _ in new_pm_methods
        ],
    )
    with open(p_i, "w", encoding="utf-8") as f:
        f.write(ti)

    p_d = find_smali_file(fw_dir, "android/content/pm/IPackageManager$Default.smali")
    with open(p_d, "r", encoding="utf-8") as f:
        td = f.read()
    td = append_methods(
        td,
        [
            (
                sig,
                f".method public blacklist {sig}\n"
                f"    .locals 0\n"
                f"    .annotation system Ldalvik/annotation/Throws;\n"
                f"        value = {{\n            Landroid/os/RemoteException;\n        }}\n"
                f"    .end annotation\n\n"
                + ("    const/4 p0, 0x0\n\n" if dflt is not None else "")
                + f"    {ret}\n"
                f".end method",
            )
            for sig, dflt, ret in new_pm_methods
        ],
    )
    with open(p_d, "w", encoding="utf-8") as f:
        f.write(td)

    p_s = find_smali_file(fw_dir, "android/content/pm/IPackageManager$Stub.smali")
    with open(p_s, "r", encoding="utf-8") as f:
        ts = f.read()
    if "TRANSACTION_getEnableAppLockIntentForPackageAsUser" not in ts:
        base_tx = get_stub_max_tx(ts)
        tx_map = {
            "getEnableAppLockIntentForPackageAsUser": base_tx + 1,
            "getEnableAppLockIntentForPackagesAsUsers": base_tx + 2,
            "getEnableAppLockIntentForFolderItemsAsUsers": base_tx + 3,
            "setPackagesAppLockEnabledAsUsers": base_tx + 4,
            "getAppLockBackupTokens": base_tx + 5,
            "restoreAppLockTokens": base_tx + 6,
        }
        ts = add_fields(
            ts,
            [f".field static final blacklist TRANSACTION_{k}:I = 0x{v:x}" for k, v in tx_map.items()],
        )

        # EnforcePermission helpers needed by PackageManagerService
        ts = append_methods(
            ts,
            [
                (
                    f"{fn}_enforcePermission()V",
                    f".method protected blacklist {fn}_enforcePermission()V\n"
                    f"    .locals 3\n"
                    f"    .annotation system Ldalvik/annotation/Throws;\n"
                    f"        value = {{\n            Ljava/lang/SecurityException;\n        }}\n"
                    f"    .end annotation\n\n"
                    f"    iget-object p0, p0, Landroid/content/pm/IPackageManager$Stub;->mEnforcer:Landroid/os/PermissionEnforcer;\n\n"
                    f"    invoke-static {{}}, Landroid/content/pm/IPackageManager$Stub;->getCallingPid()I\n\n"
                    f"    move-result v0\n\n"
                    f"    invoke-static {{}}, Landroid/content/pm/IPackageManager$Stub;->getCallingUid()I\n\n"
                    f"    move-result v1\n\n"
                    f'    const-string/jumbo v2, "android.permission.MANAGE_APP_LOCK"\n\n'
                    f"    invoke-virtual {{p0, v2, v0, v1}}, Landroid/os/PermissionEnforcer;->enforcePermission(Ljava/lang/String;II)V\n\n"
                    f"    return-void\n"
                    f".end method",
                )
                for fn in (
                    "getEnableAppLockIntentForPackageAsUser",
                    "getEnableAppLockIntentForPackagesAsUsers",
                    "getEnableAppLockIntentForFolderItemsAsUsers",
                )
            ],
        )

        # getDefaultTransactionName
        m_name = re.search(r'(\.method public static blacklist getDefaultTransactionName\(I\)Ljava/lang/String;.*?\.end method)', ts, re.S)
        bn = m_name.group(1)
        name_checks = []
        for idx, (fn, code) in enumerate(tx_map.items()):
            lbl = f":cond_pm_tx_{idx}"
            name_checks.append(
                f"    const/16 v0, 0x{code:x}\n\n"
                f"    if-ne p0, v0, {lbl}\n\n"
                f'    const-string/jumbo p0, "{fn}"\n\n'
                f"    return-object p0\n\n"
                f"    {lbl}"
            )
        bn2 = insert_before_packed_switch(bn, "p0", "\n\n".join(name_checks))
        bn2 = re.sub(r'\.locals\s+0\b', '.locals 1', bn2, count=1)
        ts = ts.replace(bn, bn2, 1)

        # onTransact (M51 has p0=this, p1=code, p2=data, p3=reply, v11=1, v0..v6 free)
        m_tr = re.search(r'(\.method public whitelist onTransact\(ILandroid/os/Parcel;Landroid/os/Parcel;I\)Z.*?\.end method)', ts, re.S)
        bt = m_tr.group(1)
        tr_checks = f"""    const/16 v0, 0x{tx_map["getEnableAppLockIntentForPackageAsUser"]:x}

    if-ne p1, v0, :cond_pm_al_1

    invoke-virtual {{p2}}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {{p2}}, Landroid/os/Parcel;->readBoolean()Z

    move-result v2

    invoke-virtual {{p2}}, Landroid/os/Parcel;->readInt()I

    move-result v3

    invoke-virtual {{p2}}, Landroid/os/Parcel;->enforceNoDataAvail()V

    invoke-virtual {{p0, v1, v2, v3}}, Landroid/content/pm/IPackageManager$Stub;->getEnableAppLockIntentForPackageAsUser(Ljava/lang/String;ZI)Landroid/app/PendingIntent;

    move-result-object v0

    invoke-virtual {{p3}}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {{p3, v0, v11}}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    return v11

    :cond_pm_al_1
    const/16 v0, 0x{tx_map["getEnableAppLockIntentForPackagesAsUsers"]:x}

    if-ne p1, v0, :cond_pm_al_2

    invoke-virtual {{p2}}, Landroid/os/Parcel;->readInt()I

    move-result v1

    sget-object v2, Landroid/graphics/Bitmap;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {{p2, v2}}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/graphics/Bitmap;

    invoke-virtual {{p2}}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {{p2}}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object v4

    invoke-virtual {{p2}}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v5

    invoke-virtual {{p2}}, Landroid/os/Parcel;->readBoolean()Z

    move-result v6

    invoke-virtual {{p2}}, Landroid/os/Parcel;->enforceNoDataAvail()V

    move-object v0, p0

    invoke-virtual/range {{v0 .. v6}}, Landroid/content/pm/IPackageManager$Stub;->getEnableAppLockIntentForPackagesAsUsers(ILandroid/graphics/Bitmap;Ljava/lang/String;[Ljava/lang/String;[IZ)Landroid/app/PendingIntent;

    move-result-object v0

    invoke-virtual {{p3}}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {{p3, v0, v11}}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    return v11

    :cond_pm_al_2
    const/16 v0, 0x{tx_map["getEnableAppLockIntentForFolderItemsAsUsers"]:x}

    if-ne p1, v0, :cond_pm_al_3

    invoke-virtual {{p2}}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {{p2}}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v2

    invoke-virtual {{p2}}, Landroid/os/Parcel;->enforceNoDataAvail()V

    invoke-virtual {{p0, v1, v2}}, Landroid/content/pm/IPackageManager$Stub;->getEnableAppLockIntentForFolderItemsAsUsers([Ljava/lang/String;[I)Landroid/app/PendingIntent;

    move-result-object v0

    invoke-virtual {{p3}}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {{p3, v0, v11}}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    return v11

    :cond_pm_al_3
    const/16 v0, 0x{tx_map["setPackagesAppLockEnabledAsUsers"]:x}

    if-ne p1, v0, :cond_pm_al_4

    invoke-virtual {{p2}}, Landroid/os/Parcel;->createStringArray()[Ljava/lang/String;

    move-result-object v1

    invoke-virtual {{p2}}, Landroid/os/Parcel;->createIntArray()[I

    move-result-object v2

    invoke-virtual {{p2}}, Landroid/os/Parcel;->readBoolean()Z

    move-result v3

    invoke-virtual {{p2}}, Landroid/os/Parcel;->enforceNoDataAvail()V

    invoke-virtual {{p0, v1, v2, v3}}, Landroid/content/pm/IPackageManager$Stub;->setPackagesAppLockEnabledAsUsers([Ljava/lang/String;[IZ)Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {{p3}}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {{p3, v0, v11}}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    return v11

    :cond_pm_al_4
    const/16 v0, 0x{tx_map["getAppLockBackupTokens"]:x}

    if-ne p1, v0, :cond_pm_al_5

    invoke-virtual {{p2}}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {{p2}}, Landroid/os/Parcel;->readInt()I

    move-result v2

    invoke-virtual {{p2}}, Landroid/os/Parcel;->enforceNoDataAvail()V

    invoke-virtual {{p0, v1, v2}}, Landroid/content/pm/IPackageManager$Stub;->getAppLockBackupTokens(Ljava/lang/String;I)Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {{p3}}, Landroid/os/Parcel;->writeNoException()V

    invoke-virtual {{p3, v0, v11}}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    return v11

    :cond_pm_al_5
    const/16 v0, 0x{tx_map["restoreAppLockTokens"]:x}

    if-ne p1, v0, :cond_pm_al_6

    invoke-virtual {{p2}}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {{p2, v2}}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/os/Bundle;

    invoke-virtual {{p2}}, Landroid/os/Parcel;->readInt()I

    move-result v3

    invoke-virtual {{p2}}, Landroid/os/Parcel;->enforceNoDataAvail()V

    invoke-virtual {{p0, v1, v2, v3}}, Landroid/content/pm/IPackageManager$Stub;->restoreAppLockTokens(Ljava/lang/String;Landroid/os/Bundle;I)V

    invoke-virtual {{p3}}, Landroid/os/Parcel;->writeNoException()V

    return v11

    :cond_pm_al_6"""
        bt2 = insert_before_packed_switch(bt, "p1", tr_checks)
        ts = ts.replace(bt, bt2, 1)
        with open(p_s, "w", encoding="utf-8") as f:
            f.write(ts)

        p_px = find_smali_file(fw_dir, "android/content/pm/IPackageManager$Stub$Proxy.smali")
        with open(p_px, "r", encoding="utf-8") as f:
            px = f.read()
        px_methods = [
            (
                "getEnableAppLockIntentForPackageAsUser(Ljava/lang/String;ZI)Landroid/app/PendingIntent;",
                f""".method public blacklist getEnableAppLockIntentForPackageAsUser(Ljava/lang/String;ZI)Landroid/app/PendingIntent;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {{
            Landroid/os/RemoteException;
        }}
    .end annotation

    invoke-virtual {{p0}}, Landroid/content/pm/IPackageManager$Stub$Proxy;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-static {{v0}}, Landroid/os/Parcel;->obtain(Landroid/os/IBinder;)Landroid/os/Parcel;

    move-result-object v0

    invoke-static {{}}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    :try_start_0
    const-string/jumbo v2, "android.content.pm.IPackageManager"

    invoke-virtual {{v0, v2}}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    invoke-virtual {{v0, p1}}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    invoke-virtual {{v0, p2}}, Landroid/os/Parcel;->writeBoolean(Z)V

    invoke-virtual {{v0, p3}}, Landroid/os/Parcel;->writeInt(I)V

    iget-object p0, p0, Landroid/content/pm/IPackageManager$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 p1, 0x{tx_map["getEnableAppLockIntentForPackageAsUser"]:x}

    const/4 p2, 0x0

    invoke-interface {{p0, p1, v0, v1, p2}}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    invoke-virtual {{v1}}, Landroid/os/Parcel;->readException()V

    sget-object p0, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {{v1, p0}}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/PendingIntent;
    :try_end_0
    .catchall {{:try_start_0 .. :try_end_0}} :catchall_0

    invoke-virtual {{v1}}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {{v0}}, Landroid/os/Parcel;->recycle()V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-virtual {{v1}}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {{v0}}, Landroid/os/Parcel;->recycle()V

    throw p0
.end method""",
            ),
            (
                "getEnableAppLockIntentForPackagesAsUsers(ILandroid/graphics/Bitmap;Ljava/lang/String;[Ljava/lang/String;[IZ)Landroid/app/PendingIntent;",
                f""".method public blacklist getEnableAppLockIntentForPackagesAsUsers(ILandroid/graphics/Bitmap;Ljava/lang/String;[Ljava/lang/String;[IZ)Landroid/app/PendingIntent;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {{
            Landroid/os/RemoteException;
        }}
    .end annotation

    invoke-virtual {{p0}}, Landroid/content/pm/IPackageManager$Stub$Proxy;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-static {{v0}}, Landroid/os/Parcel;->obtain(Landroid/os/IBinder;)Landroid/os/Parcel;

    move-result-object v0

    invoke-static {{}}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    :try_start_0
    const-string/jumbo v2, "android.content.pm.IPackageManager"

    invoke-virtual {{v0, v2}}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    invoke-virtual {{v0, p1}}, Landroid/os/Parcel;->writeInt(I)V

    const/4 p1, 0x0

    invoke-virtual {{v0, p2, p1}}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    invoke-virtual {{v0, p3}}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    invoke-virtual {{v0, p4}}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    invoke-virtual {{v0, p5}}, Landroid/os/Parcel;->writeIntArray([I)V

    invoke-virtual {{v0, p6}}, Landroid/os/Parcel;->writeBoolean(Z)V

    iget-object p0, p0, Landroid/content/pm/IPackageManager$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 p2, 0x{tx_map["getEnableAppLockIntentForPackagesAsUsers"]:x}

    invoke-interface {{p0, p2, v0, v1, p1}}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    invoke-virtual {{v1}}, Landroid/os/Parcel;->readException()V

    sget-object p0, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {{v1, p0}}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/PendingIntent;
    :try_end_0
    .catchall {{:try_start_0 .. :try_end_0}} :catchall_0

    invoke-virtual {{v1}}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {{v0}}, Landroid/os/Parcel;->recycle()V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-virtual {{v1}}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {{v0}}, Landroid/os/Parcel;->recycle()V

    throw p0
.end method""",
            ),
            (
                "getEnableAppLockIntentForFolderItemsAsUsers([Ljava/lang/String;[I)Landroid/app/PendingIntent;",
                f""".method public blacklist getEnableAppLockIntentForFolderItemsAsUsers([Ljava/lang/String;[I)Landroid/app/PendingIntent;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {{
            Landroid/os/RemoteException;
        }}
    .end annotation

    invoke-virtual {{p0}}, Landroid/content/pm/IPackageManager$Stub$Proxy;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-static {{v0}}, Landroid/os/Parcel;->obtain(Landroid/os/IBinder;)Landroid/os/Parcel;

    move-result-object v0

    invoke-static {{}}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    :try_start_0
    const-string/jumbo v2, "android.content.pm.IPackageManager"

    invoke-virtual {{v0, v2}}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    invoke-virtual {{v0, p1}}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    invoke-virtual {{v0, p2}}, Landroid/os/Parcel;->writeIntArray([I)V

    iget-object p0, p0, Landroid/content/pm/IPackageManager$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 p1, 0x{tx_map["getEnableAppLockIntentForFolderItemsAsUsers"]:x}

    const/4 p2, 0x0

    invoke-interface {{p0, p1, v0, v1, p2}}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    invoke-virtual {{v1}}, Landroid/os/Parcel;->readException()V

    sget-object p0, Landroid/app/PendingIntent;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {{v1, p0}}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/PendingIntent;
    :try_end_0
    .catchall {{:try_start_0 .. :try_end_0}} :catchall_0

    invoke-virtual {{v1}}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {{v0}}, Landroid/os/Parcel;->recycle()V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-virtual {{v1}}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {{v0}}, Landroid/os/Parcel;->recycle()V

    throw p0
.end method""",
            ),
            (
                "setPackagesAppLockEnabledAsUsers([Ljava/lang/String;[IZ)Landroid/os/Bundle;",
                f""".method public blacklist setPackagesAppLockEnabledAsUsers([Ljava/lang/String;[IZ)Landroid/os/Bundle;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {{
            Landroid/os/RemoteException;
        }}
    .end annotation

    invoke-virtual {{p0}}, Landroid/content/pm/IPackageManager$Stub$Proxy;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-static {{v0}}, Landroid/os/Parcel;->obtain(Landroid/os/IBinder;)Landroid/os/Parcel;

    move-result-object v0

    invoke-static {{}}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    :try_start_0
    const-string/jumbo v2, "android.content.pm.IPackageManager"

    invoke-virtual {{v0, v2}}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    invoke-virtual {{v0, p1}}, Landroid/os/Parcel;->writeStringArray([Ljava/lang/String;)V

    invoke-virtual {{v0, p2}}, Landroid/os/Parcel;->writeIntArray([I)V

    invoke-virtual {{v0, p3}}, Landroid/os/Parcel;->writeBoolean(Z)V

    iget-object p0, p0, Landroid/content/pm/IPackageManager$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 p1, 0x{tx_map["setPackagesAppLockEnabledAsUsers"]:x}

    const/4 p2, 0x0

    invoke-interface {{p0, p1, v0, v1, p2}}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    invoke-virtual {{v1}}, Landroid/os/Parcel;->readException()V

    sget-object p0, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {{v1, p0}}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/Bundle;
    :try_end_0
    .catchall {{:try_start_0 .. :try_end_0}} :catchall_0

    invoke-virtual {{v1}}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {{v0}}, Landroid/os/Parcel;->recycle()V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-virtual {{v1}}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {{v0}}, Landroid/os/Parcel;->recycle()V

    throw p0
.end method""",
            ),
            (
                "getAppLockBackupTokens(Ljava/lang/String;I)Landroid/os/Bundle;",
                f""".method public blacklist getAppLockBackupTokens(Ljava/lang/String;I)Landroid/os/Bundle;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {{
            Landroid/os/RemoteException;
        }}
    .end annotation

    invoke-virtual {{p0}}, Landroid/content/pm/IPackageManager$Stub$Proxy;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-static {{v0}}, Landroid/os/Parcel;->obtain(Landroid/os/IBinder;)Landroid/os/Parcel;

    move-result-object v0

    invoke-static {{}}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    :try_start_0
    const-string/jumbo v2, "android.content.pm.IPackageManager"

    invoke-virtual {{v0, v2}}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    invoke-virtual {{v0, p1}}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    invoke-virtual {{v0, p2}}, Landroid/os/Parcel;->writeInt(I)V

    iget-object p0, p0, Landroid/content/pm/IPackageManager$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 p1, 0x{tx_map["getAppLockBackupTokens"]:x}

    const/4 p2, 0x0

    invoke-interface {{p0, p1, v0, v1, p2}}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    invoke-virtual {{v1}}, Landroid/os/Parcel;->readException()V

    sget-object p0, Landroid/os/Bundle;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {{v1, p0}}, Landroid/os/Parcel;->readTypedObject(Landroid/os/Parcelable$Creator;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/Bundle;
    :try_end_0
    .catchall {{:try_start_0 .. :try_end_0}} :catchall_0

    invoke-virtual {{v1}}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {{v0}}, Landroid/os/Parcel;->recycle()V

    return-object p0

    :catchall_0
    move-exception p0

    invoke-virtual {{v1}}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {{v0}}, Landroid/os/Parcel;->recycle()V

    throw p0
.end method""",
            ),
            (
                "restoreAppLockTokens(Ljava/lang/String;Landroid/os/Bundle;I)V",
                f""".method public blacklist restoreAppLockTokens(Ljava/lang/String;Landroid/os/Bundle;I)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {{
            Landroid/os/RemoteException;
        }}
    .end annotation

    invoke-virtual {{p0}}, Landroid/content/pm/IPackageManager$Stub$Proxy;->asBinder()Landroid/os/IBinder;

    move-result-object v0

    invoke-static {{v0}}, Landroid/os/Parcel;->obtain(Landroid/os/IBinder;)Landroid/os/Parcel;

    move-result-object v0

    invoke-static {{}}, Landroid/os/Parcel;->obtain()Landroid/os/Parcel;

    move-result-object v1

    :try_start_0
    const-string/jumbo v2, "android.content.pm.IPackageManager"

    invoke-virtual {{v0, v2}}, Landroid/os/Parcel;->writeInterfaceToken(Ljava/lang/String;)V

    invoke-virtual {{v0, p1}}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    const/4 p1, 0x0

    invoke-virtual {{v0, p2, p1}}, Landroid/os/Parcel;->writeTypedObject(Landroid/os/Parcelable;I)V

    invoke-virtual {{v0, p3}}, Landroid/os/Parcel;->writeInt(I)V

    iget-object p0, p0, Landroid/content/pm/IPackageManager$Stub$Proxy;->mRemote:Landroid/os/IBinder;

    const/16 p2, 0x{tx_map["restoreAppLockTokens"]:x}

    invoke-interface {{p0, p2, v0, v1, p1}}, Landroid/os/IBinder;->transact(ILandroid/os/Parcel;Landroid/os/Parcel;I)Z

    invoke-virtual {{v1}}, Landroid/os/Parcel;->readException()V
    :try_end_0
    .catchall {{:try_start_0 .. :try_end_0}} :catchall_0

    invoke-virtual {{v1}}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {{v0}}, Landroid/os/Parcel;->recycle()V

    return-void

    :catchall_0
    move-exception p0

    invoke-virtual {{v1}}, Landroid/os/Parcel;->recycle()V

    invoke-virtual {{v0}}, Landroid/os/Parcel;->recycle()V

    throw p0
.end method""",
            ),
        ]
        px = append_methods(px, px_methods)
        with open(p_px, "w", encoding="utf-8") as f:
            f.write(px)


def patch_system_service_registry(fw_dir):
    p = find_smali_file(fw_dir, "android/app/SystemServiceRegistry.smali")
    with open(p, "r", encoding="utf-8") as f:
        txt = f.read()
    if '"app_lock"' in txt:
        return
    inners = []
    for fpath in glob.glob(os.path.join(fw_dir, "smali*/android/app/SystemServiceRegistry$*.smali")):
        tail = os.path.basename(fpath).split("$", 1)[1].split(".", 1)[0]
        if tail.isdigit():
            inners.append(int(tail))
    nxt = max(inners) + 1
    fetcher_dir = os.path.dirname(p)
    fetcher_path = os.path.join(fetcher_dir, f"SystemServiceRegistry${nxt}.smali")
    fetcher_smali = f""".class Landroid/app/SystemServiceRegistry${nxt};
.super Landroid/app/SystemServiceRegistry$CachedServiceFetcher;
.source "SystemServiceRegistry.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroid/app/SystemServiceRegistry;->registerServices()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {{
        "Landroid/app/SystemServiceRegistry$CachedServiceFetcher<",
        "Landroid/security/applock/AppLockManager;",
        ">;"
    }}
.end annotation


# direct methods
.method constructor blacklist <init>()V
    .locals 0

    invoke-direct {{p0}}, Landroid/app/SystemServiceRegistry$CachedServiceFetcher;-><init>()V

    return-void
.end method


# virtual methods
.method public blacklist createService(Landroid/app/ContextImpl;)Landroid/security/applock/AppLockManager;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {{
            Landroid/os/ServiceManager$ServiceNotFoundException;
        }}
    .end annotation

    invoke-static {{}}, Lcom/android/internal/hidden_from_bootclasspath/android/security/Flags;->appLockApis()Z

    move-result p0

    const-string/jumbo p1, "app_lock"

    if-eqz p0, :cond_1

    invoke-static {{}}, Lcom/android/internal/hidden_from_bootclasspath/android/security/Flags;->appLockCore()Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-static {{p1}}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    new-instance p1, Landroid/security/applock/AppLockManager;

    invoke-static {{p0}}, Landroid/security/applock/IAppLockManager$Stub;->asInterface(Landroid/os/IBinder;)Landroid/security/applock/IAppLockManager;

    move-result-object p0

    invoke-direct {{p1, p0}}, Landroid/security/applock/AppLockManager;-><init>(Landroid/security/applock/IAppLockManager;)V

    return-object p1

    :cond_1
    new-instance p0, Landroid/os/ServiceManager$ServiceNotFoundException;

    invoke-direct {{p0, p1}}, Landroid/os/ServiceManager$ServiceNotFoundException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public bridge synthetic blacklist createService(Landroid/app/ContextImpl;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {{
            Landroid/os/ServiceManager$ServiceNotFoundException;
        }}
    .end annotation

    invoke-virtual {{p0, p1}}, Landroid/app/SystemServiceRegistry${nxt};->createService(Landroid/app/ContextImpl;)Landroid/security/applock/AppLockManager;

    move-result-object p0

    return-object p0
.end method
"""
    with open(fetcher_path, "w", encoding="utf-8") as f:
        f.write(fetcher_smali)

    anchor = "    const/4 v0, 0x1\n\n    sput-boolean v0, Landroid/app/SystemServiceRegistry;->sInitializing:Z"
    if anchor not in txt:
        raise RuntimeError("SystemServiceRegistry sInitializing anchor not found")
    reg_block = (
        f"    const-class v0, Landroid/security/applock/AppLockManager;\n\n"
        f"    new-instance v2, Landroid/app/SystemServiceRegistry${nxt};\n\n"
        f"    invoke-direct {{v2}}, Landroid/app/SystemServiceRegistry${nxt};-><init>()V\n\n"
        f'    const-string/jumbo v3, "app_lock"\n\n'
        f"    invoke-static {{v3, v0, v2}}, Landroid/app/SystemServiceRegistry;->registerService(Ljava/lang/String;Ljava/lang/Class;Landroid/app/SystemServiceRegistry$ServiceFetcher;)V\n\n"
    )
    txt = txt.replace(anchor, reg_block + anchor, 1)
    with open(p, "w", encoding="utf-8") as f:
        f.write(txt)


def main():
    if len(sys.argv) < 4:
        print("Usage: patch_framework.py <framework_dir> <payload_fw_dir> <m51_fwres_public_xml> [s26_id_map_json]")
        sys.exit(1)
    fw_dir = sys.argv[1]
    payload_dir = sys.argv[2]
    pub_xml = sys.argv[3]
    s26_map = sys.argv[4] if len(sys.argv) > 4 else os.path.join(os.path.dirname(payload_dir), "fwres", "s26_id_map.json")

    remap, m51_pub, missing = build_fw_remap(s26_map, pub_xml)
    if missing:
        print(f"WARNING: {len(missing)} s26 fwres IDs missing in public.xml: {missing[:5]}")

    copy_payload(fw_dir, payload_dir, remap)
    patch_r_classes(fw_dir, m51_pub)
    patch_flags(fw_dir)
    patch_search_manager(fw_dir)
    patch_runes_and_metadata(fw_dir)
    patch_misc_helpers(fw_dir)
    patch_applock_internal(fw_dir)
    patch_task_info(fw_dir)
    patch_itask_stack_listener(fw_dir)
    patch_iactivity_task_manager(fw_dir)
    patch_ivold(fw_dir)
    patch_package_managers(fw_dir)
    patch_system_service_registry(fw_dir)
    print(f"- Patched framework.jar cleanly (remapped {len(remap)} fwres IDs)")


if __name__ == "__main__":
    main()
