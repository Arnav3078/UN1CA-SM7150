#!/usr/bin/env bash

# Delete disable if present
rm -f "$MODPATH/disable" 2>/dev/null || true

LOG_STEP_IN "- Patching framework.jar for custom platform signatures"
DECODE_APK "system" "system/framework/framework.jar"

python3 "$MODPATH/patch_signature.py" framework "$APKTOOL_DIR"
LOG_STEP_OUT

LOG_STEP_IN "- Binary patching services.jar for shared user 1000 reconciliation"
python3 "$MODPATH/patch_signature.py" services "$WORK_DIR"

# Remove services.jar from apktool dir so apktool does not attempt to rebuild DEX 041
rm -rf "$APKTOOL_DIR/system/framework/services.jar" 2>/dev/null || true

# Remove precompiled oat/art/vdex so ART executes the patched dex container directly
rm -rf "$WORK_DIR/system/system/framework/oat/arm64/services."* 2>/dev/null || true
rmdir "$WORK_DIR/system/system/framework/oat/arm64" 2>/dev/null || true
rmdir "$WORK_DIR/system/system/framework/oat" 2>/dev/null || true

sed -i "/framework\/oat/d" "$WORK_DIR/configs/fs_config-system" 2>/dev/null || true
sed -i "/framework\/oat/d" "$WORK_DIR/configs/file_context-system" 2>/dev/null || true

LOG_STEP_OUT
