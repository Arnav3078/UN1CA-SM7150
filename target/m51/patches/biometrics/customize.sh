LOG_STEP_IN "- Adding HIDL face biometrics libs"
SOURCE_OR_EXTRA="$SOURCE_FIRMWARE"
if [ ! -f "$FW_DIR/$(cut -d "/" -f 1 -s <<< "$SOURCE_FIRMWARE")_$(cut -d "/" -f 2 -s <<< "$SOURCE_FIRMWARE")/system/system/lib/android.hardware.biometrics.face@1.0.so" ]; then
    SOURCE_OR_EXTRA="$TARGET_EXTRA_FIRMWARES"
fi

ADD_TO_WORK_DIR "$SOURCE_OR_EXTRA" "system" "system/lib/android.hardware.biometrics.face@1.0.so"
ADD_TO_WORK_DIR "$SOURCE_OR_EXTRA" "system" "system/lib/vendor.samsung.hardware.biometrics.face@2.0.so"
ADD_TO_WORK_DIR "$SOURCE_OR_EXTRA" "system" "system/lib/vendor.samsung.hardware.biometrics.face@3.0.so"
LOG_STEP_OUT