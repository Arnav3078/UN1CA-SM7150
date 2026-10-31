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
SET_PROP "vendor" "ro.product.first_api_level" "29"
SET_PROP "system" "ro.product.first_api_level" "29"
SET_PROP "product" "ro.product.first_api_level" "29"
SET_PROP "system_ext" "ro.product.first_api_level" "29"
for f in "$WORK_DIR/vendor/etc"/fstab*; do
    [ -f "$f" ] || continue
    sed -E -i \
        -e 's/fileencryption=[^,[:space:]]+,?//g' \
        -e 's/metadata_encryption=[^,[:space:]]+,?//g' \
        -e 's/keydirectory=[^,[:space:]]+,?//g' \
        -e 's/forceencrypt=[^,[:space:]]+,?//g' \
        -e 's/forcefde=[^,[:space:]]+,?//g' \
        -e 's/,sysfs_path=\/sys\/devices\/platform\/soc\/1d84000\.ufshc//g' \
        -e 's/sysfs_path=\/sys\/devices\/platform\/soc\/1d84000\.ufshc,?//g' \
        -e 's/,,/,/g' \
        -e 's/,[[:space:]]*$/ /' \
        "$f"
done
LOG_STEP_OUT

LOG_STEP_IN "- Fixing Qualcomm hardware device nodes in ueventd and init.rc"
if [ -f "$WORK_DIR/system/system/etc/ueventd.rc" ]; then
    if ! grep -q "import /vendor/ueventd.rc" "$WORK_DIR/system/system/etc/ueventd.rc"; then
        sed -i '1iimport /vendor/ueventd.rc' "$WORK_DIR/system/system/etc/ueventd.rc"
    fi
    if [ -f "$WORK_DIR/vendor/ueventd.rc" ] && ! grep -q "/dev/kgsl-3d0" "$WORK_DIR/system/system/etc/ueventd.rc"; then
        echo "" >> "$WORK_DIR/system/system/etc/ueventd.rc"
        echo "# Qualcomm SM7150 hardware permissions imported from vendor" >> "$WORK_DIR/system/system/etc/ueventd.rc"
        cat "$WORK_DIR/vendor/ueventd.rc" >> "$WORK_DIR/system/system/etc/ueventd.rc"
    fi
fi

if [ -f "$WORK_DIR/system/system/etc/init/hw/init.rc" ]; then
    if ! grep -q "chmod 0666 /dev/kgsl-3d0" "$WORK_DIR/system/system/etc/init/hw/init.rc"; then
        sed -i '/on init/a \    chmod 0666 /dev/kgsl-3d0\n    chown system graphics /dev/kgsl-3d0\n    restorecon /dev/kgsl-3d0\n    chmod 0666 /dev/kgsl\n    chown system graphics /dev/kgsl\n    restorecon /dev/kgsl\n    chmod 0664 /dev/ion\n    chown system system /dev/ion\n    restorecon /dev/ion' \
            "$WORK_DIR/system/system/etc/init/hw/init.rc"
    fi
    sed -i '/ro.hwui.use_vulkan/d' "$WORK_DIR/system/system/etc/init/hw/init.rc"
fi

if [ -f "$WORK_DIR/system/system/etc/init/surfaceflinger.rc" ]; then
    if ! grep -q "chmod 0666 /dev/kgsl-3d0" "$WORK_DIR/system/system/etc/init/surfaceflinger.rc"; then
        echo "" >> "$WORK_DIR/system/system/etc/init/surfaceflinger.rc"
        echo "on early-boot" >> "$WORK_DIR/system/system/etc/init/surfaceflinger.rc"
        echo "    chmod 0666 /dev/kgsl-3d0" >> "$WORK_DIR/system/system/etc/init/surfaceflinger.rc"
        echo "    chown system graphics /dev/kgsl-3d0" >> "$WORK_DIR/system/system/etc/init/surfaceflinger.rc"
        echo "    restorecon /dev/kgsl-3d0" >> "$WORK_DIR/system/system/etc/init/surfaceflinger.rc"
    fi
fi
LOG_STEP_OUT

LOG_STEP_IN "- Enabling Hardware Acceleration & Full One UI 9 Live Blur"
SET_PROP "vendor" "debug.egl.hw" "1"
SET_PROP "vendor" "debug.sf.hw" "1"
SET_PROP "vendor" "ro.hwui.use_vulkan" "false"
SET_PROP "vendor" "debug.hwui.renderer" "skiagl"
SET_PROP "vendor" "ro.surface_flinger.supports_background_blur" "1"
SET_PROP "vendor" "persist.sys.unica.nativeblur" "true"
SET_PROP "vendor" "sys.sysctl.swappiness" "100"

