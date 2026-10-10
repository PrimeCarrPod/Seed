# HTML_Aspects_ThreeJS_Visualization — Piece 07/13
## Article A1: A1-01 — HTML Aspects ThreeJS Visualization
**Piece:** 07 of 13  
**Generated:** 2026-10-08 04:00:49 UTC

---

## BLUETOOTH 3D SPATIAL NODES (v1.0.86 → v1.0.91)

### Bluetooth 3D Spatial Nodes
- **First Version:** 1.0.86 | **Last Version:** 1.0.91
- **Concept:** BT devices positioned in 3D space using RSSI + orientation + elevation
- **Visual:** Spheres at computed (x,y,z) + elevation lines + brightness by signal
- **Connects to Android via:** MainActivity→JS: btTrajectories (getTrajectory, getAllDevices)
- **Data:** 50 active points per device / 100 global points max
- **Performance:** Smooth on modern devices, theory mode heavier
- **Worked Well:** Intuitive 3D spatial awareness of nearby BT devices
- **Issues:** Brightness decay tuning, ghost path performance
- **Solution:** Brightness decay 0.98/frame, re-energize 1.5x on new signal

### Position Computation (Android Side)
```java
// MainActivity: btKalmanStates maps MAC → RssiKalmanFilter
// Orientation from sensor fusion (azimuth/pitch/roll)
// Distance from Kalman-filtered RSSI
// Elevation from pitch angle
double x = distance * Math.sin(azimuth) * Math.cos(pitch);
double y = distance * Math.cos(azimuth) * Math.cos(pitch);
double z = distance * Math.sin(pitch); // elevation
```

---

## THEORY MODE — GHOST TRAJECTORIES (v1.0.86 → v1.0.91)

### Theory Mode (Ghost Trajectories)
- **First Version:** 1.0.86 | **Last Version:** 1.0.91
- **Concept:** Render ALL historical BT trajectories (not just current)
- **Toggle:** THEORY button in HUD
- **Implementation:** JS-side trajectory history buffer
- **Max Points:** 100 global points across all devices
- **Visual:** Faded paths showing where devices have been
- **Performance:** Heavy with many devices — limit to 100 global
- **Worked Well:** Reveals movement patterns, "ghost" history
- **Issues:** Performance degrades with many trajectories
- **Solution:** Limit 100 global points, brightness decay 0.98

### Theory Mode Data Flow
```
Android: btTrajectories (Map<String, List<Point3D>>)
  → JS: getAllDevices() returns all trajectories
  → HTML: TheoryMode renders all as faded lines
  → User: Sees "where devices have been" (spatial memory)
```

---

## FLY MODE WAYPOINTS (v1.0.9 → v1.0.91)

### FLY Mode Waypoints
- **First Version:** 1.0.9 | **Last Version:** 1.0.91
- **Concept:** Auto-generated camera tour through all visible nodes
- **Algorithm:** CatmullRom spline through all node positions (Wi-Fi APs + BT devices + vehicle)
- **Trigger:** Auto-starts when entering FLY mode
- **Waypoint Density:** Adaptive spacing (denser near clusters)
- **Performance:** Smooth cinematic tour
- **Worked Well:** Impressive "drone view" of the space
- **Issues:** Waypoint density tuning
- **Solution:** Adaptive spacing based on node clustering

---

## PIECE 07 SUMMARY
This piece covers the breakthrough Bluetooth 3D Spatial Tracking (v1.0.86): computing 3D positions from RSSI + orientation, rendering as spatial nodes with elevation lines and signal-strength brightness. Theory Mode adds "spatial memory" by rendering ghost trajectories. FLY Mode provides auto-generated cinematic tours. These features transform Bounce from a 2D scanner into a 3D spatial awareness tool.

**Next Piece (08):** POV Zoom Buttons + Camera Controls Detail + HUD Polish