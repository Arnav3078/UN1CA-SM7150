if [ -n "$TARGET_EXTRA_FIRMWARES" ]; then
LOG_STEP_IN "- Adding keymaster 4.0 libs from extra"
ADD_TO_WORK_DIR "$TARGET_EXTRA_FIRMWARES" "system" "system/lib/android.hardware.keymaster@3.0.so"
ADD_TO_WORK_DIR "$TARGET_EXTRA_FIRMWARES" "system" "system/lib/android.hardware.keymaster@4.0.so"
ADD_TO_WORK_DIR "$TARGET_EXTRA_FIRMWARES" "system" "system/lib/android.hardware.keymaster@4.1.so"
DELETE_FROM_WORK_DIR "system" "system/lib/android.hardware.security.keymint-V1-ndk.so"
DELETE_FROM_WORK_DIR "system" "system/lib/android.hardware.security.secureclock-V1-ndk.so"
ADD_TO_WORK_DIR "$TARGET_EXTRA_FIRMWARES" "system" "system/lib/lib_nativeJni.dk.samsung.so"
ADD_TO_WORK_DIR "$TARGET_EXTRA_FIRMWARES" "system" "system/lib/libdk_native_keymaster.so"
DELETE_FROM_WORK_DIR "system" "system/lib/libdk_native_keymint.so"
ADD_TO_WORK_DIR "$TARGET_EXTRA_FIRMWARES" "system" "system/lib/libkeymaster4_1support.so"
ADD_TO_WORK_DIR "$TARGET_EXTRA_FIRMWARES" "system" "system/lib/libkeymaster4support.so"
DELETE_FROM_WORK_DIR "system" "system/lib/vendor.samsung.hardware.keymint-V1-ndk.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/android.hardware.security.keymint-V1-ndk.so"
ADD_TO_WORK_DIR "$TARGET_EXTRA_FIRMWARES" "system" "system/lib64/lib_nativeJni.dk.samsung.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/libdk_native_keymint.so"
ADD_TO_WORK_DIR "$TARGET_EXTRA_FIRMWARES" "system" "system/lib64/libdk_native_keymaster.so"
DELETE_FROM_WORK_DIR "system" "system/lib64/vendor.samsung.hardware.keymint-V1-ndk.so"
LOG_STEP_OUT
fi

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
