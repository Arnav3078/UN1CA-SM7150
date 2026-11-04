#!/usr/bin/env python3
import sys, os, struct, zlib, hashlib, zipfile

def patch_services_pif(work_dir):
    serv_path = os.path.join(work_dir, "system/system/framework/services.jar")
    if not os.path.isfile(serv_path):
        serv_path = os.path.join(work_dir, "system/framework/services.jar")
    if not os.path.isfile(serv_path):
        print("services.jar not found:", serv_path)
        return False

    with zipfile.ZipFile(serv_path, "r") as zin:
        dex = bytearray(zin.read("classes.dex"))

    off1 = 17369260  # getFocusedRootTaskInfo
    off2 = 17415412  # registerTaskStackListener
    target_invoke = bytes.fromhex("71108fa90000")
    nops = bytes.fromhex("000000000000")

    patched = False

    # Check off1
    if dex[off1+6 : off1+12] == target_invoke:
        dex[off1+6 : off1+12] = nops
        print("[+] Patched getFocusedRootTaskInfo: NOPed enforceTaskPermission call")
        patched = True
    elif dex[off1+6 : off1+12] == nops:
        print("[*] getFocusedRootTaskInfo is already patched")
    else:
        print(f"[-] Unexpected bytes at off1: {dex[off1:off1+12].hex(' ')}")

    # Check off2
    if dex[off2+6 : off2+12] == target_invoke:
        dex[off2+6 : off2+12] = nops
        print("[+] Patched registerTaskStackListener: NOPed enforceTaskPermission call")
        patched = True
    elif dex[off2+6 : off2+12] == nops:
        print("[*] registerTaskStackListener is already patched")
    else:
        print(f"[-] Unexpected bytes at off2: {dex[off2:off2+12].hex(' ')}")

    if not patched:
        print("[*] No changes needed in services.jar PIF hooks")
        return True

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
    success = patch_services_pif(work_dir)
    sys.exit(0 if success else 1)
