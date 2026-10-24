# Android Main Features Radio Positioning — Complete Article
## Article A2: A2-02 — Android Main Features Radio Positioning
**Generated:** 2026-10-08 04:18:53 UTC  
**Structure:** 13 pieces concatenated  
**Target:** ≥350 lines

---

# Android_Main_Features_Radio_Positioning — Piece 01/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 01 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## WIFI SCANNING — FOUNDATION (v1.0.3 → v1.0.91)

### Wi-Fi Scanning (WifiManager)
- **First Version:** 1.0.3 | **Last Version:** 1.0.91
- **Key Classes:** WifiManager + BroadcastReceiver
- **Key Methods:** startScan() + SCAN_RESULTS_AVAILABLE_ACTION
- **Permissions:** ACCESS_FINE_LOCATION + ACCESS_WIFI_STATE + NEARBY_WIFI_DEVICES (API33+)
- **Connects to HTML via:** JS bridge: onWifiResult (C001)
- **Output:** Real dBm + distance + zone (IMMEDIATE/NEAR/FAR)
- **Worked Well:** Core scanner feed, reliable across versions
- **Issues:** API33 permission changes broke scanning in v1.0.80-1.0.85
- **Solution:** Runtime permission handler with delayed request (BP006, BP007)
- **Best Practice:** Delayed permission request with Handler.postDelayed(100ms) (BP007)

### Evolution Timeline
| Version | Change |
|---------|--------|
| 1.0.3 | Basic scan implementation |
| 1.0.30 | Real dBm + distance calculation |
| 1.0.79 | Kalman filter on RSSI (RssiKalmanFilter) |
| 1.0.90 | 6-algo stack integration (EKF, Particle, HMM) |
| 1.0.91 | Current — stable with proven v1.0.3 pattern |

---

## WIFI DIRECT GROUP OWNER — 5GHZ BROADCAST (v1.0.13 → v1.0.91)

### Wi-Fi Direct Group Owner
- **First Version:** 1.0.13 | **Last Version:** 1.0.91
- **Key Classes:** WifiP2pManager + WifiP2pConfig.Builder
- **Key Methods:** createGroup() + setDeviceName() + GROUP_OWNER_BAND_5GHZ
- **Permissions:** CHANGE_WIFI_STATE + ACCESS_WIFI_STATE
- **Connects to HTML via:** JS bridge: onBroadcastStatus (C006)
- **Feature:** 5GHz 4-slot rotating broadcast
- **Worked Well:** Vehicle identification via SSID rotation
- **Issues:** Legacy API reflection needed for older devices
- **Solution:** Multi-method fallback — Builder → Reflection → Bonjour (BP011)

### Multi-Method Fallback Chain (Priority Order)
1. **Builder API** (modern, API19+) — `WifiP2pConfig.Builder`
2. **Reflection** (legacy) — `WifiP2pConfig` class reflection
3. **Bonjour/mDNS** (fallback) — Service discovery

---

## BLUETOOTH LE SCANNING — CONTINUOUS + 3D (v1.0.48 → v1.0.91)

### Bluetooth LE Scanning
- **First Version:** 1.0.48 | **Last Version:** 1.0.91
- **Key Classes:** BluetoothLeScanner + ScanCallback
- **Key Methods:** startScan(LOW_LATENCY) + 5s restart cycle
- **Permissions:** BLUETOOTH_SCAN + BLUETOOTH_CONNECT (API31+)
- **Connects to HTML via:** JS bridge: onBtResult + onBtResult3D (C002, C003)
- **Output:** Continuous scanning + 3D positioning
- **Worked Well:** Reliable device discovery with 3D spatial data
- **Issues:** Scan dies after ~10 seconds (Android kills continuous scan)
- **Solution:** Restart scan every 5s with Handler.postDelayed (BP008, E010 fixed in v1.0.65)

### Scan Configuration (Optimized)
```java
ScanSettings settings = new ScanSettings.Builder()
    .setScanMode(ScanSettings.SCAN_MODE_LOW_LATENCY)  // BP009
    .setReportDelay(0)  // Immediate reporting
    .build();

List<ScanFilter> filters = new ArrayList<>(); // No filters = all devices

// 5s restart cycle (mandatory)
handler.postDelayed(restartScanRunnable, 5000);  // BP008
```

---

## PIECE 01 SUMMARY
This piece covers the three radio scanning foundations: Wi-Fi Scanning (v1.0.3, proven pattern with API33 fixes), Wi-Fi Direct Group Owner with 5GHz 4-slot broadcast (v1.0.13, multi-method fallback), and Bluetooth LE Scanning (v1.0.48, mandatory 5s restart cycle + LOW_LATENCY mode). These form the radio layer feeding all positioning algorithms.

**Next Piece (02):** GPS Tracking + Sensor Fusion + Wake Lock
---

# Android_Main_Features_Radio_Positioning — Piece 02/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 02 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## GPS TRACKING — REAL MOVEMENT DATA (v1.0.4 → v1.0.91)

### GPS Tracking
- **First Version:** 1.0.4 | **Last Version:** 1.0.91
- **Key Classes:** LocationManager + GPS_PROVIDER
- **Key Methods:** requestLocationUpdates(1000ms, 0.5m)
- **Permissions:** ACCESS_FINE_LOCATION + ACCESS_COARSE_LOCATION + ACCESS_BACKGROUND_LOCATION (API29+)
- **Connects to HTML via:** JS bridge: onLocationResult (C004)
- **Output:** Real mph + heading + altitude (feet)
- **Worked Well:** Accurate speed, heading, altitude for trail
- **Issues:** Zero-fix when stationary (GPS returns 0 speed)
- **Solution:** Speed > 1mph threshold for trail recording (BP010, E019 fixed in v1.0.27)

### GPS Data Structure
```json
{
  "lat": 37.7749,
  "lng": -122.4194,
  "altitude": 52.3,
  "heading": 245.7,
  "speed": 12.4,
  "mph": 27.7,
  "timestamp": 1700000000000
}
```

### Evolution
| Version | Enhancement |
|---------|-------------|
| 1.0.4 | Basic GPS (lat/lng only) |
| 1.0.27 | Speed > 1mph threshold (trail filter) |
| 1.0.63 | Wake lock for background recording |
| 1.0.90 | Altitude in feet, mph conversion |

---

## SENSOR FUSION — ACCEL + MAG + GYRO (v1.0.25 → v1.0.91)

### Sensor Fusion (Accelerometer + Magnetometer + Gyroscope)
- **First Version:** 1.0.25 | **Last Version:** 1.0.91
- **Key Classes:** SensorManager + getRotationMatrix + getOrientation
- **Sensors:** TYPE_ACCELEROMETER + TYPE_MAGNETIC_FIELD + TYPE_GYROSCOPE
- **Permissions:** None (system sensors)
- **Connects to HTML via:** JS bridge: onOrientationResult (C005)
- **Output:** Azimuth/pitch/roll + low-pass filter (α=0.15)
- **Worked Well:** Stable orientation for camera, BT 3D positioning
- **Issues:** Azimuth wrap-around at 0/360 boundary
- **Solution:** Alpha=0.15 low-pass + wrap handling (BP006, E020 fixed in v1.0.25)

### Low-Pass Filter Implementation
```java
// Azimuth wrap handling
float diff = newAzimuth - lastAzimuth;
if (diff > 180) diff -= 360;
if (diff < -180) diff += 360;
filteredAzimuth = lastAzimuth + 0.15f * diff;  // α=0.15
if (filteredAzimuth >= 360) filteredAzimuth -= 360;
if (filteredAzimuth < 0) filteredAzimuth += 360;
```

