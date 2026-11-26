#!/usr/bin/env python3
"""Patch stock Galaxy M51 services.jar smali for native One UI 9.5 App Lock."""

import glob
import json
import os
import re
import sys

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
PAYLOAD_DIR = os.path.join(SCRIPT_DIR, "payload")

sys.path.insert(0, SCRIPT_DIR)
from patch_framework import (  # noqa: E402
    add_fields,
    append_methods,
    build_fw_remap,
    find_smali_file,
    get_next_smali_dir,
    remap_hex_in_smali,
    replace_or_append_method,
)

PROTOLOG_S26 = "ProtoLogImpl_1534617175"
PROTOLOG_M51 = "ProtoLogImpl_1983143371"


def normalize_protolog(txt):
    return txt.replace(PROTOLOG_S26, PROTOLOG_M51)


def read_smali(root, rel):
    p = find_smali_file(root, rel)
    if not p:
        raise RuntimeError(f"Missing {rel} in {root}")
    with open(p, "r", encoding="utf-8") as f:
        return p, f.read()


def write_smali(path, txt):
    with open(path, "w", encoding="utf-8") as f:
        f.write(txt)


def replace_once(txt, old, new, label, guard=None):
    if guard and guard in txt:
        return txt
    if new in txt and old not in txt:
        return txt
    n = txt.count(old)
    if n != 1:
        raise RuntimeError(f"[{label}] expected 1 match for anchor, got {n}")
    return txt.replace(old, new, 1)


def ensure_method_locals_min(txt, sig_substr, min_locals):
    m = re.search(rf"(\.method [^\n]*{re.escape(sig_substr)}[^\n]*\n\s+\.locals )(\d+)", txt)
    if not m:
        raise RuntimeError(f"Method {sig_substr} not found for locals bump")
    cur = int(m.group(2))
    if cur < min_locals:
        txt = txt[:m.start(2)] + str(min_locals) + txt[m.end(2):]
    return txt


def cleanup_and_copy_payload(srv_dir, fw_remap):
    # Remove M51 legacy AppLock stubs that conflict with S26 payload.
    for pat in (
        "com/android/server/applock/**/*.smali",
        "com/android/server/applock/*.smali",
        "com/android/server/pm/AppLockPackageHelper*.smali",
        "com/android/server/pm/ShortcutService$3.smali",
    ):
        for p in glob.glob(os.path.join(srv_dir, "smali*", pat), recursive=True):
            os.remove(p)

    existing_helper = find_smali_file(srv_dir, "com/android/server/wm/AppLockWmHelpers.smali")
    prev_dir = existing_helper[: -len("com/android/server/wm/AppLockWmHelpers.smali")].rstrip("/\\") if existing_helper else None

    src_root = os.path.join(PAYLOAD_DIR, "services", "smali")
    # Remove any same-relative-path files across all smali* roots to prevent duplicate-class errors.
    for cur_dir, _, files in os.walk(src_root):
        rel_dir = os.path.relpath(cur_dir, src_root)
        for fn in files:
            if not fn.endswith(".smali"):
                continue
            rel = fn if rel_dir == "." else os.path.join(rel_dir, fn)
            for existing in glob.glob(os.path.join(srv_dir, "smali*", rel)):
                os.remove(existing)

    if prev_dir and os.path.isdir(prev_dir):
        dst_root = prev_dir
    else:
        empty_trailing = [
            p for p in sorted(glob.glob(os.path.join(srv_dir, "smali_classes*")))
            if not any(True for _ in os.walk(p) if _[2])
        ]
        dst_root = empty_trailing[0] if empty_trailing else get_next_smali_dir(srv_dir)

    copied = 0
    for cur_dir, _, files in os.walk(src_root):
        rel_dir = os.path.relpath(cur_dir, src_root)
        out_dir = dst_root if rel_dir == "." else os.path.join(dst_root, rel_dir)
        os.makedirs(out_dir, exist_ok=True)
        for fn in files:
            src_p = os.path.join(cur_dir, fn)
            dst_p = os.path.join(out_dir, fn)
            with open(src_p, "r", encoding="utf-8") as f:
                txt = f.read()
            if fn.endswith(".smali"):
                txt = normalize_protolog(remap_hex_in_smali(txt, fw_remap))
            with open(dst_p, "w", encoding="utf-8") as f:
                f.write(txt)
            copied += 1
    print(f"  Copied {copied} services payload files into {os.path.basename(dst_root)}")


def apply_snippets_and_interfaces(srv_dir, fw_remap):
    # 1. Inject all S26 snippets (remapped + ProtoLog normalized)
    with open(os.path.join(PAYLOAD_DIR, "services_snippets.json"), "r", encoding="utf-8") as f:
        snippets = json.load(f)
    for rel, methods in snippets.items():
        p, txt = read_smali(srv_dir, rel)
        for sig, body in methods.items():
            clean_body = normalize_protolog(remap_hex_in_smali(body, fw_remap))
            txt = replace_or_append_method(txt, sig, clean_body)
        write_smali(p, txt)

    # 2. Fields and missing methods needed across M51 classes
    p, txt = read_smali(srv_dir, "com/android/server/pm/UserManagerInternal.smali")
    txt = append_methods(
        txt,
        [(
            "getUsers(Lcom/android/server/pm/UserFilter;)Ljava/util/List;",
            ".method public abstract getUsers(Lcom/android/server/pm/UserFilter;)Ljava/util/List;\n"
            "    .annotation system Ldalvik/annotation/Signature;\n"
            "        value = {\n"
            "            \"(\",\n"
            "            \"Lcom/android/server/pm/UserFilter;\",\n"
            "            \")\",\n"
            "            \"Ljava/util/List<\",\n"
            "            \"Landroid/content/pm/UserInfo;\",\n"
            "            \">;\"\n"
            "        }\n"
            "    .end annotation\n"
            ".end method",
        )],
    )
    write_smali(p, txt)

    p, txt = read_smali(srv_dir, "android/content/pm/PackageManagerInternal.smali")
    txt = append_methods(
        txt,
        [
            ("getActivityInfo(Landroid/content/ComponentName;JII)Landroid/content/pm/ActivityInfo;",
             ".method public abstract getActivityInfo(Landroid/content/ComponentName;JII)Landroid/content/pm/ActivityInfo;\n.end method"),
            ("getInstalledApplicationsCrossUser(IIJ)Ljava/util/List;",
             ".method public abstract getInstalledApplicationsCrossUser(IIJ)Ljava/util/List;\n.end method"),
            ("getAppLockEnabledPackagesForUser(I)Ljava/util/List;",
             ".method public abstract getAppLockEnabledPackagesForUser(I)Ljava/util/List;\n.end method"),
            ("getAppLockParentPackage(ILjava/lang/String;)Ljava/lang/String;",
             ".method public abstract getAppLockParentPackage(ILjava/lang/String;)Ljava/lang/String;\n.end method"),
            ("isPackageAppLockEnabled(Ljava/lang/String;I)Z",
             ".method public abstract isPackageAppLockEnabled(Ljava/lang/String;I)Z\n.end method"),
            ("setPackageAppLockEnabled(ILjava/lang/String;)Z",
             ".method public abstract setPackageAppLockEnabled(ILjava/lang/String;)Z\n.end method"),
        ],
    )
    write_smali(p, txt)

    p, txt = read_smali(srv_dir, "com/android/server/wm/ActivityTaskManagerInternal.smali")
    txt = append_methods(
        txt,
        [
            ("getAppLockTaskVisibilityState(ILjava/lang/String;)I",
             ".method public abstract getAppLockTaskVisibilityState(ILjava/lang/String;)I\n.end method"),
            ("getPackagesWithVisibleAppLockOverlay(I)Ljava/util/Set;",
             ".method public abstract getPackagesWithVisibleAppLockOverlay(I)Ljava/util/Set;\n.end method"),
        ],
    )
    write_smali(p, txt)

    p, txt = read_smali(srv_dir, "com/android/server/notification/ManagedServices.smali")
    txt = append_methods(
        txt,
        [(
            "isServiceTokenValidLocked(Landroid/os/IInterface;)Z",
            ".method public final isServiceTokenValidLocked(Landroid/os/IInterface;)Z\n"
            "    .locals 1\n\n"
            "    const/4 v0, 0x0\n\n"
            "    if-nez p1, :cond_0\n\n"
            "    return v0\n\n"
            "    :cond_0\n"
            "    invoke-virtual {p0, p1}, Lcom/android/server/notification/ManagedServices;->getServiceFromTokenLocked(Landroid/os/IInterface;)Lcom/android/server/notification/ManagedServices$ManagedServiceInfo;\n\n"
            "    move-result-object p0\n\n"
            "    if-eqz p0, :cond_1\n\n"
            "    const/4 p0, 0x1\n\n"
            "    return p0\n\n"
            "    :cond_1\n"
            "    return v0\n"
            ".end method",
        )],
    )
    write_smali(p, txt)

    p, txt = read_smali(srv_dir, "com/android/server/notification/NotificationRecord.smali")
    txt = add_fields(txt, [".field public mAppLockRedacted:Z"])
    write_smali(p, txt)

    p, txt = read_smali(srv_dir, "com/android/server/notification/NotificationManagerService.smali")
    txt = add_fields(
        txt,
        [
            ".field public mAppLockInternal:Landroid/app/AppLockInternal;",
            ".field public mAppLockLockedPackages:Landroid/util/SparseArray;",
            ".field public mPackageLockedStateListener:Lcom/android/server/notification/NotificationManagerService$26;",
        ],
    )
    txt = append_methods(
        txt,
        [(
            "findAppNotificationByListLocked(ILjava/lang/String;Ljava/util/ArrayList;)Ljava/util/List;",
            ".method public static findAppNotificationByListLocked(ILjava/lang/String;Ljava/util/ArrayList;)Ljava/util/List;\n"
            "    .locals 1\n\n"
            "    const/4 v0, 0x0\n\n"
            "    invoke-static {v0, p2, p1, p0}, Lcom/android/server/notification/NotificationManagerService;->-$$Nest$mfindAppNotificationByListLocked(Lcom/android/server/notification/NotificationManagerService;Ljava/util/ArrayList;Ljava/lang/String;I)Ljava/util/List;\n\n"
            "    move-result-object p0\n\n"
            "    return-object p0\n"
            ".end method",
        )],
    )
    write_smali(p, txt)

    p, txt = read_smali(srv_dir, "com/android/server/am/ActivityManagerService.smali")
    txt = txt.replace(
        ".field public final mCurResumedAppLock:Ljava/lang/Object;",
        ".field public mCurResumedAppLock:Ljava/lang/Object;",
    )
    txt = add_fields(
        txt,
        [
            ".field public mAppLockLocalService:Lcom/android/server/am/AppLockLocalService;",
            ".field public mCurResumedAppLock:Ljava/lang/Object;",
        ],
    )
    write_smali(p, txt)

    p, txt = read_smali(srv_dir, "com/android/server/pm/PackageManagerService.smali")
    txt = add_fields(txt, [".field public mAppLockPackageHelper:Lcom/android/server/pm/AppLockPackageHelper;"])
    write_smali(p, txt)

    p, txt = read_smali(srv_dir, "com/android/server/wm/WindowManagerService.smali")
    txt = add_fields(
        txt,
        [
            ".field public mAppLockBiometricFocusController:Lcom/android/server/wm/AppLockBiometricFocusController;",
            ".field public mAppLockController:Lcom/android/server/wm/AppLockController;",
        ],
    )
    write_smali(p, txt)

    p, txt = read_smali(srv_dir, "com/android/server/wm/WindowState.smali")
    txt = add_fields(txt, [".field public mHiddenWhileLockedByAppLock:Z"])
    txt = append_methods(
        txt,
        [(
            "getUid()I",
            ".method public final getUid()I\n"
            "    .locals 0\n\n"
            "    iget-object p0, p0, Lcom/android/server/wm/WindowState;->mSession:Lcom/android/server/wm/Session;\n\n"
            "    iget p0, p0, Lcom/android/server/wm/Session;->mUid:I\n\n"
            "    return p0\n"
            ".end method",
        )],
    )
    write_smali(p, txt)

    p, txt = read_smali(srv_dir, "com/android/server/wm/ActivityTaskSupervisor.smali")
    txt = append_methods(
        txt,
        [(
            "removeTask(Lcom/android/server/wm/Task;ZZLjava/lang/String;)V",
            ".method public final removeTask(Lcom/android/server/wm/Task;ZZLjava/lang/String;)V\n"
            "    .locals 9\n\n"
            "    const/4 v5, 0x0\n\n"
            "    const/16 v6, 0x3e8\n\n"
            "    const/4 v7, -0x1\n\n"
            "    const/4 v8, 0x0\n\n"
            "    move-object v0, p0\n\n"
            "    move-object v1, p1\n\n"
            "    move v2, p2\n\n"
            "    move v3, p3\n\n"
            "    move-object v4, p4\n\n"
            "    invoke-virtual/range {v0 .. v8}, Lcom/android/server/wm/ActivityTaskSupervisor;->removeTask(Lcom/android/server/wm/Task;ZZLjava/lang/String;ZIILjava/lang/String;)V\n\n"
            "    return-void\n"
            ".end method",
        )],
    )
    write_smali(p, txt)

    p, txt = read_smali(srv_dir, "com/android/server/wm/ActivityRecord.smali")
    txt = txt.replace(
        ".field public final mNotToBeTopForAppLockException:Z",
        ".field public mNotToBeTopForAppLockException:Z",
    )
    txt = add_fields(
        txt,
        [
            ".field public mDeferAppLockIntercept:Z",
            ".field public mEnterPipOnStopForAppLock:Z",
        ],
    )
    write_smali(p, txt)

    p, txt = read_smali(srv_dir, "com/android/server/wm/ActivityStartInterceptor.smali")
    txt = add_fields(
        txt,
        [
            ".field public mAppLockFolderBypassId:I",
            ".field public mAppLockPendingIntents:[Landroid/content/Intent;",
            ".field public mAppLockPendingResolvedTypes:[Ljava/lang/String;",
            ".field public mAppLockWakeDisplayId:I",
            ".field public mDeferAppLockIntercept:Z",
            ".field public mOriginatingPendingIntent:Lcom/android/server/am/PendingIntentRecord;",
            ".field public mRequestCode:I",
        ],
    )
    txt = append_methods(
        txt,
        [(
            "getLaunchTaskFragment()Lcom/android/server/wm/TaskFragment;",
            ".method public final getLaunchTaskFragment()Lcom/android/server/wm/TaskFragment;\n"
            "    .locals 2\n\n"
            "    iget-object v0, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mInTaskFragment:Lcom/android/server/wm/TaskFragment;\n\n"
            "    if-eqz v0, :cond_0\n\n"
            "    return-object v0\n\n"
            "    :cond_0\n"
            "    iget-object v0, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mActivityOptions:Landroid/app/ActivityOptions;\n\n"
            "    const/4 v1, 0x0\n\n"
            "    if-eqz v0, :cond_2\n\n"
            "    invoke-virtual {v0}, Landroid/app/ActivityOptions;->getLaunchTaskFragmentToken()Landroid/os/IBinder;\n\n"
            "    move-result-object v0\n\n"
            "    if-nez v0, :cond_1\n\n"
            "    return-object v1\n\n"
            "    :cond_1\n"
            "    iget-object p0, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mService:Lcom/android/server/wm/ActivityTaskManagerService;\n\n"
            "    iget-object p0, p0, Lcom/android/server/wm/ActivityTaskManagerService;->mWindowOrganizerController:Lcom/android/server/wm/WindowOrganizerController;\n\n"
            "    iget-object p0, p0, Lcom/android/server/wm/WindowOrganizerController;->mLaunchTaskFragments:Landroid/util/ArrayMap;\n\n"
            "    invoke-virtual {p0, v0}, Landroid/util/ArrayMap;->get(Ljava/lang/Object;)Ljava/lang/Object;\n\n"
            "    move-result-object p0\n\n"
            "    check-cast p0, Lcom/android/server/wm/TaskFragment;\n\n"
            "    return-object p0\n\n"
            "    :cond_2\n"
            "    return-object v1\n"
            ".end method",
        )],
    )
    write_smali(p, txt)

    p, txt = read_smali(srv_dir, "com/android/server/wm/ActivityStarter$Request.smali")
    txt = add_fields(
        txt,
        [
            ".field public appLockPendingIntents:[Landroid/content/Intent;",
            ".field public appLockPendingResolvedTypes:[Ljava/lang/String;",
        ],
    )
    write_smali(p, txt)


