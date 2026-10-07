# WIP Bounce Log — Session 001
**Date:** 2026-08-22  
**Branch:** `session/bounce-versioning-august-2026`  
**Working Directory:** `CSM_WORK_IN_PROGRESS/BOUNCE.WIP/`  
**Source Repository:** `PrimeCarrPod/Seed` → `CSMApps/Bounce/`

---

## Session Objective
Absorb the most recent working version of Bounce (v1.0.91), analyze all source code, understand the complete feature set, create comprehensive feature documentation, and prepare for next feature request cycle.

---

## Source Material Analyzed

### Primary Source: `CarrPod_Bounce_v1.0.91.zip`
- **Size:** 395,479 bytes
- **Extracted to:** `CSM_WORK_IN_PROGRESS/BOUNCE.WIP/v1.0.91/`
- **Contents:** Complete Android APK source (no Gradle, manual aapt2 build)

### Repository Context (GitHub: PrimeCarrPod/Seed/CSMApps/Bounce)
- **Total Versions Available:** v1.0.1 through v1.0.91 (91 versions)
- **Additional Files:** `CarrPod_Bounce_v1.zip`, `CarrPod_Bounce_work-in-progress.zip`, `README.md`
- **Work-in-progress folder:** Contains intermediate development builds

---

## Architecture Overview

### Android Layer (MainActivity.java — 1,416 lines)
```
Package: com.carrpod.bounce
Min SDK: 24 (Android 7.0)
Target SDK: 33 (Android 13)
Version Code: 191
Version Name: 1.0.91
```

**Core Managers Initialized:**
| Manager | Purpose | Key APIs |
|---------|---------|----------|
| `WifiManager` | Wi-Fi scanning (SSID, BSSID, RSSI, frequency) | `startScan()`, `SCAN_RESULTS_AVAILABLE_ACTION` |
| `WifiP2pManager` | Wi-Fi Direct Group Owner broadcast | `createGroup()`, `removeGroup()`, `addLocalService()` |
| `BluetoothAdapter` + `BluetoothLeScanner` | BLE device discovery | `startScan(ScanCallback)`, `SCAN_MODE_LOW_LATENCY` |
| `LocationManager` | GPS tracking | `GPS_PROVIDER`, 1000ms/0.5m updates |
| `SensorManager` | Compass + accelerometer fusion | `TYPE_ACCELEROMETER`, `TYPE_MAGNETIC_FIELD`, `TYPE_GYROSCOPE`, `TYPE_STEP_DETECTOR` |
| `PowerManager` | Wake lock for background trail | `PARTIAL_WAKE_LOCK` |
| `WebView` + `JsBridge` | JS ↔ Android communication | `evaluateJavascript()`, `@JavascriptInterface` |

### Web Layer (bounce.html — ~2,200 lines)
```
Framework: Three.js r128 (embedded via local assets)
Post-Processing: EffectComposer + RenderPass + UnrealBloomPass + ShaderPass
Controls: OrbitControls (auto-rotate, damping)
Shaders: LuminosityHighPassShader, CopyShader
```

**3D Scene Graph:**
- **Tardigrade Sphere** — Central vehicle representation (2-lobe mesh, wireframe cage, torus ring, bearing arrow)
- **Vehicle Beacons** — Dynamic dots with spring physics (repulsion + attraction to home)
- **Static Nodes** — Simulated Wi-Fi APs (purple, additive blending)
- **Bluetooth 3D Nodes** — Spatial positioning with elevation lines
- **Trail Line** — CatmullRomCurve3 spline (max 2000 points, GPU-safe disposal)
- **Grid Floor** — 40×40 with N/S/E/W compass markers

### Build Pipeline (`build.sh` — 109 lines)
```
aapt2 compile → aapt2 link → asset injection → javac → d8 → zipalign → apksigner
```
- **Toolchain:** JDK 17, Android SDK Build Tools 33.0.1, Platform android-33
- **Output:** `out/Bounce-v1.0.91.apk` (~201 KB signed)
- **Keystore:** Auto-generated debug.keystore

---

## Feature Analysis by Category