### Usage
- **Camera POV mode:** Vehicle heading from sensor fusion
- **BT 3D positioning:** Device orientation for spatial calculation
- **FLY mode:** Camera orientation reference

---

## WAKE LOCK — BACKGROUND TRAIL (v1.0.63 → v1.0.91)

### Wake Lock (Background Trail Recording)
- **First Version:** 1.0.63 | **Last Version:** 1.0.91
- **Key Classes:** PowerManager + PARTIAL_WAKE_LOCK
- **Key Methods:** acquire() + release()
- **Permission:** WAKE_LOCK
- **Connects to HTML via:** JS bridge: trail recording (C016, C026)
- **Feature:** Background recording with screen off
- **Worked Well:** Trail continues when screen off
- **Issues:** Battery drain if held continuously
- **Solution:** Conditional wake lock — only acquire when trail active (BP010)

### Wake Lock Management
```java
// Only when trail recording active
if (trailRecording && !wakeLock.isHeld()) {
    wakeLock.acquire();
}
if (!trailRecording && wakeLock.isHeld()) {
    wakeLock.release();
}
```

---

## PIECE 02 SUMMARY
This piece covers GPS Tracking (v1.0.4, speed threshold filter for trail), Sensor Fusion (v1.0.25, low-pass filter α=0.15 with azimuth wrap handling), and Wake Lock (v1.0.63, conditional acquire only when trail active). These provide the positioning and orientation foundation for all higher-level algorithms.

**Next Piece (03):** WebView + JavaScript Bridge + Auto-Update System
---

# Android_Main_Features_Radio_Positioning — Piece 03/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 03 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## WEBVIEW + JAVASCRIPT BRIDGE — CORE ARCHITECTURE (v1.0.0 → v1.0.91)

### WebView + JavaScript Bridge
- **First Version:** 1.0.0 | **Last Version:** 1.0.91
- **Key Classes:** WebView + @JavascriptInterface
- **Key Method:** addJavascriptInterface(Bounce, "Bounce")
- **Permission:** INTERNET
- **Connects to HTML via:** Bidirectional JS↔Android (C025)
- **Worked Well:** Stable bridge since v1.0.0
- **Issues:** Silent failures on JS errors (E016)
- **Solution:** HTML try/catch wrapper + window.onerror (BP015, fixed v1.0.52)

### Bridge Architecture
```java
// Android side - MainActivity
public class Bounce {
    @JavascriptInterface
    public void setVehicleData(String json) { ... }
    
    @JavascriptInterface
    public String getTrajectory(String addr) { ... }
    
    @JavascriptInterface
    public void toggleBroadcast() { ... }
}

// HTML side - bounce.html
// window.Bounce injected automatically
Bounce.setVehicleData(json);
const trajectory = Bounce.getTrajectory(addr);
```

### Android → HTML (Push)
```java
webView.evaluateJavascript(
    "javascript:UI.updateWifiList(" + json + ")", 
    null
);
```

### HTML → Android (Call)
```javascript
Bounce.setCameraMode('fly');  // Direct @JavascriptInterface call
```

---

## AUTO-UPDATE SYSTEM — MANUAL TRIGGER (v1.0.91 → v1.0.93)

### Auto-Update System
- **First Version:** 1.0.91 | **Last Version:** 1.0.93 (moved to TGAPP)
- **Key Classes:** GitHub API version check
- **Key Methods:** onUpdateAvailable() + UI.showUpdateMenu()
- **Permission:** INTERNET
- **Connects to HTML via:** JS bridge: Bounce.onUpdateAvailable() (C007)
- **Feature:** Manual update button + version display
- **Worked Well:** User control over updates
- **Issues:** Auto-check on startup caused permission prompts
- **Solution:** Manual trigger only (moved to TGAPP in v1.0.93)

### Update Flow
```
User clicks "CHECK UPDATE"
  → Android: GitHub API GET /repos/owner/repo/releases/latest
  → Compare versionName with current
  → If newer: JS bridge → UI.showUpdateMenu(version, url)
  → User clicks "DOWNLOAD" → TGAPP handles download/install
  → User clicks "IGNORE" → Dismiss until next check
```

---

## DEBUG KEYSTORE AUTO-GENERATION (v1.0.0 → v1.0.91)

### Debug Keystore Auto-Gen
- **First Version:** 1.0.0 | **Last Version:** 1.0.91
- **Tool:** keytool (JDK 17)
- **Key Method:** genkey -alias androiddebugkey -keystore debug.keystore
- **Permission:** None
- **Connects to Build via:** Build script auto-generation
- **Feature:** Auto-signs APK if keystore missing
- **Worked Well:** Build never fails on missing keystore
- **Issues:** Single debug keystore only (no release signing)
- **Solution:** Separate release keystore needed (TD-08, RF021)

### Build.sh Keystore Logic
```bash
if [ ! -f debug.keystore ]; then
    keytool -genkey -v -keystore debug.keystore \
        -alias androiddebugkey \
        -keyalg RSA -keysize 2048 \
        -validity 10000 \
        -dname "CN=Android Debug,O=Android,C=US" \
        -storepass android -keypass android
fi
```

---

## PIECE 03 SUMMARY
This piece covers the core WebView+JS Bridge architecture (stable since v1.0.0, stabilized with try/catch in v1.0.52), Auto-Update System (v1.0.91 manual trigger, moved to TGAPP), and Debug Keystore Auto-Generation (v1.0.0, auto-signs APKs). The bridge is the critical communication layer — 30 connections mapped in Section 3.

**Next Piece (04):** No-Gradle Build Pipeline (aapt2) + RSSI Kalman Filter
---

# Android_Main_Features_Radio_Positioning — Piece 04/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 04 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## NO-GRADLE BUILD — AAPT2 PIPELINE (v1.0.0 → v1.0.91)

### No-Gradle Build (aapt2)
- **First Version:** 1.0.0 | **Last Version:** 1.0.91
- **Pipeline:** build.sh → aapt2 compile → link → javac → d8 → zipalign → apksigner
- **Key Tools:** aapt2, javac (JDK 17), d8, zipalign, apksigner
- **Permission:** None (build-time only)
- **Connects to Build via:** build.sh (109 lines)
- **Performance:** 4-second builds vs minutes with Gradle
- **Worked Well:** Fast, transparent, reproducible
- **Issues:** SDK path management across environments
- **Solution:** Fixed SDK paths in build.sh with ANDROID_HOME detection (BP001)

### Build Pipeline Steps (4 seconds total)
```
1. aapt2 compile --dir res -o resources.zip          (~0.5s)
2. aapt2 link -o base.apk -I android.jar --manifest  (~1s)
3. zip -r base.apk assets/                           (~0.5s)  ← Asset injection
4. javac -source 11 -target 11 -d classes ...        (~1s)
5. d8 --lib android.jar --min-api 24 --output obj    (~0.5s)
6. zipalign -p -f 4 input.apk output.apk             (~0.3s)
7. apksigner sign --ks debug.keystore --out signed   (~0.2s)
```

