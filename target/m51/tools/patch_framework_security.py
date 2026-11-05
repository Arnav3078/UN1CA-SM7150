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
        if old_set_int and "getDeclaredField" not in old_set_int.group(1):
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
                "    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)\n"
                "\n"
                "    const/4 v1, 0x0\n"
                "\n"
                "    invoke-virtual {v0, v1, p1}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)\n"
                "\n"
                "    const/4 v1, 0x0\n"
                "\n"
                "    invoke-virtual {v0, v1, p1}, Ljava/lang/reflect/Field;->setAccessible(Z)\n"
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
            with open(sem_wifi_smali, "w", encoding="utf-8") as f:
                f.write(content)
            print("[+] Patched SemWifiManager.isAirdropInterfaceActive -> safe null check and try-catch")

    # ==========================================
    # 8. WifiSettings.smali in SecSettings.apk
    # Null check mSemWifiManager before isAirdropInterfaceActive
    # ==========================================
    wifi_settings_smali = os.path.join(apktool_dir, "system/priv-app/SecSettings/SecSettings.apk/smali_classes4/com/samsung/android/settings/wifi/WifiSettings.smali")
    if os.path.isfile(wifi_settings_smali):
        with open(wifi_settings_smali, "r", encoding="utf-8") as f:
            content = f.read()

        target_wifi = """    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v3, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mSemWifiManager:Lcom/samsung/android/wifi/SemWifiManager;

    invoke-virtual {v3}, Lcom/samsung/android/wifi/SemWifiManager;->isAirdropInterfaceActive()Z"""

        repl_wifi = """    invoke-static {v0, v3}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    iget-object v3, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mSemWifiManager:Lcom/samsung/android/wifi/SemWifiManager;

    if-nez v3, :cond_airdrop_chk_1

    iget-object p0, p0, Lcom/samsung/android/settings/wifi/WifiSettings;->mListController:Lcom/samsung/android/settings/wifi/WifiSettingsListController;

    if-eqz p0, :cond_ret_airdrop_null

    invoke-virtual {p0}, Lcom/samsung/android/settings/wifi/WifiSettingsListController;->destroyAutoHotspot()V

    :cond_ret_airdrop_null
    return-void

    :cond_airdrop_chk_1
    invoke-virtual {v3}, Lcom/samsung/android/wifi/SemWifiManager;->isAirdropInterfaceActive()Z"""

        if target_wifi in content:
            content = content.replace(target_wifi, repl_wifi)
            with open(wifi_settings_smali, "w", encoding="utf-8") as f:
                f.write(content)
            print("[+] Patched SecSettings.WifiSettings -> safe null check for mSemWifiManager")

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

    print("[+] All framework, biometrics, settings, and runtime patches applied successfully!")
    return True

if __name__ == "__main__":
    apktool_dir = sys.argv[1] if len(sys.argv) > 1 else "/home/arnav/UN1CA-4.0-M51/out/target/m51/apktool"
    src_dir = sys.argv[2] if len(sys.argv) > 2 else "/home/arnav/UN1CA-4.0-M51"
    work_dir = sys.argv[3] if len(sys.argv) > 3 else "/home/arnav/UN1CA-4.0-M51/out/target/m51/work_dir"
    success = patch_framework_security(apktool_dir, src_dir, work_dir)
    sys.exit(0 if success else 1)
