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
        if ".method private static blacklist isSafeAirdropActive" not in content:
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
            print("[+] Injected isSafeAirdropActive helper method into WifiSettings.smali")

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

    # ==========================================
    # 12. SamsungDeviceHealthManagerService (SDHMS) OverheatComplexType safety
    # Guard OverheatComplexType.valueOf against unknown thermal tags (e.g. DEX, MW)
    # ==========================================
    sdhms_siop = os.path.join(apktool_dir, "system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk/smali/com/sec/android/sdhms/settings/SiopExpression.smali")
    if os.path.isfile(sdhms_siop):
        with open(sdhms_siop, "r", encoding="utf-8") as f:
            siop_c = f.read()

        if ":try_start_ovt" not in siop_c:
            target_call = "invoke-static {p2}, Lcom/sec/android/sdhms/thermal/overheatcontrol/overheatcomplex/OverheatComplexType;->valueOf(Ljava/lang/String;)Lcom/sec/android/sdhms/thermal/overheatcontrol/overheatcomplex/OverheatComplexType;\n\n    move-result-object v1"
            repl_call = """:try_start_ovt
    invoke-static {p2}, Lcom/sec/android/sdhms/thermal/overheatcontrol/overheatcomplex/OverheatComplexType;->valueOf(Ljava/lang/String;)Lcom/sec/android/sdhms/thermal/overheatcontrol/overheatcomplex/OverheatComplexType;

    move-result-object v1
    :try_end_ovt
    .catch Ljava/lang/Exception; {:try_start_ovt .. :try_end_ovt} :catch_ovt
    goto :goto_ovt_ok

    :catch_ovt
    goto :goto_0

    :goto_ovt_ok"""

            if target_call in siop_c:
                siop_c = siop_c.replace(target_call, repl_call)
                with open(sdhms_siop, "w", encoding="utf-8") as f:
                    f.write(siop_c)
                print("[+] Patched SDHMS SiopExpression.M -> guarded OverheatComplexType.valueOf with try-catch")

    # ==========================================
    # 13. SystemProperties.smali in framework.jar
    # Guard native_set against SELinux property denial RuntimeExceptions
    # (e.g. persist.sys.setupwizard.jig_on_wifisetup, dev.ssrm.gamelevel)
    # ==========================================
    for smali_root, _, files in os.walk(fw_dir):
        if "SystemProperties.smali" in files:
            sp_path = os.path.join(smali_root, "SystemProperties.smali")
            with open(sp_path, "r", encoding="utf-8") as f:
                sp_c = f.read()

            target_set = ":cond_1\n    :goto_0\n    invoke-static {p0, p1}, Landroid/os/SystemProperties;->native_set(Ljava/lang/String;Ljava/lang/String;)V\n\n    return-void"
            safe_set = """:cond_1
    :goto_0
    :try_start_sp_set
    invoke-static {p0, p1}, Landroid/os/SystemProperties;->native_set(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_sp_set
    .catch Ljava/lang/Throwable; {:try_start_sp_set .. :try_end_sp_set} :catch_sp_set

    return-void

    :catch_sp_set
    move-exception v0

    return-void"""

            if ":try_start_sp_set" not in sp_c and target_set in sp_c:
                sp_c = sp_c.replace(target_set, safe_set)
                with open(sp_path, "w", encoding="utf-8") as f:
                    f.write(sp_c)
                print("[+] Patched SystemProperties.set -> guarded native_set with try-catch")
            elif ":catch_sp_set" in sp_c:
                print("[*] SystemProperties.smali already patched")
            else:
                print("[-] Could not find target native_set block in SystemProperties.smali")

    # ==========================================
    # 14. WifiSetupWizardActivity.smali in SecSettings.apk
    # Neutralize persist.sys.setupwizard.jig_on_wifisetup property sets
    # ==========================================
    sec_settings_dir = os.path.join(apktool_dir, "system/priv-app/SecSettings/SecSettings.apk")
    if os.path.isdir(sec_settings_dir):
        for root, _, files in os.walk(sec_settings_dir):
            if "WifiSetupWizardActivity.smali" in files:
                wsw_path = os.path.join(root, "WifiSetupWizardActivity.smali")
                with open(wsw_path, "r", encoding="utf-8") as f:
                    wsw_c = f.read()

                modified = False
                call1 = "invoke-static {v8, v6}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V"
                if call1 in wsw_c:
                    wsw_c = wsw_c.replace(call1, f"# {call1}")
                    modified = True

                call2 = "invoke-static {v1, v6}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V"
                if call2 in wsw_c:
                    wsw_c = wsw_c.replace(call2, f"# {call2}")
                    modified = True

                if modified:
                    with open(wsw_path, "w", encoding="utf-8") as f:
                        f.write(wsw_c)
                    print("[+] Patched WifiSetupWizardActivity -> neutralized jig_on_wifisetup property sets")

    # ==========================================
    # 15. SiopExpression.smali in SDHMS
    # Guard dev.ssrm.gamelevel property set
    # ==========================================
    if os.path.isfile(sdhms_siop):
        with open(sdhms_siop, "r", encoding="utf-8") as f:
            siop_c = f.read()

        if ":try_start_gamelevel" not in siop_c:
            t_gamelevel = 'const-string v1, "dev.ssrm.gamelevel"\n\n    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V'
            r_gamelevel = """const-string v1, "dev.ssrm.gamelevel"

    :try_start_gamelevel
    invoke-static {v1, v0}, Landroid/os/SystemProperties;->set(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_gamelevel
    .catch Ljava/lang/Throwable; {:try_start_gamelevel .. :try_end_gamelevel} :catch_gamelevel

    :catch_gamelevel"""

            if t_gamelevel in siop_c:
                siop_c = siop_c.replace(t_gamelevel, r_gamelevel)
                with open(sdhms_siop, "w", encoding="utf-8") as f:
                    f.write(siop_c)
                print("[+] Patched SDHMS SiopExpression -> guarded dev.ssrm.gamelevel with try-catch")

    # ==========================================
    # 16. ServiceManager.smali in framework.jar
    # Catch Throwable instead of RemoteException in addService(String, IBinder, boolean, int)
    # This prevents any service (SDHMS, etc.) from crashing when SELinux denies registration
    # ==========================================
    for smali_root, _, files in os.walk(fw_dir):
        if "ServiceManager.smali" in files:
            sm_path = os.path.join(smali_root, "ServiceManager.smali")
            with open(sm_path, "r", encoding="utf-8") as f:
                sm_c = f.read()

            old_catch = """:try_start_0
    invoke-static {}, Landroid/os/ServiceManager;->getIServiceManager()Landroid/os/IServiceManager;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2, p3}, Landroid/os/IServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;ZI)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0"""

            new_catch = """:try_start_0
    invoke-static {}, Landroid/os/ServiceManager;->getIServiceManager()Landroid/os/IServiceManager;

    move-result-object v0

    invoke-interface {v0, p0, p1, p2, p3}, Landroid/os/IServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;ZI)V
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0"""

            if old_catch in sm_c:
                sm_c = sm_c.replace(old_catch, new_catch)
                with open(sm_path, "w", encoding="utf-8") as f:
                    f.write(sm_c)
                print("[+] Patched ServiceManager.addService -> catch Throwable instead of RemoteException")
            elif new_catch in sm_c:
                print("[*] ServiceManager.addService already patched with catch Throwable")
            else:
                print("[-] Could not find target addService block in ServiceManager.smali")

    # ==========================================
    # 17. MainApplication.smali in SDHMS
    # Guard ServiceManager.addService("sdhms", ...) against SecurityException
    # ==========================================
    sdhms_main = os.path.join(apktool_dir, "system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk/smali/com/sec/android/sdhms/MainApplication.smali")
    if os.path.isfile(sdhms_main):
        with open(sdhms_main, "r", encoding="utf-8") as f:
            sdhms_c = f.read()

        t_sdhms_add = 'const-string p2, "sdhms"\n\n    invoke-static {p2, p1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V'
        r_sdhms_add = """const-string p2, "sdhms"

    :try_start_sdhms_reg
    invoke-static {p2, p1}, Landroid/os/ServiceManager;->addService(Ljava/lang/String;Landroid/os/IBinder;)V
    :try_end_sdhms_reg
    .catch Ljava/lang/Throwable; {:try_start_sdhms_reg .. :try_end_sdhms_reg} :catch_sdhms_reg

    :catch_sdhms_reg"""

        if t_sdhms_add in sdhms_c:
            sdhms_c = sdhms_c.replace(t_sdhms_add, r_sdhms_add)
            with open(sdhms_main, "w", encoding="utf-8") as f:
                f.write(sdhms_c)
            print("[+] Patched SDHMS MainApplication -> guarded ServiceManager.addService('sdhms') with try-catch")
        elif ":try_start_sdhms_reg" in sdhms_c:
            print("[*] SDHMS MainApplication.smali already guarded")
        else:
            print("[-] Could not find target addService('sdhms') in SDHMS MainApplication.smali")

    # ==========================================
    # ==========================================
    # 18. SemWifiManager.smali in framework.jar
    # - Non-null fallback to ISemWifiManager$Default in <init>
    # - Safe mService dynamic resolution with getSafeService()
    # - Safe implementations of:
    #   * registerWifiApSmartCallback
    #   * unregisterWifiApSmartCallback
    #   * wifiApBleClientRole
    #   * wifiApBleD2DClientRole
    #   * isAutoWifiEnabled
    #   * isMCfClientMHSDiscoveryGoingon
    #   * getMcfScanDetail
    # ==========================================
    for smali_root, _, files in os.walk(fw_dir):
        if "SemWifiManager.smali" in files:
            swm_path = os.path.join(smali_root, "SemWifiManager.smali")
            with open(swm_path, "r", encoding="utf-8") as f:
                swm_c = f.read()

            # 18.1 Remove final from mService
            swm_c = swm_c.replace(
                ".field private final blacklist mService:Lcom/samsung/android/wifi/ISemWifiManager;",
                ".field private blacklist mService:Lcom/samsung/android/wifi/ISemWifiManager;"
            )

            # 18.2 Inject getSafeService() helper method if not present
            safe_svc_method = """.method private blacklist getSafeService()Lcom/samsung/android/wifi/ISemWifiManager;
    .locals 2

    iget-object v0, p0, Lcom/samsung/android/wifi/SemWifiManager;->mService:Lcom/samsung/android/wifi/ISemWifiManager;

    if-eqz v0, :cond_fetch

    instance-of v1, v0, Lcom/samsung/android/wifi/ISemWifiManager$Default;

    if-nez v1, :cond_fetch

    return-object v0

    :cond_fetch
    :try_start_safe_svc
    const-string/jumbo v1, "sem_wifi"

    invoke-static {v1}, Landroid/os/ServiceManager;->getService(Ljava/lang/String;)Landroid/os/IBinder;

    move-result-object v1

    if-eqz v1, :cond_check_fallback

    invoke-static {v1}, Lcom/samsung/android/wifi/ISemWifiManager$Stub;->asInterface(Landroid/os/IBinder;)Lcom/samsung/android/wifi/ISemWifiManager;

    move-result-object v1

    if-eqz v1, :cond_check_fallback

    iput-object v1, p0, Lcom/samsung/android/wifi/SemWifiManager;->mService:Lcom/samsung/android/wifi/ISemWifiManager;

    return-object v1
    :try_end_safe_svc
    .catch Ljava/lang/Throwable; {:try_start_safe_svc .. :try_end_safe_svc} :catch_safe_svc

    :catch_safe_svc
    :cond_check_fallback
    if-nez v0, :cond_got_service

    new-instance v0, Lcom/samsung/android/wifi/ISemWifiManager$Default;

    invoke-direct {v0}, Lcom/samsung/android/wifi/ISemWifiManager$Default;-><init>()V

    iput-object v0, p0, Lcom/samsung/android/wifi/SemWifiManager;->mService:Lcom/samsung/android/wifi/ISemWifiManager;

    :cond_got_service
    return-object v0
.end method

"""
            if ".method private blacklist getSafeService()Lcom/samsung/android/wifi/ISemWifiManager;" in swm_c:
                swm_c = re.sub(r"\.method private blacklist getSafeService\(\)Lcom/samsung/android/wifi/ISemWifiManager;[\s\S]*?\.end method\s*", safe_svc_method, swm_c)
            else:
                target_ctor = ".method public constructor blacklist <init>(Landroid/content/Context;Lcom/samsung/android/wifi/ISemWifiManager;Landroid/os/Looper;)V"
                if target_ctor in swm_c:
                    swm_c = swm_c.replace(target_ctor, safe_svc_method + target_ctor)
            print("[+] Injected/updated getSafeService() in SemWifiManager.smali")

            # 18.3 Constructor: ensure mService is never null
            ctor_pattern = re.search(r'(\.method public constructor blacklist <init>\(Landroid/content/Context;Lcom/samsung/android/wifi/ISemWifiManager;Landroid/os/Looper;\)V[\s\S]*?\.end method)', swm_c)
            if ctor_pattern:
                safe_ctor = """.method public constructor blacklist <init>(Landroid/content/Context;Lcom/samsung/android/wifi/ISemWifiManager;Landroid/os/Looper;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/samsung/android/wifi/SemWifiManager;->mContext:Landroid/content/Context;

    if-nez p2, :cond_service_valid

    new-instance p2, Lcom/samsung/android/wifi/ISemWifiManager$Default;

    invoke-direct {p2}, Lcom/samsung/android/wifi/ISemWifiManager$Default;-><init>()V

    :cond_service_valid
    iput-object p2, p0, Lcom/samsung/android/wifi/SemWifiManager;->mService:Lcom/samsung/android/wifi/ISemWifiManager;

    return-void
.end method"""
                swm_c = swm_c.replace(ctor_pattern.group(1), safe_ctor)
                print("[+] Patched SemWifiManager.<init> -> safe fallback to ISemWifiManager$Default")

            # 18.4 Replace registerWifiApSmartCallback
            reg_smart_pat = re.search(r'(\.method public blacklist registerWifiApSmartCallback\(Lcom/samsung/android/wifi/SemWifiManager\$SemWifiApSmartCallback;Ljava/util/concurrent/Executor;\)V[\s\S]*?\.end method)', swm_c)
            if reg_smart_pat:
                safe_reg_smart = """.method public blacklist registerWifiApSmartCallback(Lcom/samsung/android/wifi/SemWifiManager$SemWifiApSmartCallback;Ljava/util/concurrent/Executor;)V
    .locals 2

    if-eqz p1, :cond_1

    if-eqz p2, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "registerWifiApSmartCallback: callback="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", executor="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SemWifiManager"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    invoke-virtual {p1}, Lcom/samsung/android/wifi/SemWifiManager$SemWifiApSmartCallback;->getProxy()Lcom/samsung/android/wifi/SemWifiManager$SemWifiApSmartCallback$SemWifiApSmartCallbackProxy;

    move-result-object v0

    invoke-virtual {v0, p2, p1}, Lcom/samsung/android/wifi/SemWifiManager$SemWifiApSmartCallback$SemWifiApSmartCallbackProxy;->initProxy(Ljava/util/concurrent/Executor;Lcom/samsung/android/wifi/SemWifiManager$SemWifiApSmartCallback;)V

    new-instance p2, Landroid/os/Binder;

    invoke-direct {p2}, Landroid/os/Binder;-><init>()V

    :try_start_reg_cb
    invoke-direct {p0}, Lcom/samsung/android/wifi/SemWifiManager;->getSafeService()Lcom/samsung/android/wifi/ISemWifiManager;

    move-result-object p0

    if-eqz p0, :cond_exit_cb

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p1

    invoke-interface {p0, p2, v0, p1}, Lcom/samsung/android/wifi/ISemWifiManager;->registerWifiApSmartCallback(Landroid/os/IBinder;Lcom/samsung/android/wifi/ISemWifiApSmartCallback;I)V
    :try_end_reg_cb
    .catch Ljava/lang/Throwable; {:try_start_reg_cb .. :try_end_reg_cb} :catch_reg_cb

    :cond_exit_cb
    return-void

    :catch_reg_cb
    return-void

    :cond_0
    const-string p0, "executor cannot be null"

    invoke-static {p0}, Landroid/os/Debug$$ExternalSyntheticBUOutline2;->m$3(Ljava/lang/String;)V

    return-void

    :cond_1
    const-string p0, "callback cannot be null"

    invoke-static {p0}, Landroid/os/Debug$$ExternalSyntheticBUOutline2;->m$3(Ljava/lang/String;)V

    return-void
.end method"""
                swm_c = swm_c.replace(reg_smart_pat.group(1), safe_reg_smart)
                print("[+] Patched SemWifiManager.registerWifiApSmartCallback -> safe service & catch Throwable")

            # 18.5 Replace unregisterWifiApSmartCallback
            unreg_smart_pat = re.search(r'(\.method public blacklist unregisterWifiApSmartCallback\(Lcom/samsung/android/wifi/SemWifiManager\$SemWifiApSmartCallback;\)V[\s\S]*?\.end method)', swm_c)
            if unreg_smart_pat:
                safe_unreg_smart = """.method public blacklist unregisterWifiApSmartCallback(Lcom/samsung/android/wifi/SemWifiManager$SemWifiApSmartCallback;)V
    .locals 2

    if-eqz p1, :cond_0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "unregisterWifiApSmartCallback: callback="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SemWifiManager"

    invoke-static {v1, v0}, Landroid/util/Log;->v(Ljava/lang/String;Ljava/lang/String;)I

    :try_start_unreg_cb
    invoke-direct {p0}, Lcom/samsung/android/wifi/SemWifiManager;->getSafeService()Lcom/samsung/android/wifi/ISemWifiManager;

    move-result-object p0

    if-eqz p0, :cond_exit_unreg

    invoke-virtual {p1}, Ljava/lang/Object;->hashCode()I

    move-result p1

    invoke-interface {p0, p1}, Lcom/samsung/android/wifi/ISemWifiManager;->unregisterWifiApSmartCallback(I)V
    :try_end_unreg_cb
    .catch Ljava/lang/Throwable; {:try_start_unreg_cb .. :try_end_unreg_cb} :catch_unreg_cb

    :cond_exit_unreg
    return-void

    :catch_unreg_cb
    return-void

    :cond_0
    const-string p0, "callback cannot be null"

    invoke-static {p0}, Landroid/os/Debug$$ExternalSyntheticBUOutline2;->m$3(Ljava/lang/String;)V

    return-void
.end method"""
                swm_c = swm_c.replace(unreg_smart_pat.group(1), safe_unreg_smart)
                print("[+] Patched SemWifiManager.unregisterWifiApSmartCallback -> safe service & catch Throwable")

            # 18.6 Replace wifiApBleClientRole(Z)Z
            ble_pat = re.search(r'(\.method public blacklist wifiApBleClientRole\(Z\)Z[\s\S]*?\.end method)', swm_c)
            if ble_pat:
                safe_ble = """.method public blacklist wifiApBleClientRole(Z)Z
    .locals 0

    :try_start_ble
    invoke-direct {p0}, Lcom/samsung/android/wifi/SemWifiManager;->getSafeService()Lcom/samsung/android/wifi/ISemWifiManager;

    move-result-object p0

    if-nez p0, :cond_call_ble

    const/4 p0, 0x0

    return p0

    :cond_call_ble
    invoke-interface {p0, p1}, Lcom/samsung/android/wifi/ISemWifiManager;->wifiApBleClientRole(Z)Z

    move-result p0
    :try_end_ble
    .catch Ljava/lang/Throwable; {:try_start_ble .. :try_end_ble} :catch_ble

    return p0

    :catch_ble
    const/4 p0, 0x0

    return p0
.end method"""
                swm_c = swm_c.replace(ble_pat.group(1), safe_ble)
                print("[+] Patched SemWifiManager.wifiApBleClientRole -> safe service & catch Throwable")

            # 18.7 Replace wifiApBleD2DClientRole(Z)Z
            d2d_pat = re.search(r'(\.method public blacklist wifiApBleD2DClientRole\(Z\)Z[\s\S]*?\.end method)', swm_c)
            if d2d_pat:
                safe_d2d = """.method public blacklist wifiApBleD2DClientRole(Z)Z
    .locals 0

    :try_start_d2d
    invoke-direct {p0}, Lcom/samsung/android/wifi/SemWifiManager;->getSafeService()Lcom/samsung/android/wifi/ISemWifiManager;

    move-result-object p0

    if-nez p0, :cond_call_d2d

    const/4 p0, 0x0

    return p0

    :cond_call_d2d
    invoke-interface {p0, p1}, Lcom/samsung/android/wifi/ISemWifiManager;->wifiApBleD2DClientRole(Z)Z

    move-result p0
    :try_end_d2d
    .catch Ljava/lang/Throwable; {:try_start_d2d .. :try_end_d2d} :catch_d2d

    return p0

    :catch_d2d
    const/4 p0, 0x0

    return p0
.end method"""
                swm_c = swm_c.replace(d2d_pat.group(1), safe_d2d)
                print("[+] Patched SemWifiManager.wifiApBleD2DClientRole -> safe service & catch Throwable")

            # 18.8 Replace isAutoWifiEnabled()Z
            target_autowifi = re.search(r'(\.method public blacklist isAutoWifiEnabled\(\)Z[\s\S]*?\.end method)', swm_c)
            if target_autowifi:
                new_autowifi = """.method public blacklist isAutoWifiEnabled()Z
    .locals 1

    :try_start_auto_wifi
    invoke-direct {p0}, Lcom/samsung/android/wifi/SemWifiManager;->getSafeService()Lcom/samsung/android/wifi/ISemWifiManager;

    move-result-object p0

    if-nez p0, :cond_call_autowifi

    const/4 p0, 0x0

    return p0

    :cond_call_autowifi
    invoke-interface {p0}, Lcom/samsung/android/wifi/ISemWifiManager;->isAutoWifiEnabled()Z

    move-result p0

    return p0
    :try_end_auto_wifi
    .catch Ljava/lang/Throwable; {:try_start_auto_wifi .. :try_end_auto_wifi} :catch_autowifi

    :catch_autowifi
    const/4 p0, 0x0

    return p0
.end method"""
                swm_c = swm_c.replace(target_autowifi.group(1), new_autowifi)
                print("[+] Patched SemWifiManager.isAutoWifiEnabled -> safe service fetch & return false on null")

            # 18.9 Replace isMCfClientMHSDiscoveryGoingon()Z
            target_mcf = re.search(r'(\.method public blacklist isMCfClientMHSDiscoveryGoingon\(\)Z[\s\S]*?\.end method)', swm_c)
            if target_mcf:
                new_mcf = """.method public blacklist isMCfClientMHSDiscoveryGoingon()Z
    .locals 1

    :try_start_mcf
    invoke-direct {p0}, Lcom/samsung/android/wifi/SemWifiManager;->getSafeService()Lcom/samsung/android/wifi/ISemWifiManager;

    move-result-object p0

    if-nez p0, :cond_call_mcf

    const/4 p0, 0x0

    return p0

    :cond_call_mcf
    invoke-interface {p0}, Lcom/samsung/android/wifi/ISemWifiManager;->isMCfClientMHSDiscoveryGoingon()Z

    move-result p0

    return p0
    :try_end_mcf
    .catch Ljava/lang/Throwable; {:try_start_mcf .. :try_end_mcf} :catch_mcf

    :catch_mcf
    const/4 p0, 0x0

    return p0
.end method"""
                swm_c = swm_c.replace(target_mcf.group(1), new_mcf)
                print("[+] Patched SemWifiManager.isMCfClientMHSDiscoveryGoingon -> safe service fetch & return false on null")

            # 18.10 Replace getMcfScanDetail()Ljava/util/List;
            target_mcf_scan = re.search(r'(\.method public blacklist getMcfScanDetail\(\)Ljava/util/List;[\s\S]*?\.end method)', swm_c)
            if target_mcf_scan:
                new_mcf_scan = """.method public blacklist getMcfScanDetail()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/samsung/android/wifi/SemWifiApBleScanResult;",
            ">;"
        }
    .end annotation

    :try_start_mcf_scan
    invoke-direct {p0}, Lcom/samsung/android/wifi/SemWifiManager;->getSafeService()Lcom/samsung/android/wifi/ISemWifiManager;

    move-result-object p0

    if-nez p0, :cond_call_mcf_scan

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-object p0

    :cond_call_mcf_scan
    invoke-interface {p0}, Lcom/samsung/android/wifi/ISemWifiManager;->getMcfScanDetail()Ljava/util/List;

    move-result-object p0

    if-nez p0, :cond_ret_mcf_scan

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    :cond_ret_mcf_scan
    return-object p0
    :try_end_mcf_scan
    .catch Ljava/lang/Throwable; {:try_start_mcf_scan .. :try_end_mcf_scan} :catch_mcf_scan

    :catch_mcf_scan
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-object p0
.end method"""
                swm_c = swm_c.replace(target_mcf_scan.group(1), new_mcf_scan)
                print("[+] Patched SemWifiManager.getMcfScanDetail -> safe service fetch & return empty list on null")


            # 18.11 Replace getEasySetupScanSettings()Ljava/util/Map;
            target_easysetup = re.search(r'(\.method public blacklist getEasySetupScanSettings\(\)Ljava/util/Map;[\s\S]*?\.end method)', swm_c)
            if target_easysetup:
                new_easysetup = """.method public blacklist getEasySetupScanSettings()Ljava/util/Map;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Lcom/samsung/android/wifi/SemEasySetupWifiScanSettings;",
            ">;"
        }
    .end annotation

    :try_start_easysetup
    invoke-direct {p0}, Lcom/samsung/android/wifi/SemWifiManager;->getSafeService()Lcom/samsung/android/wifi/ISemWifiManager;

    move-result-object p0

    if-nez p0, :cond_call_easysetup

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    return-object p0

    :cond_call_easysetup
    invoke-interface {p0}, Lcom/samsung/android/wifi/ISemWifiManager;->getEasySetupScanSettings()Ljava/util/Map;

    move-result-object p0

    if-nez p0, :cond_ret_easysetup

    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    :cond_ret_easysetup
    return-object p0
    :try_end_easysetup
    .catch Ljava/lang/Throwable; {:try_start_easysetup .. :try_end_easysetup} :catch_easysetup

    :catch_easysetup
    new-instance p0, Ljava/util/HashMap;

    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    return-object p0
.end method"""
                swm_c = swm_c.replace(target_easysetup.group(1), new_easysetup)
                print("[+] Patched SemWifiManager.getEasySetupScanSettings -> return non-null HashMap")

            # 18.12 Replace getWifiApBleScanDetail()Ljava/util/List;
            target_ble_scan = re.search(r'(\.method public blacklist getWifiApBleScanDetail\(\)Ljava/util/List;[\s\S]*?\.end method)', swm_c)
            if target_ble_scan:
                new_ble_scan = """.method public blacklist getWifiApBleScanDetail()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/samsung/android/wifi/SemWifiApBleScanResult;",
            ">;"
        }
    .end annotation

    :try_start_ble_scan
    invoke-direct {p0}, Lcom/samsung/android/wifi/SemWifiManager;->getSafeService()Lcom/samsung/android/wifi/ISemWifiManager;

    move-result-object p0

    if-nez p0, :cond_call_ble_scan

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-object p0

    :cond_call_ble_scan
    invoke-interface {p0}, Lcom/samsung/android/wifi/ISemWifiManager;->getWifiApBleScanDetail()Ljava/util/List;

    move-result-object p0

    if-nez p0, :cond_ret_ble_scan

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    :cond_ret_ble_scan
    return-object p0
    :try_end_ble_scan
    .catch Ljava/lang/Throwable; {:try_start_ble_scan .. :try_end_ble_scan} :catch_ble_scan

    :catch_ble_scan
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-object p0
.end method"""
                swm_c = swm_c.replace(target_ble_scan.group(1), new_ble_scan)
                print("[+] Patched SemWifiManager.getWifiApBleScanDetail -> return non-null ArrayList")

            # 18.13 Replace getWifiApBleD2DScanDetail()Ljava/util/List;
            target_d2d_scan = re.search(r'(\.method public blacklist getWifiApBleD2DScanDetail\(\)Ljava/util/List;[\s\S]*?\.end method)', swm_c)
            if target_d2d_scan:
                new_d2d_scan = """.method public blacklist getWifiApBleD2DScanDetail()Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/samsung/android/wifi/SemWifiApBleScanResult;",
            ">;"
        }
    .end annotation

    :try_start_d2d_scan
    invoke-direct {p0}, Lcom/samsung/android/wifi/SemWifiManager;->getSafeService()Lcom/samsung/android/wifi/ISemWifiManager;

    move-result-object p0

    if-nez p0, :cond_call_d2d_scan

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-object p0

    :cond_call_d2d_scan
    invoke-interface {p0}, Lcom/samsung/android/wifi/ISemWifiManager;->getWifiApBleD2DScanDetail()Ljava/util/List;

    move-result-object p0

    if-nez p0, :cond_ret_d2d_scan

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    :cond_ret_d2d_scan
    return-object p0
    :try_end_d2d_scan
    .catch Ljava/lang/Throwable; {:try_start_d2d_scan .. :try_end_d2d_scan} :catch_d2d_scan

    :catch_d2d_scan
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-object p0
.end method"""
                swm_c = swm_c.replace(target_d2d_scan.group(1), new_d2d_scan)
                print("[+] Patched SemWifiManager.getWifiApBleD2DScanDetail -> return non-null ArrayList")

            # 18.14 Replace isAirdropInterfaceActive()Z
            target_airdrop = re.search(r'(\.method public blacklist isAirdropInterfaceActive\(\)Z[\s\S]*?\.end method)', swm_c)
            if target_airdrop:
                new_airdrop = """.method public blacklist isAirdropInterfaceActive()Z
    .locals 1

    :try_start_airdrop_active
    invoke-direct {p0}, Lcom/samsung/android/wifi/SemWifiManager;->getSafeService()Lcom/samsung/android/wifi/ISemWifiManager;

    move-result-object p0

    if-nez p0, :cond_call_airdrop_active

    const/4 p0, 0x0

    return p0

    :cond_call_airdrop_active
    invoke-interface {p0}, Lcom/samsung/android/wifi/ISemWifiManager;->isAirdropInterfaceActive()Z

    move-result p0

    return p0
    :try_end_airdrop_active
    .catch Ljava/lang/Throwable; {:try_start_airdrop_active .. :try_end_airdrop_active} :catch_airdrop_active

    :catch_airdrop_active
    const/4 p0, 0x0

    return p0
.end method"""
                swm_c = swm_c.replace(target_airdrop.group(1), new_airdrop)
                print("[+] Patched SemWifiManager.isAirdropInterfaceActive -> return false on error/null")

            with open(swm_path, "w", encoding="utf-8") as f:
                f.write(swm_c)

    # ==========================================
    # 18.b SystemServiceRegistry$198.smali in framework.jar
    # Ensure createService creates SemWifiManager with ISemWifiManager$Default if sem_wifi binder is null
    # ==========================================
    for smali_root, _, files in os.walk(fw_dir):
        for f_name in files:
            if f_name == "SystemServiceRegistry" + chr(36) + "198.smali":
                ssr_path = os.path.join(smali_root, f_name)
                with open(ssr_path, "r", encoding="utf-8") as f:
                    ssr_c = f.read()

                old_ssr = """    invoke-static {p0}, Lcom/samsung/android/wifi/ISemWifiManager$Stub;->asInterface(Landroid/os/IBinder;)Lcom/samsung/android/wifi/ISemWifiManager;

    move-result-object p0

    new-instance v0, Lcom/samsung/android/wifi/SemWifiManager;"""

                new_ssr = """    invoke-static {p0}, Lcom/samsung/android/wifi/ISemWifiManager$Stub;->asInterface(Landroid/os/IBinder;)Lcom/samsung/android/wifi/ISemWifiManager;

    move-result-object p0

    if-nez p0, :cond_has_service

    new-instance p0, Lcom/samsung/android/wifi/ISemWifiManager$Default;

    invoke-direct {p0}, Lcom/samsung/android/wifi/ISemWifiManager$Default;-><init>()V

    :cond_has_service
    new-instance v0, Lcom/samsung/android/wifi/SemWifiManager;"""

                if old_ssr in ssr_c:
                    ssr_c = ssr_c.replace(old_ssr, new_ssr)
                    with open(ssr_path, "w", encoding="utf-8") as f:
                        f.write(ssr_c)
                    print("[+] Patched SystemServiceRegistry$198.smali -> fallback to ISemWifiManager$Default on null binder")
                elif ":cond_has_service" in ssr_c:
                    print("[*] SystemServiceRegistry$198.smali already guarded with fallback")


    # ==========================================
    # 18.c ISemWifiManager$Default.smali in framework.jar
    # Ensure all List/Map returning methods return empty collections instead of null
    # ==========================================
    for smali_root, _, files in os.walk(fw_dir):
        default_name = "ISemWifiManager" + chr(36) + "Default.smali"
        if default_name in files:
            d_path = os.path.join(smali_root, default_name)
            with open(d_path, "r", encoding="utf-8") as f:
                d_c = f.read()

            list_pat = re.compile(r'(\.method public (?:blacklist )?[a-zA-Z0-9_]+\(.*?\))Ljava/util/List;([\s\S]*?)const/4 p0, 0x0(\s+return-object p0\s+\.end method)')
            def rep_list(m):
                return m.group(1) + "Ljava/util/List;" + m.group(2) + "new-instance p0, Ljava/util/ArrayList;\n\n    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V" + m.group(3)
            d_c = list_pat.sub(rep_list, d_c)

            map_pat = re.compile(r'(\.method public (?:blacklist )?[a-zA-Z0-9_]+\(.*?\))Ljava/util/Map;([\s\S]*?)const/4 p0, 0x0(\s+return-object p0\s+\.end method)')
            def rep_map(m):
                return m.group(1) + "Ljava/util/Map;" + m.group(2) + "new-instance p0, Ljava/util/HashMap;\n\n    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V" + m.group(3)
            d_c = map_pat.sub(rep_map, d_c)

            with open(d_path, "w", encoding="utf-8") as f:
                f.write(d_c)
            print("[+] Patched ISemWifiManager$Default.smali -> all List/Map methods return empty collections")

    # ==========================================
    # 19. SemWifiUtils.smali in SecSettings.apk
    # Null-guard and try-catch isAutoWifiEnabled(Context)
    # ==========================================
    if os.path.isdir(sec_settings_dir):
        for root, _, files in os.walk(sec_settings_dir):
            if "SemWifiUtils.smali" in files:
                swu_path = os.path.join(root, "SemWifiUtils.smali")
                with open(swu_path, "r", encoding="utf-8") as f:
                    swu_c = f.read()

                target_swu = re.search(r'(\.method public static isAutoWifiEnabled\(Landroid/content/Context;\)Z[\s\S]*?\.end method)', swu_c)
                if target_swu:
                    safe_swu = """.method public static isAutoWifiEnabled(Landroid/content/Context;)Z
    .locals 1

    :try_start_safe_autowifi
    if-nez p0, :cond_has_ctx

    const/4 p0, 0x0

    return p0

    :cond_has_ctx
    const-string v0, "sem_wifi"

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/samsung/android/wifi/SemWifiManager;

    if-nez p0, :cond_has_mgr

    const/4 p0, 0x0

    return p0

    :cond_has_mgr
    invoke-virtual {p0}, Lcom/samsung/android/wifi/SemWifiManager;->isAutoWifiEnabled()Z

    move-result p0

    return p0
    :try_end_safe_autowifi
    .catch Ljava/lang/Throwable; {:try_start_safe_autowifi .. :try_end_safe_autowifi} :catch_safe_autowifi

    :catch_safe_autowifi
    const/4 p0, 0x0

    return p0
.end method"""
                    swu_c = swu_c.replace(target_swu.group(1), safe_swu)
                    with open(swu_path, "w", encoding="utf-8") as f:
                        f.write(swu_c)
                    print("[+] Patched SemWifiUtils.isAutoWifiEnabled -> safe null-guard & try-catch")

            # ==========================================
            # 20. WifiSettings.smali in SecSettings.apk
            # Null-guard mSemWifiManager calls: isMCfClientMHSDiscoveryGoingon, getMcfScanDetail,
            # wifiApBleClientRole, registerWifiApSmartCallback, unregisterWifiApSmartCallback
            # ==========================================
            if "WifiSettings.smali" in files:
                ws_path = os.path.join(root, "WifiSettings.smali")
                with open(ws_path, "r", encoding="utf-8") as f:
                    ws_c = f.read()

                # Guard isMCfClientMHSDiscoveryGoingon call in updateWifiEntryPreferences
                old_ws_mcf = """    iget-object v0, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mSemWifiManager:Lcom/samsung/android/wifi/SemWifiManager;

    invoke-virtual {v0}, Lcom/samsung/android/wifi/SemWifiManager;->isMCfClientMHSDiscoveryGoingon()Z

    move-result v0

    if-nez v0, :cond_f

    invoke-virtual {p0, v6}, Lcom/samsung/android/settings/wifi/WifiSettings;->startMcfClientMHSDiscovery(Z)V

    :cond_f"""

                new_ws_mcf = """    iget-object v0, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mSemWifiManager:Lcom/samsung/android/wifi/SemWifiManager;

    if-eqz v0, :cond_f

    :try_start_mcf_safe
    invoke-virtual {v0}, Lcom/samsung/android/wifi/SemWifiManager;->isMCfClientMHSDiscoveryGoingon()Z

    move-result v0

    if-nez v0, :cond_f

    invoke-virtual {p0, v6}, Lcom/samsung/android/settings/wifi/WifiSettings;->startMcfClientMHSDiscovery(Z)V
    :try_end_mcf_safe
    .catch Ljava/lang/Throwable; {:try_start_mcf_safe .. :try_end_mcf_safe} :catch_mcf_safe

    :catch_mcf_safe
    :cond_f"""

                if old_ws_mcf in ws_c:
                    ws_c = ws_c.replace(old_ws_mcf, new_ws_mcf)
                    print("[+] Patched WifiSettings -> guarded isMCfClientMHSDiscoveryGoingon with null check & try-catch")

                # Guard getMcfScanDetail call in addAutoHotspotPreference
                old_ws_scan = """    iget-object v3, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mSemWifiManager:Lcom/samsung/android/wifi/SemWifiManager;

    invoke-virtual {v3}, Lcom/samsung/android/wifi/SemWifiManager;->getMcfScanDetail()Ljava/util/List;

    move-result-object v3"""

                new_ws_scan = """    iget-object v3, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mSemWifiManager:Lcom/samsung/android/wifi/SemWifiManager;

    if-eqz v3, :cond_mcf_empty

    :try_start_mcf_scan
    invoke-virtual {v3}, Lcom/samsung/android/wifi/SemWifiManager;->getMcfScanDetail()Ljava/util/List;

    move-result-object v3

    if-nez v3, :cond_mcf_scan_ok

    :cond_mcf_empty
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V
    :try_end_mcf_scan
    .catch Ljava/lang/Throwable; {:try_start_mcf_scan .. :try_end_mcf_scan} :catch_mcf_scan

    goto :cond_mcf_scan_ok

    :catch_mcf_scan
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    :cond_mcf_scan_ok"""

                if old_ws_scan in ws_c:
                    ws_c = ws_c.replace(old_ws_scan, new_ws_scan)
                    print("[+] Patched WifiSettings -> guarded getMcfScanDetail with null check & try-catch")

                # Guard wifiApBleClientRole(Z)V
                old_ble_role = re.search(r'(\.method public final wifiApBleClientRole\(Z\)V[\s\S]*?\.end method)', ws_c)
                if old_ble_role:
                    new_ble_role = """.method public final wifiApBleClientRole(Z)V
    .locals 3

    :try_start_ble_role
    const-string v0, "wifiApBleClientRole() - isEnabled: "

    const-string v1, " mAlreadyCalledAutoHotspotApi : "

    invoke-static {v0, v1, p1}, Landroidx/slice/widget/RowView$$ExternalSyntheticOutline0;->m(Ljava/lang/String;Ljava/lang/String;Z)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-boolean v1, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mAlreadyCalledAutoHotspotApi:Z

    const-string v2, "WifiSettings.AutoHotspot"

    invoke-static {v0, v1, v2}, Landroidx/appcompat/widget/ListPopupWindow$$ExternalSyntheticOutline0;->m(Ljava/lang/StringBuilder;ZLjava/lang/String;)V

    sget-boolean v0, Lcom/android/settings/Utils;->SPF_SupportMobileApEnhanced:Z

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    if-eqz p1, :cond_1

    iget-boolean v0, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mAlreadyCalledAutoHotspotApi:Z

    if-nez v0, :cond_1

    iget-object p1, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mWifiManager:Landroid/net/wifi/WifiManager;

    if-eqz p1, :cond_2

    invoke-virtual {p1}, Landroid/net/wifi/WifiManager;->getWifiState()I

    move-result p1

    const/4 v0, 0x3

    if-ne p1, v0, :cond_2

    const-string p1, "Setting wifiApBleClientRole(true)"

    invoke-static {v2, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    const/4 p1, 0x1

    iput-boolean p1, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mAlreadyCalledAutoHotspotApi:Z

    iget-object p0, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mSemWifiManager:Lcom/samsung/android/wifi/SemWifiManager;

    if-eqz p0, :cond_2

    invoke-virtual {p0, p1}, Lcom/samsung/android/wifi/SemWifiManager;->wifiApBleClientRole(Z)Z

    return-void

    :cond_1
    if-nez p1, :cond_2

    iget-boolean p1, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mAlreadyCalledAutoHotspotApi:Z

    if-eqz p1, :cond_2

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mAlreadyCalledAutoHotspotApi:Z

    iget-object p0, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mSemWifiManager:Lcom/samsung/android/wifi/SemWifiManager;

    if-eqz p0, :cond_2

    invoke-virtual {p0, v0}, Lcom/samsung/android/wifi/SemWifiManager;->wifiApBleClientRole(Z)Z
    :try_end_ble_role
    .catch Ljava/lang/Throwable; {:try_start_ble_role .. :try_end_ble_role} :catch_ble_role

    :catch_ble_role
    :cond_2
    :goto_0
    return-void
.end method"""
                    ws_c = ws_c.replace(old_ble_role.group(1), new_ble_role)
                    print("[+] Patched WifiSettings.wifiApBleClientRole -> guarded with null check & try-catch")

                # Guard registerWifiApSmartCallback in onResume
                old_reg_cb = """    invoke-virtual {v1, v2, v3}, Lcom/samsung/android/wifi/SemWifiManager;->registerWifiApSmartCallback(Lcom/samsung/android/wifi/SemWifiManager$SemWifiApSmartCallback;Ljava/util/concurrent/Executor;)V"""
                new_reg_cb = """:try_start_reg_smart
    if-eqz v1, :cond_4

    invoke-virtual {v1, v2, v3}, Lcom/samsung/android/wifi/SemWifiManager;->registerWifiApSmartCallback(Lcom/samsung/android/wifi/SemWifiManager$SemWifiApSmartCallback;Ljava/util/concurrent/Executor;)V
    :try_end_reg_smart
    .catch Ljava/lang/Throwable; {:try_start_reg_smart .. :try_end_reg_smart} :catch_reg_smart

    :catch_reg_smart"""
                if old_reg_cb in ws_c:
                    ws_c = ws_c.replace(old_reg_cb, new_reg_cb)
                    print("[+] Patched WifiSettings.onResume -> guarded registerWifiApSmartCallback with null check & try-catch")

                # Guard unregisterWifiApSmartCallback in onPause
                old_unreg_cb = """    if-eqz v1, :cond_3

    invoke-virtual {v0, v1}, Lcom/samsung/android/wifi/SemWifiManager;->unregisterWifiApSmartCallback(Lcom/samsung/android/wifi/SemWifiManager$SemWifiApSmartCallback;)V"""
                new_unreg_cb = """:try_start_unreg_smart
    if-eqz v0, :cond_3

    if-eqz v1, :cond_3

    invoke-virtual {v0, v1}, Lcom/samsung/android/wifi/SemWifiManager;->unregisterWifiApSmartCallback(Lcom/samsung/android/wifi/SemWifiManager$SemWifiApSmartCallback;)V
    :try_end_unreg_smart
    .catch Ljava/lang/Throwable; {:try_start_unreg_smart .. :try_end_unreg_smart} :catch_unreg_smart

    :catch_unreg_smart"""
                if old_unreg_cb in ws_c:
                    ws_c = ws_c.replace(old_unreg_cb, new_unreg_cb)
                    print("[+] Patched WifiSettings.onPause -> guarded unregisterWifiApSmartCallback with null check & try-catch")

                with open(ws_path, "w", encoding="utf-8") as f:
                    f.write(ws_c)


            # ==========================================
            # 20.b WifiPickerTracker.smali in SecSettings.apk
            # Guard getEasySetupScanSettings(), getConfiguredNetworks(),
            # and wrap initializeState() & handleOnStart() in try/catch Throwable
            # ==========================================
            if "WifiPickerTracker.smali" in files:
                wpt_path = os.path.join(root, "WifiPickerTracker.smali")
                with open(wpt_path, "r", encoding="utf-8") as f:
                    wpt_c = f.read()

                # Guard getEasySetupScanSettings()
                target_wpt_es = """    invoke-virtual {v1}, Lcom/samsung/android/wifi/SemWifiManager;->getEasySetupScanSettings()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Map;->size()I"""

                safe_wpt_es = """    invoke-virtual {v1}, Lcom/samsung/android/wifi/SemWifiManager;->getEasySetupScanSettings()Ljava/util/Map;

    move-result-object v1

    if-nez v1, :cond_skip_es_null

    goto :cond_4

    :cond_skip_es_null
    invoke-interface {v1}, Ljava/util/Map;->size()I"""

                if target_wpt_es in wpt_c:
                    wpt_c = wpt_c.replace(target_wpt_es, safe_wpt_es)
                    print("[+] Patched WifiPickerTracker.initializeState -> guarded getEasySetupScanSettings with null-check")

                # Guard getConfiguredNetworks()
                target_wpt_cn = """    iget-object v1, p0, Lcom/android/wifitrackerlib/BaseWifiTracker;->mSemWifiManager:Lcom/samsung/android/wifi/SemWifiManager;

    invoke-virtual {v1}, Lcom/samsung/android/wifi/SemWifiManager;->getConfiguredNetworks()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;"""

                safe_wpt_cn = """    iget-object v1, p0, Lcom/android/wifitrackerlib/BaseWifiTracker;->mSemWifiManager:Lcom/samsung/android/wifi/SemWifiManager;

    if-eqz v1, :cond_skip_cn_mgr

    invoke-virtual {v1}, Lcom/samsung/android/wifi/SemWifiManager;->getConfiguredNetworks()Ljava/util/List;

    move-result-object v1

    goto :goto_cn_chk

    :cond_skip_cn_mgr
    const/4 v1, 0x0

    :goto_cn_chk
    if-nez v1, :cond_skip_cn_null

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    :cond_skip_cn_null
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;"""

                if target_wpt_cn in wpt_c:
                    wpt_c = wpt_c.replace(target_wpt_cn, safe_wpt_cn)
                    print("[+] Patched WifiPickerTracker.initializeState -> guarded getConfiguredNetworks with null-check")

                # Wrap handleOnStart in try/catch Throwable
                target_wpt_hos = """.method public final handleOnStart()V
    .locals 0

    invoke-virtual {p0}, Lcom/android/wifitrackerlib/WifiPickerTracker;->initializeState()V

    return-void
.end method"""

                safe_wpt_hos = """.method public final handleOnStart()V
    .locals 0

    :try_start_hos
    invoke-virtual {p0}, Lcom/android/wifitrackerlib/WifiPickerTracker;->initializeState()V
    :try_end_hos
    .catch Ljava/lang/Throwable; {:try_start_hos .. :try_end_hos} :catch_hos

    :catch_hos
    return-void
.end method"""

                if target_wpt_hos in wpt_c:
                    wpt_c = wpt_c.replace(target_wpt_hos, safe_wpt_hos)
                    print("[+] Patched WifiPickerTracker.handleOnStart -> wrapped with try/catch Throwable")

                # Wrap initializeState entirely in try/catch Throwable
                pat_init = re.compile(r'(\.method public final initializeState\(\)V\s+\.locals \d+)\s+([\s\S]*?)(    :cond_a\s+return-void\s+\.end method)')
                m_init = pat_init.search(wpt_c)
                if m_init and ":try_start_init_state" not in wpt_c:
                    wrapped_init = m_init.group(1) + "\n\n    :try_start_init_state\n" + m_init.group(2) + "    :cond_a\n    :try_end_init_state\n    .catch Ljava/lang/Throwable; {:try_start_init_state .. :try_end_init_state} :catch_init_state\n\n    :catch_init_state\n    return-void\n.end method"
                    wpt_c = wpt_c.replace(m_init.group(0), wrapped_init)
                    print("[+] Patched WifiPickerTracker.initializeState -> wrapped with try/catch Throwable")

                with open(wpt_path, "w", encoding="utf-8") as f:
                    f.write(wpt_c)

    # ==========================================
    # 21. motionrecognitionservice.jar in work_dir
    # Disassemble and neutralize MotionRecognitionSAR$1.smali onReceive to eliminate SARDEVICE_CP ANR
    # ==========================================
    if work_dir and os.path.isdir(work_dir):
        for candidate_path in [
            os.path.join(work_dir, "system/system/framework/motionrecognitionservice.jar"),
            os.path.join(work_dir, "system/framework/motionrecognitionservice.jar"),
        ]:
            if os.path.isfile(candidate_path):
                import subprocess, tempfile, zipfile, shutil
                m_tmp = tempfile.mkdtemp(prefix="motion_sar_")
                try:
                    smali_out = os.path.join(m_tmp, "smali")
                    res = subprocess.run(["baksmali", "d", candidate_path, "-o", smali_out], capture_output=True, text=True)
                    if res.returncode == 0:
                        sar_1_name = "MotionRecognitionSAR" + chr(36) + "1.smali"
                        for mroot, _, mfiles in os.walk(smali_out):
                            if sar_1_name in mfiles:
                                sar1_p = os.path.join(mroot, sar_1_name)
                                with open(sar1_p, "r", encoding="utf-8") as f:
                                    sar1_c = f.read()
                                new_sar1_rcv = """.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 0

    return-void
.end method"""
                                sar1_c = re.sub(r'\.method public onReceive\(Landroid/content/Context;Landroid/content/Intent;\)V[\s\S]*?\.end method', new_sar1_rcv, sar1_c)
                                with open(sar1_p, "w", encoding="utf-8") as f:
                                    f.write(sar1_c)
                                print("[+] Patched MotionRecognitionSAR$1.onReceive -> no-op to prevent SARDEVICE_CP ANR")

                        dex_out = os.path.join(m_tmp, "classes.dex")
                        res2 = subprocess.run(["smali", "a", smali_out, "-o", dex_out], capture_output=True, text=True)
                        if res2.returncode == 0 and os.path.isfile(dex_out):
                            jar_tmp = candidate_path + ".tmp"
                            with zipfile.ZipFile(candidate_path, "r") as zin:
                                with zipfile.ZipFile(jar_tmp, "w", compression=zipfile.ZIP_DEFLATED) as zout:
                                    for item in zin.infolist():
                                        if item.filename == "classes.dex":
                                            zout.write(dex_out, "classes.dex")
                                        else:
                                            zout.writestr(item, zin.read(item.filename))
                            os.replace(jar_tmp, candidate_path)
                            print("[+] Successfully updated " + candidate_path + " with safe no-op MotionRecognitionSAR$1!")
                except Exception as e:
                    print("[-] Error patching motionrecognitionservice.jar: " + str(e))
                finally:
                    shutil.rmtree(m_tmp, ignore_errors=True)

    print("[+] All framework, biometrics, settings, and runtime patches applied successfully!")
    return True

if __name__ == "__main__":
    apktool_dir = sys.argv[1] if len(sys.argv) > 1 else "/home/arnav/UN1CA-4.0-M51/out/target/m51/apktool"
    src_dir = sys.argv[2] if len(sys.argv) > 2 else "/home/arnav/UN1CA-4.0-M51"
    work_dir = sys.argv[3] if len(sys.argv) > 3 else "/home/arnav/UN1CA-4.0-M51/out/target/m51/work_dir"
    success = patch_framework_security(apktool_dir, src_dir, work_dir)
    sys.exit(0 if success else 1)
