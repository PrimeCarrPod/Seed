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