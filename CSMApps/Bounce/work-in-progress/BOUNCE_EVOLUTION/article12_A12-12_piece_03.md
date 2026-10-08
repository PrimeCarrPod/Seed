# Forensic_Analysis_Data_91_Versions — Piece 03/13
## Article A12: A12-12 — Forensic Analysis Data 91 Versions
**Piece:** 03 of 13  
**Generated:** 2026-10-08 22:14:32 UTC

---

# Code Growth Milestones: MainActivity & HTML Evolution

## MainActivity.java Line Count Evolution

| Version | Lines | Delta | Cumulative | Key Feature Added |
|---------|-------|-------|------------|-------------------|
| 1.0.0 | 160 | — | 160 | Foundation: Wi-Fi scan + WebView |
| 1.0.3 | 314 | +154 | 314 | **Real Wi-Fi scan implementation** |
| 1.0.10 | 422 | +108 | 422 | Permissions refactor |
| 1.0.18 | 591 | +169 | 591 | Sensor framework |
| 1.0.25 | 639 | +48 | 639 | **Sensor fusion (accel/gyro/mag)** |
| 1.0.35 | 649 | +10 | 649 | Kalman filter groundwork |
| 1.0.48 | 711 | +62 | 711 | **BLE scanning** |
| 1.0.65 | 732 | +21 | 732 | BT restart cycle fix |
| 1.0.79 | 779 | +47 | 779 | **Kalman filter (PositionEKF)** |
| 1.0.86 | 1,319 | +540 | 1,319 | **BT 3D Spatial + 6-algo stack** |
| 1.0.90 | 1,396 | +77 | 1,396 | **6-algorithm positioning** |
| 1.0.91 | 1,416 | +20 | 1,416 | Auto-update + current |

**Total Growth**: 160 → 1,416 lines = **785% increase** over 91 versions

## HTML (bounce.html) Line Count Evolution

| Version | Lines | Delta | Cumulative | Key Feature Added |
|---------|-------|-------|------------|-------------------|
| 1.0.0 | 303 | — | 303 | Basic Three.js scene |
| 1.0.3 | 331 | +28 | 331 | Beacon rendering |
| 1.0.10 | 393 | +62 | 393 | Trail visualization |
| 1.0.18 | 417 | +24 | 417 | Camera controls |
| 1.0.25 | 461 | +44 | 461 | Sensor data display |
| 1.0.48 | 505 | +44 | 505 | BLE beacon UI |
| 1.0.65 | 559 | +54 | 559 | BT status panel |
| 1.0.72 | 585 | +26 | 585 | Kalman visualization |
| 1.0.79 | 605 | +20 | 605 | EKF state display |
| 1.0.86 | 750 | +145 | 750 | **BT 3D Spatial viz** |
| 1.0.90 | 766 | +16 | 766 | 6-algo indicator |
| 1.0.91 | 770 | +4 | 770 | Update notification |

**Total Growth**: 303 → 770 lines = **154% increase** over 91 versions

## Growth Phase Analysis

### Phase 1: Foundation (v1.0.0 - v1.0.10)
- **MainActivity**: 160 → 422 lines (+262, +164%)
- **HTML**: 303 → 393 lines (+90, +30%)
- **Focus**: Core Android setup, Wi-Fi scanning, WebView bridge, permissions

### Phase 2: Sensor Fusion (v1.0.18 - v1.0.25)
- **MainActivity**: 591 → 639 lines (+48, +8%)
- **HTML**: 417 → 461 lines (+44, +11%)
- **Focus**: Accelerometer, gyroscope, magnetometer integration
- **Key commit**: v1.0.25 "Sensor fusion" - complementary filter implementation

### Phase 3: BLE Integration (v1.0.48)
- **MainActivity**: 649 → 711 lines (+62, +10%)
- **HTML**: 496 → 505 lines (+9, +2%)
- **Focus**: Bluetooth LE scanning, beacon parsing, RSSI filtering
- **Permissions**: Added BLUETOOTH_SCAN, BLUETOOTH_CONNECT (Android 12+)

