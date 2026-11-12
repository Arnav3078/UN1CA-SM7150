DECODE_APK "system" "system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk"

if grep -q "SM6375" "$APKTOOL_DIR/system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk/smali/c4/c.smali" 2>/dev/null; then
    SMALI_PATCH "system" "system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk" \
        "smali/c4/c.smali" "replace" \
        '<clinit>()V' \
        'SM6375' \
        'SM7150'
fi

BODY='    .locals 1\n    const-class v0, Lcom/sec/android/sdhms/thermal/overheatcontrol/overheatcomplex/OverheatComplexType;\n    :try_start_0\n    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;\n    move-result-object p0\n    check-cast p0, Lcom/sec/android/sdhms/thermal/overheatcontrol/overheatcomplex/OverheatComplexType;\n    :try_end_0\n    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0\n    return-object p0\n    :catch_0\n    sget-object p0, Lcom/sec/android/sdhms/thermal/overheatcontrol/overheatcomplex/OverheatComplexType;->h:Lcom/sec/android/sdhms/thermal/overheatcontrol/overheatcomplex/OverheatComplexType;\n    return-object p0'

SMALI_PATCH "system" "system/priv-app/SamsungDeviceHealthManagerService/SamsungDeviceHealthManagerService.apk" \
    "smali/com/sec/android/sdhms/thermal/overheatcontrol/overheatcomplex/OverheatComplexType.smali" "replacebody" \
    'valueOf(Ljava/lang/String;)Lcom/sec/android/sdhms/thermal/overheatcontrol/overheatcomplex/OverheatComplexType;' \
    "$BODY"

