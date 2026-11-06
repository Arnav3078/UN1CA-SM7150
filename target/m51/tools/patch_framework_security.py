#!/usr/bin/env python3
import os, sys, re, subprocess

def patch_framework_security(apktool_dir, src_dir=None, work_dir=None):
    fw_dir = os.path.join(apktool_dir, "system/framework/framework.jar")
    if not os.path.isdir(fw_dir):
        print(f"[*] framework.jar apktool directory not found at {fw_dir}, attempting decode...")
        if src_dir and os.path.isfile(os.path.join(src_dir, "scripts/apktool.sh")):
            cmd = [os.path.join(src_dir, "scripts/apktool.sh"), "d", "system", "system/framework/framework.jar"]
            subprocess.run(cmd, check=True)
        else:
            print(f"[-] Cannot decode framework.jar: missing src_dir or apktool.sh")
            return False

    if not os.path.isdir(fw_dir):
        print(f"[-] framework.jar directory still not found after decode: {fw_dir}")
        return False

    # ==========================================
    # 1. ContextImpl.smali
    # - getDisplay() -> return getDisplayNoVerify()
    # - checkPermission() -> bypass ACCESS_TELEPHONY_SIMINFO_DB and MANAGE_ACTIVITY_TASKS
    # - startServiceCommon() -> catch/suppress BackgroundServiceStartNotAllowedException
    # ==========================================
    ctx_smali = os.path.join(fw_dir, "smali/android/app/ContextImpl.smali")
    if os.path.isfile(ctx_smali):
        with open(ctx_smali, "r", encoding="utf-8") as f:
            content = f.read()

        # Patch getDisplay()
        old_get_display = re.search(r'(\.method public whitelist getDisplay\(\)Landroid/view/Display;[\s\S]*?\.end method)', content)
        if old_get_display:
            new_get_display = (
                ".method public whitelist getDisplay()Landroid/view/Display;\n"
                "    .locals 0\n"
                "\n"
                "    invoke-virtual {p0}, Landroid/app/ContextImpl;->getDisplayNoVerify()Landroid/view/Display;\n"
                "\n"
                "    move-result-object p0\n"
                "\n"
                "    return-object p0\n"
                ".end method"
            )
            content = content.replace(old_get_display.group(1), new_get_display)
            print("[+] Patched ContextImpl.getDisplay -> safe getDisplayNoVerify()")

        # Patch checkPermission
        old_check_perm = """.method public whitelist checkPermission(Ljava/lang/String;II)I
    .locals 1

    if-eqz p1, :cond_1"""

        new_check_perm = """.method public whitelist checkPermission(Ljava/lang/String;II)I
    .locals 1

    if-eqz p1, :cond_1

    const-string v0, "android.permission.ACCESS_TELEPHONY_SIMINFO_DB"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_bypass_siminfo

    const/4 p0, 0x0

    return p0

    :cond_bypass_siminfo
    const-string v0, "android.permission.MANAGE_ACTIVITY_TASKS"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_bypass_manage_tasks

    const/4 p0, 0x0

    return p0

    :cond_bypass_manage_tasks"""

        if old_check_perm in content and "ACCESS_TELEPHONY_SIMINFO_DB" not in content[:content.find(old_check_perm)+500]:
            content = content.replace(old_check_perm, new_check_perm)
            print("[+] Patched ContextImpl.checkPermission -> bypass ACCESS_TELEPHONY_SIMINFO_DB & MANAGE_ACTIVITY_TASKS")

        # Patch startServiceCommon to suppress BackgroundServiceStartNotAllowedException
        # Target:
        #   invoke-static {v5, p0}, Landroid/app/ServiceStartNotAllowedException;->newInstance(ZLjava/lang/String;)Landroid/app/ServiceStartNotAllowedException;
        #   move-result-object p0
        #   throw p0
        old_service_throw = re.search(r'(invoke-static\s+\{[^}]+\},\s+Landroid/app/ServiceStartNotAllowedException;->newInstance\(ZLjava/lang/String;\)Landroid/app/ServiceStartNotAllowedException;\s+move-result-object\s+\w+\s+throw\s+\w+)', content)
        if old_service_throw:
            new_service_throw = (
                "const-string p1, \"ContextImpl\"\n"
                "    invoke-static {p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I\n"
                "    const/4 p0, 0x0\n"
                "    return-object p0"
            )
            content = content.replace(old_service_throw.group(1), new_service_throw)
            print("[+] Patched ContextImpl.startServiceCommon -> safe log & return null instead of BackgroundServiceStartNotAllowedException")

        with open(ctx_smali, "w", encoding="utf-8") as f:
            f.write(content)

    # ==========================================
    # 2. PermissionManager.smali
    # - checkPermission(Ljava/lang/String;III)I -> grant PHONE_UID (0x3e9) & bypass siminfo/tasks
    # ==========================================
    pm_smali = os.path.join(fw_dir, "smali_classes3/android/permission/PermissionManager.smali")
    if os.path.isfile(pm_smali):
        with open(pm_smali, "r", encoding="utf-8") as f:
            content = f.read()

        target_str = """    const/16 v1, 0x3e8

    if-eq v0, v1, :cond_1

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0"""

        replacement_str = """    const/16 v1, 0x3e8

    if-eq v0, v1, :cond_1

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    const/16 v1, 0x3e9

    if-ne v0, v1, :cond_check_siminfo

    goto :goto_0

    :cond_check_siminfo
    if-eqz p0, :cond_normal_check

    const-string v1, "android.permission.ACCESS_TELEPHONY_SIMINFO_DB"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_check_manage_tasks

    goto :goto_0

    :cond_check_manage_tasks
    const-string v1, "android.permission.MANAGE_ACTIVITY_TASKS"

    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_normal_check

    goto :goto_0

    :cond_normal_check"""

        if target_str in content and "cond_check_siminfo" not in content:
            content = content.replace(target_str, replacement_str)
            print("[+] Patched PermissionManager.checkPermission -> auto-grant PHONE_UID & SIMINFO/tasks")

        with open(pm_smali, "w", encoding="utf-8") as f:
            f.write(content)

    # ==========================================
    # 3. ScreenDecorationsUtils.smali
    # ==========================================
    sd_smali = os.path.join(fw_dir, "smali_classes5/com/android/internal/policy/ScreenDecorationsUtils.smali")
    if os.path.isfile(sd_smali):
        with open(sd_smali, "r", encoding="utf-8") as f:
            content = f.read()

        new_get_ratio = """.method static blacklist getPhysicalPixelDisplaySizeRatio(Landroid/content/Context;)F
    .locals 3

    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getDisplayNoVerify()Landroid/view/Display;

    move-result-object p0

    if-nez p0, :cond_0

    const/high16 p0, 0x3f800000    # 1.0f

    return p0

    :cond_0
    new-instance v0, Landroid/view/DisplayInfo;

    invoke-direct {v0}, Landroid/view/DisplayInfo;-><init>()V

    invoke-virtual {p0, v0}, Landroid/view/Display;->getDisplayInfo(Landroid/view/DisplayInfo;)Z

    iget-object p0, v0, Landroid/view/DisplayInfo;->supportedModes:[Landroid/view/Display$Mode;

    invoke-static {p0}, Landroid/util/DisplayUtils;->getMaximumResolutionDisplayMode([Landroid/view/Display$Mode;)Landroid/view/Display$Mode;

    move-result-object p0

    if-nez p0, :cond_1

    const/high16 p0, 0x3f800000    # 1.0f

    return p0

    :cond_1
    invoke-virtual {p0}, Landroid/view/Display$Mode;->getPhysicalWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/view/Display$Mode;->getPhysicalHeight()I

    move-result p0

    invoke-virtual {v0}, Landroid/view/DisplayInfo;->getNaturalWidth()I

    move-result v2

    invoke-virtual {v0}, Landroid/view/DisplayInfo;->getNaturalHeight()I

    move-result v0

    invoke-static {v1, p0, v2, v0}, Landroid/util/DisplayUtils;->getPhysicalPixelDisplaySizeRatio(IIII)F

    move-result p0

    return p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catch_all

    :catch_all
    const/high16 p0, 0x3f800000    # 1.0f

    return p0
.end method"""

        old_get_ratio = re.search(r'(\.method static blacklist getPhysicalPixelDisplaySizeRatio\(Landroid/content/Context;\)F[\s\S]*?\.end method)', content)
        if old_get_ratio and ":catch_all" not in old_get_ratio.group(1):
            content = content.replace(old_get_ratio.group(1), new_get_ratio)
            print("[+] Patched ScreenDecorationsUtils.getPhysicalPixelDisplaySizeRatio -> safe try-catch & getDisplayNoVerify")

        # In getWindowCornerRadius, wrap body with try-catch
        old_corner_method = re.search(r'(\.method public static blacklist getWindowCornerRadius\(Landroid/content/Context;\)F[\s\S]*?\.end method)', content)
        if old_corner_method and ":catch_all" not in old_corner_method.group(1):
            m_body = old_corner_method.group(1)
            m_body = re.sub(r'(\.locals 6\s+)', r'\1:try_start_0\n    ', m_body)
            m_body = re.sub(r'(\n\.end method)', r'\n    :try_end_0\n    .catchall {:try_start_0 .. :try_end_0} :catch_all\n\n    :catch_all\n    const/4 p0, 0x0\n\n    return p0\1', m_body)
            content = content.replace(old_corner_method.group(1), m_body)
            print("[+] Patched ScreenDecorationsUtils.getWindowCornerRadius -> safe try-catch wrapper")

        with open(sd_smali, "w", encoding="utf-8") as f:
            f.write(content)

    # ==========================================
    # 4. LockPatternUtils.smali
    # Re-add getLockoutAttemptDeadline(I)J for Android 14 BiometricSetting compatibility
    # ==========================================
    lp_smali = os.path.join(fw_dir, "smali_classes6/com/android/internal/widget/LockPatternUtils.smali")
    if os.path.isfile(lp_smali):
        with open(lp_smali, "r", encoding="utf-8") as f:
            content = f.read()

        if "getLockoutAttemptDeadline(I)J" not in content:
            legacy_method = (
                "\n.method public greylist getLockoutAttemptDeadline(I)J\n"
                "    .locals 2\n"
                "\n"
                "    invoke-virtual {p0, p1}, Lcom/android/internal/widget/LockPatternUtils;->getLockoutEndTime(I)Ljava/time/Duration;\n"
                "\n"
                "    move-result-object p0\n"
                "\n"
                "    if-nez p0, :cond_deadlock_zero\n"
                "\n"
                "    const-wide/16 p0, 0x0\n"
                "\n"
                "    return-wide p0\n"
                "\n"
                "    :cond_deadlock_zero\n"
                "    invoke-virtual {p0}, Ljava/time/Duration;->toMillis()J\n"
                "\n"
                "    move-result-wide p0\n"
                "\n"
                "    return-wide p0\n"
                ".end method\n"
            )
            content += legacy_method
            with open(lp_smali, "w", encoding="utf-8") as f:
                f.write(content)
            print("[+] Added LockPatternUtils.getLockoutAttemptDeadline(I)J backward-compat method")

    # ==========================================
    # 5. PlayIntegrityHooks.smali
    # Fix IllegalAccessError writing to final Build$VERSION.DEVICE_INITIAL_SDK_INT
    # ==========================================
    pi_smali = os.path.join(fw_dir, "smali_classes6/io/mesalabs/unica/PlayIntegrityHooks.smali")
    if os.path.isfile(pi_smali):
        with open(pi_smali, "r", encoding="utf-8") as f:
            content = f.read()

        old_set_int = re.search(r'(\.method private static blacklist setVersionFieldInt\(Ljava/lang/String;I\)V[\s\S]*?\.end method)', content)
        if old_set_int and "setAccessible(Z)V" not in old_set_int.group(1):
            new_set_int = (
                ".method private static blacklist setVersionFieldInt(Ljava/lang/String;I)V\n"
                "    .locals 2\n"
                "\n"
                "    :try_start_0\n"
                "    const-class v0, Landroid/os/Build$VERSION;\n"
                "\n"
                "    invoke-virtual {v0, p0}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;\n"
                "\n"
                "    move-result-object v0\n"
                "\n"
                "    const/4 v1, 0x1\n"
                "\n"
                "    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V\n"
                "\n"
                "    const/4 v1, 0x0\n"
                "\n"
                "    invoke-virtual {v0, v1, p1}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V\n"
                "\n"
                "    const/4 p1, 0x0\n"
                "\n"
                "    invoke-virtual {v0, p1}, Ljava/lang/reflect/Field;->setAccessible(Z)V\n"
                "    :try_end_0\n"
                "    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0\n"
                "\n"
                "    return-void\n"
                "\n"
                "    :catch_0\n"
                "    move-exception p0\n"
                "\n"
                "    return-void\n"
                ".end method"
            )
            content = content.replace(old_set_int.group(1), new_set_int)
            with open(pi_smali, "w", encoding="utf-8") as f:
                f.write(content)
            print("[+] Patched PlayIntegrityHooks.setVersionFieldInt -> reflection with try-catch")

    # ==========================================
    # 6. Instrumentation.smali
    # Suppress ActivityNotFoundException for BriefContentsSettingsActivity
    # ==========================================
    inst_smali = os.path.join(fw_dir, "smali/android/app/Instrumentation.smali")
    if os.path.isfile(inst_smali):
        with open(inst_smali, "r", encoding="utf-8") as f:
            content = f.read()

        target_inst = """:pswitch_4
    instance-of p0, p1, Landroid/content/Intent;

    if-eqz p0, :cond_1

    move-object p0, p1

    check-cast p0, Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    if-eqz v0, :cond_1"""

        repl_inst = """:pswitch_4
    instance-of p0, p1, Landroid/content/Intent;

    if-eqz p0, :cond_1

    move-object p0, p1

    check-cast p0, Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/content/Intent;->getComponent()Landroid/content/ComponentName;

    move-result-object v0

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Landroid/content/ComponentName;->getClassName()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_not_brief

    const-string v2, "BriefContentsSettingsActivity"

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_not_brief

    const-string p0, "Instrumentation"

    const-string p1, "Suppressing ActivityNotFoundException for BriefContentsSettingsActivity"

    invoke-static {p0, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    return-void

    :cond_not_brief"""

        if target_inst in content and "BriefContentsSettingsActivity" not in content:
            content = content.replace(target_inst, repl_inst)
            with open(inst_smali, "w", encoding="utf-8") as f:
                f.write(content)
            print("[+] Patched Instrumentation.checkStartActivityResult -> safe BriefContentsSettingsActivity handling")

    # ==========================================
    # 7. SystemServiceRegistry$198.smali & SemWifiManager.smali
    # Make sem_wifi service fetch resilient
    # ==========================================
    reg_smali = os.path.join(fw_dir, "smali/android/app/SystemServiceRegistry$198.smali")
    if os.path.isfile(reg_smali):
        with open(reg_smali, "r", encoding="utf-8") as f:
            content = f.read()

        if "getServiceOrThrow" in content:
            content = content.replace("getServiceOrThrow", "getService")
            with open(reg_smali, "w", encoding="utf-8") as f:
                f.write(content)
            print("[+] Patched SystemServiceRegistry$198 -> getService instead of getServiceOrThrow")

    sem_wifi_smali = os.path.join(fw_dir, "smali_classes7/com/samsung/android/wifi/SemWifiManager.smali")
    if os.path.isfile(sem_wifi_smali):
        with open(sem_wifi_smali, "r", encoding="utf-8") as f:
            content = f.read()

        old_airdrop = re.search(r'(\.method public blacklist isAirdropInterfaceActive\(\)Z[\s\S]*?\.end method)', content)
        if old_airdrop and "if-nez v0" not in old_airdrop.group(1):
            new_airdrop = (
                ".method public blacklist isAirdropInterfaceActive()Z\n"
                "    .locals 1\n"
                "\n"
                "    :try_start_0\n"
                "    iget-object v0, p0, Lcom/samsung/android/wifi/SemWifiManager;->mService:Lcom/samsung/android/wifi/ISemWifiManager;\n"
                "\n"
                "    if-nez v0, :cond_airdrop_active\n"
                "\n"
                "    const/4 p0, 0x0\n"
                "\n"
                "    return p0\n"
                "\n"
                "    :cond_airdrop_active\n"
                "    invoke-interface {v0}, Lcom/samsung/android/wifi/ISemWifiManager;->isAirdropInterfaceActive()Z\n"
                "\n"
                "    move-result p0\n"
                "    :try_end_0\n"
                "    .catchall {:try_start_0 .. :try_end_0} :catch_0\n"
                "\n"
                "    return p0\n"
                "\n"
                "    :catch_0\n"
                "    const/4 p0, 0x0\n"
                "\n"
                "    return p0\n"
                ".end method"
            )
            content = content.replace(old_airdrop.group(1), new_airdrop)
            print("[+] Patched SemWifiManager.isAirdropInterfaceActive -> safe null check and try-catch")

        old_clear = re.search(r'(\.method public blacklist clearAutoHotspotLists\(\)V[\s\S]*?\.end method)', content)
        if old_clear and "cond_has_service" not in old_clear.group(1):
            new_clear = (
                ".method public blacklist clearAutoHotspotLists()V\n"
                "    .locals 1\n"
                "\n"
                "    :try_start_0\n"
                "    iget-object v0, p0, Lcom/samsung/android/wifi/SemWifiManager;->mService:Lcom/samsung/android/wifi/ISemWifiManager;\n"
                "\n"
                "    if-nez v0, :cond_has_service\n"
                "\n"
                "    const-string v0, \"sem_wifi\"\n"
                "\n"
                "    invoke-static {v0}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;\n"
                "\n"
                "    move-result-object v0\n"
                "\n"
                "    invoke-static {v0}, Lcom/samsung/android/wifi/ISemWifiManager$Stub;->asInterface(Landroid/os/IBinder;)Lcom/samsung/android/wifi/ISemWifiManager;\n"
                "\n"
                "    move-result-object v0\n"
                "\n"
                "    iput-object v0, p0, Lcom/samsung/android/wifi/SemWifiManager;->mService:Lcom/samsung/android/wifi/ISemWifiManager;\n"
                "\n"
                "    :cond_has_service\n"
                "    iget-object p0, p0, Lcom/samsung/android/wifi/SemWifiManager;->mService:Lcom/samsung/android/wifi/ISemWifiManager;\n"
                "\n"
                "    if-eqz p0, :cond_ret\n"
                "\n"
                "    invoke-interface {p0}, Lcom/samsung/android/wifi/ISemWifiManager;->clearAutoHotspotLists()V\n"
                "    :try_end_0\n"
                "    .catchall {:try_start_0 .. :try_end_0} :catch_0\n"
                "\n"
                "    :cond_ret\n"
                "    :catch_0\n"
                "    return-void\n"
                ".end method"
            )
            content = content.replace(old_clear.group(1), new_clear)
            print("[+] Patched SemWifiManager.clearAutoHotspotLists -> safe binder lookup and try-catch")

        with open(sem_wifi_smali, "w", encoding="utf-8") as f:
            f.write(content)

    # ==========================================
    # 7b. WallpaperManager.smali backward compatibility bridge
    # Fixes NoSuchMethodError: addOnSemColorsChangedListener(OnSemColorsChangedListener, Handler)
    # Called by BiometricSetting.apk (com.samsung.android.biometrics.app.setting)
    # ==========================================
    wm_smali = os.path.join(fw_dir, "smali/android/app/WallpaperManager.smali")
    if os.path.isfile(wm_smali):
        with open(wm_smali, "r", encoding="utf-8") as f:
            content = f.read()

        bridge_method = """
.method public blacklist addOnSemColorsChangedListener(Landroid/app/OnSemColorsChangedListener;Landroid/os/Handler;)V
    .locals 0

    invoke-virtual {p0, p2, p1}, Landroid/app/WallpaperManager;->addOnSemColorsChangedListener(Landroid/os/Handler;Landroid/app/OnSemColorsChangedListener;)V

    return-void
.end method
"""
        target_wm = ".method public blacklist addOnSemColorsChangedListener(Landroid/os/Handler;Landroid/app/OnSemColorsChangedListener;)V"
        if target_wm in content and "addOnSemColorsChangedListener(Landroid/app/OnSemColorsChangedListener;Landroid/os/Handler;)V" not in content:
            content = content.replace(target_wm, bridge_method.strip() + "\n\n" + target_wm)
            with open(wm_smali, "w", encoding="utf-8") as f:
                f.write(content)
            print("[+] Patched WallpaperManager.smali -> added backward compatibility bridge for addOnSemColorsChangedListener(listener, handler)")

    # ==========================================
    # 8. WifiSettings.smali in SecSettings.apk
    # - Inject isSafeAirdropActive static helper method
    # - Replace all isAirdropInterfaceActive calls
    # - Safe fallback instantiation for mSemWifiManager in onCreate
    # - Guard getWifiApBleScanDetail and clearAutoHotspotLists
    # ==========================================
    wifi_settings_smali = os.path.join(apktool_dir, "system/priv-app/SecSettings/SecSettings.apk/smali_classes4/com/samsung/android/settings/wifi/WifiSettings.smali")
    if os.path.isfile(wifi_settings_smali):
        with open(wifi_settings_smali, "r", encoding="utf-8") as f:
            content = f.read()

        # Replace ALL isAirdropInterfaceActive calls with isSafeAirdropActive FIRST
        content = re.sub(
            r'invoke-virtual\s+\{([vp0-9]+)\},\s+Lcom/samsung/android/wifi/SemWifiManager;->isAirdropInterfaceActive\(\)Z',
            r'invoke-static {\1}, Lcom/samsung/android/settings/wifi/WifiSettings;->isSafeAirdropActive(Lcom/samsung/android/wifi/SemWifiManager;)Z',
            content
        )

        # Inject helper method if not present (AFTER replacement so it does not recurse)
        if "isSafeAirdropActive(Lcom/samsung/android/wifi/SemWifiManager;)Z" not in content:
            helper_method = """
.method private static blacklist isSafeAirdropActive(Lcom/samsung/android/wifi/SemWifiManager;)Z
    .locals 1

    if-nez p0, :cond_safe_airdrop

    const/4 v0, 0x0

    return v0

    :cond_safe_airdrop
    :try_start_safe_airdrop
    invoke-virtual {p0}, Lcom/samsung/android/wifi/SemWifiManager;->isAirdropInterfaceActive()Z

    move-result v0
    :try_end_safe_airdrop
    .catchall {:try_start_safe_airdrop .. :try_end_safe_airdrop} :catch_safe_airdrop

    return v0

    :catch_safe_airdrop
    const/4 v0, 0x0

    return v0
.end method
"""
            content += "\n" + helper_method

        # Ensure mSemWifiManager is instantiated in onCreate
        target_init = """    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/samsung/android/wifi/SemWifiManager;

    iput-object v1, v13, Lcom/samsung/android/settings/wifi/WifiSettings;->mSemWifiManager:Lcom/samsung/android/wifi/SemWifiManager;"""

        repl_init = """    invoke-virtual {v1, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/samsung/android/wifi/SemWifiManager;

    if-nez v1, :cond_has_sem_wifi_mgr

    new-instance v1, Lcom/samsung/android/wifi/SemWifiManager;

    iget-object v2, v13, Lcom/samsung/android/settings/wifi/WifiSettings;->mContext:Landroid/content/Context;

    const/4 v4, 0x0

    invoke-direct {v1, v2, v4, v4}, Lcom/samsung/android/wifi/SemWifiManager;-><init>(Landroid/content/Context;Lcom/samsung/android/wifi/ISemWifiManager;Landroid/os/Looper;)V

    :cond_has_sem_wifi_mgr
    iput-object v1, v13, Lcom/samsung/android/settings/wifi/WifiSettings;->mSemWifiManager:Lcom/samsung/android/wifi/SemWifiManager;"""

        if target_init in content:
            content = content.replace(target_init, repl_init)
            print("[+] Patched SecSettings.WifiSettings -> guaranteed non-null mSemWifiManager in onCreate")

        # Guard getWifiApBleScanDetail
        target_ble = """    iget-object v4, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mSemWifiManager:Lcom/samsung/android/wifi/SemWifiManager;

    invoke-virtual {v4}, Lcom/samsung/android/wifi/SemWifiManager;->getWifiApBleScanDetail()Ljava/util/List;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z"""

        repl_ble = """    iget-object v4, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mSemWifiManager:Lcom/samsung/android/wifi/SemWifiManager;

    if-eqz v4, :cond_skip_ble_scan
    :try_start_ble
    invoke-virtual {v4}, Lcom/samsung/android/wifi/SemWifiManager;->getWifiApBleScanDetail()Ljava/util/List;

    move-result-object v4

    if-eqz v4, :cond_skip_ble_scan

    invoke-interface {v3, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z
    :try_end_ble
    .catchall {:try_start_ble .. :try_end_ble} :catch_ble
    :catch_ble
    :cond_skip_ble_scan"""

        if target_ble in content:
            content = content.replace(target_ble, repl_ble)
            print("[+] Patched SecSettings.WifiSettings -> safe getWifiApBleScanDetail")

        # Guard clearAutoHotspotLists call 1 (in onActivityCreated)
        target_clear_1 = """    iget-object p1, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mSemWifiManager:Lcom/samsung/android/wifi/SemWifiManager;

    invoke-virtual {p1}, Lcom/samsung/android/wifi/SemWifiManager;->clearAutoHotspotLists()V"""

        repl_clear_1 = """    iget-object p1, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mSemWifiManager:Lcom/samsung/android/wifi/SemWifiManager;

    if-eqz p1, :cond_skip_clear_1
    :try_start_clear_1
    invoke-virtual {p1}, Lcom/samsung/android/wifi/SemWifiManager;->clearAutoHotspotLists()V
    :try_end_clear_1
    .catchall {:try_start_clear_1 .. :try_end_clear_1} :catch_clear_1
    :catch_clear_1
    :cond_skip_clear_1"""

        if target_clear_1 in content:
            content = content.replace(target_clear_1, repl_clear_1)

        # Guard clearAutoHotspotLists call 2 (in onDestroyView)
        target_clear_2 = """    iget-object p0, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mSemWifiManager:Lcom/samsung/android/wifi/SemWifiManager;

    invoke-virtual {p0}, Lcom/samsung/android/wifi/SemWifiManager;->clearAutoHotspotLists()V

    return-void"""

        repl_clear_2 = """    iget-object p0, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mSemWifiManager:Lcom/samsung/android/wifi/SemWifiManager;

    if-eqz p0, :cond_skip_clear_2
    :try_start_clear_2
    invoke-virtual {p0}, Lcom/samsung/android/wifi/SemWifiManager;->clearAutoHotspotLists()V
    :try_end_clear_2
    .catchall {:try_start_clear_2 .. :try_end_clear_2} :catch_clear_2
    :catch_clear_2
    :cond_skip_clear_2

    return-void"""

        if target_clear_2 in content:
            content = content.replace(target_clear_2, repl_clear_2)

        with open(wifi_settings_smali, "w", encoding="utf-8") as f:
            f.write(content)
        print("[+] Patched SecSettings.WifiSettings completely with resilient airDrop and null-guards")

    # ==========================================
    # 8b. Software Update Intent in sec_top_level_settings.xml
    # Point stock software update to ChoiDujour so it never crashes
    # ==========================================
    top_xml = os.path.join(apktool_dir, "system/priv-app/SecSettings/SecSettings.apk/res/xml/sec_top_level_settings.xml")
    if os.path.isfile(top_xml):
        with open(top_xml, "r", encoding="utf-8") as f:
            top_c = f.read()
        if "com.wssyncmldm" in top_c:
            top_c = top_c.replace('android:targetPackage="com.wssyncmldm"', 'android:targetPackage="io.mesalabs.choidujour"')
            top_c = top_c.replace('android:targetClass="com.idm.fotaagent.enabler.ui.userinit.UserInitEntryActivity"', 'android:targetClass="io.mesalabs.choidujour.activity.HomeActivity"')
            with open(top_xml, "w", encoding="utf-8") as f:
                f.write(top_c)
            print("[+] Patched sec_top_level_settings.xml -> top_level_software_update routed to ChoiDujour")

    # ==========================================
    # 8c. SemFloatingFeature & FloatingFeatureHooks for UN1CA Settings
    # ==========================================
    sff_smali = os.path.join(fw_dir, "smali_classes6/com/samsung/android/feature/SemFloatingFeature.smali")
    if os.path.isfile(sff_smali):
        with open(sff_smali, "r", encoding="utf-8") as f:
            sff_c = f.read()

        clean_gb = """
.method public whitelist getBoolean(Ljava/lang/String;)Z
    .locals 2

    const/4 v0, 0x0

    if-nez p1, :cond_0

    const-string p0, "The first argument of getBoolean() cannot be null."

    invoke-static {p0}, Lcom/samsung/android/feature/SemFloatingFeature;->loge(Ljava/lang/Object;)V

    return v0

    :cond_0
    invoke-static {p1}, Lio/mesalabs/unica/FloatingFeatureHooks;->onGetBoolean(Ljava/lang/String;)Ljava/lang/Boolean;

    move-result-object v1

    if-eqz v1, :cond_sff_orig_gb

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0

    :cond_sff_orig_gb
    iget-object p0, p0, Lcom/samsung/android/feature/SemFloatingFeature;->mFeatureList:Ljava/util/Hashtable;

    invoke-virtual {p0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_1

    return v0

    :cond_1
    invoke-static {p0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method
"""
        clean_gi = """
.method public whitelist getInt(Ljava/lang/String;)I
    .locals 2

    const/4 v0, -0x1

    if-nez p1, :cond_0

    const-string p0, "The first argument of getInt() cannot be null."

    invoke-static {p0}, Lcom/samsung/android/feature/SemFloatingFeature;->loge(Ljava/lang/Object;)V

    return v0

    :cond_0
    invoke-static {p1}, Lio/mesalabs/unica/FloatingFeatureHooks;->onGetInt(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v1

    if-eqz v1, :cond_sff_orig_gi

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result p0

    return p0

    :cond_sff_orig_gi
    iget-object p0, p0, Lcom/samsung/android/feature/SemFloatingFeature;->mFeatureList:Ljava/util/Hashtable;

    invoke-virtual {p0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_1

    return v0

    :cond_1
    :try_start_0
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    const-string p1, "[%s] cannot be parsed to Integer value"

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lcom/samsung/android/feature/SemFloatingFeature;->loge(Ljava/lang/Object;)V

    return v0
.end method
"""
        clean_gs = """
.method public whitelist getString(Ljava/lang/String;)Ljava/lang/String;
    .locals 2

    const-string v0, ""

    if-nez p1, :cond_0

    const-string p0, "The first argument of getString() cannot be null."

    invoke-static {p0}, Lcom/samsung/android/feature/SemFloatingFeature;->loge(Ljava/lang/Object;)V

    return-object v0

    :cond_0
    invoke-static {p1}, Lio/mesalabs/unica/FloatingFeatureHooks;->onGetString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_sff_orig_gs

    return-object v1

    :cond_sff_orig_gs
    iget-object p0, p0, Lcom/samsung/android/feature/SemFloatingFeature;->mFeatureList:Ljava/util/Hashtable;

    invoke-virtual {p0, p1}, Ljava/util/Hashtable;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    if-nez p0, :cond_1

    return-object v0

    :cond_1
    return-object p0
.end method
"""
        pattern_gb = re.compile(r'\.method public whitelist getBoolean\(Ljava/lang/String;\)Z[\s\S]*?\.end method')
        if pattern_gb.search(sff_c):
            sff_c = pattern_gb.sub(clean_gb.strip(), sff_c)
            print("[+] Hooked SemFloatingFeature.getBoolean (Dalvik verifier safe)")

        pattern_gi = re.compile(r'\.method public whitelist getInt\(Ljava/lang/String;\)I[\s\S]*?\.end method')
        if pattern_gi.search(sff_c):
            sff_c = pattern_gi.sub(clean_gi.strip(), sff_c)
            print("[+] Hooked SemFloatingFeature.getInt (Dalvik verifier safe)")

        pattern_gs = re.compile(r'\.method public whitelist getString\(Ljava/lang/String;\)Ljava/lang/String;[\s\S]*?\.end method')
        if pattern_gs.search(sff_c):
            sff_c = pattern_gs.sub(clean_gs.strip(), sff_c)
            print("[+] Hooked SemFloatingFeature.getString (Dalvik verifier safe)")

        with open(sff_smali, "w", encoding="utf-8") as f:
            f.write(sff_c)

    ffh_dest = os.path.join(fw_dir, "smali_classes6/io/mesalabs/unica/FloatingFeatureHooks.smali")
    if not os.path.isfile(ffh_dest):
        ffh_src = os.path.join(src_dir or "/home/arnav/UN1CA-4.0-M51", "unica/mods/settings/smali/system/framework/framework.jar/0003-Introduce-FloatingFeatureHooks.patch")
        if os.path.isfile(ffh_src):
            with open(ffh_src, "r", encoding="utf-8") as f:
                pcontent = f.read()
            ffh_marker = "diff --git a/smali_classes6/io/mesalabs/unica/FloatingFeatureHooks.smali b/smali_classes6/io/mesalabs/unica/FloatingFeatureHooks.smali"
            if ffh_marker in pcontent:
                ffh_body = pcontent.split(ffh_marker)[1]
                smali_lines = []
                for line in ffh_body.split("\n"):
                    if line.startswith("+++"):
                        continue
                    elif line.startswith("+"):
                        smali_lines.append(line[1:])
                    elif line.startswith("@@"):
                        continue
                os.makedirs(os.path.dirname(ffh_dest), exist_ok=True)
                with open(ffh_dest, "w", encoding="utf-8") as f:
                    f.write("\n".join(smali_lines))
                print("[+] Installed FloatingFeatureHooks.smali into framework.jar")

    # ==========================================
    # 8d. GamesPropsUtils.smali for framework.jar
    # ==========================================
    gpu_dest = os.path.join(fw_dir, "smali_classes6/io/mesalabs/unica/GamesPropsUtils.smali")
    if not os.path.isfile(gpu_dest):
        gpu_src = os.path.join(src_dir or "/home/arnav/UN1CA-4.0-M51", "unica/mods/gamesprops/smali/system/framework/framework.jar/0001-Introduce-GamesPropsUtils.patch")
        if os.path.isfile(gpu_src):
            with open(gpu_src, "r", encoding="utf-8") as f:
                pcontent = f.read()
            gpu_marker = "diff --git a/smali_classes6/io/mesalabs/unica/GamesPropsUtils.smali b/smali_classes6/io/mesalabs/unica/GamesPropsUtils.smali"
            if gpu_marker not in pcontent:
                gpu_marker = "diff --git a/smali_classes7/io/mesalabs/unica/GamesPropsUtils.smali b/smali_classes7/io/mesalabs/unica/GamesPropsUtils.smali"
            if gpu_marker in pcontent:
                gpu_body = pcontent.split(gpu_marker)[1]
                smali_lines = []
                for line in gpu_body.split("\n"):
                    if line.startswith("+++"):
                        continue
                    elif line.startswith("+"):
                        smali_lines.append(line[1:])
                    elif line.startswith("@@"):
                        continue
                os.makedirs(os.path.dirname(gpu_dest), exist_ok=True)
                with open(gpu_dest, "w", encoding="utf-8") as f:
                    f.write("\n".join(smali_lines))
                print("[+] Installed GamesPropsUtils.smali into framework.jar")

    # ==========================================
    # 9. UdfpsSensorWindow.smali in BiometricSetting.apk
    # Return early if p1 is null (side-mounted fingerprint)
    # ==========================================
    udfps_smali = os.path.join(apktool_dir, "system/priv-app/BiometricSetting/BiometricSetting.apk/smali/com/samsung/android/biometrics/app/setting/fingerprint/UdfpsSensorWindow.smali")
    if os.path.isfile(udfps_smali):
        with open(udfps_smali, "r", encoding="utf-8") as f:
            content = f.read()

        old_udfps = re.search(r'(\.method public final initFromBaseWindow\(Lcom/samsung/android/biometrics/app/setting/fingerprint/UdfpsSensorWindow;\)V[\s\S]*?\.end method)', content)
        if old_udfps and "IllegalArgumentException" in old_udfps.group(1):
            new_udfps = (
                ".method public final initFromBaseWindow(Lcom/samsung/android/biometrics/app/setting/fingerprint/UdfpsSensorWindow;)V\n"
                "    .locals 1\n"
                "\n"
                "    if-eqz p1, :cond_0\n"
                "\n"
                "    const/4 v0, 0x1\n"
                "\n"
                "    iput-boolean v0, p0, Lcom/samsung/android/biometrics/app/setting/fingerprint/UdfpsSensorWindow;->mUseBaseWindow:Z\n"
                "\n"
                "    iget-object p1, p1, Lcom/samsung/android/biometrics/app/setting/fingerprint/UdfpsSensorWindow;->mFingerprintLayout:Landroid/widget/FrameLayout;\n"
                "\n"
                "    invoke-virtual {p0, p1}, Lcom/samsung/android/biometrics/app/setting/fingerprint/UdfpsSensorWindow;->initLayout(Landroid/widget/FrameLayout;)V\n"
                "\n"
                "    :cond_0\n"
                "    return-void\n"
                ".end method"
            )
            content = content.replace(old_udfps.group(1), new_udfps)
            with open(udfps_smali, "w", encoding="utf-8") as f:
                f.write(content)
            print("[+] Patched BiometricSetting.UdfpsSensorWindow -> safe return on null base window")

    # ==========================================
    # 9b. UdfpsKeyguardClient.smali in BiometricSetting.apk
    # Wrap addOnSemColorsChangedListener and removeOnSemColorsChangedListener with try/catch
    # ==========================================
    udfps_kc = os.path.join(apktool_dir, "system/priv-app/BiometricSetting/BiometricSetting.apk/smali/com/samsung/android/biometrics/app/setting/fingerprint/UdfpsKeyguardClient.smali")
    if os.path.isfile(udfps_kc):
        with open(udfps_kc, "r", encoding="utf-8") as f:
            kc_c = f.read()

        old_add = "invoke-virtual {p1, p0, v0}, Landroid/app/WallpaperManager;->addOnSemColorsChangedListener(Landroid/app/OnSemColorsChangedListener;Landroid/os/Handler;)V\n\n    invoke-virtual {p0}, Lcom/samsung/android/biometrics/app/setting/fingerprint/UdfpsKeyguardClient;->updateWallpaperFontColor()V"
        new_add = ":try_start_wm_add\n    invoke-virtual {p1, p0, v0}, Landroid/app/WallpaperManager;->addOnSemColorsChangedListener(Landroid/app/OnSemColorsChangedListener;Landroid/os/Handler;)V\n\n    invoke-virtual {p0}, Lcom/samsung/android/biometrics/app/setting/fingerprint/UdfpsKeyguardClient;->updateWallpaperFontColor()V\n    :try_end_wm_add\n    .catchall {:try_start_wm_add .. :try_end_wm_add} :catchall_wm_add\n    :catchall_wm_add"

        if old_add in kc_c:
            kc_c = kc_c.replace(old_add, new_add)
            print("[+] Guarded UdfpsKeyguardClient.addOnSemColorsChangedListener with try/catch")

        old_rem = "invoke-virtual {v0, p0}, Landroid/app/WallpaperManager;->removeOnSemColorsChangedListener(Landroid/app/OnSemColorsChangedListener;)V"
        new_rem = ":try_start_wm_rem\n    invoke-virtual {v0, p0}, Landroid/app/WallpaperManager;->removeOnSemColorsChangedListener(Landroid/app/OnSemColorsChangedListener;)V\n    :try_end_wm_rem\n    .catchall {:try_start_wm_rem .. :try_end_wm_rem} :catchall_wm_rem\n    :catchall_wm_rem"

        if old_rem in kc_c:
            kc_c = kc_c.replace(old_rem, new_rem)
            print("[+] Guarded UdfpsKeyguardClient.removeOnSemColorsChangedListener with try/catch")

        with open(udfps_kc, "w", encoding="utf-8") as f:
            f.write(kc_c)

    # ==========================================
    # 10. UN1CA PreferenceControllers in SecSettings.apk
    # Ensure Vulkan, MaxRefreshRate, BootSound, and GamesProps options are always visible
    # ==========================================
    controllers_to_enable = [
        "smali_classes4/io/mesalabs/unica/settings/ui/VulkanPreferenceController.smali",
        "smali_classes4/io/mesalabs/unica/settings/ui/ForceMaxRefreshRatePreferenceController.smali",
        "smali_classes4/io/mesalabs/unica/settings/ui/BootSoundPreferenceController.smali",
        "smali_classes4/io/mesalabs/unica/settings/extra/GamesPropsPreferenceController.smali"
    ]

    avail_pattern = re.compile(r'(\.method public getAvailabilityStatus\(\)I[\s\S]*?\.end method)')
    safe_avail = ".method public getAvailabilityStatus()I\n    .locals 1\n\n    const/4 v0, 0x0\n\n    return v0\n.end method"

    for rel_path in controllers_to_enable:
        ctrl_path = os.path.join(apktool_dir, "system/priv-app/SecSettings/SecSettings.apk", rel_path)
        if os.path.isfile(ctrl_path):
            with open(ctrl_path, "r", encoding="utf-8") as f:
                ctrl_c = f.read()
            match = avail_pattern.search(ctrl_c)
            if match:
                ctrl_c = ctrl_c.replace(match.group(1), safe_avail)
                with open(ctrl_path, "w", encoding="utf-8") as f:
                    f.write(ctrl_c)
                print(f"[+] Patched {os.path.basename(ctrl_path)} -> getAvailabilityStatus() returns AVAILABLE (0)")

    # ==========================================
    # 11. SoftwareUpdateUtils.smali in SecSettings.apk
    # Neutralize startFotaActivityOrBroadcast to prevent any stock FOTA crash
    # ==========================================
    fota_smali = os.path.join(apktool_dir, "system/priv-app/SecSettings/SecSettings.apk/smali_classes3/com/samsung/android/settings/softwareupdate/SoftwareUpdateUtils.smali")
    if os.path.isfile(fota_smali):
        with open(fota_smali, "r", encoding="utf-8") as f:
            fota_c = f.read()

        old_start_fota = re.search(r'(\.method public static startFotaActivityOrBroadcast\(Landroid/content/Context;Ljava/lang/String;\)V[\s\S]*?\.end method)', fota_c)
        if old_start_fota:
            new_start_fota = ".method public static startFotaActivityOrBroadcast(Landroid/content/Context;Ljava/lang/String;)V\n    .locals 0\n\n    return-void\n.end method"
            fota_c = fota_c.replace(old_start_fota.group(1), new_start_fota)
            with open(fota_smali, "w", encoding="utf-8") as f:
                f.write(fota_c)
            print("[+] Patched SoftwareUpdateUtils.startFotaActivityOrBroadcast -> safe no-op")

    print("[+] All framework, biometrics, settings, and runtime patches applied successfully!")
    return True

if __name__ == "__main__":
    apktool_dir = sys.argv[1] if len(sys.argv) > 1 else "/home/arnav/UN1CA-4.0-M51/out/target/m51/apktool"
    src_dir = sys.argv[2] if len(sys.argv) > 2 else "/home/arnav/UN1CA-4.0-M51"
    work_dir = sys.argv[3] if len(sys.argv) > 3 else "/home/arnav/UN1CA-4.0-M51/out/target/m51/work_dir"
    success = patch_framework_security(apktool_dir, src_dir, work_dir)
    sys.exit(0 if success else 1)
