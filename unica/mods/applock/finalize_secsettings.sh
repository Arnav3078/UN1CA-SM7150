#!/usr/bin/env bash
# Final two-pass AppLock smali patching for SecSettings.apk (runs after all mods add resources)
_APPLOCK_SEC_DEC="$APKTOOL_DIR/system/priv-app/SecSettings/SecSettings.apk"
_APPLOCK_MOD="$SRC_DIR/unica/mods/applock"

if [ -d "$_APPLOCK_SEC_DEC" ] && [ -f "$_APPLOCK_MOD/patch_secsettings.py" ]; then
    LOG_STEP_IN true "Finalizing AppLock in SecSettings.apk"

    _APPLOCK_JOBS="$(nproc)"
    [ "$_APPLOCK_JOBS" -gt "8" ] && _APPLOCK_JOBS="8"

    export TMPDIR="$OUT_DIR/tmp"
    mkdir -p "$TMPDIR"
    export _JAVA_OPTIONS="-Djava.io.tmpdir=$TMPDIR"

    _APPLOCK_FW_TAG="$(GET_PROP "system" "ro.build.version.incremental")"
    _APPLOCK_P1_APK="$TMPDIR/secsettings_p1.apk"
    _APPLOCK_P1_DEC="$TMPDIR/secsettings_p1_dec"

    rm -rf "$_APPLOCK_P1_APK" "$_APPLOCK_P1_DEC" "$_APPLOCK_SEC_DEC/build" "$_APPLOCK_SEC_DEC/dist"

    "$TOOLS_DIR/bin/apktool" b -j "$_APPLOCK_JOBS" \
        -p "$TOOLS_DIR/apktool/framework" \
        -srp "$_APPLOCK_SEC_DEC" -o "$_APPLOCK_P1_APK" || exit 1

    "$TOOLS_DIR/bin/apktool" d -q -f -s \
        -p "$TOOLS_DIR/apktool/framework" -t "$_APPLOCK_FW_TAG" \
        -o "$_APPLOCK_P1_DEC" "$_APPLOCK_P1_APK" || exit 1

    python3 "$_APPLOCK_MOD/patch_secsettings.py" smali \
        "$_APPLOCK_SEC_DEC" "$_APPLOCK_MOD/payload" "$_APPLOCK_P1_DEC/res/values/public.xml" || exit 1

    rm -rf "$_APPLOCK_P1_APK" "$_APPLOCK_P1_DEC" "$_APPLOCK_SEC_DEC/build" "$_APPLOCK_SEC_DEC/dist"
    LOG_STEP_OUT
fi

unset _APPLOCK_SEC_DEC _APPLOCK_MOD _APPLOCK_JOBS _APPLOCK_FW_TAG _APPLOCK_P1_APK _APPLOCK_P1_DEC
