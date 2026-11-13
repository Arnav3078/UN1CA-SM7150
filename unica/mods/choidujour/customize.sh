# shellcheck disable=SC2034
SKIPUNZIP=1

ADD_TO_WORK_DIR "$MODPATH" "system" "." 0 0 755 "u:object_r:system_file:s0"

# ChoiDujour.apk is prebuilt & patched for Arnav3078/UN1CA-M51-Updates

LOG "- Patching /system/system/etc/security/otacerts.zip"
EVAL "rm \"$WORK_DIR/system/system/etc/security/otacerts.zip\""
EVAL "cd \"$SRC_DIR\"; zip -q \"$WORK_DIR/system/system/etc/security/otacerts.zip\" \"./security/aosp_testkey.x509.pem\""

PRELOAD_XML="$WORK_DIR/system/system/etc/sysconfig/allowed-system-preload-apps.xml"
if [ -f "$PRELOAD_XML" ] && ! grep -q "io.mesalabs.choidujour" "$PRELOAD_XML"; then
    LOG "- Adding ChoiDujour to allowed-system-preload-apps.xml"
    sed -i '/<\/config>/i \    <allowed-system-preload package="io.mesalabs.choidujour"/>' "$PRELOAD_XML"
fi

SHAREDUID_XML="$WORK_DIR/system/system/etc/sysconfig/package-shareduid-allowlist.xml"
if [ -f "$SHAREDUID_XML" ] && ! grep -q "io.mesalabs.choidujour" "$SHAREDUID_XML"; then
    LOG "- Adding ChoiDujour to package-shareduid-allowlist.xml"
    sed -i '/<\/config>/i \    <allow-package-shareduid package="io.mesalabs.choidujour" shareduid="android.uid.system"/>' "$SHAREDUID_XML"
fi

PLAT_MAC_XML="$WORK_DIR/system/system/etc/selinux/plat_mac_permissions.xml"
AOSP_CERT_SIG="308204a830820390a003020102020900b3998086d056cffa300d06092a864886f70d0101040500308194310b3009060355040613025553311330110603550408130a43616c69666f726e6961311630140603550407130d4d6f756e7461696e20566965773110300e060355040a1307416e64726f69643110300e060355040b1307416e64726f69643110300e06035504031307416e64726f69643122302006092a864886f70d0109011613616e64726f696440616e64726f69642e636f6d301e170d3038303431353232343035305a170d3335303930313232343035305a308194310b3009060355040613025553311330110603550408130a43616c69666f726e6961311630140603550407130d4d6f756e7461696e20566965773110300e060355040a1307416e64726f69643110300e060355040b1307416e64726f69643110300e06035504031307416e64726f69643122302006092a864886f70d0109011613616e64726f696440616e64726f69642e636f6d30820120300d06092a864886f70d01010105000382010d003082010802820101009c780592ac0d5d381cdeaa65ecc8a6006e36480c6d7207b12011be50863aabe2b55d009adf7146d6f2202280c7cd4d7bdb26243b8a806c26b34b137523a49268224904dc01493e7c0acf1a05c874f69b037b60309d9074d24280e16bad2a8734361951eaf72a482d09b204b1875e12ac98c1aa773d6800b9eafde56d58bed8e8da16f9a360099c37a834a6dfedb7b6b44a049e07a269fccf2c5496f2cf36d64df90a3b8d8f34a3baab4cf53371ab27719b3ba58754ad0c53fc14e1db45d51e234fbbe93c9ba4edf9ce54261350ec535607bf69a2ff4aa07db5f7ea200d09a6c1b49e21402f89ed1190893aab5a9180f152e82f85a45753cf5fc19071c5eec827020103a381fc3081f9301d0603551d0e041604144fe4a0b3dd9cba29f71d7287c4e7c38f2086c2993081c90603551d230481c13081be80144fe4a0b3dd9cba29f71d7287c4e7c38f2086c299a1819aa48197308194310b3009060355040613025553311330110603550408130a43616c69666f726e6961311630140603550407130d4d6f756e7461696e20566965773110300e060355040a1307416e64726f69643110300e060355040b1307416e64726f69643110300e06035504031307416e64726f69643122302006092a864886f70d0109011613616e64726f696440616e64726f69642e636f6d820900b3998086d056cffa300c0603551d13040530030101ff300d06092a864886f70d01010405000382010100572551b8d93a1f73de0f6d469f86dad6701400293c88a0cd7cd778b73dafcc197fab76e6212e56c1c761cfc42fd733de52c50ae08814cefc0a3b5a1a4346054d829f1d82b42b2048bf88b5d14929ef85f60edd12d72d55657e22e3e85d04c831d613d19938bb8982247fa321256ba12d1d6a8f92ea1db1c373317ba0c037f0d1aff645aef224979fba6e7a14bc025c71b98138cef3ddfc059617cf24845cf7b40d6382f7275ed738495ab6e5931b9421765c491b72fb68e080dbdb58c2029d347c8b328ce43ef6a8b15533edfbe989bd6a48dd4b202eda94c6ab8dd5b8399203daae2ed446232e4fe9bd961394c6300e5138e3cfd285e6e4e483538cb8b1b357"
if [ -f "$PLAT_MAC_XML" ] && ! grep -q "$AOSP_CERT_SIG" "$PLAT_MAC_XML"; then
    LOG "- Adding ChoiDujour platform certificate to plat_mac_permissions.xml"
    sed -i "s|<\/policy>|<signer signature=\"$AOSP_CERT_SIG\"><seinfo value=\"platform\"\/><\/signer><\/policy>|" "$PLAT_MAC_XML"