### SDK Path Detection
```bash
# build.sh auto-detects
if [ -z "$ANDROID_HOME" ]; then
    export ANDROID_HOME=/opt/android-sdk  # fallback
fi
AAPT2="$ANDROID_HOME/build-tools/33.0.1/aapt2"
D8="$ANDROID_HOME/build-tools/33.0.1/d8"
ZIPALIGN="$ANDROID_HOME/build-tools/33.0.1/zipalign"
APKSIGNER="$ANDROID_HOME/build-tools/33.0.1/apksigner"
```

---

## RSSI KALMAN FILTER — 1D SMOOTHING (v1.0.79 → v1.0.91)

### RSSI Kalman Filter (1D)
- **First Version:** 1.0.79 | **Last Version:** 1.0.91
- **Class:** RssiKalmanFilter.java
- **Parameters:** q=0.005 (process noise), r=25 (measurement noise)
- **Permission:** None
- **Connects to HTML via:** JS bridge: filtered RSSI
- **Output:** Smoothed RSSI for distance calculation
- **Worked Well:** Reduces RSSI noise significantly
- **Issues:** Fixed q/r params don't adapt to environment
- **Solution:** Fixed params per environment (RF013 planned for adaptive Q)

### Kalman Filter Equations (1D)
```java
// Predict
x = x;  // State (RSSI)
P = P + q;  // Covariance

// Update (on new measurement z)
K = P / (P + r);  // Kalman gain
x = x + K * (z - x);  // State update
P = (1 - K) * P;  // Covariance update

// x = filtered RSSI
```

### Usage
- **Wi-Fi APs:** Per-AP Kalman filter for stable distance
- **Bluetooth:** Per-device Kalman filter (btKalmanStates Map)
- **Input to:** Trilateration, EKF, Particle Filter

---

## TRILATERATION — WEIGHTED LEAST SQUARES (v1.0.81 → v1.0.91)

### Trilateration (Weighted Least Squares)
- **First Version:** 1.0.81 | **Last Version:** 1.0.91
- **Class:** Trilateration.java
- **Algorithm:** 3+ APs + GDOP calculation (Geometric Dilution of Precision)
- **Permission:** None
- **Connects to HTML via:** JS bridge: position (C027)
- **Output:** 2D position from RSSI distances
- **Worked Well:** Multi-AP positioning when AP positions known
- **Issues:** AP positions unknown initially (chicken-egg)
- **Solution:** Self-calibration needed (P0-03, RF005)

### Weighted Least Squares
```java
// For each AP: known position (xi, yi), measured distance di
// Weight wi = 1 / (variance_i)  ← inverse variance weighting

// Solve: (A^T W A) x = A^T W b
// Where A = [2(xi-x1), 2(yi-y1)], b = di^2 - d1^2 - xi^2 + x1^2 - yi^2 + y1^2
```

### GDOP (Geometric Dilution of Precision)
- **Purpose:** Quality metric for position fix
- **High GDOP:** Poor geometry (APs in line) → unreliable
- **Low GDOP:** Good geometry (APs spread) → reliable
- **Used for:** Weighting in multi-algorithm fusion

---

## PIECE 04 SUMMARY
This piece covers the build system (No-Gradle aapt2 pipeline, 4-second builds), RSSI Kalman Filter (1D smoothing with fixed q=0.005/r=25, feeds all positioning), and Trilateration (Weighted Least Squares with GDOP, needs AP position self-calibration P0-03). The build system is a key best practice (BP001) — fast, transparent, no Gradle complexity.

**Next Piece (05):** Extended Kalman Filter (2D CV) + Particle Filter (SIR) + Zone HMM
---

# Android_Main_Features_Radio_Positioning — Piece 05/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 05 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## EXTENDED KALMAN FILTER — 2D CONSTANT VELOCITY (v1.0.90 → v1.0.91)

### Extended Kalman Filter (2D CV)
- **First Version:** 1.0.90 | **Last Version:** 1.0.91
- **Class:** PositionEKF.java
- **State:** [x, y, vx, vy] — position + velocity
- **Measurement:** RSSI-derived distance from Trilateration
- **Permission:** None
- **Connects to HTML via:** JS bridge: EKF position (C027)
- **Output:** Smoothed position + velocity tracking
- **Worked Well:** Velocity estimation enables prediction
- **Critical Bug (E011):** vy initialization typo — `x[2]=0; x[2]=0;` should be `x[3]=0`
- **Fix:** v1.0.92 — `x[2]=0; x[3]=0;` (P0-01, RF002, FP026)
- **Best Practice:** ALWAYS verify array indices (CP008)

### EKF State & Matrices
```java
// State: x = [x, y, vx, vy]^T
// Process model: Constant Velocity
F = [1, 0, dt, 0;
     0, 1, 0, dt;
     0, 0, 1,  0;
     0, 0, 0,  1];

// Measurement: RSSI distance to known APs
// h(x) = sqrt((x - ap_x)^2 + (y - ap_y)^2)
// H = Jacobian of h wrt x

// Process noise Q, Measurement noise R
```

### Bug Details (PositionEKF.java:38)
```java
// BROKEN (v1.0.90-1.0.91):
x[0] = 0;  // x
x[1] = 0;  // y
x[2] = 0;  // vx
x[2] = 0;  // BUG: should be x[3] for vy!

// FIXED (v1.0.92+):
x[0] = 0;  // x
x[1] = 0;  // y
x[2] = 0;  // vx
x[3] = 0;  // vy ← CORRECT
```

---

## PARTICLE FILTER — SIR, 200 PARTICLES (v1.0.90 → v1.0.91)

### Particle Filter (SIR, 200 Particles)
- **First Version:** 1.0.90 | **Last Version:** 1.0.91
- **Class:** ParticleFilter.java
- **Algorithm:** Sequential Importance Resampling (SIR)
- **Particles:** 200
- **Likelihood:** Gaussian Mixture Model (RSSI mean/variance per AP)
- **Permission:** None
- **Connects to HTML via:** JS bridge: particle position (C027)
- **Output:** Non-Gaussian position estimate (handles multimodal)
- **Worked Well:** Handles RSSI multipath, non-line-of-sight
- **Issues:** AP parameters hardcoded (mean, variance, pathloss)
- **Solution:** Adaptive parameter learning needed (P1-01, FP003, RF004)

### Particle Filter Flow
```java
// 1. Initialize 200 particles uniformly in area
// 2. For each scan:
//    a. Predict: particles += velocity * dt + noise
//    b. Weight: likelihood = GaussianMixture(RSSI | particle_pos)
//    c. Resample: systematic resampling by weights
//    d. Estimate: weighted mean of particles
```

---

## ZONE HMM — VITERBI CLASSIFICATION (v1.0.90 → v1.0.91)

### Zone HMM (Viterbi)
- **First Version:** 1.0.90 | **Last Version:** 1.0.91
- **Class:** ZoneHMM.java
- **States:** 3 (IMMEDIATE, NEAR, FAR)
- **Transitions:** Hysteresis matrix (prevents flutter)
- **Algorithm:** Viterbi path decoding
- **Permission:** None
- **Connects to HTML via:** JS bridge: zone classification (C028)
- **Output:** Stable zone classification (IMMEDIATE/NEAR/FAR)
- **Worked Well:** Zone stability, no flickering
- **Issues:** Hysteresis thresholds need tuning per environment
- **Solution:** Learn transition matrix from history (RF014)

### HMM Structure
```
States: {IMMEDIATE, NEAR, FAR}
Observations: RSSI zone (from scan)
Transition Matrix (with hysteresis):
    IMMEDIATE  NEAR    FAR
IMMEDIATE  0.90    0.10    0.00
NEAR       0.05    0.90    0.05
FAR        0.00    0.10    0.90

Emission: P(observed_zone | true_state)
Viterbi: Most likely state sequence
```

