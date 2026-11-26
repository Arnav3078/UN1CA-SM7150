# Port native One UI 9.5 AppLock (from SM-S948B S948BXXU6ZZKN)
_APPLOCK_JOBS="$(nproc)"
[ "$_APPLOCK_JOBS" -gt "8" ] && _APPLOCK_JOBS="8"

export TMPDIR="$OUT_DIR/tmp"
mkdir -p "$TMPDIR"
export _JAVA_OPTIONS="-Djava.io.tmpdir=$TMPDIR"

# Remove legacy SAppLock mod if present
if [ -e "$WORK_DIR/system/system/priv-app/SAppLock" ]; then
    DELETE_FROM_WORK_DIR "system" "system/priv-app/SAppLock"
fi

# Enable native One UI AppLock floating features
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_COMMON_SUPPORT_APP_LOCK" "TRUE"
SET_FLOATING_FEATURE_CONFIG "SEC_FLOATING_FEATURE_FRAMEWORK_SUPPORT_APP_LOCK" "TRUE"

# 1. Patch framework-res.apk, rebuild, and refresh apktool framework tag
DECODE_APK "system" "system/framework/framework-res.apk"
python3 "$MODPATH/patch_fwres.py" \
    "$APKTOOL_DIR/system/framework/framework-res.apk" \
    "$MODPATH/payload"

"$SRC_DIR/scripts/apktool.sh" b -j "$_APPLOCK_JOBS" "system" "system/framework/framework-res.apk"

_APPLOCK_FW_TAG="$(GET_PROP "system" "ro.build.version.incremental")"
"$TOOLS_DIR/bin/apktool" if -p "$TOOLS_DIR/apktool/framework" -t "$_APPLOCK_FW_TAG" \
    "$WORK_DIR/system/system/framework/framework-res.apk" > /dev/null

_APPLOCK_FWRES_DIR="$TMPDIR/fwres_pub_dec"
rm -rf "$_APPLOCK_FWRES_DIR"
"$TOOLS_DIR/bin/apktool" d -q -f -s -p "$TOOLS_DIR/apktool/framework" -t "$_APPLOCK_FW_TAG" \
    -o "$_APPLOCK_FWRES_DIR" "$WORK_DIR/system/system/framework/framework-res.apk"
_APPLOCK_FW_PUB="$_APPLOCK_FWRES_DIR/res/values/public.xml"

# Remove decoded framework-res.apk so BUILD_APKS does not rebuild it redundantly
rm -rf "$APKTOOL_DIR/system/framework/framework-res.apk"

# 2. Patch framework.jar
DECODE_APK "system" "system/framework/framework.jar"
python3 "$MODPATH/patch_framework.py" \
    "$APKTOOL_DIR/system/framework/framework.jar" \
    "$MODPATH/payload/framework" \
    "$_APPLOCK_FW_PUB"

# 3. Patch services.jar
DECODE_APK "system" "system/framework/services.jar"
python3 "$MODPATH/patch_services.py" \
    "$APKTOOL_DIR/system/framework/services.jar" \
    "$_APPLOCK_FW_PUB"

rm -rf "$_APPLOCK_FWRES_DIR"

# 4. Prep SecSettings.apk resources/layout/manifest (smali pass runs after all mods in make_rom.sh)
DECODE_APK "system" "system/priv-app/SecSettings/SecSettings.apk"
python3 "$MODPATH/patch_secsettings.py" prep \
    "$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk" \
    "$MODPATH/payload"

# 5. Patch TouchWizHome_2017.apk (enable Rune.SUPPORT_APP_LOCK)
python3 "$MODPATH/patch_launcher.py" \
    "$WORK_DIR/system/system/priv-app/TouchWizHome_2017/TouchWizHome_2017.apk" \
    "$SRC_DIR/security"

# 6. Register app_lock binder service in platform SELinux policy (S26 parity)
if ! grep -q "^app_lock[[:space:]]" "$WORK_DIR/system/system/etc/selinux/plat_service_contexts"; then
    echo "app_lock                                  u:object_r:app_lock_service:s0" \
        >> "$WORK_DIR/system/system/etc/selinux/plat_service_contexts"
fi
if ! grep -q "(type app_lock_service)" "$WORK_DIR/system/system/etc/selinux/plat_sepolicy.cil"; then
    cat << 'EOF' >> "$WORK_DIR/system/system/etc/selinux/plat_sepolicy.cil"
(type app_lock_service)
(roletype object_r app_lock_service)
(typeattributeset system_server_service (app_lock_service))
(typeattributeset system_api_service (app_lock_service))
(typeattributeset service_manager_type (app_lock_service))
EOF
fi

unset _APPLOCK_JOBS _APPLOCK_FW_TAG _APPLOCK_FWRES_DIR _APPLOCK_FW_PUB