### 1. 3D Visualization Engine
| Feature | Implementation | Status |
|---------|---------------|--------|
| Tardigrade Sphere | 2-lobe SphereGeometry + wireframe TorusGeometry + bearing arrow | ✅ Complete |
| Vehicle Beacons | SphereGeometry (0.5) + TorusGeometry (0.65) + CanvasTexture labels | ✅ Complete |
| Beacon Physics | Velocity + spring (home) + repulsion (other beacons), damping 0.88 | ✅ Complete |
| Grid Floor | LineBasicMaterial 40×40, colored compass roses (N=Blue, S=Red, E=Green, W=Red) | ✅ Complete |
| UnrealBloomPass | Strength 1.0, radius 0.4, threshold 0.8 | ✅ Complete |
| EffectComposer | RenderPass + UnrealBloomPass pipeline | ✅ Complete |
| ACES Tone Mapping | Available in HTML demo (commented in production) | ⚠️ Partial |

### 2. Camera System
| Mode | Description | Controls |
|------|-------------|----------|
| **Orbit** | Pinch-zoom, rotate, pan, auto-spin (0.3 speed) | OrbitControls |
| **FLY** | Spring-physics camera touring all waypoints (CatmullRom spline) | Auto-generated waypoints from all nodes |
| **POV** | Chase camera behind vehicle, adjustable offset (±10 units) | `btn-pov-less` / `btn-pov-more` |

### 3. HUD System (Tab-Tuck Panels)
**Left Side Panels:**
| Panel | Tab Label | Content |
|-------|-----------|---------|
| **BEACONS** | B E A C O N S | My Trajectory (heading, speed, altitude, GPS, plate, origin key, orientation), Scanner list |
| **SCAN** | S C A N | Live Wi-Fi access point list |
| **BT** | B T | Bluetooth device list (name, RSSI, distance) |

**Right Side Panels:**
| Panel | Tab Label | Content |
|-------|-----------|---------|
| **FORGE** | F O R G E | Controls, Legend, Wi-Fi Scanner |
| **Controls** | — | +VEHICLE, +FLEET, FLY, SPIN, SCATTER, BROADCAST, TRAIL, SAVE |
| **Legend** | — | Color guide + FAA METAR codes + Wind format |
| **Wi-Fi Scanner** | — | Real-time AP list with zone classification |

### 4. Radio Scanning
| Radio | Method | Interval | Data Yield |
|-------|--------|----------|------------|
| **Wi-Fi** | `WifiManager.startScan()` + BroadcastReceiver | 1000ms | SSID, BSSID, RSSI (dBm), frequency, estimated distance, zone (immediate/near/far), persistence, reliability |
| **Bluetooth LE** | `BluetoothLeScanner.startScan()` (LOW_LATENCY) | Continuous (5s restart cycle) | Device name, MAC, RSSI (dBm), filtered RSSI (Kalman), 3D position (x,y,z), brightness, trajectory |

### 5. Advanced Positioning Algorithms

#### Wi-Fi Triangulation Stack (6 Modules)
```
1. RssiKalmanFilter       — 1D Kalman filter for RSSI smoothing (q=0.005, r=25)
2. Trilateration          — Weighted least-squares multilateration (3+ APs), GDOP calculation
3. PositionEKF            — Extended Kalman Filter [x,y,vx,vy] constant velocity model
4. ParticleFilter         — SIR particle filter (200 particles), Gaussian Mixture likelihood
5. ZoneHMM                — Hidden Markov Model (IMMEDIATE/NEAR/FAR), Viterbi path
6. WifiRttRanging         — 802.11mc RTT stub (API 28+)
```

#### Bluetooth 3D Spatial Tracking
```
- Kalman filter per device for RSSI smoothing
- Distance estimation: log-distance model (n=2.5, RSSI@1m=-55dBm)
- 3D position from phone orientation (azimuth, pitch)
- Trajectory history (50 samples active, 100 global)
- Brightness decay (0.98) with re-energize on signal catch (1.5×)
- Theory Mode: renders all historical trajectories as ghost paths
```

