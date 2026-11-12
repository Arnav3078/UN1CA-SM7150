# Copyright (c) 2026 Salvo Giangreco, Samuel Pascua
# SPDX-License-Identifier: GPL-3.0-or-later

ADD_TO_WORK_DIR "a73xqxx" "vendor" "lib64/libsnaplite_native.so" 0 0 644 "u:object_r:same_process_hal_file:s0"

LOG_STEP_IN "- Patching /system/system/etc/ueventd.rc for Qualcomm device nodes"
if [ -f "$WORK_DIR/system/system/etc/ueventd.rc" ]; then
    if ! grep -q "import /vendor/ueventd.rc" "$WORK_DIR/system/system/etc/ueventd.rc"; then
        sed -i '1i import /vendor/ueventd.rc' "$WORK_DIR/system/system/etc/ueventd.rc"
    fi
    cat << 'EOF' >> "$WORK_DIR/system/system/etc/ueventd.rc"

# Qualcomm Core Hardware Nodes
/dev/kgsl                 0666   system     system
/dev/kgsl-3d0             0666   system     graphics
/dev/ion                  0664   system     system
/dev/qseecom              0660   system     drmrpc
/dev/adsprpc-smd          0664   system     system
/dev/adsprpc-smd-secure   0664   system     system
/dev/msm_rotator          0660   system     graphics
/dev/hw_random            0660   system     system
/dev/media*               0660   system     camera
/dev/v4l-subdev*          0660   system     camera
/dev/video*               0660   system     camera
EOF
fi
LOG_STEP_OUT
