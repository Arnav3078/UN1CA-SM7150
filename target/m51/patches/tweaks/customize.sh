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

LOG_STEP_IN "- Enabling Hardware Acceleration & Smooth UI Performance"
SET_PROP "vendor" "debug.egl.hw" "1"
SET_PROP "vendor" "debug.sf.hw" "1"
SET_PROP "vendor" "ro.hwui.use_vulkan" "false"
SET_PROP "vendor" "debug.hwui.renderer" "skiagl"
SET_PROP "vendor" "ro.surface_flinger.supports_background_blur" "0"
SET_PROP "vendor" "persist.sys.unica.nativeblur" "false"
SET_PROP "vendor" "ro.sf.blurs_are_expensive" "1"
SET_PROP "vendor" "sys.sysctl.swappiness" "60"
SET_PROP "vendor" "ro.surface_flinger.max_frame_buffer_acquired_buffers" "3"
SET_PROP "vendor" "sys.use_fifo_ui" "1"

SET_PROP "system" "debug.egl.hw" "1"
SET_PROP "system" "debug.sf.hw" "1"
SET_PROP "system" "ro.hwui.use_vulkan" "false"
SET_PROP "system" "debug.hwui.renderer" "skiagl"
SET_PROP "system" "ro.surface_flinger.supports_background_blur" "0"
SET_PROP "system" "persist.sys.unica.nativeblur" "false"
SET_PROP "system" "persist.sys.sf.disable_blurs" "1"
SET_PROP "system" "ro.sf.blurs_are_expensive" "1"
SET_PROP "system" "sys.sysctl.swappiness" "60"
SET_PROP "system" "ro.surface_flinger.max_frame_buffer_acquired_buffers" "3"
SET_PROP "system" "sys.use_fifo_ui" "1"
SET_PROP "system" "ro.config.avoid_gfx_accel" "false"
SET_PROP "system" "video.accelerate.hw" "1"
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
SET_PROP "system" "ro.surface_flinger.supports_background_blur" "0"
SET_PROP "system" "persist.sys.unica.nativeblur" "false"
SET_PROP "system" "persist.sys.sf.disable_blurs" "1"
SET_PROP "system" "ro.sf.blurs_are_expensive" "1"
SET_PROP "system" "renderthread.skia.reduceopstasksplitting" "true"
SET_PROP "system" "ro.surface_flinger.max_frame_buffer_acquired_buffers" "3"
SET_PROP "system" "persist.sys.scrollingcache" "3"
SET_PROP "system" "sys.sysctl.swappiness" "60"
SET_PROP "system" "dalvik.vm.dex2oat-threads" "6"
SET_PROP "system" "dalvik.vm.boot-dex2oat-threads" "8"
SET_PROP "system" "dalvik.vm.dex2oat-cpu-set" "0,1,2,3,4,5,6,7"
SET_PROP "system" "dalvik.vm.boot-dex2oat-cpu-set" "0,1,2,3,4,5,6,7"
SET_PROP "system" "dalvik.vm.dex2oat64.enabled" "true"

SET_PROP "vendor" "debug.hwui.renderer" "skiagl"
SET_PROP "vendor" "ro.hwui.use_vulkan" "false"
SET_PROP "vendor" "ro.surface_flinger.supports_background_blur" "0"
SET_PROP "vendor" "persist.sys.unica.nativeblur" "false"
SET_PROP "vendor" "ro.sf.blurs_are_expensive" "1"
SET_PROP "vendor" "renderthread.skia.reduceopstasksplitting" "true"
SET_PROP "vendor" "ro.surface_flinger.max_frame_buffer_acquired_buffers" "3"
SET_PROP "vendor" "sys.sysctl.swappiness" "60"

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

LOG_STEP_IN "- Fixing Qualcomm Codec2 seccomp policy"
CODEC2_POLICY="$WORK_DIR/vendor/etc/seccomp_policy/samsung.software.media.c2-base-policy"
if [ -f "$CODEC2_POLICY" ]; then
    sed -i 's/^mremap: .*/mremap: 1/' "$CODEC2_POLICY"
    if ! grep -q "mremap: 1" "$CODEC2_POLICY"; then
        echo "mremap: 1" >> "$CODEC2_POLICY"
    fi
fi
LOG_STEP_OUT


LOG_STEP_IN "- Setting first_api_level to 33 to prevent Knox Abnormal Detection (3010)"
SET_PROP "vendor" "ro.product.first_api_level" "33"
SET_PROP "system" "ro.product.first_api_level" "33"
LOG_STEP_OUT

