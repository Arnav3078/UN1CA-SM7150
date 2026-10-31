
LOG "- Patching SDHMS to eliminate SSRM Warning"
SMALI_PATCH "system" "system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk" \
    "smali/n5/f1.smali" \
    "null" \
    "M(Landroid/content/Context;Ljava/lang/String;)V"
return 0

_LOG() { if $DEBUG; then LOGW "$1"; else ABORT "$1"; fi }

# SEC_PRODUCT_FEATURE_DVFSAPP_CONFIG_DVFS_POLICY_FILENAME
if [[ "$SOURCE_DVFSAPP_CONFIG_DVFS_POLICY_FILENAME" != "$TARGET_DVFSAPP_CONFIG_DVFS_POLICY_FILENAME" ]]; then
    DECODE_APK "system" "system/framework/ssrm.jar"
    SSRM_FEATURE="$APKTOOL_DIR/system/framework/ssrm.jar/smali/com/android/server/ssrm/Feature.smali"
    if [ -f "$SSRM_FEATURE" ] && grep -q "$SOURCE_DVFSAPP_CONFIG_DVFS_POLICY_FILENAME" "$SSRM_FEATURE"; then
        SMALI_PATCH "system" "system/framework/ssrm.jar" \
            "smali/com/android/server/ssrm/Feature.smali" "replace" \
            "<clinit>()V" \
            "$SOURCE_DVFSAPP_CONFIG_DVFS_POLICY_FILENAME" \
            "$TARGET_DVFSAPP_CONFIG_DVFS_POLICY_FILENAME"
    fi

    DECODE_APK "system" "system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk"
    SDHMS_DIR="$APKTOOL_DIR/system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk"

    if [ -f "$SRC_DIR/target/$TARGET_CODENAME/dvfs/$TARGET_DVFSAPP_CONFIG_DVFS_POLICY_FILENAME.xml" ]; then
        LOG "- Adding /system/system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk/res/raw/$TARGET_DVFSAPP_CONFIG_DVFS_POLICY_FILENAME.xml"
        EVAL "cp -a \"$SRC_DIR/target/$TARGET_CODENAME/dvfs/$TARGET_DVFSAPP_CONFIG_DVFS_POLICY_FILENAME.xml\" \"$SDHMS_DIR/res/raw/$TARGET_DVFSAPP_CONFIG_DVFS_POLICY_FILENAME.xml\""
    elif [ ! -f "$SDHMS_DIR/res/raw/$TARGET_DVFSAPP_CONFIG_DVFS_POLICY_FILENAME.xml" ]; then
        _LOG "\"$TARGET_DVFSAPP_CONFIG_DVFS_POLICY_FILENAME\" does not exist in SDHMS app"
    fi

    for smali_f in $(grep -rl "$SOURCE_DVFSAPP_CONFIG_DVFS_POLICY_FILENAME" "$SDHMS_DIR"/smali* 2>/dev/null); do
        SMALI_REL="${smali_f#$SDHMS_DIR/}"
        SMALI_PATCH "system" "system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk" \
            "$SMALI_REL" "replaceall" \
            "$SOURCE_DVFSAPP_CONFIG_DVFS_POLICY_FILENAME" \
            "$TARGET_DVFSAPP_CONFIG_DVFS_POLICY_FILENAME"
    done
fi

