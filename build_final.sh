#!/bin/bash
set -eo pipefail

cd /home/arnav/UN1CA-4.0-M51

export BUILD_TYPE="decrypted"
source buildenv.sh m51

echo "========================================="
echo "Building UN1CA 5.3.0 FINAL FULL ROM for $TARGET_NAME ($TARGET_CODENAME)"
echo "Build Type: $BUILD_TYPE"
echo "Version: $ROM_VERSION"
echo "Timestamp: $(date)"
echo "========================================="

# Build Full Decrypted Flashable ROM & Target Files
./scripts/make_rom.sh -f -z

echo "========================================="
echo "FULL ROM BUILD COMPLETED SUCCESSFULLY AT $(date)"
echo "========================================="
