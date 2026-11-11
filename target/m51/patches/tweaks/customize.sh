LOG_STEP_IN "- Removing performance capping"
DELETE_FROM_WORK_DIR "vendor" "etc/hyper"
DELETE_FROM_WORK_DIR "vendor" "etc/perf"
LOG_STEP_OUT

LOG_STEP_IN "- Removing WAV 32-bit PCM support"
SET_PROP "system" "media.extractor.sec.pcm-32bit" --delete
LOG_STEP_OUT

LOG_STEP_IN "- Replacing default zram size with 0"
if [ -f "$WORK_DIR/vendor/etc/fstab.ramplus" ]; then
    EVAL "sed -i -E 's/zramsize=[^\"]*,/zramsize=0,/' \"$WORK_DIR/vendor/etc/fstab.ramplus\""
fi
if [ -f "$WORK_DIR/vendor/etc/fstab.emmc" ]; then
    EVAL "sed -i -E 's/zramsize=[^\"]*/zramsize=0/' \"$WORK_DIR/vendor/etc/fstab.emmc\""
fi
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

LOG_STEP_IN "- Removing crashing Qualcomm QCC telemetry service"
DELETE_FROM_WORK_DIR "system_ext" "app/QCC" || true
DELETE_FROM_WORK_DIR "system_ext" "bin/qccsyshal@1.2-service" || true
DELETE_FROM_WORK_DIR "system_ext" "bin/qccsyshal_aidl-service" || true
DELETE_FROM_WORK_DIR "system_ext" "etc/init/vendor.qti.hardware.qccsyshal@1.2-service.rc" || true
DELETE_FROM_WORK_DIR "system_ext" "etc/init/vendor.qti.qccsyshal_aidl-service.rc" || true
DELETE_FROM_WORK_DIR "system_ext" "etc/permissions/com.qti.qcc.vendor_qcc.xml" || true
LOG_STEP_OUT

LOG_STEP_IN "- Disabling RescueParty and crash-induced recovery boot"
SET_PROP "system" "persist.sys.disable_rescue" "true"
SET_PROP "system" "persist.device_config.configuration.disable_rescue_party" "true"
SET_PROP "system" "persist.device_config.configuration.disable_rescue_party_factory_reset" "true"
SET_PROP "vendor" "persist.sys.disable_rescue" "true"
SET_PROP "system" "ro.hardware.egl" "adreno"
SET_PROP "vendor" "ro.hardware.egl" "adreno"
if [ -f "$WORK_DIR/system/system/etc/init/flags_health_check.rc" ]; then
    sed -i '/on property:sys.init.updatable_crashing=1/,+3d' "$WORK_DIR/system/system/etc/init/flags_health_check.rc"
fi
LOG_STEP_OUT

LOG_STEP_IN "- Fixing foreground-boost cgroups in task_profiles.json"
if [ -f "$WORK_DIR/system/system/etc/task_profiles.json" ]; then
    sed -i 's/"Path": "foreground-boost"/"Path": "foreground"/g' "$WORK_DIR/system/system/etc/task_profiles.json"
    sed -i 's/"File": "foreground-boost\/cpus"/"File": "foreground\/cpus"/g' "$WORK_DIR/system/system/etc/task_profiles.json"
fi
for f in "$WORK_DIR/system/system/etc/task_profiles"/*.json; do
    [ -f "$f" ] || continue
    sed -i 's/"Path": "foreground-boost"/"Path": "foreground"/g' "$f"
    sed -i 's/"File": "foreground-boost\/cpus"/"File": "foreground\/cpus"/g' "$f"
done
LOG_STEP_OUT

LOG_STEP_IN "- Adding foreground-boost cgroups to init.rc"
if [ -f "$WORK_DIR/system/system/etc/init/hw/init.rc" ]; then
    if ! grep -q "mkdir /dev/cpuset/foreground-boost" "$WORK_DIR/system/system/etc/init/hw/init.rc"; then
        sed -i '/mkdir \/dev\/cpuset\/foreground/i \
    mkdir /dev/cpuset/foreground-boost\
    copy /dev/cpuset/cpus /dev/cpuset/foreground-boost/cpus\
    copy /dev/cpuset/mems /dev/cpuset/foreground-boost/mems\
    chown system system /dev/cpuset/foreground-boost\
    chown system system /dev/cpuset/foreground-boost/tasks\
    chown system system /dev/cpuset/foreground-boost/cgroup.procs\
    chown system system /dev/cpuset/foreground-boost/cpus\
    chown system system /dev/cpuset/foreground-boost/mems\
    chmod 0664 /dev/cpuset/foreground-boost/tasks\
    chmod 0664 /dev/cpuset/foreground-boost/cgroup.procs\
    chmod 0664 /dev/cpuset/foreground-boost/cpus\
    chmod 0664 /dev/cpuset/foreground-boost/mems\
' "$WORK_DIR/system/system/etc/init/hw/init.rc"
    fi

    if ! grep -q "mkdir /dev/cpuctl/foreground-boost" "$WORK_DIR/system/system/etc/init/hw/init.rc"; then
        sed -i '/mkdir \/dev\/cpuctl\/foreground/i \
    mkdir /dev/cpuctl/foreground-boost\
    chown system system /dev/cpuctl/foreground-boost\
    chown system system /dev/cpuctl/foreground-boost/tasks\
    chown system system /dev/cpuctl/foreground-boost/cgroup.procs\
    chmod 0664 /dev/cpuctl/foreground-boost/tasks\
    chmod 0664 /dev/cpuctl/foreground-boost/cgroup.procs\
' "$WORK_DIR/system/system/etc/init/hw/init.rc"
    fi
fi
LOG_STEP_OUT

LOG_STEP_IN "- Sanitizing zygote task profiles"
for zrc in "$WORK_DIR/system/system/etc/init/hw"/init.zygote*.rc; do
    [ -f "$zrc" ] || continue
    sed -i 's/task_profiles ProcessCapacityHigh SystemServiceCapacityHigh MaxPerformance/task_profiles ProcessCapacityHigh MaxPerformance/' "$zrc"
done
LOG_STEP_OUT

LOG_STEP_IN "- Neutering bootchecker to prevent recovery bootloop"
if [ -f "$WORK_DIR/system/system/etc/init/bootchecker.rc" ]; then
    sed -i 's/restart bootchecker/# restart bootchecker/' "$WORK_DIR/system/system/etc/init/bootchecker.rc"
    sed -i 's/start bootchecker-bootc/# start bootchecker-bootc/' "$WORK_DIR/system/system/etc/init/bootchecker.rc"
fi
cat << 'EOF' > "$WORK_DIR/system/system/bin/bootchecker"
#!/system/bin/sh
exit 0
EOF
chmod 755 "$WORK_DIR/system/system/bin/bootchecker"
SET_METADATA "system" "system/bin/bootchecker" 0 2000 755 "u:object_r:bootchecker_exec:s0"
LOG_STEP_OUT