### 6. SSID Broadcast System (Wi-Fi Direct)
```
Duty Cycle: 5.1s per slot (2.5s broadcast + 2.6s dead time)
Band: 5GHz (GROUP_OWNER_BAND_5GHZ)
Passphrase: "Bounce-2026"

Slot 0: {key}{license_plate}                    → A7KCarrPodNet
Slot 1: {key}TA{hdg}{spd}{fleet}{make}{color}G{gps} → A7KTA090CIV065G26717430
Slot 2: {key}HD{hdg}-{dir}-{spd}mph              → A7KHD090-NE-65mph
Slot 3: {key}{hdg}KT                             → A7K090KT

Methods (priority):
1. WifiP2pConfig.Builder (API 29+) — autonomous GO
2. Reflection setDeviceName() (legacy)
3. Bonjour DNS-SD service advertising (fallback)
```

### 7. Trail System
| Feature | Detail |
|---------|--------|
| Recording | Continuous GPS-based at frame rate |
| Rendering | CatmullRomCurve3 smooth spline, rebuilt every 5 frames |
| GPU Safety | `geometry.dispose()` + `material.dispose()` on rebuild |
| Point Cap | 2000 points (oldest shifted) |
| Auto-Save | Every 60s → `trail-{timestamp}.json` |
| Background | Wake lock keeps CPU alive with screen off |

### 8. FAA METAR Code Table
| Code | Meaning | Category |
|------|---------|----------|
| RA | Rain | Precipitation |
| SN | Snow | Precipitation |
| FG | Fog | Obscuration |
| TS | Thunderstorm | Hazard |
| BR | Mist | Obscuration |
| HZ | Haze | Obscuration |
| FZ | Freezing | Modifier |
| 09010KT | Wind 090° at 10 knots | Wind format |
| FEW/BKN/OVC/CLR | Cloud coverage | Sky condition |

### 9. Permissions (15 Total)
| Permission | Purpose | API Level |
|------------|---------|-----------|
| INTERNET | WebView content | All |
| ACCESS_WIFI_STATE | Wi-Fi scanning | All |
| CHANGE_WIFI_STATE | Wi-Fi Direct broadcast | All |
| ACCESS_FINE_LOCATION | GPS + legacy Wi-Fi scan | All |
| ACCESS_COARSE_LOCATION | Coarse GPS | All |
| ACCESS_BACKGROUND_LOCATION | Background GPS | 29+ |
| ACCESS_NETWORK_STATE | Network status | All |
| CHANGE_NETWORK_STATE | P2P operations | All |
| NEARBY_WIFI_DEVICES | Wi-Fi scan (API 33+) | 33+ |
| BLUETOOTH_SCAN | BLE scanning | 31+ |
| BLUETOOTH_CONNECT | BLE operations | 31+ |
| BLUETOOTH_ADVERTISE | BLE advertising | 31+ |
| BLUETOOTH (legacy) | BT access (≤API 30) | All |
| BLUETOOTH_ADMIN (legacy) | BT admin (≤API 30) | All |
| WAKE_LOCK | Background trail recording | All |

---

## Version Evolution Highlights (from README.md)

| Version | Key Change |
|---------|------------|
| v1.0.0 | Initial Bounce app |
| v1.0.14 | Wi-Fi Direct custom SSID (P2pConfig) |
| v1.0.20 | Duty-cycle SSID broadcast (5s ON, 2.5s OFF) |
| v1.0.22 | 4-slot broadcast + 3-digit originator key |
| v1.0.25 | Magnetometer + accelerometer sensor fusion |
| v1.0.27 | Real GPS mph (zero-fix when stationary) |
| v1.0.28 | POV zoomed out 5× |
| v1.0.30 | Real Wi-Fi scanner with dBm + distance |
| v1.0.35 | Removed simulated scanner, real data only |
| v1.0.38 | SCAN pullout panel above BEACONS |
| v1.0.48 | Bluetooth LE scanning (BT tab panel) |
| v1.0.49 | BT 3D dots, TRAIL button, SAVE export |
| v1.0.50 | BT pulse glow, POV zoom buttons, default plate |
| v1.0.54 | Trail decimation prevents crash (GPU fix) |
| v1.0.57 | Auto-save trail every 60s |
| v1.0.60 | Clean v1.0.55 base + all fixes via Python |
| v1.0.62 | CatmullRom smooth trail curves |
| v1.0.63 | Wake lock for background trail recording |
| v1.0.64 | FAA METAR code table + 4th broadcast slot |
| v1.0.87 | Bluetooth 3D Spatial + RSSI Theory mode |
| v1.0.91 | **Current** — Bluetooth 3D Spatial RSSI Tracking, Manual Update Button |

