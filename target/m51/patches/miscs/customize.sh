# Use TEE SPI in setCosNameProp()
if grep -qF "$(echo -ne '\xe0\x03\x1f\x2a\xc5\x05\x00\x94')" "$WORK_DIR/system/system/bin/sem_daemon" 2>/dev/null; then
    HEX_PATCH "$WORK_DIR/system/system/bin/sem_daemon" \
        "e0031f2ac5050094" \
        "20008052c5050094"
elif grep -qF "$(echo -ne '\xe0\x03\x1f\x2a\x09\x06\x00\x94')" "$WORK_DIR/system/system/bin/sem_daemon" 2>/dev/null; then
    HEX_PATCH "$WORK_DIR/system/system/bin/sem_daemon" \
        "e0031f2a09060094" \
        "2000805209060094"
fi
