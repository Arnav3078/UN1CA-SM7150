import os
import sys
import json
import shutil
import xml.etree.ElementTree as ET


TYPE_TO_XML = {
    "bool": ("bools.xml", "resources"),
    "color": ("colors.xml", "resources"),
    "dimen": ("dimens.xml", "resources"),
    "id": ("ids.xml", "resources"),
    "integer": ("integers.xml", "resources"),
    "plurals": ("plurals.xml", "resources"),
    "string": ("strings.xml", "resources"),
    "style": ("styles.xml", "resources"),
}


def merge_values_xml(values_dir, xml_name, items):
    path = os.path.join(values_dir, xml_name)
    if os.path.isfile(path):
        tree = ET.parse(path)
        root = tree.getroot()
    else:
        root = ET.Element("resources")
        tree = ET.ElementTree(root)

    existing = set()
    by_name = {}
    for child in list(root):
        n = child.attrib.get("name")
        if n:
            existing.add(n)
            by_name[n] = child

    added = 0
    for snippet in items:
        el = ET.fromstring(snippet)
        name = el.attrib.get("name")
        if not name:
            continue
        if name == "config_enableAppLock" and name in by_name:
            by_name[name].text = "true"
            continue
        if name not in existing:
            root.append(el)
            existing.add(name)
            added += 1

    ET.indent(tree, space="    ")
    tree.write(path, encoding="utf-8", xml_declaration=True)
    return added


def patch_fwres(fwres_dir, payload_dir):
    res_src = os.path.join(payload_dir, "fwres", "res")
    res_dst = os.path.join(fwres_dir, "res")
    copied = 0
    for dp, _, fns in os.walk(res_src):
        for fn in fns:
            rel = os.path.relpath(os.path.join(dp, fn), res_src)
            target = os.path.join(res_dst, rel)
            os.makedirs(os.path.dirname(target), exist_ok=True)
            shutil.copy2(os.path.join(dp, fn), target)
            copied += 1

    values_path = os.path.join(payload_dir, "fwres", "values.json")
    with open(values_path, "r", encoding="utf-8") as f:
        values = json.load(f)

    values_dir = os.path.join(res_dst, "values")
    total_added = 0
    for res_type, items in values.items():
        if res_type not in TYPE_TO_XML or not items:
            continue
        xml_name, _ = TYPE_TO_XML[res_type]
        total_added += merge_values_xml(values_dir, xml_name, items)

    print(f"- Patched framework-res.apk: {copied} res files, {total_added} values entries")


if __name__ == "__main__":
    if len(sys.argv) < 3:
        print("Usage: patch_fwres.py <decoded_fwres_dir> <payload_dir>")
        sys.exit(1)
    patch_fwres(sys.argv[1], sys.argv[2])