def patch_system_server_and_config(srv_dir, fw_remap):
    cfg_id = fw_remap.get(0x01110199)
    if cfg_id is None:
        raise RuntimeError("Missing bool/config_enableAppLock (0x01110199) in fwres remap")

    p, txt = read_smali(srv_dir, "com/android/server/SystemServer.smali")
    anchor = (
        '    invoke-virtual {v2}, Landroid/util/TimingsTraceLog;->traceEnd()V\n\n'
        '    :cond_11\n'
        '    const-string/jumbo v0, "SemInputDeviceManagerService"'
    )
    replacement = (
        f'    invoke-virtual {{v2}}, Landroid/util/TimingsTraceLog;->traceEnd()V\n\n'
        f'    :cond_11\n'
        f'    if-nez v10, :cond_app_lock_skip\n\n'
        f'    if-nez v12, :cond_app_lock_skip\n\n'
        f'    if-nez v13, :cond_app_lock_skip\n\n'
        f'    invoke-virtual {{v6}}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;\n\n'
        f'    move-result-object v0\n\n'
        f'    const v4, 0x{cfg_id:x}\n\n'
        f'    invoke-virtual {{v0, v4}}, Landroid/content/res/Resources;->getBoolean(I)Z\n\n'
        f'    move-result v0\n\n'
        f'    if-eqz v0, :cond_app_lock_skip\n\n'
        f'    const-string/jumbo v0, "StartAppLockService"\n\n'
        f'    invoke-virtual {{v2, v0}}, Lcom/android/server/utils/TimingsTraceAndSlog;->traceBegin(Ljava/lang/String;)V\n\n'
        f'    iget-object v0, v1, Lcom/android/server/SystemServer;->mSystemServiceManager:Lcom/android/server/SystemServiceManager;\n\n'
        f'    const-class v4, Lcom/android/server/security/applock/AppLockService$Lifecycle;\n\n'
        f'    invoke-virtual {{v0, v4}}, Lcom/android/server/SystemServiceManager;->startService(Ljava/lang/Class;)Lcom/android/server/SystemService;\n\n'
        f'    invoke-virtual {{v2}}, Landroid/util/TimingsTraceLog;->traceEnd()V\n\n'
        f'    :cond_app_lock_skip\n'
        f'    const-string/jumbo v0, "SemInputDeviceManagerService"'
    )
    txt = replace_once(txt, anchor, replacement, "SystemServer.StartAppLockService", guard='"StartAppLockService"')
    write_smali(p, txt)

    p, txt = read_smali(srv_dir, "com/android/server/SystemConfig.smali")
    txt = replace_once(
        txt,
        "    invoke-static {v1}, Lcom/android/server/SystemConfig;->readAppLockExemptApps(Lorg/xmlpull/v1/XmlPullParser;)V",
        "    invoke-virtual {v0, v2, v12, v1}, Lcom/android/server/SystemConfig;->readAppLockExemptApps(Ljava/io/File;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)V",
        "SystemConfig.readAppLockExemptApps",
        guard="->readAppLockExemptApps(Ljava/io/File;Ljava/lang/String;Lorg/xmlpull/v1/XmlPullParser;)V",
    )
    write_smali(p, txt)


