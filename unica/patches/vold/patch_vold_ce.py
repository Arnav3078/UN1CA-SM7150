#!/usr/bin/env python3
import sys, os, struct, zlib, hashlib, zipfile

def patch_services_unlock_ce(work_dir):
    serv_path = os.path.join(work_dir, "system/system/framework/services.jar")
    if not os.path.isfile(serv_path):
        serv_path = os.path.join(work_dir, "system/framework/services.jar")
    if not os.path.isfile(serv_path):
        print("services.jar not found:", serv_path)
        return False

    with zipfile.ZipFile(serv_path, "r") as zin:
        dex = bytearray(zin.read("classes.dex"))

    # Target sequence at 0xc200ca:
    # 52 53 08 16 13 04 1e 00 36 43 26 00 38 06 0e 00
    # (iget mFirstApiLevel, const/16 30, if-gt, if-eqz)
    target_offset = 0xc200ca
    expected_header = bytes.fromhex("5253081613041e003643260038060e00")

    # Check if already patched
    # Patched starts with goto +42 words: 28 2a
    if dex[target_offset : target_offset + 2] == b"\x28\x2a" and dex[0xc2012a : 0xc2012c] == b"\x28\x0e":
        print("[+] services.jar unlockCeStorage is already patched!")
        return True

    if dex[target_offset : target_offset + 16] != expected_header:
        print(f"[-] Unexpected bytes at 0x{target_offset:x}: {dex[target_offset:target_offset+16].hex()}")
        return False

    # 1. At 0xc200ca: goto 0xc2011e (+42 words / +84 bytes)
    dex[target_offset : target_offset + 2] = b"\x28\x2a"
    # NOP the rest of the GateKeeper HAT check up to 0xc2011e
    dex[target_offset + 2 : 0xc2011e] = b"\x00" * (0xc2011e - (target_offset + 2))

    # Verify 0xc2011e has iget-object v5, v5, mStorageManagerInternal; const/4 v7, 0; invoke unlockCeStorage
    expected_cond8 = bytes.fromhex("54552b1612076e408d3a6527")
    if dex[0xc2011e : 0xc2011e + 12] != expected_cond8:
        print(f"[-] Unexpected cond8 bytes at 0xc2011e: {dex[0xc2011e : 0xc2011e + 12].hex()}")
        return False

    # 2. At 0xc2012a: goto 0xc20146 (+14 words / +28 bytes) + 4 NOPs
    dex[0xc2012a : 0xc20130] = b"\x28\x0e\x00\x00\x00\x00"

    print("[+] Successfully modified bytecode: bypass GateKeeperHAT check and jump straight to unlockCeStorage(null)")

    # Recompute DEX 2 checksum and signature
    d1_start = 0x99607c
    d1_size = 18038232
    new_sha1 = hashlib.sha1(dex[d1_start + 32 : d1_start + d1_size]).digest()
    dex[d1_start + 12 : d1_start + 32] = new_sha1
    new_checksum = zlib.adler32(dex[d1_start + 12 : d1_start + d1_size]) & 0xffffffff
    dex[d1_start + 8 : d1_start + 12] = struct.pack("<I", new_checksum)

    tmp_path = serv_path + ".tmp"
    with zipfile.ZipFile(tmp_path, "w", compression=zipfile.ZIP_DEFLATED) as zout:
        with zipfile.ZipFile(serv_path, "r") as zin:
            for item in zin.infolist():
                if item.filename == "classes.dex":
                    zout.writestr(item, bytes(dex))
                else:
                    zout.writestr(item, zin.read(item.filename))
    os.replace(tmp_path, serv_path)
    print("[+] services.jar written and updated with new DEX2 checksums successfully!")
    return True

if __name__ == "__main__":
    work_dir = sys.argv[1] if len(sys.argv) > 1 else "/home/arnav/UN1CA-4.0-M51/out/target/m51/work_dir"
    success = patch_services_unlock_ce(work_dir)
    sys.exit(0 if success else 1)