SET_PROP "system" "debug.egl.hw" "1"
SET_PROP "system" "debug.sf.hw" "1"
SET_PROP "system" "ro.hwui.use_vulkan" "false"
SET_PROP "system" "debug.hwui.renderer" "skiagl"
SET_PROP "system" "ro.surface_flinger.supports_background_blur" "1"
SET_PROP "system" "persist.sys.unica.nativeblur" "true"
SET_PROP "system" "sys.sysctl.swappiness" "100"

SET_PROP "vendor" "ro.sf.blurs_are_expensive" --delete
SET_PROP "system" "ro.sf.blurs_are_expensive" --delete
SET_PROP "vendor" "debug.renderengine.backend" --delete
SET_PROP "system" "debug.renderengine.backend" --delete

if [ -f "$WORK_DIR/vendor/build.prop" ]; then
    sed -i 's/^ro\.hwui\.use_vulkan=.*/ro.hwui.use_vulkan=false/' "$WORK_DIR/vendor/build.prop"
fi
LOG_STEP_OUT

LOG_STEP_IN "- Neutralizing kernel 4.14 BPF GPU memory tracking abort in libmeminfo"
if [ -f "$WORK_DIR/system/system/lib64/libmeminfo.so" ]; then
    python3 "$SRC_DIR/target/m51/patches/tweaks/patch_libmeminfo.py" "$WORK_DIR/system/system/lib64/libmeminfo.so" || true
fi
LOG_STEP_OUT

LOG_STEP_IN "- Patching Qualcomm HWC 2.4 service to ignore unknown SurfaceFlinger display commands"
if [ -f "$WORK_DIR/vendor/bin/hw/android.hardware.graphics.composer@2.4-service" ]; then
    python3 "$SRC_DIR/target/m51/patches/tweaks/patch_composer.py" "$WORK_DIR/vendor/bin/hw/android.hardware.graphics.composer@2.4-service" || true
fi
LOG_STEP_OUT

LOG_STEP_IN "- Neutralizing ICCC client to prevent system_server crash"
for lib in "$WORK_DIR/system/system/lib64/hidl_comm_iccc_client.so" \
           "$WORK_DIR/system/system/lib/hidl_comm_iccc_client.so"; do
    if [ -f "$lib" ]; then
        python3 "$SRC_DIR/target/m51/patches/tweaks/patch_iccc.py" "$lib" || true
    fi
done
LOG_STEP_OUT

LOG_STEP_IN "- Removing crashing Knox components"
DELETE_FROM_WORK_DIR "system" "system/priv-app/KnoxCustomManagerService" || true
DELETE_FROM_WORK_DIR "system" "system/priv-app/KnoxPushManager" || true
DELETE_FROM_WORK_DIR "system" "system/priv-app/KnoxSandbox" || true
DELETE_FROM_WORK_DIR "system" "system/priv-app/KnoxZtFramework" || true
DELETE_FROM_WORK_DIR "system" "system/priv-app/KnoxGuard" || true
LOG_STEP_OUT

LOG_STEP_IN "- Enabling permanent root ADB and USB debugging"
SET_PROP "system" "ro.adb.secure" "0"
SET_PROP "system" "ro.debuggable" "1"
SET_PROP "system" "persist.sys.usb.config" "mtp,adb"
SET_PROP "vendor" "ro.adb.secure" "0"
SET_PROP "vendor" "persist.sys.usb.config" "mtp,adb"
LOG_STEP_OUT

LOG_STEP_IN "- Restoring authentic Samsung platform priv-apps"
for apk_rel in \
    "system/system/priv-app/Telecom/Telecom.apk" \
    "system/system/priv-app/DressRoom/DressRoom.apk" \
    "system/system/priv-app/PhotoEditor_AIFull/PhotoEditor_AIFull.apk" \
    "system/system/priv-app/SpriteWallpaper/SpriteWallpaper.apk" \
    "system/system/priv-app/SamsungCamera/SamsungCamera.apk" \
    "system/system/priv-app/SecureFolder/SecureFolder.apk" \
    "system/system/priv-app/KnoxCore/KnoxCore.apk" \
    "system/system/priv-app/FotaAgent/FotaAgent.apk"
