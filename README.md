<h1 align="center">
  <img loading="lazy" src="readme-res/banner.png"/>
</h1>
<p align="center">
  <a href="https://github.com/Arnav3078/UN1CA-SM7150/blob/un1ca-5.0/LICENSE"><img loading="lazy" src="https://img.shields.io/github/license/Arnav3078/UN1CA-SM7150?style=for-the-badge&amp;logo=github"/></a>
  <a href="https://github.com/Arnav3078/UN1CA-SM7150/commits/un1ca-5.0"><img loading="lazy" src="https://img.shields.io/github/last-commit/Arnav3078/UN1CA-SM7150/un1ca-5.0?style=for-the-badge"/></a>
  <a href="https://github.com/Arnav3078/UN1CA-SM7150/stargazers"><img loading="lazy" src="https://img.shields.io/github/stars/Arnav3078/UN1CA-SM7150?style=for-the-badge"/></a>
</p>
<p align="center"><b>UN1CA 5.2 (Mind Blowing)</b> — One UI 9.0 Custom Firmware for <b>Samsung Galaxy M51 (SM-M515F / m51)</b></p>

---

## 📱 About This Release
This repository delivers the official port source tree, target device configurations, and zero-bootloop stability architecture for **UN1CA 5.2 (One UI 9.0)** ported from the **Samsung Galaxy S23** series, tailored specifically for the **Samsung Galaxy M51** (Qualcomm Snapdragon 730G / `sm7150`).

- **ROM Name / Version:** UN1CA 5.2 (`5.2.0-m51`)
- **ROM Codename:** Mind Blowing
- **One UI Version:** One UI 9.0 (Android 17 / SDK 36 Base)
- **Source Firmware:** Samsung Galaxy S23 (`SM-S911B` / `dm1q`)
- **Target Vendor Base:** Samsung Galaxy M51 (`SM-M515F` / `m51nsxx` / `M515FXXS6DXE4`)
- **Kernel:** LostPrime Kernel with KernelSU (`4.14.357-openela-LostPrime`)
- **Filesystem Type:** EROFS / ext4 support
- **Status:** Stable Release (Zero Bootloop Architecture)

---

## 🛡️ Zero Bootloop & Stability Architecture

### 1. Authentic Samsung Platform Key Integrity
- **KnoxGuard & System Security:** Retains 100% authentic, stock Samsung-signed `KnoxGuard.apk` in `/system/priv-app/KnoxGuard/`. Completely prevents device lockouts (errors `3010`, `8135`, and `4099`) by preserving Samsung platform signature validation.
- **SystemUI Shared User UID 10053:** Authentic `SystemUI.apk` and precompiled `oat/arm64` libraries retained with official Samsung platform key, guaranteeing complete functionality of the Lock Screen, Notification Shade, Navigation Bar, and Quick Settings Panel without crashes.
- **Telecom & SDHMS:** Preserved platform signature on system telephony and health management services.

### 2. Multi-Dex DEX 041 OAT Container Architecture
- **Complete S23 services.jar:** Integrates the complete official multi-dex `services.jar` and its precompiled `services.odex`, `services.vdex`, and `services.art` container files, preventing missing bytecode crashes and bootloops while retaining native ART runtime execution speeds.

### 3. Graphics, Display & Snapdragon 730G Optimization
- **HWC 2.4 Composer Compatibility:** Custom binary patcher (`patch_composer.py`) prevents SurfaceFlinger aborts from unknown hardware composer commands.
- **BPF GPU Memory Tracking Fix:** Patched `libmeminfo.so` (`patch_libmeminfo.py`) to bypass unsupported Android 17 eBPF GPU memory maps on the 4.14 kernel.
- **Hardware UI Acceleration:** Configured `debug.hwui.renderer=skiagl` with full native blur, delivering butter-smooth 60 FPS UI animations on Snapdragon 730G.

### 4. Capacitive Side Fingerprint & Biometrics
- **Sensor Mapping:** Configured specifically for M51's side capacitive sensor (`google_touch_side,settings=3,navi=1`).
- **Framework & Services Smali Patches:** Disabled ultrasonic UDFPS hooks (`mHasUltrasonicUdfps=false`, `mHasOpticalUdfps=false`, `mHasUdfps=false`) to eliminate fatal `system_server` crashes.
- **Biometric Cache Cleaner:** Automatically purges stale `/data/vendor/biometrics` and user fpdata on flash to guarantee clean first boot.
- **JDM Face Unlock:** Full JDM HAL integration for fast, responsive facial recognition.

