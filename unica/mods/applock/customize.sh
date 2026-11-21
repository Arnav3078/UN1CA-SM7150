LOG_STEP_IN "- Adding Samsung AppLock support"

# 1. Decode framework.jar and services.jar
DECODE_APK "system" "system/framework/framework.jar"
DECODE_APK "system" "system/framework/services.jar"

# 2. Enable AppLock in framework CoreRune
if [ -f "$APKTOOL_DIR/system/framework/framework.jar/smali_classes6/com/samsung/android/rune/CoreRune.smali" ]; then
    sed -i 's/sput-boolean v2, Lcom\/samsung\/android\/rune\/CoreRune;->FW_SUPPORT_APPLOCK:Z/const\/4 v2, 0x1\n\n    sput-boolean v2, Lcom\/samsung\/android\/rune\/CoreRune;->FW_SUPPORT_APPLOCK:Z/' \
        "$APKTOOL_DIR/system/framework/framework.jar/smali_classes6/com/samsung/android/rune/CoreRune.smali"
fi

# 3. Patch framework.jar and services.jar smali for AppLock policy and instant relock
python3 "$MODPATH/patch_fw_services.py" "$APKTOOL_DIR"

# 4. Enable AppLock in SecSettings AppLockPreferenceController
DECODE_APK "system" "system/priv-app/SecSettings/SecSettings.apk"
if [ -f "$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk/smali_classes3/com/samsung/android/settings/usefulfeature/applock/AppLockPreferenceController.smali" ]; then
    SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
        "smali_classes3/com/samsung/android/settings/usefulfeature/applock/AppLockPreferenceController.smali" \
        "return" "getAvailabilityStatus()I" "0" 2>/dev/null || true
fi

# 5. Enable AppLock in floating_feature.xml
for ff in "$WORK_DIR/system/system/etc/floating_feature.xml" "$WORK_DIR/vendor/etc/floating_feature.xml"; do
    if [ -f "$ff" ]; then
        sed -i '/SEC_FLOATING_FEATURE_COMMON_SUPPORT_APP_LOCK/d' "$ff"
        sed -i '/SEC_FLOATING_FEATURE_FRAMEWORK_SUPPORT_APP_LOCK/d' "$ff"
        sed -i 's/<\/SecFloatingFeatureSet>/    <SEC_FLOATING_FEATURE_COMMON_SUPPORT_APP_LOCK>TRUE<\/SEC_FLOATING_FEATURE_COMMON_SUPPORT_APP_LOCK>\n    <SEC_FLOATING_FEATURE_FRAMEWORK_SUPPORT_APP_LOCK>TRUE<\/SEC_FLOATING_FEATURE_FRAMEWORK_SUPPORT_APP_LOCK>\n<\/SecFloatingFeatureSet>/' "$ff"
    fi
done

# 6. Patch One UI Home Launcher for native AppLock quickoption
LAUNCHER_APK="$WORK_DIR/system/system/priv-app/TouchWizHome_2017/TouchWizHome_2017.apk"
if [ -f "$LAUNCHER_APK" ]; then
    python3 "$MODPATH/patch_launcher.py" "$LAUNCHER_APK" "$MODPATH/launcher_smali" "$SRC_DIR/security"
fi

LOG_STEP_OUT
