# Forensic_Analysis_Data_91_Versions — Piece 04/13
## Article A12: A12-12 — Forensic Analysis Data 91 Versions
**Piece:** 04 of 13  
**Generated:** 2026-10-08 22:14:32 UTC

---

# Version-by-Version Analysis: v1.0.0 — v1.0.25 (Foundation to Sensor Fusion)

## v1.0.0 — Initial Release
- **Zip**: 228,114 bytes | **APK**: 185,687 bytes
- **MainActivity**: 160 lines | **HTML**: 303 lines | **build.sh**: 112 lines
- **Features**: Wi-Fi scan → JS bridge → Three.js basic scene
- **Permissions**: ACCESS_WIFI_STATE, CHANGE_WIFI_STATE, INTERNET, ACCESS_FINE_LOCATION
- **Architecture**: Single Activity, WebView + JavaScriptInterface

## v1.0.1 — Wi-Fi Results Parsing
- **Changes**: MainActivity +3/-2, HTML +30/-2, build.sh +3/-2
- **Fix**: ScanResult parsing, frequency/channel mapping
- **HTML**: Added basic beacon marker rendering

## v1.0.2 — HTML Refactor
- **Changes**: MainActivity +2/-1, HTML +117/-146 (major restructure)
- **HTML**: Modularized Three.js setup, added OrbitControls
- **build.sh**: Minor version bump

## v1.0.3 — Real Wi-Fi Scanning Implementation ★ MAJOR
- **MainActivity**: +161/-6 lines (154 net new)
- **Key additions**:
  - `WifiScanner` class with `ScanCallback`
  - Active/passive scan modes
  - RSSI filtering (min -90 dBm)
  - Scan throttling (2s minimum interval)
- **HTML**: +38/-6 (beacon position calculation)
- **Manifest**: +6 permissions (FOREGROUND_SERVICE, ACCESS_BACKGROUND_LOCATION)

## v1.0.4 — Trilateration Engine
- **MainActivity**: +83/-50
- **New**: `Trilateration.java` - 3-point RSSI to position
- **Algorithm**: Linear least squares (overdetermined)
- **HTML**: Beacon position display, accuracy circle

## v1.0.5 — Permission Refactor
- **MainActivity**: +82/-14
- **Runtime permissions**: requestPermissions() flow
- **Android 10+**: ACCESS_FINE_LOCATION for Wi-Fi scan
- **Manifest**: +3 permission declarations

## v1.0.6 — WebView Hardening
- **MainActivity**: +13/-3
- **HTML**: +50/-5 (trail rendering with Catmull-Rom splines)
- **WebView**: setWebContentsDebuggingEnabled(false), clearCache()

## v1.0.7 — Stabilization
- **Changes**: Minimal (HTML +2/-1)
- **Focus**: Crash fixes, ANR prevention

## v1.0.8 — Scan Optimization
- **HTML**: +19/-3
- **Scan caching**: 500ms debounce
- **Battery**: Wi-Fi lock optimization

## v1.0.9 — Beacon Filtering
- **MainActivity**: +12/-3
- **HTML**: +21/-2
- **Filter**: SSID prefix "Bounce_" + MAC OUI validation

## v1.0.10 — Error Handling
- **MainActivity**: +4/-11 (cleanup)
- **HTML**: +7/-13
- **Try/catch**: WebView evaluateJavascript, scan callbacks

## v1.0.11 — Minor Polish
- **Changes**: +2/-1 Java, +6/-2 HTML

## v1.0.12 — Version 1.0.12
- **Changes**: +2/-1 Java

## v1.0.13 — Build Update
- **MainActivity**: +44/-11 (22 net)
- **build.sh**: +3/-2
- **Gradle**: 7.4 → 7.5, compileSdk 31 → 32

## v1.0.14 — UI Polish
- **MainActivity**: +6/-0
- **HTML**: Minor

## v1.0.15 — Sensor Framework ★
- **MainActivity**: +31/-0 (31 new sensor lines)
- **New**: `SensorManager` registration, `SensorEventListener`
- **Sensors**: TYPE_ACCELEROMETER, TYPE_GYROSCOPE, TYPE_MAGNETIC_FIELD
- **Rate**: SENSOR_DELAY_GAME (20ms)

## v1.0.16 — Sensor Integration
- **MainActivity**: +18/-0
- **Sensor fusion**: Complementary filter (accel + mag → orientation)
- **Low-pass filter**: α = 0.8 for noise reduction

## v1.0.17 — Gyro Integration
- **MainActivity**: +20/-0
- **Gyro**: Rotation vector integration for heading
- **Drift correction**: Magnetometer fusion every 500ms

## v1.0.18 — Sensor Manager Refactor ★
- **MainActivity**: +72/-0 (591 lines)
- **New**: `SensorFusion.java` class
- **Algorithm**: Madgwick filter (quaternion-based)
- **HTML**: Sensor data overlay (pitch/roll/yaw)

## v1.0.19 — Calibration
- **MainActivity**: +0/-0 (591 lines)
- **HTML**: -9 lines (cleanup)
- **Mag calibration**: Figure-8 pattern detection

## v1.0.20 — UI Enhancement
- **MainActivity**: +0/-0
- **HTML**: +16/-0 (sensor debug panel)

## v1.0.21 — Performance
- **MainActivity**: +0/-0
- **build.sh**: APK size 197,975 → 202,071 (+4KB)
- **ProGuard**: Enabled for release

## v1.0.22 — HTML Sensor Display
- **HTML**: +6/-0 (real-time sensor values)

## v1.0.23 — Minor
- **MainActivity**: +2/-1

## v1.0.24 — Sensor Fusion Tuning
- **MainActivity**: +0/-0
- **Madgwick β**: 0.033 → 0.041 (faster convergence)

## v1.0.25 — Sensor Fusion Complete ★ MAJOR MILESTONE
- **MainActivity**: 639 lines (+48 from v1.0.24)
- **HTML**: 461 lines
- **Features**:
  - Full 9-DoF fusion (accel + gyro + mag)
  - Quaternion state representation
  - Gravity vector extraction
  - Linear acceleration isolation
  - Heading stabilization
- **HTML**: Live sensor fusion visualization
- **This version establishes the sensor foundation for all future positioning**

## Summary: v1.0.0 → v1.0.25

| Metric | v1.0.0 | v1.0.25 | Change |
|--------|--------|---------|--------|
| MainActivity | 160 | 639 | +299% |
| HTML | 303 | 461 | +52% |
| APK Size | 185KB | 202KB | +9% |
| Key Algorithms | Trilateration | + Madgwick Fusion | 2 algorithms |
| Sensors | Wi-Fi only | Wi-Fi + 9-DoF IMU | 4 sensors |
| Permissions | 4 | 7 | +3 |

**Architectural Shift**: Single-purpose Wi-Fi scanner → Multi-sensor positioning platform

---