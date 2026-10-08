# Working_Features_Versions_History — Piece 10/13
## Article A9: A9-09 — Working Features Versions History
**Piece:** 10 of 13  
**Generated:** 2026-10-08 15:28:33 UTC

---

# Code Growth Analysis & Forensic Metrics

## 10.1 MainActivity.java Line Count Evolution

| Version | Lines | Delta | Cumulative | Key Addition |
|---------|-------|-------|------------|--------------|
| v1.0.0 | 160 | — | 160 | Foundation |
| v1.0.3 | 314 | +154 | 314 | Wi-Fi scanning |
| v1.0.4 | 350 | +36 | 350 | GPS |
| v1.0.8 | 400 | +50 | 400 | Camera modes |
| v1.0.13 | 450 | +50 | 450 | Wi-Fi Direct |
| v1.0.20 | 500 | +50 | 500 | Broadcast |
| v1.0.22 | 530 | +30 | 530 | 4-slot rotation |
| v1.0.25 | 639 | +109 | 639 | Sensor fusion |
| v1.0.48 | 711 | +72 | 711 | BLE scanning |
| v1.0.49 | 720 | +9 | 720 | Trails |
| v1.0.63 | 750 | +30 | 750 | Wake lock |
| v1.0.64 | 760 | +10 | 760 | METAR |
| v1.0.65 | 770 | +10 | 770 | BLE restart fix |
| v1.0.79 | 779 | +9 | 779 | RSSI Kalman |
| v1.0.81 | 800 | +21 | 800 | Trilateration |
| v1.0.86 | 1,319 | +519 | 1,319 | BT 3D Spatial |
| v1.0.90 | 1,396 | +77 | 1,396 | 6-algo stack |
| v1.0.91 | 1,416 | +20 | 1,416 | Auto-update |

### Growth Pattern Analysis

**Phase 1: Foundation (v1.0.0–v1.0.12)** — ~20 lines/version
- Basic Android + WebView integration
- Three.js scene setup

**Phase 2: Radio Stack (v1.0.13–v1.0.27)** — ~15 lines/version
- Wi-Fi Direct, broadcast, sensor fusion
- **v1.0.25 outlier**: +109 lines (sensor fusion)

**Phase 3: BLE & Visualization (v1.0.48–v1.0.65)** — ~5 lines/version
- BLE scanning, trails, post-processing
- **v1.0.48 outlier**: +72 lines (BLE)
- **v1.0.50 outlier**: +250 lines in HTML (visualization)

**Phase 4: Algorithms (v1.0.79–v1.0.91)** — ~40 lines/version
- Kalman, trilateration, EKF, particle, HMM
- **v1.0.86 massive outlier**: +519 lines (BT 3D)

### Algorithm File Sizes (v1.0.91)

| File | Lines | Purpose |
|------|-------|---------|
| MainActivity.java | 1,416 | Main orchestration |
| RssiKalmanFilter.java | 64 | 1D Kalman per AP |
| Trilateration.java | 257 | Weighted LS + GDOP |
| PositionEKF.java | 302 | 2D CV EKF |
| ParticleFilter.java | 322 | SIR + GMM |
| ZoneHMM.java | 287 | Viterbi zone tracking |
| WifiRttRanging.java | 119 | RTT stub |
| **Total Algorithm Code** | **1,351** | **~49% of MainActivity** |

---

## 10.2 bounce.html Line Count Evolution

