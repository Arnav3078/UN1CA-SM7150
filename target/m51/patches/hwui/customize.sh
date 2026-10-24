if [ -n "$TARGET_EXTRA_FIRMWARES" ]; then
    LOG_STEP_IN "- Adding 64-bit hwui lib from extra"
    ADD_TO_WORK_DIR "$TARGET_EXTRA_FIRMWARES" "system" "system/lib/libhwui.so"
    ADD_TO_WORK_DIR "$TARGET_EXTRA_FIRMWARES" "system" "system/lib64/libhwui.so"
    LOG_STEP_OUT
fi
