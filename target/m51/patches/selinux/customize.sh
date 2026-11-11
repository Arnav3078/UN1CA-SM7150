SKIPUNZIP=1

VER=""
if [ -f "$WORK_DIR/vendor/etc/selinux/plat_sepolicy_vers.txt" ]; then
    VER="$(head -n 1 "$WORK_DIR/vendor/etc/selinux/plat_sepolicy_vers.txt")"
fi

if [ -n "$VER" ]; then
    TARGET_FW_DIR="$FW_DIR/$(cut -d "/" -f 1 -s <<< "$TARGET_FIRMWARE")_$(cut -d "/" -f 2 -s <<< "$TARGET_FIRMWARE")"

    if [ ! -f "$WORK_DIR/system/system/etc/selinux/mapping/$VER.cil" ] && \
            [ -f "$TARGET_FW_DIR/system/system/etc/selinux/mapping/$VER.cil" ]; then
        ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/etc/selinux/mapping/$VER.cil" 0 0 644 "u:object_r:sepolicy_file:s0"
    fi
    if [ ! -f "$WORK_DIR/system/system/etc/selinux/mapping/$VER.compat.cil" ] && \
            [ -f "$TARGET_FW_DIR/system/system/etc/selinux/mapping/$VER.compat.cil" ]; then
        ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system" "system/etc/selinux/mapping/$VER.compat.cil" 0 0 644 "u:object_r:system_file:s0"
    fi

    SYS_EXT_WORK="$WORK_DIR/system/system/system_ext"
    if $TARGET_OS_BUILD_SYSTEM_EXT_PARTITION; then
        SYS_EXT_WORK="$WORK_DIR/system_ext"
    fi

    SYS_EXT_FW=""
    for CANDIDATE in \
        "$TARGET_FW_DIR/system_ext" \
        "$TARGET_FW_DIR/system/system/system_ext" \
        "$TARGET_FW_DIR/system/system_ext"; do
        if [ -d "$CANDIDATE" ]; then
            SYS_EXT_FW="$CANDIDATE"
            break
        fi
    done

    if [ -n "$SYS_EXT_FW" ]; then
        if [ ! -f "$SYS_EXT_WORK/etc/selinux/mapping/$VER.cil" ] && \
                [ -f "$SYS_EXT_FW/etc/selinux/mapping/$VER.cil" ]; then
            ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "etc/selinux/mapping/$VER.cil" 0 0 644 "u:object_r:system_file:s0"
        fi
        if [ ! -f "$SYS_EXT_WORK/etc/selinux/mapping/$VER.compat.cil" ] && \
                [ -f "$SYS_EXT_FW/etc/selinux/mapping/$VER.compat.cil" ]; then
            ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "system_ext" "etc/selinux/mapping/$VER.compat.cil" 0 0 644 "u:object_r:system_file:s0"
        fi
    fi

    if [ ! -f "$WORK_DIR/product/etc/selinux/mapping/$VER.cil" ] && \
            [ -f "$TARGET_FW_DIR/product/etc/selinux/mapping/$VER.cil" ]; then
        ADD_TO_WORK_DIR "$TARGET_FIRMWARE" "product" "etc/selinux/mapping/$VER.cil" 0 0 644 "u:object_r:system_file:s0"
    fi

    SELINUX_DIRS=()
    for D in \
        "$WORK_DIR/system/system/etc/selinux" \
        "$WORK_DIR/system/system/system_ext/etc/selinux" \
        "$WORK_DIR/system_ext/etc/selinux" \
        "$WORK_DIR/product/etc/selinux" \
        "$WORK_DIR/vendor/etc/selinux" \
        "$WORK_DIR/odm/etc/selinux"; do
        if [ -d "$D" ]; then
            SELINUX_DIRS+=("$D")
        fi
    done

    CIL_FILES=()
    if [ "${#SELINUX_DIRS[@]}" -gt 0 ]; then
        while IFS= read -r F; do
            CIL_FILES+=("$F")
        done < <(find "${SELINUX_DIRS[@]}" -name "*.cil")
    fi

    SUFFIX="_${VER//./_}"

    for MAPPING in \
        "$WORK_DIR/system/system/etc/selinux/mapping/$VER.cil" \
        "$WORK_DIR/system/system/system_ext/etc/selinux/mapping/$VER.cil" \
        "$WORK_DIR/system_ext/etc/selinux/mapping/$VER.cil" \
        "$WORK_DIR/product/etc/selinux/mapping/$VER.cil"; do

        [ -f "$MAPPING" ] || continue

        while IFS= read -r ATTR; do
            if [ "${#CIL_FILES[@]}" -eq 0 ] || ! grep -q -E "^\(typeattribute $ATTR\)" "${CIL_FILES[@]}"; then
                LOG "- Removing $ATTR"
                EVAL "sed -i -E '/\\(expandtypeattribute \\($ATTR\\)|\\(typeattributeset $ATTR /d' \"$MAPPING\""
            fi
        done < <(
            grep -oE "\(expandtypeattribute \([a-z0-9_]+$SUFFIX\)" "$MAPPING" |
                sed -E 's/.*\(([a-z0-9_]+)\)$/\1/' |
                sort -u
        )
    done
fi

unset VER TARGET_FW_DIR SYS_EXT_WORK SYS_EXT_FW CANDIDATE SELINUX_DIRS D CIL_FILES F SUFFIX MAPPING ATTR
