# BOUNCE ULTRA MASTER FEATURE LIST
**Version:** 1.0.92 (Current Working Version)  
**Date:** 2026-08-22  
**Source:** PrimeCarrPod/Seed → CSMApps/Bounce/  
**Branch:** session/bounce-versioning-august-2026

---

## FEATURE INDEX

### A. CORE ARCHITECTURE
| ID | Feature | Status | Priority | Effort | Dependencies |
|----|---------|--------|----------|--------|--------------|
| A01 | No-Gradle aapt2 Build Pipeline | ✅ Complete | — | — | JDK17, Android SDK 33 |
| A02 | Single Activity Architecture (MainActivity) | ✅ Complete | — | — | — |
| A03 | WebView + JsBridge (Android↔JS) | ✅ Complete | — | — | WebView, @JavascriptInterface |
| A04 | Auto-Update System (GitHub version check) | ✅ Complete | — | — | INTERNET permission |
| A05 | Debug Keystore Auto-Generation | ✅ Complete | — | — | keytool |

### B. 3D VISUALIZATION ENGINE (Three.js)
| ID | Feature | Status | Priority | Effort | Dependencies |
|----|---------|--------|----------|--------|--------------|
| B01 | Three.js r128 Core | ✅ Complete | — | — | Local assets/js/three.min.js |
| B02 | EffectComposer Pipeline | ✅ Complete | — | — | RenderPass, ShaderPass, EffectComposer |
| B03 | UnrealBloomPass (HDR Glow) | ✅ Complete | — | — | LuminosityHighPassShader, CopyShader |
| B04 | OrbitControls (Camera) | ✅ Complete | — | — | Auto-rotate, damping, zoom/pan |
| B05 | Tardigrade Sphere (Vehicle Avatar) | ✅ Complete | — | — | 2-lobe mesh, wireframe cage, torus ring, bearing arrow |
| B06 | Vehicle Beacons (Dynamic Dots) | ✅ Complete | — | — | SphereGeometry + TorusGeometry + CanvasTexture labels |
| B07 | Beacon Spring Physics | ✅ Complete | — | — | Repulsion + home attraction, damping 0.88 |
| B08 | Static Node Field (Wi-Fi APs) | ✅ Complete | — | — | Purple additive blending dots |
| B09 | Grid Floor + Compass Rose | ✅ Complete | — | — | 40×40 grid, N/S/E/W colored markers |
| B10 | Trail Line (CatmullRomCurve3) | ✅ Complete | — | — | Smooth spline, 2000pt cap, GPU-safe disposal |
| B11 | Bluetooth 3D Spatial Nodes | ✅ Complete | — | — | x,y,z from orientation, elevation lines, brightness |
| B12 | Theory Mode (Ghost Trajectories) | ✅ Complete | — | — | Renders all historical BT trajectories |

### C. CAMERA SYSTEM
| ID | Feature | Status | Priority | Effort | Dependencies |
|----|---------|--------|----------|--------|--------------|
| C01 | Orbit Mode (Default) | ✅ Complete | — | — | OrbitControls |
| C02 | FLY Mode (Spring Physics Tour) | ✅ Complete | — | — | CatmullRom waypoints, spring camera |
| C03 | POV Mode (Chase Camera) | ✅ Complete | — | — | Adjustable offset (+/-10 units) |
| C04 | Camera Auto-Spin Toggle | ✅ Complete | — | — | Auto-rotate on/off |

### D. HUD SYSTEM (Tab-Tuck Panels)
| ID | Feature | Status | Priority | Effort | Dependencies |
|----|---------|--------|----------|--------|--------------|
| D01 | Left Panel: BEACONS | ✅ Complete | — | — | My Trajectory + Scanner list |
| D02 | Left Panel: SCAN (Pullout) | ✅ Complete | — | — | Live Wi-Fi AP list |
| D03 | Left Panel: BT (Pullout) | ✅ Complete | — | — | Bluetooth device list |
| D04 | Right Panel: FORGE | ✅ Complete | — | — | Controls + Legend + Wi-Fi Scanner |
| D05 | Control Buttons | ✅ Complete | — | — | +VEHICLE, +FLEET, FLY, SPIN, SCATTER, BROADCAST, TRAIL, SAVE |
| D06 | Legend Panel | ✅ Complete | — | — | Color guide + FAA METAR codes + Wind format |
| D07 | Wi-Fi Scanner Panel | ✅ Complete | — | — | Real-time AP list with zones |
| D08 | Tab Animation (CSS transform) | ✅ Complete | — | — | 0.4s cubic-bezier |
| D09 | Broadcast Status Bar | ✅ Complete | — | — | Shows current TX SSID |
| D10 | Update Notification Panel | ✅ Complete | — | — | CHECK UPDATE button + version display |

