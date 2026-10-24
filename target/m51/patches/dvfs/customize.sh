APK_PATH="system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk"
DECODE_APK "system" "$APK_PATH" || exit 1
DECODED_DIR="$APKTOOL_DIR/system/$APK_PATH"

for smali_file in $(grep -rl "SM6375" "$DECODED_DIR"/smali* 2>/dev/null); do
    SMALI_REL="${smali_file#$DECODED_DIR/}"
    SMALI_PATCH "system" "$APK_PATH" \
        "$SMALI_REL" "replace" \
        '<clinit>()V' \
        'SM6375' \
        'SM7150'
done