def patch_pm(srv_dir):
    # 1. PackageManagerService
    p, txt = read_smali(srv_dir, "com/android/server/pm/PackageManagerService.smali")
    txt = replace_once(
        txt,
        "    invoke-direct {v2, v9, v1, v5}, Lcom/android/server/pm/AppLockPackageHelper;-><init>(Landroid/content/Context;Lcom/android/server/pm/PackageManagerService;Lcom/android/server/pm/BroadcastHelper;)V",
        "    invoke-direct {v2, v9, v1, v5}, Lcom/android/server/pm/AppLockPackageHelper;-><init>(Landroid/content/Context;Lcom/android/server/pm/PackageManagerService;Lcom/android/server/pm/BroadcastHelper;)V\n\n"
        "    iput-object v2, v1, Lcom/android/server/pm/PackageManagerService;->mAppLockPackageHelper:Lcom/android/server/pm/AppLockPackageHelper;",
        "PMS.<init> store mAppLockPackageHelper",
        guard="iput-object v2, v1, Lcom/android/server/pm/PackageManagerService;->mAppLockPackageHelper:Lcom/android/server/pm/AppLockPackageHelper;",
    )
    txt = replace_once(
        txt,
        "    :cond_11\n    :goto_d\n    new-instance v1, Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;",
        "    :cond_11\n    :goto_d\n    invoke-static {v0}, Lcom/android/server/pm/AppLockPmHelpers;->onPmsMainAppLock(Lcom/android/server/pm/PackageManagerService;)V\n\n"
        "    new-instance v1, Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;",
        "PMS.main onPmsMainAppLock",
        guard="AppLockPmHelpers;->onPmsMainAppLock",
    )
    txt = replace_once(
        txt,
        "    iget-object p1, p0, Lcom/android/server/pm/PackageManagerService;->mInstantAppRegistry:Lcom/android/server/pm/InstantAppRegistry;\n\n"
        "    invoke-virtual {p1, p2}, Lcom/android/server/pm/InstantAppRegistry;->onUserRemoved(I)V",
        "    iget-object p1, p0, Lcom/android/server/pm/PackageManagerService;->mInstantAppRegistry:Lcom/android/server/pm/InstantAppRegistry;\n\n"
        "    invoke-virtual {p1, p2}, Lcom/android/server/pm/InstantAppRegistry;->onUserRemoved(I)V\n\n"
        "    invoke-static {p0, p2}, Lcom/android/server/pm/AppLockPmHelpers;->onPmsUserRemoved(Lcom/android/server/pm/PackageManagerService;I)V",
        "PMS.cleanUpUser onPmsUserRemoved",
        guard="AppLockPmHelpers;->onPmsUserRemoved",
    )
    txt = replace_once(
        txt,
        "    invoke-static {}, Lcom/android/server/pm/PackageMetrics;->logInvalidationMetrics()V\n\n"
        "    iget-object v0, p0, Lcom/android/server/pm/PackageManagerService;->mFrozenPackageInterceptor:Lcom/android/server/pm/FrozenPackageInterceptor;",
        "    invoke-static {}, Lcom/android/server/pm/PackageMetrics;->logInvalidationMetrics()V\n\n"
        "    invoke-static {p0}, Lcom/android/server/pm/AppLockPmHelpers;->onPmsSystemReady(Lcom/android/server/pm/PackageManagerService;)V\n\n"
        "    iget-object v0, p0, Lcom/android/server/pm/PackageManagerService;->mFrozenPackageInterceptor:Lcom/android/server/pm/FrozenPackageInterceptor;",
        "PMS.systemReady onPmsSystemReady",
        guard="AppLockPmHelpers;->onPmsSystemReady",
    )
    txt = replace_once(
        txt,
        '    invoke-static {v6, v7}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I\n\n'
        '    invoke-interface {v0}, Lcom/android/server/pm/pkg/PackageStateInternal;->getAppMetadataSource()I',
        '    invoke-static {v6, v7}, Landroid/util/Slog;->i(Ljava/lang/String;Ljava/lang/String;)I\n\n'
        '    invoke-static {v2, v1, v15}, Lcom/android/server/pm/AppLockPmHelpers;->onPmsPostInstallAppLock(Lcom/android/server/pm/InstallPackageHelper;Lcom/android/server/pm/InstallRequest;Ljava/lang/String;)V\n\n'
        '    invoke-interface {v0}, Lcom/android/server/pm/pkg/PackageStateInternal;->getAppMetadataSource()I',
        "PMS.handlePackagePostInstall onPmsPostInstallAppLock",
        guard="AppLockPmHelpers;->onPmsPostInstallAppLock",
    )
    write_smali(p, txt)

    # 2. PackageManagerService$IPackageManagerImpl.clearApplicationUserData
    p, txt = read_smali(srv_dir, "com/android/server/pm/PackageManagerService$IPackageManagerImpl.smali")
    if "AppLockPmHelpers;->shouldBlockClearAppUserData" not in txt:
        txt = ensure_method_locals_min(txt, "clearApplicationUserData(Ljava/lang/String;Landroid/content/pm/IPackageDataObserver;IZ)V", 10)
        txt = replace_once(
            txt,
            "    const-string/jumbo v1, \"clear application data\"\n\n"
            "    const/4 v4, 0x1\n\n"
            "    move v3, p3\n\n"
            "    invoke-interface/range {v0 .. v5}, Lcom/android/server/pm/Computer;->enforceCrossUserPermission(Ljava/lang/String;IIZZ)V\n\n"
            "    invoke-interface {v0, v2, v3, p1}, Lcom/android/server/pm/Computer;->getPackageStateForInstalledAndFiltered(IILjava/lang/String;)Lcom/android/server/pm/PackageSetting;",
            "    const-string/jumbo v1, \"clear application data\"\n\n"
            "    const/4 v4, 0x1\n\n"
            "    move v3, p3\n\n"
            "    invoke-interface/range {v0 .. v5}, Lcom/android/server/pm/Computer;->enforceCrossUserPermission(Ljava/lang/String;IIZZ)V\n\n"
            "    iget-object v4, p0, Lcom/android/server/pm/PackageManagerService$IPackageManagerImpl;->this$0:Lcom/android/server/pm/PackageManagerService;\n\n"
            "    move-object v5, v0\n\n"
            "    move-object v6, p1\n\n"
            "    move v7, v3\n\n"
            "    move-object v8, p2\n\n"
            "    move v9, v2\n\n"
            "    invoke-static/range {v4 .. v9}, Lcom/android/server/pm/AppLockPmHelpers;->shouldBlockClearAppUserData(Lcom/android/server/pm/PackageManagerService;Lcom/android/server/pm/Computer;Ljava/lang/String;ILandroid/content/pm/IPackageDataObserver;I)Z\n\n"
            "    move-result v4\n\n"
            "    if-eqz v4, :cond_app_lock_allow_clear\n\n"
            "    return-void\n\n"
            "    :cond_app_lock_allow_clear\n"
            "    invoke-interface {v0, v2, v3, p1}, Lcom/android/server/pm/Computer;->getPackageStateForInstalledAndFiltered(IILjava/lang/String;)Lcom/android/server/pm/PackageSetting;",
            "PMS$IPackageManagerImpl.clearApplicationUserData",
        )
    write_smali(p, txt)

    # 3. InstallPackageHelper.installExistingPackageAsUser
    p, txt = read_smali(srv_dir, "com/android/server/pm/InstallPackageHelper.smali")
    txt = replace_once(
        txt,
        "    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceAfterPmsUnlock()V\n\n"
        "    if-eqz v2, :cond_27\n\n"
        "    iget-object v0, v7, Lcom/android/server/pm/PackageSetting;->installSource:Lcom/android/server/pm/InstallSource;",
        "    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceAfterPmsUnlock()V\n\n"
        "    iget-object v0, v1, Lcom/android/server/pm/InstallPackageHelper;->mPm:Lcom/android/server/pm/PackageManagerService;\n\n"
        "    invoke-static {v0, v4, v3, v2}, Lcom/android/server/pm/AppLockPmHelpers;->onPmsExistingPackageInstalled(Lcom/android/server/pm/PackageManagerService;Ljava/lang/String;IZ)V\n\n"
        "    if-eqz v2, :cond_27\n\n"
        "    iget-object v0, v7, Lcom/android/server/pm/PackageSetting;->installSource:Lcom/android/server/pm/InstallSource;",
        "InstallPackageHelper.installExistingPackageAsUser",
        guard="onPmsExistingPackageInstalled",
    )
    write_smali(p, txt)

    # 4. DeletePackageHelper
    p, txt = read_smali(srv_dir, "com/android/server/pm/DeletePackageHelper.smali")
    txt = replace_once(
        txt,
        "    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceAfterPmsUnlock()V\n\n"
        "    iget-object v2, v1, Lcom/android/server/pm/DeletePackageHelper;->mPm:Lcom/android/server/pm/PackageManagerService;\n\n"
        "    iget-object v2, v2, Lcom/android/server/pm/PackageManagerService;->mInstallLock:Lcom/android/server/pm/PackageManagerTracedLock;",
        "    invoke-static {}, Lcom/android/server/pm/PackageManagerService;->traceAfterPmsUnlock()V\n\n"
        "    iget-object v2, v1, Lcom/android/server/pm/DeletePackageHelper;->mPm:Lcom/android/server/pm/PackageManagerService;\n\n"
        "    iget-object v6, v3, Lcom/android/server/pm/PackageRemovedInfo;->mOrigUsers:[I\n\n"
        "    if-eqz v6, :cond_app_lock_skip_cache\n\n"
        "    invoke-virtual {v2, v7, v6}, Lcom/android/server/pm/PackageManagerService;->maybeCacheAppLockState(Ljava/lang/String;[I)V\n\n"
        "    :cond_app_lock_skip_cache\n"
        "    iget-object v2, v1, Lcom/android/server/pm/DeletePackageHelper;->mPm:Lcom/android/server/pm/PackageManagerService;\n\n"
        "    iget-object v2, v2, Lcom/android/server/pm/PackageManagerService;->mInstallLock:Lcom/android/server/pm/PackageManagerTracedLock;",
        "DeletePackageHelper maybeCacheAppLockState",
        guard="maybeCacheAppLockState",
    )
    txt = replace_once(
        txt,
        "    :goto_13\n"
        "    iget-boolean v3, v4, Lcom/android/server/pm/PackageRemovedInfo;->mIsUpdate:Z\n\n"
        "    if-eqz v3, :cond_1c",
        "    :goto_13\n"
        "    iget-object v3, v1, Lcom/android/server/pm/DeletePackageHelper;->mPm:Lcom/android/server/pm/PackageManagerService;\n\n"
        "    iget-object v5, v4, Lcom/android/server/pm/PackageRemovedInfo;->mOrigUsers:[I\n\n"
        "    if-eqz v5, :cond_app_lock_skip_sync\n\n"
        "    iget-object v6, v4, Lcom/android/server/pm/PackageRemovedInfo;->mRemovedPackage:Ljava/lang/String;\n\n"
        "    if-eqz v6, :cond_app_lock_skip_sync\n\n"
        "    invoke-virtual {v3, v6, v5}, Lcom/android/server/pm/PackageManagerService;->maybeSyncAppLockGroup(Ljava/lang/String;[I)V\n\n"
        "    :cond_app_lock_skip_sync\n"
        "    iget-boolean v3, v4, Lcom/android/server/pm/PackageRemovedInfo;->mIsUpdate:Z\n\n"
        "    if-eqz v3, :cond_1c",
        "DeletePackageHelper maybeSyncAppLockGroup",
        guard="maybeSyncAppLockGroup",
    )
    write_smali(p, txt)

    # 5. InitAppsHelper
    p, txt = read_smali(srv_dir, "com/android/server/pm/InitAppsHelper.smali")
    txt = replace_once(
        txt,
        "    move-object/from16 v11, p2\n\n"
        "    invoke-virtual {v5, v10, v11}, Lcom/android/server/pm/RemovePackageHelper;->removePackageData(Lcom/android/server/pm/PackageSetting;[I)V\n\n"
        "    :goto_8",
        "    move-object/from16 v11, p2\n\n"
        "    invoke-virtual {v5, v10, v11}, Lcom/android/server/pm/RemovePackageHelper;->removePackageData(Lcom/android/server/pm/PackageSetting;[I)V\n\n"
        "    iget-object v11, v7, Lcom/android/server/pm/PackageManagerService;->mAppLockPackageHelper:Lcom/android/server/pm/AppLockPackageHelper;\n\n"
        "    if-eqz v11, :cond_app_lock_init_non\n\n"
        "    iget-object v11, v11, Lcom/android/server/pm/AppLockPackageHelper;->mPackagesRemovedAtBoot:Landroid/util/ArraySet;\n\n"
        "    monitor-enter v11\n\n"
        "    :try_start_app_lock_non\n"
        "    iget-object v10, v10, Lcom/android/server/pm/PackageSetting;->mName:Ljava/lang/String;\n\n"
        "    invoke-virtual {v11, v10}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z\n\n"
        "    monitor-exit v11\n"
        "    :try_end_app_lock_non\n"
        "    .catchall {:try_start_app_lock_non .. :try_end_app_lock_non_c} :catchall_app_lock_non\n\n"
        "    goto :goto_app_lock_non\n\n"
        "    :catchall_app_lock_non\n"
        "    move-exception v0\n\n"
        "    :try_start_app_lock_non_c\n"
        "    monitor-exit v11\n"
        "    :try_end_app_lock_non_c\n"
        "    .catchall {:try_start_app_lock_non_c .. :try_end_app_lock_non_c} :catchall_app_lock_non\n\n"
        "    throw v0\n\n"
        "    :cond_app_lock_init_non\n"
        "    :goto_app_lock_non\n"
        "    :goto_8",
        "InitAppsHelper.initNonSystemApps",
        guard=":cond_app_lock_init_non",
    )
    txt = replace_once(
        txt,
        "    invoke-virtual {v6, v10, v1}, Lcom/android/server/pm/RemovePackageHelper;->removePackageData(Lcom/android/server/pm/PackageSetting;[I)V\n\n"
        "    goto :goto_b",
        "    invoke-virtual {v6, v10, v1}, Lcom/android/server/pm/RemovePackageHelper;->removePackageData(Lcom/android/server/pm/PackageSetting;[I)V\n\n"
        "    iget-object v1, v3, Lcom/android/server/pm/PackageManagerService;->mAppLockPackageHelper:Lcom/android/server/pm/AppLockPackageHelper;\n\n"
        "    if-eqz v1, :cond_app_lock_init_sys\n\n"
        "    iget-object v1, v1, Lcom/android/server/pm/AppLockPackageHelper;->mPackagesRemovedAtBoot:Landroid/util/ArraySet;\n\n"
        "    monitor-enter v1\n\n"
        "    :try_start_app_lock_sys\n"
        "    iget-object v2, v10, Lcom/android/server/pm/PackageSetting;->mName:Ljava/lang/String;\n\n"
        "    invoke-virtual {v1, v2}, Landroid/util/ArraySet;->add(Ljava/lang/Object;)Z\n\n"
        "    monitor-exit v1\n"
        "    :try_end_app_lock_sys\n"
        "    .catchall {:try_start_app_lock_sys .. :try_end_app_lock_sys_c} :catchall_app_lock_sys\n\n"
        "    goto :cond_app_lock_init_sys\n\n"
        "    :catchall_app_lock_sys\n"
        "    move-exception v0\n\n"
        "    :try_start_app_lock_sys_c\n"
        "    monitor-exit v1\n"
        "    :try_end_app_lock_sys_c\n"
        "    .catchall {:try_start_app_lock_sys_c .. :try_end_app_lock_sys_c} :catchall_app_lock_sys\n\n"
        "    throw v0\n\n"
        "    :cond_app_lock_init_sys\n"
        "    goto :goto_b",
        "InitAppsHelper.initSystemApps",
        guard=":cond_app_lock_init_sys",
    )
    write_smali(p, txt)

    # 5b. ScanPackageUtils.setCustomSignatures (normalize modified framework-res back to stock platform cert)
    p, txt = read_smali(srv_dir, "com/android/server/pm/ScanPackageUtils.smali")
    if ".method public static setCustomSignatures(" in txt:
        txt = replace_once(
            txt,
            ".method public static setCustomSignatures(Lcom/android/internal/pm/parsing/pkg/ParsedPackage;Lcom/android/server/pm/pkg/AndroidPackage;[Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)V\n"
            "    .locals 0\n\n"
            "    invoke-static {p2, p3}, Lcom/android/server/pm/ScanPackageUtils;->signedWithCustomSignatures([Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)Z",
            ".method public static setCustomSignatures(Lcom/android/internal/pm/parsing/pkg/ParsedPackage;Lcom/android/server/pm/pkg/AndroidPackage;[Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)V\n"
            "    .locals 0\n\n"
            "    if-nez p1, :cond_app_lock_non_plat\n\n"
            "    invoke-static {p0, p1, p2, p3}, Lcom/android/server/pm/AppLockPmHelpers;->maybeNormalizePlatformPkgSignature(Lcom/android/internal/pm/parsing/pkg/ParsedPackage;Lcom/android/server/pm/pkg/AndroidPackage;[Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)Z\n\n"
            "    return-void\n\n"
            "    :cond_app_lock_non_plat\n"
            "    invoke-static {p2, p3}, Lcom/android/server/pm/ScanPackageUtils;->signedWithCustomSignatures([Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)Z",
            "ScanPackageUtils.setCustomSignatures normalize platform",
            guard="maybeNormalizePlatformPkgSignature",
        )
        write_smali(p, txt)

    # 6. LauncherAppsService$LauncherAppsImpl
    p, txt = read_smali(srv_dir, "com/android/server/pm/LauncherAppsService$LauncherAppsImpl.smali")
    if "->getAppLockInfoFlag(" not in txt:
        txt = replace_once(
            txt,
            "    :try_start_0\n"
            "    iget-object v0, p0, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->mPackageManagerInternal:Landroid/content/pm/PackageManagerInternal;\n\n"
            "    int-to-long v3, p3\n\n"
            "    invoke-virtual {p4}, Landroid/os/UserHandle;->getIdentifier()I\n\n"
            "    move-result v2\n\n"
            "    move-object v5, p2\n\n"
            "    invoke-virtual/range {v0 .. v5}, Landroid/content/pm/PackageManagerInternal;->getApplicationInfo(IIJLjava/lang/String;)Landroid/content/pm/ApplicationInfo;",
            "    :try_start_0\n"
            "    iget-object v0, p0, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->mPackageManagerInternal:Landroid/content/pm/PackageManagerInternal;\n\n"
            "    invoke-static {}, Landroid/os/Binder;->getCallingPid()I\n\n"
            "    move-result v2\n\n"
            "    invoke-virtual {p0, v1, v2}, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->getAppLockInfoFlag(II)J\n\n"
            "    move-result-wide v2\n\n"
            "    int-to-long v4, p3\n\n"
            "    or-long v3, v4, v2\n\n"
            "    invoke-virtual {p4}, Landroid/os/UserHandle;->getIdentifier()I\n\n"
            "    move-result v2\n\n"
            "    move-object v5, p2\n\n"
            "    invoke-virtual/range {v0 .. v5}, Landroid/content/pm/PackageManagerInternal;->getApplicationInfo(IIJLjava/lang/String;)Landroid/content/pm/ApplicationInfo;",
            "LAI.getApplicationInfo",
        )
        txt = replace_once(
            txt,
            "    invoke-virtual {p0}, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->injectBinderCallingPid()I\n\n"
            "    iget-object p0, p0, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->mPackageManagerInternal:Landroid/content/pm/PackageManagerInternal;\n\n"
            "    invoke-virtual {p1}, Landroid/os/UserHandle;->getIdentifier()I\n\n"
            "    move-result p1\n\n"
            "    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManagerInternal;->getInstalledApplicationsCrossUser(II)Ljava/util/List;",
            "    invoke-virtual {p0}, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->injectBinderCallingPid()I\n\n"
            "    move-result v1\n\n"
            "    invoke-virtual {p0, v0, v1}, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->getAppLockInfoFlag(II)J\n\n"
            "    move-result-wide v2\n\n"
            "    iget-object p0, p0, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->mPackageManagerInternal:Landroid/content/pm/PackageManagerInternal;\n\n"
            "    invoke-virtual {p1}, Landroid/os/UserHandle;->getIdentifier()I\n\n"
            "    move-result p1\n\n"
            "    invoke-virtual {p0, p1, v0, v2, v3}, Landroid/content/pm/PackageManagerInternal;->getInstalledApplicationsCrossUser(IIJ)Ljava/util/List;",
            "LAI.getApplicationInfoListForAllArchivedApps",
        )
        txt = ensure_method_locals_min(txt, "getApplicationInfoListForAllArchivedApps(Landroid/os/UserHandle;)Ljava/util/List;", 4)
        txt = replace_once(
            txt,
            "    iget-object v0, p0, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->mPackageManagerInternal:Landroid/content/pm/PackageManagerInternal;\n\n"
            "    invoke-virtual {p3}, Landroid/os/UserHandle;->getIdentifier()I\n\n"
            "    move-result v2\n\n"
            "    const-wide/16 v3, 0x0\n\n"
            "    move-object v5, p2\n\n"
            "    invoke-virtual/range {v0 .. v5}, Landroid/content/pm/PackageManagerInternal;->getApplicationInfo(IIJLjava/lang/String;)Landroid/content/pm/ApplicationInfo;",
            "    iget-object v0, p0, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->mPackageManagerInternal:Landroid/content/pm/PackageManagerInternal;\n\n"
            "    invoke-virtual {p0}, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->injectBinderCallingPid()I\n\n"
            "    move-result v2\n\n"
            "    invoke-virtual {p0, v1, v2}, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->getAppLockInfoFlag(II)J\n\n"
            "    move-result-wide v3\n\n"
            "    invoke-virtual {p3}, Landroid/os/UserHandle;->getIdentifier()I\n\n"
            "    move-result v2\n\n"
            "    move-object v5, p2\n\n"
            "    invoke-virtual/range {v0 .. v5}, Landroid/content/pm/PackageManagerInternal;->getApplicationInfo(IIJLjava/lang/String;)Landroid/content/pm/ApplicationInfo;",
            "LAI.getLauncherActivities_1",
        )
        txt = replace_once(
            txt,
            "    iget-object p2, p0, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->mPackageManagerInternal:Landroid/content/pm/PackageManagerInternal;\n\n"
            "    invoke-virtual {p3}, Landroid/os/UserHandle;->getIdentifier()I\n\n"
            "    move-result v0\n\n"
            "    const-wide/16 v2, 0x0\n\n"
            "    invoke-virtual {p2, v0, v1, v2, v3}, Landroid/content/pm/PackageManagerInternal;->getInstalledApplications(IIJ)Ljava/util/List;",
            "    iget-object p2, p0, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->mPackageManagerInternal:Landroid/content/pm/PackageManagerInternal;\n\n"
            "    invoke-virtual {p0}, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->injectBinderCallingPid()I\n\n"
            "    move-result v2\n\n"
            "    invoke-virtual {p0, v1, v2}, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->getAppLockInfoFlag(II)J\n\n"
            "    move-result-wide v2\n\n"
            "    invoke-virtual {p3}, Landroid/os/UserHandle;->getIdentifier()I\n\n"
            "    move-result v0\n\n"
            "    invoke-virtual {p2, v0, v1, v2, v3}, Landroid/content/pm/PackageManagerInternal;->getInstalledApplications(IIJ)Ljava/util/List;",
            "LAI.getLauncherActivities_2",
        )
        txt = ensure_method_locals_min(txt, "queryIntentLauncherActivities(Landroid/content/Intent;IILandroid/os/UserHandle;)Ljava/util/List;", 8)
        txt = replace_once(
            txt,
            "    iget-object p3, p0, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->mContext:Landroid/content/Context;\n\n"
            "    invoke-virtual {p3}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;\n\n"
            "    move-result-object p3\n\n"
            "    invoke-virtual {p1, p3}, Landroid/content/Intent;->resolveTypeIfNeeded(Landroid/content/ContentResolver;)Ljava/lang/String;\n\n"
            "    move-result-object v2\n\n"
            "    const-wide/32 v3, 0xc0000\n\n"
            "    invoke-virtual {p4}, Landroid/os/UserHandle;->getIdentifier()I\n\n"
            "    move-result v6\n\n"
            "    move-object v1, p1\n\n"
            "    move v5, p2\n\n"
            "    invoke-virtual/range {v0 .. v6}, Landroid/content/pm/PackageManagerInternal;->queryIntentActivities(Landroid/content/Intent;Ljava/lang/String;JII)Ljava/util/List;",
            "    iget-object v1, p0, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->mContext:Landroid/content/Context;\n\n"
            "    invoke-virtual {v1}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;\n\n"
            "    move-result-object v1\n\n"
            "    invoke-virtual {p1, v1}, Landroid/content/Intent;->resolveTypeIfNeeded(Landroid/content/ContentResolver;)Ljava/lang/String;\n\n"
            "    move-result-object v2\n\n"
            "    const-wide/32 v3, 0xc0000\n\n"
            "    invoke-virtual {p0, p3, p2}, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->getAppLockInfoFlag(II)J\n\n"
            "    move-result-wide v5\n\n"
            "    or-long/2addr v3, v5\n\n"
            "    invoke-virtual {p4}, Landroid/os/UserHandle;->getIdentifier()I\n\n"
            "    move-result v6\n\n"
            "    move-object v1, p1\n\n"
            "    move v5, p2\n\n"
            "    invoke-virtual/range {v0 .. v6}, Landroid/content/pm/PackageManagerInternal;->queryIntentActivities(Landroid/content/Intent;Ljava/lang/String;JII)Ljava/util/List;",
            "LAI.queryIntentLauncherActivities",
        )
        txt = ensure_method_locals_min(txt, "resolveLauncherActivityInternal(Ljava/lang/String;Landroid/content/ComponentName;Landroid/os/UserHandle;)Landroid/content/pm/LauncherActivityInfoInternal;", 9)
        txt = replace_once(
            txt,
            "    invoke-virtual {p0}, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->injectBinderCallingPid()I\n\n"
            "    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J\n\n"
            "    move-result-wide v1\n\n"
            "    :try_start_0\n"
            "    iget-object v3, p0, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->mPackageManagerInternal:Landroid/content/pm/PackageManagerInternal;\n\n"
            "    invoke-virtual {p3}, Landroid/os/UserHandle;->getIdentifier()I\n\n"
            "    move-result v4\n\n"
            "    invoke-virtual {v3, p1, v4, p2}, Landroid/content/pm/PackageManagerInternal;->getActivityInfo(IILandroid/content/ComponentName;)Landroid/content/pm/ActivityInfo;",
            "    invoke-virtual {p0}, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->injectBinderCallingPid()I\n\n"
            "    move-result v7\n\n"
            "    invoke-static {}, Landroid/os/Binder;->clearCallingIdentity()J\n\n"
            "    move-result-wide v1\n\n"
            "    :try_start_0\n"
            "    iget-object v3, p0, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->mPackageManagerInternal:Landroid/content/pm/PackageManagerInternal;\n\n"
            "    invoke-virtual {p0, p1, v7}, Lcom/android/server/pm/LauncherAppsService$LauncherAppsImpl;->getAppLockInfoFlag(II)J\n\n"
            "    move-result-wide v5\n\n"
            "    const-wide/32 v7, 0xc0000\n\n"
            "    or-long/2addr v5, v7\n\n"
            "    invoke-virtual {p3}, Landroid/os/UserHandle;->getIdentifier()I\n\n"
            "    move-result v8\n\n"
            "    move-object v4, p2\n\n"
            "    move v7, p1\n\n"
            "    invoke-virtual/range {v3 .. v8}, Landroid/content/pm/PackageManagerInternal;->getActivityInfo(Landroid/content/ComponentName;JII)Landroid/content/pm/ActivityInfo;",
            "LAI.resolveLauncherActivityInternal",
        )
    write_smali(p, txt)

    # 7. ShortcutService.<init> passes this to ShortcutService$3.<init>(ShortcutService)V
    p, txt = read_smali(srv_dir, "com/android/server/pm/ShortcutService.smali")
    txt = replace_once(
        txt,
        "    new-instance v3, Lcom/android/server/pm/ShortcutService$3;\n\n"
        "    invoke-direct {v3}, Lcom/android/internal/content/PackageMonitor;-><init>()V",
        "    new-instance v3, Lcom/android/server/pm/ShortcutService$3;\n\n"
        "    invoke-direct {v3, v0}, Lcom/android/server/pm/ShortcutService$3;-><init>(Lcom/android/server/pm/ShortcutService;)V",
        "ShortcutService.<init> ShortcutService$3",
        guard="ShortcutService$3;-><init>(Lcom/android/server/pm/ShortcutService;)V",
    )
    write_smali(p, txt)


