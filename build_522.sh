#!/bin/bash
set -eo pipefail

cd /home/arnav/UN1CA-4.0-M51

export BUILD_TYPE="decrypted"
source buildenv.sh m51

echo "========================================="
echo "Building UN1CA for $TARGET_NAME ($TARGET_CODENAME)"
echo "Build Type: $BUILD_TYPE"
echo "Version: $ROM_VERSION"
echo "Timestamp: $(date)"
echo "========================================="

# 1. Build ROM & Target Files
./scripts/make_rom.sh -f -z

echo "========================================="
echo "ROM Build Complete. Generating Incremental OTA..."
echo "========================================="

TARGET_TARGET_FILES="out/m51_${ROM_VERSION}-target_files-decrypted.zip"

if [ ! -f "$TARGET_TARGET_FILES" ]; then
    echo "ERROR: Target files not found at $TARGET_TARGET_FILES"
    exit 1
fi

# 2. Build Incremental from 5.2.1
SOURCE_TARGET_FILES_521="out/m51_5.2.1-4eed4836-target_files-decrypted.zip"
if [ -f "$SOURCE_TARGET_FILES_521" ]; then
    echo "Building incremental from 5.2.1-4eed4836 -> $ROM_VERSION..."
    ./scripts/build_flashable_zip.sh -i "$SOURCE_TARGET_FILES_521" "$TARGET_TARGET_FILES"
else
    echo "WARNING: 5.2.1 target files not found!"
fi

# 3. Build Incremental from 5.2.0
SOURCE_TARGET_FILES_520="out/m51_5.2.0-a8acfea7-target_files-decrypted.zip"
if [ -f "$SOURCE_TARGET_FILES_520" ]; then
    echo "Building incremental from 5.2.0-a8acfea7 -> $ROM_VERSION..."
    ./scripts/build_flashable_zip.sh -i "$SOURCE_TARGET_FILES_520" "$TARGET_TARGET_FILES"
else
    echo "WARNING: 5.2.0 target files not found!"
fi

echo "========================================="
echo "ALL BUILDS COMPLETED SUCCESSFULLY AT $(date)"
echo "========================================="
