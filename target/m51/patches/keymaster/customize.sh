LOG_STEP_IN "- Patching init.rc for Keymaster 4.0 / Decrypted compatibility"
if [ -f "$WORK_DIR/system/system/etc/init/hw/init.rc" ]; then
    sed -i 's|exec - system system -- /system/bin/vdc keymaster earlyBootEnded|# exec - system system -- /system/bin/vdc keymaster earlyBootEnded|' \
        "$WORK_DIR/system/system/etc/init/hw/init.rc"
    sed -i 's|wait_for_prop keystore.module_hash.sent true|setprop keystore.module_hash.sent true|' \
        "$WORK_DIR/system/system/etc/init/hw/init.rc"
    sed -i 's|start odsign|# start odsign|' \
        "$WORK_DIR/system/system/etc/init/hw/init.rc"
    sed -i 's|wait_for_prop odsign.key.done 1|setprop odsign.key.done 1|' \
        "$WORK_DIR/system/system/etc/init/hw/init.rc"
    sed -i 's|wait_for_prop odsign.verification.done 1|setprop odsign.verification.done 1|' \
        "$WORK_DIR/system/system/etc/init/hw/init.rc"
fi
LOG_STEP_OUT