fi

DECODE_APK "system" "system/priv-app/SecSettings/SecSettings.apk"

APPLY_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
    "$MODPATH/suggestions/SecSettings.apk/0001-Launch-UN1CA-Updates-from-suggestions.patch"

# Disable stock OTA references
if grep -q "isOTAUpgradeAllowed" "$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk/smali_classes3/com/samsung/android/settings/softwareupdate/SoftwareUpdateUtils.smali" 2>/dev/null; then
    SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
        "smali_classes3/com/samsung/android/settings/softwareupdate/SoftwareUpdateUtils.smali" "return" \
        "isOTAUpgradeAllowed(Landroid/content/Context;)Z" "false"
fi

if [ -f "$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk/smali_classes3/com/samsung/android/settings/homepage/TopLevelSoftwareUpdatePreferenceController.smali" ]; then
    SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
        "smali_classes3/com/samsung/android/settings/homepage/TopLevelSoftwareUpdatePreferenceController.smali" "return" \
        "getAvailabilityStatus()I" "3"
fi

# Dynamically patch SecSettings
# - Add missing/non-xml files in place
# - Patch existing files
#   - Use the first line of the file to tell sed how to apply the rest of the content
#   - Exception made for files under *res/values* where the "resources" tag gets nuked
while IFS= read -r f; do
    f="${f//$MODPATH\/SecSettings.apk\//}"

    if [ ! -f "$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk/$f" ] || \
            [[ "$f" != *".xml" ]]; then
        LOG "- Adding \"$f\" to /system/system/priv-app/SecSettings.apk"
        EVAL "mkdir -p \"$(dirname "$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk/$f")\""
        EVAL "cp -a \"$MODPATH/SecSettings.apk/${f//\$/\\$}\" \"$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk/${f//\$/\\$}\""
    else
        LOG "- Patching \"$f\" in /system/system/priv-app/SecSettings.apk"
        if [[ "$f" == *"res/values"* ]]; then
            PATCH_INST="/<\/resources>/i"
            CONTENT="$(sed -e "/?xml/d" -e "/resources>/d" "$MODPATH/SecSettings.apk/$f")"
        else
            PATCH_INST="$(head -n 1 "$MODPATH/SecSettings.apk/$f")"
            CONTENT="$(tail -n +2 "$MODPATH/SecSettings.apk/$f")"
        fi
        CONTENT="$(sed -e "s/\"/\\\\\"/g" -e "s/\\$/\\\\$/g" -e "s/ /\\\ /g" -e "s/\\\\n/\\\\\\\\\n/g" <<< "$CONTENT")"
        CONTENT="$(sed -E ':a;N;$!ba;s/\r{0,1}\n/\\n/g' <<< "$CONTENT")"
        EVAL "sed -i \"$PATCH_INST $CONTENT\" \"$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk/$f\""
    fi
done < <(find "$MODPATH/SecSettings.apk" -type f)

unset PATCH_INST CONTENT
