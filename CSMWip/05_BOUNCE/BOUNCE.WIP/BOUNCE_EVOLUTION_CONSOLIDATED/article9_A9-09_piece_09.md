# Working_Features_Versions_History — Piece 09/13
## Article A9: A9-09 — Working Features Versions History
**Piece:** 09 of 13  
**Generated:** 2026-10-08 15:28:33 UTC

---

# Enhancement Timeline Analysis: Version-by-Version Deep Dive

## 9.1 Early Foundation (v1.0.0 – v1.0.12)

### v1.0.0 — Genesis
- **MainActivity**: 160 lines — Basic Activity + WebView setup
- **bounce.html**: 303 lines — Three.js scene, tardigrade sphere, orbit camera
- **build.sh**: 109 lines — Complete no-Gradle pipeline (aapt2, d8, zipalign, apksigner)
- **AndroidManifest.xml**: 15 permissions declared
- **Key innovation**: Zero-dependency build system; Three.js r128 local

### v1.0.1–v1.0.2 — Stabilization
- WebView settings: JavaScript, DOM storage, mixed content
- Debug keystore auto-generation
- Basic touch handling for camera controls

### v1.0.3 — Wi-Fi Scanning Arrives
- **MainActivity**: +154 lines (314 total)
- `WifiManager` integration with runtime permissions
- ScanResult → dBm extraction → JSON to HTML
- **bounce.html**: +28 lines (331 total) — SCAN panel live updates

### v1.0.4 — GPS Tracking
- **MainActivity**: +36 lines (350 total)
- `LocationManager.requestLocationUpdates()` with criteria
- GPS → local ENU coordinate conversion

### v1.0.8 — Camera Modes
- **bounce.html**: +80 lines (380 total)
- POV mode (first-person), FLY mode (free flight)
- `OrbitControls` integration

## 9.2 Radio Expansion (v1.0.13 – v1.0.27)

### v1.0.13 — Wi-Fi Direct Group Owner
- **MainActivity**: +50 lines (450 total)
- `WifiP2pManager` — persistent group creation
- Broadcast SSID for peer discovery

### v1.0.20 — Broadcast Status + Duty Cycle
- **MainActivity**: +50 lines (500 total)
- Periodic SSID broadcast with status feedback
- **bounce.html**: SCAN panel shows broadcast state

### v1.0.22 — 4-Slot SSID Rotation
- **MainActivity**: +30 lines (530 total)
- Rotating SSID: `BOUNCE_1`, `BOUNCE_2`, `BOUNCE_3`, `BOUNCE_4`
- Per-slot AES key derivation from master secret
- Timing: 10s per slot (40s cycle)

### v1.0.25 — Sensor Fusion Breakthrough
- **MainActivity**: +109 lines (639 total) — **largest single jump**
- **bounce.html**: +30 lines (461 total)
- Accelerometer + Magnetometer + Gyroscope fusion
- Complementary filter (α=0.98) for orientation
- Low-pass filter on accelerometer for gravity vector

### v1.0.27 — GPS Speed Threshold
- Ignore GPS updates when speed < 1 mph (stationary filter)
- Reduces GPS jitter in trails

## 9.3 BLE & Trail Era (v1.0.48 – v1.0.65)

### v1.0.48 — Bluetooth LE Scanning
- **MainActivity**: +72 lines (711 total)
- **bounce.html**: +44 lines (505 total)
- `BluetoothLeScanner` with `ScanCallback`
- **Critical**: Scan death bug identified (callbacks stop after ~60s)

### v1.0.49 — Trail System
- **bounce.html**: +80 lines (510 total)
- GPS trail as line strip
- Local ENU coordinate system

### v1.0.50 — Post-Processing + Beacon Physics
- **bounce.html**: +250 lines (560 total)
- Bloom, FXAA, tone mapping
- Beacon pulse animation + spring physics

### v1.0.54 — GPU Memory Leak Fix
- **Critical fix**: `BufferGeometry.dispose()` on trail point removal
- Prevented OOM on long sessions

### v1.0.62 — CatmullRom Splines
- **bounce.html**: +80 lines (590 total)
- Smooth trail curves via `THREE.CatmullRomCurve3`
- Centripetal parameterization (tension=0.5)