### E. RADIO SCANNING
| ID | Feature | Status | Priority | Effort | Dependencies |
|----|---------|--------|----------|--------|--------------|
| E01 | Wi-Fi Scanning (WifiManager) | ✅ Complete | — | — | ACCESS_FINE_LOCATION, NEARBY_WIFI_DEVICES |
| E02 | Bluetooth LE Scanning | ✅ Complete | — | — | BLUETOOTH_SCAN, BLUETOOTH_CONNECT |
| E03 | Scan Interval: Wi-Fi 1000ms | ✅ Complete | — | — | Handler postDelayed |
| E04 | Scan Interval: BT Continuous | ✅ Complete | — | — | LOW_LATENCY, 5s restart cycle |
| E05 | RSSI → Distance Conversion | ✅ Complete | — | — | Log-distance model (n=2.8, RSSI@1m=-40) |
| E06 | Zone Classification (Immediate/Near/Far) | ✅ Complete | — | — | Thresholds: <2m, <10m, ≥10m |
| E07 | Persistence Tracking (seconds seen) | ✅ Complete | — | — | ssidLog HashMap |
| E08 | Reliability Flag (RSSI delta <15dB) | ✅ Complete | — | — | ssidRssiHistory HashMap |

### F. ADVANCED POSITIONING ALGORITHMS (Wi-Fi)
| ID | Feature | Module | Status | Priority | Effort | Dependencies |
|----|---------|--------|--------|----------|--------|--------------|
| F01 | RssiKalmanFilter (1D) | RssiKalmanFilter.java | ✅ Complete | — | — | q=0.005, r=25 |
| F02 | Trilateration (Weighted LS) | Trilateration.java | ✅ Complete | — | — | 3+ APs with known positions |
| F03 | PositionEKF (2D CV Model) | PositionEKF.java | ✅ Complete | ⚠️ Bug | Medium | EKF state [x,y,vx,vy] |
| F04 | ParticleFilter (SIR, 200 particles) | ParticleFilter.java | ✅ Complete | — | High | Gaussian Mixture likelihood |
| F05 | ZoneHMM (Viterbi) | ZoneHMM.java | ✅ Complete | — | — | 3 states, hysteresis transitions |
| F06 | WifiRttRanging (802.11mc) | WifiRttRanging.java | ⚠️ Stub | High | High | API 28+, WifiRttManager |
| F07 | AP Position Estimation | MainActivity.java | ⚠️ Partial | High | High | Random initial, refined by trilateration |
| F08 | Per-BSSID Kalman Filters | MainActivity.java | ✅ Complete | — | — | kalmanFilters HashMap |
| F09 | Multi-Algorithm Fusion | MainActivity.java | ✅ Complete | — | — | All run in parallel per scan |

### G. BLUETOOTH 3D SPATIAL TRACKING
| ID | Feature | Status | Priority | Effort | Dependencies |
|----|---------|--------|----------|--------|--------------|
| G01 | BLE Device Discovery | ✅ Complete | — | — | BluetoothLeScanner |
| G02 | Per-Device RSSI Kalman Filter | ✅ Complete | — | — | btKalmanStates HashMap |
| G03 | Distance Estimation (Log-Distance) | ✅ Complete | — | — | n=2.5, RSSI@1m=-55dBm |
| G04 | 3D Position from Phone Orientation | ✅ Complete | — | — | azimuth, pitch from sensor fusion |
| G05 | Trajectory History (50 active, 100 global) | ✅ Complete | — | — | btTrajectories HashMap |
| G06 | Brightness Decay (0.98) + Re-energize (1.5×) | ✅ Complete | — | — | Visual signal strength indicator |
| G07 | Theory Mode (All Trajectories) | ✅ Complete | — | — | Toggle via THEORY button |
| G08 | Device Cleanup (30s max age) | ✅ Complete | — | — | btCleanupHandler 500ms interval |
| G09 | JsBridge: getTrajectory(addr) | ✅ Complete | — | — | Returns JSON trajectory array |
| G10 | JsBridge: getAllDevices() | ✅ Complete | — | — | Returns all active BT devices |

