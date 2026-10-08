# Forensic_Analysis_Data_91_Versions — Piece 06/13
## Article A12: A12-12 — Forensic Analysis Data 91 Versions
**Piece:** 06 of 13  
**Generated:** 2026-10-08 22:14:32 UTC

---

# Version-by-Version Analysis: v1.0.77 — v1.0.91 (Anomalies, Kalman, BT 3D, 6-Algorithm)

## v1.0.77 — BUILD FAILURE ❌
- **Zip**: 45,741 bytes | **APK**: 0 bytes
- **MainActivity**: 779 | **HTML**: 605 | **build.sh**: 113 lines
- **Anomaly**: Complete build failure
- **Note**: build.sh 113 lines (vs 109 normal) — likely breaking change
- **Recovery**: v1.0.78 reverts build.sh to 109 lines

## v1.0.78 — Recovery ✅
- **Zip**: 300,864 | **APK**: 210,263
- **MainActivity**: 779 | **HTML**: 623 | **build.sh**: 113
- **HTML**: +18 lines (mesh status panel)

## v1.0.79 — Kalman Filter Integration ★ MAJOR
- **Zip**: 318,723 | **APK**: 210,263
- **MainActivity**: 1,005 (+226, +29%) | **HTML**: 626
- **New**: `PositionEKF.java` — Extended Kalman Filter for position
- **State**: [x, y, vx, vy] — 2D position + velocity
- **Process model**: Constant velocity (dt = 1s)
- **Measurement**: Wi-Fi trilateration + BLE RSSI + GPS
- **Covariance**: 4×4 matrix, initialized diagonal
- **BUG INTRODUCED**: Line 38 `x[2]=0; x[2]=0;` (should be `x[2]=0; x[3]=0;`) — vy never initialized
- **HTML**: EKF state visualization (covariance ellipse)

## v1.0.80 — BUILD FAILURE ❌
- **Zip**: 113,062 | **APK**: 0 bytes
- **MainActivity**: 1,005 | **HTML**: 626
- **Anomaly**: Build failure with Kalman code
- **Hypothesis**: EKF matrix operations exceed build memory/dex limit

## v1.0.81 — CORRUPT ZIP ❌
- **Zip**: 14,254 bytes | **APK**: 0 bytes
- **All files**: 0 lines
- **Classification**: Artifact corruption, not a real version

## v1.0.82 — PARTIAL BUILD ⚠️
- **Zip**: 156,369 | **APK**: 45,649 (20% normal)
- **MainActivity**: 1,007 | **HTML**: 0 (MISSING) | **build.sh**: 109
- **APK contents**: classes.dex + resources + Manifest only (no assets/)
- **Note**: build.sh reverted to 109 lines

## v1.0.83 — PARTIAL BUILD ⚠️
- **Zip**: 219,771 | **APK**: 45,649
- **MainActivity**: 1,007 | **HTML**: 0 (MISSING)
- **Same APK size as v1.0.82** — identical compiled code
- **Larger zip**: Extra libs/assets but no HTML

## v1.0.84 — FULL RECOVERY ✅
- **Zip**: 366,367 | **APK**: 222,551
- **MainActivity**: 1,009 | **HTML**: 658 | **build.sh**: 109
- **HTML recovered**: 658 lines (Kalman viz + mesh)
- **APK**: 222KB (normal range restored)

## v1.0.85 — Stabilization
- **Zip**: 362,990 | **APK**: 222,634
- **MainActivity**: 1,009 | **HTML**: 626
- **HTML**: -32 lines (cleanup)

## v1.0.86 — BT 3D Spatial ★ MAJOR MILESTONE (LARGEST JUMP)
- **Zip**: 387,253 | **APK**: 226,730
- **MainActivity**: 1,319 (+310, +31%) | **HTML**: 750 (+124, +20%)
- **New Features**:
  - **Bluetooth AoA/AoD** (Angle of Arrival/Departure)
  - `Bt3DPositioning.java` — 3D position from phase differences
  - Multi-antenna array support (4+ antennas)
  - Phase calibration routine
  - Elevation angle estimation
