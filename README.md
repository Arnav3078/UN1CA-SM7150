<h1 align="center">
  <img loading="lazy" src="readme-res/banner.png"/>
</h1>
<p align="center">
  <a href="https://github.com/Arnav3078/UN1CA-4.0-M51/blob/un1ca-5.0/LICENSE"><img loading="lazy" src="https://img.shields.io/github/license/Arnav3078/UN1CA-4.0-M51?style=for-the-badge&logo=github"/></a>
  <a href="https://github.com/Arnav3078/UN1CA-4.0-M51/commits/un1ca-5.0"><img loading="lazy" src="https://img.shields.io/github/last-commit/Arnav3078/UN1CA-4.0-M51/un1ca-5.0?style=for-the-badge"/></a>
  <a href="https://github.com/Arnav3078/UN1CA-4.0-M51/stargazers"><img loading="lazy" src="https://img.shields.io/github/stars/Arnav3078/UN1CA-4.0-M51?style=for-the-badge"/></a>
</p>
<p align="center"><b>UN1CA 5.0</b> — One UI 9 Custom Firmware for <b>Samsung Galaxy M51 (SM-M515F / m51)</b></p>

---

## 📱 About This Release
This repository delivers the official port sources, target device configurations, and rock-solid hardware stability patches for **UN1CA 5.0 (One UI 9.0)** ported from the **Samsung Galaxy S23** series, tailored specifically for the **Samsung Galaxy M51** (Qualcomm Snapdragon 730G / `sm7150`).

- **ROM Name / Version:** UN1CA 5.0 (`5.0.0-m51`)
- **One UI Version:** One UI 9.0 (Android 16 / SDK 36 Base)
- **Source Firmware:** Samsung Galaxy S23 (`SM-S911B` / `dm1q`)
- **Target Vendor:** Samsung Galaxy M51 (`SM-M515F` / `m51nsxx` / `M515FXXS6DXE4`)
- **Kernel:** LostPrime Kernel with KernelSU
- **Filesystem Type:** EROFS / ext4 support
- **Status:** Verified Stable Release (Zero Bootloop Architecture)

---

## 🛡️ Zero Bootloop & Stability Architecture

### 1. Capacitive Side Fingerprint & Biometrics
- **Sensor Mapping:** Configured specifically for M51's side capacitive sensor (`google_touch_side,settings=3,navi=1`).
- **Framework & Services Smali Patches:** Disabled ultrasonic UDFPS hooks (`mHasUltrasonicUdfps=false`, `mHasOpticalUdfps=false`, `mHasUdfps=false`) to eliminate fatal `system_server` crashes.
- **LockSettings Fix:** Prevents credential loop / bypass lockups on fresh installations.
- **Biometric Cache Cleaner:** Automatically purges stale `/data/vendor/biometrics` and user fpdata on flash to guarantee clean first boot.
- **JDM Face Unlock:** Full JDM HAL integration for fast, responsive facial recognition.

### 2. Camera & Multimedia
- **Full Quad-Camera Support:** Stock M51 `camera-feature.xml` and `media_profiles_vendor.xml` tuned for the 64MP Sony IMX682 sensor and Snapdragon 730G hardware video encoder (`c2.qti.avc.encoder`).
- **No Preview Freezes:** Safe FPS parameters for front and ultra-wide lenses.

### 3. Dynamic Partitions & Storage Layout
- **Exact Geometry:** Partition group `qti_dynamic_partitions` mapped strictly to M51's 8,053,063,680 byte super partition.
- **Pre-sized Partitions:** System, vendor, product, and odm cleanly sized to prevent `E1001` or `E2001` OTA update aborts.

### 4. Audio, RIL & Connectivity
- **Snapdragon 7150 Audio Policies:** Custom SoundAlive, in-game Dolby Atmos, and dual speaker / head-tracking audio routing.
- **Cellular & Dual-SIM:** Dual-SIM multisim configuration with stock RILD stack, VoLTE, and VoWiFi support.

### 5. Security & Stability Guards
- **AVB Disabled:** `TARGET_DISABLE_AVB_SIGNING=true` prevents vbmeta bootloops on custom recoveries.
- **RescueParty Bypass:** Prevents premature bootloader / recovery loop on first boot setup wizard.

---

## 🌟 Upstream & Credits
This project stands on the shoulders of giants. Full credit and appreciation go to:

### 👑 Project Leaders & Upstream Creators:
- **[Salvo Giangreco (@salvogiangri)](https://github.com/salvogiangri)**:
  - Original **Creator, Project Architect & Lead Developer of UN1CA**.
  - Architect of the UN1CA modular patch system, build system, and One UI porting ecosystem.
- **[Mehedi H Joy (@mehedihjoy0)](https://github.com/mehedihjoy0)**:
  - Maintainer of **[UN1CA-SM7150](https://github.com/mehedihjoy0/UN1CA-SM7150)**.
  - Initial Galaxy M51 (`target/m51`) bring-up, Snapdragon 7150 platform hardware adaptations, audio/camera blobs, and UN1CA sixteen tree.

### 🤝 Additional Contributions:
- **[kurtnettle](https://github.com/kurtnettle)** for the excellent LostPrime Kernel for SM7150 with KernelSU support.
- **[ShaDisNX255](https://github.com/ShaDisNX255)** for NcX ROM and invaluable community guidance.
- **[Arnav (@Arnav3078)](https://github.com/Arnav3078)** for UN1CA 5.0 One UI 9 M51 porting, side-sensor/face unlock fixes, OTA maintenance, and device trees.
- The entire UN1CA and Samsung porting community!

---

## 🌿 Repository Branches

| Branch | Description |
| :--- | :--- |
| **`un1ca-5.0`** | **Active branch** for UN1CA 5.0 (One UI 9.0) port from S23 for Galaxy M51. |
| **`oneui-8.5`** | Stable branch for UN1CA 4.0 (One UI 8.5) release. |
| **`un1ca-4.0`** | Release branch for UN1CA 4.0.0 milestone. |
| **`sixteen`** | Base UN1CA upstream branch tracking SM7150. |

---

## 🚀 Building UN1CA 5.0 for Galaxy M51

### 1. Initialize Build Environment
```bash
source buildenv.sh m51
```

### 2. Build the Flashable ROM Package
```bash
./scripts/build_m51_un1ca50.sh
```
Or build manually:
```bash
./scripts/internal/create_target_files_zip.sh out/m51_target_files.zip
./scripts/build_flashable_zip.sh out/m51_target_files.zip
```
Your flashable ROM package will be produced in the `out/` directory ready for flashing via TWRP / OrangeFox Recovery!

---

## 📜 Licensing
This project is licensed under the **GNU General Public License v3.0 (GPL-3.0)** - see the [LICENSE](LICENSE) file for details.
