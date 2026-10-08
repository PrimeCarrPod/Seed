# Working_Features_Versions_History — Piece 03/13
## Article A9: A9-09 — Working Features Versions History
**Piece:** 03 of 13  
**Generated:** 2026-10-08 15:28:33 UTC

---

# Positioning Features Part 1: GPS, Sensor Fusion, 3D Visualization Foundation

## 3.1 WF004 — GPS Tracking (Positioning)

**Category:** Positioning | **First Working:** v1.0.4 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~80 | **Key Files:** `MainActivity.java` | **Dependencies:** `LocationManager`, `ACCESS_FINE_LOCATION`, `ACCESS_COARSE_LOCATION`, `WAKE_LOCK`

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.4 | Basic GPS with `LocationManager.requestLocationUpdates()` | +40 |
| v1.0.27 | Speed threshold: ignore updates < 1 mph (stationary filter) | +20 |
| v1.0.63 | Wake lock acquisition for background GPS continuity | +30 |
| v1.0.90 | Altitude in feet + accuracy circle rendering | +20 |

### Known Limitations
- **Zero-fix stationary**: Reports last known location when GPS loses fix
- Cold start TTFF 30-60s; warm start 5-10s
- Battery drain significant without wake lock optimization

### Next Planned Enhancement
**RTT Fusion** — Fuse GPS + Wi-Fi RTT for indoor/outdoor seamless positioning

---

## 3.2 WF005 — Sensor Fusion (Accel+Mag+Gyro) (Positioning)

**Category:** Positioning | **First Working:** v1.0.25 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~120 | **Key Files:** `MainActivity.java` | **Dependencies:** `SensorManager`, `Sensor.TYPE_ACCELEROMETER`, `TYPE_MAGNETIC_FIELD`, `TYPE_GYROSCOPE`

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.25 | Basic complementary filter fusion (accel+mag for orientation) | +60 |
| v1.0.25 | Low-pass filter on accelerometer (α=0.8) for gravity separation | +20 |
| v1.0.86 | Orientation quaternion for BT 3D spatial azimuth/elevation | +40 |

### Known Limitations
- **Azimuth wrap**: 360°→0° transition handled but causes momentary jump
- Magnetic interference from vehicle/beacon hardware (hard iron distortion)
- Gyro drift accumulates ~1°/min without magnetometer correction

### Next Planned Enhancement
**UWB Fusion (P3-02)** — Ultra-wideband ranging for cm-level relative positioning

---

## 3.3 WF006 — 3D Visualization (Three.js) (Visualization)

**Category:** Visualization | **First Working:** v1.0.0 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~2,200 | **Key Files:** `bounce.html` | **Dependencies:** Three.js r128 (local), Chart.js (local), OrbitControls

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.0 | Basic scene: sphere + grid + orbit camera | +303 |
| v1.0.50 | Post-processing: bloom + FXAA + tone mapping | +200 |
| v1.0.62 | CatmullRom spline trail system (GPU-safe disposal) | +250 |
| v1.0.86 | **BT 3D Spatial**: beacon spheres + trajectories + Theory mode | +500 |

### Architecture: bounce.html Module Structure
```javascript
// Core modules (v1.0.91 ~770 lines)
const BOUNCE = {
  scene: null,           // Three.js Scene
  camera: null,          // PerspectiveCamera + OrbitControls
  renderer: null,        // WebGLRenderer (antialias, alpha)
  vehicle: null,         // TardigradeSphere (WF007)
  beacons: [],           // Beacon spheres (WF008, WF010)
  trails: [],            // CatmullRom trails (WF009)
  hud: null,             // HUD panels (WF018)
  charts: null,          // Chart.js metrics (WF027)
  algorithms: {          // Positioning algorithm visualization
    trilateration: { circles: [], intersection: null },
    ekf: { ellipse: null, velocity: null },
    particle: { particles: [] },
    hmm: { zones: [], path: [] }
  }
};
```

### Known Limitations
- **Mobile GPU limits**: >500 trail points causes frame drops on mid-tier devices
- Three.js r128 pinned; r150+ breaking changes in `BufferGeometry` API
- No WebXR/AR integration yet

### Next Planned Enhancement
**AR Overlay (P3-04)** — WebXR AR session with camera passthrough + beacon anchors

---

## 3.4 Positioning → Visualization Data Contract

The Android↔HTML bridge (WF003 Connection Pathways) passes structured JSON:

```javascript
// From MainActivity.java → bounce.html via evaluateJavascript()
{
  "type": "POSITION_UPDATE",
  "timestamp": 1703275200000,
  "gps": { "lat": 37.7749, "lon": -122.4194, "alt": 15.2, "acc": 5.0, "spd": 0.3 },
  "fusion": { "yaw": 1.57, "pitch": 0.02, "roll": -0.01 },
  "algorithms": {
    "trilateration": { "x": 10.2, "y": -5.1, "gdop": 1.8 },
    "ekf": { "x": 10.1, "y": -5.0, "vx": 0.2, "vy": -0.1, "P": [[...]] },
    "particle": { "particles": [[x,y,w], ...], "mean": [10.15, -5.05] },
    "hmm": { "zone": 2, "path": [1,2,2,3], "confidence": 0.87 }
  },
  "ble": [ { "mac": "aa:bb:cc:dd:ee:ff", "rssi": -62, "kalman": -61.5, "dist": 3.2 }, ... ],
  "wifi": [ { "bssid": "aa:bb:cc:dd:ee:ff", "rssi": -55, "dist": 8.1 }, ... ]
}
```

---

*End of Piece 03 — Continue to Piece 04 for Visualization Features Deep-Dive*