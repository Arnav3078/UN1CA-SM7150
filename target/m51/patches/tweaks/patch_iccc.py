import sys, os, struct, subprocess

def get_vaddr_to_offset_fn(elf_bytes):
    is_64 = elf_bytes[4] == 2
    if is_64:
        e_phoff = struct.unpack('<Q', elf_bytes[32:40])[0]
        e_phentsize = struct.unpack('<H', elf_bytes[54:56])[0]
        e_phnum = struct.unpack('<H', elf_bytes[56:58])[0]
    else:
        e_phoff = struct.unpack('<I', elf_bytes[28:32])[0]
        e_phentsize = struct.unpack('<H', elf_bytes[42:44])[0]
        e_phnum = struct.unpack('<H', elf_bytes[44:46])[0]

    segments = []
    for i in range(e_phnum):
        off = e_phoff + i * e_phentsize
        if is_64:
            p_type, p_flags, p_offset, p_vaddr, p_paddr, p_filesz, p_memsz, p_align = struct.unpack('<IIQQQQQQ', elf_bytes[off:off+56])
        else:
            p_type, p_offset, p_vaddr, p_paddr, p_filesz, p_memsz, p_flags, p_align = struct.unpack('<IIIIIIII', elf_bytes[off:off+32])
        if p_type == 1:  # PT_LOAD
            segments.append((p_vaddr, p_vaddr + p_memsz, p_offset))

    def vaddr_to_offset(vaddr):
        for vstart, vend, foff in segments:
            if vstart <= vaddr < vend:
                return foff + (vaddr - vstart)
        return None

    return vaddr_to_offset

def patch_iccc_lib(lib_path):
    print(f"[*] Patching ICCC client: {lib_path}")
    if not os.path.exists(lib_path):
        print(f"[-] {lib_path} does not exist, skipping.")
        return False

    with open(lib_path, 'rb') as f:
        data = bytearray(f.read())

    is_64 = data[4] == 2
    vaddr_to_offset = get_vaddr_to_offset_fn(data)

    out = subprocess.check_output(['nm', '-D', lib_path]).decode()
    patched = 0
    for line in out.splitlines():
        parts = line.split()
        if len(parts) == 3 and parts[1] == 'T':
            vaddr = int(parts[0], 16)
            sym = parts[2]
            if 'TZ_ICCC' in sym:
                if is_64:
                    # AArch64: mov w0, #0; ret -> 0x52800000 0xd65f03c0
                    code = b'\x00\x00\x80\x52\xc0\x03\x5f\xd6'
                    off = vaddr_to_offset(vaddr)
                else:
                    # ARM Thumb-2: movs r0, #0; bx lr -> 0x2000 0x4770
                    code = b'\x00\x20\x70\x47'
                    off = vaddr_to_offset(vaddr & ~1)

                if off is not None:
                    data[off : off + len(code)] = code
                    print(f"  [+] Patched {sym} at file offset 0x{off:x} (vaddr 0x{vaddr:x})")
                    patched += 1
                else:
                    print(f"  [-] Failed to resolve file offset for {sym} (vaddr 0x{vaddr:x})")

    print(f"[+] Successfully neutralized {patched} ICCC functions in {lib_path}")
    with open(lib_path, 'wb') as f:
        f.write(data)
    return True

if __name__ == '__main__':
    for path in sys.argv[1:]:
        patch_iccc_lib(path)
