#!/usr/bin/env python3
import sys, os, zipfile, subprocess, shutil, tempfile, glob

def patch_camera_apk(apk_path, src_dir):
    print(f"[*] Patching SamsungCamera.apk: {apk_path}")
    if not os.path.exists(apk_path):
        print(f"[-] {apk_path} not found, skipping.")
        return False

    tmp_dir = tempfile.mkdtemp(prefix="cam_patch_")
    patched_any = False
    try:
        with zipfile.ZipFile(apk_path, 'r') as zin:
            dex_names = [n for n in zin.namelist() if n.startswith('classes') and n.endswith('.dex')]
            for dex_name in dex_names:
                zin.extract(dex_name, tmp_dir)

        for dex_name in sorted(dex_names):
            dex_path = os.path.join(tmp_dir, dex_name)
            smali_dir = os.path.join(tmp_dir, f"smali_{dex_name}")
            print(f"[*] Disassembling {dex_name}...")
            subprocess.check_call(['baksmali', 'disassemble', dex_path, '-o', smali_dir])

            # Find smali files containing the argument check
            candidate_files = []
            for root, _, files in os.walk(smali_dir):
                for f in files:
                    if f.endswith('.smali'):
                        fpath = os.path.join(root, f)
                        try:
                            with open(fpath, 'r', encoding='utf-8') as sf:
                                content = sf.read()
                                if 'argument is invalid - ' in content and 'mOneUiVersionCode' in content:
                                    candidate_files.append((fpath, content))
                        except Exception:
                            pass

            if not candidate_files:
                continue

            for target_file, code in candidate_files:
                print(f"[*] Found candidate smali: {target_file}")
                # Determine class name
                class_line = [l for l in code.splitlines() if l.startswith('.class ')][0]
                class_type = class_line.split()[-1] # e.g. Lx1/k; or Le5/m;
                print(f"[*] Target enum class: {class_type}")

                # Find method a(I)
                start_marker = f".method public static a(I){class_type}"
                end_marker = ".end method"
                start_pos = code.find(start_marker)
                if start_pos == -1:
                    print(f"[-] Method a(I){class_type} not found, looking for generic a(I)...")
                    start_marker = ".method public static a(I)"
                    start_pos = code.find(start_marker)

                if start_pos == -1:
                    print("[-] Could not find a(I) method!")
                    continue

                end_pos = code.find(end_marker, start_pos) + len(end_marker)

                # Determine fallback field name (V9_0 if exists, else V8_0)
                fallback_field = "V9_0" if "V9_0:" in code else "V8_0"

                replacement = f""".method public static a(I){class_type}
    .registers 6

    invoke-static {{}}, {class_type}->values()[{class_type}

    move-result-object v0

    array-length v1, v0

    const/4 v2, 0x0

    :goto_6
    if-ge v2, v1, :cond_15

    aget-object v3, v0, v2

    const/4 v4, -0x1

    if-eq p0, v4, :cond_12

    iget v4, v3, {class_type}->mOneUiVersionCode:I

    if-ne v4, p0, :cond_12

    return-object v3

    :cond_12
    add-int/lit8 v2, v2, 0x1

    goto :goto_6

    :cond_15
    sget-object v0, {class_type}->{fallback_field}:{class_type}

    return-object v0
.end method"""

                new_code = code[:start_pos] + replacement + code[end_pos:]
                with open(target_file, 'w', encoding='utf-8') as sf:
                    sf.write(new_code)
                print(f"[+] Successfully patched {target_file} with fallback {fallback_field}!")

                # Reassemble dex
                print(f"[*] Reassembling {dex_name}...")
                subprocess.check_call(['smali', 'assemble', smali_dir, '-o', dex_path])
                subprocess.check_call(['zip', '-j', '-u', apk_path, dex_path])
                patched_any = True

        if not patched_any:
            print("[-] No target classes were found to patch!")
            return False

        # Re-sign apk with testkey
        key_pk8 = os.path.join(src_dir, 'security', 'aosp_platform.pk8')
        cert_pem = os.path.join(src_dir, 'security', 'aosp_platform.x509.pem')
        print(f"[*] Re-signing SamsungCamera.apk with ({key_pk8})...")
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