do
    if [ -f "$FW_S23_SRC/$apk_rel" ]; then
        mkdir -p "$(dirname "$WORK_DIR/$apk_rel")"
        cp -f "$FW_S23_SRC/$apk_rel" "$WORK_DIR/$apk_rel"
        if [ -f "$FW_S23_SRC/${apk_rel}.prof" ]; then
            cp -f "$FW_S23_SRC/${apk_rel}.prof" "$WORK_DIR/${apk_rel}.prof" 2>/dev/null || true
        fi
        chmod 644 "$WORK_DIR/$apk_rel"
    fi
done

if [ -f "$FW_S23_SRC/system/system/etc/permissions/privapp-permissions-com.wssyncmldm.xml" ]; then
    mkdir -p "$WORK_DIR/system/system/etc/permissions"
    cp -f "$FW_S23_SRC/system/system/etc/permissions/privapp-permissions-com.wssyncmldm.xml" "$WORK_DIR/system/system/etc/permissions/"
    chmod 644 "$WORK_DIR/system/system/etc/permissions/privapp-permissions-com.wssyncmldm.xml"
fi
LOG_STEP_OUT

LOG_STEP_IN "- Installing UN1CA Updates (ChoiDujour) package"
if [ -f "$SRC_DIR/unica/mods/choidujour/system/priv-app/ChoiDujour/ChoiDujour.apk" ]; then
    mkdir -p "$WORK_DIR/system/system/priv-app/ChoiDujour"
    cp -f "$SRC_DIR/unica/mods/choidujour/system/priv-app/ChoiDujour/ChoiDujour.apk" "$WORK_DIR/system/system/priv-app/ChoiDujour/"
    chmod 644 "$WORK_DIR/system/system/priv-app/ChoiDujour/ChoiDujour.apk"
    SET_METADATA "system" "system/priv-app/ChoiDujour" 0 0 755 "u:object_r:system_file:s0"
    SET_METADATA "system" "system/priv-app/ChoiDujour/ChoiDujour.apk" 0 0 644 "u:object_r:system_file:s0"
fi
if [ -f "$SRC_DIR/unica/mods/choidujour/system/etc/permissions/privapp-permissions-io.mesalabs.choidujour.xml" ]; then
    mkdir -p "$WORK_DIR/system/system/etc/permissions"
    cp -f "$SRC_DIR/unica/mods/choidujour/system/etc/permissions/privapp-permissions-io.mesalabs.choidujour.xml" "$WORK_DIR/system/system/etc/permissions/"
    chmod 644 "$WORK_DIR/system/system/etc/permissions/privapp-permissions-io.mesalabs.choidujour.xml"
    SET_METADATA "system" "system/etc/permissions/privapp-permissions-io.mesalabs.choidujour.xml" 0 0 644 "u:object_r:system_file:s0"
fi
if [ -f "$SRC_DIR/unica/mods/choidujour/system/etc/default-permissions/default-permissions-io.mesalabs.choidujour.xml" ]; then
    mkdir -p "$WORK_DIR/system/system/etc/default-permissions"
    cp -f "$SRC_DIR/unica/mods/choidujour/system/etc/default-permissions/default-permissions-io.mesalabs.choidujour.xml" "$WORK_DIR/system/system/etc/default-permissions/"
    chmod 644 "$WORK_DIR/system/system/etc/default-permissions/default-permissions-io.mesalabs.choidujour.xml"
    SET_METADATA "system" "system/etc/default-permissions/default-permissions-io.mesalabs.choidujour.xml" 0 0 644 "u:object_r:system_file:s0"
fi
LOG_STEP_OUT


LOG_STEP_IN "- Removing crashing Qualcomm QCC telemetry service"
DELETE_FROM_WORK_DIR "system_ext" "app/QCC" || true
DELETE_FROM_WORK_DIR "system_ext" "bin/qccsyshal@1.2-service" || true
DELETE_FROM_WORK_DIR "system_ext" "bin/qccsyshal_aidl-service" || true
DELETE_FROM_WORK_DIR "system_ext" "etc/init/vendor.qti.hardware.qccsyshal@1.2-service.rc" || true
DELETE_FROM_WORK_DIR "system_ext" "etc/init/vendor.qti.qccsyshal_aidl-service.rc" || true
DELETE_FROM_WORK_DIR "system_ext" "etc/permissions/com.qti.qcc.vendor_qcc.xml" || true
LOG_STEP_OUT