LOG_STEP_IN "- Disabling Android RescueParty and adding SSRM/SDHMS property contexts"
SET_PROP "system" "persist.sys.enable_rescue" "false"
SET_PROP "system" "persist.sys.disable_rescue" "true"
if [ -f "$WORK_DIR/system/system/etc/selinux/plat_property_contexts" ]; then
    if ! grep -q "dev.ssrm." "$WORK_DIR/system/system/etc/selinux/plat_property_contexts"; then
        echo "dev.ssrm. u:object_r:system_prop:s0" >> "$WORK_DIR/system/system/etc/selinux/plat_property_contexts"
    fi
    if ! grep -q "dev.sdhms." "$WORK_DIR/system/system/etc/selinux/plat_property_contexts"; then
        echo "dev.sdhms. u:object_r:system_prop:s0" >> "$WORK_DIR/system/system/etc/selinux/plat_property_contexts"
    fi
fi
LOG_STEP_OUT

LOG_STEP_IN "- Restoring authentic Samsung platform KnoxGuard"
FW_S23_SRC="${FW_DIR:-$SRC_DIR/out/fw}/SM-S911B_EUX"
if [ -f "$FW_S23_SRC/system/system/priv-app/KnoxGuard/KnoxGuard.apk" ]; then
    rm -rf "$WORK_DIR/system/system/priv-app/KnoxGuard"
    cp -af "$FW_S23_SRC/system/system/priv-app/KnoxGuard" "$WORK_DIR/system/system/priv-app/KnoxGuard"
fi
LOG_STEP_OUT

LOG_STEP_IN "- Binary patching framework.jar and services.jar for custom platform signatures and Knox neutralization"
python3 "$SRC_DIR/unica/patches/signature/patch_signature.py" framework "$WORK_DIR" || true
python3 "$SRC_DIR/unica/patches/signature/patch_signature.py" services "$WORK_DIR" || true
LOG_STEP_OUT


LOG_STEP_IN "- Allowing ChoiDujour in Samsung preload apps whitelist"
if [ -f "$WORK_DIR/system/system/etc/sysconfig/allowed-system-preload-apps.xml" ]; then
    python3 "$SRC_DIR/target/m51/tools/patch_allowed_preload.py" "$WORK_DIR/system/system/etc/sysconfig/allowed-system-preload-apps.xml" || true
fi
LOG_STEP_OUT

LOG_STEP_IN "- Fixing MediaProvider SELinux domain in plat_seapp_contexts"
PLAT_SEAPP="$WORK_DIR/system/system/etc/selinux/plat_seapp_contexts"
if [ -f "$PLAT_SEAPP" ]; then
    python3 "$SRC_DIR/target/m51/tools/patch_seapp.py" "$PLAT_SEAPP" || true
fi
LOG_STEP_OUT

LOG_STEP_IN "- Disabling FUSE BPF and Passthrough for Linux 4.14 compatibility"
SET_PROP "system" "ro.fuse.bpf.enabled" "false"
SET_PROP "vendor" "ro.fuse.bpf.enabled" "false"
SET_PROP "system" "persist.sys.fuse.passthrough.enable" "false"
SET_PROP "vendor" "persist.sys.fuse.passthrough.enable" "false"
SET_PROP "system" "persist.sys.fuse.bpf.enable" "false"
SET_PROP "vendor" "persist.sys.fuse.bpf.enable" "false"

if [ -f "$WORK_DIR/vendor/default.prop" ]; then
    sed -i 's/persist.sys.fuse.passthrough.enable=true/persist.sys.fuse.passthrough.enable=false/g' "$WORK_DIR/vendor/default.prop"
fi
LOG_STEP_OUT

LOG_STEP_IN "- Ensuring clean stock Samsung vold binary"
FW_S23_SRC="${FW_DIR:-$SRC_DIR/out/fw}/SM-S911B_EUX"
if [ -f "$FW_S23_SRC/system/system/bin/vold" ]; then
    cp -af "$FW_S23_SRC/system/system/bin/vold" "$WORK_DIR/system/system/bin/vold"
fi
LOG_STEP_OUT

LOG_STEP_IN "- Ensuring unlockCeStorage GateKeeper HAT bypass in services.jar"
python3 "$SRC_DIR/unica/patches/vold/patch_vold_ce.py" "$WORK_DIR" || true
LOG_STEP_OUT


