import os
import sys

work_dir = os.environ.get("WORK_DIR", "/home/arnav/UN1CA-4.0-M51/out/target/m51/work_dir")
default_target = f"{work_dir}/system/system/lib64/libmeminfo.so"
target = sys.argv[1] if len(sys.argv) > 1 else default_target

if not os.path.exists(target):
    print("Target file not found:", target)
    sys.exit(0)

with open(target, "r+b") as f:
    # 1. Patch ReadProcessGpuUsageKb at 0x14bc8
    f.seek(0x14bc8)
    patch_gpu = bytes.fromhex("420000b45f0000f9e0031f2ac0035fd6")
    f.write(patch_gpu)
    print("Patched ReadProcessGpuUsageKb at 0x14bc8")

    # 2. Patch ReadPerProcessGpuMem at 0x14044
    f.seek(0x14044)
    patch_perproc = bytes.fromhex("e0031f2ac0035fd6")
    f.write(patch_perproc)
    print("Patched ReadPerProcessGpuMem at 0x14044")

    # 3. Patch BpfMapRO abortOnMismatch at 0x18814
    f.seek(0x18814)
    patch_bpf = bytes.fromhex("c0035fd6")
    f.write(patch_bpf)
    print("Patched BpfMapRO::abortOnMismatch at 0x18814")

    # 4. Patch dmabuf abort at 0x207d4
    f.seek(0x207d4)
    patch_dmabuf = bytes.fromhex("faffff17f9ffff17")
    f.write(patch_dmabuf)
    print("Patched dmabuf abort at 0x207d4")

print("All patches applied successfully to", target)