def patch_am(srv_dir):
    p, txt = read_smali(srv_dir, "com/android/server/am/ActivityManagerService.smali")
    txt = replace_once(
        txt,
        "    new-instance v0, Lcom/android/server/am/ActivityManagerService$LocalService;\n\n"
        "    invoke-direct {v0, v1}, Lcom/android/server/am/ActivityManagerService$LocalService;-><init>(Lcom/android/server/am/ActivityManagerService;)V\n\n"
        "    iput-object v0, v1, Lcom/android/server/am/ActivityManagerService;->mInternal:Landroid/app/ActivityManagerInternal;",
        "    new-instance v0, Lcom/android/server/am/ActivityManagerService$LocalService;\n\n"
        "    invoke-direct {v0, v1}, Lcom/android/server/am/ActivityManagerService$LocalService;-><init>(Lcom/android/server/am/ActivityManagerService;)V\n\n"
        "    iput-object v0, v1, Lcom/android/server/am/ActivityManagerService;->mInternal:Landroid/app/ActivityManagerInternal;\n\n"
        "    invoke-static {v1}, Lcom/android/server/am/AppLockAmHelpers;->initAppLockLocalService(Lcom/android/server/am/ActivityManagerService;)V",
        "AMS.<init>(Context,ATMS) initAppLockLocalService",
        guard="invoke-static {v1}, Lcom/android/server/am/AppLockAmHelpers;->initAppLockLocalService",
    )
    # Also ensure test 3-arg constructor initializes mAppLockLocalService if mInternal is set there
    if "iput-object p1, p0, Lcom/android/server/am/ActivityManagerService;->mInternal:Landroid/app/ActivityManagerInternal;" in txt:
        txt = replace_once(
            txt,
            "    iput-object p1, p0, Lcom/android/server/am/ActivityManagerService;->mInternal:Landroid/app/ActivityManagerInternal;",
            "    iput-object p1, p0, Lcom/android/server/am/ActivityManagerService;->mInternal:Landroid/app/ActivityManagerInternal;\n\n"
            "    invoke-static {p0}, Lcom/android/server/am/AppLockAmHelpers;->initAppLockLocalService(Lcom/android/server/am/ActivityManagerService;)V",
            "AMS.<init>(Injector,...) initAppLockLocalService",
            guard="invoke-static {p0}, Lcom/android/server/am/AppLockAmHelpers;->initAppLockLocalService",
        )
    # Call onAmsUidChangeLocked before mPowerManagerBatch clobbers p1/p0
    txt = replace_once(
        txt,
        "    iput p3, p1, Lcom/android/server/am/UidRecord;->mLastReportedChange:I\n\n"
        "    :cond_11\n"
        "    iget-object p1, p0, Lcom/android/server/am/ActivityManagerService;->mPowerManagerBatch:Landroid/os/PowerManagerInternal$UidChangesBatch;",
        "    iput p3, p1, Lcom/android/server/am/UidRecord;->mLastReportedChange:I\n\n"
        "    :cond_11\n"
        "    invoke-static {p0, p1, p2, p3}, Lcom/android/server/am/AppLockAmHelpers;->onAmsUidChangeLocked(Lcom/android/server/am/ActivityManagerService;Lcom/android/server/am/UidRecord;II)V\n\n"
        "    iget-object p1, p0, Lcom/android/server/am/ActivityManagerService;->mPowerManagerBatch:Landroid/os/PowerManagerInternal$UidChangesBatch;",
        "AMS.enqueueUidChangeLocked",
        guard="AppLockAmHelpers;->onAmsUidChangeLocked",
    )
    write_smali(p, txt)

    p, txt = read_smali(srv_dir, "com/android/server/am/ActivityManagerService$Lifecycle.smali")
    txt = replace_once(
        txt,
        "    :cond_8\n    const/16 v1, 0x226\n\n    if-ne p1, v1, :cond_9",
        "    invoke-static {v0}, Lcom/android/server/am/AppLockAmHelpers;->onAmsBootPhase500(Lcom/android/server/am/ActivityManagerService;)V\n\n"
        "    :cond_8\n    const/16 v1, 0x226\n\n    if-ne p1, v1, :cond_9",
        "AMS$Lifecycle.onBootPhase(500)",
        guard="AppLockAmHelpers;->onAmsBootPhase500",
    )
    txt = replace_once(
        txt,
        ".method public final onStart()V\n"
        "    .locals 5\n\n"
        "    iget-object p0, p0, Lcom/android/server/am/ActivityManagerService$Lifecycle;->mService:Lcom/android/server/am/ActivityManagerService;",
        ".method public final onStart()V\n"
        "    .locals 5\n\n"
        "    iget-object p0, p0, Lcom/android/server/am/ActivityManagerService$Lifecycle;->mService:Lcom/android/server/am/ActivityManagerService;\n\n"
        "    invoke-static {p0}, Lcom/android/server/am/AppLockAmHelpers;->onAmsStart(Lcom/android/server/am/ActivityManagerService;)V",
        "AMS$Lifecycle.onStart",
        guard="AppLockAmHelpers;->onAmsStart",
    )
    write_smali(p, txt)

    p, txt = read_smali(srv_dir, "com/android/server/am/ActivityManagerService$LocalService.smali")
    txt = replace_once(
        txt,
        ".method public final onUserRemoved(I)V\n"
        "    .locals 3\n\n"
        "    iget-object p0, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;\n\n"
        "    iget-object p0, p0, Lcom/android/server/am/ActivityManagerService;->mUserController:Lcom/android/server/am/UserController;",
        ".method public final onUserRemoved(I)V\n"
        "    .locals 3\n\n"
        "    iget-object p0, p0, Lcom/android/server/am/ActivityManagerService$LocalService;->this$0:Lcom/android/server/am/ActivityManagerService;\n\n"
        "    invoke-static {p0, p1}, Lcom/android/server/am/AppLockAmHelpers;->onAmsUserRemoved(Lcom/android/server/am/ActivityManagerService;I)V\n\n"
        "    iget-object p0, p0, Lcom/android/server/am/ActivityManagerService;->mUserController:Lcom/android/server/am/UserController;",
        "AMS$LocalService.onUserRemoved",
        guard="AppLockAmHelpers;->onAmsUserRemoved",
    )
    write_smali(p, txt)


def patch_notif(srv_dir):
    # 1. NotificationManagerService
    p, txt = read_smali(srv_dir, "com/android/server/notification/NotificationManagerService.smali")
    txt = replace_once(
        txt,
        "    sget-object p0, Lcom/android/server/notification/NotificationManagerService;->ALLOWLIST_TOKEN:Landroid/os/IBinder;",
        "    invoke-static {p0}, Lcom/android/server/notification/AppLockNotifHelpers;->initNms(Lcom/android/server/notification/NotificationManagerService;)V\n\n"
        "    sget-object p0, Lcom/android/server/notification/NotificationManagerService;->ALLOWLIST_TOKEN:Landroid/os/IBinder;",
        "NMS.<init> initNms",
        guard="AppLockNotifHelpers;->initNms",
    )
    txt = replace_once(
        txt,
        "    :cond_1e\n    const/16 v2, 0x226\n\n    if-ne v0, v2, :cond_21\n\n"
        "    iget-object v0, v1, Lcom/android/server/notification/NotificationManagerService;->mSnoozeHelper:Lcom/android/server/notification/SnoozeHelper;",
        "    :cond_1e\n    const/16 v2, 0x226\n\n    if-ne v0, v2, :cond_21\n\n"
        "    invoke-static {v1}, Lcom/android/server/notification/AppLockNotifHelpers;->onNmsBootPhaseAmReady(Lcom/android/server/notification/NotificationManagerService;)V\n\n"
        "    iget-object v0, v1, Lcom/android/server/notification/NotificationManagerService;->mSnoozeHelper:Lcom/android/server/notification/SnoozeHelper;",
        "NMS.onBootPhase AM_READY",
        guard="AppLockNotifHelpers;->onNmsBootPhaseAmReady",
    )
    txt = replace_once(
        txt,
        "    :cond_8\n    :goto_5\n    if-eqz v3, :cond_9",
        "    :cond_8\n    :goto_5\n    invoke-static {p0, v1}, Lcom/android/server/notification/AppLockNotifHelpers;->markAppLockRedactedOnReconsider(Lcom/android/server/notification/NotificationManagerService;Lcom/android/server/notification/NotificationRecord;)V\n\n"
        "    if-eqz v3, :cond_9",
        "NMS.handleRankingReconsideration",
        guard="AppLockNotifHelpers;->markAppLockRedactedOnReconsider",
    )
    if "AppLockNotifHelpers;->redactShortcutForAppLock" not in txt:
        txt = ensure_method_locals_min(txt, "makeRankingUpdateLocked(Lcom/android/server/notification/ManagedServices$ManagedServiceInfo;)Landroid/service/notification/NotificationRankingUpdate;", 42)
        txt = replace_once(
            txt,
            "    iget-object v0, v6, Lcom/android/server/notification/NotificationRecord;->mShortcutInfo:Landroid/content/pm/ShortcutInfo;\n\n"
            "    move-object/from16 v32, v0",
            "    iget-object v0, v6, Lcom/android/server/notification/NotificationRecord;->mShortcutInfo:Landroid/content/pm/ShortcutInfo;\n\n"
            "    move-object/from16 v38, p0\n\n"
            "    move-object/from16 v39, v6\n\n"
            "    move-object/from16 v40, p1\n\n"
            "    move-object/from16 v41, v0\n\n"
            "    invoke-static/range {v38 .. v41}, Lcom/android/server/notification/AppLockNotifHelpers;->redactShortcutForAppLock(Lcom/android/server/notification/NotificationManagerService;Lcom/android/server/notification/NotificationRecord;Lcom/android/server/notification/ManagedServices$ManagedServiceInfo;Landroid/content/pm/ShortcutInfo;)Landroid/content/pm/ShortcutInfo;\n\n"
            "    move-result-object v0\n\n"
            "    move-object/from16 v32, v0",
            "NMS.makeRankingUpdateLocked",
        )
    if "AppLockNotifHelpers;->getHistoryNotificationForAppLock" not in txt:
        txt = replace_once(
            txt,
            "    iget-object v6, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;\n\n"
            "    invoke-virtual {v6}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;\n\n"
            "    move-result-object v6\n\n"
            "    invoke-virtual {p0, v5, v6}, Lcom/android/server/notification/NotificationManagerService;->getHistoryTitle(Landroid/content/Context;Landroid/app/Notification;)Ljava/lang/String;",
            "    invoke-static {p0, p1}, Lcom/android/server/notification/AppLockNotifHelpers;->getHistoryNotificationForAppLock(Lcom/android/server/notification/NotificationManagerService;Lcom/android/server/notification/NotificationRecord;)Landroid/app/Notification;\n\n"
            "    move-result-object v6\n\n"
            "    invoke-virtual {p0, v5, v6}, Lcom/android/server/notification/NotificationManagerService;->getHistoryTitle(Landroid/content/Context;Landroid/app/Notification;)Ljava/lang/String;",
            "NMS.maybeRecordInterruptionLocked title",
        )
        txt = replace_once(
            txt,
            "    iget-object v6, p1, Lcom/android/server/notification/NotificationRecord;->sbn:Landroid/service/notification/StatusBarNotification;\n\n"
            "    invoke-virtual {v6}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;\n\n"
            "    move-result-object v6\n\n"
            "    invoke-static {v5, v6}, Lcom/android/server/notification/NotificationManagerService;->getHistoryText(Landroid/content/Context;Landroid/app/Notification;)Ljava/lang/String;",
            "    invoke-static {p0, p1}, Lcom/android/server/notification/AppLockNotifHelpers;->getHistoryNotificationForAppLock(Lcom/android/server/notification/NotificationManagerService;Lcom/android/server/notification/NotificationRecord;)Landroid/app/Notification;\n\n"
            "    move-result-object v6\n\n"
            "    invoke-static {v5, v6}, Lcom/android/server/notification/NotificationManagerService;->getHistoryText(Landroid/content/Context;Landroid/app/Notification;)Ljava/lang/String;",
            "NMS.maybeRecordInterruptionLocked text",
        )
    write_smali(p, txt)

    # 2. NotificationAttentionHelper
    p, txt = read_smali(srv_dir, "com/android/server/notification/NotificationAttentionHelper.smali")
    txt = replace_once(
        txt,
        "    invoke-virtual {v2, v1}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V\n\n"
        "    iget v1, p1, Lcom/android/server/notification/NotificationRecord;->mPackageVisibility:I",
        "    invoke-virtual {v2, v1}, Landroid/view/accessibility/AccessibilityEvent;->setClassName(Ljava/lang/CharSequence;)V\n\n"
        "    iget-object v1, p0, Lcom/android/server/notification/NotificationAttentionHelper;->mContext:Landroid/content/Context;\n\n"
        "    invoke-static {v1, p1, v0}, Lcom/android/server/notification/AppLockNotifHelpers;->getA11yRedactedNotification(Landroid/content/Context;Lcom/android/server/notification/NotificationRecord;Landroid/app/Notification;)Landroid/app/Notification;\n\n"
        "    move-result-object v0\n\n"
        "    iget-boolean v1, p1, Lcom/android/server/notification/NotificationRecord;->mAppLockRedacted:Z\n\n"
        "    if-eqz v1, :cond_app_lock_a11y\n\n"
        "    const/4 v3, 0x1\n\n"
        "    invoke-virtual {v2, v0}, Landroid/view/accessibility/AccessibilityEvent;->setParcelableData(Landroid/os/Parcelable;)V\n\n"
        "    goto :goto_0\n\n"
        "    :cond_app_lock_a11y\n"
        "    iget v1, p1, Lcom/android/server/notification/NotificationRecord;->mPackageVisibility:I",
        "NAH.sendAccessibilityEvent",
        guard="AppLockNotifHelpers;->getA11yRedactedNotification",
    )
    write_smali(p, txt)

    # 3. NMS$4 (AI Nudge check)
    p, txt = read_smali(srv_dir, "com/android/server/notification/NotificationManagerService$4.smali")
    txt = replace_once(
        txt,
        "    sget-boolean p2, Lcom/android/server/notification/NmRune;->NM_SUPPORT_AI_NOTIFICATION_NUDGE:Z\n\n"
        "    if-eqz p2, :cond_a\n\n"
        "    if-eqz p3, :cond_a",
        "    sget-boolean p2, Lcom/android/server/notification/NmRune;->NM_SUPPORT_AI_NOTIFICATION_NUDGE:Z\n\n"
        "    if-eqz p2, :cond_a\n\n"
        "    if-eqz p3, :cond_a\n\n"
        "    iget-object p2, p0, Lcom/android/server/notification/NotificationManagerService$4;->this$0:Lcom/android/server/notification/NotificationManagerService;\n\n"
        "    invoke-static {p2, p1}, Lcom/android/server/notification/AppLockNotifHelpers;->shouldAllowAiNudgeForAppLock(Lcom/android/server/notification/NotificationManagerService;Lcom/android/server/notification/NotificationRecord;)Z\n\n"
        "    move-result p2\n\n"
        "    if-eqz p2, :cond_a",
        "NMS$4.onNotificationExpansionChanged",
        guard="AppLockNotifHelpers;->shouldAllowAiNudgeForAppLock",
    )
    write_smali(p, txt)

    # 4. NMS$NotificationListeners (notifyRemovedLocked + prepareNotifyPostedLocked)
    p, txt = read_smali(srv_dir, "com/android/server/notification/NotificationManagerService$NotificationListeners.smali")
    txt = replace_once(
        txt,
        "    if-nez v11, :cond_5\n\n"
        "    if-eqz v6, :cond_5\n\n"
        "    invoke-virtual {v0, v3}, Lcom/android/server/notification/NotificationManagerService$NotificationListeners;->redactSbnForOtp(Landroid/service/notification/StatusBarNotification;)Landroid/service/notification/StatusBarNotification;\n\n"
        "    move-result-object v11",
        "    if-nez v11, :cond_5\n\n"
        "    invoke-virtual {v0, v3}, Lcom/android/server/notification/NotificationManagerService$NotificationListeners;->shouldCreateAppLockRedactedSbn(Landroid/service/notification/StatusBarNotification;)Z\n\n"
        "    move-result v14\n\n"
        "    if-eqz v14, :cond_app_lock_otp_rm\n\n"
        "    invoke-virtual {v0, v3}, Lcom/android/server/notification/NotificationManagerService$NotificationListeners;->redactSbnForAppLock(Landroid/service/notification/StatusBarNotification;)Landroid/service/notification/StatusBarNotification;\n\n"
        "    move-result-object v11\n\n"
        "    goto :goto_app_lock_rm\n\n"
        "    :cond_app_lock_otp_rm\n"
        "    if-eqz v6, :cond_5\n\n"
        "    invoke-virtual {v0, v3}, Lcom/android/server/notification/NotificationManagerService$NotificationListeners;->redactSbnForOtp(Landroid/service/notification/StatusBarNotification;)Landroid/service/notification/StatusBarNotification;\n\n"
        "    move-result-object v11\n\n"
        "    :goto_app_lock_rm",
        "NL.notifyRemovedLocked",
        guard="->redactSbnForAppLock(",
    )
    if "AppLockNotifHelpers;->redactOrKeepForPosted" not in txt:
        txt = txt.replace(
            "->redactSbnForOtp(Landroid/service/notification/StatusBarNotification;)Landroid/service/notification/StatusBarNotification;",
            "->AppLockRedactSentinel_TEMP;",
        )
        # In prepareNotifyPostedLocked, replace all 3 calls with AppLockNotifHelpers.redactOrKeepForPosted
        txt = replace_once(
            txt,
            "    invoke-virtual {v0, v3}, Lcom/android/server/notification/NotificationManagerService$NotificationListeners;->AppLockRedactSentinel_TEMP;",
            "    invoke-virtual {v0, v3}, Lcom/android/server/notification/NotificationManagerService$NotificationListeners;->redactSbnForOtp(Landroid/service/notification/StatusBarNotification;)Landroid/service/notification/StatusBarNotification;",
            "restore notifyRemovedLocked redactSbnForOtp",
        )
        old_v6 = "    invoke-virtual {v0, v6}, Lcom/android/server/notification/NotificationManagerService$NotificationListeners;->AppLockRedactSentinel_TEMP;"
        new_v6 = "    invoke-static {v0, v6}, Lcom/android/server/notification/AppLockNotifHelpers;->redactOrKeepForPosted(Lcom/android/server/notification/NotificationManagerService$NotificationListeners;Landroid/service/notification/StatusBarNotification;)Landroid/service/notification/StatusBarNotification;"
        if txt.count(old_v6) != 2:
            raise RuntimeError(f"[NL.prepareNotifyPostedLocked v6] expected 2 matches, got {txt.count(old_v6)}")
        txt = txt.replace(old_v6, new_v6)
        txt = replace_once(
            txt,
            "    invoke-virtual {v0, v9}, Lcom/android/server/notification/NotificationManagerService$NotificationListeners;->AppLockRedactSentinel_TEMP;",
            "    invoke-static {v0, v9}, Lcom/android/server/notification/AppLockNotifHelpers;->redactOrKeepForPosted(Lcom/android/server/notification/NotificationManagerService$NotificationListeners;Landroid/service/notification/StatusBarNotification;)Landroid/service/notification/StatusBarNotification;",
            "NL.prepareNotifyPostedLocked v9",
        )
        if "AppLockRedactSentinel_TEMP" in txt:
            raise RuntimeError("Leftover AppLockRedactSentinel_TEMP in NMS$NotificationListeners")
        txt = replace_once(
            txt,
            "    iget-boolean v12, v5, Lcom/android/server/notification/NotificationManagerService;->mRedactOtpNotifications:Z\n\n"
            "    invoke-virtual {v0}, Lcom/android/server/notification/ManagedServices;->getServices()Ljava/util/List;",
            "    iget-boolean v12, v5, Lcom/android/server/notification/NotificationManagerService;->mRedactOtpNotifications:Z\n\n"
            "    invoke-virtual {v0, v6}, Lcom/android/server/notification/NotificationManagerService$NotificationListeners;->shouldCreateAppLockRedactedSbn(Landroid/service/notification/StatusBarNotification;)Z\n\n"
            "    move-result v14\n\n"
            "    invoke-virtual {v6}, Landroid/service/notification/StatusBarNotification;->getNotification()Landroid/app/Notification;\n\n"
            "    move-result-object v15\n\n"
            "    if-eqz v15, :cond_app_lock_no_extras\n\n"
            "    iget-object v15, v15, Landroid/app/Notification;->extras:Landroid/os/Bundle;\n\n"
            "    if-eqz v15, :cond_app_lock_no_extras\n\n"
            "    const-string/jumbo v7, \"android.appLock.redaction\"\n\n"
            "    invoke-virtual {v15, v7, v14}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V\n\n"
            "    const/4 v7, 0x0\n\n"
            "    :cond_app_lock_no_extras\n"
            "    invoke-virtual {v0}, Lcom/android/server/notification/ManagedServices;->getServices()Ljava/util/List;",
            "NL.prepareNotifyPostedLocked redaction extra",
        )
    write_smali(p, txt)

    # 5. NMS$NL$2 (edge lighting + mAppLockRedacted)
    p, txt = read_smali(srv_dir, "com/android/server/notification/NotificationManagerService$NotificationListeners$2.smali")
    txt = replace_once(
        txt,
        "    iget-object v2, v1, Lcom/android/server/notification/NotificationManagerService$NotificationListeners$2;->this$1:Ljava/lang/Object;\n\n"
        "    check-cast v2, Lcom/android/server/notification/NotificationManagerService;\n\n"
        "    iget-object v2, v2, Lcom/android/server/notification/NotificationManagerService;->mEdgeLightingManager:Lcom/android/server/notification/sec/edgelighting/EdgeLightingManager;\n\n"
        "    move-object/from16 v3, v17\n\n"
        "    invoke-virtual {v2, v3, v0}, Lcom/android/server/notification/sec/edgelighting/EdgeLightingManager;->showForNotification(Landroid/service/notification/StatusBarNotification;Landroid/os/Bundle;)Z",
        "    iget-object v2, v1, Lcom/android/server/notification/NotificationManagerService$NotificationListeners$2;->this$1:Ljava/lang/Object;\n\n"
        "    check-cast v2, Lcom/android/server/notification/NotificationManagerService;\n\n"
        "    move-object/from16 v3, v17\n\n"
        "    invoke-static {v2, v3}, Lcom/android/server/notification/AppLockNotifHelpers;->maybeRedactSbnForAppLock(Lcom/android/server/notification/NotificationManagerService;Landroid/service/notification/StatusBarNotification;)Landroid/service/notification/StatusBarNotification;\n\n"
        "    move-result-object v3\n\n"
        "    iget-object v2, v2, Lcom/android/server/notification/NotificationManagerService;->mEdgeLightingManager:Lcom/android/server/notification/sec/edgelighting/EdgeLightingManager;\n\n"
        "    invoke-virtual {v2, v3, v0}, Lcom/android/server/notification/sec/edgelighting/EdgeLightingManager;->showForNotification(Landroid/service/notification/StatusBarNotification;Landroid/os/Bundle;)Z",
        "NL$2 EdgeLighting",
        guard="AppLockNotifHelpers;->maybeRedactSbnForAppLock",
    )
    txt = replace_once(
        txt,
        "    invoke-static {v4, v14}, Lcom/android/server/notification/NotificationManagerService;->-$$Nest$misCritical(Lcom/android/server/notification/NotificationManagerService;Lcom/android/server/notification/NotificationRecord;)Z",
        "    invoke-static {v4, v14}, Lcom/android/server/notification/AppLockNotifHelpers;->markAppLockRedactedOnReconsider(Lcom/android/server/notification/NotificationManagerService;Lcom/android/server/notification/NotificationRecord;)V\n\n"
        "    invoke-static {v4, v14}, Lcom/android/server/notification/NotificationManagerService;->-$$Nest$misCritical(Lcom/android/server/notification/NotificationManagerService;Lcom/android/server/notification/NotificationRecord;)Z",
        "NL$2 markAppLockRedacted",
        guard="AppLockNotifHelpers;->markAppLockRedactedOnReconsider",
    )
    write_smali(p, txt)

    # 6. NMS$Stub (getAppActiveNotifications + getHistoricalNotificationsWithAttribution)
    p, txt = read_smali(srv_dir, "com/android/server/notification/NotificationManagerService$Stub.smali")
    txt = replace_once(
        txt,
        "    invoke-static {v7, p1, v4}, Lcom/android/server/notification/NotificationManagerService$Stub;->sanitizeSbn(Ljava/lang/String;ILandroid/service/notification/StatusBarNotification;)Landroid/service/notification/StatusBarNotification;\n\n"
        "    move-result-object v4",
        "    invoke-static {v7, p1, v4}, Lcom/android/server/notification/NotificationManagerService$Stub;->sanitizeSbn(Ljava/lang/String;ILandroid/service/notification/StatusBarNotification;)Landroid/service/notification/StatusBarNotification;\n\n"
        "    move-result-object v4\n\n"
        "    iget-object v5, p0, Lcom/android/server/notification/NotificationManagerService$Stub;->this$0:Lcom/android/server/notification/NotificationManagerService;\n\n"
        "    invoke-static {v5, v4}, Lcom/android/server/notification/AppLockNotifHelpers;->maybeRedactSbnForAppLock(Lcom/android/server/notification/NotificationManagerService;Landroid/service/notification/StatusBarNotification;)Landroid/service/notification/StatusBarNotification;\n\n"
        "    move-result-object v4",
        "NMS$Stub.getAppActiveNotifications",
        guard="NotificationManagerService$Stub;->sanitizeSbn(Ljava/lang/String;ILandroid/service/notification/StatusBarNotification;)Landroid/service/notification/StatusBarNotification;\n\n    move-result-object v4\n\n    iget-object v5, p0, Lcom/android/server/notification/NotificationManagerService$Stub;->this$0:",
    )
    txt = replace_once(
        txt,
        "    :try_start_0\n"
        "    iget-object p0, p0, Lcom/android/server/notification/NotificationManagerService$Stub;->this$0:Lcom/android/server/notification/NotificationManagerService;\n\n"
        "    iget-object p2, p0, Lcom/android/server/notification/NotificationManagerService;->mArchive:Lcom/android/server/notification/NotificationManagerService$Archive;\n\n"
        "    iget-object p0, p0, Lcom/android/server/notification/NotificationManagerService;->mUm:Landroid/os/UserManager;\n\n"
        "    invoke-virtual {p2, p0, p3, p4}, Lcom/android/server/notification/NotificationManagerService$Archive;->getArray(Landroid/os/UserManager;IZ)[Landroid/service/notification/StatusBarNotification;\n\n"
        "    move-result-object p0\n\n"
        "    monitor-exit p1\n\n"
        "    return-object p0",
        "    :try_start_0\n"
        "    iget-object v0, p0, Lcom/android/server/notification/NotificationManagerService$Stub;->this$0:Lcom/android/server/notification/NotificationManagerService;\n\n"
        "    iget-object p2, v0, Lcom/android/server/notification/NotificationManagerService;->mArchive:Lcom/android/server/notification/NotificationManagerService$Archive;\n\n"
        "    iget-object p0, v0, Lcom/android/server/notification/NotificationManagerService;->mUm:Landroid/os/UserManager;\n\n"
        "    invoke-virtual {p2, p0, p3, p4}, Lcom/android/server/notification/NotificationManagerService$Archive;->getArray(Landroid/os/UserManager;IZ)[Landroid/service/notification/StatusBarNotification;\n\n"
        "    move-result-object p0\n\n"
        "    monitor-exit p1\n\n"
        "    if-eqz p0, :cond_app_lock_hist_done\n\n"
        "    array-length v1, p0\n\n"
        "    const/4 v2, 0x0\n\n"
        "    :goto_app_lock_hist\n"
        "    if-ge v2, v1, :cond_app_lock_hist_done\n\n"
        "    aget-object v3, p0, v2\n\n"
        "    invoke-static {v0, v3}, Lcom/android/server/notification/AppLockNotifHelpers;->maybeRedactSbnForAppLock(Lcom/android/server/notification/NotificationManagerService;Landroid/service/notification/StatusBarNotification;)Landroid/service/notification/StatusBarNotification;\n\n"
        "    move-result-object v3\n\n"
        "    aput-object v3, p0, v2\n\n"
        "    add-int/lit8 v2, v2, 0x1\n\n"
        "    goto :goto_app_lock_hist\n\n"
        "    :cond_app_lock_hist_done\n"
        "    return-object p0",
        "NMS$Stub.getHistoricalNotificationsWithAttribution",
        guard=":cond_app_lock_hist_done",
    )
    write_smali(p, txt)


