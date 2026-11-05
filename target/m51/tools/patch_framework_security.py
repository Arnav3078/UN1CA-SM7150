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

    # 1. ContextImpl.smali
    # - getDisplay() -> return getDisplayNoVerify()
    # - checkPermission() -> bypass ACCESS_TELEPHONY_SIMINFO_DB and MANAGE_ACTIVITY_TASKS
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

        with open(ctx_smali, "w", encoding="utf-8") as f:
            f.write(content)

    # 2. PermissionManager.smali
    # - checkPermission(Ljava/lang/String;III)I -> grant PHONE_UID (0x3e9) & bypass siminfo/tasks
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

        if target_str in content:
            content = content.replace(target_str, replacement_str)
            print("[+] Patched PermissionManager.checkPermission -> auto-grant PHONE_UID & SIMINFO/tasks")

        with open(pm_smali, "w", encoding="utf-8") as f:
            f.write(content)

    # 3. ScreenDecorationsUtils.smali
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

    print("[+] All framework.jar security and display patches applied successfully!")
    return True

if __name__ == "__main__":
    apktool_dir = sys.argv[1] if len(sys.argv) > 1 else "/home/arnav/UN1CA-4.0-M51/out/target/m51/apktool"
    src_dir = sys.argv[2] if len(sys.argv) > 2 else "/home/arnav/UN1CA-4.0-M51"
    work_dir = sys.argv[3] if len(sys.argv) > 3 else "/home/arnav/UN1CA-4.0-M51/out/target/m51/work_dir"
    success = patch_framework_security(apktool_dir, src_dir, work_dir)
    sys.exit(0 if success else 1)
