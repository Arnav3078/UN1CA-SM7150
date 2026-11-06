LOG_STEP_IN "- Adding a73xqxx biometric blobs"
DELETE_FROM_WORK_DIR "vendor" "bin/hw/vendor.samsung.hardware.biometrics.face@2.0-service"
DELETE_FROM_WORK_DIR "vendor" "etc/init/vendor.samsung.hardware.biometrics.face@2.0-service.rc"
ADD_TO_WORK_DIR "a73xqxx" "vendor" "bin/hw/vendor.samsung.hardware.biometrics.face@3.0-service"
ADD_TO_WORK_DIR "a73xqxx" "vendor" "etc/init/vendor.samsung.hardware.biometrics.face@3.0-service.rc"
ADD_TO_WORK_DIR "a73xqxx" "vendor" "lib/vendor.samsung.hardware.biometrics.face@2.0.so"
ADD_TO_WORK_DIR "a73xqxx" "vendor" "lib/vendor.samsung.hardware.biometrics.face@3.0.so"
ADD_TO_WORK_DIR "a73xqxx" "vendor" "lib64/vendor.samsung.hardware.biometrics.face@2.0.so"
ADD_TO_WORK_DIR "a73xqxx" "vendor" "lib64/vendor.samsung.hardware.biometrics.face@3.0.so"
LOG_STEP_OUT

LOG_STEP_IN "- Fixing biometrics vintf manifest"
EVAL "sed -i '/<name>vendor\.samsung\.hardware\.biometrics\.face<\/name>/,/<\/hal>/{
    /<version>2\.0<\/version>/a\\
        <version>3.0</version>
    /<fqname>@2\.0::ISehBiometricsFace\/default<\/fqname>/a\\
        <fqname>@3.0::ISehBiometricsFace/default</fqname>
}' \"$WORK_DIR/vendor/etc/vintf/manifest.xml\""
LOG_STEP_OUT

LOG_STEP_IN "- Adding HIDL face biometrics libs"
SOURCE_OR_EXTRA="$SOURCE_FIRMWARE"
if [ ! -f "$FW_DIR/$(cut -d "/" -f 1 -s <<< "$SOURCE_FIRMWARE")_$(cut -d "/" -f 2 -s <<< "$SOURCE_FIRMWARE")/system/system/lib/android.hardware.biometrics.face@1.0.so" ]; then
    SOURCE_OR_EXTRA="$TARGET_EXTRA_FIRMWARES"
fi

ADD_TO_WORK_DIR "$SOURCE_OR_EXTRA" "system" "system/lib/android.hardware.biometrics.face@1.0.so"
ADD_TO_WORK_DIR "$SOURCE_OR_EXTRA" "system" "system/lib/vendor.samsung.hardware.biometrics.face@2.0.so"
ADD_TO_WORK_DIR "$SOURCE_OR_EXTRA" "system" "system/lib/vendor.samsung.hardware.biometrics.face@3.0.so"
LOG_STEP_OUT