### 5. Camera & Multimedia
- **Full Quad-Camera Support:** Stock M51 `camera-feature.xml` tuned for the 64MP Sony IMX682 sensor, Ultra-Wide, Macro, and Depth cameras with Snapdragon 730G hardware video encoder (`c2.qti.avc.encoder`).
- **Live Preview & Modes:** Working Pro mode, Night mode, Live Focus / Portrait mode, Single Take, and Super Slow Motion.

### 6. Dynamic Partitions & Custom Recovery Protection
- **Exact Geometry:** Partition group `qti_dynamic_partitions` mapped strictly to M51's 8,053,063,680 byte super partition.
- **Custom Recovery Safe:** Never overwrites user's custom recovery (TWRP/OrangeFox).
- **AVB & dm-verity Disabled:** Pre-patched `vbmeta_samsung` and `vbmeta` ensure trouble-free booting on unlocked bootloaders.

---

## 🌟 Upstream & Full Credits
This project is made possible through the incredible work of the open-source and Samsung porting community:

### 👑 Project Leaders & Upstream Creators:
- **[Salvo Giangreco (@salvogiangri)](https://github.com/salvogiangri)**:
  - Original **Creator, Project Architect & Lead Developer of UN1CA**.
  - Architect of the UN1CA modular patch system, ROM installer, and porting framework.
- **[Mehedi H Joy (@mehedihjoy0)](https://github.com/mehedihjoy0)**:
  - Maintainer of **[UN1CA-SM7150](https://github.com/mehedihjoy0/UN1CA-SM7150)**.
  - Initial Galaxy M51 (`target/m51`) bring-up, Snapdragon 7150 platform hardware adaptations, audio/camera blobs, and the UN1CA sixteen tree.

### 🤝 Core Contributors & Maintainers:
- **[Arnav Sharma (@Arnav3078)](https://github.com/Arnav3078)**:
  - UN1CA 5.0 One UI 9.0 Lead Porter for Samsung Galaxy M51 (SM-M515F).
  - Galaxy S23 base adaptation, side capacitive fingerprint & face unlock integration, zero-bootloop stability architecture, KnoxGuard platform signature preservation, DEX 041 MultiDex OAT container reconstruction, and release maintenance.
- **[kurtnettle](https://github.com/kurtnettle)**:
  - Developer and maintainer of the **LostPrime Kernel** for SM7150 with KernelSU support.
- **[ShaDisNX255](https://github.com/ShaDisNX255)**:
  - Creator of NcX ROM and invaluable porting guidance.
- **Samsung Electronics**:
  - One UI 9.0 firmware, framework, and hardware drivers.
- **The Android Open Source Project (AOSP)**:
  - Core Android operating system base.
- **The Entire UN1CA Community**:
  - For testing, bug reports, feedback, and continuous support!

---

## 🌿 Repository Branches

| Branch | Description |
| :--- | :--- |
| **`un1ca-5.0`** | **Active branch** for UN1CA 5.0 (One UI 9.0) port from S23 for Galaxy M51. |
| **`oneui-9.0`** | Alias tracking UN1CA 5.0 One UI 9.0 release. |
| **`oneui-8.5`** | Stable branch for UN1CA 4.0 (One UI 8.5) release. |
| **`un1ca-4.0`** | Release branch for UN1CA 4.0.0 milestone. |
| **`sixteen`** | Base UN1CA upstream branch tracking SM7150. |

---

## 🚀 Building UN1CA 5.0 for Galaxy M51

### 1. Prerequisites (Ubuntu / Debian / WSL2)
```bash
sudo apt update && sudo apt install -y \
    git curl wget python3 python3-pip zip unzip openjdk-17-jdk \
    build-essential libxml2-utils erofs-utils p7zip-full
```

### 2. Initialize Build Environment
```bash
source buildenv.sh m51
```

### 3. Build the Flashable ROM Package
```bash
./scripts/build_m51_un1ca50.sh
```
Or build target files and package manually:
```bash
./scripts/internal/create_target_files_zip.sh out/m51_target_files.zip
./scripts/build_flashable_zip.sh out/m51_target_files.zip
```
The flashable ROM package will be generated in `out/` ready for flashing via TWRP / OrangeFox Recovery!

---

## 📜 Licensing
This project is licensed under the **GNU General Public License v3.0 (GPL-3.0)** - see the [LICENSE](LICENSE) file for details.