# SEC_PRODUCT_FEATURE_DVFSAPP_CONFIG_SSRM_POLICY_FILENAME
if [[ "$SOURCE_DVFSAPP_CONFIG_SSRM_POLICY_FILENAME" != "$TARGET_DVFSAPP_CONFIG_SSRM_POLICY_FILENAME" ]]; then
    SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_SYSTEM_CONFIG_SIOP_POLICY_FILENAME" "$TARGET_DVFSAPP_CONFIG_SSRM_POLICY_FILENAME"

    DECODE_APK "system" "system/framework/ssrm.jar"
    SSRM_FEATURE="$APKTOOL_DIR/system/framework/ssrm.jar/smali/com/android/server/ssrm/Feature.smali"
    if [ -f "$SSRM_FEATURE" ] && grep -q "$SOURCE_DVFSAPP_CONFIG_SSRM_POLICY_FILENAME" "$SSRM_FEATURE"; then
        SMALI_PATCH "system" "system/framework/ssrm.jar" \
            "smali/com/android/server/ssrm/Feature.smali" "replace" \
            "<clinit>()V" \
            "$SOURCE_DVFSAPP_CONFIG_SSRM_POLICY_FILENAME" \
            "$TARGET_DVFSAPP_CONFIG_SSRM_POLICY_FILENAME"
    fi

    DECODE_APK "system" "system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk"
    SDHMS_DIR="$APKTOOL_DIR/system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk"

    if [[ "$SOURCE_DVFSAPP_CONFIG_SSRM_POLICY_FILENAME" != "ssrm_default" ]] && \
            [[ "$TARGET_DVFSAPP_CONFIG_SSRM_POLICY_FILENAME" == "ssrm_default" ]]; then
        [ -f "$SDHMS_DIR/assets/siop_default" ] && rm -f "$SDHMS_DIR/assets/siop_default"
        [ -f "$SDHMS_DIR/assets/siop_model" ] && rm -f "$SDHMS_DIR/assets/siop_model"
        [ -f "$SDHMS_DIR/assets/ssrm_default" ] && rm -f "$SDHMS_DIR/assets/ssrm_default"
        cp -a "$MODPATH/assets/siop_default.xml" "$SDHMS_DIR/assets/siop_default.xml"
        cp -a "$MODPATH/assets/siop_default.xml" "$SDHMS_DIR/assets/ssrm_default.xml"
    fi

    for smali_f in $(grep -rl "$SOURCE_DVFSAPP_CONFIG_SSRM_POLICY_FILENAME" "$SDHMS_DIR"/smali* 2>/dev/null); do
        SMALI_REL="${smali_f#$SDHMS_DIR/}"
        SMALI_PATCH "system" "system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk" \
            "$SMALI_REL" "replaceall" \
            "$SOURCE_DVFSAPP_CONFIG_SSRM_POLICY_FILENAME" \
            "$TARGET_DVFSAPP_CONFIG_SSRM_POLICY_FILENAME"
    done
fi

if [ -f "$SRC_DIR/target/$TARGET_CODENAME/dvfs/siop_model.xml" ]; then
    DECODE_APK "system" "system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk"
    SDHMS_DIR="$APKTOOL_DIR/system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk"

    [ -f "$SDHMS_DIR/assets/siop_default" ] && rm -f "$SDHMS_DIR/assets/siop_default"
    [ -f "$SDHMS_DIR/assets/siop_model" ] && rm -f "$SDHMS_DIR/assets/siop_model"
    [ -f "$SDHMS_DIR/assets/ssrm_default" ] && rm -f "$SDHMS_DIR/assets/ssrm_default"

    cp -a "$MODPATH/assets/siop_default.xml" "$SDHMS_DIR/assets/siop_default.xml"
    cp -a "$SRC_DIR/target/$TARGET_CODENAME/dvfs/siop_model.xml" "$SDHMS_DIR/assets/$TARGET_DVFSAPP_CONFIG_SSRM_POLICY_FILENAME.xml"
    cp -a "$MODPATH/assets/siop_default.xml" "$SDHMS_DIR/assets/ssrm_default.xml"
else
    if [[ "$SOURCE_DVFSAPP_CONFIG_SSRM_POLICY_FILENAME" != "$TARGET_DVFSAPP_CONFIG_SSRM_POLICY_FILENAME" ]] && \
            [[ "$TARGET_DVFSAPP_CONFIG_SSRM_POLICY_FILENAME" != "ssrm_default" ]]; then
        _LOG "File not found: $SRC_DIR/target/$TARGET_CODENAME/dvfs/siop_model.xml"
    fi
fi

unset -f _LOG