---

## PIECE 05 SUMMARY
This piece covers the 6-algorithm positioning stack introduced in v1.0.90: Extended Kalman Filter (2D CV with velocity, bug fixed in v1.0.92), Particle Filter (SIR 200 particles, Gaussian Mixture likelihood, needs adaptive params), and Zone HMM (Viterbi with hysteresis, stable zone classification). These three join RSSI Kalman (1D) and Trilateration (WLS) for the complete 6-algo fusion.

**Next Piece (06):** Wi-Fi RTT Ranging + Bluetooth 3D Spatial + Trail Recording
---

# Android_Main_Features_Radio_Positioning — Piece 06/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 06 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## WIFI RTT RANGING — 802.11MC STUB (v1.0.81 → v1.0.91)

### Wi-Fi RTT Ranging (802.11mc)
- **First Version:** 1.0.81 | **Last Version:** 1.0.91
- **Class:** WifiRttRanging.java
- **Status:** STUB ONLY — not implemented
- **API:** API28+ WifiRttManager (Fine Time Measurement)
- **Permission:** ACCESS_FINE_LOCATION + NEARBY_WIFI_DEVICES
- **Connects to HTML via:** JS bridge: RTT distance (planned)
- **Target:** Sub-meter accuracy indoors
- **Blockers:** Requires hardware support (Wi-Fi 6 / 802.11mc capable AP + device)
- **Priority:** P0-02 (FP001, RF003, FP026)

### RTT vs RSSI
| Aspect | RSSI (Current) | RTT (FTM) |
|--------|---------------|-----------|
| Accuracy | ~3-10m | ~0.5-2m |
| Infrastructure | Any AP | 802.11mc AP |
| Protocol | Passive scan | Active FTM |
| Multi-path | Severe | Resistant |

### Implementation Plan (v1.0.93)
```java
// WifiRttManager.requestRanging(request, executor, callback)
// RangingRequest.Builder().addAccessPoints(apList).build()
// RangingResult.getDistanceMm() → millimeters!
```

---

## BLUETOOTH 3D SPATIAL TRACKING (v1.0.86 → v1.0.91)

### Bluetooth 3D Spatial Tracking
- **First Version:** 1.0.86 | **Last Version:** 1.0.91
- **Key Classes:** MainActivity btKalmanStates + btTrajectories
- **Algorithm:** RSSI Kalman + orientation + distance → 3D position
- **Permissions:** BLUETOOTH_SCAN + BLUETOOTH_CONNECT
- **Connects to HTML via:** JS bridge: getTrajectory() + getAllDevices() (C019, C020)
- **Output:** Full 3D + trajectories (x, y, z, brightness, trajectory[])
- **Worked Well:** Theory mode for ghost paths, visual signal strength
- **Issues:** Brightness decay tuning, parameter learning
- **Solution:** 0.98 decay + 1.5x re-energize on signal (RF011)

### 3D Position Computation
```java
// Per-device Kalman filter (btKalmanStates: Map<MAC, RssiKalmanFilter>)
// Distance from filtered RSSI
double distance = Math.pow(10, (txPower - filteredRssi) / (10 * n));

// Orientation from sensor fusion (azimuth, pitch)
// Elevation from pitch angle
double x = distance * Math.sin(azimuth) * Math.cos(pitch);
double y = distance * Math.cos(azimuth) * Math.cos(pitch);
double z = distance * Math.sin(pitch);  // elevation

// Brightness = signal strength visualization
brightness = Math.min(1.0, brightness * 0.98 + 0.02);  // decay 0.98
onNewSignal: brightness *= 1.5;  // re-energize
```

### Trajectory Storage
```java
// btTrajectories: Map<String, List<Point3D>>
// Max 50 points per device, 100 global
// Theory mode renders ALL trajectories as ghost paths
```

---

## TRAIL RECORDING — GPS + CATMULLROM (v1.0.49 → v1.0.91)

### Trail Recording (GPS)
- **First Version:** 1.0.49 | **Last Version:** 1.0.91
- **Key Classes:** MainActivity trailPoints + CatmullRomCurve3
- **Features:** Continuous + 2000pt cap + auto-save 60s
- **Permissions:** ACCESS_FINE_LOCATION + WAKE_LOCK
- **Connects to HTML via:** JS bridge: trail points (C004, C016, C026)
- **Output:** Smooth CatmullRom spline trail
- **Worked Well:** Beautiful path visualization
- **Critical Issues:** Memory leaks before v1.0.54 (E012)
- **Fix:** GPU-safe disposal: geometry.dispose() + material.dispose() (BP016)
- **Best Practice:** ALWAYS dispose Three.js objects (CP009)

### Trail Architecture
```java
// Android: trailPoints (ArrayList<Point>)
// Max 2000 points (FIFO)
// Auto-save every 60s to internal storage
// Wake lock held only during recording

// HTML: CatmullRomCurve3 through points
// Rebuild every 5 frames (adaptive in v1.0.94+)
// GPU-safe disposal on every rebuild
```

---

## PIECE 06 SUMMARY
This piece covers Wi-Fi RTT Ranging (stub only, P0-02 priority for v1.0.93), Bluetooth 3D Spatial Tracking (v1.0.86, RSSI Kalman + orientation → 3D with trajectories), and Trail Recording (v1.0.49, CatmullRom with 2000pt FIFO cap, GPU-safe disposal critical). RTT is the missing piece for sub-meter indoor accuracy.

**Next Piece (07):** SSID Broadcast 4-Slot + FAA METAR + Runtime Permissions
---

# Android_Main_Features_Radio_Positioning — Piece 07/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 07 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## SSID BROADCAST — 4-SLOT ROTATING (v1.0.22 → v1.0.91)

### SSID Broadcast (4-Slot Rotating)
- **First Version:** 1.0.22 | **Last Version:** 1.0.91
- **Key Method:** refreshBroadcastSSID() + duty cycle
- **Timing:** 5.1s/slot (2.5s ON + 2.6s OFF) + 5GHz + Bonjour fallback
- **Permissions:** CHANGE_WIFI_STATE + CHANGE_NETWORK_STATE
- **Connects to HTML via:** JS bridge: broadcastStatus (C006)
- **Feature:** Vehicle identification via rotating SSID
- **Worked Well:** Clear identification, 4 vehicles max
- **Issues:** Slot timing drift in early versions (E017)
- **Solution:** Fixed 5.1s duty cycle with single timer (v1.0.20, BP012)

### Slot Structure
```
Slot 0: 0.0s  → 5.1s   | SSID: "BOUNCE_00_<PLATE>"
Slot 1: 5.1s  → 10.2s  | SSID: "BOUNCE_01_<PLATE>"
Slot 2: 10.2s → 15.3s  | SSID: "BOUNCE_02_<PLATE>" (METAR data in v1.0.64+)
Slot 3: 15.3s → 20.4s  | SSID: "BOUNCE_03_<PLATE>"
Cycle repeats every 20.4s
```

### Bonjour Fallback (v1.0.90+)
- **Purpose:** Service discovery when Wi-Fi Direct fails
- **Implementation:** NSD (Network Service Discovery)
- **Service Type:** `_bounce._tcp.local.`

---

## FAA METAR CODES — REFERENCE DATA (v1.0.64 → v1.0.91)

