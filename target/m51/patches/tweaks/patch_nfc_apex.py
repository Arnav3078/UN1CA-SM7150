#!/usr/bin/env python3
import os
import sys
import shutil
import zipfile
import subprocess

def update_zip_entry(zip_path, entry_name, new_data, compress_type=zipfile.ZIP_STORED):
    temp_zip = zip_path + ".tmp"
    with zipfile.ZipFile(zip_path, "r") as zin:
        with zipfile.ZipFile(temp_zip, "w") as zout:
            for item in zin.infolist():
                if item.filename != entry_name:
                    zout.writestr(item, zin.read(item.filename))
            zout.writestr(entry_name, new_data, compress_type=compress_type)
    os.replace(temp_zip, zip_path)

def patch_nfc_capex(capex_path):
    if not os.path.isfile(capex_path):
        print(f"Error: {capex_path} does not exist", file=sys.stderr)
        return False

    work = "/tmp/patch_nfc_apex_work"
    shutil.rmtree(work, ignore_errors=True)
    os.makedirs(work, exist_ok=True)

    print(f"Patching NFC apex: {capex_path}")
    
    # 1. Extract original_apex from capex
    with open(f"{work}/original_apex", "wb") as f:
        subprocess.run(["unzip", "-p", capex_path, "original_apex"], stdout=f, check=True)

    # 2. Extract apex_payload.img from original_apex
    with open(f"{work}/apex_payload.img", "wb") as f:
        subprocess.run(["unzip", "-p", f"{work}/original_apex", "apex_payload.img"], stdout=f, check=True)

    # 3. Extract apex_payload.img contents with 7z
    os.makedirs(f"{work}/payload_files", exist_ok=True)
    subprocess.run(["7z", "x", f"{work}/apex_payload.img", f"-o{work}/payload_files", "-y"],
                   stdout=subprocess.DEVNULL, check=True)
    if os.path.exists(f"{work}/payload_files/lost+found"):
        shutil.rmtree(f"{work}/payload_files/lost+found")

    # 4. Find NfcNciApex.apk
    apk_path = None
    for root, dirs, files in os.walk(f"{work}/payload_files/priv-app"):
        for f in files:
            if f == "NfcNciApex.apk":
                apk_path = os.path.join(root, f)
                break
    if not apk_path:
        print("Error: NfcNciApex.apk not found in payload", file=sys.stderr)
        return False

    print(f"Found NfcNciApex.apk at {apk_path}")

    # 5. Extract classes.dex and baksmali
    with open(f"{work}/classes.dex", "wb") as f:
        subprocess.run(["unzip", "-p", apk_path, "classes.dex"], stdout=f, check=True)
    subprocess.run(["baksmali", "d", f"{work}/classes.dex", "-o", f"{work}/smali"], check=True)

    # 6. Patch DeviceConfigFacade.smali
    dcf = f"{work}/smali/com/android/nfc/DeviceConfigFacade.smali"
    with open(dcf, "r", encoding="utf-8") as f:
        code_dcf = f.read()

    target_dcf = """.method public getNfcDefaultState()Z
    .registers 1

    .line 237
    iget-boolean p0, p0, Lcom/android/nfc/DeviceConfigFacade;->mNfcDefaultState:Z

    return p0
.end method"""

    replacement_dcf = """.method public getNfcDefaultState()Z
    .registers 1

    const/4 v0, 0x0

    return v0
.end method"""

    if target_dcf not in code_dcf:
        idx = code_dcf.find(".method public getNfcDefaultState()Z")
        if idx != -1:
            end_idx = code_dcf.find(".end method", idx) + len(".end method")
            code_dcf = code_dcf[:idx] + replacement_dcf + code_dcf[end_idx:]
        else:
            print("Error: getNfcDefaultState()Z not found", file=sys.stderr)
            return False
    else:
        code_dcf = code_dcf.replace(target_dcf, replacement_dcf)

    with open(dcf, "w", encoding="utf-8") as f:
        f.write(code_dcf)
    print("Patched DeviceConfigFacade.smali (NFC default state -> false)")

    # 7. Patch NfcService.smali for DE storage context
    nfc_svc = f"{work}/smali/com/android/nfc/NfcService.smali"
    with open(nfc_svc, "r", encoding="utf-8") as f:
        code_svc = f.read()

    target_svc = """    iget-object p1, p0, Lcom/android/nfc/NfcService;->mContext:Landroid/content/Context;

    const-string v7, "NfcServicePrefs"

    invoke-virtual {p1, v7, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;"""

    replacement_svc = """    iget-object p1, p0, Lcom/android/nfc/NfcService;->mContext:Landroid/content/Context;

    invoke-virtual {p1}, Landroid/content/Context;->createDeviceProtectedStorageContext()Landroid/content/Context;

    move-result-object p1

    const-string v7, "NfcServicePrefs"

    invoke-virtual {p1, v7, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;"""

    if target_svc in code_svc:
        code_svc = code_svc.replace(target_svc, replacement_svc)
        with open(nfc_svc, "w", encoding="utf-8") as f:
            f.write(code_svc)
        print("Patched NfcService.smali (NfcServicePrefs -> DE storage context)")
    else:
        print("Notice: target_svc already patched or different signature")

    # 8. Reassemble classes.dex with smali
    subprocess.run(["smali", "a", f"{work}/smali", "-o", f"{work}/classes.dex"], check=True)
    print("Reassembled classes.dex successfully")

    # 9. Update classes.dex in NfcNciApex.apk using update_zip_entry
    with open(f"{work}/classes.dex", "rb") as f:
        new_dex = f.read()
    update_zip_entry(apk_path, "classes.dex", new_dex, compress_type=zipfile.ZIP_STORED)
    print("Updated NfcNciApex.apk with new classes.dex")

    # 10. Rebuild apex_payload.img with mke2fs -F
    os.remove(f"{work}/apex_payload.img")
    subprocess.run(["mke2fs", "-F", "-t", "ext4", "-b", "4096", "-O", "^has_journal", f"{work}/apex_payload.img", "3000"],
                   check=True)
    subprocess.run(["e2fsdroid", "-e", "-f", f"{work}/payload_files", "-a", "/", f"{work}/apex_payload.img"],
                   check=True)
    print("Rebuilt apex_payload.img successfully")

    # 11. Update apex_payload.img inside original_apex using update_zip_entry
    with open(f"{work}/apex_payload.img", "rb") as f:
        new_payload = f.read()
    update_zip_entry(f"{work}/original_apex", "apex_payload.img", new_payload, compress_type=zipfile.ZIP_STORED)

    # 12. Update original_apex inside capex using update_zip_entry
    with open(f"{work}/original_apex", "rb") as f:
        new_orig = f.read()
    update_zip_entry(capex_path, "original_apex", new_orig, compress_type=zipfile.ZIP_STORED)
    print(f"Successfully patched and repacked {capex_path}!")

    shutil.rmtree(work, ignore_errors=True)
    return True

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: patch_nfc_apex.py <path_to_com.android.nfcservices.capex>")
        sys.exit(1)
    success = patch_nfc_capex(sys.argv[1])
    sys.exit(0 if success else 1)
