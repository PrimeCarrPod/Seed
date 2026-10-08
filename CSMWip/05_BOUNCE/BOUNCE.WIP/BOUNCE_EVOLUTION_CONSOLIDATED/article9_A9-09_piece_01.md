# Working_Features_Versions_History — Piece 01/13
## Article A9: A9-09 — Working Features Versions History
**Piece:** 01 of 13  
**Generated:** 2026-10-08 15:28:33 UTC

---

# BOUNCE Evolution: Working Features & Versions History — Executive Overview

## 1.1 Project Context & Forensic Foundation

The BOUNCE Evolution project represents a comprehensive forensic analysis of 91 consecutive Android application versions (v1.0.0 through v1.0.91), spanning approximately 18 months of iterative development. This analysis extracted, diffed, and cataloged every significant code change across four key files: `MainActivity.java` (growing from 160 to 1,416 lines), `bounce.html` (growing from 303 to 770 lines), `build.sh` (the no-Gradle build pipeline), and `AndroidManifest.xml` (managing 15 runtime permissions).

The forensic pipeline produced 364 diff files (91 versions × 4 key files), documented 5 critical APK size anomalies (versions 77, 80, 81, 82, 83), and identified a critical EKF vy initialization bug in `PositionEKF.java:38` that was fixed in v1.0.92.

## 1.2 Working Features Catalog: 30 Features Tracked

This section documents **30 working features** (WF001–WF030) organized into six categories:

| Category | Features | Count |
|----------|----------|-------|
| **Radio** | WF001–WF003, WF025 | 4 |
| **Positioning** | WF004, WF005, WF010–WF016, WF029, WF030 | 11 |
| **Visualization** | WF006–WF009, WF017, WF018, WF027 | 8 |
| **System/Build** | WF021–WF024, WF026 | 5 |
| **Reference** | WF020 | 1 |
| **Metrics** | WF028 | 1 |

## 1.3 Version Milestone Timeline

| Version | Date (approx) | MainActivity | HTML | Key Milestone |
|---------|---------------|--------------|------|---------------|
| v1.0.0 | Baseline | 160 | 303 | Foundation: basic Three.js scene, vehicle sphere |
| v1.0.3 | +Wi-Fi | 314 | 331 | Real Wi-Fi scanning with WifiManager |
| v1.0.4 | +GPS | 350+ | 340+ | GPS tracking with LocationManager |
| v1.0.8 | +Camera | 400+ | 380+ | Camera modes (Orbit/FLY/POV) |
| v1.0.13 | +Wi-Fi Direct | 450+ | 410+ | WifiP2pManager group owner mode |
| v1.0.20 | +Broadcast | 500+ | 430+ | Status feedback, 4-slot SSID rotation |
| v1.0.22 | +4-Slot | 530+ | 440+ | Duty-cycle broadcast rotation |
| v1.0.25 | +Sensor Fusion | 639 | 461 | Accel+Mag+Gyro fusion, low-pass filter |
| v1.0.48 | +BLE | 711 | 505 | BluetoothLeScanner with 5s restart cycle |
| v1.0.49 | +Trails | 720+ | 510+ | GPS trail system with CatmullRom splines |
| v1.0.63 | +Wake Lock | 750+ | 540+ | Background trail persistence |
| v1.0.64 | +METAR | 760+ | 560+ | FAA METAR codes in Slot 3 |
| v1.0.65 | +BT Restart | 770+ | 570+ | 5-second BLE scan death recovery |
| v1.0.79 | +Kalman | 779 | 605 | RSSI 1D Kalman filter per device |
| v1.0.81 | +Trilateration | 800+ | 620+ | Weighted least squares + GDOP |
| v1.0.86 | +BT 3D | 1,319 | 750 | Full 3D spatial tracking + Theory mode |
| v1.0.90 | +6-Algo | 1,396 | 766 | EKF, Particle Filter, Zone HMM, RTT stub |
| v1.0.91 | +Auto-Update | 1,416 | 770 | GitHub API auto-update system |

## 1.4 Enhancement Pattern Taxonomy

Analysis reveals four distinct enhancement patterns across the 91 versions:

1. **Incremental Hardening** (e.g., WF001 Wi-Fi: basic scan → real dBm → Kalman → 6-algo)
2. **Bug-Driven Fix Cycles** (e.g., WF002 BLE: scan death → 5s restart → 3D spatial + Kalman)
3. **Architectural Leaps** (e.g., WF010 BT 3D: single version added 500+ lines for full 3D stack)
4. **Platform Adaptation** (e.g., WF026 Permissions: API33 NEARBY_WIFI_DEVICES compliance)

## 1.5 Current Status Summary (v1.0.91)

- **28/30 features**: Complete and production-ready
- **1 feature**: Stub only (WF016 Wi-Fi RTT Ranging — P0-02 priority)
- **1 feature**: Partial (WF029 AP Position Estimation — needs self-calibration P0-03)
- **Critical bug fixed**: EKF vy init in v1.0.92 (pre-built APK available)
- **Total codebase**: ~2,186 lines (MainActivity + HTML), ~3,000 lines including algorithms

---

*End of Piece 01 — Continue to Piece 02 for Radio Features deep-dive*