### v1.0.63 — Wake Lock
- **MainActivity**: +30 lines (750 total)
- `PARTIAL_WAKE_LOCK` for background trail recording
- Integrated with trail system lifecycle

### v1.0.64 — FAA METAR Codes
- **bounce.html**: +200 lines (660 total)
- Static METAR code tables embedded
- Slot 3 broadcast integration

### v1.0.65 — BLE Scan Death Fix
- **Critical fix**: 5-second scan restart cycle
- `Handler.postDelayed` restarts `BluetoothLeScanner`
- Eliminated scan death; enabled continuous BLE

## 9.4 Kalman & Algorithm Foundation (v1.0.79 – v1.0.85)

### v1.0.79 — RSSI Kalman Filter
- **MainActivity**: +10 lines (779 total)
- **RssiKalmanFilter.java**: 64 lines (new file)
- 1D Kalman per AP for RSSI smoothing
- **bounce.html**: +45 lines (605 total) — Kalman visualization

### v1.0.81 — Trilateration + RTT Stub
- **MainActivity**: +21 lines (800 total)
- **Trilateration.java**: 257 lines (new file)
- Weighted least squares + GDOP
- **WifiRttRanging.java**: 119 lines (stub)

### v1.0.82–v1.0.83 — Build Anomalies (Forensic Flagged)
- APK size anomalies: partial builds, no HTML assets
- Documented in forensic analysis

## 9.5 Major Architectural Leap: BT 3D Spatial (v1.0.86)

### v1.0.86 — Bluetooth 3D Spatial Tracking
- **MainActivity**: +540 lines (1,319 total) — **largest jump ever**
- **bounce.html**: +184 lines (750 total)
- **New algorithm files**: ~500 lines total

#### Features Added:
1. **Full 3D BT tracking**: Azimuth + elevation + distance from RSSI + orientation
2. **Beacon spheres in 3D**: Dynamic positions from algorithm output
3. **Trajectory visualization**: Particle trails in 3D space
4. **Theory Mode**: Algorithm visualization toggles (trilateration circles, EKF ellipse, particles, HMM zones)
5. **Chart.js metrics**: Action/Benevolence/Coherence/Glueball radar chart

#### Code Structure Added:
```
MainActivity.java additions:
- BT3DSpatialTracker class (az/el/dist from RSSI + orientation)
- Beacon3DManager (Three.js sphere sync)
- TheoryModeController (algorithm viz toggles)
- ChartMetricsComputer (4 metrics)

bounce.html additions:
- Beacon3D class (position, velocity, trail)
- TheoryModePanel (checkboxes for each algorithm)
- Chart.js radar chart integration
```

## 9.6 Six-Algorithm Stack (v1.0.90)

### v1.0.90 — Complete Algorithm Suite
- **MainActivity**: +77 lines (1,396 total)
- **bounce.html**: +16 lines (766 total)
- **New algorithm files**:
  - `PositionEKF.java`: 302 lines (2D CV EKF)
  - `ParticleFilter.java`: 322 lines (SIR + GMM)
  - `ZoneHMM.java`: 287 lines (Viterbi)

#### Algorithm Portfolio Complete:
| Algorithm | File | State | Measurement | Key Feature |
|-----------|------|-------|-------------|-------------|
| Trilateration | Trilateration.java | [x,y] | RSSI→dist | GDOP + AP refinement |
| EKF | PositionEKF.java | [x,y,vx,vy] | Trilateration | Constant velocity |
| Particle Filter | ParticleFilter.java | [x,y,vx,vy]×200 | RSSI likelihood | GMM multimodal |
| Zone HMM | ZoneHMM.java | [zone] | RSSI pattern | Viterbi path |
| RTT | WifiRttRanging.java | [x,y] | FTM distance | Stub only |
| RSSI Kalman | RssiKalmanFilter.java | [RSSI] | Raw RSSI | Per-AP smoothing |

### v1.0.91 — Auto-Update + Polish
- **MainActivity**: +20 lines (1,416 total)
- **bounce.html**: +4 lines (770 total)
- GitHub API auto-update check
- HUD Update panel
- **EKF vy bug discovered** (fixed in v1.0.92)

---

*End of Piece 09 — Continue to Piece 10 for Code Growth Analysis*