#!/usr/bin/env bash
set -e
cd /home/arnav/UN1CA-4.0-M51
source buildenv.sh m51
./scripts/make_rom.sh -f -z