### H. SSID BROADCAST (Wi-Fi Direct Group Owner)
| ID | Feature | Status | Priority | Effort | Dependencies |
|----|---------|--------|----------|--------|--------------|
| H01 | Wi-Fi Direct Group Owner | ✅ Complete | — | — | WifiP2pManager, CHANGE_WIFI_STATE |
| H02 | 5GHz Band Enforcement | ✅ Complete | — | — | GROUP_OWNER_BAND_5GHZ |
| H03 | 4-Slot Rotating Broadcast | ✅ Complete | — | — | 5.1s duty cycle per slot |
| H04 | Slot 0: Key + License Plate | ✅ Complete | — | — | A7KCarrPodNet format |
| H05 | Slot 1: TAF Format (HDG/SPD/Fleet/Make/Color/GPS) | ✅ Complete | — | — | A7KTA090CIV065G26717430 |
| H06 | Slot 2: Human HDG-DIR-SPD | ✅ Complete | — | — | A7KHD090-NE-65mph |
| H07 | Slot 3: METAR Wind (HDG KT) | ✅ Complete | — | — | A7K090KT |
| H08 | Origin Key (3-char Base32) | ✅ Complete | — | — | ABCDEFGHJKLMNPQRSTUVWXYZ23456789 |
| H09 | Broadcast Methods Priority | ✅ Complete | — | — | P2pConfig.Builder → Reflection → Bonjour |
| H10 | Bonjour DNS-SD Advertising | ✅ Complete | — | — | _bounce._tcp service |
| H11 | SSID Refresh (Live Re-code) | ✅ Complete | — | — | refreshBroadcastSSID() |
| H12 | Broadcast Status Feedback | ✅ Complete | — | — | onBroadcastStatus callback |

### I. TRAIL SYSTEM
| ID | Feature | Status | Priority | Effort | Dependencies |
|----|---------|--------|----------|--------|--------------|
| I01 | Continuous GPS Trail Recording | ✅ Complete | — | — | LocationManager GPS |
| I02 | CatmullRomCurve3 Smooth Spline | ✅ Complete | — | — | Rebuilt every 5 frames |
| I03 | GPU-Safe Geometry Disposal | ✅ Complete | — | — | geometry.dispose(), material.dispose() |
| I04 | 2000 Point Cap (FIFO) | ✅ Complete | — | — | Oldest shifted out |
| I05 | Auto-Save Every 60 Seconds | ✅ Complete | — | — | trail-{timestamp}.json |
| I06 | Manual Save (SAVE Button) | ✅ Complete | — | — | Blob download |
| I07 | Wake Lock (Background Recording) | ✅ Complete | — | — | PARTIAL_WAKE_LOCK |
| I08 | Trail Toggle (TRAIL Button) | ✅ Complete | — | — | On/Off with visual feedback |

### J. GPS & SENSORS
| ID | Feature | Status | Priority | Effort | Dependencies |
|----|---------|--------|----------|--------|--------------|
| J01 | GPS Tracking (1000ms/0.5m) | ✅ Complete | — | — | LocationManager |
| J02 | Heading (Bearing) from GPS | ✅ Complete | — | — | loc.getBearing() |
| J03 | Speed (mph) from GPS | ✅ Complete | — | — | loc.getSpeed() × 2.237 |
| J04 | Altitude (ft) from GPS | ✅ Complete | — | — | loc.getAltitude() × 3.281 |
| J05 | Lat/Lng Position | ✅ Complete | — | — | loc.getLatitude/Longitude |
| J06 | Accelerometer (Gravity Vector) | ✅ Complete | — | — | TYPE_ACCELEROMETER |
| J07 | Magnetometer (Compass) | ✅ Complete | — | — | TYPE_MAGNETIC_FIELD |
| J08 | Gyroscope (Rotation Rate) | ✅ Complete | — | — | TYPE_GYROSCOPE |
| J09 | Step Detector | ✅ Complete | — | — | TYPE_STEP_DETECTOR |
| J10 | Sensor Fusion (RotationMatrix→Orientation) | ✅ Complete | — | — | getRotationMatrix + getOrientation |
| J11 | Low-Pass Filter (α=0.15) | ✅ Complete | — | — | Smooth azimuth/pitch/roll |
| J12 | Azimuth Wrap-Around Handling | ✅ Complete | — | — | 0/360 boundary correction |
| J13 | Device Orientation (Flat/Tilted/Upright) | ✅ Complete | — | — | Pitch threshold classification |
| J14 | Movement Packet (200ms) | ✅ Complete | — | — | mag, gyro, steps, altitude, pitch |

