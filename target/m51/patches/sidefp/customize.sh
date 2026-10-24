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

# Decode services.jar
DECODE_APK "system" "system/framework/services.jar" || exit 1
SRV_DIR="$APKTOOL_DIR/system/framework/services.jar"

# 3. Patch SemBiometricFeature.smali:
BIO_FEAT="$(find "$SRV_DIR" -name "SemBiometricFeature.smali" 2>/dev/null | head -n 1)"
if [ -n "$BIO_FEAT" ]; then
    LOG "- Configuring SemBiometricFeature for capacitive side-fingerprint & JDM HAL"
    python3 -c "
import sys, re
f = sys.argv[1]
with open(f, 'r') as fp:
    c = fp.read()
c = re.sub(r'sput-boolean\s+[pv][0-9],\s*Lcom/android/server/biometrics/SemBiometricFeature;->FEATURE_JDM_HAL:Z', 'const/4 v0, 0x1\n    sput-boolean v0, Lcom/android/server/biometrics/SemBiometricFeature;->FEATURE_JDM_HAL:Z', c)
c = re.sub(r'sput-boolean\s+[pv][0-9],\s*Lcom/android/server/biometrics/SemBiometricFeature;->FEATURE_FINGERPRINT_JDM_HAL:Z', 'const/4 v0, 0x1\n    sput-boolean v0, Lcom/android/server/biometrics/SemBiometricFeature;->FEATURE_FINGERPRINT_JDM_HAL:Z', c)
c = re.sub(r'sput-boolean\s+[pv][0-9],\s*Lcom/android/server/biometrics/SemBiometricFeature;->FP_FEATURE_SENSOR_IS_IN_DISPLAY_TYPE:Z', 'const/4 v2, 0x0\n    sput-boolean v2, Lcom/android/server/biometrics/SemBiometricFeature;->FP_FEATURE_SENSOR_IS_IN_DISPLAY_TYPE:Z', c)
c = re.sub(r'sput-boolean\s+[pv][0-9],\s*Lcom/android/server/biometrics/SemBiometricFeature;->FP_FEATURE_SENSOR_IS_ULTRASONIC:Z', 'const/4 v2, 0x0\n    sput-boolean v2, Lcom/android/server/biometrics/SemBiometricFeature;->FP_FEATURE_SENSOR_IS_ULTRASONIC:Z', c)
c = re.sub(r'sput-boolean\s+[pv][0-9],\s*Lcom/android/server/biometrics/SemBiometricFeature;->FP_FEATURE_SENSOR_IS_OPTICAL:Z', 'const/4 v0, 0x0\n    sput-boolean v0, Lcom/android/server/biometrics/SemBiometricFeature;->FP_FEATURE_SENSOR_IS_OPTICAL:Z', c)
c = re.sub(r'sput-boolean\s+[pv][0-9],\s*Lcom/android/server/biometrics/SemBiometricFeature;->FP_FEATURE_SENSOR_IS_SIDE:Z', 'const/4 v0, 0x1\n    sput-boolean v0, Lcom/android/server/biometrics/SemBiometricFeature;->FP_FEATURE_SENSOR_IS_SIDE:Z', c)
with open(f, 'w') as fp:
    fp.write(c)
" "$BIO_FEAT"
fi

# 4. Patch SemFingerprintServiceExtImpl.smali: disable UDFPS flags
EXT_IMPL="$(find "$SRV_DIR" -name "SemFingerprintServiceExtImpl.smali" 2>/dev/null | head -n 1)"
if [ -n "$EXT_IMPL" ]; then
    LOG "- Disabling UDFPS flags in SemFingerprintServiceExtImpl.smali"
    python3 -c "
import sys, re
f = sys.argv[1]
with open(f, 'r') as fp:
    c = fp.read()
c = re.sub(r'iput-boolean\s+[pv][0-9],\s*p0,\s*Lcom/android/server/biometrics/sensors/fingerprint/SemFingerprintServiceExtImpl;->mHasUltrasonicUdfps:Z', 'const/4 v0, 0x0\n    iput-boolean v0, p0, Lcom/android/server/biometrics/sensors/fingerprint/SemFingerprintServiceExtImpl;->mHasUltrasonicUdfps:Z', c)
c = re.sub(r'iput-boolean\s+[pv][0-9],\s*p0,\s*Lcom/android/server/biometrics/sensors/fingerprint/SemFingerprintServiceExtImpl;->mHasOpticalUdfps:Z', 'const/4 v0, 0x0\n    iput-boolean v0, p0, Lcom/android/server/biometrics/sensors/fingerprint/SemFingerprintServiceExtImpl;->mHasOpticalUdfps:Z', c)
c = re.sub(r'iput-boolean\s+[pv][0-9],\s*p0,\s*Lcom/android/server/biometrics/sensors/fingerprint/SemFingerprintServiceExtImpl;->mHasUdfps:Z', 'const/4 v0, 0x0\n    iput-boolean v0, p0, Lcom/android/server/biometrics/sensors/fingerprint/SemFingerprintServiceExtImpl;->mHasUdfps:Z', c)
with open(f, 'w') as fp:
    fp.write(c)
" "$EXT_IMPL"
fi

# 5. Patch FingerprintService$1.smali: hardcode sensor position "53.45,13.25"
FP_SERV_1="$(find "$SRV_DIR" -name "*FingerprintService*1.smali" 2>/dev/null | grep -v "Synthetic" | grep -v "Impl" | head -n 1)"
if [ -n "$FP_SERV_1" ]; then
    LOG "- Hardcoding sensor position in $(basename "$FP_SERV_1")"
    python3 -c "
import sys, re
f = sys.argv[1]
with open(f, 'r') as fp:
    c = fp.read()
pattern = r'new-instance p0, Ljava/io/File;[\s\S]*?const-string v0, \"/sys/class/fingerprint/fingerprint/position\"[\s\S]*?:try_start_0[\s\S]*?move-result-object p0'
if re.search(pattern, c):
    c = re.sub(pattern, ':try_start_0\n    const-string p0, \"53.45,13.25\"', c)
    with open(f, 'w') as fp:
        fp.write(c)
" "$FP_SERV_1"
fi

unset FRAMEWORK_JAR_DIR CHAR_SMALI INPUT_RUNE SRV_DIR BIO_FEAT EXT_IMPL FP_SERV_1
