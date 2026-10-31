import sys, os, struct, zlib, hashlib, zipfile

def patch_framework(apktool_dir):
    path = os.path.join(apktool_dir, "system/framework/framework.jar/smali/android/content/pm/Signature.smali")
    if not os.path.isfile(path):
        print("File not found:", path)
        return
    with open(path, "r", encoding="utf-8") as f:
        content = f.read()

    target = """.method static blacklist areExactArraysMatch([Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)Z
    .locals 2

    invoke-static {p0}, Lcom/android/internal/util/ArrayUtils;->size([Ljava/lang/Object;)I"""

    replacement = """.method static blacklist areExactArraysMatch([Landroid/content/pm/Signature;[Landroid/content/pm/Signature;)Z
    .locals 2

    const/4 p0, 0x1

    return p0

    invoke-static {p0}, Lcom/android/internal/util/ArrayUtils;->size([Ljava/lang/Object;)I"""

    if target in content:
        content = content.replace(target, replacement, 1)
        with open(path, "w", encoding="utf-8") as f:
            f.write(content)
        print("Signature.areExactArraysMatch patched to return true")
    else:
        print("Target already patched or not found")

def patch_services(work_dir):
    serv_path = os.path.join(work_dir, "system/system/framework/services.jar")
    if not os.path.isfile(serv_path):
        print("File not found:", serv_path)
        return
    with zipfile.ZipFile(serv_path, "r") as zin:
        dex = bytearray(zin.read("classes.dex"))

    patched_any = False

    # 1. Signature reconciliation bypass
    if dex[0xde83dc : 0xde83dc + 4] == b"\x39\x00\x47\x00":
        dex[0xde83dc] = 0x29
        patched_any = True
        print("- Patched signature reconciliation check")

    # 2. KnoxGuard & RemoteLock complete neutralization (prevents 3010, 8135, 4099)
    kg_patches = [
        (0x12372d4, b"\x0e\x00", "Utils.lockSeDevice(1) -> return-void"),
        (0x12372f0, b"\x0e\x00", "Utils.lockSeDevice(2) -> return-void"),
        (0x1237560, b"\x0e\x00", "Utils.setRemoteLockToLockscreen(1) -> return-void"),
        (0x12375ac, b"\x0e\x00", "Utils.setRemoteLockToLockscreen(2) -> return-void"),
        (0x1232dbc, b"\x12\x00\x0f\x00", "KnoxGuardSeService.shouldBlockCustomRom -> return false"),
        (0xc14abc, b"\x0e\x00", "LockSettingsService.applyRemoteLock -> return-void"),
        (0xc15824, b"\x12\x00\x0f\x00", "LockSettingsService.isRemoteLock -> return false"),
        (0xc1ddb8, b"\x12\x00\x11\x00", "LockSettingsService.requestRemoteLockInfo -> return null"),
    ]

    for off, replacement, name in kg_patches:
        if dex[off : off + len(replacement)] != replacement:
            dex[off : off + len(replacement)] = replacement
            patched_any = True
            print(f"- Patched {name}")

    if patched_any:
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
        print("services.jar successfully binary-patched in place (Signature bypass + KnoxGuard/RemoteLock neutralized)")
    else:
        print("services.jar already fully patched")

if __name__ == "__main__":
    if len(sys.argv) > 2 and sys.argv[1] == "framework":
        patch_framework(sys.argv[2])
    elif len(sys.argv) > 2 and sys.argv[1] == "services":
        patch_services(sys.argv[2])
