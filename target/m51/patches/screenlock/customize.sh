DECODE_APK "system" "system/framework/services.jar" || exit 1
DECODED_DIR="$APKTOOL_DIR/system/framework/services.jar"
LOCK_SMALI="$(find "$DECODED_DIR" -name "LockSettingsService.smali" 2>/dev/null | head -n 1)"
if [ -n "$LOCK_SMALI" ]; then
    REL_PATH="${LOCK_SMALI#$DECODED_DIR/}"
    SMALI_PATCH "system" "system/framework/services.jar" \
        "$REL_PATH" "return" \
        'isEnablePrevCredential()Z' \
        'false'
else
    LOG "- LockSettingsService not present in services.jar, skipping"
fi