### FAA METAR Codes
- **First Version:** 1.0.64 | **Last Version:** 1.0.91
- **Implementation:** Static code tables in HTML (Legend panel)
- **Categories:** Precipitation / Obscuration / Hazard / Modifiers / Wind / Sky
- **Permission:** None
- **Connects to HTML via:** Legend panel (static)
- **Worked Well:** Complete aviation weather reference
- **Issues:** None
- **Solution:** Static reference data (no computation needed)

### METAR Categories (Slot 3 Broadcast)
| Category | Codes | Example |
|----------|-------|---------|
| Precipitation | RA, SN, DZ, GR, GS, PL, UP | RA = Rain |
| Obscuration | FG, BR, HZ, VA, DU, SA, PY | FG = Fog |
| Hazard | TS, FC, SS, DS, PO, SQ | TS = Thunderstorm |
| Modifiers | MI, BC, PR, DR, BL, SH, TS, FZ | SH = Showers |
| Wind | VRB, KT, MPS, KMH | VRB = Variable |
| Sky | FEW, SCT, BKN, OVC, VV | OVC = Overcast |

---

## RUNTIME PERMISSIONS — COMPREHENSIVE (v1.0.3 → v1.0.91)

### Runtime Permissions (API23+)
- **First Version:** 1.0.3 | **Last Version:** 1.0.91
- **Pattern:** checkSelfPermission + requestPermissions
- **Callback:** PERM_REQ=1001 (onRequestPermissionsResult)
- **Total Permissions:** 15 dangerous permissions
- **Connects to HTML via:** JS bridge: permissionResult (C023)
- **Worked Well:** Comprehensive handling across API levels
- **Issues:** API33 NEARBY_WIFI_DEVICES permission denied (E009)
- **Solution:** Revert to proven v1.0.3 pattern + neverForLocation flag (BP006, BP007, BP013)

### 15 Permissions by API Level
| Permission | API Added | Use Case |
|------------|-----------|----------|
| ACCESS_FINE_LOCATION | 23 | GPS, Wi-Fi scan, RTT |
| ACCESS_COARSE_LOCATION | 23 | Wi-Fi scan fallback |
| ACCESS_BACKGROUND_LOCATION | 29 | Background GPS trail |
| ACCESS_WIFI_STATE | 23 | Wi-Fi scan results |
| CHANGE_WIFI_STATE | 23 | Wi-Fi Direct broadcast |
| NEARBY_WIFI_DEVICES | 33 | Wi-Fi scan (API33+) |
| BLUETOOTH_SCAN | 31 | BLE scanning |
| BLUETOOTH_CONNECT | 31 | BT device connect |
| BLUETOOTH_ADVERTISE | 31 | BT advertising |
| WAKE_LOCK | 23 | Background trail |
| INTERNET | 1 | Update check, GitHub API |
| ACCESS_NETWORK_STATE | 1 | Network awareness |
| CHANGE_NETWORK_STATE | 23 | Wi-Fi Direct |
| CAMERA | 33 | Future AR (planned) |
| RECORD_AUDIO | 33 | Future voice (planned) |

### Proven v1.0.3 Pattern (BP006)
```java
// Delayed request to avoid startup dialog
handler.postDelayed(() -> {
    if (checkSelfPermission(perm) != GRANTED) {
        requestPermissions(new String[]{perm}, PERM_REQ);
    }
}, 100);  // BP007: 100ms delay
```

---

## PIECE 07 SUMMARY
This piece covers SSID Broadcast (4-slot rotating, fixed 5.1s duty cycle with Bonjour fallback), FAA METAR Codes (static aviation weather reference in Slot 3 and Legend panel), and Runtime Permissions (15 permissions, proven v1.0.3 pattern with delayed request, API33 NEARBY_WIFI_DEVICES fix). The permission system is comprehensive and handles all API levels 23-33+.

**Next Piece (08):** Positioning Algorithm Integration — Multi-Algo Fusion
---

# Android_Main_Features_Radio_Positioning — Piece 08/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 08 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## MULTI-ALGORITHM FUSION — 6 ALGOS PARALLEL (v1.0.90 → v1.0.91)

### Multi-Algorithm Fusion
- **First Version:** 1.0.90 | **Last Version:** 1.0.91
- **Class:** MainActivity (positioning engine)
- **Algorithms (6 total):**
  1. RSSI Kalman Filter (1D) — per-AP/device smoothing
  2. Trilateration (WLS) — multi-AP position + GDOP
  3. EKF (2D CV) — position + velocity + prediction
  4. Particle Filter (SIR) — non-Gaussian, multimodal
  5. Zone HMM (Viterbi) — discrete zone classification
  6. RTT Ranging (stub) — sub-meter (when implemented)
- **Execution:** Parallel in positioning loop
- **Output:** Best available position per algorithm
- **Fusion:** No weighted fusion yet (planned RF030)
- **Worked Well:** Redundancy — if one fails, others work
- **Issues:** No adaptive weighting by algorithm confidence
- **Solution:** Adaptive weighting by GDOP, particle variance, EKF covariance (RF030)

### Positioning Loop (Simplified)
```java
// Every scan cycle (~2-5s)
void runPositioning() {
    // 1. Get fresh RSSI scans (Wi-Fi + BT)
    // 2. Update RSSI Kalman filters (per source)
    // 3. Run Trilateration (if 3+ APs known)
    // 4. Run EKF predict/update (if Trilateration available)
    // 5. Run Particle Filter (if AP params known)
    // 6. Run Zone HMM (always)
    // 7. Push ALL results to HTML via JS bridge
    // 8. HTML selects/displays best available
}
```

### Algorithm Outputs to HTML
| Algorithm | JS Bridge | HTML Display |
|-----------|-----------|--------------|
| RSSI Kalman | onBtResult3D (filtered) | Smoothed BT positions |
| Trilateration | onApPositionUpdate | AP + vehicle position |
| EKF | onApPositionUpdate | Predicted position + velocity |
| Particle Filter | onApPositionUpdate | Non-Gaussian position |
| Zone HMM | onZoneUpdate | IMMEDIATE/NEAR/FAR |
| RTT | (stub) | Sub-meter when ready |

---

## AP POSITION ESTIMATION — SELF-CALIBRATION (v1.0.81 → v1.0.91)

### AP Position Estimation
- **First Version:** 1.0.81 | **Last Version:** 1.0.91
- **Status:** PARTIAL — random init → refined
- **Class:** MainActivity + Trilateration
- **Problem:** AP positions unknown initially (chicken-egg)
- **v1.0.81:** Random initialization
- **v1.0.90:** Refinement via movement + trilateration
- **Connects to HTML via:** onApPositionUpdate (C027)
- **Worked Well:** Positions converge with movement
- **Issues:** Random initial positions cause poor early trilateration
- **Solution:** Self-calibration learning (P0-03, FP002, RF005)

### Self-Calibration Approach (Planned)
```
1. Start with GPS position (when available)
2. For each new AP seen:
   - Record RSSI at known GPS positions
   - Solve for AP position via multilateration
3. Use refined AP positions for future trilateration
4. Continuously update with new observations
5. GDOP weighting for quality
```

---

## ANDROID ARCHITECTURE — GOD CLASS (v1.0.0 → v1.0.91)

