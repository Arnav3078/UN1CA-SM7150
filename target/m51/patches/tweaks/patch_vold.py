#!/usr/bin/env python3
import os
import sys

def patch_vold(target):
    if not os.path.exists(target):
        print("[-] Target file not found:", target)
        sys.exit(1)

    with open(target, "rb") as f:
        data = bytearray(f.read())

    # 1. Verify original instructions at 0x85dd4 and 0x85e98
    orig_dd4 = bytes.fromhex("c1fcff90") # adrp x1, 1d000
    orig_e98 = bytes.fromhex("78350394") # bl 153478 <__errno@plt>

    b_to_hook = bytes.fromhex("31000014") # b 0x85e98
    hook_code = bytes.fromhex(
        "8a024039"  # ldrb w10, [x20]
        "95060091"  # add x21, x20, #1
        "880a40f9"  # ldr x8, [x20, #16]
        "5f010072"  # tst w10, #1
        "a002889a"  # csel x0, x21, x8, eq (source.c_str())
        "013d8052"  # mov w1, #0x1e8 (mode 0750)
        "163d0394"  # bl 0x155308 (fs_mkdirs@plt)
        "6a024039"  # ldrb w10, [x19]
        "76060091"  # add x22, x19, #1
        "680a40f9"  # ldr x8, [x19, #16]
        "5f010072"  # tst w10, #1
        "c002889a"  # csel x0, x22, x8, eq (target.c_str())
        "013d8052"  # mov w1, #0x1e8 (mode 0750)
        "0f3d0394"  # bl 0x155308 (fs_mkdirs@plt)
        "e00313aa"  # mov x0, x19
        "2d000094"  # bl 0x85f88 (UnmountTree)
        "c6ffff17"  # b 0x85df0 (return to mount)
    )

    if data[0x85dd4:0x85dd8] == b_to_hook and data[0x85e98:0x85e98+len(hook_code)] == hook_code:
        print("[+] vold is already patched with BindMount fs_mkdirs hook.")
        return

    if data[0x85dd4:0x85dd8] != orig_dd4:
        print(f"[-] Warning: unexpected bytes at 0x85dd4: {data[0x85dd4:0x85dd8].hex()}, expected {orig_dd4.hex()}")
        sys.exit(1)

    if data[0x85e98:0x85e9c] != orig_e98:
        print(f"[-] Warning: unexpected bytes at 0x85e98: {data[0x85e98:0x85e9c].hex()}, expected {orig_e98.hex()}")
        sys.exit(1)

    data[0x85dd4:0x85dd8] = b_to_hook
    data[0x85e98:0x85e98+len(hook_code)] = hook_code

    with open(target, "wb") as f:
        f.write(data)

    print(f"[+] Successfully hooked BindMount in {target} ({len(hook_code)} bytes).")

if __name__ == "__main__":
    target_path = sys.argv[1] if len(sys.argv) > 1 else "/home/arnav/UN1CA-4.0-M51/out/target/m51/work_dir/system/system/bin/vold"
    patch_vold(target_path)
