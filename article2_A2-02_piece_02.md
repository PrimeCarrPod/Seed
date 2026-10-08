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