LOG_STEP_IN "- Allowing system_app (SDHMS/PIF) and priv_app (ChoiDujour) SELinux permissions"
PLAT_SEPOLICY="$WORK_DIR/system/system/etc/selinux/plat_sepolicy.cil"
if [ -f "$PLAT_SEPOLICY" ]; then
    if ! grep -q "(allow system_app system_prop (property_service (set)))" "$PLAT_SEPOLICY"; then
        echo "(allow system_app system_prop (property_service (set)))" >> "$PLAT_SEPOLICY"
        echo "(allow system_app system_prop (file (open read getattr map)))" >> "$PLAT_SEPOLICY"
        echo "(allow untrusted_app system_prop (property_service (set)))" >> "$PLAT_SEPOLICY"
        echo "(allow untrusted_app system_prop (file (open read getattr map)))" >> "$PLAT_SEPOLICY"
        echo "(allow untrusted_app_30 system_prop (property_service (set)))" >> "$PLAT_SEPOLICY"
        echo "(allow untrusted_app_30 system_prop (file (open read getattr map)))" >> "$PLAT_SEPOLICY"
        echo "(allow untrusted_app_32 system_prop (property_service (set)))" >> "$PLAT_SEPOLICY"
        echo "(allow untrusted_app_32 system_prop (file (open read getattr map)))" >> "$PLAT_SEPOLICY"
    fi
    if ! grep -q "(allow priv_app fota_data_file" "$PLAT_SEPOLICY"; then
        echo "(allow priv_app fota_data_file (dir (create open read write getattr setattr search add_name remove_name rmdir)))" >> "$PLAT_SEPOLICY"
        echo "(allow priv_app fota_data_file (file (create open read write getattr setattr unlink map)))" >> "$PLAT_SEPOLICY"
        echo "(allow priv_app_36 fota_data_file (dir (create open read write getattr setattr search add_name remove_name rmdir)))" >> "$PLAT_SEPOLICY"
        echo "(allow priv_app_36 fota_data_file (file (create open read write getattr setattr unlink map)))" >> "$PLAT_SEPOLICY"
    fi
fi

mkdir -p "$WORK_DIR/system/system/etc/init"
cat << 'EOF' > "$WORK_DIR/system/system/etc/init/unica_fota.rc"
on post-fs-data
    mkdir /data/fota 0777 system system
    chmod 0777 /data/fota
EOF
echo "/system/etc/init/unica_fota\.rc u:object_r:system_file:s0" >> "$WORK_DIR/configs/file_context-system" 2>/dev/null || true
echo "system/etc/init/unica_fota.rc 0 0 644" >> "$WORK_DIR/configs/fs_config-system" 2>/dev/null || true
LOG_STEP_OUT

LOG_STEP_IN "- Installing fallback Yurikey keybox into system/etc/security/keybox.xml"
mkdir -p "$WORK_DIR/system/system/etc/security"
cp -af "$SRC_DIR/target/m51/patches/tweaks/system/etc/security/keybox.xml" "$WORK_DIR/system/system/etc/security/keybox.xml"
chmod 644 "$WORK_DIR/system/system/etc/security/keybox.xml"
echo "/system/etc/security/keybox\.xml u:object_r:system_file:s0" >> "$WORK_DIR/configs/file_context-system" 2>/dev/null || true
echo "system/etc/security/keybox.xml 0 0 644" >> "$WORK_DIR/configs/fs_config-system" 2>/dev/null || true
LOG_STEP_OUT

LOG_STEP_IN "- Patching services.jar for Play Integrity task permission bypass"
python3 "$SRC_DIR/target/m51/tools/patch_services_pif.py" "$WORK_DIR" || true
LOG_STEP_OUT

LOG_STEP_IN "- Configuring native UN1CA Play Integrity and Yurikey keybox defaults"
SET_PROP "system" "persist.sys.unica.pif" "true"
SET_PROP "system" "persist.sys.unica.keybox" "true"
SET_PROP "system" "persist.sys.pif.brand" "google"
SET_PROP "system" "persist.sys.pif.manufacturer" "Google"
SET_PROP "system" "persist.sys.pif.model" "Pixel 6a"
SET_PROP "system" "persist.sys.pif.product" "bluejay_beta"
SET_PROP "system" "persist.sys.pif.device" "bluejay"
SET_PROP "system" "persist.sys.pif.release" "CANARY"
SET_PROP "system" "persist.sys.pif.id" "ZP11.260918.007"
SET_PROP "system" "persist.sys.pif.incremental" "16484274"
SET_PROP "system" "persist.sys.pif.fingerprint" "google/bluejay_beta/bluejay:CANARY/ZP11.260918.007/16484274:user/release-keys"
SET_PROP "system" "persist.sys.pif.security_patch" "2026-10-05"
SET_PROP "system" "persist.sys.pif.first_api_level" "32"
SET_PROP "system" "persist.sys.pif.version" "20261016"
LOG_STEP_OUT