### MainActivity.java — God Class (1416 lines)
- **First Version:** 1.0.0 (160 lines) | **Last Version:** 1.0.91 (1416 lines)
- **Growth:** 8.8x over 91 versions
- **Responsibilities:**
  - All radio scanning (Wi-Fi, BT, Wi-Fi Direct)
  - GPS + sensor fusion
  - All 6 positioning algorithms
  - Wake lock management
  - SSID broadcast duty cycle
  - Permission handling (15 perms)
  - JS bridge (30+ methods)
  - Build integration
- **Anti-Pattern:** CP015 — God class, hard to maintain/test
- **Refinement:** RF001 — Split into Services (P1-03, target v1.0.95)

### Proposed Split (RF001)
```
MainActivity (UI controller only)
├── ScanningService          # Wi-Fi, BT, Wi-Fi Direct
├── PositioningEngine        # All 6 algorithms
├── BroadcastService         # SSID 4-slot + Bonjour
├── TrailService             # GPS trail + wake lock
└── BridgeController         # JS bridge methods
```

---

## PIECE 08 SUMMARY
This piece covers the 6-algorithm multi-algo fusion (parallel execution, no weighted fusion yet — RF030), AP Position Estimation (partial, random init → refined, self-calibration P0-03), and the MainActivity God Class (1416 lines, CP015, split planned RF001). The architecture needs refactoring but the algorithm redundancy provides robustness.

**Next Piece (09):** Error Patterns — JAVA_HOME, sdkmanager, License EPIPE
---

# Android_Main_Features_Radio_Positioning — Piece 09/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 09 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## REPEATED ERROR PATTERNS — BUILD ENVIRONMENT

### E001: JAVA_HOME Invalid (Every Session)
- **Error:** `JAVA_HOME is set to an invalid directory`
- **Frequency:** Every session (sandbox reset)
- **Root Cause:** Cloud environment resets wipe Java installation
- **Solution:** `export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64` in every session
- **Time Lost:** High
- **Best Practice:** Always export before any build command

### E002: sdkmanager Not Found (Every Session)
- **Error:** `sdkmanager: command not found`
- **Frequency:** Every session
- **Root Cause:** cmdline-tools not at `latest/` subdirectory
- **Solution:** `mv cmdline-tools/cmdline-tools cmdline-tools/latest`
- **Time Lost:** High
- **Critical:** Hardcoded path requirement in build scripts

### E003: License Acceptance EPIPE (Every Session)
- **Error:** `yes | sdkmanager --licenses` fails with EPIPE
- **Frequency:** Every session
- **Root Cause:** sdkmanager closes stdin during license acceptance
- **Solution 1:** `printf 'y\ny\ny\ny\ny\ny\ny\ny\n' | sdkmanager --licenses`
- **Solution 2 (Faster):** License hash bypass
  ```bash
  echo "8933bad161af4178b1185d1a37fbf41ea5269c55" > \
    $ANDROID_HOME/licenses/android-sdk-license
  ```

---

## REPEATED ERROR PATTERNS — GRADLE (v1.0.80-1.0.85)

### E004: AGP 8.2 Incompatibility
- **Error:** `Could not resolve all files for configuration — checkDebugAarMetadata`
- **Versions:** 1.0.80-1.0.85
- **Root Cause:** AGP 8.2 breaks with Gradle 8.4+
- **Solution:** Pin to AGP 8.1.0 + Gradle 8.4 (stable)
- **Time Lost:** High

### E005: Unresolved Reference: components
- **Error:** `Unresolved reference: components`
- **Versions:** 1.0.80-1.0.85
- **Root Cause:** Importing non-existent package
- **Solution:** Remove unused imports
- **Time Lost:** Low

### E006: Theme.Material.NoActionBar Crash
- **Error:** `Theme.Material.NoActionBar` crash on launch
- **Versions:** 1.0.80-1.0.85
- **Root Cause:** AppCompatActivity without appcompat dependency
- **Solution:** Use plain `Activity()` with `@android:style/Theme.Material.NoActionBar`
- **Time Lost:** High

### E007: APK Installs But Immediately Closes
- **Error:** APK installs but crashes immediately
- **Versions:** 1.0.80-1.0.85
- **Root Causes (3):**
  1. Theme resource not found
  2. Missing adaptive icon
  3. Crash in onCreate before setContentView
- **Solution:** Use `@android:style/Theme.Material.NoActionBar` + create adaptive icon XML + call setContentView first
- **Time Lost:** High

### E008: Manifest Merger Failed — Icon Not Found
- **Error:** `Manifest merger failed — android:icon not found`
- **Versions:** 1.0.80-1.0.85
- **Root Cause:** `@mipmap/ic_launcher` referenced but no icon files
- **Solution:** Create adaptive icon XML in `res/mipmap-anydpi-v26/ic_launcher.xml`
- **Time Lost:** Medium

---

## REPEATED ERROR PATTERNS — RUNTIME (v1.0.80-1.0.85)

### E009: Wi-Fi Scan Returns No Results (API33+)
- **Error:** `WifiManager startScan() returns no results`
- **Versions:** 1.0.80-1.0.85
- **Root Cause:** API33 NEARBY_WIFI_DEVICES permission missing
- **Solution:** Add NEARBY_WIFI_DEVICES with neverForLocation flag
- **Time Lost:** High
- **Best Practice:** BP006 (revert to v1.0.3 pattern)

---

## PIECE 09 SUMMARY
This piece documents the top repeated error patterns: Build environment (JAVA_HOME, sdkmanager path, license EPIPE — every session), Gradle/AGP issues (v1.0.80-1.0.85, fixed by pinning AGP 8.1.0), Theme/icon crashes (fixed by using plain Activity + adaptive icons), and API33 Wi-Fi permission (NEARBY_WIFI_DEVICES). These errors consumed significant time and their solutions are now codified in best practices.

**Next Piece (10):** Runtime Errors — BT Scan Death, EKF Bug, OOM, Trail Noise
---

# Android_Main_Features_Radio_Positioning — Piece 10/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 10 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## REPEATED ERROR PATTERNS — BLUETOOTH & POSITIONING

### E010: Bluetooth LE Scan Dies (~10 Seconds)
- **Error:** `Bluetooth LE scan dies after ~10 seconds`
- **Versions:** 1.0.48-1.0.64
- **Frequency:** Every run
- **Root Cause:** Android kills continuous BLE scan to save battery
- **Solution:** Restart scan every 5s with Handler.postDelayed (v1.0.65)
- **Time Lost:** High
- **Best Practice:** BP008 — 5s restart cycle mandatory
- **Anti-Pattern:** CP005 — Scan without restart cycle

### E011: EKF Velocity vy Not Initialized
- **Error:** `EkF velocity vy not initialized (x[2]=0; x[2]=0;)`
- **Versions:** 1.0.90-1.0.91
- **Frequency:** Every run
- **Root Cause:** Copy-paste typo in PositionEKF.java:38
- **Solution:** Change second `x[2]=0` to `x[3]=0` (v1.0.92)
- **Time Lost:** Medium
- **Critical:** P0-01 — ALWAYS verify array indices
- **Anti-Pattern:** CP008 — Array index typo

### E012: OutOfMemoryError — WebGL Context Lost
- **Error:** `OutOfMemoryError: WebGL context lost`
- **Versions:** 1.0.49-1.0.53 (trail recording)
- **Root Cause:** Three.js geometry/material not disposed on rebuild
- **Solution:** Add `geometry.dispose() + material.dispose()` on rebuild (v1.0.54)
- **Time Lost:** High
- **Best Practice:** BP016 — GPU-safe disposal
- **Anti-Pattern:** CP009 — Not disposing Three.js objects

