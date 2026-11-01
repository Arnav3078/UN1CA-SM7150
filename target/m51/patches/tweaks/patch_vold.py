import os
import sys

target = sys.argv[1] if len(sys.argv) > 1 else "/home/arnav/UN1CA-4.0-M51/out/target/m51/work_dir/system/system/bin/vold"

if not os.path.exists(target):
    print("Target file not found:", target)
    sys.exit(0)

with open(target, "rb") as f:
    data = bytearray(f.read())

patches = {
    0x82e70: (bytes.fromhex("688e8cd2"), bytes.fromhex("080f8fd2")),
    0x830b0: (bytes.fromhex("698e8cd2"), bytes.fromhex("090f8fd2")),
    0x83798: (bytes.fromhex("698e8cd2"), bytes.fromhex("090f8fd2")),
    0x83870: (bytes.fromhex("6a8e8cd2"), bytes.fromhex("0a0f8fd2")),
    0x8426c: (bytes.fromhex("688e8cd2"), bytes.fromhex("080f8fd2")),
    0x84c1c: (bytes.fromhex("688e8cd2"), bytes.fromhex("080f8fd2")),
}

for off, (orig, repl) in patches.items():
    actual = data[off:off+4]
    if actual == orig:
        data[off:off+4] = repl
        print(f"Patched sdcardfs check at 0x{off:x}")
    elif actual == repl:
        print(f"Already patched at 0x{off:x}")
    else:
        print(f"Warning: unexpected bytes at 0x{off:x}: {actual.hex()}")

with open(target, "wb") as f:
    f.write(data)

print("vold patched successfully to disable legacy sdcardfs and enforce pure FUSE.")