### K. VEHICLE SIMULATION & FLEET
| ID | Feature | Status | Priority | Effort | Dependencies |
|----|---------|--------|----------|--------|--------------|
| K01 | Simulated Vehicle Beacons | ✅ Complete | — | — | MAKES, MODELS, COLORS, TYPES arrays |
| K02 | License Plate Input/Display | ✅ Complete | — | — | Overlay dialog, alphanumeric filter |
| K03 | DMV Code Generation | ✅ Complete | — | — | State + Year + Random 5-digit |
| K04 | Fleet Mode (FLT Key) | ✅ Complete | — | — | Green color, fleet SSID prefix |
| K05 | Hazard Types (12) | ✅ Complete | — | — | FOG_PATCH, ICE_BRIDGE, DEBRIS, etc. |
| K06 | Vehicle Status (8) | ✅ Complete | — | — | CRUISE, ACCEL, BRAKE, TURN_L/R, etc. |
| K07 | Random Fleet Generation | ✅ Complete | — | — | 3-6 vehicles |
| K08 | Beacon Scatter (Randomize Positions) | ✅ Complete | — | — | SCATTER button |
| K09 | Beacon Reset (Circle Formation) | ✅ Complete | — | — | 2s delayed circle |

### L. FAA METAR / AVIATION CODES
| ID | Feature | Status | Priority | Effort | Dependencies |
|----|---------|--------|----------|--------|--------------|
| L01 | Precipitation Codes (RA, SN) | ✅ Complete | — | — | Legend panel |
| L02 | Obscuration Codes (FG, BR, HZ) | ✅ Complete | — | — | Legend panel |
| L03 | Hazard Codes (TS) | ✅ Complete | — | — | Legend panel |
| L04 | Modifier Codes (FZ) | ✅ Complete | — | — | Legend panel |
| L05 | Wind Format (DDDSSKT) | ✅ Complete | — | — | Slot 3 broadcast |
| L06 | Sky Condition (FEW/BKN/OVC/CLR) | ✅ Complete | — | — | Legend panel |

### M. PERMISSIONS & COMPATIBILITY
| ID | Feature | Status | Priority | Effort | Dependencies |
|----|---------|--------|----------|--------|--------------|
| M01 | Runtime Permissions (API 23+) | ✅ Complete | — | — | PERM_REQ=1001 |
| M02 | NEARBY_WIFI_DEVICES (API 33+) | ✅ Complete | — | — | neverForLocation flag |
| M03 | BLUETOOTH_SCAN/CONNECT/ADVERTISE (API 31+) | ✅ Complete | — | — | Modern BT permissions |
| M04 | Legacy BT Permissions (≤API 30) | ✅ Complete | — | — | BLUETOOTH, BLUETOOTH_ADMIN |
| M05 | ACTIVITY_RECOGNITION (API 29+) | ✅ Complete | — | — | Step detector |
| M06 | HIGH_SAMPLING_RATE_SENSORS | ✅ Complete | — | — | SensorManager |
| M07 | ACCESS_BACKGROUND_LOCATION (API 29+) | ✅ Complete | — | — | Background GPS |
| M08 | WAKE_LOCK | ✅ Complete | — | — | Background trail |

