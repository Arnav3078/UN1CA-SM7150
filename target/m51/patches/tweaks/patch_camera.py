#!/usr/bin/env python3
import sys, os, zipfile, subprocess, shutil, tempfile

def patch_camera_apk(apk_path, src_dir):
    print(f"[*] Patching SamsungCamera.apk: {apk_path}")
    if not os.path.exists(apk_path):
        print(f"[-] {apk_path} not found, skipping.")
        return False

    tmp_dir = tempfile.mkdtemp(prefix="cam_patch_")
    try:
        # Extract classes3.dex
        with zipfile.ZipFile(apk_path, 'r') as zin:
            zin.extract('classes3.dex', tmp_dir)

        dex_path = os.path.join(tmp_dir, 'classes3.dex')
        smali_dir = os.path.join(tmp_dir, 'smali3')

        # Baksmali classes3.dex
        print("[*] Disassembling classes3.dex...")
        subprocess.check_call(['baksmali', 'disassemble', dex_path, '-o', smali_dir])

        k_smali = os.path.join(smali_dir, 'x1', 'k.smali')
        if not os.path.exists(k_smali):
            print(f"[-] {k_smali} not found!")
            return False

        with open(k_smali, 'r', encoding='utf-8') as f:
            code = f.read()

        start_marker = ".method public static a(I)Lx1/k;"
        end_marker = ".end method"

        start_pos = code.find(start_marker)
        if start_pos == -1:
            print("[-] Method a(I)Lx1/k; not found!")
            return False

        end_pos = code.find(end_marker, start_pos) + len(end_marker)

        # Replacement method that returns V8_0 when unknown One UI version (like 90000) is passed
        replacement = """
.method public static a(I)Lx1/k;
    .registers 6

    invoke-static {}, Lx1/k;->values()[Lx1/k;

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v1, :cond_15

    aget-object v3, v0, v2

    const/4 v4, -0x1

    if-eq p0, v4, :cond_12

    iget v4, v3, Lx1/k;->mOneUiVersionCode:I

    if-ne v4, p0, :cond_12

    return-object v3

    :cond_12
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_15
    sget-object v0, Lx1/k;->V8_0:Lx1/k;

    return-object v0
.end method
""".strip()

        new_code = code[:start_pos] + replacement + code[end_pos:]

        with open(k_smali, 'w', encoding='utf-8') as f:
            f.write(new_code)
        print("[+] Replaced method a(I)Lx1/k; successfully!")

        # Re-assemble with smali
        patched_dex = os.path.join(tmp_dir, 'classes3.dex')
        print("[*] Reassembling classes3.dex with smali...")
        subprocess.check_call(['smali', 'assemble', smali_dir, '-o', patched_dex])

        # Replace classes3.dex in apk
        print("[*] Updating classes3.dex in SamsungCamera.apk...")
        subprocess.check_call(['zip', '-j', '-u', apk_path, patched_dex])

        # Sign apk with testkey
        key_pk8 = os.path.join(src_dir, 'security', 'aosp_platform.pk8')
        cert_pem = os.path.join(src_dir, 'security', 'aosp_platform.x509.pem')

        print(f"[*] Re-signing SamsungCamera.apk with testkey ({key_pk8})...")
        subprocess.check_call([
            'apksigner', 'sign',
            '--v4-signing-enabled', 'false',
            '--key', key_pk8,
            '--cert', cert_pem,
            apk_path
        ])
        if os.path.exists(apk_path + '.idsig'):
            os.remove(apk_path + '.idsig')
        print("[+] SamsungCamera.apk successfully patched and signed!")
        return True

    finally:
        shutil.rmtree(tmp_dir, ignore_errors=True)

if __name__ == '__main__':
    target_apk = sys.argv[1] if len(sys.argv) > 1 else "/home/arnav/UN1CA-4.0-M51/out/target/m51/work_dir/system/system/priv-app/SamsungCamera/SamsungCamera.apk"
    src_dir = sys.argv[2] if len(sys.argv) > 2 else "/home/arnav/UN1CA-4.0-M51"
    patch_camera_apk(target_apk, src_dir)
