LOG_STEP_IN "- Adding BSOH feature"
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_BATTERY_SUPPORT_BSOH_GALAXYDIAGNOSTICS" "TRUE"
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_BATTERY_SUPPORT_BSOH_SETTINGS" "TRUE"
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_BATTERY_SUPPORT_SBP_INFO_SETTINGS" "TRUE"

DECODE_APK "system" "system/priv-app/SecSettings/SecSettings.apk" || exit 1
SETTINGS_DIR="$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk"
F1="$(find "$SETTINGS_DIR" -name "BatteryRegulatoryPreferenceController.smali" 2>/dev/null | head -n 1)"
F2="$(find "$SETTINGS_DIR" -name "SecBatteryFirstUseDatePreferenceController.smali" 2>/dev/null | head -n 1)"
F3="$(find "$SETTINGS_DIR" -name "SecBatteryInfoFragment.smali" 2>/dev/null | head -n 1)"

if [ -n "$F1" ]; then
    SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
        "${F1#$SETTINGS_DIR/}" \
        "return" "getAvailabilityStatus()I" "0"
fi
if [ -n "$F2" ]; then
    SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
        "${F2#$SETTINGS_DIR/}" \
        "return" "getAvailabilityStatus()I" "0"
fi
if [ -n "$F3" ]; then
    SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
        "${F3#$SETTINGS_DIR/}" \
        "replaceall" "SM-A236B" "$(GET_PROP "system" "ro.product.system.model")"
fi
LOG_STEP_OUT