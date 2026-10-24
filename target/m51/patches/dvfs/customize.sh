APK_PATH="system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk"
DECODE_APK "system" "$APK_PATH" || exit 1
DECODED_DIR="$APKTOOL_DIR/system/$APK_PATH"

SMALI_REL="$(grep -l "SM6375" "$DECODED_DIR/smali/c4/c.smali" "$DECODED_DIR/smali/r1/c.smali" 2>/dev/null | head -n 1)"
if [ -n "$SMALI_REL" ]; then
    SMALI_REL="${SMALI_REL#$DECODED_DIR/}"
else
    SMALI_REL="smali/c4/c.smali"
fi

SMALI_PATCH "system" "$APK_PATH" \
    "$SMALI_REL" "replace" \
    '<clinit>()V' \
    'SM6375' \
    'SM7150'