| Version | Lines | Delta | Key Addition |
|---------|-------|-------|--------------|
| v1.0.0 | 303 | — | Three.js scene, vehicle, orbit cam |
| v1.0.3 | 331 | +28 | SCAN panel |
| v1.0.4 | 340 | +9 | GPS display |
| v1.0.8 | 380 | +40 | POV/FLY camera |
| v1.0.13 | 410 | +30 | Wi-Fi Direct UI |
| v1.0.20 | 430 | +20 | Broadcast status |
| v1.0.22 | 440 | +10 | 4-slot display |
| v1.0.25 | 461 | +21 | Sensor fusion display |
| v1.0.48 | 505 | +44 | BLE scanner UI |
| v1.0.49 | 510 | +5 | Trail system |
| v1.0.50 | 560 | +50 | Post-proc, beacon physics |
| v1.0.62 | 590 | +30 | CatmullRom splines |
| v1.0.63 | 540 | -50 | Cleanup |
| v1.0.64 | 660 | +120 | METAR codes |
| v1.0.79 | 605 | -55 | Kalman viz |
| v1.0.86 | 750 | +145 | BT 3D, Theory mode, Charts |
| v1.0.90 | 766 | +16 | Algorithm viz |
| v1.0.91 | 770 | +4 | Update panel |

### HTML Growth Drivers

1. **v1.0.50** (+50): Post-processing pipeline + physics
2. **v1.0.64** (+120): METAR code tables (static data)
3. **v1.0.86** (+145): BT 3D + Theory mode + Chart.js
4. **Steady state**: v1.0.86–v1.0.91 only +20 lines (mature)

---

## 10.3 APK Size Forensic Analysis (91 Versions)

### Size Anomalies (Flagged)

| Version | ZIP Size | APK Size | Status | Root Cause |
|---------|----------|----------|--------|------------|
| v1.0.77 | 45,741 | 0 | BUILD FAILED | Missing HTML assets in ZIP |
| v1.0.80 | 113,062 | 0 | BUILD FAILED | Incomplete source extraction |
| v1.0.81 | 14,254 | 0 | BUILD FAILED | Minimal ZIP (corrupt?) |
| v1.0.82 | 156,369 | 45,649 | PARTIAL | No HTML in APK (aapt2 link failed) |
| v1.0.83 | 219,771 | 45,649 | PARTIAL | No HTML in APK |

### Normal APK Size Range
- **Typical**: 45,000–50,000 bytes (debug APK, no-Gradle)
- **Components**: classes.dex (~25KB), resources.arsc (~15KB), HTML assets (~5KB), META-INF (~2KB)

### Build Failure Pattern
- v1.0.77, 80, 81: **Zero-byte APK** — aapt2 link or d8 compilation failed
- v1.0.82, 83: **Partial APK** — Java compiled but HTML assets not packaged
- **Recovery**: v1.0.84+ normal builds resume

---

## 10.4 Diff Statistics (364 Diff Files)

### File-Level Change Frequency
| File | Versions Changed | Total Diff Lines | Avg Lines/Change |
|------|------------------|------------------|------------------|
| MainActivity.java | 89/91 | ~12,000 | ~135 |
| bounce.html | 76/91 | ~8,500 | ~112 |
| build.sh | 12/91 | ~400 | ~33 |
| AndroidManifest.xml | 8/91 | ~200 | ~25 |

### Largest Single Diffs
1. **v1.0.25 MainActivity**: +109 lines (sensor fusion)
2. **v1.0.48 MainActivity**: +72 lines (BLE)
3. **v1.0.86 MainActivity**: +519 lines (BT 3D Spatial)
4. **v1.0.50 bounce.html**: +250 lines (post-proc + physics)
5. **v1.0.64 bounce.html**: +120 lines (METAR tables)

---

## 10.5 Version Clustering (Development Phases)

| Cluster | Versions | Theme | Duration (est) |
|---------|----------|-------|----------------|
| Foundation | 1.0.0–1.0.12 | Core Android + Three.js | 2 months |
| Radio Stack | 1.0.13–1.0.27 | Wi-Fi Direct, sensors | 2 months |
| BLE & Viz | 1.0.48–1.0.65 | BLE, trails, post-proc | 3 months |
| Algorithms | 1.0.79–1.0.91 | Positioning algorithms | 2 months |

**Total**: ~9 months active development across 91 versions

---

*End of Piece 10 — Continue to Piece 11 for Limitations & Technical Debt*