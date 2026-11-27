# Show battery regulatory info in Settings
# Requires SEM_BATTERY_PROPERTY_IC_AUTHENTICATION_RESULT support
if [ "$(GET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_BATTERY_SUPPORT_BSOH_SETTINGS")" ]; then
    SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_BATTERY_SUPPORT_BSOH_SETTINGS" --delete
fi
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_SETTINGS_ENABLE_EU_BATTERY_REGULATORY" "TRUE"

SMALI_PATCH "system" "system/framework/framework.jar" \
    "smali/android/app/Instrumentation.smali" "replace" \
    'newApplication(Ljava/lang/Class;Landroid/content/Context;)Landroid/app/Application;' \
    'invoke-virtual {p0, p1}, Landroid/app/Application;->attach(Landroid/content/Context;)V' \
    '    invoke-virtual {p0, p1}, Landroid/app/Application;->attach(Landroid/content/Context;)V\n\n    invoke-static {p1}, Lio/mesalabs/unica/SamsungPropsHooks;->init(Landroid/content/Context;)V' \
    > /dev/null
SMALI_PATCH "system" "system/framework/framework.jar" \
    "smali/android/app/Instrumentation.smali" "replace" \
    'newApplication(Ljava/lang/ClassLoader;Ljava/lang/String;Landroid/content/Context;)Landroid/app/Application;' \
    'invoke-virtual {p0, p3}, Landroid/app/Application;->attach(Landroid/content/Context;)V' \
    '    invoke-virtual {p0, p3}, Landroid/app/Application;->attach(Landroid/content/Context;)V\n\n    invoke-static {p3}, Lio/mesalabs/unica/SamsungPropsHooks;->init(Landroid/content/Context;)V' \
    > /dev/null

DECODE_APK "system" "system/priv-app/SecSettings/SecSettings.apk"

# Disable stock OTA references
if [ ! -f "$WORK_DIR/system/system/priv-app/ChoiDujour/ChoiDujour.apk" ]; then
    if grep -q "isOTAUpgradeAllowed" "$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk/smali_classes3/com/samsung/android/settings/softwareupdate/SoftwareUpdateUtils.smali" 2>/dev/null; then
        SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
            "smali_classes3/com/samsung/android/settings/softwareupdate/SoftwareUpdateUtils.smali" "return" \
            'isOTAUpgradeAllowed(Landroid/content/Context;)Z' \
            'false'
    fi
fi

# Always show One UI minor version
SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
    "smali_classes4/com/samsung/android/settings/deviceinfo/softwareinfo/OneUIVersionPreferenceController.smali" "replace" \
    'isDeviceWithMicroVersion()Z' \
    'move-result p0' \
    'const/4 p0, 0x1'

# Show real device model number
SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
    "smali_classes4/com/samsung/android/settings/deviceinfo/aboutphone/ModelNameGetter.smali" "replace" \
    'getModelName()Ljava/lang/String;' \
    'ro.product.model' \
    'ro.boot.em.model'

LOG_STEP_IN "- Adding UN1CA Settings"

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

# Add UN1CA Settings SearchIndexableData registrations
LOG "- Patching \"smali/com/android/settingslib/search/SearchIndexableResourcesMobile.smali\" in /system/system/priv-app/SecSettings.apk"
SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
    "smali/com/android/settingslib/search/SearchIndexableResourcesMobile.smali" "replaceall" \
    '.class public final Lcom/android/settingslib/search/SearchIndexableResourcesMobile;' \
    '.class public Lcom/android/settingslib/search/SearchIndexableResourcesMobile;' \
    > /dev/null
LOG "- Patching \"smali/com/android/settings/search/SearchFeatureProviderImpl\$\$ExternalSyntheticLambda0.smali\" in /system/system/priv-app/SecSettings.apk"
SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
    "smali/com/android/settings/search/SearchFeatureProviderImpl\$\$ExternalSyntheticLambda0.smali" "replace" \
    'invoke()Ljava/lang/Object;' \
    'new-instance p0, Lcom/android/settingslib/search/SearchIndexableResourcesMobile;' \
    'new-instance p0, Lio/mesalabs/unica/search/UnicaSearchIndexableResources;' \
    > /dev/null
if grep -q "invoke-direct {p0}, Ljava/lang/Object;-><init>()V" "$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk/smali_classes2/com/android/settings/search/SearchFeatureProviderImpl\$\$ExternalSyntheticLambda0.smali" 2>/dev/null; then
    SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
        "smali/com/android/settings/search/SearchFeatureProviderImpl\$\$ExternalSyntheticLambda0.smali" "replace" \
        'invoke()Ljava/lang/Object;' \
        'invoke-direct {p0}, Ljava/lang/Object;-><init>()V' \
        'invoke-direct {p0}, Lio/mesalabs/unica/search/UnicaSearchIndexableResources;-><init>()V' \
        > /dev/null
else
    SMALI_PATCH "system" "system/priv-app/SecSettings/SecSettings.apk" \
        "smali/com/android/settings/search/SearchFeatureProviderImpl\$\$ExternalSyntheticLambda0.smali" "replace" \
        'invoke()Ljava/lang/Object;' \
        'invoke-direct {p0}, Lcom/android/settingslib/search/SearchIndexableResourcesBase;-><init>()V' \
        'invoke-direct {p0}, Lio/mesalabs/unica/search/UnicaSearchIndexableResources;-><init>()V' \
        > /dev/null
