#!/usr/bin/env bash
set -e

cd /home/arnav/UN1CA-4.0-M51
source buildenv.sh m51

echo "[+] Step 1: Building ROM with all patches, latest kernel, and flashable zip"
./scripts/make_rom.sh -f -z

echo "[+] Step 2: Copying output zip to Windows Desktop"
LATEST_ZIP=$(find "$OUT_DIR" -maxdepth 1 -name "UN1CA_*.zip" ! -name "*target_files*" -printf "%T@ %p\n" | sort -n | tail -n 1 | awk '{print $2}')
if [ -n "$LATEST_ZIP" ] && [ -f "$LATEST_ZIP" ]; then
    echo "[+] Found generated zip: $LATEST_ZIP"
    cp -af "$LATEST_ZIP" /mnt/c/Users/s/OneDrive/Desktop/UN1CA_5.1.1_OneUI9.0_M51.zip
    echo "[+] Successfully copied to /mnt/c/Users/s/OneDrive/Desktop/UN1CA_5.1.1_OneUI9.0_M51.zip"
else
    echo "[-] Flashable zip not found in $OUT_DIR"
    exit 1
fi

echo "[+] All steps completed successfully!"
