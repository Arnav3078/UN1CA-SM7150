SET_PROP_IF_DIFF "vendor" "ro.oem_unlock_supported" "0"

# Better device/model detection in CoreRune
SMALI_PATCH "system" "system/framework/framework.jar" \
    "smali_classes6/com/samsung/android/rune/CoreRune.smali" "replace" \
    '<clinit>()V' \
    'ro.product.model' \
    'ro.product.vendor.model'
SMALI_PATCH "system" "system/framework/framework.jar" \
    "smali_classes6/com/samsung/android/rune/CoreRune.smali" "replace" \
    '<clinit>()V' \
    'ro.product.device' \
    'ro.product.vendor.device'

# shellcheck disable=SC2016
# Disable RescueParty
if [ -f "$APKTOOL_DIR/system/framework/services.jar/smali/com/android/server/RescueParty.smali" ]; then
    SMALI_PATCH "system" "system/framework/services.jar" \
        "smali/com/android/server/RescueParty.smali" "return" \
        '-$$Nest$smisDisabled()Z' \
        'true'
elif [ -f "$APKTOOL_DIR/system/framework/services.jar/smali/com/android/server/SecRescueParty.smali" ]; then
    LOG "- SecRescueParty present, skipping legacy RescueParty patch"
fi

# Better model detection in FreecessController
SMALI_PATCH "system" "system/framework/services.jar" \
    "smali/com/android/server/am/FreecessController.smali" "replace" \
    '<clinit>()V' \
    'ro.product.model' \
    'ro.product.vendor.model'

# Disable vendor mismatch dialog
python3 - << 'EOF'
import os

services_dir = os.environ.get("APKTOOL_DIR", "") + "/system/framework/services.jar"
if os.path.isdir(services_dir):
    for root, dirs, files in os.walk(services_dir):
        for f in files:
            if f.endswith(".smali"):
                p = os.path.join(root, f)
                with open(p, "r") as fl:
                    content = fl.read()
                if "Build fingerprint is not consistent" in content:
                    lines = content.splitlines(True)
                    new_lines = []
                    for line in lines:
                        if "invoke-virtual" in line and "Handler;->post(Ljava/lang/Runnable;)Z" in line:
                            new_lines.append("    # " + line.lstrip())
                        else:
                            new_lines.append(line)
                    with open(p, "w") as fl:
                        fl.write("".join(new_lines))
                    print(f"  - Disabled vendor mismatch warning in {f}")
EOF
