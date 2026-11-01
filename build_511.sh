#!/usr/bin/env bash
set -e

cd /home/arnav/UN1CA-4.0-M51
source buildenv.sh m51

TARGET_FILES="$OUT_DIR/m51_5.1.1-target_files.zip"
echo "[+] Step 1: Building target-files zip: $TARGET_FILES"
"$SRC_DIR/scripts/internal/create_target_files_zip.sh" "$TARGET_FILES"

echo "[+] Step 2: Building signed flashable zip"
"$SRC_DIR/scripts/build_flashable_zip.sh" "$TARGET_FILES"

echo "[+] Step 3: Copying output zip to Windows Desktop"
LATEST_ZIP=$(find "$OUT_DIR" -maxdepth 1 -name "UN1CA_*.zip" | grep -v "target_files" | sort | tail -n 1)
if [ -n "$LATEST_ZIP" ] && [ -f "$LATEST_ZIP" ]; then
    echo "[+] Found generated zip: $LATEST_ZIP"
    cp -af "$LATEST_ZIP" /mnt/c/Users/s/OneDrive/Desktop/UN1CA_5.1.1_OneUI9.0_M51.zip
    echo "[+] Successfully copied to /mnt/c/Users/s/OneDrive/Desktop/UN1CA_5.1.1_OneUI9.0_M51.zip"
else
    echo "[-] Flashable zip not found in $OUT_DIR"
    exit 1
fi

echo "[+] All steps completed successfully!"
