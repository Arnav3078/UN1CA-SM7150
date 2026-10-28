# Decode framework.jar
DECODE_APK "system" "system/framework/framework.jar" || exit 1
FRAMEWORK_JAR_DIR="$APKTOOL_DIR/system/framework/framework.jar"

# 1. Patch SemFingerprintManager$Characteristics: getSensorType() -> 0x1 (capacitive side-fingerprint)
CHAR_SMALI="$(find "$FRAMEWORK_JAR_DIR" -name "*Characteristics.smali" 2>/dev/null | grep -i "fingerprint" | head -n 1)"
if [ -n "$CHAR_SMALI" ]; then
    LOG "- Patching getSensorType() to 0x1 in $(basename "$CHAR_SMALI")"
    python3 -c "
import sys, re
f = sys.argv[1]
with open(f, 'r') as fp:
    c = fp.read()
pattern = r'(\.method public.*?getSensorType\(\)I[\s\S]*?)const/4\s+[pv][0-9],\s*0x[0-9]+([\s\S]*?\.end method)'
if re.search(pattern, c):
    c = re.sub(pattern, r'\g<1>const/4 p0, 0x1\g<2>', c)
    with open(f, 'w') as fp:
        fp.write(c)
" "$CHAR_SMALI"
fi

# 2. Patch InputRune.smali: PWM_SKIP_TOO_FAST_DOUBLE_PRESS -> false (0x0)
INPUT_RUNE="$(find "$FRAMEWORK_JAR_DIR" -name "InputRune.smali" 2>/dev/null | head -n 1)"
if [ -n "$INPUT_RUNE" ]; then
    LOG "- Ensuring PWM_SKIP_TOO_FAST_DOUBLE_PRESS=false in InputRune.smali"
    python3 -c "
import sys, re
f = sys.argv[1]
with open(f, 'r') as fp:
    c = fp.read()
c = re.sub(r'sput-boolean\s+[pv][0-9],\s*Lcom/samsung/android/rune/InputRune;->PWM_SKIP_TOO_FAST_DOUBLE_PRESS:Z', 'const/4 v0, 0x0\n    sput-boolean v0, Lcom/samsung/android/rune/InputRune;->PWM_SKIP_TOO_FAST_DOUBLE_PRESS:Z', c)
with open(f, 'w') as fp:
    fp.write(c)
" "$INPUT_RUNE"
fi


unset FRAMEWORK_JAR_DIR CHAR_SMALI INPUT_RUNE