### Phase 4: Kalman Filter (v1.0.79)
- **MainActivity**: 732 → 779 lines (+47, +6%)
- **HTML**: 559 → 605 lines (+46, +8%)
- **Focus**: PositionEKF class, state estimation, covariance tracking
- **Bug introduced**: EKF vy initialization (x[2]=0; x[2]=0; should be x[3]=0)

### Phase 5: BT 3D Spatial (v1.0.86) — Largest Single Jump
- **MainActivity**: 779 → 1,319 lines (**+540, +69%**) — largest delta in project
- **HTML**: 605 → 750 lines (+145, +24%)
- **Focus**: 
  - Bluetooth 3D positioning (AoA/AoD)
  - Spatial audio rendering
  - Multi-antenna array processing
  - 6-algorithm stack: Trilateration, EKF, Particle Filter, HMM, RTT, BT 3D

### Phase 6: 6-Algorithm Stack (v1.0.90)
- **MainActivity**: 1,319 → 1,396 lines (+77, +6%)
- **HTML**: 750 → 766 lines (+16, +2%)
- **Focus**: Algorithm selection, weighted fusion, auto-switching

### Phase 7: Polish & Auto-Update (v1.0.91)
- **MainActivity**: 1,396 → 1,416 lines (+20, +1%)
- **HTML**: 766 → 770 lines (+4, +1%)
- **Focus**: OTA update check, crash reporting, settings persistence

## Growth Rate Visualization

```
MainActivity Lines (log scale):
1.0.0   █ 160
1.0.10  ████ 422
1.0.25  █████ 639
1.0.48  ██████ 711
1.0.79  ███████ 779
1.0.86  ████████████████ 1319  ← MAJOR JUMP
1.0.90  █████████████████ 1396
1.0.91  ██████████████████ 1416

HTML Lines:
1.0.0   ███ 303
1.0.10  █████ 393
1.0.25  ██████ 461
1.0.48  ███████ 505
1.0.79  █████████ 605
1.0.86  ███████████████ 750  ← MAJOR JUMP
1.0.90  ████████████████ 766
1.0.91  █████████████████ 770
```

## Correlation Analysis

| Metric | MainActivity | HTML | Correlation |
|--------|--------------|------|-------------|
| Total growth | 785% | 154% | Low (different concerns) |
| v1.0.86 jump | +69% | +24% | Coupled (BT 3D needs viz) |
| v1.0.25 jump | +8% | +11% | Coupled (sensor data display) |
| Steady growth | v1.0.0-79 | v1.0.0-79 | Parallel feature addition |
| Acceleration | v1.0.80+ | v1.0.86+ | Android complexity > viz complexity |

## Code Density Metrics

| Version | MainActivity | HTML | Ratio (Java:HTML) |
|---------|--------------|------|-------------------|
| 1.0.0 | 160 | 303 | 0.53 |
| 1.0.25 | 639 | 461 | 1.39 |
| 1.0.48 | 711 | 505 | 1.41 |
| 1.0.79 | 779 | 605 | 1.29 |
| 1.0.86 | 1,319 | 750 | 1.76 |
| 1.0.91 | 1,416 | 770 | 1.84 |

**Trend**: Java code growing faster than HTML (positioning complexity > visualization complexity)

## Anomaly Impact on Growth Metrics

| Version | Expected Lines | Actual Lines | Deviation |
|---------|----------------|--------------|-----------|
| v1.0.77 | ~770 | 779 | Normal (pre-failure) |
| v1.0.78 | ~780 | 779 | Recovery |
| v1.0.79 | ~780 | 1,005 | +226 (Kalman + refactor) |
| v1.0.80 | ~1,000 | 1,005 | Normal (pre-failure) |
| v1.0.81 | N/A | 0 | Corrupt |
| v1.0.82 | ~1,000 | 1,007 | Partial |
| v1.0.83 | ~1,000 | 1,007 | Partial |
| v1.0.84 | ~1,010 | 1,009 | Full recovery |
| v1.0.86 | ~1,020 | 1,319 | +299 (BT 3D) |

---