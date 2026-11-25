import os
import sys
import shutil
import zipfile
import subprocess
import tempfile


def patch_launcher(apk_path, sec_dir):
    if not os.path.isfile(apk_path):
        print(f"Error: {apk_path} not found")
        sys.exit(1)

    print("- Enabling native One UI 9.5 AppLock in TouchWizHome_2017: " + apk_path)
    temp_dir = tempfile.mkdtemp(prefix="launcher_applock_")
    try:
        classes1_dex = os.path.join(temp_dir, "classes.dex")
        with zipfile.ZipFile(apk_path, "r") as z:
            z.extract("classes.dex", temp_dir)

        smali1_dir = os.path.join(temp_dir, "smali1")
        subprocess.check_call(["baksmali", "d", classes1_dex, "-o", smali1_dir])

        rune_path = os.path.join(smali1_dir, "com", "honeyspace", "common", "Rune.smali")
        with open(rune_path, "r", encoding="utf-8") as f:
            rune = f.read()

        old_field = ".field private static final SUPPORT_APP_LOCK:Z = false"
        new_field = ".field private static final SUPPORT_APP_LOCK:Z = true"
        if old_field not in rune:
            raise RuntimeError("SUPPORT_APP_LOCK field not found in Rune.smali")
        rune = rune.replace(old_field, new_field, 1)

        with open(rune_path, "w", encoding="utf-8") as f:
            f.write(rune)

        subprocess.check_call(["smali", "a", smali1_dir, "-o", classes1_dex])
        subprocess.check_call(["zip", "-j", "-u", apk_path, classes1_dex])
        subprocess.call(
            ["zip", "-d", apk_path, "META-INF/*.SF", "META-INF/*.RSA", "META-INF/*.MF"],
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
        )

        aligned_apk = os.path.join(temp_dir, "aligned.apk")
        subprocess.check_call(["zipalign", "-f", "-p", "4", apk_path, aligned_apk])
        subprocess.check_call([
            "apksigner", "sign",
            "--key", os.path.join(sec_dir, "aosp_platform.pk8"),
            "--cert", os.path.join(sec_dir, "aosp_platform.x509.pem"),
            aligned_apk,
        ])
        shutil.copy2(aligned_apk, apk_path)

        idsig = apk_path + ".idsig"
        if os.path.isfile(idsig):
            os.remove(idsig)
        oat_dir = os.path.join(os.path.dirname(apk_path), "oat")
        if os.path.isdir(oat_dir):
            shutil.rmtree(oat_dir, ignore_errors=True)
        for prof in (apk_path.replace(".apk", ".prof"), apk_path.replace(".apk", ".bprof")):
            if os.path.isfile(prof):
                os.remove(prof)

        print("- TouchWizHome_2017 patched and signed cleanly")
    finally:
        shutil.rmtree(temp_dir, ignore_errors=True)


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: patch_launcher.py <apk_path> <sec_dir>")
        sys.exit(1)
    patch_launcher(sys.argv[1], sys.argv[2])
