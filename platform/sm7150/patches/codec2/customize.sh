LOG_STEP_IN "- Applying codec2-patch"

CODEC2_POLICY="$WORK_DIR/vendor/etc/seccomp_policy/samsung.software.media.c2-base-policy"

if [ -f "$CODEC2_POLICY" ]; then
    LOG "- Updating mremap rule in $CODEC2_POLICY"
    sed -i 's/^mremap:.*/mremap: 1/' "$CODEC2_POLICY"
    if ! grep -q "^mremap:" "$CODEC2_POLICY"; then
        echo "mremap: 1" >> "$CODEC2_POLICY"
    fi
fi

LOG_STEP_OUT