### N. BUILD & DEPLOYMENT
| ID | Feature | Status | Priority | Effort | Dependencies |
|----|---------|--------|----------|--------|--------------|
| N01 | aapt2 Compile Resources | ✅ Complete | — | — | build.sh step 1 |
| N02 | aapt2 Link (Manifest + Resources) | ✅ Complete | — | — | build.sh step 2 |
| N03 | Asset Injection (zip assets into APK) | ✅ Complete | — | — | build.sh step 2b |
| N04 | javac Compile (Java 11 source/target) | ✅ Complete | — | — | build.sh step 3 |
| N05 | d8 Dex Conversion | ✅ Complete | — | — | build.sh step 4 |
| N06 | Dex Injection into APK | ✅ Complete | — | — | build.sh step 5 |
| N07 | zipalign (4-byte) | ✅ Complete | — | — | build.sh step 6 |
| N08 | apksigner (debug keystore) | ✅ Complete | — | — | build.sh step 7 |
| N09 | CSMDropBox Copy | ✅ Complete | — | — | Post-build copy |
| N10 | Repo Root Copy | ✅ Complete | — | — | Post-build copy |

---

## ENHANCEMENT BACKLOG (Prioritized)

### P0 — Critical Fixes
| ID | Enhancement | Description | Effort | Module |
|----|-------------|-------------|--------|--------|
| P0-01 | Fix EKF Velocity Bug | Line 38: `x[2] = 0; x[2] = 0;` → `x[3] = 0` for vy | ✅ **DONE** | PositionEKF.java:38 |
| P0-02 | Complete RTT Ranging | Implement WifiRttManager API for 802.11mc FTM | High | WifiRttRanging.java |
| P0-03 | AP Position Self-Calibration | Learn AP positions from trilateration + movement | High | MainActivity.java, Trilateration.java |

### P1 — High Value
| ID | Enhancement | Description | Effort | Module |
|----|-------------|-------------|--------|--------|
| P1-01 | Particle Filter Parameter Learning | Adaptive RSSI mean/variance/pathloss per AP | High | ParticleFilter.java |
| P1-02 | Unit Test Suite | JUnit tests for all 6 positioning algorithms | High | New test/ directory |
| P1-03 | Multi-Activity Architecture | Separate ScanningService, BroadcastService, UI | High | New Services |
| P1-04 | Background Scanning Service | Foreground Service for continuous scanning | Medium | Service, Notification |
| P1-05 | Mesh Network Protocol | Vehicle-to-vehicle relay (TTL, hop count) | High | New Protocol |

### P2 — Medium Value
| ID | Enhancement | Description | Effort | Module |
|----|-------------|-------------|--------|--------|
| P2-01 | Offline Map Caching | Cache Mapbox/OSM tiles for offline use | Medium | New Module |
| P2-02 | Hazard Reporting (NOTAM) | User-reported hazards with TTL | Medium | New Module |
| P2-03 | Voice Announcements | TTS for "Hazard ahead", "Vehicle approaching" | Low | TextToSpeech |
| P2-04 | Night/Day Theme Toggle | CSS variable swap for lighting conditions | Low | bounce.html CSS |
| P2-05 | Export Trail as GPX/KML | Standard formats for mapping tools | Low | Trail save dialog |

### P3 — Nice to Have
| ID | Enhancement | Description | Effort | Module |
|----|-------------|-------------|--------|--------|
| P3-01 | Bluetooth Mesh (BLE Mesh) | Standard BLE Mesh provisioning | High | New Module |
| P3-02 | UWB Ranging (FiRa) | Ultra-wideband distance (API 29+) | High | New Module |
| P3-03 | V2X / C-V2X Support | Cellular V2X (LTE-V/NR-V2X) | Very High | New Module |
| P3-04 | AR Overlay (ARCore) | Camera feed + 3D annotations | High | ARCore |
| P3-05 | Wear OS Companion | Watch app for haptic alerts | Medium | Wear OS Module |

---

## TECHNICAL DEBT

| ID | Issue | Location | Severity |
|----|-------|----------|----------|
| TD-01 | EKF vy initialization bug | PositionEKF.java:38 | High |
| TD-02 | MainActivity >1400 lines (God class) | MainActivity.java | Medium |
| TD-03 | No unit tests | — | Medium |
| TD-04 | RTT stub not implemented | WifiRttRanging.java:72 | Medium |
| TD-05 | Particle filter AP params hardcoded | ParticleFilter.java:302-316 | Low |
| TD-06 | AP positions initialized randomly | MainActivity.java:1131-1134 | Low |
| TD-07 | No ProGuard/R8 obfuscation | build.sh | Low |
| TD-08 | Single keystore (debug only) | build.sh:90-94 | Low |
| TD-09 | No CI/CD pipeline | — | Low |
| TD-10 | No automated version bump | build.sh | Low |