def patch_wm(srv_dir):
    # 1. WindowManagerService
    p, txt = read_smali(srv_dir, "com/android/server/wm/WindowManagerService.smali")
    txt = replace_once(
        txt,
        "    new-instance v0, Lcom/android/server/wm/DeferStartProcessController;",
        "    invoke-static {v1}, Lcom/android/server/wm/AppLockWmHelpers;->initWmsAppLock(Lcom/android/server/wm/WindowManagerService;)V\n\n"
        "    new-instance v0, Lcom/android/server/wm/DeferStartProcessController;",
        "WMS.<init> initWmsAppLock",
        guard="AppLockWmHelpers;->initWmsAppLock",
    )
    txt = replace_once(
        txt,
        "    iget-object v0, v1, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;\n\n"
        "    invoke-interface/range {p2 .. p2}, Landroid/view/IWindow;->asBinder()Landroid/os/IBinder;\n\n"
        "    move-result-object v2\n\n"
        "    invoke-virtual {v0, v2, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n\n"
        "    invoke-virtual {v8}, Lcom/android/server/wm/WindowState;->initAppOpsState()V",
        "    iget-object v0, v1, Lcom/android/server/wm/WindowManagerService;->mWindowMap:Ljava/util/HashMap;\n\n"
        "    invoke-interface/range {p2 .. p2}, Landroid/view/IWindow;->asBinder()Landroid/os/IBinder;\n\n"
        "    move-result-object v2\n\n"
        "    invoke-virtual {v0, v2, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;\n\n"
        "    invoke-static {v1, v8}, Lcom/android/server/wm/AppLockWmHelpers;->onWmsAddWindowBiometric(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/WindowState;)V\n\n"
        "    invoke-static {v1, v8}, Lcom/android/server/wm/AppLockWmHelpers;->updateWindowHiddenByAppLock(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/WindowState;)V\n\n"
        "    invoke-virtual {v8}, Lcom/android/server/wm/WindowState;->initAppOpsState()V",
        "WMS.addWindow",
        guard="AppLockWmHelpers;->onWmsAddWindowBiometric",
    )
    txt = replace_once(
        txt,
        ".method public final systemReady()V\n    .locals 14",
        ".method public final systemReady()V\n    .locals 14\n\n"
        "    invoke-static {p0}, Lcom/android/server/wm/AppLockWmHelpers;->onWmsSystemReady(Lcom/android/server/wm/WindowManagerService;)V",
        "WMS.systemReady onWmsSystemReady",
        guard="AppLockWmHelpers;->onWmsSystemReady",
    )
    txt = replace_once(
        txt,
        "    invoke-virtual {v0, v2}, Lcom/android/server/wm/TspStateController;->updateWindowPolicy(Lcom/android/server/wm/WindowState;)V\n\n"
        "    :cond_2b\n"
        "    :goto_12\n"
        "    if-eqz v12, :cond_32",
        "    invoke-virtual {v0, v2}, Lcom/android/server/wm/TspStateController;->updateWindowPolicy(Lcom/android/server/wm/WindowState;)V\n\n"
        "    :cond_2b\n"
        "    :goto_12\n"
        "    invoke-static {v1}, Lcom/android/server/wm/AppLockWmHelpers;->onWmsUpdateFocus(Lcom/android/server/wm/WindowManagerService;)V\n\n"
        "    if-eqz v12, :cond_32",
        "WMS.updateFocusedWindowLocked",
        guard="AppLockWmHelpers;->onWmsUpdateFocus",
    )
    write_smali(p, txt)

    # 2. WindowState
    p, txt = read_smali(srv_dir, "com/android/server/wm/WindowState.smali")
    txt = replace_once(
        txt,
        "    iput-boolean v1, v3, Lcom/android/server/wm/MultiTaskingAppCompatSizeCompatModePolicy;->mAvoidAppCompatDisplayInsets:Z\n\n"
        "    :cond_19",
        "    iput-boolean v1, v3, Lcom/android/server/wm/MultiTaskingAppCompatSizeCompatModePolicy;->mAvoidAppCompatDisplayInsets:Z\n\n"
        "    invoke-static {p0}, Lcom/android/server/wm/AppLockWmHelpers;->onWindowStateRemoved(Lcom/android/server/wm/WindowState;)V\n\n"
        "    :cond_19",
        "WindowState.removeImmediately",
        guard="AppLockWmHelpers;->onWindowStateRemoved",
    )
    txt = replace_once(
        txt,
        "    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mAppOpVisibility:Z\n\n"
        "    if-nez v0, :cond_2\n\n"
        "    goto :goto_0\n\n"
        "    :cond_2",
        "    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mAppOpVisibility:Z\n\n"
        "    if-nez v0, :cond_2\n\n"
        "    goto :goto_0\n\n"
        "    :cond_2\n"
        "    iget-boolean v0, p0, Lcom/android/server/wm/WindowState;->mHiddenWhileLockedByAppLock:Z\n\n"
        "    if-eqz v0, :cond_app_lock_ws_show\n\n"
        "    goto :goto_0\n\n"
        "    :cond_app_lock_ws_show",
        "WindowState.show",
        guard=":cond_app_lock_ws_show",
    )
    txt = replace_once(
        txt,
        "    const-string v2, \" mHiddenWhileLockedByAppLock=false mIsForceHiddenNonSystemOverlayWindow=\"",
        "    const-string v2, \" mHiddenWhileLockedByAppLock=\"\n\n"
        "    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;\n\n"
        "    iget-boolean v2, p0, Lcom/android/server/wm/WindowState;->mHiddenWhileLockedByAppLock:Z\n\n"
        "    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;\n\n"
        "    const-string v2, \" mIsForceHiddenNonSystemOverlayWindow=\"",
        "WindowState.dump",
        guard="->mHiddenWhileLockedByAppLock:Z\n\n    invoke-virtual {v1, v2}",
    )
    write_smali(p, txt)
    p, txt = read_smali(srv_dir, "com/android/server/wm/DisplayContent.smali")
    m_dc = re.search(r"(\.method public final setFocusedApp\(Lcom/android/server/wm/ActivityRecord;\)Z.*?\.end method)", txt, re.S)
    if not m_dc:
        raise RuntimeError("Missing DisplayContent.setFocusedApp")
    b = m_dc.group(1)
    if "AppLockWmHelpers;->onDisplayFocusedAppChanged" not in b:
        b2 = replace_once(
            b,
            "    iput-object p1, p0, Lcom/android/server/wm/DisplayContent;->mFocusedApp:Lcom/android/server/wm/ActivityRecord;",
            "    iget-object v4, p0, Lcom/android/server/wm/DisplayContent;->mFocusedApp:Lcom/android/server/wm/ActivityRecord;\n\n"
            "    iput-object p1, p0, Lcom/android/server/wm/DisplayContent;->mFocusedApp:Lcom/android/server/wm/ActivityRecord;\n\n"
            "    invoke-static {p0, p1, v4}, Lcom/android/server/wm/AppLockWmHelpers;->onDisplayFocusedAppChanged(Lcom/android/server/wm/DisplayContent;Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/ActivityRecord;)V",
            "DisplayContent.setFocusedApp",
        )
        txt = txt.replace(b, b2, 1)
    write_smali(p, txt)

    # 4. ActivityRecord
    p, txt = read_smali(srv_dir, "com/android/server/wm/ActivityRecord.smali")
    txt = replace_once(
        txt,
        "    iput-boolean v8, v0, Lcom/android/server/wm/ActivityRecord;->inHistory:Z",
        "    iput-boolean v8, v0, Lcom/android/server/wm/ActivityRecord;->inHistory:Z\n\n"
        "    invoke-static {v0}, Lcom/android/server/wm/AppLockWmHelpers;->onActivityRecordInitExtras(Lcom/android/server/wm/ActivityRecord;)V",
        "ActivityRecord.<init>",
        guard="AppLockWmHelpers;->onActivityRecordInitExtras",
    )
    txt = replace_once(
        txt,
        "    if-nez p0, :cond_1\n\n    return-void\n\n    :cond_1\n    iget-boolean v0, p0, Lcom/android/server/wm/ActivityRecord;->mHandleExitSplashScreen:Z",
        "    if-nez p0, :cond_1\n\n    return-void\n\n    :cond_1\n"
        "    iget-object v0, p0, Lcom/android/server/wm/WindowContainer;->mWmService:Lcom/android/server/wm/WindowManagerService;\n\n"
        "    invoke-static {v0, p0}, Lcom/android/server/wm/AppLockWmHelpers;->canDeferEnterAnimationForSplitAppLock(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)Z\n\n"
        "    iget-boolean v0, p0, Lcom/android/server/wm/ActivityRecord;->mHandleExitSplashScreen:Z",
        "ActivityRecord.activityResumedLocked",
        guard="activityResumedLocked_canDefer",
    )
    txt = txt.replace(
        "    invoke-static {v0, p0}, Lcom/android/server/wm/AppLockWmHelpers;->canDeferEnterAnimationForSplitAppLock(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)Z\n\n"
        "    iget-boolean v0, p0, Lcom/android/server/wm/ActivityRecord;->mHandleExitSplashScreen:Z",
        "    invoke-static {v0, p0}, Lcom/android/server/wm/AppLockWmHelpers;->canDeferEnterAnimationForSplitAppLock(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)Z\n\n"
        "    # activityResumedLocked_canDefer\n"
        "    iget-boolean v0, p0, Lcom/android/server/wm/ActivityRecord;->mHandleExitSplashScreen:Z",
        1,
    )
    txt = replace_once(
        txt,
        "    const/4 v1, 0x0\n\n    iput-boolean v1, p0, Lcom/android/server/wm/ActivityRecord;->mEnteringAnimation:Z\n\n    :try_start_0\n    iget-object v1, p0, Lcom/android/server/wm/WindowToken;->token:Landroid/os/IBinder;\n\n    invoke-interface {v0, v1}, Landroid/app/IApplicationThread;->scheduleEnterAnimationComplete(Landroid/os/IBinder;)V",
        "    iget-object v1, p0, Lcom/android/server/wm/WindowContainer;->mWmService:Lcom/android/server/wm/WindowManagerService;\n\n"
        "    invoke-static {v1, p0}, Lcom/android/server/wm/AppLockWmHelpers;->canDeferEnterAnimationForSplitAppLock(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)Z\n\n"
        "    move-result v1\n\n"
        "    if-eqz v1, :cond_app_lock_enter_anim\n\n"
        "    return-void\n\n"
        "    :cond_app_lock_enter_anim\n"
        "    const/4 v1, 0x0\n\n    iput-boolean v1, p0, Lcom/android/server/wm/ActivityRecord;->mEnteringAnimation:Z\n\n    :try_start_0\n    iget-object v1, p0, Lcom/android/server/wm/WindowToken;->token:Landroid/os/IBinder;\n\n    invoke-interface {v0, v1}, Landroid/app/IApplicationThread;->scheduleEnterAnimationComplete(Landroid/os/IBinder;)V",
        "ActivityRecord.scheduleEnterAnimationCompleteIfNeeded",
        guard=":cond_app_lock_enter_anim",
    )
    txt = replace_once(
        txt,
        "    :cond_2\n"
        "    const-string/jumbo v0, \"makeInvisible\"\n\n"
        "    invoke-virtual {p0, v0, v2}, Lcom/android/server/wm/ActivityRecord;->addToStopping(Ljava/lang/String;Z)V",
        "    :cond_2\n"
        "    iget-boolean v0, p0, Lcom/android/server/wm/ActivityRecord;->mEnterPipOnStopForAppLock:Z\n\n"
        "    if-eqz v0, :cond_app_lock_add_stop\n\n"
        "    const/4 v0, 0x0\n\n"
        "    invoke-virtual {p0, v0}, Lcom/android/server/wm/ActivityRecord;->enterPipOnStopForAppLock(Lcom/android/server/wm/ActivityRecord;)Z\n\n"
        "    move-result v0\n\n"
        "    if-eqz v0, :cond_app_lock_add_stop\n\n"
        "    return-void\n\n"
        "    :cond_app_lock_add_stop\n"
        "    const-string/jumbo v0, \"makeInvisible\"\n\n"
        "    invoke-virtual {p0, v0, v2}, Lcom/android/server/wm/ActivityRecord;->addToStopping(Ljava/lang/String;Z)V",
        "ActivityRecord.makeInvisible",
        guard=":cond_app_lock_add_stop",
    )
    txt = replace_once(
        txt,
        "    :cond_3\n    :goto_0\n    const/4 v0, 0x1\n\n    invoke-virtual {p0, v0}, Lcom/android/server/wm/ActivityRecord;->setVisibility(Z)V",
        "    :cond_3\n    :goto_0\n"
        "    iget-object v0, p0, Lcom/android/server/wm/WindowContainer;->mWmService:Lcom/android/server/wm/WindowManagerService;\n\n"
        "    invoke-static {v0, p0}, Lcom/android/server/wm/AppLockWmHelpers;->isActivityLockedByAppLock(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)Z\n\n"
        "    move-result v1\n\n"
        "    if-eqz v1, :cond_app_lock_make_vis\n\n"
        "    invoke-static {v0, p0}, Lcom/android/server/wm/AppLockWmHelpers;->addLockedByAppLockActivityOverlay(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)V\n\n"
        "    return-void\n\n"
        "    :cond_app_lock_make_vis\n"
        "    const/4 v0, 0x1\n\n    invoke-virtual {p0, v0}, Lcom/android/server/wm/ActivityRecord;->setVisibility(Z)V",
        "ActivityRecord.makeVisibleIfNeeded",
        guard=":cond_app_lock_make_vis",
    )
    txt = replace_once(
        txt,
        "    iget-object p1, p0, Lcom/android/server/wm/WindowContainer;->mWmService:Lcom/android/server/wm/WindowManagerService;\n\n"
        "    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;\n\n"
        "    iget-object p1, p0, Lcom/android/server/wm/ActivityRecord;->mTaskSupervisor:Lcom/android/server/wm/ActivityTaskSupervisor;",
        "    iget-object p1, p0, Lcom/android/server/wm/WindowContainer;->mWmService:Lcom/android/server/wm/WindowManagerService;\n\n"
        "    invoke-static {p1, p0}, Lcom/android/server/wm/AppLockWmHelpers;->isActivityLockedByAppLock(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)Z\n\n"
        "    move-result p1\n\n"
        "    if-eqz p1, :cond_app_lock_should_active\n\n"
        "    goto :goto_0\n\n"
        "    :cond_app_lock_should_active\n"
        "    iget-object p1, p0, Lcom/android/server/wm/WindowContainer;->mWmService:Lcom/android/server/wm/WindowManagerService;\n\n"
        "    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;\n\n"
        "    iget-object p1, p0, Lcom/android/server/wm/ActivityRecord;->mTaskSupervisor:Lcom/android/server/wm/ActivityTaskSupervisor;",
        "ActivityRecord.shouldMakeActive",
        guard=":cond_app_lock_should_active",
    )
    txt = replace_once(
        txt,
        "    :cond_3\n    const/4 v5, 0x0\n\n    const/4 v6, 0x0\n\n    if-eqz p5, :cond_8",
        "    :cond_3\n"
        "    iget-object v0, p0, Lcom/android/server/wm/WindowContainer;->mWmService:Lcom/android/server/wm/WindowManagerService;\n\n"
        "    invoke-static {v0, p0}, Lcom/android/server/wm/AppLockWmHelpers;->isActivityLockedByAppLock(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)Z\n\n"
        "    move-result v0\n\n"
        "    if-eqz v0, :cond_app_lock_sw\n\n"
        "    return-void\n\n"
        "    :cond_app_lock_sw\n"
        "    const/4 v5, 0x0\n\n    const/4 v6, 0x0\n\n    if-eqz p5, :cond_8",
        "ActivityRecord.showStartingWindow",
        guard=":cond_app_lock_sw",
    )
    write_smali(p, txt)

    # 5. Task
    p, txt = read_smali(srv_dir, "com/android/server/wm/Task.smali")
    txt = replace_once(
        txt,
        "    if-eqz v0, :cond_6\n\n"
        "    iget-object v0, p1, Lcom/android/server/wm/WindowContainer;->mTransitionController:Lcom/android/server/wm/TransitionController;\n\n"
        "    invoke-virtual {p0}, Lcom/android/server/wm/ActivityRecord;->getRootTask()Lcom/android/server/wm/Task;\n\n"
        "    move-result-object v3\n\n"
        "    invoke-virtual {v0, v3}, Lcom/android/server/wm/TransitionController;->isTransientHide(Lcom/android/server/wm/Task;)Z\n\n"
        "    move-result v0\n\n"
        "    if-eqz v0, :cond_6\n\n"
        "    move v0, v2\n\n"
        "    goto :goto_1",
        "    if-eqz v0, :cond_6\n\n"
        "    iget-object v0, p1, Lcom/android/server/wm/WindowContainer;->mTransitionController:Lcom/android/server/wm/TransitionController;\n\n"
        "    invoke-virtual {p0}, Lcom/android/server/wm/ActivityRecord;->getRootTask()Lcom/android/server/wm/Task;\n\n"
        "    move-result-object v3\n\n"
        "    invoke-virtual {v0, v3}, Lcom/android/server/wm/TransitionController;->isTransientHide(Lcom/android/server/wm/Task;)Z\n\n"
        "    move-result v0\n\n"
        "    if-eqz v0, :cond_6\n\n"
        "    invoke-static {p2}, Lcom/android/server/wm/Task;->isAppLockOverlay(Lcom/android/server/wm/ActivityRecord;)Z\n\n"
        "    move-result v0\n\n"
        "    if-eqz v0, :cond_app_lock_pip\n\n"
        "    iput-boolean v2, p0, Lcom/android/server/wm/ActivityRecord;->mEnterPipOnStopForAppLock:Z\n\n"
        "    return-void\n\n"
        "    :cond_app_lock_pip\n"
        "    move v0, v2\n\n"
        "    goto :goto_1",
        "Task.enableEnterPipOnTaskSwitch",
        guard=":cond_app_lock_pip",
    )
    txt = replace_once(
        txt,
        "    iget-boolean v2, v0, Lcom/android/server/wm/Task;->mRealActivityAppLockEnabled:Z\n\n"
        "    iput-boolean v2, v1, Landroid/app/TaskInfo;->isRealActivityAppLockEnabled:Z",
        "    iget-boolean v2, v0, Lcom/android/server/wm/Task;->mRealActivityAppLockEnabled:Z\n\n"
        "    iput-boolean v2, v1, Landroid/app/TaskInfo;->isRealActivityAppLockEnabled:Z\n\n"
        "    invoke-virtual {v0, v15, v15}, Lcom/android/server/wm/TaskFragment;->getTopNonFinishingActivity(ZZ)Lcom/android/server/wm/ActivityRecord;\n\n"
        "    move-result-object v2\n\n"
        "    invoke-static {v2}, Lcom/android/server/wm/Task;->isAppLockOverlay(Lcom/android/server/wm/ActivityRecord;)Z\n\n"
        "    move-result v2\n\n"
        "    iput-boolean v2, v1, Landroid/app/TaskInfo;->isAppLockActivityOnTop:Z",
        "Task.fillTaskInfo",
        guard="->isAppLockActivityOnTop:Z",
    )
    txt = replace_once(
        txt,
        "    if-eqz p1, :cond_13\n\n"
        "    if-eqz v8, :cond_11",
        "    if-eqz p1, :cond_13\n\n"
        "    const/4 v9, 0x1\n\n"
        "    invoke-static {p0, v9}, Lcom/android/server/wm/AppLockWmHelpers;->handleTaskConfigChangedAppLock(Lcom/android/server/wm/Task;Z)V\n\n"
        "    if-eqz v8, :cond_11",
        "Task.onConfigurationChangedInner",
        guard="AppLockWmHelpers;->handleTaskConfigChangedAppLock",
    )
    write_smali(p, txt)

    # 6. ActivityStarter$Request
    p, txt = read_smali(srv_dir, "com/android/server/wm/ActivityStarter$Request.smali")
    txt = replace_once(
        txt,
        "    iput-object v0, p0, Lcom/android/server/wm/ActivityStarter$Request;->resolvedType:Ljava/lang/String;",
        "    iput-object v0, p0, Lcom/android/server/wm/ActivityStarter$Request;->resolvedType:Ljava/lang/String;\n\n"
        "    iput-object v0, p0, Lcom/android/server/wm/ActivityStarter$Request;->appLockPendingIntents:[Landroid/content/Intent;\n\n"
        "    iput-object v0, p0, Lcom/android/server/wm/ActivityStarter$Request;->appLockPendingResolvedTypes:[Ljava/lang/String;",
        "ActivityStarter$Request.reset",
        guard="->appLockPendingIntents:[Landroid/content/Intent;",
    )
    write_smali(p, txt)

    # 7. ActivityStartController.startActivities
    p, txt = read_smali(srv_dir, "com/android/server/wm/ActivityStartController.smali")
    txt = replace_once(
        txt,
        "    move-object/from16 v5, p9\n\n"
        "    move/from16 v4, v35\n\n"
        "    const/4 v3, 0x0\n\n"
        "    :goto_17",
        "    move-object/from16 v5, p9\n\n"
        "    move/from16 v4, v35\n\n"
        "    if-lez v4, :cond_app_lock_no_starters\n\n"
        "    const/4 v3, 0x0\n\n"
        "    aget-object v3, v36, v3\n\n"
        "    iget-object v3, v3, Lcom/android/server/wm/ActivityStarter;->mRequest:Lcom/android/server/wm/ActivityStarter$Request;\n\n"
        "    move-object/from16 v6, p7\n\n"
        "    iput-object v6, v3, Lcom/android/server/wm/ActivityStarter$Request;->appLockPendingIntents:[Landroid/content/Intent;\n\n"
        "    move-object/from16 v6, p8\n\n"
        "    iput-object v6, v3, Lcom/android/server/wm/ActivityStarter$Request;->appLockPendingResolvedTypes:[Ljava/lang/String;\n\n"
        "    :cond_app_lock_no_starters\n"
        "    const/4 v3, 0x0\n\n"
        "    :goto_17",
        "ActivityStartController.startActivities",
        guard=":cond_app_lock_no_starters",
    )
    write_smali(p, txt)

    # 8. ActivityStartInterceptor
    p, txt = read_smali(srv_dir, "com/android/server/wm/ActivityStartInterceptor.smali")
    txt = replace_once(
        txt,
        "    iput-object p3, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mServiceContext:Landroid/content/Context;",
        "    iput-object p3, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mServiceContext:Landroid/content/Context;\n\n"
        "    const/4 p1, -0x1\n\n"
        "    iput p1, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mAppLockWakeDisplayId:I\n\n"
        "    iput p1, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mAppLockFolderBypassId:I",
        "ASI.<init>",
        guard="->mAppLockWakeDisplayId:I",
    )
    txt = replace_once(
        txt,
        "    move-object/from16 v0, p0\n\n"
        "    iget-object v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mServiceContext:Landroid/content/Context;",
        "    move-object/from16 v0, p0\n\n"
        "    const/4 v1, -0x1\n\n"
        "    iput v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mAppLockWakeDisplayId:I\n\n"
        "    const/4 v1, 0x0\n\n"
        "    iput-boolean v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mDeferAppLockIntercept:Z\n\n"
        "    iget-object v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mServiceContext:Landroid/content/Context;",
        "ASI.intercept reset",
        guard="->mDeferAppLockIntercept:Z",
    )
    txt = replace_once(
        txt,
        "    :cond_53\n"
        "    invoke-virtual {v0}, Lcom/android/server/wm/ActivityStartInterceptor;->interceptMultiWindowAliasActivityIfNeeded()Z",
        "    :cond_53\n"
        "    invoke-static {v0}, Lcom/android/server/wm/AppLockWmHelpers;->interceptAppLockIfNeededLocked(Lcom/android/server/wm/ActivityStartInterceptor;)Z\n\n"
        "    move-result v1\n\n"
        "    if-eqz v1, :cond_app_lock_mw_alias\n\n"
        "    invoke-static {v0}, Lcom/android/server/wm/AppLockWmHelpers;->handleDeferFolderAppLockAliasCheck(Lcom/android/server/wm/ActivityStartInterceptor;)Z\n\n"
        "    return v3\n\n"
        "    :cond_app_lock_mw_alias\n"
        "    invoke-virtual {v0}, Lcom/android/server/wm/ActivityStartInterceptor;->interceptMultiWindowAliasActivityIfNeeded()Z",
        "ASI.intercept call interceptAppLockIfNeededLocked",
        guard="AppLockWmHelpers;->interceptAppLockIfNeededLocked",
    )
    txt = replace_once(
        txt,
        "    const/4 p1, 0x0\n\n"
        "    iput-boolean p1, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mIsInterceptedForAliasActivity:Z",
        "    const/4 p1, -0x1\n\n"
        "    iput p1, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mAppLockFolderBypassId:I\n\n"
        "    const/4 p1, 0x0\n\n"
        "    iput-boolean p1, p0, Lcom/android/server/wm/ActivityStartInterceptor;->mIsInterceptedForAliasActivity:Z",
        "ASI.setStates reset mAppLockFolderBypassId",
        guard="->mAppLockFolderBypassId:I\n\n    const/4 p1, 0x0",
    )
    write_smali(p, txt)

    # 9. ActivityStarter
    p, txt = read_smali(srv_dir, "com/android/server/wm/ActivityStarter.smali")
    txt = replace_once(
        txt,
        "    move-object/from16 v22, v44\n\n"
        "    invoke-virtual/range {v16 .. v27}, Lcom/android/server/wm/ActivityStartInterceptor;->intercept(Landroid/content/Intent;Landroid/content/pm/ResolveInfo;Landroid/content/pm/ActivityInfo;Ljava/lang/String;Lcom/android/server/wm/Task;Lcom/android/server/wm/TaskFragment;IILandroid/app/ActivityOptions;Lcom/android/server/wm/TaskDisplayArea;Z)Z",
        "    move-object/from16 v22, v44\n\n"
        "    move-object/from16 v0, v16\n\n"
        "    invoke-static {v0, v15}, Lcom/android/server/wm/AppLockWmHelpers;->prepareInterceptor(Lcom/android/server/wm/ActivityStartInterceptor;Lcom/android/server/wm/ActivityStarter$Request;)V\n\n"
        "    invoke-virtual/range {v16 .. v27}, Lcom/android/server/wm/ActivityStartInterceptor;->intercept(Landroid/content/Intent;Landroid/content/pm/ResolveInfo;Landroid/content/pm/ActivityInfo;Ljava/lang/String;Lcom/android/server/wm/Task;Lcom/android/server/wm/TaskFragment;IILandroid/app/ActivityOptions;Lcom/android/server/wm/TaskDisplayArea;Z)Z",
        "ActivityStarter.executeRequest prepareInterceptor",
        guard="AppLockWmHelpers;->prepareInterceptor",
    )
    txt = replace_once(
        txt,
        "    iget v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mCallingUid:I\n\n"
        "    iget-object v0, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mActivityOptions:Landroid/app/ActivityOptions;\n\n"
        "    move/from16 v49, v1",
        "    iget v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mCallingUid:I\n\n"
        "    move/from16 v49, v1\n\n"
        "    iget-object v1, v0, Lcom/android/server/wm/ActivityStartInterceptor;->mActivityOptions:Landroid/app/ActivityOptions;\n\n"
        "    invoke-static {v0, v2, v1}, Lcom/android/server/wm/AppLockWmHelpers;->applyDeferAppLockOptions(Lcom/android/server/wm/ActivityStartInterceptor;Landroid/content/Intent;Landroid/app/ActivityOptions;)Landroid/app/ActivityOptions;\n\n"
        "    move-result-object v0",
        "ActivityStarter.executeRequest applyDeferAppLockOptions",
        guard="AppLockWmHelpers;->applyDeferAppLockOptions",
    )
    txt = replace_once(
        txt,
        "    iput-object v5, v1, Lcom/android/server/wm/ActivityStarter;->mLastStartActivityRecord:Lcom/android/server/wm/ActivityRecord;",
        "    iget-object v6, v1, Lcom/android/server/wm/ActivityStarter;->mInterceptor:Lcom/android/server/wm/ActivityStartInterceptor;\n\n"
        "    invoke-static {v6, v5}, Lcom/android/server/wm/AppLockWmHelpers;->markDeferAppLockOnRecord(Lcom/android/server/wm/ActivityStartInterceptor;Lcom/android/server/wm/ActivityRecord;)V\n\n"
        "    const/4 v6, 0x0\n\n"
        "    iput-object v5, v1, Lcom/android/server/wm/ActivityStarter;->mLastStartActivityRecord:Lcom/android/server/wm/ActivityRecord;",
        "ActivityStarter.executeRequest markDeferAppLockOnRecord",
        guard="AppLockWmHelpers;->markDeferAppLockOnRecord",
    )
    # addOrReparentStartingActivity wake (both reparent and addChild return paths)
    if "addOrReparentStartingActivity_app_lock_wake" not in txt:
        txt = replace_once(
            txt,
            "    iget-object p0, p0, Lcom/android/server/wm/ActivityStarter;->mStartActivity:Lcom/android/server/wm/ActivityRecord;\n\n"
            "    invoke-virtual {p2}, Lcom/android/server/wm/WindowContainer;->getChildCount()I\n\n"
            "    move-result v0\n\n"
            "    invoke-virtual {p0, p2, v0, p1}, Lcom/android/server/wm/ActivityRecord;->reparent(Lcom/android/server/wm/TaskFragment;ILjava/lang/String;)V\n\n"
            "    return-void",
            "    iget-object v1, p0, Lcom/android/server/wm/ActivityStarter;->mStartActivity:Lcom/android/server/wm/ActivityRecord;\n\n"
            "    invoke-virtual {p2}, Lcom/android/server/wm/WindowContainer;->getChildCount()I\n\n"
            "    move-result v0\n\n"
            "    invoke-virtual {v1, p2, v0, p1}, Lcom/android/server/wm/ActivityRecord;->reparent(Lcom/android/server/wm/TaskFragment;ILjava/lang/String;)V\n\n"
            "    # addOrReparentStartingActivity_app_lock_wake\n"
            "    iget-object p1, p0, Lcom/android/server/wm/ActivityStarter;->mStartActivity:Lcom/android/server/wm/ActivityRecord;\n\n"
            "    invoke-virtual {p0, p1}, Lcom/android/server/wm/ActivityStarter;->applyAppLockTurnScreenOnIfNeededLocked(Lcom/android/server/wm/ActivityRecord;)V\n\n"
            "    return-void",
            "ActivityStarter.addOrReparentStartingActivity reparent wake",
        )
        txt = replace_once(
            txt,
            "    iget-object p0, p0, Lcom/android/server/wm/ActivityStarter;->mStartActivity:Lcom/android/server/wm/ActivityRecord;\n\n"
            "    const p1, 0x7fffffff\n\n"
            "    invoke-virtual {p2, p0, p1}, Lcom/android/server/wm/TaskFragment;->addChild(Lcom/android/server/wm/WindowContainer;I)V\n\n"
            "    return-void",
            "    iget-object p1, p0, Lcom/android/server/wm/ActivityStarter;->mStartActivity:Lcom/android/server/wm/ActivityRecord;\n\n"
            "    const v0, 0x7fffffff\n\n"
            "    invoke-virtual {p2, p1, v0}, Lcom/android/server/wm/TaskFragment;->addChild(Lcom/android/server/wm/WindowContainer;I)V\n\n"
            "    iget-object p1, p0, Lcom/android/server/wm/ActivityStarter;->mStartActivity:Lcom/android/server/wm/ActivityRecord;\n\n"
            "    invoke-virtual {p0, p1}, Lcom/android/server/wm/ActivityStarter;->applyAppLockTurnScreenOnIfNeededLocked(Lcom/android/server/wm/ActivityRecord;)V\n\n"
            "    return-void",
            "ActivityStarter.addOrReparentStartingActivity addChild wake",
        )
    # deliverNewIntent wake
    txt = replace_once(
        txt,
        "    check-cast v0, Lcom/android/server/uri/UriGrantsManagerService$LocalService;\n\n"
        "    invoke-virtual {v0, p2, v3}, Lcom/android/server/uri/UriGrantsManagerService$LocalService;->grantUriPermissionUncheckedFromIntent(Lcom/android/server/uri/NeededUriGrants;Lcom/android/server/uri/UriPermissionOwner;)V\n\n"
        "    sget-boolean p2, Lcom/samsung/android/rune/CoreRune;->FW_APPLOCK:Z",
        "    check-cast v0, Lcom/android/server/uri/UriGrantsManagerService$LocalService;\n\n"
        "    invoke-virtual {v0, p2, v3}, Lcom/android/server/uri/UriGrantsManagerService$LocalService;->grantUriPermissionUncheckedFromIntent(Lcom/android/server/uri/NeededUriGrants;Lcom/android/server/uri/UriPermissionOwner;)V\n\n"
        "    # deliverNewIntent_app_lock_wake\n"
        "    invoke-virtual {p0, p1}, Lcom/android/server/wm/ActivityStarter;->applyAppLockTurnScreenOnIfNeededLocked(Lcom/android/server/wm/ActivityRecord;)V\n\n"
        "    sget-boolean p2, Lcom/samsung/android/rune/CoreRune;->FW_APPLOCK:Z",
        "ActivityStarter.deliverNewIntent wake",
        guard="deliverNewIntent_app_lock_wake",
    )
    # recycleTask resetStashedFreeform guard
    txt = replace_once(
        txt,
        "    sget-boolean v3, Lcom/samsung/android/rune/CoreRune;->MW_CAPTION_FREEFORM_STASH:Z\n\n"
        "    if-eqz v3, :cond_54",
        "    iget-object v3, v0, Lcom/android/server/wm/ActivityStarter;->mStartActivity:Lcom/android/server/wm/ActivityRecord;\n\n"
        "    if-eqz v3, :cond_app_lock_stash\n\n"
        "    iget-boolean v4, v3, Lcom/android/server/wm/ActivityRecord;->mTaskOverlay:Z\n\n"
        "    if-eqz v4, :cond_app_lock_stash\n\n"
        "    iget-object v4, v5, Lcom/android/server/wm/ActivityTaskManagerService;->mWindowManager:Lcom/android/server/wm/WindowManagerService;\n\n"
        "    invoke-static {v4, v3}, Lcom/android/server/wm/AppLockWmHelpers;->isActivityAppLockOverlay(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)Z\n\n"
        "    move-result v3\n\n"
        "    if-nez v3, :cond_54\n\n"
        "    :cond_app_lock_stash\n"
        "    sget-boolean v3, Lcom/samsung/android/rune/CoreRune;->MW_CAPTION_FREEFORM_STASH:Z\n\n"
        "    if-eqz v3, :cond_54",
        "ActivityStarter.recycleTask stash guard",
        guard=":cond_app_lock_stash",
    )
    # getOrCreateRootTask launchOverTarget check
    txt = replace_once(
        txt,
        "    invoke-virtual {v0, v12, v13}, Lcom/android/server/wm/Task;->getTopVisibleActivity(ZZ)Lcom/android/server/wm/ActivityRecord;\n\n"
        "    move-result-object v5\n\n"
        "    if-eqz v5, :cond_6",
        "    invoke-virtual {v0, v12, v13}, Lcom/android/server/wm/Task;->getTopVisibleActivity(ZZ)Lcom/android/server/wm/ActivityRecord;\n\n"
        "    move-result-object v5\n\n"
        "    if-eqz v5, :cond_6\n\n"
        "    invoke-static {v5, v0}, Lcom/android/server/wm/ActivityStarter;->isLaunchOverTargetCoveredByAppLockActivity(Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/Task;)Z\n\n"
        "    move-result v5\n\n"
        "    if-nez v5, :cond_6",
        "ActivityStarter.getOrCreateRootTask launchOverTarget",
        guard="->isLaunchOverTargetCoveredByAppLockActivity(",
    )
    # startActivityInner: authorizeFolderBypassIfNeeded (both paths) & finishKeyguardAppLockOverlaysIfNeeded
    txt = replace_once(
        txt,
        "    :goto_23\n    :try_start_0\n    sget-boolean v0, Lcom/samsung/android/rune/CoreRune;->SYSPERF_ATLAS_ENABLE:Z",
        "    :goto_23\n"
        "    iget-object v0, v9, Lcom/android/server/wm/ActivityStarter;->mStartActivity:Lcom/android/server/wm/ActivityRecord;\n\n"
        "    invoke-static {v9, v0, v10}, Lcom/android/server/wm/AppLockWmHelpers;->authorizeFolderBypassIfNeeded(Lcom/android/server/wm/ActivityStarter;Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/Task;)V\n\n"
        "    if-nez v11, :cond_app_lock_fg_kg\n\n"
        "    iget-object v4, v15, Lcom/android/server/wm/ActivityTaskManagerService;->mWindowManager:Lcom/android/server/wm/WindowManagerService;\n\n"
        "    invoke-static {v4, v0, v10}, Lcom/android/server/wm/AppLockWmHelpers;->finishKeyguardAppLockOverlaysIfNeeded(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/Task;)V\n\n"
        "    :cond_app_lock_fg_kg\n"
        "    :try_start_0\n"
        "    sget-boolean v0, Lcom/samsung/android/rune/CoreRune;->SYSPERF_ATLAS_ENABLE:Z",
        "ActivityStarter.startActivityInner authorize/keyguard_overlays",
        guard=":cond_app_lock_fg_kg",
    )
    txt = replace_once(
        txt,
        "    :cond_6c\n"
        "    :goto_2d\n"
        "    iget-object v0, v9, Lcom/android/server/wm/ActivityStarter;->mLastStartActivityRecord:Lcom/android/server/wm/ActivityRecord;\n\n"
        "    invoke-virtual {v9, v0}, Lcom/android/server/wm/ActivityStarter;->recordTransientLaunchIfNeeded(Lcom/android/server/wm/ActivityRecord;)V",
        "    :cond_6c\n"
        "    :goto_2d\n"
        "    iget-object v0, v9, Lcom/android/server/wm/ActivityStarter;->mStartActivity:Lcom/android/server/wm/ActivityRecord;\n\n"
        "    if-eqz v0, :cond_app_lock_bypass2\n\n"
        "    iget-object v2, v0, Lcom/android/server/wm/ActivityRecord;->task:Lcom/android/server/wm/Task;\n\n"
        "    invoke-static {v9, v0, v2}, Lcom/android/server/wm/AppLockWmHelpers;->authorizeFolderBypassIfNeeded(Lcom/android/server/wm/ActivityStarter;Lcom/android/server/wm/ActivityRecord;Lcom/android/server/wm/Task;)V\n\n"
        "    :cond_app_lock_bypass2\n"
        "    iget-object v0, v9, Lcom/android/server/wm/ActivityStarter;->mLastStartActivityRecord:Lcom/android/server/wm/ActivityRecord;\n\n"
        "    invoke-virtual {v9, v0}, Lcom/android/server/wm/ActivityStarter;->recordTransientLaunchIfNeeded(Lcom/android/server/wm/ActivityRecord;)V",
        "ActivityStarter.startActivityInner authorize_2",
        guard=":cond_app_lock_bypass2",
    )
    write_smali(p, txt)

    # 10. ActivityTaskSupervisor
    p, txt = read_smali(srv_dir, "com/android/server/wm/ActivityTaskSupervisor.smali")
    txt = replace_once(
        txt,
        "    iget-object v2, v1, Lcom/android/server/wm/ActivityTaskSupervisor;->mRootWindowContainer:Lcom/android/server/wm/RootWindowContainer;\n\n"
        "    invoke-virtual {v2}, Lcom/android/server/wm/RootWindowContainer;->allPausedActivitiesComplete()Z",
        "    iget-boolean v2, v3, Lcom/android/server/wm/ActivityRecord;->mLaunchedFromBubble:Z\n\n"
        "    if-eqz v2, :cond_app_lock_real_start\n\n"
        "    iget-object v2, v1, Lcom/android/server/wm/ActivityTaskSupervisor;->mService:Lcom/android/server/wm/ActivityTaskManagerService;\n\n"
        "    iget-object v2, v2, Lcom/android/server/wm/ActivityTaskManagerService;->mWindowManager:Lcom/android/server/wm/WindowManagerService;\n\n"
        "    if-eqz v2, :cond_app_lock_real_start\n\n"
        "    iget-object v2, v2, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;\n\n"
        "    if-eqz v2, :cond_app_lock_real_start\n\n"
        "    iget-object v2, v2, Lcom/android/server/wm/AppLockController;->mAppLockOverlayController:Lcom/android/server/wm/AppLockOverlayController;\n\n"
        "    iget-object v2, v2, Lcom/android/server/wm/AppLockOverlayController;->mPendingActivityOverlayTargets:Landroid/util/ArraySet;\n\n"
        "    invoke-virtual {v2, v3}, Landroid/util/ArraySet;->contains(Ljava/lang/Object;)Z\n\n"
        "    move-result v2\n\n"
        "    if-eqz v2, :cond_app_lock_real_start\n\n"
        "    const/4 v4, 0x0\n\n"
        "    goto/16 :goto_2\n\n"
        "    :cond_app_lock_real_start\n"
        "    iget-object v2, v1, Lcom/android/server/wm/ActivityTaskSupervisor;->mRootWindowContainer:Lcom/android/server/wm/RootWindowContainer;\n\n"
        "    invoke-virtual {v2}, Lcom/android/server/wm/RootWindowContainer;->allPausedActivitiesComplete()Z",
        "ATS.realStartActivityLocked bubble overlay",
        guard=":cond_app_lock_real_start",
    )
    txt = replace_once(
        txt,
        "    invoke-virtual {v0, v15}, Lcom/android/server/wm/ActivityRecord;->showStartingWindow(Z)V",
        "    iget-object v2, v1, Lcom/android/server/wm/ActivityTaskSupervisor;->mService:Lcom/android/server/wm/ActivityTaskManagerService;\n\n"
        "    iget-object v2, v2, Lcom/android/server/wm/ActivityTaskManagerService;->mWindowManager:Lcom/android/server/wm/WindowManagerService;\n\n"
        "    invoke-static {v2, v0}, Lcom/android/server/wm/AppLockWmHelpers;->isActivityLockedByAppLock(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)Z\n\n"
        "    move-result v2\n\n"
        "    if-nez v2, :cond_14\n\n"
        "    invoke-virtual {v0, v15}, Lcom/android/server/wm/ActivityRecord;->showStartingWindow(Z)V",
        "ATS.showStartingWindow",
        guard="invoke-static {v2, v0}, Lcom/android/server/wm/AppLockWmHelpers;->isActivityLockedByAppLock",
    )
    txt = replace_once(
        txt,
        "    invoke-virtual {p0, p1, p3, v2, p2}, Lcom/android/server/wm/ActivityTaskManagerService;->startProcessAsync(Lcom/android/server/wm/ActivityRecord;ZZLjava/lang/String;)V",
        "    iget-object v1, p0, Lcom/android/server/wm/ActivityTaskManagerService;->mWindowManager:Lcom/android/server/wm/WindowManagerService;\n\n"
        "    invoke-static {v1, p1}, Lcom/android/server/wm/AppLockWmHelpers;->isActivityLockedByAppLock(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)Z\n\n"
        "    move-result v3\n\n"
        "    if-eqz v3, :cond_app_lock_start_proc\n\n"
        "    invoke-static {v1, p1}, Lcom/android/server/wm/AppLockWmHelpers;->addLockedByAppLockActivityOverlay(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)V\n\n"
        "    return-void\n\n"
        "    :cond_app_lock_start_proc\n"
        "    invoke-virtual {p0, p1, p3, v2, p2}, Lcom/android/server/wm/ActivityTaskManagerService;->startProcessAsync(Lcom/android/server/wm/ActivityRecord;ZZLjava/lang/String;)V",
        "ATS.startSpecificActivity",
        guard=":cond_app_lock_start_proc",
    )
    write_smali(p, txt)

    # 11. DragState.closeLocked
    p, txt = read_smali(srv_dir, "com/android/server/wm/DragState.smali")
    txt = replace_once(
        txt,
        ".method public final closeLocked(Z)V\n    .locals 20\n\n    move-object/from16 v0, p0",
        ".method public final closeLocked(Z)V\n    .locals 20\n\n    move-object/from16 v0, p0\n\n"
        "    iget-object v1, v0, Lcom/android/server/wm/DragState;->mService:Lcom/android/server/wm/WindowManagerService;\n\n"
        "    invoke-static {v1}, Lcom/android/server/wm/AppLockWmHelpers;->onDragClosedAppLock(Lcom/android/server/wm/WindowManagerService;)V",
        "DragState.closeLocked",
        guard="AppLockWmHelpers;->onDragClosedAppLock",
    )
    write_smali(p, txt)

    # 12. BackNavigationController
    p, txt = read_smali(srv_dir, "com/android/server/wm/BackNavigationController.smali")
    txt = replace_once(
        txt,
        "    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z",
        "    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z\n\n"
        "    iget-object v4, v0, Lcom/android/server/wm/BackNavigationController;->mWindowManagerService:Lcom/android/server/wm/WindowManagerService;\n\n"
        "    invoke-static {v4, v8}, Lcom/android/server/wm/AppLockWmHelpers;->isAnyActivityLockedForBack(Lcom/android/server/wm/WindowManagerService;Ljava/util/ArrayList;)Z\n\n"
        "    move-result v4\n\n"
        "    if-eqz v4, :cond_app_lock_back\n\n"
        "    goto/16 :goto_15\n\n"
        "    :cond_app_lock_back\n"
        "    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I\n\n"
        "    move-result v4\n\n"
        "    add-int/lit8 v4, v4, -0x1\n\n"
        "    invoke-virtual {v8, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;\n\n"
        "    move-result-object v4\n\n"
        "    check-cast v4, Lcom/android/server/wm/ActivityRecord;",
        "BackNavigationController",
        guard="AppLockWmHelpers;->isAnyActivityLockedForBack",
    )
    write_smali(p, txt)

    # 13. TransitionController.requestCloseTransitionIfNeeded
    p, txt = read_smali(srv_dir, "com/android/server/wm/TransitionController.smali")
    txt = replace_once(
        txt,
        "    :cond_0\n    invoke-virtual {p1}, Lcom/android/server/wm/WindowContainer;->asActivityRecord()Lcom/android/server/wm/ActivityRecord;",
        "    :cond_0\n"
        "    invoke-static {p1}, Lcom/android/server/wm/AppLockWmHelpers;->shouldSkipCloseTransitionForAppLock(Lcom/android/server/wm/WindowContainer;)Z\n\n"
        "    move-result v0\n\n"
        "    if-eqz v0, :cond_app_lock_tc\n\n"
        "    return-object v1\n\n"
        "    :cond_app_lock_tc\n"
        "    invoke-virtual {p1}, Lcom/android/server/wm/WindowContainer;->asActivityRecord()Lcom/android/server/wm/ActivityRecord;",
        "TransitionController.requestCloseTransitionIfNeeded",
        guard="AppLockWmHelpers;->shouldSkipCloseTransitionForAppLock",
    )
    write_smali(p, txt)

    # 14. ChangeTransitionController.onTransitionFinished PIP restore
    p, txt = read_smali(srv_dir, "com/android/server/wm/ChangeTransitionController.smali")
    txt = replace_once(
        txt,
        "    invoke-virtual {v6}, Lcom/android/server/wm/WindowContainer;->getTaskDisplayArea()Lcom/android/server/wm/TaskDisplayArea;\n\n"
        "    move-result-object v7\n\n"
        "    invoke-virtual {v6, v5, v4}, Lcom/android/server/wm/Task;->getTopVisibleActivity(ZZ)Lcom/android/server/wm/ActivityRecord;",
        "    invoke-virtual {v6}, Lcom/android/server/wm/WindowContainer;->getTaskDisplayArea()Lcom/android/server/wm/TaskDisplayArea;\n\n"
        "    move-result-object v7\n\n"
        "    invoke-static {p0, v0, v6, v7}, Lcom/android/server/wm/AppLockWmHelpers;->handlePipTransitionTask(Lcom/android/server/wm/ChangeTransitionController;Lcom/android/server/wm/ActivityTaskManagerService;Lcom/android/server/wm/Task;Lcom/android/server/wm/TaskDisplayArea;)Z\n\n"
        "    move-result v8\n\n"
        "    if-eqz v8, :cond_app_lock_pip\n\n"
        "    goto/16 :goto_4\n\n"
        "    :cond_app_lock_pip\n"
        "    invoke-virtual {v6, v5, v4}, Lcom/android/server/wm/Task;->getTopVisibleActivity(ZZ)Lcom/android/server/wm/ActivityRecord;",
        "CTC.onTransitionFinished handlePipTransitionTask",
        guard="AppLockWmHelpers;->handlePipTransitionTask",
    )
    write_smali(p, txt)

    # 15. RootWindowContainer.anyTaskForId registerTask on restoreRecentTaskLocked
    p, txt = read_smali(srv_dir, "com/android/server/wm/RootWindowContainer.smali")
    txt = replace_once(
        txt,
        "    :cond_7\n"
        "    iget-object p0, p0, Lcom/android/server/wm/RootWindowContainer;->mTaskSupervisor:Lcom/android/server/wm/ActivityTaskSupervisor;\n\n"
        "    invoke-virtual {p0, p3, p1, v6}, Lcom/android/server/wm/ActivityTaskSupervisor;->restoreRecentTaskLocked(Landroid/app/ActivityOptions;Lcom/android/server/wm/Task;Z)V\n\n"
        "    return-object p1",
        "    :cond_7\n"
        "    iget-object p2, p0, Lcom/android/server/wm/RootWindowContainer;->mTaskSupervisor:Lcom/android/server/wm/ActivityTaskSupervisor;\n\n"
        "    invoke-virtual {p2, p3, p1, v6}, Lcom/android/server/wm/ActivityTaskSupervisor;->restoreRecentTaskLocked(Landroid/app/ActivityOptions;Lcom/android/server/wm/Task;Z)V\n\n"
        "    iget-object p0, p0, Lcom/android/server/wm/WindowContainer;->mWmService:Lcom/android/server/wm/WindowManagerService;\n\n"
        "    iget-object p0, p0, Lcom/android/server/wm/WindowManagerService;->mAppLockController:Lcom/android/server/wm/AppLockController;\n\n"
        "    if-eqz p0, :cond_app_lock_rwc_rt\n\n"
        "    invoke-virtual {p0, p1}, Lcom/android/server/wm/AppLockController;->registerTask(Lcom/android/server/wm/Task;)V\n\n"
        "    :cond_app_lock_rwc_rt\n"
        "    return-object p1",
        "RWC.anyTaskForId registerTask",
        guard=":cond_app_lock_rwc_rt",
    )
    write_smali(p, txt)

    # 16. ActivityClientController.convertToTranslucent transition flag
    p, txt = read_smali(srv_dir, "com/android/server/wm/ActivityClientController.smali")
    txt = replace_once(
        txt,
        "    :cond_4\n    invoke-virtual {p1, v4, v4}, Lcom/android/server/wm/ActivityRecord;->setOccludesParent(ZZ)Z",
        "    :cond_4\n"
        "    if-eqz v0, :cond_app_lock_acc_t\n\n"
        "    iget-object v8, p0, Lcom/android/server/wm/ActivityClientController;->mService:Lcom/android/server/wm/ActivityTaskManagerService;\n\n"
        "    iget-object v8, v8, Lcom/android/server/wm/ActivityTaskManagerService;->mWindowManager:Lcom/android/server/wm/WindowManagerService;\n\n"
        "    invoke-static {v8, p1}, Lcom/android/server/wm/AppLockWmHelpers;->isActivityOverlayOrLockedTaskOverlay(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)Z\n\n"
        "    move-result v8\n\n"
        "    if-eqz v8, :cond_app_lock_acc_t\n\n"
        "    const/high16 v8, 0x1000000\n\n"
        "    invoke-virtual {v0, v8}, Lcom/android/server/wm/Transition;->addFlag(I)V\n\n"
        "    :cond_app_lock_acc_t\n"
        "    invoke-virtual {p1, v4, v4}, Lcom/android/server/wm/ActivityRecord;->setOccludesParent(ZZ)Z",
        "ACC.convertToTranslucent",
        guard=":cond_app_lock_acc_t",
    )
    write_smali(p, txt)

    # 17. ResetTargetTaskHelper.test skip locked task overlay
    p, txt = read_smali(srv_dir, "com/android/server/wm/ResetTargetTaskHelper.smali")
    txt = replace_once(
        txt,
        "    :cond_0\n    iget-object v2, v0, Lcom/android/server/wm/ResetTargetTaskHelper;->mAllActivities:Ljava/util/ArrayList;",
        "    :cond_0\n"
        "    iget-object v2, v0, Lcom/android/server/wm/ResetTargetTaskHelper;->mTask:Lcom/android/server/wm/Task;\n\n"
        "    iget-object v2, v2, Lcom/android/server/wm/WindowContainer;->mWmService:Lcom/android/server/wm/WindowManagerService;\n\n"
        "    invoke-static {v2, v1}, Lcom/android/server/wm/AppLockWmHelpers;->isLockedTaskAppLockOverlay(Lcom/android/server/wm/WindowManagerService;Lcom/android/server/wm/ActivityRecord;)Z\n\n"
        "    move-result v2\n\n"
        "    if-eqz v2, :cond_app_lock_rth\n\n"
        "    const/4 v4, 0x0\n\n"
        "    return v4\n\n"
        "    :cond_app_lock_rth\n"
        "    iget-object v2, v0, Lcom/android/server/wm/ResetTargetTaskHelper;->mAllActivities:Ljava/util/ArrayList;",
        "ResetTargetTaskHelper.test",
        guard=":cond_app_lock_rth",
    )
    write_smali(p, txt)


def main():
    if len(sys.argv) != 3:
        print("Usage: patch_services.py <decoded_services_dir> <framework_res_public_xml>", file=sys.stderr)
        sys.exit(1)
    srv_dir = sys.argv[1]
    pub_xml = sys.argv[2]
    fw_remap, _, fw_missing = build_fw_remap(os.path.join(PAYLOAD_DIR, "fwres", "s26_id_map.json"), pub_xml)
    if fw_missing:
        raise RuntimeError(f"Unresolved framework-res IDs for services.jar: {fw_missing}")

    cleanup_and_copy_payload(srv_dir, fw_remap)
    apply_snippets_and_interfaces(srv_dir, fw_remap)
    patch_system_server_and_config(srv_dir, fw_remap)
    patch_pm(srv_dir)
    patch_am(srv_dir)
    patch_notif(srv_dir)
    patch_wm(srv_dir)
    print("patch_services.py completed successfully")


if __name__ == "__main__":
    main()
