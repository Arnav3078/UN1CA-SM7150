LOG_STEP_IN "- Adding latest modified firmwares for Galaxy M51"
EVAL "git clone \"https://github.com/mehedihjoy0/M51-FIRMWARES\" \"$TMP_DIR/M51-FIRMWARES\""
EVAL "rm -rf \"$TMP_DIR/M51-FIRMWARES/.git\""

find "$TMP_DIR/M51-FIRMWARES" -type f -name '*.??' -exec sh -c 'b=${0%.*};[ -e $b.00 ]&&cat $b.??>$b&&rm $b.??' {} \;

EVAL "mv \"$TMP_DIR/M51-FIRMWARES/\"* \"$TMP_DIR\""
EVAL "rm -rf \"$TMP_DIR/M51-FIRMWARES\""

# Never package or overwrite user's custom recovery (TWRP/OrangeFox)
EVAL "rm -f \"$TMP_DIR/recovery.img\""

# Always use patched vbmeta_samsung with verification and hashtree disabled (Flags: 3) to prevent dm-verity bootloops
if [ -f "$FW_DIR/SM-M515F_BVO/avb/vbmeta_samsung_patched.img" ]; then
    EVAL "cp -af \"$FW_DIR/SM-M515F_BVO/avb/vbmeta_samsung_patched.img\" \"$TMP_DIR/vbmeta_samsung.img\""
elif [ -f "$FW_DIR/SM-M515F_BVO/avb/vbmeta_samsung.img" ]; then
    EVAL "cp -af \"$FW_DIR/SM-M515F_BVO/avb/vbmeta_samsung.img\" \"$TMP_DIR/vbmeta_samsung.img\""
    printf "\x03" | dd of="$TMP_DIR/vbmeta_samsung.img" bs=1 seek=123 count=1 conv=notrunc 2>/dev/null || true
fi

if [ -f "$FW_DIR/SM-M515F_BVO/avb/vbmeta_patched.img" ]; then
    EVAL "cp -af \"$FW_DIR/SM-M515F_BVO/avb/vbmeta_patched.img\" \"$TMP_DIR/vbmeta.img\""
elif [ -f "$FW_DIR/SM-M515F_BVO/avb/vbmeta.img" ]; then
    EVAL "cp -af \"$FW_DIR/SM-M515F_BVO/avb/vbmeta.img\" \"$TMP_DIR/vbmeta.img\""
    printf "\x03" | dd of="$TMP_DIR/vbmeta.img" bs=1 seek=123 count=1 conv=notrunc 2>/dev/null || true
fi

LOG_STEP_OUT
