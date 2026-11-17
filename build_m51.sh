#!/bin/bash
set -e

cd /home/arnav/UN1CA-4.0-M51

export BUILD_TYPE="decrypted"
source buildenv.sh m51

echo "========================================="
echo "Building UN1CA for $TARGET_NAME ($TARGET_CODENAME)"
echo "Build Type: $BUILD_TYPE"
echo "========================================="

./scripts/make_rom.sh -f -z
