if [[ "$(GET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_FMRADIO_CONFIG_CHIP_VENDOR")" == "0" ]]; then
    LOG "\033[0;33m! Nothing to do\033[0m"
    return 0
fi

if [ ! "$(GET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_FMRADIO_SUPPORT_EXTERNAL_RADIO_CHIPSET")" ]; then
    if [ ! -f "$WORK_DIR/system/system/lib64/libfmradio_jni.so" ]; then
        ABORT "SEC_FLOATING_FEATURE_FMRADIO_SUPPORT_EXTERNAL_RADIO_CHIPSET is not set but \"libfmradio_jni.so\" is missing in /system/system/lib64"
    fi
fi

ADD_TO_WORK_DIR "m44xktt" "system" "system/etc/permissions/com.samsung.wrappers.libFmRadioImpl.FmRadio.xml" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "m44xktt" "system" "system/etc/permissions/privapp-permissions-com.sec.android.app.fm.xml" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "m44xktt" "system" "system/etc/permissions/signature-permissions-com.sec.android.app.fm.xml" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "m44xktt" "system" "system/etc/sysconfig/preinstalled-packages-com.sec.android.app.fm.xml" 0 0 644 "u:object_r:system_file:s0"
ADD_TO_WORK_DIR "m44xktt" "system" "system/framework/samsungfmradiolib.jar" 0 0 644 "u:object_r:system_file:s0"
TARGET_FW_PATH="$(cut -d "/" -f 1 -s <<< "$TARGET_FIRMWARE")_$(cut -d "/" -f 2 -s <<< "$TARGET_FIRMWARE")"
if [ -f "$FW_DIR/$TARGET_FW_PATH/system/system/priv-app/HybridRadio/HybridRadio.apk" ]; then
    LOG "- Adding FM Radio app from target stock firmware"
    mkdir -p "$WORK_DIR/system/system/priv-app/HybridRadio"
    cp -a "$FW_DIR/$TARGET_FW_PATH/system/system/priv-app/HybridRadio/HybridRadio.apk" "$WORK_DIR/system/system/priv-app/HybridRadio/HybridRadio.apk"
else
    DOWNLOAD_URL="$(GET_GALAXY_STORE_DOWNLOAD_URL "com.sec.android.app.fm" 2>/dev/null || true)"
    if [ -n "$DOWNLOAD_URL" ]; then
        LOG "- Downloading latest FM Radio app"
        DOWNLOAD_FILE "$DOWNLOAD_URL" "$WORK_DIR/system/system/priv-app/HybridRadio/HybridRadio.apk"
    fi
fi
SET_METADATA "system" "system/priv-app/HybridRadio" 0 0 755 "u:object_r:system_file:s0"
SET_METADATA "system" "system/priv-app/HybridRadio/HybridRadio.apk" 0 0 644 "u:object_r:system_file:s0"
