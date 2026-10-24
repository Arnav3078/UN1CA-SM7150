#!/usr/bin/env bash
# Copyright (c) 2026 Salvo Giangreco
# Copyright (c) 2026 Mehedi H Joy
# Copyright (c) 2026 Arnav
# SPDX-License-Identifier: GPL-3.0-or-later

# Automated builder for UN1CA 5.0 (One UI 9.0) for Samsung Galaxy M51 (m51)
# Port from Galaxy S23 (Snapdragon)

set -e

SRC_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$SRC_DIR"

echo "=========================================================="
echo " UN1CA 5.0 (One UI 9.0) — Samsung Galaxy M51 (m51)"
echo " Base: Galaxy S23 Series (One UI 9.0 Port)"
echo " Kernel: LostPrime with KernelSU"
echo " Maintainer: Arnav (@Arnav3078)"
echo " Upstream: Salvo Giangreco (@salvogiangri) & Mehedi H Joy (@mehedihjoy0)"
echo "=========================================================="

# Check if target files exist or need to be built
TARGET_ZIP="${1:-$SRC_DIR/out/m51_target_files.zip}"

if [ ! -f "$TARGET_ZIP" ]; then
    echo "[-] Target files ($TARGET_ZIP) not found."
    echo "[*] Initializing UN1CA build environment for Galaxy M51..."
    source buildenv.sh m51
    
    echo "[*] Creating target-files zip..."
    ./scripts/internal/create_target_files_zip.sh "$TARGET_ZIP"
fi

echo "[*] Building signed flashable OTA ZIP from $TARGET_ZIP..."
./scripts/build_flashable_zip.sh "$TARGET_ZIP"

echo "[+] Build completed successfully!"
ls -lh "$SRC_DIR/out/"*.zip 2>/dev/null || true
