#!/usr/bin/env python3
import sys
import os

def patch_seapp_contexts(seapp_path):
    if not os.path.exists(seapp_path):
        print(f"[-] plat_seapp_contexts not found at {seapp_path}")
        return False

    with open(seapp_path, "rb") as f:
        content = f.read().decode("utf-8", errors="ignore")

    raw_lines = [l.strip() for l in content.replace("\r", "").split("\n") if l.strip() and not l.strip().startswith("#")]

    filtered_lines = []
    has_system_server = False
    for line in raw_lines:
        if line.startswith("isSystemServer="):
            if not has_system_server:
                filtered_lines.append("isSystemServer=true domain=system_server_startup")
                has_system_server = True
            continue

        # Filter out old MediaProvider rules
        if "com.android.providers.media.module" in line or "com.google.android.providers.media.module" in line:
            continue

        filtered_lines.append(line)

    if not has_system_server:
        filtered_lines.insert(0, "isSystemServer=true domain=system_server_startup")

    # Strict compliance: every rule with name= MUST have isPrivApp=true to satisfy:
    # if (!cur->isPrivApp && cur->name.str && (!cur->seinfo || !strcmp(cur->seinfo, "default")))
    media_rules = [
        "user=_app seinfo=platform isPrivApp=true name=com.google.android.providers.media.module domain=mediaprovider_app type=privapp_data_file levelFrom=all",
        "user=_app seinfo=platform isPrivApp=true name=com.google.android.providers.media.module:* domain=mediaprovider_app type=privapp_data_file levelFrom=all",
        "user=_app seinfo=media isPrivApp=true name=com.google.android.providers.media.module domain=mediaprovider_app type=privapp_data_file levelFrom=all",
        "user=_app seinfo=media isPrivApp=true name=com.google.android.providers.media.module:* domain=mediaprovider_app type=privapp_data_file levelFrom=all",
        "user=_app isPrivApp=true name=com.google.android.providers.media.module domain=mediaprovider_app type=privapp_data_file levelFrom=all",
        "user=_app isPrivApp=true name=com.google.android.providers.media.module:* domain=mediaprovider_app type=privapp_data_file levelFrom=all",

        "user=_app seinfo=platform isPrivApp=true name=com.android.providers.media.module domain=mediaprovider_app type=privapp_data_file levelFrom=all",
        "user=_app seinfo=platform isPrivApp=true name=com.android.providers.media.module:* domain=mediaprovider_app type=privapp_data_file levelFrom=all",
        "user=_app seinfo=media isPrivApp=true name=com.android.providers.media.module domain=mediaprovider_app type=privapp_data_file levelFrom=all",
        "user=_app seinfo=media isPrivApp=true name=com.android.providers.media.module:* domain=mediaprovider_app type=privapp_data_file levelFrom=all",
        "user=_app isPrivApp=true name=com.android.providers.media.module domain=mediaprovider_app type=privapp_data_file levelFrom=all",
        "user=_app isPrivApp=true name=com.android.providers.media.module:* domain=mediaprovider_app type=privapp_data_file levelFrom=all",
    ]

    filtered_lines.extend(media_rules)

    # Validate against android_seapp.c rules
    for idx, line in enumerate(filtered_lines, 1):
        cur = dict(t.split("=", 1) for t in line.split() if "=" in t)
        is_priv = (cur.get("isPrivApp") == "true")
        name = cur.get("name")
        seinfo = cur.get("seinfo")
        if not is_priv and name and (not seinfo or seinfo == "default"):
            print(f"[-] Validation error on line {idx}: {line}")
            return False

    final_content = "\n".join(filtered_lines) + "\n"
    with open(seapp_path, "wb") as f:
        f.write(final_content.encode("utf-8"))

    print(f"[+] Successfully patched {seapp_path} ({len(filtered_lines)} rules, pure UNIX LF, validated)")
    return True

if __name__ == "__main__":
    target = sys.argv[1] if len(sys.argv) > 1 else "/home/arnav/UN1CA-4.0-M51/out/target/m51/work_dir/system/system/etc/selinux/plat_seapp_contexts"
    patch_seapp_contexts(target)
