import os
import sys

work_dir = os.environ.get("WORK_DIR", "/home/arnav/UN1CA-4.0-M51/out/target/m51/work_dir")
default_target = f"{work_dir}/vendor/bin/hw/android.hardware.graphics.composer@2.4-service"
target = sys.argv[1] if len(sys.argv) > 1 else default_target

if not os.path.exists(target):
    print("Target file not found:", target)
    sys.exit(0)

with open(target, "r+b") as f:
    f.seek(0x16cb4)
    expected = bytes.fromhex("60030036")
    curr = f.read(4)
    if curr == expected or curr == bytes.fromhex("1f2003d5"):
        f.seek(0x16cb4)
        f.write(bytes.fromhex("1f2003d5"))  # nop
        print("Successfully patched HWC command parser at 0x16cb4 with NOP!")
    else:
        print(f"Warning: Unexpected bytes at 0x16cb4: {curr.hex()} (expected {expected.hex()})")

print("Patching composer complete.")
