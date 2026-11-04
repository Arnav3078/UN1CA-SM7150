#!/usr/bin/env python3
import sys, os

xml_path = sys.argv[1] if len(sys.argv) > 1 else '/home/arnav/UN1CA-4.0-M51/out/target/m51/work_dir/system/system/etc/sysconfig/allowed-system-preload-apps.xml'
if not os.path.exists(xml_path):
    print('[-] File not found:', xml_path)
    sys.exit(0)

with open(xml_path, 'r', encoding='utf-8') as f:
    content = f.read()

if 'io.mesalabs.choidujour' not in content:
    content = content.replace('</config>', '    <allowed-system-preload package="io.mesalabs.choidujour"/>\n</config>')
    with open(xml_path, 'w', encoding='utf-8') as f:
        f.write(content)
    print('[+] Added io.mesalabs.choidujour to allowed-system-preload-apps.xml')
else:
    print('[*] io.mesalabs.choidujour is already in allowed-system-preload-apps.xml')
