#!/usr/bin/env bash

# Delete disable if present
rm -f "$MODPATH/disable" 2>/dev/null || true

LOG_STEP_IN "- Binary patching framework.jar for custom platform signatures"
python3 "$MODPATH/patch_signature.py" framework "$WORK_DIR"
LOG_STEP_OUT

# Remove services.jar from apktool dir so apktool does not attempt to rebuild DEX 041
rm -rf "$APKTOOL_DIR/system/framework/services.jar" 2>/dev/null || true
