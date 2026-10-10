# Android_Main_Features_Radio_Positioning — Piece 12/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 12 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## MINOR ERROR PATTERNS

### E027: Bluetooth Device Name Not Showing
- **Error:** `Bluetooth device name not showing`
- **Versions:** 1.0.48-1.0.85
- **Frequency:** Occasional
- **Root Cause:** ScanCallback missing name field
- **Solution:** Use `device.getName()` with null check
- **Time Lost:** Low

### E028: CatmullRomCurve3 Trail Jagged at Low Points
- **Error:** `CatmullRomCurve3 trail jagged at low points`
- **Versions:** 1.0.62-1.0.91
- **Frequency:** Few
- **Root Cause:** < 4 points for spline interpolation
- **Solution:** Minimum 4 points for CatmullRom (wait for more points)
- **Time Lost:** Low

### E029: UnrealBloomPass Too Bright on Mobile
- **Error:** `UnrealBloomPass too bright on mobile`
- **Versions:** 1.0.50-1.0.91
- **Frequency:** Mobile devices
- **Root Cause:** HDR bloom strength too high for mobile GPU
- **Solution:** Reduce strength to 0.5-0.8 on mobile (configurable via Android)
- **Time Lost:** Medium
- **Refinement:** RF016 — Auto-scale by GPU tier benchmark

### E030: Missing platforms/android-33/android.jar
- **Error:** `Missing platforms/android-33/android.jar`
- **Versions:** 1.0.0-1.0.91
- **Frequency:** Cloud environments
- **Root Cause:** SDK platform not installed
- **Solution:** `sdkmanager "platforms;android-33"`
- **Time Lost:** Critical
- **Note:** Required for compilation — always install first

---

## ANDROID FEATURE MATRIX — ALL 21 FEATURES

| # | Feature | First Ver | Last Ver | Key Class | Permissions |
|---|---------|-----------|----------|-----------|-------------|
| 1 | Wi-Fi Scanning | 1.0.3 | 1.0.91 | WifiManager | FINE_LOCATION, WIFI_STATE, NEARBY_WIFI |
| 2 | Wi-Fi Direct GO | 1.0.13 | 1.0.91 | WifiP2pManager | CHANGE_WIFI, ACCESS_WIFI |
| 3 | BLE Scanning | 1.0.48 | 1.0.91 | BluetoothLeScanner | BT_SCAN, BT_CONNECT |
| 4 | GPS Tracking | 1.0.4 | 1.0.91 | LocationManager | FINE/COARSE/BACKGROUND_LOC |
| 5 | Sensor Fusion | 1.0.25 | 1.0.91 | SensorManager | None |
| 6 | Wake Lock | 1.0.63 | 1.0.91 | PowerManager | WAKE_LOCK |
| 7 | WebView + JS Bridge | 1.0.0 | 1.0.91 | WebView | INTERNET |
| 8 | Auto-Update | 1.0.91 | 1.0.93 | GitHub API | INTERNET |
| 9 | Debug Keystore | 1.0.0 | 1.0.91 | keytool | None |
| 10 | No-Gradle Build | 1.0.0 | 1.0.91 | build.sh | None |
| 11 | RSSI Kalman | 1.0.79 | 1.0.91 | RssiKalmanFilter | None |
| 12 | Trilateration | 1.0.81 | 1.0.91 | Trilateration | None |
| 13 | EKF (2D CV) | 1.0.90 | 1.0.91 | PositionEKF | None |
| 14 | Particle Filter | 1.0.90 | 1.0.91 | ParticleFilter | None |
| 15 | Zone HMM | 1.0.90 | 1.0.91 | ZoneHMM | None |
| 16 | Wi-Fi RTT | 1.0.81 | 1.0.91 | WifiRttRanging | FINE_LOC, NEARBY_WIFI |
| 17 | BT 3D Spatial | 1.0.86 | 1.0.91 | MainActivity | BT_SCAN, BT_CONNECT |
| 18 | Trail Recording | 1.0.49 | 1.0.91 | MainActivity | FINE_LOC, WAKE_LOCK |
| 19 | FAA METAR | 1.0.64 | 1.0.91 | Static HTML | None |
| 20 | Runtime Permissions | 1.0.3 | 1.0.91 | MainActivity | All 15 |
| 21 | SSID Broadcast | 1.0.22 | 1.0.91 | WifiP2pManager | CHANGE_WIFI, CHANGE_NET |

---

## PIECE 12 SUMMARY
This piece covers the remaining minor error patterns (BT name null check, CatmullRom minimum points, bloom mobile tuning, platform android-33.jar) and provides the complete Android Feature Matrix (21 features with first/last version, key class, and permissions). The matrix shows the evolution from simple Wi-Fi scanning (v1.0.3) to the full 6-algorithm positioning stack (v1.0.90) with BT 3D spatial tracking.

**Next Piece (13):** Android Summary + Cross-References + Key Metrics