LOG_STEP_IN "- Permitting Developer Options in SELinux policy"
if [ -f "$WORK_DIR/system/system/etc/selinux/plat_sepolicy.cil" ]; then
    if ! grep -q "allow system_app logpersistd_logging_prop" "$WORK_DIR/system/system/etc/selinux/plat_sepolicy.cil"; then
        echo "(allow system_app logpersistd_logging_prop (property_service (set)))" >> "$WORK_DIR/system/system/etc/selinux/plat_sepolicy.cil"
        echo "(allow system_app logd_prop (property_service (set)))" >> "$WORK_DIR/system/system/etc/selinux/plat_sepolicy.cil"
    fi
fi
if [ -f "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil" ]; then
    if ! grep -q "allow system_app_30_0 logpersistd_logging_prop_30_0" "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"; then
        echo "(allow system_app_30_0 logpersistd_logging_prop_30_0 (property_service (set)))" >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
        echo "(allow system_app_30_0 logd_prop_30_0 (property_service (set)))" >> "$WORK_DIR/vendor/etc/selinux/vendor_sepolicy.cil"
    fi
fi
LOG_STEP_OUT

LOG_STEP_IN "- Patching libstagefright to prevent fortify fread abort during video encoding"
python3 - << 'EOF'
import os
work_dir = os.environ.get("WORK_DIR", "/home/arnav/UN1CA-4.0-M51/out/target/m51/work_dir")
for is64 in [False, True]:
    lib_path = f"{work_dir}/system/system/lib64/libstagefright.so" if is64 else f"{work_dir}/system/system/lib/libstagefright.so"
    if not os.path.exists(lib_path):
        continue
    with open(lib_path, "rb") as f:
        data = bytearray(f.read())
    if is64:
        off = 0x000f228c
        data[off:off+8] = bytes.fromhex("00008052c0035fd6")
    else:
        off = 0x000a552c
        data[off:off+4] = bytes.fromhex("00207047")
    with open(lib_path, "wb") as f:
        f.write(data)
    print(f"Patched {'64-bit' if is64 else '32-bit'} libstagefright.so at 0x{off:x}")
EOF
LOG_STEP_OUT

LOG_STEP_IN "- Restoring One UI 9 Live Blur in floating_feature.xml"
for ff in "$WORK_DIR/system/system/etc/floating_feature.xml" "$WORK_DIR/vendor/etc/floating_feature.xml"; do
    if [ -f "$ff" ]; then
        sed -i 's/3D_SURFACE_TRANSITION_FLAG>FALSE/3D_SURFACE_TRANSITION_FLAG>TRUE/' "$ff"
        sed -i 's/CAPTURED_BLUR>FALSE/CAPTURED_BLUR>TRUE/' "$ff"
        sed -i 's/PARTIAL_BLUR>FALSE/PARTIAL_BLUR>TRUE/' "$ff"
    fi
done
LOG_STEP_OUT

LOG_STEP_IN "- Tuning UI responsiveness, smoothness and dexopt for Snapdragon 730G"
SET_PROP "system" "debug.hwui.renderer" "skiagl"
SET_PROP "system" "ro.hwui.use_vulkan" "false"
SET_PROP "system" "ro.surface_flinger.supports_background_blur" "1"
SET_PROP "system" "persist.sys.unica.nativeblur" "true"
SET_PROP "system" "renderthread.skia.reduceopstasksplitting" "true"
SET_PROP "system" "ro.surface_flinger.max_frame_buffer_acquired_buffers" "3"
SET_PROP "system" "persist.sys.scrollingcache" "3"
SET_PROP "system" "sys.sysctl.swappiness" "100"
SET_PROP "system" "dalvik.vm.dex2oat-threads" "6"
SET_PROP "system" "dalvik.vm.boot-dex2oat-threads" "8"
SET_PROP "system" "dalvik.vm.dex2oat-cpu-set" "0,1,2,3,4,5,6,7"
SET_PROP "system" "dalvik.vm.boot-dex2oat-cpu-set" "0,1,2,3,4,5,6,7"
SET_PROP "system" "dalvik.vm.dex2oat64.enabled" "true"

