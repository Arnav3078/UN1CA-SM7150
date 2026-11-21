import os
import sys
import shutil
import zipfile
import subprocess
import tempfile

def patch_launcher(apk_path, launcher_smali_dir, sec_dir):
    if not os.path.isfile(apk_path):
        print('Error: ' + apk_path + ' not found')
        sys.exit(1)

    print('- Patching One UI Home Launcher for AppLock: ' + apk_path)
    temp_dir = tempfile.mkdtemp(prefix='launcher_patch_')
    try:
        classes1_dex = os.path.join(temp_dir, 'classes.dex')
        classes4_dex = os.path.join(temp_dir, 'classes4.dex')

        with zipfile.ZipFile(apk_path, 'r') as z:
            z.extract('classes.dex', temp_dir)
            z.extract('classes4.dex', temp_dir)

        # 1. Patch classes.dex (Rune.smali)
        smali1_dir = os.path.join(temp_dir, 'smali1')
        subprocess.check_call(['baksmali', 'd', classes1_dex, '-o', smali1_dir])
        rune_target = os.path.join(smali1_dir, 'com', 'honeyspace', 'common', 'Rune.smali')
        shutil.copy2(os.path.join(launcher_smali_dir, 'smali1', 'Rune.smali'), rune_target)
        subprocess.check_call(['smali', 'a', smali1_dir, '-o', classes1_dex])

        # 2. Patch classes4.dex (AppLock quickoption smali files)
        smali4_dir = os.path.join(temp_dir, 'smali4')
        subprocess.check_call(['baksmali', 'd', classes4_dex, '-o', smali4_dir])
        quickoption_dir = os.path.join(smali4_dir, 'com', 'honeyspace', 'ui', 'common', 'quickoption')
        os.makedirs(quickoption_dir, exist_ok=True)
        smali4_src = os.path.join(launcher_smali_dir, 'smali4')
        for f in os.listdir(smali4_src):
            shutil.copy2(os.path.join(smali4_src, f), os.path.join(quickoption_dir, f))
        subprocess.check_call(['smali', 'a', smali4_dir, '-o', classes4_dex])

        # 3. Update APK
        subprocess.check_call(['zip', '-j', '-u', apk_path, classes1_dex, classes4_dex])
        subprocess.call(['zip', '-d', apk_path, 'META-INF/*.SF', 'META-INF/*.RSA', 'META-INF/*.MF'], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)

        # 4. Zipalign
        aligned_apk = os.path.join(temp_dir, 'aligned.apk')
        subprocess.check_call(['zipalign', '-f', '-p', '4', apk_path, aligned_apk])

        # 5. Sign with platform key
        key_path = os.path.join(sec_dir, 'aosp_platform.pk8')
        cert_path = os.path.join(sec_dir, 'aosp_platform.x509.pem')
        subprocess.check_call([
            'apksigner', 'sign',
            '--key', key_path,
            '--cert', cert_path,
            aligned_apk
        ])

        # Move aligned & signed apk over original
        shutil.copy2(aligned_apk, apk_path)

        # Clean up idsig and any oat cache
        idsig = apk_path + '.idsig'
        if os.path.isfile(idsig):
            os.remove(idsig)
        oat_dir = os.path.join(os.path.dirname(apk_path), 'oat')
        if os.path.isdir(oat_dir):
            shutil.rmtree(oat_dir, ignore_errors=True)
        for prof in [apk_path.replace('.apk', '.prof'), apk_path.replace('.apk', '.bprof')]:
            if os.path.isfile(prof):
                os.remove(prof)

        print('- TouchWizHome_2017 patched and signed successfully')
    finally:
        shutil.rmtree(temp_dir, ignore_errors=True)

if __name__ == '__main__':
    if len(sys.argv) < 4:
        print('Usage: patch_launcher.py <apk_path> <launcher_smali_dir> <sec_dir>')
        sys.exit(1)
    patch_launcher(sys.argv[1], sys.argv[2], sys.argv[3])