- **6-Algorithm Stack**:
  1. Trilateration (Wi-Fi/BLE RSSI)
  2. EKF (PositionEKF)
  3. Particle Filter (non-Gaussian)
  4. HMM (Hidden Markov Model for floor/room)
  5. RTT (Wi-Fi Round Trip Time / 802.11mc)
  6. BT 3D (Bluetooth Direction Finding)
- **Algorithm Selector**: Weighted fusion based on availability/accuracy
- **HTML**: 3D beacon visualization, algorithm indicator, elevation view

## v1.0.87 — Asset Expansion
- **Zip**: 609,023 (+57%) | **APK**: 226,730 (stable)
- **MainActivity**: 1,319 | **HTML**: 750
- **Cause**: Large assets added (3D models, textures, shaders)
- **Note**: APK unchanged — assets not packaged? Or compression?

## v1.0.90 — 6-Algorithm Stack Complete ★
- **Zip**: 837,717 | **APK**: 226,730
- **MainActivity**: 1,396 (+77, +6%) | **HTML**: 766
- **Refinements**:
  - Algorithm weights configurable via settings
  - Auto-switching: RTT preferred when available
  - Fallback chain: RTT → BT 3D → EKF → Particle → HMM → Trilateration
  - Confidence scoring per algorithm
- **HTML**: Algorithm confidence bars, source badges
- **Zip size**: 837KB (2× v1.0.86) — bundled assets/models

## v1.0.91 — Auto-Update & Polish ★ CURRENT
- **Zip**: 395,479 | **APK**: 230,826
- **MainActivity**: 1,416 (+20) | **HTML**: 770
- **New Features**:
  - **OTA Update Check**: GitHub Releases API, background download
  - **Crash Reporting**: UncaughtExceptionHandler → local log + optional upload
  - **Settings Persistence**: DataStore (proto) for preferences
  - **Battery Optimization**: Dynamic sensor/ble duty cycling
- **Bug Fixes**:
  - WebView cache clear on update
  - Mesh packet sequence wrap-around
  - GPS last-known location fallback
- **EKF Bug Status**: STILL PRESENT in v1.0.91 (fixed in v1.0.92)

## v1.0.91-dup — Duplicate Extraction
- **Identical to v1.0.91**: Same zip size (395,479), same line counts
- **Purpose**: Verification of extraction pipeline consistency

## Summary: v1.0.77 → v1.0.91

| Metric | v1.0.76 | v1.0.91 | Change |
|--------|---------|---------|--------|
| MainActivity | 718 | 1,416 | **+97%** |
| HTML | 587 | 770 | +31% |
| APK Size | 206KB | 230KB | +12% |
| Algorithms | 4 | **6** | +2 |
| Positioning | 2D | **2D + 3D (BT)** | Dimensional upgrade |
| Build Status | ✅ | ✅ | Recovered |

## Critical Findings in This Range

### 1. Anomaly Cluster (v1.0.77-83)
- 7 versions, 5 anomalous
- Root cause: Kalman integration (v1.0.79) + build.sh regression
- Recovery: v1.0.84 restores full pipeline

### 2. EKF Bug (v1.0.79 → v1.0.91)
- **Location**: `PositionEKF.java:38`
- **Code**: 
  ```java
  // BUGGY
  x[2] = 0;  // vx = 0
  x[2] = 0;  // vy = 0 (TYPO: should be x[3])
  ```
- **Impact**: vy (Y velocity) never initialized → filter diverges in Y
- **Fix**: v1.0.92 (pre-built APK exists)
- **Detection**: Forensic diff v1.0.91 → v1.0.92 shows single-line fix

### 3. BT 3D Spatial (v1.0.86)
- Largest single MainActivity jump: +310 lines
- New physics: Phase-based ranging, elevation estimation
- Requires hardware: Bluetooth 5.1+ with antenna array

### 4. Algorithm Fusion (v1.0.90)
- Weighted multi-algorithm fusion
- Production-ready algorithm selector
- Confidence-based weighting

### 5. Zip Size Explosion (v1.0.87, v1.0.90)
- v1.0.87: 609KB zip (assets)
- v1.0.90: 837KB zip (models/shaders)
- APK stable at 226KB — assets may be downloadable, not bundled

---