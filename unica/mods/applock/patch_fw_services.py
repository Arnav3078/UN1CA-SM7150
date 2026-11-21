import os
import sys
import re

def patch_framework(apktool_dir):
    alp_path = None
    for root, dirs, files in os.walk(os.path.join(apktool_dir, 'system/framework/framework.jar')):
        if 'AppLockPolicy.smali' in files:
            alp_path = os.path.join(root, 'AppLockPolicy.smali')
            break
    if not alp_path:
        print('Error: AppLockPolicy.smali not found')
        sys.exit(1)

    with open(alp_path, 'r') as f:
        content = f.read()

    # Clean any old broken clearUnlockedPackage implementation
    content = re.sub(r'\.method public static blacklist clearUnlockedPackage\(Ljava/lang/String;\)V.*?\n\.end method\n?', '', content, flags=re.DOTALL)

    clear_method = """
.method public static blacklist clearUnlockedPackage(Ljava/lang/String;)V
    .locals 2

    sget-object v0, Lcom/android/internal/app/AppLockPolicy;->mInstance:Lcom/android/internal/app/AppLockPolicy;

    if-eqz v0, :cond_3

    if-nez p0, :cond_0

    return-void

    :cond_0
    iget-object v1, v0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedHasUnLockedPackageList:Ljava/util/ArrayList;

    if-eqz v1, :cond_1

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_1
    iget-object v1, v0, Lcom/android/internal/app/AppLockPolicy;->mAppLockedVerifyingList:Ljava/util/ArrayList;

    if-eqz v1, :cond_2

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_2
    iget-object v0, v0, Lcom/android/internal/app/AppLockPolicy;->mAppLockActiveLockedPackages:Ljava/util/ArrayList;

    if-eqz v0, :cond_3

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_3
    return-void
.end method
"""
    content = content + clear_method
    print('- Added valid clearUnlockedPackage to AppLockPolicy.smali')

    # Patch updateLockedApps to strip [ ] and spaces
    bracket_target = '    const-string v3, ","\n\n    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;'
    bracket_repl = """    const-string v3, "["

    const-string v4, ""

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string v3, "]"

    const-string v4, ""

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string v3, " "

    const-string v4, ""

    invoke-virtual {v1, v3, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v1

    const-string v3, ","

    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;"""

    if bracket_target in content:
        content = content.replace(bracket_target, bracket_repl)
        print('- Patched updateLockedApps in AppLockPolicy.smali to strip brackets')

    with open(alp_path, 'w') as f:
        f.write(content)

def patch_services(apktool_dir):
    ats_path = None
    ar_path = None
    for root, dirs, files in os.walk(os.path.join(apktool_dir, 'system/framework/services.jar')):
        if 'ActivityTaskSupervisor.smali' in files:
            ats_path = os.path.join(root, 'ActivityTaskSupervisor.smali')
        if 'ActivityRecord.smali' in files:
            ar_path = os.path.join(root, 'ActivityRecord.smali')

    if ats_path:
        with open(ats_path, 'r') as f:
            ats_content = f.read()

        ats_target = '.method public final cleanUpRemovedTask(Lcom/android/server/wm/Task;ZZ)V\n    .locals 6'
        ats_repl = """.method public final cleanUpRemovedTask(Lcom/android/server/wm/Task;ZZ)V
    .locals 6

    if-eqz p1, :cond_clean_applock

    invoke-virtual {p1}, Lcom/android/server/wm/Task;->getBasePackageName()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_clean_applock

    invoke-static {v0}, Lcom/android/internal/app/AppLockPolicy;->clearUnlockedPackage(Ljava/lang/String;)V

    :cond_clean_applock"""

        if ats_target in ats_content:
            ats_content = ats_content.replace(ats_target, ats_repl)
            with open(ats_path, 'w') as f:
                f.write(ats_content)
            print('- Patched ActivityTaskSupervisor.smali (cleanUpRemovedTask relock)')
        elif 'cond_clean_applock' in ats_content:
            print('- ActivityTaskSupervisor.smali already patched')

    if ar_path:
        with open(ar_path, 'r') as f:
            ar_content = f.read()

        ar_target = '.method public final destroyImmediately(Ljava/lang/String;)Z\n    .locals 11'
        ar_repl = """.method public final destroyImmediately(Ljava/lang/String;)Z
    .locals 11

    iget-object v0, p0, Lcom/android/server/wm/ActivityRecord;->packageName:Ljava/lang/String;

    if-eqz v0, :cond_destroy_applock

    invoke-static {v0}, Lcom/android/internal/app/AppLockPolicy;->clearUnlockedPackage(Ljava/lang/String;)V

    :cond_destroy_applock"""

        if ar_target in ar_content:
            ar_content = ar_content.replace(ar_target, ar_repl)
            with open(ar_path, 'w') as f:
                f.write(ar_content)
            print('- Patched ActivityRecord.smali (destroyImmediately relock)')
        elif 'cond_destroy_applock' in ar_content:
            print('- ActivityRecord.smali already patched')

if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('Usage: patch_fw_services.py <apktool_dir>')
        sys.exit(1)
    apktool_dir = sys.argv[1]
    patch_framework(apktool_dir)
    patch_services(apktool_dir)