fi

DECODE_APK "system" "system/priv-app/SecSettingsIntelligence/SecSettingsIntelligence.apk"
LOG "- Patching \"smali_classes2/com/samsung/android/settings/intelligence/search/categorizing/TopLevelKeysCollector.smali\" in /system/system/priv-app/SecSettingsIntelligence/SecSettingsIntelligence.apk"
if grep -q "filled-new-array/range {v1 .. v36}, \[Ljava/lang/String;" "$APKTOOL_DIR/system/priv-app/SecSettingsIntelligence/SecSettingsIntelligence.apk/smali_classes2/com/samsung/android/settings/intelligence/search/categorizing/TopLevelKeysCollector.smali" 2>/dev/null; then
    SMALI_PATCH "system" "system/priv-app/SecSettingsIntelligence/SecSettingsIntelligence.apk" \
        "smali_classes2/com/samsung/android/settings/intelligence/search/categorizing/TopLevelKeysCollector.smali" "replace" \
        '<init>(Landroid/content/Context;)V' \
        '.locals 37' \
        '.locals 38' \
        > /dev/null
    SMALI_PATCH "system" "system/priv-app/SecSettingsIntelligence/SecSettingsIntelligence.apk" \
        "smali_classes2/com/samsung/android/settings/intelligence/search/categorizing/TopLevelKeysCollector.smali" "replace" \
        '<init>(Landroid/content/Context;)V' \
        'filled-new-array/range {v1 .. v36}, [Ljava/lang/String;' \
        '    const-string v37, "top_level_unica"\n\n    filled-new-array/range {v1 .. v37}, [Ljava/lang/String;' \
        > /dev/null
else
    SMALI_PATCH "system" "system/priv-app/SecSettingsIntelligence/SecSettingsIntelligence.apk" \
        "smali_classes2/com/samsung/android/settings/intelligence/search/categorizing/TopLevelKeysCollector.smali" "replace" \
        '<init>(Landroid/content/Context;)V' \
        '.locals 36' \
        '.locals 37' \
        > /dev/null
    SMALI_PATCH "system" "system/priv-app/SecSettingsIntelligence/SecSettingsIntelligence.apk" \
        "smali_classes2/com/samsung/android/settings/intelligence/search/categorizing/TopLevelKeysCollector.smali" "replace" \
        '<init>(Landroid/content/Context;)V' \
        'filled-new-array/range {v1 .. v35}, [Ljava/lang/String;' \
        '    const-string v36, "top_level_unica"\n\n    filled-new-array/range {v1 .. v36}, [Ljava/lang/String;' \
        > /dev/null
fi

# Show Vulkan renderer toggle if required
if [[ "$(GET_PROP "ro.hwui.use_vulkan")" != "true" ]]; then
    SET_PROP "system" "persist.sys.unica.vulkan" "false"
fi

# Auto-hide Developer/ADB status for Secure Folder and secondary profiles (userId >= 100)
if [ -f "$APKTOOL_DIR/system/framework/framework.jar/smali_classes6/io/mesalabs/unica/HideDeveloperStatusUtils.smali" ]; then
    SMALI_PATCH "system" "system/framework/framework.jar" \
        "smali_classes6/io/mesalabs/unica/HideDeveloperStatusUtils.smali" "replace" \
        'shouldHideDevStatus(Landroid/content/ContentResolver;Ljava/lang/String;Ljava/lang/String;)Z' \
        'sget-object v1, Lio/mesalabs/unica/HideDeveloperStatusUtils;->settingsToHide:Ljava/util/Set;' \
        'invoke-virtual {p0}, Landroid/content/ContentResolver;->getUserId()I\n\n    move-result v1\n\n    const/16 v2, 0x64\n\n    if-lt v1, v2, :cond_sf_hide\n\n    const/4 v0, 0x1\n\n    return v0\n\n    :cond_sf_hide\n    sget-object v1, Lio/mesalabs/unica/HideDeveloperStatusUtils;->settingsToHide:Ljava/util/Set;' \
        > /dev/null
fi

# Auto-hide Root/Mod apps for Secure Folder and secondary profiles (userId >= 100)
if [ -f "$APKTOOL_DIR/system/framework/framework.jar/smali_classes6/io/mesalabs/unica/HideAppListUtils.smali" ]; then
    SMALI_PATCH "system" "system/framework/framework.jar" \
        "smali_classes6/io/mesalabs/unica/HideAppListUtils.smali" "replace" \
        'shouldHideAppList(Landroid/content/ContentResolver;Ljava/lang/String;)Z' \
        'const-string v1, "unica_hma"' \
        'invoke-virtual {p0}, Landroid/content/ContentResolver;->getUserId()I\n\n    move-result v1\n\n    const/16 v2, 0x64\n\n    if-lt v1, v2, :cond_sf_hma\n\n    invoke-static {p0}, Lio/mesalabs/unica/HideAppListUtils;->getApps(Landroid/content/ContentResolver;)Ljava/util/Set;\n\n    move-result-object p0\n\n    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z\n\n    move-result p0\n\n    return p0\n\n    :cond_sf_hma\n    const-string v1, "unica_hma"' \
        > /dev/null
fi

unset PATCH_INST CONTENT

LOG_STEP_OUT
