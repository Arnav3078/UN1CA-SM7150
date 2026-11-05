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

    # Calls to ActivityTaskManagerService.enforceTaskPermission (71 10 8f a9 00 00)
    # NOPing these call sites eliminates MANAGE_ACTIVITY_TASKS permission denials
    # across SystemUI, ShellTaskOrganizer and WindowOrganizerController without
    # touching ATMS class bytecode or breaking ART method verification.
    call_sites = [
        (17369260 + 6, "getFocusedRootTaskInfo"),
        (17415412 + 6, "registerTaskStackListener"),
        (0x11a1ab6, "WindowOrganizerController.getApplyToken"),
        (0x11a1cb2, "WindowOrganizerController.getDisplayAreaOrganizerController"),
        (0x11a1cee, "WindowOrganizerController.getTaskOrganizerController"),
        (0x11a4c16, "WindowOrganizerController.applySyncTransaction"),
        (0x11a8322, "WindowOrganizerController.applyTransaction"),
        (0x11a84ca, "WindowOrganizerController.finishAllTransitions"),
        (0x11a85e2, "WindowOrganizerController.finishTransition"),
        (0x11a883e, "WindowOrganizerController.registerTransitionPlayer"),
        (0x11a8b9a, "WindowOrganizerController.unregisterTransitionPlayer"),
    ]
    target_invoke = bytes.fromhex("71108fa90000")
    nops = bytes.fromhex("000000000000")

    patched = False

    # Restore ATMS enforceTaskPermission if previously patched with 0e 00
    atms_enforce_off = 0x1098be4
    if dex[atms_enforce_off : atms_enforce_off + 2] == b"\x0e\x00":
        dex[atms_enforce_off : atms_enforce_off + 2] = b"\x1b\x00"
        print("[+] Restored ATMS.enforceTaskPermission original opcode")
        patched = True

    for offset, name in call_sites:
        if dex[offset : offset + 6] == target_invoke:
            dex[offset : offset + 6] = nops
            print(f"[+] Patched {name}: NOPed enforceTaskPermission call")
            patched = True
        elif dex[offset : offset + 6] == nops:
            print(f"[*] {name} is already patched")
        else:
            print(f"[-] Unexpected bytes at {name} ({hex(offset)}): {dex[offset:offset+6].hex(' ')}")

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
