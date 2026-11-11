import os, re, subprocess, shutil, zipfile

def patch_keystoreutils(jar_path):
    print(f"[*] Patching samsungkeystoreutils.jar: {jar_path}")
    if not os.path.exists(jar_path):
        print(f"[-] {jar_path} not found")
        return False

    dis_dir = "/tmp/keystoreutils_dis"
    if os.path.exists(dis_dir):
        shutil.rmtree(dis_dir)
    os.makedirs(dis_dir, exist_ok=True)

    subprocess.run(["baksmali", "d", jar_path, "-o", dis_dir], check=True)

    target_smali = f"{dis_dir}/com/samsung/android/security/keystore/AttestParameterSpec.smali"
    if not os.path.exists(target_smali):
        print(f"[-] {target_smali} not found")
        return False

    with open(target_smali, "r") as f:
        code = f.read()

    p = r'(\.method public isVerifiableIntegrity\(\)Z.*?)(\.end method)'
    r = r'''.method public isVerifiableIntegrity()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method'''

    code, count = re.subn(p, r, code, flags=re.DOTALL)
    print(f"[+] Replaced isVerifiableIntegrity: {count}")
    with open(target_smali, "w") as f:
        f.write(code)

    tmp_dex = "/tmp/keystore_classes.dex"
    subprocess.run(["smali", "a", dis_dir, "-o", tmp_dex], check=True)

    # Update in jar
    tmp_jar_dir = "/tmp/keystore_jar"
    if os.path.exists(tmp_jar_dir):
        shutil.rmtree(tmp_jar_dir)
    os.makedirs(tmp_jar_dir, exist_ok=True)
    shutil.copy(tmp_dex, f"{tmp_jar_dir}/classes.dex")

    abs_jar = os.path.abspath(jar_path)
    subprocess.run(["zip", "-0", "-u", abs_jar, "classes.dex"], cwd=tmp_jar_dir, check=True)

    shutil.rmtree(dis_dir)
    shutil.rmtree(tmp_jar_dir)
    os.remove(tmp_dex)
    print(f"[+] Successfully patched {jar_path}")
    return True

if __name__ == "__main__":
    import sys
    path = sys.argv[1] if len(sys.argv) > 1 else "/home/arnav/UN1CA-4.0-M51/out/target/m51/work_dir/system/system/framework/samsungkeystoreutils.jar"
    patch_keystoreutils(path)