### E013: Trail Recording Creates Noisy Path
- **Error:** `Trail recording creates noisy path when stationary`
- **Versions:** 1.0.49-1.0.55
- **Frequency:** Every run
- **Root Cause:** GPS records 0-speed points (zero-fix)
- **Solution:** Only record when speed > 1mph (v1.0.56)
- **Time Lost:** Medium
- **Best Practice:** BP010 — Speed threshold filter
- **Anti-Pattern:** CP010 — Trail without speed threshold

---

## REPEATED ERROR PATTERNS — BUILD & BRIDGE

### E014: aapt2 Link Fails — Resource Not Found
- **Error:** `aapt2 link fails: resource not found`
- **Versions:** 1.0.0-1.0.91 (occasional)
- **Root Cause:** Missing res/ directories or wrong paths
- **Solution:** Verify res/ structure matches AndroidManifest
- **Time Lost:** Medium

### E016: WebView JavaScript Bridge Silent Failures
- **Error:** `WebView JavaScript bridge silent failures`
- **Versions:** 1.0.0-1.0.51
- **Frequency:** Frequent
- **Root Cause:** No try/catch on evaluateJavascript
- **Solution:** Add try/catch + window.onerror handler (v1.0.52)
- **Time Lost:** High
- **Best Practice:** BP015 — HTML try/catch wrapper mandatory
- **Anti-Pattern:** CP012 — No error handling on JS bridge calls

---

## REPEATED ERROR PATTERNS — TIMING & WI-FI DIRECT

### E017: SSID Broadcast Timing Drift
- **Error:** `SSID broadcast timing drift`
- **Versions:** 1.0.13-1.0.19
- **Frequency:** Every run
- **Root Cause:** Handler.postDelayed accumulation
- **Solution:** Fixed 5.1s duty cycle with single timer (v1.0.20)
- **Time Lost:** Medium
- **Best Practice:** BP012 — Fixed duty cycle

### E018: Wi-Fi Direct Group Owner Creation Fails
- **Error:** `Wi-Fi Direct Group Owner creation fails`
- **Versions:** 1.0.13
- **Frequency:** Few
- **Root Cause:** Single method (WifiP2pConfig.Builder)
- **Solution:** Multi-method fallback: Builder → Reflection → Bonjour (v1.0.14)
- **Time Lost:** Medium
- **Best Practice:** BP011 — Multi-method fallback
- **Anti-Pattern:** CP007 — Single-method Wi-Fi Direct

---

## PIECE 10 SUMMARY
This piece covers runtime errors: BT scan death (fixed by 5s restart cycle BP008), EKF vy bug (copy-paste typo, fixed v1.0.92 P0-01), OOM from Three.js (fixed by GPU disposal BP016), noisy GPS trail (fixed by speed > 1mph BP010), aapt2 resource issues, WebView bridge silent failures (fixed by try/catch BP015), SSID timing drift (fixed by fixed cycle BP012), and Wi-Fi Direct failures (fixed by multi-method fallback BP011). Each error has a documented solution now in the codebase.

**Next Piece (11):** GPS Zero-Fix, Azimuth Wrap, Gradle Java, Permissions Denied
---

# Android_Main_Features_Radio_Positioning — Piece 11/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 11 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## REPEATED ERROR PATTERNS — GPS & SENSORS

### E019: GPS Speed Zero When Stationary (Zero-Fix)
- **Error:** `GPS speed shows 0 when stationary (zero-fix)`
- **Versions:** 1.0.4-1.0.26
- **Frequency:** Every run
- **Root Cause:** GPS provider returns 0 speed when stationary
- **Solution:** Speed threshold > 1mph for trail recording (v1.0.27)
- **Time Lost:** Low
- **Note:** Expected GPS behavior, not a bug — filter it

### E020: Azimuth Wrap-Around at 0/360 Boundary
- **Error:** `Azimuth wrap-around at 0/360 boundary`
- **Versions:** 1.0.25-1.0.91
- **Frequency:** Every run
- **Root Cause:** Sensor orientation jumps 359→0 degrees
- **Solution:** Add wrap handling: if diff > 180, adjust by 360 (v1.0.25)
- **Time Lost:** Medium
- **Best Practice:** BP007 — Standard sensor fusion fix

---

## REPEATED ERROR PATTERNS — GRADLE JAVA & R CLASS

### E021: Gradle Cannot Find Java
- **Error:** `Gradle cannot find Java`
- **Versions:** 1.0.80-1.0.85
- **Frequency:** Multiple
- **Root Cause:** JAVA_HOME not exported before Gradle
- **Solution:** `export JAVA_HOME` before `gradlew`
- **Time Lost:** Medium

### E022: Unresolved Reference: R (Generated)
- **Error:** `Unresolved reference: R (generated)`
- **Versions:** 1.0.80-1.0.85
- **Frequency:** Occasional
- **Root Cause:** aapt2 link didn't generate R.java
- **Solution:** Verify aapt2 link --java output dir
- **Time Lost:** Low

---

## REPEATED ERROR PATTERNS — PERMISSIONS (API31+)

### E023: Bluetooth Permissions Denied (API31+)
- **Error:** `Bluetooth permissions denied on API31+`
- **Versions:** 1.0.48-1.0.91
- **Frequency:** Every run
- **Root Cause:** Missing BLUETOOTH_SCAN/CONNECT/ADVERTISE
- **Solution:** Add all three modern BT permissions
- **Time Lost:** High
- **Best Practice:** BP013 — Comprehensive permissions (15 total)

### E024: Background Location Permission Denied
- **Error:** `Background location permission denied`
- **Versions:** 1.0.29-1.0.91
- **Frequency:** Every run
- **Root Cause:** Missing ACCESS_BACKGROUND_LOCATION
- **Solution:** Add permission for API29+
- **Time Lost:** High

---

## REPEATED ERROR PATTERNS — BUILD TOOLS MISSING

### E025: zipalign Command Not Found
- **Error:** `zipalign: command not found`
- **Versions:** 1.0.0-1.0.91
- **Frequency:** Every session
- **Root Cause:** build-tools not installed or wrong version
- **Solution:** `sdkmanager "build-tools;33.0.1"`
- **Time Lost:** High

### E026: apksigner Command Not Found
- **Error:** `apksigner: command not found`
- **Versions:** 1.0.0-1.0.91
- **Frequency:** Every session
- **Root Cause:** build-tools not installed
- **Solution:** `sdkmanager "build-tools;33.0.1"`
- **Time Lost:** High

---

## PIECE 11 SUMMARY
This piece covers GPS zero-fix (expected behavior, filter with speed threshold), azimuth wrap-around (standard sensor fusion fix), Gradle Java/R class issues (export JAVA_HOME first), Bluetooth permissions (API31+ requires 3 new perms), background location (API29+), and build tools missing (zipalign/apksigner — install build-tools;33.0.1). The permission patterns are now comprehensive (15 total, BP013).

**Next Piece (12):** Minor Errors — BT Name, CatmullRom Points, Bloom Mobile, Platform Jar
---

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
---

# Android_Main_Features_Radio_Positioning — Piece 13/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 13 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## ANDROID MAIN FEATURES — COMPLETE SUMMARY

### Feature Inventory (21 Tracked Features)

