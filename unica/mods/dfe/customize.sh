LOG "- Disabling force encryption"
for f in "$WORK_DIR/vendor/etc"/fstab*; do
    [ -f "$f" ] || continue
    sed -E -i \
        -e 's/fileencryption=[^,[:space:]]+,?//g' \
        -e 's/metadata_encryption=[^,[:space:]]+,?//g' \
        -e 's/keydirectory=[^,[:space:]]+,?//g' \
        -e 's/forceencrypt=[^,[:space:]]+,?//g' \
        -e 's/forcefde=[^,[:space:]]+,?//g' \
        -e 's/,,/,/g' \
        -e 's/,[[:space:]]*$/ /' \
        "$f"
done

LOG "- Removing frp"
SET_PROP "product" "ro.frp.pst" --delete
SET_PROP "vendor" "ro.frp.pst" --delete