SET_PROP "vendor" "debug.hwui.renderer" "skiagl"
SET_PROP "vendor" "ro.hwui.use_vulkan" "false"
SET_PROP "vendor" "ro.surface_flinger.supports_background_blur" "1"
SET_PROP "vendor" "persist.sys.unica.nativeblur" "true"
SET_PROP "vendor" "renderthread.skia.reduceopstasksplitting" "true"
SET_PROP "vendor" "ro.surface_flinger.max_frame_buffer_acquired_buffers" "3"
SET_PROP "vendor" "sys.sysctl.swappiness" "100"

if [ -f "$SRC_DIR/target/m51/camera/camera-feature.xml" ]; then
    cp -f "$SRC_DIR/target/m51/camera/camera-feature.xml" "$WORK_DIR/system/system/cameradata/camera-feature.xml"
fi

if [ -f "$SRC_DIR/target/m51/camera/SamsungCamera.apk.00" ]; then
    LOG "- Restoring stable SamsungCamera from 5.0.0"
    cat "$SRC_DIR/target/m51/camera/SamsungCamera.apk."[0-9][0-9] > "$WORK_DIR/system/system/priv-app/SamsungCamera/SamsungCamera.apk"
    chmod 644 "$WORK_DIR/system/system/priv-app/SamsungCamera/SamsungCamera.apk"
    SET_METADATA "system" "system/priv-app/SamsungCamera/SamsungCamera.apk" 0 0 644 "u:object_r:system_file:s0"
    if [ -f "$SRC_DIR/target/m51/camera/SamsungCamera.apk.prof" ]; then
        cp -f "$SRC_DIR/target/m51/camera/SamsungCamera.apk.prof" "$WORK_DIR/system/system/priv-app/SamsungCamera/SamsungCamera.apk.prof"
        chmod 644 "$WORK_DIR/system/system/priv-app/SamsungCamera/SamsungCamera.apk.prof"
        SET_METADATA "system" "system/priv-app/SamsungCamera/SamsungCamera.apk.prof" 0 0 644 "u:object_r:system_file:s0"
    fi
fi
LOG_STEP_OUT

LOG_STEP_IN "- Applying Codec2 & Media seccomp policy patch (Mehedi Joy)"
for policy in \
    "$WORK_DIR/vendor/etc/seccomp_policy/samsung.software.media.c2-base-policy" \
    "$WORK_DIR/vendor/etc/seccomp_policy/samsung.software.media.c2-ext-policy" \
    "$WORK_DIR/vendor/etc/seccomp_policy/codec2.vendor.ext.policy" \
    "$WORK_DIR/vendor/etc/seccomp_policy/mediacodec.policy" \
    "$WORK_DIR/vendor/etc/seccomp_policy/mediaextractor_sec.policy" \
    "$WORK_DIR/system/system/etc/seccomp_policy/mediacodec.policy" \
    "$WORK_DIR/system/system/etc/seccomp_policy/mediaextractor.policy"; do
    if [ -f "$policy" ]; then
        sed -i 's/^mremap: arg3 == 3$/mremap: arg3 == 3 || arg3 == MREMAP_MAYMOVE/' "$policy"
        sed -i 's/^mremap: 1$/mremap: arg3 == 3 || arg3 == MREMAP_MAYMOVE/' "$policy"
        if ! grep -q "mremap" "$policy"; then
            echo "mremap: arg3 == 3 || arg3 == MREMAP_MAYMOVE" >> "$policy"
        fi
    fi
done
LOG_STEP_OUT

LOG_STEP_IN "- Setting FUSE storage & Codec2 properties for Snapdragon 730G"
SET_PROP "system" "debug.codec2.stop_hal_before_surface" "1"
SET_PROP "vendor" "debug.codec2.stop_hal_before_surface" "1"
SET_PROP "system" "persist.sys.fuse.passthrough.enable" "true"
SET_PROP "vendor" "persist.sys.fuse.passthrough.enable" "true"
SET_PROP "system" "persist.sys.fuse" "true"
SET_PROP "vendor" "persist.sys.fuse" "true"
SET_PROP "system" "external_storage.projid.enabled" "1"
SET_PROP "vendor" "external_storage.projid.enabled" "1"
SET_PROP "system" "external_storage.casefold.enabled" "1"
SET_PROP "vendor" "external_storage.casefold.enabled" "1"
SET_PROP "system" "external_storage.sdcardfs.enabled" "0"
SET_PROP "vendor" "external_storage.sdcardfs.enabled" "0"
LOG_STEP_OUT