| # | Feature | First Ver | Last Ver | Category | Status |
|---|---------|-----------|----------|----------|--------|
| 1 | Wi-Fi Scanning | 1.0.3 | 1.0.91 | Radio | Complete |
| 2 | Wi-Fi Direct GO | 1.0.13 | 1.0.91 | Radio | Complete |
| 3 | BLE Scanning | 1.0.48 | 1.0.91 | Radio | Complete |
| 4 | GPS Tracking | 1.0.4 | 1.0.91 | Positioning | Complete |
| 5 | Sensor Fusion | 1.0.25 | 1.0.91 | Positioning | Complete |
| 6 | Wake Lock | 1.0.63 | 1.0.91 | System | Complete |
| 7 | WebView + JS Bridge | 1.0.0 | 1.0.91 | Architecture | Complete |
| 8 | Auto-Update | 1.0.91 | 1.0.93 | System | Moved to TGAPP |
| 9 | Debug Keystore | 1.0.0 | 1.0.91 | Build | Complete |
| 10 | No-Gradle Build | 1.0.0 | 1.0.91 | Build | Complete |
| 11 | RSSI Kalman (1D) | 1.0.79 | 1.0.91 | Positioning | Complete |
| 12 | Trilateration (WLS) | 1.0.81 | 1.0.91 | Positioning | Complete |
| 13 | EKF (2D CV) | 1.0.90 | 1.0.91 | Positioning | Bug Fixed v1.0.92 |
| 14 | Particle Filter (SIR) | 1.0.90 | 1.0.91 | Positioning | Complete |
| 15 | Zone HMM (Viterbi) | 1.0.90 | 1.0.91 | Positioning | Complete |
| 16 | Wi-Fi RTT | 1.0.81 | 1.0.91 | Positioning | Stub Only (P0-02) |
| 17 | BT 3D Spatial | 1.0.86 | 1.0.91 | Positioning | Complete |
| 18 | Trail Recording | 1.0.49 | 1.0.91 | Visualization | Complete |
| 19 | FAA METAR | 1.0.64 | 1.0.91 | Reference | Complete |
| 20 | Runtime Permissions | 1.0.3 | 1.0.91 | System | Complete |
| 21 | SSID Broadcast | 1.0.22 | 1.0.91 | Radio | Complete |

---

## CROSS-REFERENCES TO OTHER SECTIONS

| Section | Connection | Details |
|---------|------------|---------|
| **Sec 1: HTML Aspects** | JS Bridge | 30 connections mapped (Sec 3) |
| **Sec 3: Connections** | C001-C030 | Android→HTML: 13, HTML→Android: 12, Bidirectional: 2 |
| **Sec 4: SDK/Tools** | Build | build.sh uses aapt2, javac, d8, zipalign, apksigner |
| **Sec 5: Best Practices** | BP001-BP013 | No-Gradle, proven perms, 5s BT restart, conditional wake |
| **Sec 5: Anti-Patterns** | CP001-CP020 | God class, no tests, RTT stub, hardcoded params |
| **Sec 6: Errors** | E001-E030 | 30 errors documented with fixes |
| **Sec 7: Future** | FP001-FP030 | RTT, self-calibration, tests, services, mesh |
| **Sec 8: TGAPP** | TG001-TG032 | Update delivery, premium features, fleet mesh |
| **Sec 9: Working Features** | WF001-WF030 | Feature evolution history |
| **Sec 10: Refinements** | RF001-RF030 | Split MainActivity, implement RTT, adaptive params |
| **Sec 11: Future Thoughts** | FT001-FT030 | Architecture, network, AI, standards, privacy |

---

## KEY METRICS

| Metric | Value |
|--------|-------|
| **MainActivity Lines (v1.0.91)** | 1,416 |
| **MainActivity Lines (v1.0.0)** | 160 |
| **Growth** | 8.85x |
| **Total Permissions** | 15 (API23-33+) |
| **Positioning Algorithms** | 6 (5 working + 1 stub) |
| **JS Bridge Methods** | 30+ |
| **Build Time (No-Gradle)** | ~4 seconds |
| **APK Size (v1.0.91)** | 230,826 bytes |
| **Wake Lock** | Conditional (trail only) |
| **BT Scan Restart** | 5s cycle (mandatory) |
| **SSID Broadcast** | 4-slot, 5.1s/slot |
| **Trail Points Max** | 2000 (FIFO) |
| **BT 3D Points** | 50 active / 100 global |

---

## CRITICAL LESSONS LEARNED

1. **No-Gradle aapt2 Pipeline** — 4s builds vs minutes, transparent, reproducible (BP001)
2. **Proven v1.0.3 Permission Pattern** — Delayed request + handler, handles all API levels (BP006, BP007)
3. **5s Bluetooth Scan Restart** — Mandatory, Android kills continuous scan (BP008, E010)
4. **Conditional Wake Lock** — Only when trail active, prevents battery drain (BP010)
5. **Multi-Method Wi-Fi Direct Fallback** — Builder → Reflection → Bonjour (BP011)
6. **Fixed 5.1s SSID Duty Cycle** — Single timer, no drift accumulation (BP012)
7. **Comprehensive Permissions (15)** — Handle API23/29/31/33+ differences (BP013)
8. **EKF Array Index Bug** — Copy-paste typo, ALWAYS verify indices (CP008, P0-01)
9. **God Class MainActivity** — 1416 lines, split into Services planned (RF001, CP015)
10. **Zero Unit Tests** — Unverified algorithms, regressions in production (CP016, P1-02)

---

## FILE LOCATIONS

| File | Purpose |
|------|---------|
| `Android_Main_Features_Spreadsheet.csv` | 21 features × 12 columns |
| `MainActivity.java` | 1416 lines (God class) |
| `RssiKalmanFilter.java` | 1D Kalman filter |
| `Trilateration.java` | Weighted LS + GDOP |
| `PositionEKF.java` | 2D CV EKF (bug fixed v1.0.92) |
| `ParticleFilter.java` | SIR 200 particles |
| `ZoneHMM.java` | Viterbi 3-state |
| `WifiRttRanging.java` | RTT stub (P0-02) |
| `build.sh` | 109 lines, No-Gradle pipeline |
| `forensic/source/v*/MainActivity.java` | Historical versions (91) |

---

## PIECE 13 SUMMARY
This final piece provides the complete feature inventory (21 tracked), cross-reference matrix to all 12 other sections, key metrics (1,416 lines, 8.85x growth, 6 algorithms, 4s builds), critical lessons learned (10 hard-won principles), and file locations. The Android layer evolved from 160 lines (v1.0.0) to 1,416 lines (v1.0.91) — an 8.85x growth — while maintaining a stable No-Gradle build, comprehensive permissions, and robust radio scanning with mandatory 5s BT restart cycles.

---

**END OF SECTION 2: ANDROID MAIN FEATURES — RADIO POSITIONING**
*13 pieces covering: Wi-Fi/BT/GPS/Sensors → Wake Lock/JS Bridge/Update/Keystore/Build → RSSI Kalman/Trilateration/EKF/Particle/HMM → RTT/BT 3D/Trail/METAR/Perms → Multi-Algo Fusion/AP Estimation/God Class → Error Patterns (Build/Gradle/Runtime) → Error Patterns (BT/EKF/OOM/Trail) → Error Patterns (GPS/Sensors/Gradle/Perms/Build) → Minor Errors/Feature Matrix → Summary/Cross-Refs*

*Next: Section 3 — Connection Pathways (article3_A3-03)*
---

