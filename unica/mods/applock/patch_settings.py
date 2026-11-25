import os
import sys

def patch_sec_settings(apktool_dir):
    settings_dir = os.path.join(apktool_dir, 'system/priv-app/SecSettings/SecSettings.apk')
    if not os.path.isdir(settings_dir):
        print('Error: decoded SecSettings.apk not found at', settings_dir)
        sys.exit(1)

    # 1. Add App lock to Settings -> Security and privacy -> More privacy settings (One UI 9.5 location)
    privacy_xml = os.path.join(settings_dir, 'res/xml/sec_other_privacy_settings.xml')
    if os.path.isfile(privacy_xml):
        with open(privacy_xml, 'r', encoding='utf-8') as f:
            xml_content = f.read()

        applock_pref = (
            '    <SecPreferenceScreen android:title="@string/applock_app_name" '
            'android:key="key_applock_privacy" android:order="-952" '
            'settings:keywords="@string/keywords_app_lock_settings">\n'
            '        <intent android:targetPackage="com.samsung.android.applock" '
            'android:action="android.intent.action.MAIN" '
            'android:targetClass="com.samsung.android.applock.settings.AppLockSettingsActivity" />\n'
            '    </SecPreferenceScreen>'
        )

        if 'key_applock_privacy' not in xml_content:
            anchor = 'android:key="samsung_privacy_category" android:order="-1000" settings:controller="com.samsung.android.settings.privacy.SamsungPrivacyCategoryPreferenceController" />'
            if anchor in xml_content:
                xml_content = xml_content.replace(anchor, anchor + '\n' + applock_pref, 1)
                with open(privacy_xml, 'w', encoding='utf-8') as f:
                    f.write(xml_content)
                print('- Added App lock entry to sec_other_privacy_settings.xml')
            else:
                print('Warning: anchor not found in sec_other_privacy_settings.xml')
        else:
            print('- sec_other_privacy_settings.xml already has key_applock_privacy')

    # 2. Index App lock in Usefulfeature$1 search provider unconditionally (bypass SUPPORT_SMARTMANAGER_CN)
    useful_search = os.path.join(
        settings_dir,
        'smali_classes3/com/samsung/android/settings/usefulfeature/Usefulfeature$1.smali'
    )
    if os.path.isfile(useful_search):
        with open(useful_search, 'r', encoding='utf-8') as f:
            s_content = f.read()

        target = (
            '    sget-boolean v0, Lcom/samsung/android/settings/Rune;->SUPPORT_SMARTMANAGER_CN:Z\n\n'
            '    const v1, 0x7f153aff\n\n'
            '    if-eqz v0, :cond_0\n\n'
            '    invoke-static {}, Landroid/os/UserHandle;->myUserId()I\n\n'
            '    move-result v0\n\n'
            '    invoke-static {p1}, Lcom/samsung/android/settings/SecUserUtil;->getMainUserId(Landroid/content/Context;)I\n\n'
            '    move-result v2\n\n'
            '    if-ne v0, v2, :cond_0'
        )
        repl = (
            '    const/4 v0, 0x1\n\n'
            '    const v1, 0x7f153aff\n\n'
            '    if-eqz v0, :cond_0\n\n'
            '    invoke-static {}, Landroid/os/UserHandle;->myUserId()I\n\n'
            '    move-result v0\n\n'
            '    invoke-static {p1}, Lcom/samsung/android/settings/SecUserUtil;->getMainUserId(Landroid/content/Context;)I\n\n'
            '    move-result v2\n\n'
            '    if-ne v0, v2, :cond_0'
        )
        if target in s_content:
            s_content = s_content.replace(target, repl, 1)
            with open(useful_search, 'w', encoding='utf-8') as f:
                f.write(s_content)
            print('- Enabled App lock Settings Search indexing in Usefulfeature$1.smali')
        elif 'const/4 v0, 0x1\n\n    const v1, 0x7f153aff' in s_content:
            print('- Usefulfeature$1.smali already patched')
        else:
            print('Warning: Usefulfeature$1.smali search pattern not found')

    # 3. Ensure AppLockPreferenceController mHost null-safety
    ctrl_smali = os.path.join(
        settings_dir,
        'smali_classes3/com/samsung/android/settings/usefulfeature/applock/AppLockPreferenceController.smali'
    )
    if os.path.isfile(ctrl_smali):
        with open(ctrl_smali, 'r', encoding='utf-8') as f:
            c_content = f.read()

        host_target = (
            '    iget-object v0, p0, Lcom/samsung/android/settings/usefulfeature/applock/AppLockPreferenceController;->mHost:Lcom/samsung/android/settings/usefulfeature/Usefulfeature;\n\n'
            '    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;\n\n'
            '    move-result-object v0\n\n'
            '    invoke-virtual {p0, v0}, Lcom/samsung/android/settings/usefulfeature/applock/AppLockPreferenceController;->isInMultiWindow(Landroid/app/Activity;)Z\n\n'
            '    move-result v0'
        )
        host_repl = (
            '    iget-object v0, p0, Lcom/samsung/android/settings/usefulfeature/applock/AppLockPreferenceController;->mHost:Lcom/samsung/android/settings/usefulfeature/Usefulfeature;\n\n'
            '    if-eqz v0, :cond_host_null\n\n'
            '    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/FragmentActivity;\n\n'
            '    move-result-object v0\n\n'
            '    if-eqz v0, :cond_host_null\n\n'
            '    invoke-virtual {p0, v0}, Lcom/samsung/android/settings/usefulfeature/applock/AppLockPreferenceController;->isInMultiWindow(Landroid/app/Activity;)Z\n\n'
            '    move-result v0\n\n'
            '    goto :goto_host_checked\n\n'
            '    :cond_host_null\n'
            '    const/4 v0, 0x0\n\n'
            '    :goto_host_checked'
        )
        if host_target in c_content:
            c_content = c_content.replace(host_target, host_repl, 1)
            with open(ctrl_smali, 'w', encoding='utf-8') as f:
                f.write(c_content)
            print('- Added mHost null check to AppLockPreferenceController.smali')


if __name__ == '__main__':
    if len(sys.argv) < 2:
        print('Usage: patch_settings.py <apktool_dir>')
        sys.exit(1)
    patch_sec_settings(sys.argv[1])
