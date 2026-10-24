LOG_STEP_IN "- Removing performance capping"
DELETE_FROM_WORK_DIR "vendor" "etc/hyper"
DELETE_FROM_WORK_DIR "vendor" "etc/perf"
LOG_STEP_OUT

LOG_STEP_IN "- Removing WAV 32-bit PCM support"
SET_PROP "system" "media.extractor.sec.pcm-32bit" --delete
LOG_STEP_OUT


LOG_STEP_IN "- Setting unencrypted ROM properties"
SET_PROP "vendor" "ro.crypto.state" "unencrypted"
SET_PROP "vendor" "ro.crypto.type" "none"
SET_PROP "vendor" "ro.crypto.override" "false"
SET_PROP "system" "ro.crypto.state" "unencrypted"
SET_PROP "system" "ro.crypto.type" "none"
for f in "$WORK_DIR/vendor/etc"/fstab*; do
    [ -f "$f" ] || continue
    sed -E -i \
        -e 's/fileencryption=[^,[:space:]]+,?//g' \
        -e 's/metadata_encryption=[^,[:space:]]+,?//g' \
        -e 's/keydirectory=[^,[:space:]]+,?//g' \
        -e 's/forceencrypt=[^,[:space:]]+,?//g' \
        -e 's/forcefde=[^,[:space:]]+,?//g' \
        -e 's/,,/,/g' \
        -e 's/,[[:space:]]*$/ /' \
        "$f"
done
LOG_STEP_OUT