---

## VERSION MATRIX (Key Milestones)

| Version | Date | Key Features Added |
|---------|------|-------------------|
| 1.0.0 | — | Initial release |
| 1.0.14 | — | Wi-Fi Direct custom SSID |
| 1.0.20 | — | Duty-cycle broadcast |
| 1.0.22 | — | 4-slot + origin key |
| 1.0.25 | — | Sensor fusion (mag+accel) |
| 1.0.27 | — | Real GPS mph |
| 1.0.28 | — | POV zoom 5× |
| 1.0.30 | — | Real Wi-Fi scanner |
| 1.0.35 | — | Real data only |
| 1.0.38 | — | SCAN pullout panel |
| 1.0.48 | — | Bluetooth LE scanning |
| 1.0.49 | — | BT 3D + TRAIL + SAVE |
| 1.0.50 | — | BT pulse + POV zoom + default plate |
| 1.0.54 | — | Trail decimation (GPU fix) |
| 1.0.57 | — | Auto-save trail 60s |
| 1.0.60 | — | Clean base + Python fixes |
| 1.0.62 | — | CatmullRom trail |
| 1.0.63 | — | Wake lock background |
| 1.0.64 | — | FAA METAR + Slot 3 |
| 1.0.87 | — | BT 3D Spatial + Theory Mode |
| 1.0.91 | 2026-08 | Current: BT 3D Spatial RSSI + Manual Update |
| **1.0.92** | **2026-08** | **EKF Bug Fix: vy initialization (P0-01)** |

---

## FILE STRUCTURE REFERENCE

```
v1.0.91/
├── build.sh                      (109 lines — build pipeline, updated for v1.0.92)
├── src/main/
│   ├── AndroidManifest.xml       (43 lines — 15 permissions)
│   ├── java/com/carrpod/bounce/
│   │   ├── MainActivity.java     (1416 lines — core logic)
│   │   └── wifi/
│   │       ├── RssiKalmanFilter.java    (64 lines)
│   │       ├── Trilateration.java       (257 lines)
│   │       ├── PositionEKF.java         (302 lines) ← **FIXED: line 38**
│   │       ├── ParticleFilter.java      (322 lines)
│   │       ├── ZoneHMM.java             (287 lines)
│   │       └── WifiRttRanging.java      (119 lines)
│   ├── assets/
│   │   ├── bounce.html           (~2200 lines — Three.js app)
│   │   └── js/                   (7 Three.js modules)
│   └── res/                      (values, mipmap, drawable)
├── gen/                          (generated R.java)
├── obj/                          (compiled .class, resources.zip, classes.dex)
└── out/
    └── Bounce-v1.0.92.apk        (~201 KB signed) ← **Next build target**
```

---

## QUICK START (Next Session)

```bash
# 1. Checkout branch
git checkout session/bounce-versioning-august-2026

# 2. Navigate to WIP
cd CSM_WORK_IN_PROGRESS/BOUNCE.WIP/v1.0.91

# 3. Build (requires Android SDK + JDK17)
bash build.sh

# 4. Install APK
adb install out/Bounce-v1.0.92.apk

# 5. Or examine source
cat src/main/java/com/carrpod/bounce/MainActivity.java
```

---

## SELECTION GUIDE FOR NEXT FEATURE REQUEST

**Choose from these categories:**

| Category | Features | Best For |
|----------|----------|----------|
| **Positioning** | P0-02, P0-03, P1-01, F06-F08 | Accuracy, indoor/outdoor transition |
| **Architecture** | P1-03, P1-04, TD-02 | Maintainability, background operation |
| **Mesh/Network** | P1-05, H09-H11, P3-01 | Vehicle-to-vehicle communication |
| **Sensors** | P3-02, P3-03, J06-J14 | Precision ranging, new hardware |
| **Visualization** | B12, C02-C03, P2-04, P3-04 | UX, situational awareness |
| **Data/Export** | I05-I07, P2-05 | Logging, analysis, compliance |
| **Testing** | P1-02, TD-03 | Reliability, regression prevention |

---

*Generated by Session 001 — Ready for feature selection*