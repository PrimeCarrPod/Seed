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