---

## Code Quality Observations

### Strengths
1. **No-Gradle Build** — Fast, transparent, reproducible (~4s build time)
2. **Modular Wi-Fi Stack** — 6 independent positioning algorithms (Kalman, Trilateration, EKF, Particle Filter, HMM, RTT)
3. **Bluetooth 3D Spatial** — Full 3D positioning with orientation fusion, trajectory history, theory mode
4. **GPU-Safe Rendering** — Proper geometry/material disposal prevents memory leaks
5. **Comprehensive Permissions** — Handles API level differences (29, 31, 33+)
6. **Auto-Update System** — Checks GitHub for latest version, in-app update flow

### Areas for Enhancement
1. **RTT Ranging** — Currently stubbed, not fully implemented
2. **AP Position Learning** — Initial positions are random, refined only via trilateration
3. **Particle Filter AP Params** — Hardcoded defaults, not learned from scan data
4. **EKF Velocity Bug** — Line 38: `x[2] = 0; x[2] = 0;` should be `x[3] = 0` for vy
5. **No Unit Tests** — All algorithms untested
6. **Single Activity** — All logic in MainActivity (1416 lines)

---

## Files Created This Session
```
CSM_WORK_IN_PROGRESS/BOUNCE.WIP/
├── WIP_Bounce_LOG_Session_001.md          (this file)
├── BOUNCE_ULTRA_MASTER_FEATURE_LIST.md    (comprehensive feature catalog)
├── CarrPod_Bounce_v1.0.91.zip             (original source)
└── v1.0.91/                               (extracted source)
    ├── build.sh
    ├── src/main/
    │   ├── AndroidManifest.xml
    │   ├── java/com/carrpod/bounce/
    │   │   ├── MainActivity.java
    │   │   └── wifi/*.java (6 modules)
    │   ├── assets/
    │   │   ├── bounce.html
    │   │   └── js/*.js (Three.js + post-processing)
    │   └── res/ (values, mipmap, drawable)
    ├── gen/ (generated R.java)
    ├── obj/ (compiled classes.dex, resources.zip)
    └── out/ (signed APK)
```

---

## Next Session Preparation
**Ready for feature request selection from:** `BOUNCE_ULTRA_MASTER_FEATURE_LIST.md`

**Suggested Priority Areas:**
1. RTT Ranging Implementation (complete WifiRttRanging)
2. AP Position Self-Calibration (learn AP positions from movement)
3. Particle Filter Parameter Learning (adaptive RSSI models)
4. EKF Bug Fix (vy initialization)
5. Unit Test Suite for positioning algorithms
6. Multi-Activity Architecture (separate scanning, UI, broadcast)
7. Background Service for continuous scanning
8. Mesh Network Protocol (vehicle-to-vehicle relay)
9. Hazard Reporting Integration (NOTAM-style)
10. Offline Map Caching

---

## Session Completion Checklist
- [x] Downloaded and extracted v1.0.91
- [x] Read all Java source files (MainActivity + 6 WiFi modules)
- [x] Read bounce.html (Three.js visualization)
- [x] Read build.sh (no-Gradle pipeline)
- [x] Read AndroidManifest.xml (permissions)
- [x] Analyzed GitHub repository for version history
- [x] Created WIP_Bounce_LOG_Session_001.md
- [ ] Create BOUNCE_ULTRA_MASTER_FEATURE_LIST.md
- [ ] Create BOUNCE_RESUME_SESSION log
- [ ] Zip, commit, push to GitHub
- [ ] Verify on GitHub