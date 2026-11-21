LOG_STEP_IN "- Adding Samsung AppLock support"

# Enable AppLock in framework CoreRune
if [ -f "$APKTOOL_DIR/system/framework/framework.jar/smali_classes6/com/samsung/android/rune/CoreRune.smali" ]; then
    sed -i 's/sput-boolean v2, Lcom\/samsung\/android\/rune\/CoreRune;->FW_SUPPORT_APPLOCK:Z/const\/4 v2, 0x1\n\n    sput-boolean v2, Lcom\/samsung\/android\/rune\/CoreRune;->FW_SUPPORT_APPLOCK:Z/' \
        "$APKTOOL_DIR/system/framework/framework.jar/smali_classes6/com/samsung/android/rune/CoreRune.smali"
fi

# Enable AppLock in SecSettings AppLockPreferenceController
SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
    "smali_classes3/com/samsung/android/settings/usefulfeature/applock/AppLockPreferenceController.smali" \
    "return" "getAvailabilityStatus()I" "0"

# Enable AppLock in floating_feature.xml
for ff in "$WORK_DIR/system/system/etc/floating_feature.xml" "$WORK_DIR/vendor/etc/floating_feature.xml"; do
    if [ -f "$ff" ]; then
        sed -i '/SEC_FLOATING_FEATURE_COMMON_SUPPORT_APP_LOCK/d' "$ff"
        sed -i '/SEC_FLOATING_FEATURE_FRAMEWORK_SUPPORT_APP_LOCK/d' "$ff"
        sed -i 's/<\/SecFloatingFeatureSet>/    <SEC_FLOATING_FEATURE_COMMON_SUPPORT_APP_LOCK>TRUE<\/SEC_FLOATING_FEATURE_COMMON_SUPPORT_APP_LOCK>\n    <SEC_FLOATING_FEATURE_FRAMEWORK_SUPPORT_APP_LOCK>TRUE<\/SEC_FLOATING_FEATURE_FRAMEWORK_SUPPORT_APP_LOCK>\n<\/SecFloatingFeatureSet>/' "$ff"
    fi
done

LOG_STEP_OUT
