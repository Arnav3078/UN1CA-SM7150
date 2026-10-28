if [ -n "$TARGET_EXTRA_FIRMWARES" ]; then
    LOG_STEP_IN "- Replacing vendor sepolicy with extra"
    ADD_TO_WORK_DIR "$TARGET_EXTRA_FIRMWARES" "vendor" "etc/selinux"
    EVAL "sed -i -E 's/SM-[A-Z0-9]+/$(GET_PROP \"vendor\" \"ro.product.vendor.model\")/g' \
        \"$WORK_DIR/vendor/etc/selinux/vendor_sepolicy_version\""
    LOG_STEP_OUT

    LOG_STEP_IN "- Adding 30.0 SELinux mapping files"
    ADD_TO_WORK_DIR "$TARGET_EXTRA_FIRMWARES" "system" "system/etc/selinux/mapping/30.0.cil" 0 0 644 "u:object_r:sepolicy_file:s0"
    ADD_TO_WORK_DIR "$TARGET_EXTRA_FIRMWARES" "system" "system/etc/selinux/mapping/30.0.compat.cil" 0 0 644 "u:object_r:sepolicy_file:s0"
    ADD_TO_WORK_DIR "$TARGET_EXTRA_FIRMWARES" "system_ext" "etc/selinux/mapping/30.0.cil" 0 0 644 "u:object_r:system_file:s0"
    ADD_TO_WORK_DIR "$TARGET_EXTRA_FIRMWARES" "system_ext" "etc/selinux/mapping/30.0.compat.cil" 0 0 644 "u:object_r:system_file:s0"
    ADD_TO_WORK_DIR "$TARGET_EXTRA_FIRMWARES" "product" "etc/selinux/mapping/30.0.cil" 0 0 644 "u:object_r:system_file:s0"
    LOG_STEP_OUT

    LOG_STEP_IN "- Fixing genfscon conflicts in plat_sepolicy.cil"
    if [ -f "$WORK_DIR/system/system/etc/selinux/plat_sepolicy.cil" ]; then
        sed -i '/genfscon sysfs "\/bus\/usb\/devices"/d' "$WORK_DIR/system/system/etc/selinux/plat_sepolicy.cil"
    fi
    LOG_STEP_OUT

    LOG_STEP_IN "- Adding keymaster, vaultkeeper and surfaceflinger graphics permissions"
    if [ -f "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil" ]; then
        echo "(allow vaultkeeperd block_device (lnk_file (read getattr open)))" >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
        echo "(allow keystore hal_keymaster_default (binder (call transfer)))" >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
        echo "(allow hal_keymaster_default keystore (binder (transfer)))" >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
        echo "(allow surfaceflinger kgsl_device (chr_file (ioctl read write getattr lock append map open watch watch_reads)))" >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
        echo "(allow surfaceflinger gpu_device (chr_file (ioctl read write getattr lock append map open watch watch_reads)))" >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
        echo "(allow surfaceflinger ion_device (chr_file (ioctl read write getattr lock append map open watch watch_reads)))" >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
        echo "(allow surfaceflinger vendor_sysfs_kgsl (dir (ioctl read getattr lock open watch watch_reads search)))" >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
        echo "(allow surfaceflinger vendor_sysfs_kgsl (file (ioctl read write getattr lock map open watch watch_reads)))" >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
        echo "(allow surfaceflinger vendor_sysfs_kgsl (lnk_file (ioctl read getattr lock map open watch watch_reads)))" >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
        echo "(allow system_app_30_0 logpersistd_logging_prop_30_0 (property_service (set)))" >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
        echo "(allow system_app_30_0 logd_prop_30_0 (property_service (set)))" >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
    fi
    if [ -f "$WORK_DIR/system/system/etc/selinux/plat_sepolicy.cil" ]; then
        echo "(allow system_app logpersistd_logging_prop (property_service (set)))" >> "$WORK_DIR/system/system/etc/selinux/plat_sepolicy.cil"
        echo "(allow system_app logd_prop (property_service (set)))" >> "$WORK_DIR/system/system/etc/selinux/plat_sepolicy.cil"
    fi
    LOG_STEP_OUT

    LOG_STEP_IN "- Adding GPU and ION device contexts to plat_file_contexts"
    if [ -f "$WORK_DIR/system/system/etc/selinux/plat_file_contexts" ]; then
        if ! grep -q "/dev/kgsl-3d0" "$WORK_DIR/system/system/etc/selinux/plat_file_contexts"; then
            echo "/dev/kgsl-3d0            u:object_r:gpu_device:s0" >> "$WORK_DIR/system/system/etc/selinux/plat_file_contexts"
            echo "/dev/kgsl                u:object_r:gpu_device:s0" >> "$WORK_DIR/system/system/etc/selinux/plat_file_contexts"
            echo "/dev/kgsl-[0-9a-z]*      u:object_r:gpu_device:s0" >> "$WORK_DIR/system/system/etc/selinux/plat_file_contexts"
            echo "/dev/ion                 u:object_r:ion_device:s0" >> "$WORK_DIR/system/system/etc/selinux/plat_file_contexts"
            echo "/dev/genlock             u:object_r:gpu_device:s0" >> "$WORK_DIR/system/system/etc/selinux/plat_file_contexts"
        fi
    fi
    LOG_STEP_OUT
fi
