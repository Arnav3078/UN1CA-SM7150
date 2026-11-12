#!/usr/bin/env python3
# Copyright (c) 2026 Arnav
# SPDX-License-Identifier: GPL-3.0-or-later

import sys
import os
import glob
import json
import time
import urllib.request
import urllib.error

def get_best_server():
    try:
        req = urllib.request.Request(
            "https://api.gofile.io/servers",
            headers={"User-Agent": "Mozilla/5.0"}
        )
        with urllib.request.urlopen(req, timeout=15) as resp:
            data = json.loads(resp.read().decode("utf-8"))
            if data.get("status") == "ok" and "servers" in data.get("data", {}):
                servers = data["data"]["servers"]
                if servers:
                    return servers[0]["name"]
    except Exception as e:
        print(f"[!] Warning: Could not fetch best server dynamically ({e}), falling back to store1", file=sys.stderr)
    return "store1"

def upload_file_curl(server, filepath, token=None, folder_id=None):
    import subprocess
    url = f"https://{server}.gofile.io/contents/uploadfile"
    cmd = ["curl", "-#", "-X", "POST", url, "-F", f"file=@{filepath}"]
    if token:
        cmd.extend(["-H", f"Authorization: Bearer {token}"])
    if folder_id:
        cmd.extend(["-F", f"folderId={folder_id}"])
    
    print(f"[*] Uploading {filepath} to {url} ...")
    start = time.time()
    try:
        proc = subprocess.run(cmd, stdout=subprocess.PIPE, stderr=subprocess.PIPE, text=True, check=True)
        elapsed = time.time() - start
        res_json = json.loads(proc.stdout)
        if res_json.get("status") == "ok":
            return res_json.get("data", {}), elapsed
        else:
            print(f"[!] GoFile API error: {proc.stdout}", file=sys.stderr)
            return None, elapsed
    except subprocess.CalledProcessError as e:
        print(f"[!] curl failed: {e.stderr}", file=sys.stderr)
        return None, 0
    except json.JSONDecodeError:
        print(f"[!] Non-JSON response from GoFile: {proc.stdout}", file=sys.stderr)
        return None, 0

def format_size(bytes_size):
    for unit in ['B', 'KB', 'MB', 'GB', 'TB']:
        if bytes_size < 1024.0:
            return f"{bytes_size:.2f} {unit}"
        bytes_size /= 1024.0
    return f"{bytes_size:.2f} PB"

def main():
    files_to_upload = []
    if len(sys.argv) > 1:
        for arg in sys.argv[1:]:
            files_to_upload.extend(glob.glob(arg))
    else:
        files_to_upload.extend(glob.glob("out/UN1CA*.zip"))
        files_to_upload.extend(glob.glob("out/*m51*.zip"))
        files_to_upload = list(dict.fromkeys(files_to_upload))

    if not files_to_upload:
        print("[!] No ROM zip files found to upload in 'out/'.", file=sys.stderr)
        sys.exit(1)

    token = os.environ.get("GOFILE_TOKEN") or None
    folder_id = os.environ.get("GOFILE_FOLDER_ID") or None

    server = get_best_server()
    print(f"[*] Target GoFile server: {server}")

    successful_uploads = []

    for filepath in files_to_upload:
        if not os.path.isfile(filepath):
            continue
        file_size = os.path.getsize(filepath)
        print(f"\n========================================================")
        print(f"[*] File: {os.path.basename(filepath)} ({format_size(file_size)})")
        print(f"========================================================")
        data, elapsed = upload_file_curl(server, filepath, token=token, folder_id=folder_id)
        if data:
            download_page = data.get("downloadPage", "")
            code = data.get("code", "")
            md5 = data.get("md5", "")
            speed = (file_size / (1024 * 1024)) / elapsed if elapsed > 0 else 0
            print(f"\n[+] Upload successful in {elapsed:.1f}s ({speed:.2f} MB/s)!")
            print(f"[+] Download Link: {download_page}")
            print(f"[+] MD5 Checksum: {md5}")
            successful_uploads.append({
                "filename": os.path.basename(filepath),
                "size": format_size(file_size),
                "download_page": download_page,
                "md5": md5
            })
        else:
            print(f"[!] Upload failed for {filepath}", file=sys.stderr)

    if not successful_uploads:
        print("[!] All uploads failed.", file=sys.stderr)
        sys.exit(1)

    # Output to GitHub Step Summary if running in Actions
    github_summary = os.environ.get("GITHUB_STEP_SUMMARY")
    if github_summary:
        with open(github_summary, "a", encoding="utf-8") as f:
            f.write("## 🚀 UN1CA ROM Build - GoFile Uploads\n\n")
            f.write("| File | Size | Download Link | MD5 |\n")
            f.write("| :--- | :--- | :--- | :--- |\n")
            for u in successful_uploads:
                f.write(f"| `{u['filename']}` | {u['size']} | [📥 Download from GoFile]({u['download_page']}) | `{u['md5']}` |\n")
            f.write("\n> *Note: Flash via TWRP recovery. Remember to backup your data first!*\n")

    # Output to GITHUB_OUTPUT
    github_output = os.environ.get("GITHUB_OUTPUT")
    if github_output:
        with open(github_output, "a", encoding="utf-8") as f:
            f.write(f"download_page={successful_uploads[0]['download_page']}\n")
            f.write(f"file_name={successful_uploads[0]['filename']}\n")

    print("\n[+] All uploads completed successfully!")

if __name__ == "__main__":
    main()
