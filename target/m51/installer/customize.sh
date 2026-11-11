LOG_STEP_IN "- Adding latest modified firmwares for Galaxy M51"
FIRMWARE_CACHE="${SRC_DIR:-/home/arnav/UN1CA-4.0-M51}/out/cache/M51-FIRMWARES"
if [ ! -d "$FIRMWARE_CACHE" ] || [ ! -f "$FIRMWARE_CACHE/vbmeta.img" ]; then
    mkdir -p "$(dirname "$FIRMWARE_CACHE")"
    rm -rf "$FIRMWARE_CACHE"
    EVAL "git clone \"https://github.com/mehedihjoy0/M51-FIRMWARES\" \"$FIRMWARE_CACHE\""
    EVAL "rm -rf \"$FIRMWARE_CACHE/.git\""
    find "$FIRMWARE_CACHE" -type f -name '*.??' -exec sh -c 'b=${0%.*};[ -e $b.00 ]&&cat $b.??>$b&&rm $b.??' {} \;
fi

EVAL "cp -af \"$FIRMWARE_CACHE/\"* \"$TMP_DIR/\""

# Never package or overwrite user's custom recovery (TWRP/OrangeFox)
EVAL "rm -f \"$TMP_DIR/recovery.img\""

# Always patch vbmeta.img with AVB disabled (Flags: 3) to prevent dm-verity and custom kernel boot verification bootloops
if [ -f "$TMP_DIR/vbmeta.img" ]; then
    printf "\x03" | dd of="$TMP_DIR/vbmeta.img" bs=1 seek=123 count=1 conv=notrunc 2>/dev/null || true
    LOG "- Successfully patched vbmeta.img with AVB flag 0x03 (verification disabled)"
fi

LOG_STEP_OUT
