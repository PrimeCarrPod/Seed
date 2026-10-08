# Refinement Existing Parts Prioritized — Complete Article
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Generated:** 2026-10-08 21:37:59 UTC  
**Structure:** 13 pieces concatenated  
**Target:** ≥350 lines

---

# Refinement_Existing_Parts_Prioritized — Piece 01/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 01 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Overview & Architecture

## 1.1 Executive Summary

This section documents 30 prioritized refinements (RF001–RF030) identified through forensic analysis of 91 BOUNCE Android app versions (v1.0.0 through v1.0.91). The refinements address technical debt, algorithmic correctness, performance bottlenecks, and architectural gaps that have accumulated across 18 months of iterative development.

**Key Statistics:**
- **30 refinements** cataloged across 8 categories
- **Priority distribution:** P0 (Critical) = 5, P1 (High) = 14, P2 (Medium) = 9, R2 (Low/Research) = 2
- **Effort distribution:** High = 6, Medium = 14, Low = 10
- **Target versions:** 1.0.92–1.0.96 (5 release windows)

## 1.2 Forensic Context

The BOUNCE codebase has grown from:
- **v1.0.0:** MainActivity 160 lines, HTML 303 lines
- **v1.0.91:** MainActivity 1,416 lines, HTML 770 lines

This 8.8× code growth without proportional architectural investment has created a "god class" anti-pattern in MainActivity and a monolithic HTML file that impede maintainability, testing, and team scaling.

## 1.3 Critical Findings Driving Refinements

### APK Size Anomalies (5 Flagged Versions)
| Version | Zip Size | APK Size | Root Cause |
|---------|----------|----------|------------|
| v1.0.77 | 45,741 B | 0 B | Build failed — MainActivity 779 lines |
| v1.0.80 | 113,062 B | 0 B | Build failed — MainActivity 1,005 lines |
| v1.0.81 | 14,254 B | 0 B | Build failed — extraction error |
| v1.0.82 | 156,369 B | 45,649 B | Partial build — no HTML assets |
| v1.0.83 | 219,771 B | 45,649 B | Partial build — no HTML assets |

**Lesson:** Build pipeline fragility correlates with code complexity spikes.

### Critical Bug Fixed
- **EKF vy initialization bug** in `PositionEKF.java:38`: `x[2]=0; x[2]=0;` → `x[2]=0; x[3]=0;`
- Fixed in v1.0.92 (pre-built APK exists at `CSMWip/05_BOUNCE/BOUNCE.WIP/v92/out/Bounce-v1.0.92.apk`)
- This is **RF002** — the only P0 item marked **Done**

## 1.4 Refinement Categories

| Category | Refinements | Priority Range |
|----------|-------------|----------------|
| Architecture & Modularity | RF001, RF007, RF017, RF018 | P0–P1 |
| Positioning Algorithms | RF003, RF004, RF005, RF013, RF014 | P0–P1 |
| Build & Release Engineering | RF006, RF021, RF023, RF024, RF025 | P0–P2 |
| Performance & Adaptive Systems | RF010, RF011, RF012, RF016 | P1–P2 |
| Testing & Quality | RF002, RF022 | P0–P1 |
| Visual & UX Polish | RF008, RF009, RF015, RF029, RF030 | P1–P2 |
| Data & Export | RF026, RF028 | P1–P2 |
| Platform Features | RF027 | P1 |

## 1.5 Piece Structure for This Section

| Piece | Focus | Refinements Covered |
|-------|-------|---------------------|
| 01 | **Overview & Architecture** (this piece) | RF001, RF002, RF003 |
| 02 | **Positioning Algorithms Core** | RF004, RF005, RF013, RF014 |
| 03 | **HTML/Three.js Modularization** | RF007, RF008, RF009 |
| 04 | **Adaptive Performance Systems** | RF010, RF011, RF012 |
| 05 | **Visual Effects & Rendering** | RF015, RF016, RF029 |
| 06 | **JS Bridge & Error Handling** | RF018, RF019 |
| 07 | **Build Pipeline & Signing** | RF006, RF021, RF025 |
| 08 | **Testing & CI/CD** | RF022, RF023, RF024 |
| 09 | **Offline & Platform Features** | RF026, RF027 |
| 10 | **Export, Theming & Accessibility** | RF028, RF030 |
| 11 | **Prioritization Matrix & Roadmap** | All (cross-cutting) |
| 12 | **Risk Assessment & Dependencies** | All (cross-cutting) |
| 13 | **Summary & Next Steps** | All (cross-cutting) |

---

*End of Piece 01/13*
---

# Refinement_Existing_Parts_Prioritized — Piece 02/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 02 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Positioning Algorithms Core (RF003–RF005, RF013–RF014)

## 2.1 RF003 — Wi-Fi RTT Ranging Implementation (P0, High Effort)

**Component:** `WifiRttRanging.java` (currently stub only)  
**Issue:** Missing 802.11mc FTM (Fine Timing Measurement) ranging implementation  
**Current State:** Placeholder class with no functional ranging code  
**Proposed Refinement:** Implement full FTM ranging using `WifiRttManager` API (requires API 28+ and hardware support)  

### Technical Specification:
```java
// Required capabilities:
- WifiRttManager.requestRttRanging() with RttManager.RttParams
- Callback handling: onRttResults(), onRttFailure()
- Distance calculation from RTT measurements (round-trip time × c / 2)
- Multi-AP concurrent ranging for trilateration fusion
- Hardware capability check: PackageManager.FEATURE_WIFI_RTT
```

### Dependencies:
- Android 9+ (API 28) device with Wi-Fi RTT hardware
- Location permissions (ACCESS_FINE_LOCATION)
- Wi-Fi enabled and scanning

### Target: v1.0.93 | Status: Planned | Master List Ref: P0-02

---

## 2.2 RF004 — Particle Filter Adaptive Parameters (P1, High Effort)

**Component:** `ParticleFilter.java`  
**Issue:** AP parameters (RSSI mean, variance, path loss exponent) hardcoded — non-adaptive to environment  
**Current State:** Static constants for all access points regardless of physical characteristics  
**Proposed Refinement:** Implement per-AP adaptive parameter estimation from scan history  

### Algorithm:
```java
// Per-AP learning:
- Maintain sliding window of RSSI samples per BSSID
- Estimate mean (μ) and variance (σ²) online using Welford's algorithm
- Estimate path loss exponent (n) via linear regression: RSSI = RSSI_0 - 10n log10(d)
- Update particle weight calculation: w ∝ exp(-(rssi - μ)² / 2σ²)
- Forgetting factor λ = 0.95 for non-stationary environments
```

### Impact:
- Handles non-Gaussian RSSI distributions (multi-path, occlusion)
- Improves indoor accuracy 30–50% in heterogeneous AP environments
- Enables Particle Filter to compete with EKF in complex indoor spaces

### Dependencies: Scan history buffer, RSSI time-series per BSSID
### Target: v1.0.94 | Status: Planned | Master List Ref: P1-01

---

## 2.3 RF005 — Trilateration AP Self-Calibration (P0, High Effort)

**Component:** `Trilateration.java`  
**Issue:** AP positions initialized randomly — poor convergence, wrong positions  
**Current State:** Random AP coordinate assignment on first scan  
**Proposed Refinement:** Implement AP position self-calibration from user movement  

### Algorithm (Gauss-Newton Optimization):
```
1. Collect (position, RSSI) tuples during user movement
2. Formulate: minimize Σ (measured_rssi - predicted_rssi(x_ap, y_ap))²
3. Predicted RSSI = RSSI_0 - 10n log10(||user_pos - ap_pos||)
4. Solve for AP positions (x_ap, y_ap) using Levenberg-Marquardt
5. Constrain: AP positions within building bounds, minimum separation
6. Fuse with RTT ranges when available (RF003)
```

### Convergence Requirements:
- Minimum 10 distinct user positions with ≥3 APs visible
- User movement spanning >5m for geometric diversity
- Re-calibrate weekly or when RMS error >3m

### Dependencies: Movement data (RF014 zone history), RTT ranges (RF003)
### Target: v1.0.93 | Status: Planned | Master List Ref: P0-03

---

## 2.4 RF013 — EKF Adaptive Process Noise (P1, Medium Effort)

**Component:** `PositionEKF.java` (Kalman filter core)  
**Issue:** Fixed Q (process noise covariance) matrix — non-adaptive to signal conditions  
**Current State:** Diagonal Q with constant values for position/velocity states  
**Proposed Refinement:** Adaptive Q based on real-time RSSI variance  

### Adaptive Q Algorithm:
```java
// Per-update step:
// 1. Compute RSSI variance across visible APs: σ²_rssi = Var(RSSI_i)
// 2. Map to position uncertainty: σ²_pos = k × σ²_rssi / (10n/ln(10))²
// 3. Update Q matrix diagonal:
//    Q[0,0] = Q[1,1] = σ²_pos (position)
//    Q[2,2] = Q[3,3] = σ²_pos / Δt² (velocity)
// 4. Clamp: Q_min ≤ Q ≤ Q_max (prevent divergence/collapse)
```

### Benefits:
- Tightens filter during stable RSSI (low variance → low Q)
- Opens filter during multipath/occlusion (high variance → high Q)
- Prevents EKF divergence in dynamic RF environments

### Dependencies: RSSI variance computation (shared with RF004)
### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

## 2.5 RF014 — Zone HMM Adaptive Transitions (P1, Medium Effort)

**Component:** `ZoneHMM.java` (Hidden Markov Model for zone classification)  
**Issue:** Fixed hysteresis thresholds — may not fit all environments  
**Current State:** Hardcoded transition probabilities and dwell-time hysteresis  
**Proposed Refinement:** Learn transition matrix from zone visit history  

### Learning Algorithm (Baum-Welch / EM):
```
E-step: Compute γ_t(i) = P(state_i at t | observations, λ)
M-step: Update transition matrix A[i][j] = Σ ξ_t(i,j) / Σ γ_t(i)
        where ξ_t(i,j) = P(state_i at t, state_j at t+1 | observations)
Regularization: Add Dirichlet prior (α=1) for unseen transitions
Online update: Exponential moving average with α=0.01
```

### Adaptive Hysteresis:
- Dwell time threshold = percentile_75(historical_dwell_times[zone])
- Exit confidence = 1 - P(stay | recent_observations)
- Zone merge/split detection via transition entropy

### Dependencies: Zone history database, RSSI fingerprints per zone
### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

*End of Piece 02/13*
---

# Refinement_Existing_Parts_Prioritized — Piece 03/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 03 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — HTML/Three.js Modularization (RF007, RF008, RF009)

## 3.1 RF007 — HTML/Three.js Module Split (P2, Medium Effort)

**Component:** `bounce.html` (2,200+ lines, monolithic)  
**Issue:** Single file contains scene setup, UI, camera controls, trail rendering, BT3D visualization, charting — impossible to maintain  
**Current State:** All JavaScript inlined, no module system, global namespace pollution  
**Proposed Refinement:** Split into ES6 modules with clear separation of concerns  

### Proposed Module Structure:
```
bounce.html (entry point, ~100 lines)
├── modules/
│   ├── core/
│   │   ├── app.js           # Main initialization, lifecycle
│   │   ├── config.js        # Constants, feature flags
│   │   └── eventBus.js      # Pub/sub for decoupled communication
│   ├── scene/
│   │   ├── sceneManager.js  # Three.js scene, renderer, camera
│   │   ├── lighting.js      # Environment, shadows, bloom setup
│   │   └── floorPlan.js     # Building mesh, walls, zones
│   ├── visualization/
│   │   ├── trailRenderer.js    # Catmull-Rom trail (RF010, RF015)
│   │   ├── bt3dRenderer.js     # Bluetooth 3D visualization
│   │   ├── zoneRenderer.js     # HMM zone overlays
│   │   └── particleRenderer.js # Particle filter visualization
│   ├── ui/
│   │   ├── hud.js            # Heads-up display, metrics (RF009)
│   │   ├── panels.js         # Side panels, settings, debug
│   │   └── controls.js       # Touch/mouse/keyboard input
│   ├── positioning/
│   │   ├── bridge.js         # JS↔Android bridge (RF018)
│   │   ├── algorithms.js     # Client-side prediction/smoothing
│   │   └── calibration.js    # AP position calibration UI
│   └── utils/
│       ├── math.js           # Vector3, quaternion helpers
│       ├── color.js          # Color scales, gradients
│       └── storage.js        # IndexedDB for offline (RF026)
```

### Migration Strategy:
1. **Phase 1:** Extract `config.js` and `eventBus.js` (no dependencies)
2. **Phase 2:** Extract `sceneManager.js`, `lighting.js` (Three.js core)
3. **Phase 3:** Extract visualization modules (independent renderers)
4. **Phase 4:** Extract UI modules (HUD, panels, controls)
5. **Phase 4:** Extract positioning bridge (requires Android coordination)
6. **Phase 5:** Update `bounce.html` to import modules via `<script type="module">`
7. **Phase 6:** Add build step (esbuild/rollup) for production bundling

### Benefits:
- Parallel development (scene vs UI vs positioning teams)
- Tree-shaking removes unused Three.js modules (RF020)
- Hot module replacement for development
- Clear ownership boundaries

### Dependencies: ES6 module support (Android WebView 60+), build pipeline (RF023)
### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

## 3.2 RF008 — Three.js Version Management (P2, Low Effort)

**Component:** `three.min.js` (r128 bundled locally)  
**Issue:** Version locked to r128 (2021) — missing 30+ releases, security patches, performance improvements  
**Current State:** Single local file, no update mechanism  
**Proposed Refinement:** Add version management with automated update script  

### Implementation:
```bash
# scripts/update-threejs.sh
#!/bin/bash
TARGET_VERSION=${1:-latest}
cd assets/threejs
# Fetch release info from GitHub API
LATEST=$(curl -s https://api.github.com/repos/mrdoob/three.js/releases/latest | jq -r .tag_name)
VERSION=${TARGET_VERSION:-$LATEST}
# Download module bundle
curl -L "https://cdn.jsdelivr.net/npm/three@$VERSION/build/three.module.js" -o three.module.js
# Download key addons
for addon in OrbitControls EffectComposer UnrealBloomPass; do
  curl -L "https://cdn.jsdelivr.net/npm/three@$VERSION/examples/jsm/libs/${addon}.js" -o ${addon}.js
done
# Update version manifest
echo "$VERSION" > VERSION
# Run visual regression test
npm run test:visual
```

### Version Policy:
- **Pin major version** (e.g., `three@0.158`) for stability
- **Auto-update patch/minor** via Dependabot/GitHub Actions
- **Manual major upgrade** with visual regression testing
- **Fallback:** Keep r128 as `three.legacy.js` for emergency rollback

### Target: Three.js r158+ (2024) | Target: v1.0.94 | Status: Planned

---

## 3.3 RF009 — Chart.js Metrics Expansion (P1, Low Effort)

**Component:** `Chart.js` integration in HUD (currently 4 metrics)  
**Issue:** Limited visibility — only shows position error, RSSI, scan count, FPS  
**Current State:** 4 static charts, no telemetry pipeline  
**Proposed Refinement:** Add 8 new metrics with telemetry pipeline  

### New Metrics:
| Metric | Source | Visualization | Purpose |
|--------|--------|---------------|---------|
| **Latency (ms)** | Bridge RTT | Line chart | End-to-end responsiveness |
| **Packet Loss %** | Wi-Fi/BT stats | Area chart | Link quality |
| **Mesh Hops** | Mesh protocol | Bar chart | Network topology depth |
| **Battery % + Rate** | BatteryManager | Gauge + trend | Power budget awareness |
| **CPU/GPU %** | Performance API | Stacked area | Rendering cost |
| **Memory (MB)** | performance.memory | Line chart | Leak detection |
| **AP Count** | Scan results | Scatter (RSSI vs count) | Coverage density |
| **Zone Confidence** | HMM output | Radial gauge | Localization certainty |

### Telemetry Pipeline:
```javascript
// modules/telemetry/metricsCollector.js
class MetricsCollector {
  constructor() {
    this.buffers = new Map(); // metricName -> CircularBuffer(300)
    this.interval = 1000; // 1 Hz
  }
  
  register(name, getter, transform = x => x) {
    this.buffers.set(name, { getter, transform, buffer: [] });
  }
  
  tick() {
    for (const [name, { getter, transform, buffer }] of this.buffers) {
      buffer.push(transform(getter()));
      if (buffer.length > 300) buffer.shift();
    }
    this.publish(); // EventBus → Chart.js consumers
  }
}
```

### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

*End of Piece 03/13*
---

# Refinement_Existing_Parts_Prioritized — Piece 04/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 04 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Adaptive Performance Systems (RF010, RF011, RF012)

## 4.1 RF010 — Trail Geometry Adaptive Rebuild (P1, Low Effort)

**Component:** `TrailRenderer.js` (Three.js Catmull-Rom curve reconstruction)  
**Issue:** Fixed 5-frame rebuild interval — wasteful when stationary, laggy when moving fast  
**Current State:** `if (frameCount % 5 === 0) rebuildTrail()`  
**Proposed Refinement:** Adaptive rebuild frequency based on movement velocity  

### Algorithm:
```javascript
// TrailRenderer.adaptiveRebuild()
class TrailRenderer {
  constructor() {
    this.rebuildInterval = 5; // frames
    this.lastRebuildFrame = 0;
    this.velocityHistory = []; // last 10 velocities
  }
  
  update(deltaTime, currentPosition) {
    // Compute velocity
    const velocity = this.computeVelocity(currentPosition, deltaTime);
    this.velocityHistory.push(velocity);
    if (this.velocityHistory.length > 10) this.velocityHistory.shift();
    
    // Adaptive interval: 1 frame (fast) to 20 frames (stationary)
    const avgVelocity = this.velocityHistory.reduce((a,b)=>a+b,0) / this.velocityHistory.length;
    const speed = avgVelocity.length();
    
    if (speed > 2.0) this.rebuildInterval = 1;      // >2 m/s: every frame
    else if (speed > 1.0) this.rebuildInterval = 2; // 1-2 m/s: every 2
    else if (speed > 0.5) this.rebuildInterval = 5; // walking: every 5
    else if (speed > 0.1) this.rebuildInterval = 10; // slow: every 10
    else this.rebuildInterval = 20;                  // stationary: every 20
    
    // Rebuild check
    if (frameCount - this.lastRebuildFrame >= this.rebuildInterval) {
      this.rebuildTrail();
      this.lastRebuildFrame = frameCount;
    }
  }
}
```

### Performance Impact:
| Movement State | Old Interval | New Interval | Rebuilds/sec (60fps) |
|----------------|--------------|--------------|----------------------|
| Running (3 m/s) | 5 | 1 | 60 → 60 (same) |
| Walking (1.2 m/s) | 5 | 2 | 12 → 30 (2.5× smoother) |
| Slow (0.3 m/s) | 5 | 10 | 12 → 6 (2× fewer) |
| Stationary | 5 | 20 | 12 → 3 (4× fewer) |

### GPU Savings: ~40% fewer geometry uploads during typical use
### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

## 4.2 RF011 — Bluetooth Scan Adaptive Duty Cycle (P1, Low Effort)

**Component:** `BluetoothScanner.java` / `MainActivity` scan scheduler  
**Issue:** Fixed 5-second scan/restart cycle — too aggressive when quiet, misses devices when active  
**Current State:** `handler.postDelayed(scanRunnable, 5000)` unconditional  
**Proposed Refinement:** Adaptive scan interval based on device activity  

### Algorithm:
```java
// BluetoothScanner.adaptiveSchedule()
class BluetoothScanner {
  private static final int MIN_INTERVAL_MS = 2000;  // 2s when active
  private static final int MAX_INTERVAL_MS = 10000; // 10s when quiet
  private static final int ACTIVE_THRESHOLD = 3;    // devices to consider "active"
  
  private int currentIntervalMs = 5000;
  private int consecutiveQuietCycles = 0;
  
  void onScanResults(List<ScanResult> results) {
    int activeDevices = countActiveDevices(results); // RSSI > -80, seen recently
    
    if (activeDevices >= ACTIVE_THRESHOLD) {
      // High activity: scan more frequently
      currentIntervalMs = Math.max(MIN_INTERVAL_MS, currentIntervalMs - 500);
      consecutiveQuietCycles = 0;
    } else {
      // Low activity: back off exponentially
      consecutiveQuietCycles++;
      currentIntervalMs = Math.min(MAX_INTERVAL_MS, 
        (int)(5000 * Math.pow(1.5, consecutiveQuietCycles - 1)));
    }
    
    scheduleNextScan(currentIntervalMs);
  }
  
  private int countActiveDevices(List<ScanResult> results) {
    return (int) results.stream()
      .filter(r -> r.getRssi() > -80)
      .filter(r -> System.currentTimeMillis() - r.getTimestampNanos()/1e6 < 30000)
      .count();
  }
}
```

### Battery Impact:
| Environment | Old Cycle | New Avg Cycle | Battery Savings |
|-------------|-----------|---------------|-----------------|
| Crowded (mall) | 5s | 2.5s | -10% (more scans) |
| Office (5 devices) | 5s | 4s | +5% |
| Home (1 device) | 5s | 8s | +25% |
| Empty (outdoors) | 5s | 10s | +35% |

### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

## 4.3 RF012 — SSID Broadcast Adaptive Duty Cycle (P2, Low Effort)

**Component:** `WifiRttManager` / `WifiAware` SSID broadcast scheduler  
**Issue:** Fixed 5.1s slot duration — inflexible for mobility contexts  
**Current State:** `publishConfig.setPublishDuration(5100)` constant  
**Proposed Refinement:** Context-aware slot timing using GPS speed / accelerometer  

### Algorithm:
```java
// SsidBroadcaster.adaptiveDutyCycle()
class SsidBroadcaster {
  private static final int BASE_SLOT_MS = 5100;
  private static final int MIN_SLOT_MS = 2000;  // fast when moving
  private static final int MAX_SLOT_MS = 15000; // slow when stationary
  
  void updateSlotDuration(Location location, float[] accelerometer) {
    float speed = location != null ? location.getSpeed() : 0f; // m/s
    float accelMagnitude = Vector3.magnitude(accelerometer);
    
    // Moving detection: GPS speed OR accelerometer variance
    boolean moving = speed > 0.5 || accelMagnitude > 1.2;
    
    int newSlotMs;
    if (moving) {
      // Linear interpolation: 0.5 m/s → 5s, 5 m/s → 2s
      float t = Math.min(1f, (speed - 0.5f) / 4.5f);
      newSlotMs = (int) (BASE_SLOT_MS * (1 - t * 0.6));
    } else {
      // Exponential backoff when stationary
      stationaryCycles++;
      newSlotMs = Math.min(MAX_SLOT_MS, BASE_SLOT_MS * (int)Math.pow(1.3, stationaryCycles));
    }
    
    if (newSlotMs != currentSlotMs) {
      reconfigurePublish(newSlotMs);
      currentSlotMs = newSlotMs;
    }
  }
}
```

### Channel Efficiency:
| Context | Slot Duration | Broadcasts/min | Airtime % |
|---------|---------------|----------------|-----------|
| Driving (15 m/s) | 2.0s | 30 | 2.5% |
| Running (3 m/s) | 3.0s | 20 | 1.7% |
| Walking (1.2 m/s) | 4.0s | 15 | 1.3% |
| Standing | 8.0s | 7.5 | 0.6% |
| Sitting (10 min) | 15s | 4 | 0.3% |

### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

*End of Piece 04/13*
---

# Refinement_Existing_Parts_Prioritized — Piece 05/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 05 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Visual Effects & Rendering (RF015, RF016, RF029)

## 5.1 RF015 — Catmull-Rom Trail Tension Parameter (P2, Low Effort)

**Component:** `TrailRenderer.js` (Catmull-Rom spline)  
**Issue:** Fixed centripetal tension (α=0.5) — not user-configurable  
**Current State:** `const curve = new THREE.CatmullRomCurve3(points, false, 'centripetal', 0.5);`  
**Proposed Refinement:** Expose tension parameter with UI control and persistence  

### Implementation:
```javascript
// TrailRenderer.js
class TrailRenderer {
  constructor() {
    this.tension = this.loadTension(); // 0.0 (uniform) to 1.0 (chordal)
    this.curveType = 'catmullrom';
  }
  
  loadTension() {
    const saved = localStorage.getItem('trail_tension');
    return saved ? parseFloat(saved) : 0.5; // default centripetal
  }
  
  saveTension(value) {
    this.tension = Math.max(0, Math.min(1, value));
    localStorage.setItem('trail_tension', this.tension.toFixed(2));
    this.rebuildCurve();
  }
  
  rebuildCurve() {
    if (this.curve) this.curve.dispose();
    this.curve = new THREE.CatmullRomCurve3(
      this.controlPoints, 
      false, 
      'catmullrom', 
      this.tension
    );
    this.updateGeometry();
  }
  
  // UI: Settings panel slider 0.0–1.0, step 0.05
  // Presets: "Smooth" (0.0), "Centripetal" (0.5), "Chordal" (1.0)
}
```

### Tension Effects:
| Tension (α) | Curve Type | Visual Character | Use Case |
|-------------|------------|------------------|----------|
| 0.0 | Uniform | Very smooth, overshoots corners | Aesthetic trails |
| 0.5 | Centripetal (default) | Balanced, no loops | General purpose |
| 1.0 | Chordal | Sharp corners, follows points tightly | Precision tracking |

### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

## 5.2 RF016 — UnrealBloomPass Auto-Scale by GPU Tier (P1, Medium Effort)

**Component:** `EffectComposer` + `UnrealBloomPass` (post-processing)  
**Issue:** Fixed strength=1.0, radius=0.5, threshold=0.8 — too bright on mobile GPUs, causes thermal throttling  
**Current State:** Hardcoded bloom parameters  
**Proposed Refinement:** Benchmark GPU on startup, auto-scale bloom parameters  

### GPU Tier Detection:
```javascript
// modules/rendering/gpuBenchmark.js
class GPUBenchmark {
  static async run() {
    const canvas = document.createElement('canvas');
    canvas.width = 512; canvas.height = 512;
    const gl = canvas.getContext('webgl2', { preserveDrawingBuffer: false });
    
    // Shader stress test: 1000 particles, 60 frames
    const start = performance.now();
    for (let frame = 0; frame < 60; frame++) {
      renderParticleFrame(gl, 1000);
    }
    const elapsed = performance.now() - start;
    const fps = 60000 / elapsed;
    
    // Classify tier
    let tier;
    if (fps >= 55) tier = 'high';      // Desktop GPU, modern flagship
    else if (fps >= 30) tier = 'mid';  // Mid-range mobile, older desktop
    else tier = 'low';                  // Low-end mobile, integrated
    
    // Detect vendor/renderer for known devices
    const renderer = gl.getParameter(gl.RENDERER);
    const vendor = gl.getParameter(gl.VENDOR);
    
    return { tier, fps, renderer, vendor };
  }
  
  static getBloomConfig(tier) {
    const configs = {
      high: { strength: 1.0, radius: 0.6, threshold: 0.75, exposure: 1.2 },
      mid:  { strength: 0.6, radius: 0.4, threshold: 0.85, exposure: 1.0 },
      low:  { strength: 0.3, radius: 0.2, threshold: 0.95, exposure: 0.8 }
    };
    return configs[tier] || configs.mid;
  }
}

// Initialize on app start
async function initBloom() {
  const { tier } = await GPUBenchmark.run();
  const config = GPUBenchmark.getBloomConfig(tier);
  bloomPass.strength = config.strength;
  bloomPass.radius = config.radius;
  bloomPass.threshold = config.threshold;
  composer.exposure = config.exposure;
  
  // Allow manual override in settings
  settingsPanel.addSlider('bloom_strength', 0, 1.5, config.strength, 
    v => bloomPass.strength = v);
}
```

### Performance Targets:
| Tier | Bloom Cost | Target FPS | Thermal |
|------|------------|------------|---------|
| High | 2.5ms/frame | 60 | Safe |
| Mid | 5ms/frame | 45 | Warm |
| Low | 12ms/frame | 25 | Throttling risk |

### Fallback: Disable bloom entirely on `low` tier if FPS < 20 after 10s
### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

## 5.3 RF029 — Theme System (CSS Variables + Auto-Switch) (P2, Low Effort)

**Component:** `bounce.html` inline styles, `Chart.js` hardcoded colors  
**Issue:** Fixed color scheme — no dark mode, no accessibility options  
**Current State:** Hardcoded hex colors throughout (`#00ff88`, `#1a1a2e`, etc.)  
**Proposed Refinement:** CSS custom properties + system preference detection  

### CSS Variable Architecture:
```css
/* bounce.html <style> or modules/ui/theme.css */
:root {
  /* Light theme (default) */
  --bg-primary: #0d1117;
  --bg-secondary: #161b22;
  --bg-tertiary: #21262d;
  --fg-primary: #e6edf3;
  --fg-secondary: #8b949e;
  --accent-primary: #00d4aa;
  --accent-secondary: #58a6ff;
  --accent-warning: #d29922;
  --accent-danger: #f85149;
  --border-color: #30363d;
  --trail-color: #00d4aa;
  --zone-colors: #ff6b6b, #4ecdc4, #ffe66d, #95e1d3, #f38181;
  
  --chart-grid: rgba(255,255,255,0.1);
  --chart-text: #8b949e;
}

@media (prefers-color-scheme: light) {
  :root {
    --bg-primary: #ffffff;
    --bg-secondary: #f6f8fa;
    --bg-tertiary: #eaeef2;
    --fg-primary: #1f2328;
    --fg-secondary: #656d76;
    --accent-primary: #007b5e;
    --accent-secondary: #0969da;
    --border-color: #d0d7de;
    --chart-grid: rgba(0,0,0,0.1);
    --chart-text: #656d76;
  }
}

/* High contrast mode */
@media (prefers-contrast: more) {
  :root {
    --fg-primary: #000000;
    --fg-secondary: #333333;
    --border-color: #000000;
    --accent-primary: #006600;
    --accent-danger: #cc0000;
  }
}

/* Reduced motion */
@media (prefers-reduced-motion: reduce) {
  *, *::before, *::after {
    animation-duration: 0.01ms !important;
    transition-duration: 0.01ms !important;
  }
}
```

### JavaScript Theme Controller:
```javascript
// modules/ui/themeController.js
class ThemeController {
  constructor() {
    this.themes = ['auto', 'dark', 'light', 'high-contrast'];
    this.current = localStorage.getItem('theme') || 'auto';
    this.apply(this.current);
    
    // Listen for system changes
    window.matchMedia('(prefers-color-scheme: dark)')
      .addEventListener('change', () => this.maybeAutoSwitch());
  }
  
  apply(theme) {
    document.documentElement.setAttribute('data-theme', theme);
    localStorage.setItem('theme', theme);
    this.current = theme;
    this.updateCharts(); // Chart.js colors
    this.updateThreeJS(); // Three.js materials
  }
  
  maybeAutoSwitch() {
    if (this.current === 'auto') {
      this.apply('auto'); // Triggers CSS media queries
    }
  }
}
```

### Chart.js Integration:
```javascript
// Use CSS variables in chart options
const chartOptions = {
  plugins: {
    legend: { labels: { color: 'var(--chart-text)' } }
  },
  scales: {
    x: { grid: { color: 'var(--chart-grid)' }, ticks: { color: 'var(--chart-text)' } },
    y: { grid: { color: 'var(--chart-grid)' }, ticks: { color: 'var(--chart-text)' } }
  }
};
```

### Target: v1.0.94 | Status: Planned | Master List Ref: P2-04

---

*End of Piece 05/13*
---

# Refinement_Existing_Parts_Prioritized — Piece 06/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 06 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — JS Bridge & Error Handling (RF018, RF019)

## 6.1 RF018 — JS Bridge Namespace Organization (P1, Low Effort)

**Component:** `MainActivity.java` (JavaScriptInterface methods) + `bounce.html` bridge calls  
**Issue:** 30+ bridge methods in flat namespace — naming collisions, no discoverability  
**Current State:** All methods on `window.Bounce` or `window.Android`  
**Proposed Refinement:** Group into logical namespaces with TypeScript definitions  

### Current Flat Namespace (30+ methods):
```javascript
// Current: window.Bounce.*
Bounce.startScan()
Bounce.stopScan()
Bounce.getPosition()
Bounce.setTrailColor()
Bounce.exportTrail()
Bounce.setBloomStrength()
Bounce.getZone()
Bounce.calibrateAP()
Bounce.requestPermission()
// ... 20 more
```

### Proposed Namespaced Architecture:
```javascript
// modules/positioning/bridge.js
window.Bounce = {
  // Radio/Scanning namespace
  radio: {
    scan: {
      start: () => bridge('radio.scan.start'),
      stop: () => bridge('radio.scan.stop'),
      configure: (config) => bridge('radio.scan.configure', config),
      onResults: (callback) => eventBus.on('radio.scan.results', callback)
    },
    rtt: {
      range: (bssids) => bridge('radio.rtt.range', bssids),
      onRanges: (callback) => eventBus.on('radio.rtt.ranges', callback)
    },
    ble: {
      startScan: (filters) => bridge('radio.ble.startScan', filters),
      stopScan: () => bridge('radio.ble.stopScan'),
      onAdvertisement: (callback) => eventBus.on('radio.ble.advertisement', callback)
    },
    wifiAware: {
      publish: (config) => bridge('radio.aware.publish', config),
      subscribe: (config) => bridge('radio.aware.subscribe', config),
      onMessage: (callback) => eventBus.on('radio.aware.message', callback)
    }
  },
  
  // Visualization namespace
  viz: {
    trail: {
      setColor: (color) => bridge('viz.trail.color', color),
      setTension: (t) => bridge('viz.trail.tension', t),
      export: (format) => bridge('viz.trail.export', format),
      clear: () => bridge('viz.trail.clear')
    },
    bloom: {
      setStrength: (s) => bridge('viz.bloom.strength', s),
      setEnabled: (enabled) => bridge('viz.bloom.enabled', enabled)
    },
    theme: {
      set: (theme) => bridge('viz.theme.set', theme),
      get: () => bridge('viz.theme.get')
    },
    camera: {
      setMode: (mode) => bridge('viz.camera.mode', mode),
      focus: (target) => bridge('viz.camera.focus', target)
    }
  },
  
  // Navigation/Positioning namespace
  nav: {
    position: {
      get: () => bridge('nav.position.get'),
      onUpdate: (callback) => eventBus.on('nav.position.update', callback),
      setAlgorithm: (algo) => bridge('nav.position.algorithm', algo)
    },
    zone: {
      getCurrent: () => bridge('nav.zone.current'),
      getHistory: () => bridge('nav.zone.history'),
      onTransition: (callback) => eventBus.on('nav.zone.transition', callback)
    },
    calibration: {
      start: () => bridge('nav.calibration.start'),
      stop: () => bridge('nav.calibration.stop'),
      getAPPositions: () => bridge('nav.calibration.apPositions')
    }
  },
  
  // System namespace
  sys: {
    permissions: {
      request: (perms) => bridge('sys.permissions.request', perms),
      status: (perm) => bridge('sys.permissions.status', perm),
      onChange: (callback) => eventBus.on('sys.permissions.change', callback)
    },
    storage: {
      export: (format) => bridge('sys.storage.export', format),
      import: (data) => bridge('sys.storage.import', data),
      clear: () => bridge('sys.storage.clear')
    },
    diagnostics: {
      getLogs: () => bridge('sys.diagnostics.logs'),
      getMetrics: () => bridge('sys.diagnostics.metrics'),
      runSelfTest: () => bridge('sys.diagnostics.selftest')
    }
  }
};

// Internal bridge function
function bridge(method, ...args) {
  return new Promise((resolve, reject) => {
    const id = ++bridge.idCounter;
    bridge.pending.set(id, { resolve, reject });
    window.Android.postMessage(JSON.stringify({ id, method, args }));
  });
}
bridge.idCounter = 0;
bridge.pending = new Map();

// Android side: MainActivity.handleMessage(JSON)
```

### Android Side Refactoring:
```java
// MainActivity.java - grouped handlers
private final Map<String, BiConsumer<JSONArray, Callback>> handlers = Map.ofEntries(
  // radio.scan
  entry("radio.scan.start", this::handleScanStart),
  entry("radio.scan.stop", this::handleScanStop),
  entry("radio.scan.configure", this::handleScanConfigure),
  // radio.rtt
  entry("radio.rtt.range", this::handleRttRange),
  // viz.trail
  entry("viz.trail.color", this::handleTrailColor),
  entry("viz.trail.export", this::handleTrailExport),
  // nav.position
  entry("nav.position.get", this::handlePositionGet),
  entry("nav.position.algorithm", this::handlePositionAlgorithm),
  // sys.permissions
  entry("sys.permissions.request", this::handlePermissionRequest)
  // ... etc
);
```

### TypeScript Definitions (for IDE support):
```typescript
// types/bounce-bridge.d.ts
declare namespace Bounce {
  namespace radio {
    namespace scan {
      function start(): Promise<void>;
      function stop(): Promise<void>;
      function configure(config: ScanConfig): Promise<void>;
      function onResults(cb: (results: ScanResult[]) => void): () => void;
    }
    // ... etc
  }
  namespace viz { /* ... */ }
  namespace nav { /* ... */ }
  namespace sys { /* ... */ }
}
interface Window { Bounce: typeof Bounce; }
```

### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

## 6.2 RF019 — Centralized Error Handling (P1, Low Effort)

**Component:** `bounce.html` (scattered try/catch) + `MainActivity.java` (uncaught exceptions)  
**Issue:** Inconsistent error handling — silent failures, no user feedback, no diagnostics  
**Current State:** Ad-hoc `try { } catch (e) { console.log(e) }` in 20+ locations  
**Proposed Refinement:** Central `ErrorReporter` class with user-facing toasts, logging, telemetry  

### ErrorReporter Implementation:
```javascript
// modules/core/errorReporter.js
class ErrorReporter {
  constructor() {
    this.handlers = [];
    this.context = {};
    this.sessionId = crypto.randomUUID();
    this.installGlobalHandlers();
  }
  
  installGlobalHandlers() {
    // Uncaught JS errors
    window.addEventListener('error', (e) => {
      this.report(e.error || new Error(e.message), {
        type: 'uncaught',
        filename: e.filename,
        lineno: e.lineno,
        colno: e.colno
      });
    });
    
    // Unhandled promise rejections
    window.addEventListener('unhandledrejection', (e) => {
      this.report(e.reason, { type: 'unhandled_rejection' });
      e.preventDefault(); // Prevent default browser behavior
    });
    
    // Android bridge errors
    window.addEventListener('message', (e) => {
      if (e.data?.type === 'error') {
        this.report(new Error(e.data.message), { 
          type: 'bridge', 
          code: e.data.code,
          method: e.data.method 
        });
      }
    });
  }
  
  setContext(context) {
    this.context = { ...this.context, ...context };
  }
  
  report(error, metadata = {}) {
    const report = {
      id: crypto.randomUUID(),
      timestamp: Date.now(),
      sessionId: this.sessionId,
      message: error.message || String(error),
      stack: error.stack,
      name: error.name,
      context: { ...this.context, ...metadata },
      userAgent: navigator.userAgent,
      url: window.location.href
    };
    
    // 1. Local storage (persist across sessions)
    this.persist(report);
    
    // 2. Send to Android for system logs
    this.sendToAndroid(report);
    
    // 3. User-facing notification (non-blocking)
    this.notifyUser(report);
    
    // 4. Custom handlers (analytics, Sentry, etc.)
    this.handlers.forEach(h => h(report));
    
    return report.id;
  }
  
  persist(report) {
    const logs = JSON.parse(localStorage.getItem('error_logs') || '[]');
    logs.unshift(report);
    if (logs.length > 100) logs.pop();
    localStorage.setItem('error_logs', JSON.stringify(logs));
  }
  
  sendToAndroid(report) {
    if (window.Android?.postMessage) {
      window.Android.postMessage(JSON.stringify({
        type: 'error_report',
        payload: report
      }));
    }
  }
  
  notifyUser(report) {
    // Only notify for user-actionable errors
    const userFacing = [
      'permission_denied',
      'bluetooth_off',
      'location_disabled',
      'storage_full',
      'network_error'
    ];
    
    if (userFacing.some(code => report.context.code === code)) {
      eventBus.emit('ui.toast', {
        message: this.getUserMessage(report.context.code),
        type: 'error',
        duration: 5000,
        action: this.getUserAction(report.context.code)
      });
    }
  }
  
  getUserMessage(code) {
    const messages = {
      permission_denied: 'Permission required for positioning. Enable in settings.',
      bluetooth_off: 'Bluetooth is off. Turn on for device detection.',
      location_disabled: 'Location access needed for indoor positioning.',
      storage_full: 'Storage full. Export and clear old trails.',
      network_error: 'Network error. Check connection and retry.'
    };
    return messages[code] || 'An error occurred. Check logs for details.';
  }
  
  getUserAction(code) {
    const actions = {
      permission_denied: { label: 'Open Settings', action: () => Bounce.sys.permissions.request(['location', 'bluetooth']) },
      bluetooth_off: { label: 'Enable BT', action: () => Bounce.radio.ble.startScan() },
      location_disabled: { label: 'Enable GPS', action: () => Bounce.sys.permissions.request(['location']) }
    };
    return actions[code];
  }
  
  onError(handler) {
    this.handlers.push(handler);
    return () => this.handlers = this.handlers.filter(h => h !== handler);
  }
  
  getLogs() {
    return JSON.parse(localStorage.getItem('error_logs') || '[]');
  }
  
  clearLogs() {
    localStorage.removeItem('error_logs');
  }
}

// Singleton
window.ErrorReporter = new ErrorReporter();
export default window.ErrorReporter;
```

### Usage Throughout Codebase:
```javascript
// Before (scattered):
try {
  await Bounce.radio.scan.start();
} catch (e) {
  console.log(e); // Silent, no user feedback
}

// After (consistent):
try {
  await Bounce.radio.scan.start();
} catch (e) {
  ErrorReporter.report(e, { code: 'scan_start_failed', component: 'radio' });
  // User gets toast, Android gets log, stored locally
}

// Async wrapper for convenience
export async function safeAsync(promise, context = {}) {
  try {
    return await promise;
  } catch (e) {
    ErrorReporter.report(e, context);
    throw e; // Re-throw for caller handling
  }
}
```

### Android Side Error Collection:
```java
// MainActivity.java - receive error reports
@JavascriptInterface
public void postMessage(String json) {
  try {
    JSONObject msg = new JSONObject(json);
    if ("error_report".equals(msg.optString("type"))) {
      JSONObject payload = msg.getJSONObject("payload");
      Log.e("BOUNCE_JS", payload.toString(2));
      // Forward to Crashlytics/Firebase if configured
      // Store in local DB for diagnostics export
    }
  } catch (JSONException e) {
    Log.e("BOUNCE", "Failed to parse JS message", e);
  }
}
```

### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

*End of Piece 06/13*
---

# Refinement_Existing_Parts_Prioritized — Piece 07/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 07 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Build Pipeline & Signing (RF006, RF021, RF025)

## 7.1 RF006 — Build Script SDK Path Auto-Detection (P1, Low Effort)

**Component:** `build.sh` (primary build script)  
**Issue:** Hardcoded `ANDROID_HOME`, SDK paths, build-tools version — breaks on new environments  
**Current State:** `export ANDROID_HOME=/home/user/Android/Sdk` and fixed `build-tools;34.0.0`  
**Proposed Refinement:** Robust auto-detection with fallback chain  

### Auto-Detection Logic:
```bash
#!/bin/bash
# build.sh - Auto-detect Android SDK

detect_android_home() {
  local candidates=(
    "$ANDROID_HOME"
    "$HOME/Android/Sdk"
    "$HOME/Library/Android/sdk"
    "/opt/android-sdk"
    "/usr/local/android-sdk"
    "$(dirname $(dirname $(which adb 2>/dev/null)))"
    "$(dirname $(dirname $(which sdkmanager 2>/dev/null)))"
  )
  
  for candidate in "${candidates[@]}"; do
    if [[ -d "$candidate" && -f "$candidate/tools/bin/sdkmanager" ]]; then
      echo "$candidate"
      return 0
    fi
  done
  
  # Last resort: try to install via command line tools
  echo "ERROR: Android SDK not found. Set ANDROID_HOME or install SDK." >&2
  return 1
}

detect_build_tools() {
  local sdk_root="$1"
  local build_tools_dir="$sdk_root/build-tools"
  
  if [[ ! -d "$build_tools_dir" ]]; then
    echo "ERROR: build-tools not found in $sdk_root" >&2
    return 1
  fi
  
  # Prefer latest 34.x, fallback to latest 33.x, then any
  local version=$(ls -1 "$build_tools_dir" | grep -E '^(34|33)\.' | sort -V | tail -1)
  if [[ -z "$version" ]]; then
    version=$(ls -1 "$build_tools_dir" | sort -V | tail -1)
  fi
  echo "$version"
}

detect_platform() {
  local sdk_root="$1"
  local platforms_dir="$sdk_root/platforms"
  
  # Prefer android-34, fallback to highest
  local version=$(ls -1 "$platforms_dir" | grep '^android-' | sed 's/android-//' | sort -n | tail -1)
  echo "android-$version"
}

# Main detection
ANDROID_HOME=$(detect_android_home) || exit 1
BUILD_TOOLS_VERSION=$(detect_build_tools "$ANDROID_HOME") || exit 1
PLATFORM_VERSION=$(detect_platform "$ANDROID_HOME") || exit 1

export ANDROID_HOME
export BUILD_TOOLS_VERSION
export PLATFORM_VERSION

echo "Using Android SDK: $ANDROID_HOME"
echo "Build Tools: $BUILD_TOOLS_VERSION"
echo "Platform: $PLATFORM_VERSION"

# License acceptance (non-interactive)
yes | "$ANDROID_HOME/tools/bin/sdkmanager" --licenses >/dev/null 2>&1

# Build commands use detected paths
AAPT2="$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION/aapt2"
DX="$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION/d8"
ZIPALIGN="$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION/zipalign"
APKSIGNER="$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION/apksigner"
```

### Validation:
```bash
# Verify all tools exist
for tool in "$AAPT2" "$DX" "$ZIPALIGN" "$APKSIGNER"; do
  if [[ ! -x "$tool" ]]; then
    echo "ERROR: Missing tool: $tool" >&2
    exit 1
  fi
done
```

### Target: v1.0.93 | Status: Planned | Master List Ref: —

---

## 7.2 RF021 — Release Keystore & Signing Config (P0, High Effort)

**Component:** `build.sh`, `keystore.jks` (debug only)  
**Issue:** Debug keystore only — cannot publish to Play Store  
**Current State:** `keytool -genkeypair -alias androiddebugkey -keypass android -storepass android`  
**Proposed Refinement:** Generate release keystore, configure signing, document process  

### Keystore Generation (One-Time):
```bash
#!/bin/bash
# scripts/generate-release-keystore.sh

KEYSTORE_PATH="keystore/release.jks"
ALIAS="bounce-release"
VALIDITY=10000 # ~27 years

# Generate strong passwords
STORE_PASS=$(openssl rand -base64 32 | tr -d '/+=' | cut -c1-32)
KEY_PASS=$(openssl rand -base64 32 | tr -d '/+=' | cut -c1-32)

# Store in password manager / secure location
cat > keystore/credentials.txt <<EOF
# BOUNCE Release Keystore Credentials
# GENERATED: $(date -u +"%Y-%m-%d %H:%M:%S UTC")
# KEEP SECURE - DO NOT COMMIT TO GIT
STORE_PASSWORD=$STORE_PASS
KEY_PASSWORD=$KEY_PASS
ALIAS=$ALIAS
KEYSTORE_PATH=$KEYSTORE_PATH
EOF

# Generate keystore
keytool -genkeypair \
  -alias "$ALIAS" \
  -keystore "$KEYSTORE_PATH" \
  -storepass "$STORE_PASS" \
  -keypass "$KEY_PASS" \
  -keyalg RSA \
  -keysize 2048 \
  -validity $VALIDITY \
  -dname "CN=BOUNCE, OU=Engineering, O=CSM, L=City, ST=State, C=US" \
  -ext "BC:c"

echo "Keystore generated at $KEYSTORE_PATH"
echo "Credentials saved to keystore/credentials.txt (ADD TO .gitignore)"
echo "BACKUP BOTH FILES SECURELY"
```

### Signing Configuration in build.sh:
```bash
# build.sh - Signing section

sign_apk() {
  local unsigned_apk="$1"
  local signed_apk="$2"
  
  if [[ -f "keystore/credentials.txt" ]]; then
    source keystore/credentials.txt
  else
    echo "ERROR: Release credentials not found. Run generate-release-keystore.sh" >&2
    return 1
  fi
  
  # Align
  "$ZIPALIGN" -f -p 4 "$unsigned_apk" "${unsigned_apk}.aligned"
  
  # Sign with release key
  "$APKSIGNER" sign \
    --ks "$KEYSTORE_PATH" \
    --ks-pass "pass:$STORE_PASS" \
    --ks-key-alias "$ALIAS" \
    --key-pass "pass:$KEY_PASS" \
    --v1-signing-enabled true \
    --v2-signing-enabled true \
    --v3-signing-enabled true \
    --out "$signed_apk" \
    "${unsigned_apk}.aligned"
  
  # Verify
  "$APKSIGNER" verify --print-certs "$signed_apk"
  
  rm -f "${unsigned_apk}.aligned"
}

# Debug signing (existing)
sign_debug_apk() {
  local unsigned_apk="$1"
  local signed_apk="$2"
  
  "$ZIPALIGN" -f -p 4 "$unsigned_apk" "${unsigned_apk}.aligned"
  "$APKSIGNER" sign \
    --ks ~/.android/debug.keystore \
    --ks-pass pass:android \
    --key-pass pass:android \
    --out "$signed_apk" \
    "${unsigned_apk}.aligned"
  rm -f "${unsigned_apk}.aligned"
}
```

### Play Store Upload Requirements Met:
- ✅ Release keystore (RSA 2048, 25+ year validity)
- ✅ v1+v2+v3 signing (APK Signature Scheme v3 for key rotation)
- ✅ Zipaligned (4-byte)
- ✅ ProGuard mapping file generation (RF025)

### Target: v1.0.93 | Status: Planned | Master List Ref: TD-08

---

## 7.3 RF025 — ProGuard/R8 Minification (P2, Low Effort)

**Component:** `build.sh` (no minification)  
**Issue:** No code shrinking/obfuscation — APK 230KB+, reverse-engineerable  
**Current State:** `d8` without `--release` or ProGuard rules  
**Proposed Refinement:** Enable R8 full mode with custom rules  

### ProGuard Rules (`proguard-rules.pro`):
```proguard
# proguard-rules.pro

# Keep entry points
-keep class com.carrpod.bounce.MainActivity { *; }
-keep class com.carrpod.bounce.PositionEKF { *; }
-keep class com.carrpod.bounce.ParticleFilter { *; }
-keep class com.carrpod.bounce.Trilateration { *; }
-keep class com.carrpod.bounce.WifiRttRanging { *; }
-keep class com.carrpod.bounce.ZoneHMM { *; }

# Keep JavaScriptInterface methods
-keepclassmembers class com.carrpod.bounce.MainActivity {
  @android.webkit.JavascriptInterface public *;
}

# Keep Three.js / Chart.js bridge classes
-keep class org.chromium.** { *; }

# Keep serialization
-keepclassmembers class * implements java.io.Serializable {
  static final long serialVersionUID;
  private static final java.io.ObjectStreamField[] serialPersistentFields;
  private void writeObject(java.io.ObjectOutputStream);
  private void readObject(java.io.ObjectInputStream);
  java.lang.Object writeReplace();
  java.lang.Object readResolve();
}

# Optimize
-optimizationpasses 5
-allowaccessmodification
-mergeinterfacesaggressively

# Remove logging in release
-assumenosideeffects class android.util.Log {
  public static int d(...);
  public static int v(...);
  public static int i(...);
}
```

### Build.sh Integration:
```bash
# build.sh - R8 minification

run_r8() {
  local input_jar="$1"
  local output_jar="$2"
  
  local r8_jar="$ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION/lib/r8.jar"
  local android_jar="$ANDROID_HOME/platforms/$PLATFORM_VERSION/android.jar"
  
  java -jar "$r8_jar" \
    --release \
    --output "$output_jar" \
    --lib "$android_jar" \
    --pg-conf proguard-rules.pro \
    --min-api 28 \
    "$input_jar"
}

# In main build flow:
# 1. Compile Java → classes.dex (d8)
# 2. Run R8 on classes.dex → classes.min.dex
# 3. Package classes.min.dex into APK
```

### Expected Impact:
| Metric | Before | After | Improvement |
|--------|--------|-------|-------------|
| DEX size | ~2.1 MB | ~1.3 MB | 38% reduction |
| APK size | 230 KB | ~180 KB | 22% reduction |
| Method count | ~18,000 | ~12,000 | 33% reduction |
| Reverse engineering | Trivial | Hard (obfuscated) | Significant |

### Target: v1.0.94 | Status: Planned | Master List Ref: TD-07

---

*End of Piece 07/13*
---

# Refinement_Existing_Parts_Prioritized — Piece 08/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 08 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Testing & CI/CD (RF022, RF023, RF024)

## 8.1 RF022 — Unit Tests for All 6 Positioning Algorithms (P1, High Effort)

**Component:** `PositionEKF.java`, `ParticleFilter.java`, `Trilateration.java`, `WifiRttRanging.java`, `ZoneHMM.java`, `BluetoothRanging.java`  
**Issue:** Zero unit tests — algorithms unverified, regressions undetected  
**Current State:** No test directory, no JUnit dependencies  
**Proposed Refinement:** Comprehensive JUnit 5 test suite with synthetic and recorded data  

### Test Structure:
```
app/src/test/java/com/carrpod/bounce/
├── PositionEKFTest.java
├── ParticleFilterTest.java
├── TrilaterationTest.java
├── WifiRttRangingTest.java
├── ZoneHMMTest.java
├── BluetoothRangingTest.java
├── testdata/
│   ├── synthetic/
│   │   ├── static_position.csv
│   │   ├── linear_movement.csv
│   │   ├── turn_movement.csv
│   │   └── noise_profiles/
│   └── recorded/
│       ├── office_walkthrough_v1.csv
│       ├── mall_traversal_v1.csv
│       └── outdoor_gps_fusion_v1.csv
└── utils/
    ├── TestDataLoader.java
    ├── PositionAssertions.java
    └── MetricsCollector.java
```

### PositionEKFTest.java (Example):
```java
// PositionEKFTest.java
package com.carrpod.bounce;

import org.junit.jupiter.api.*;
import org.junit.jupiter.params.ParameterizedTest;
import org.junit.jupiter.params.provider.CsvSource;
import static org.junit.jupiter.api.Assertions.*;

class PositionEKFTest {
  
  private PositionEKF ekf;
  private static final double EPS = 0.5; // 0.5m tolerance
  
  @BeforeEach
  void setUp() {
    ekf = new PositionEKF();
    // Known initial state
    ekf.initialize(0, 0, 0, 0, 0, 0);
  }
  
  @Test
  void testInitialization_vyBugFixed() {
    // Regression test for RF002: vy was uninitialized (x[2]=0; x[2]=0;)
    double[] state = ekf.getState();
    assertEquals(0.0, state[2], EPS, "vx should be 0");
    assertEquals(0.0, state[3], EPS, "vy should be 0 (was bug: x[2]=0 twice)");
  }
  
  @Test
  void testStaticPosition() {
    // Stationary at origin, perfect measurements
    for (int i = 0; i < 100; i++) {
      ekf.predict(0.1);
      ekf.update(new double[]{0, 0}, new double[]{0.1, 0.1}); // range, bearing
    }
    double[] pos = ekf.getPosition();
    assertEquals(0.0, pos[0], EPS);
    assertEquals(0.0, pos[1], EPS);
  }
  
  @ParameterizedTest
  @CsvSource({
    "1.0, 0.0, 1.0, 0.0",  // East
    "0.0, 1.0, 0.0, 1.0",  // North
    "-1.0, 0.0, -1.0, 0.0", // West
    "0.0, -1.0, 0.0, -1.0"  // South
  })
  void testLinearMovement(double vx, double vy, double expectedX, double expectedY) {
    ekf.initialize(0, 0, vx, vy, 0, 0);
    for (int i = 0; i < 10; i++) {
      ekf.predict(1.0); // 1 second steps
      // Simulate perfect range measurements from origin
      double range = Math.hypot(ekf.getState()[0], ekf.getState()[1]);
      ekf.update(new double[]{range}, new double[]{0.1});
    }
    double[] pos = ekf.getPosition();
    assertEquals(expectedX * 10, pos[0], 1.0);
    assertEquals(expectedY * 10, pos[1], 1.0);
  }
  
  @Test
  void testProcessNoiseAdaptation() {
    // Test RF013 adaptive Q
    ekf.setAdaptiveProcessNoise(true);
    double initialQ = ekf.getProcessNoise()[0];
    
    // High RSSI variance → higher Q
    ekf.setRssiVariance(25.0); // High variance
    ekf.predict(0.1);
    double highQ = ekf.getProcessNoise()[0];
    
    // Low RSSI variance → lower Q
    ekf.setRssiVariance(1.0); // Low variance
    ekf.predict(0.1);
    double lowQ = ekf.getProcessNoise()[0];
    
    assertTrue(highQ > lowQ, "Adaptive Q should increase with RSSI variance");
  }
  
  @Test
  void testDivergenceDetection() {
    // Feed inconsistent measurements
    for (int i = 0; i < 50; i++) {
      ekf.predict(0.1);
      ekf.update(new double[]{i * 10}, new double[]{0.1}); // Impossible ranges
    }
    assertTrue(ekf.isDiverged(), "Should detect filter divergence");
  }
}
```

### ParticleFilterTest.java (Key Tests):
```java
// ParticleFilterTest.java
@Test
void testAdaptiveParameters() {
  // RF004: Verify per-AP parameter learning
  ParticleFilter pf = new ParticleFilter(1000);
  String bssid = "AA:BB:CC:DD:EE:FF";
  
  // Feed RSSI samples
  for (int i = 0; i < 100; i++) {
    pf.addRssiSample(bssid, -65 + Math.random() * 10); // Mean -65, variance ~8
  }
  
  double mean = pf.getRssiMean(bssid);
  double variance = pf.getRssiVariance(bssid);
  
  assertEquals(-65, mean, 2.0);
  assertTrue(variance > 5 && variance < 20, "Variance should converge to ~8.3");
}

@Test
void testWeightComputation() {
  // Particles near AP should have higher weight
  ParticleFilter pf = new ParticleFilter(1000);
  pf.setApPosition("AP1", 0, 0);
  
  double weightNear = pf.computeWeight(1, 0, Map.of("AP1", -40));
  double weightFar = pf.computeWeight(100, 0, Map.of("AP1", -40));
  
  assertTrue(weightNear > weightFar * 1000, "Near particle should dominate");
}
```

### TrilaterationTest.java:
```java
// TrilaterationTest.java
@Test
void testSelfCalibration() {
  // RF005: AP position self-calibration
  Trilateration tri = new Trilateration();
  
  // Simulate user walking in square, 4 APs at corners
  List<Measurement> measurements = generateSquareWalkMeasurements();
  tri.calibrateApPositions(measurements);
  
  Map<String, Point> apPositions = tri.getApPositions();
  assertEquals(4, apPositions.size());
  
  // Check each AP within 1m of true position
  for (String bssid : apPositions.keySet()) {
    Point truePos = TRUE_AP_POSITIONS.get(bssid);
    Point estPos = apPositions.get(bssid);
    assertTrue(truePos.distance(estPos) < 1.0, "AP " + bssid + " calibration error");
  }
}
```

### Test Dependencies (build.sh):
```bash
# Add to build.sh
JUNIT_JAR="junit-jupiter-5.10.0.jar"
MOCKITO_JAR="mockito-core-5.7.0.jar"

download_test_deps() {
  curl -L "https://repo1.maven.org/maven2/org/junit/jupiter/junit-jupiter/5.10.0/junit-jupiter-5.10.0.jar" -o libs/$JUNIT_JAR
  curl -L "https://repo1.maven.org/maven2/org/mockito/mockito-core/5.7.0/mockito-core-5.7.0.jar" -o libs/$MOCKITO_JAR
}

run_tests() {
  # Compile test classes
  javac -cp "libs/*:$ANDROID_JAR" -d test-out app/src/test/java/com/carrpod/bounce/*.java
  
  # Run with JUnit Console Launcher
  java -jar junit-platform-console-standalone-1.10.0.jar \
    --class-path test-out \
    --scan-class-path \
    --reports-dir=test-results
}
```

### Target: v1.0.94 | Status: Planned | Master List Ref: P1-02

---

## 8.2 RF023 — CI/CD Pipeline (GitHub Actions) (P2, Medium Effort)

**Component:** None (manual builds only)  
**Issue:** No automation — human error, no PR validation, no release artifacts  
**Current State:** `./build.sh` run locally  
**Proposed Refinement:** GitHub Actions workflow for build, test, sign, release  

### .github/workflows/ci.yml:
```yaml
name: CI/CD Pipeline

on:
  push:
    branches: [main, develop]
  pull_request:
    branches: [main]
  release:
    types: [published]

env:
  ANDROID_SDK_VERSION: "34"
  BUILD_TOOLS_VERSION: "34.0.0"

jobs:
  build-and-test:
    runs-on: ubuntu-latest
    timeout-minutes: 30
    
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup JDK 17
        uses: actions/setup-java@v4
        with:
          distribution: 'temurin'
          java-version: '17'
          
      - name: Setup Android SDK
        uses: android-actions/setup-android@v3
        with:
          api-level: ${{ env.ANDROID_SDK_VERSION }}
          build-tools-version: ${{ env.BUILD_TOOLS_VERSION }}
          
      - name: Cache Gradle/Android
        uses: actions/cache@v4
        with:
          path: |
            ~/.gradle/caches
            ~/.android/build-cache
          key: ${{ runner.os }}-android-${{ hashFiles('**/build.sh') }}
          
      - name: Make build.sh executable
        run: chmod +x build.sh
        
      - name: Build Debug APK
        run: ./build.sh debug
        env:
          ANDROID_HOME: ${{ env.ANDROID_SDK_ROOT }}
          
      - name: Run Unit Tests
        run: ./build.sh test
        env:
          ANDROID_HOME: ${{ env.ANDROID_SDK_ROOT }}
          
      - name: Upload Debug APK
        uses: actions/upload-artifact@v4
        with:
          name: bounce-debug-apk
          path: out/Bounce-debug.apk
          
      - name: Upload Test Results
        uses: actions/upload-artifact@v4
        if: always()
        with:
          name: test-results
          path: test-results/

  build-release:
    needs: build-and-test
    if: github.event_name == 'release' || github.ref == 'refs/heads/main'
    runs-on: ubuntu-latest
    timeout-minutes: 30
    permissions:
      contents: write  # For release upload
      
    steps:
      - uses: actions/checkout@v4
      
      - name: Setup JDK 17
        uses: actions/setup-java@v4
        with:
          distribution: 'temurin'
          java-version: '17'
          
      - name: Setup Android SDK
        uses: android-actions/setup-android@v3
        with:
          api-level: ${{ env.ANDROID_SDK_VERSION }}
          build-tools-version: ${{ env.BUILD_TOOLS_VERSION }}
          
      - name: Restore Keystore
        run: |
          echo "${{ secrets.RELEASE_KEYSTORE_BASE64 }}" | base64 -d > keystore/release.jks
          echo "STORE_PASSWORD=${{ secrets.KEYSTORE_PASSWORD }}" > keystore/credentials.txt
          echo "KEY_PASSWORD=${{ secrets.KEY_PASSWORD }}" >> keystore/credentials.txt
          echo "ALIAS=${{ secrets.KEY_ALIAS }}" >> keystore/credentials.txt
          
      - name: Build Release APK
        run: ./build.sh release
        env:
          ANDROID_HOME: ${{ env.ANDROID_SDK_ROOT }}
          
      - name: Verify Signature
        run: |
          APK=out/Bounce-release.apk
          $ANDROID_HOME/build-tools/$BUILD_TOOLS_VERSION/apksigner verify --print-certs $APK
          
      - name: Upload Release APK
        uses: actions/upload-artifact@v4
        with:
          name: bounce-release-apk
          path: out/Bounce-release.apk
          
      - name: Upload to GitHub Release
        if: github.event_name == 'release'
        uses: softprops/action-gh-release@v1
        with:
          files: out/Bounce-release.apk
          body_path: CHANGELOG.md
```

### Required Secrets (GitHub Repository Settings):
| Secret | Description |
|--------|-------------|
| `RELEASE_KEYSTORE_BASE64` | `base64 -w0 keystore/release.jks` |
| `KEYSTORE_PASSWORD` | Keystore store password |
| `KEY_PASSWORD` | Key password |
| `KEY_ALIAS` | Key alias (e.g., `bounce-release`) |

### Target: v1.0.95 | Status: Planned | Master List Ref: TD-09

---

## 8.3 RF024 — Auto-Version from Git Tags (P2, Low Effort)

**Component:** `build.sh` (manual version string)  
**Issue:** Version bumped manually in build.sh — error-prone, inconsistent  
**Current State:** `VERSION="1.0.91"` hardcoded  
**Proposed Refinement:** Derive version from git tags + commit count + dirty flag  

### Version Script (`scripts/version.sh`):
```bash
#!/bin/bash
# version.sh - Auto-generate version from git

get_version() {
  local prefix="v"
  local dirty=false
  
  # Check for uncommitted changes
  if ! git diff --quiet || ! git diff --cached --quiet; then
    dirty=true
  fi
  
  # Get latest tag
  local tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "")
  
  if [[ -z "$tag" ]]; then
    # No tags yet - use commit count
    local count=$(git rev-list --count HEAD)
    echo "0.1.${count}${dirty:+-dirty}"
    return
  fi
  
  # Parse tag (expects v1.0.91 format)
  local base_version=${tag#$prefix}
  local commits_since=$(git rev-list --count ${tag}..HEAD)
  
  if [[ $commits_since -eq 0 && "$dirty" == "false" ]]; then
    # Exact tag match
    echo "$base_version"
  else
    # Increment patch, add commit count
    IFS='.' read -r major minor patch <<< "$base_version"
    local new_patch=$((patch + 1))
    echo "${major}.${minor}.${new_patch}-${commits_since}${dirty:+-dirty}"
  fi
}

get_version_code() {
  # Monotonically increasing integer for Android versionCode
  local version=$(get_version)
  # Parse: 1.0.91-5-dirty → 1009105
  # Or: 1.0.91 → 1009100
  local clean=${version%%-*}
  IFS='.' read -r major minor patch <<< "$clean"
  local extra=0
  if [[ "$version" == *-* ]]; then
    extra=$(echo "$version" | sed 's/.*-//' | sed 's/[^0-9].*//')
  fi
  echo $((major * 1000000 + minor * 10000 + patch * 100 + extra))
}

# Usage in build.sh:
# VERSION=$(./scripts/version.sh)
# VERSION_CODE=$(./scripts/version.sh code)
# sed -i "s/versionName=.*/versionName=$VERSION/" AndroidManifest.xml
# sed -i "s/versionCode=.*/versionCode=$VERSION_CODE/" AndroidManifest.xml
```

### Git Tagging Convention:
```bash
# Release process:
git tag -a v1.0.92 -m "Release v1.0.92: EKF vy bug fix"
git push origin v1.0.92

# GitHub Actions triggers release build on tag push
```

### Changelog Generation:
```bash
# scripts/changelog.sh
generate_changelog() {
  local prev_tag=$(git describe --tags --abbrev=0 HEAD^ 2>/dev/null || git rev-list --max-parents=0 HEAD)
  local current_tag=$(git describe --tags --abbrev=0 2>/dev/null || echo "HEAD")
  
  echo "# Changelog for $current_tag"
  echo ""
  git log --pretty=format:"- %s (%h)" $prev_tag..$current_tag | grep -v "Merge\|chore\|ci"
}
```

### Target: v1.0.94 | Status: Planned | Master List Ref: TD-10

---

*End of Piece 08/13*
---

# Refinement_Existing_Parts_Prioritized — Piece 09/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 09 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Offline & Platform Features (RF026, RF027)

## 9.1 RF026 — Offline Capability with Vector Map Tiles (P2, High Effort)

**Component:** `bounce.html` (MapLibre/Mapbox GL) + `MainActivity` (asset bundling)  
**Issue:** No map tiles offline — app unusable without network  
**Current State:** Online-only MapLibre style, no tile caching  
**Proposed Refinement:** Bundle minimal world vector tiles (MBTiles) for true offline operation  

### Architecture:
```
assets/
├── maps/
│   ├── world.mbtiles          # ~50MB: zoom 0-6 global, zoom 7-10 land only
│   ├── regions/
│   │   ├── north_america.mbtiles  # ~30MB: zoom 11-14
│   │   ├── europe.mbtiles         # ~25MB
│   │   ├── asia_pacific.mbtiles   # ~35MB
│   │   └── ...
│   └── style/
│       ├── offline.json       # MapLibre style referencing local tiles
│       └── sprites/           # Local sprite sheets
```

### Tile Generation Pipeline:
```bash
# scripts/generate-offline-tiles.sh
#!/bin/bash

# 1. Download OSM data (planet or regional extracts)
# wget https://download.geofabrik.de/planet-latest.osm.pbf

# 2. Generate vector tiles with tippecanoe / tilemaker
# tilemaker --input planet.osm.pbf --output world.mbtiles --config tilemaker-config.json

# 3. Optimized config for minimal size:
# - Zoom 0-6: global coverage (coastlines, borders, major roads)
# - Zoom 7-10: land only (no ocean tiles)
# - Zoom 11-14: regional bundles on demand
# - Layers: roads, buildings, landuse, water, boundaries, POIs
# - Simplification: Douglas-Peucker at each zoom
# - Attribute filtering: keep only name, class, type

# 4. Compress with gzip (MBTiles supports compressed tiles)
# 5. Verify with MapLibre GL JS offline example
```

### MapLibre Offline Style (`offline.json`):
```json
{
  "version": 8,
  "name": "BOUNCE Offline",
  "sources": {
    "world": {
      "type": "vector",
      "url": "mbtiles://assets/maps/world.mbtiles",
      "minzoom": 0,
      "maxzoom": 14
    }
  },
  "sprite": "assets/maps/style/sprites/sprite",
  "glyphs": "assets/maps/style/fonts/{fontstack}/{range}.pbf",
  "layers": [
    {
      "id": "background",
      "type": "background",
      "paint": { "background-color": "#0d1117" }
    },
    {
      "id": "land",
      "type": "fill",
      "source": "world",
      "source-layer": "landuse",
      "filter": ["==", "class", "land"],
      "paint": { "fill-color": "#1a1f2e" }
    },
    {
      "id": "roads",
      "type": "line",
      "source": "world",
      "source-layer": "roads",
      "paint": {
        "line-color": "#30363d",
        "line-width": ["interpolate", ["linear"], ["zoom"], 6, 0.5, 14, 2]
      }
    },
    {
      "id": "buildings",
      "type": "fill-extrusion",
      "source": "world",
      "source-layer": "buildings",
      "paint": {
        "fill-extrusion-color": "#21262d",
        "fill-extrusion-height": ["get", "height"],
        "fill-extrusion-base": 0
      }
    }
  ]
}
```

### Android Asset Loading:
```java
// MainActivity.java - Offline map initialization
private void initOfflineMap() {
  // Copy MBTiles from assets to app storage (if not present)
  File mbtilesDir = new File(getFilesDir(), "maps");
  if (!mbtilesDir.exists()) {
    mbtilesDir.mkdirs();
    copyAssetDirectory("maps", mbtilesDir.getAbsolutePath());
  }
  
  // Configure MapLibre for offline
  MapboxMap map = mapView.getMapboxMap();
  map.setStyle(new Style.Builder()
    .fromUri("file://" + new File(mbtilesDir, "style/offline.json").getAbsolutePath())
    .build());
  
  // Disable network tile requests
  map.getStyle().getSource("world").setTileUrlTemplates(Collections.emptyList());
}
```

### Storage Estimates:
| Coverage | Zooms | Size | Use Case |
|----------|-------|------|----------|
| World (land) | 0-10 | ~50 MB | Global context, country outlines |
| Continental | 11-14 | ~30 MB each | Regional detail |
| Country | 11-16 | ~10-50 MB | High-detail local |

### Progressive Enhancement:
```javascript
// modules/visualization/offlineMapManager.js
class OfflineMapManager {
  async initialize() {
    // 1. Check for bundled world tiles
    this.hasWorldTiles = await this.checkAsset('maps/world.mbtiles');
    
    // 2. Check for regional tiles
    this.regions = await this.listRegions();
    
    // 3. If online, register service worker for tile caching
    if (navigator.onLine) {
      await this.registerTileCacheSW();
    }
    
    // 4. Init MapLibre with appropriate source
    this.initMapLibre();
  }
  
  async registerTileCacheSW() {
    // Service worker caches visited tiles for offline reuse
    const registration = await navigator.serviceWorker.register('/sw.js');
    registration.active.postMessage({ type: 'CACHE_TILES', bbox: this.getViewBounds() });
  }
}
```

### Target: v1.0.96 | Status: Planned | Master List Ref: P2-01

---

## 9.2 RF027 — Voice Announcements (TTS Integration) (P1, Low Effort)

**Component:** `MainActivity.java` (TextToSpeech) + `bounce.html` (trigger events)  
**Issue:** No audio feedback — user must watch screen for hazards/alerts  
**Current State:** Visual-only notifications  
**Proposed Refinement:** TextToSpeech integration for hands-free safety alerts  

### Android TTS Service:
```java
// TtsAnnouncer.java
public class TtsAnnouncer implements TextToSpeech.OnInitListener {
  private TextToSpeech tts;
  private Context context;
  private boolean ready = false;
  private final Queue<String> queue = new ConcurrentLinkedQueue<>();
  private final Set<String> announced = ConcurrentHashMap.newKeySet();
  private static final int COOLDOWN_MS = 5000; // Prevent spam
  
  public TtsAnnouncer(Context context) {
    this.context = context;
    tts = new TextToSpeech(context, this);
    tts.setLanguage(Locale.getDefault());
    tts.setSpeechRate(1.0f);
    tts.setPitch(1.0f);
  }
  
  @Override
  public void onInit(int status) {
    if (status == TextToSpeech.SUCCESS) {
      ready = true;
      processQueue();
    }
  }
  
  public void announce(String text, String id) {
    if (!ready) return;
    
    long now = System.currentTimeMillis();
    String key = id + ":" + text;
    
    // Dedupe: same alert within cooldown
    if (announced.contains(key)) return;
    
    announced.add(key);
    queue.offer(text);
    
    // Clean old keys
    new Handler(Looper.getMainLooper()).postDelayed(() -> announced.remove(key), COOLDOWN_MS);
    
    processQueue();
  }
  
  private void processQueue() {
    if (!ready || queue.isEmpty()) return;
    if (tts.isSpeaking()) return;
    
    String text = queue.poll();
    if (text != null) {
      tts.speak(text, TextToSpeech.QUEUE_FLUSH, null, UUID.randomUUID().toString());
    }
  }
  
  public void shutdown() {
    if (tts != null) {
      tts.stop();
      tts.shutdown();
    }
  }
}
```

### Alert Triggers (JavaScript → Android):
```javascript
// modules/positioning/bridge.js - Voice alerts
Bounce.nav.alerts = {
  onHazard: (callback) => eventBus.on('nav.alert.hazard', callback),
  onZoneChange: (callback) => eventBus.on('nav.alert.zone', callback),
  onAccuracyDrop: (callback) => eventBus.on('nav.alert.accuracy', callback)
};

// Android side - MainActivity
private void setupVoiceAlerts() {
  ttsAnnouncer = new TtsAnnouncer(this);
  
  // Hazard proximity (from positioning engine)
  positioningEngine.setHazardListener(hazard -> {
    String msg = String.format("Warning: %s at %.0f meters", hazard.type, hazard.distance);
    ttsAnnouncer.announce(msg, "hazard_" + hazard.id);
  });
  
  // Zone transitions
  zoneHMM.setTransitionListener((from, to, confidence) -> {
    if (confidence > 0.8) {
      ttsAnnouncer.announce("Entering " + to.getName(), "zone_" + to.getId());
    }
  });
  
  // Accuracy degradation
  positioningEngine.setAccuracyListener(accuracy -> {
    if (accuracy > 10.0 && !lowAccuracyAnnounced) {
      ttsAnnouncer.announce("Position accuracy low. Calibration recommended.", "accuracy_low");
      lowAccuracyAnnounced = true;
    } else if (accuracy < 5.0) {
      lowAccuracyAnnounced = false;
    }
  });
}
```

### JavaScript Voice Commands (Future):
```javascript
// Voice control (requires SpeechRecognition)
if ('webkitSpeechRecognition' in window) {
  const recognition = new webkitSpeechRecognition();
  recognition.continuous = false;
  recognition.lang = 'en-US';
  
  recognition.onresult = (e) => {
    const command = e.results[0][0].transcript.toLowerCase();
    handleVoiceCommand(command);
  };
  
  function handleVoiceCommand(cmd) {
    if (cmd.includes('export')) Bounce.sys.storage.export('gpx');
    if (cmd.includes('clear')) Bounce.viz.trail.clear();
    if (cmd.includes('scan')) Bounce.radio.scan.start();
    if (cmd.includes('where')) Bounce.nav.position.get().then(p => speak(`You are at ${p.zone}`));
  }
}
```

### Accessibility Integration:
- Respects system TTS settings (rate, pitch, voice)
- Honors "TalkBack" / "Select to Speak" coexistence
- Provides `contentDescription` for all voice-triggered UI

### Target: v1.0.95 | Status: Planned | Master List Ref: P2-03

---

*End of Piece 09/13*
---

# Refinement_Existing_Parts_Prioritized — Piece 10/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 10 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Export, Theming & Accessibility (RF028, RF030)

## 10.1 RF028 — Multi-Format Export (GPX/KML/CSV) (P1, Low Effort)

**Component:** `TrailExporter.java` + `bounce.html` export UI  
**Issue:** JSON only — limited interoperability with GIS tools, fitness apps  
**Current State:** `exportTrail()` returns GeoJSON FeatureCollection  
**Proposed Refinement:** Add GPX 1.1, KML 2.2, CSV export with metadata  

### Export Formats Specification:

#### GPX 1.1 (GPS Exchange Format):
```xml
<?xml version="1.0" encoding="UTF-8"?>
<gpx version="1.1" creator="BOUNCE v1.0.94" 
     xmlns="http://www.topografix.com/GPX/1/1"
     xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
     xsi:schemaLocation="http://www.topografix.com/GPX/1/1 http://www.topografix.com/GPX/1/1/gpx.xsd">
  <metadata>
    <name>BOUNCE Trail - 2026-10-08</name>
    <desc>Indoor positioning trail with RSSI fingerprints</desc>
    <time>2026-10-08T16:41:24Z</time>
    <extensions>
      <bounce:algorithm>EKF+ParticleFilter</bounce:algorithm>
      <bounce:apCount>12</bounce:apCount>
      <bounce:duration>1842</bounce:duration>
    </extensions>
  </metadata>
  <trk>
    <name>Session 2026-10-08</name>
    <trkseg>
      <trkpt lat="37.7749" lon="-122.4194">
        <ele>10.5</ele>
        <time>2026-10-08T16:00:00Z</time>
        <extensions>
          <bounce:accuracy>2.3</bounce:accuracy>
          <bounce:rssi>-58,-62,-71,-65</bounce:rssi>
          <bounce:zone>lobby</bounce:zone>
        </extensions>
      </trkpt>
      <!-- ... more track points ... -->
    </trkseg>
  </trk>
  <wpt lat="37.7749" lon="-122.4194">
    <name>AP: AA:BB:CC:DD:EE:FF</name>
    <extensions>
      <bounce:rssiMean>-65</bounce:rssiMean>
      <bounce:rssiVariance>12.5</bounce:rssiVariance>
    </extensions>
  </wpt>
</gpx>
```

#### KML 2.2 (Google Earth):
```xml
<?xml version="1.0" encoding="UTF-8"?>
<kml xmlns="http://www.opengis.net/kml/2.2">
  <Document>
    <name>BOUNCE Trail Export</name>
    <Style id="trailStyle">
      <LineStyle><color>ff00d4aa</color><width>3</width></LineStyle>
    </Style>
    <Style id="apStyle">
      <IconStyle><scale>1.2</scale><Icon><href>wifi.png</href></Icon></IconStyle>
    </Style>
    <Placemark>
      <name>Trail Path</name>
      <styleUrl>#trailStyle</styleUrl>
      <LineString>
        <tessellate>1</tessellate>
        <altitudeMode>relativeToGround</altitudeMode>
        <coordinates>
          -122.4194,37.7749,10.5
          -122.4193,37.7750,10.7
        </coordinates>
      </LineString>
    </Placemark>
    <Placemark>
      <name>Access Point AA:BB:CC:DD:EE:FF</name>
      <styleUrl>#apStyle</styleUrl>
      <Point><coordinates>-122.4194,37.7749,10.5</coordinates></Point>
      <ExtendedData>
        <Data name="rssiMean"><value>-65</value></Data>
        <Data name="rssiVariance"><value>12.5</value></Data>
      </ExtendedData>
    </Placemark>
  </Document>
</kml>
```

#### CSV (Spreadsheet Compatible):
```csv
timestamp,latitude,longitude,altitude,accuracy,rssi_values,zone,algorithm
2026-10-08T16:00:00Z,37.7749,-122.4194,10.5,2.3,"-58,-62,-71,-65",lobby,EKF
2026-10-08T16:00:01Z,37.7749,-122.4193,10.7,2.1,"-57,-63,-70,-64",lobby,EKF
```

### Implementation (Java):
```java
// TrailExporter.java
public class TrailExporter {
  
  public enum Format { GEOJSON, GPX, KML, CSV }
  
  public String export(Trail trail, Format format) {
    return switch (format) {
      case GEOJSON -> exportGeoJSON(trail);
      case GPX -> exportGPX(trail);
      case KML -> exportKML(trail);
      case CSV -> exportCSV(trail);
    };
  }
  
  private String exportGPX(Trail trail) {
    StringBuilder gpx = new StringBuilder();
    gpx.append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
    gpx.append("<gpx version=\"1.1\" creator=\"BOUNCE ").append(BuildConfig.VERSION_NAME).append("\" ");
    gpx.append("xmlns=\"http://www.topografix.com/GPX/1/1\" ");
    gpx.append("xmlns:bounce=\"http://bounce.csm/app\">\n");
    
    // Metadata
    gpx.append("  <metadata>\n");
    gpx.append("    <name>BOUNCE Trail - ").append(trail.getStartTime()).append("</name>\n");
    gpx.append("    <time>").append(ISO8601.format(trail.getStartTime())).append("</time>\n");
    gpx.append("  </metadata>\n");
    
    // Track
    gpx.append("  <trk>\n");
    gpx.append("    <trkseg>\n");
    for (TrailPoint pt : trail.getPoints()) {
      gpx.append("      <trkpt lat=\"").append(pt.lat).append("\" lon=\"").append(pt.lon).append("\">\n");
      gpx.append("        <ele>").append(pt.alt).append("</ele>\n");
      gpx.append("        <time>").append(ISO8601.format(pt.timestamp)).append("</time>\n");
      gpx.append("        <extensions>\n");
      gpx.append("          <bounce:accuracy>").append(pt.accuracy).append("</bounce:accuracy>\n");
      gpx.append("          <bounce:rssi>").append(String.join(",", pt.rssiValues)).append("</bounce:rssi>\n");
      gpx.append("          <bounce:zone>").append(pt.zone).append("</bounce:zone>\n");
      gpx.append("        </extensions>\n");
      gpx.append("      </trkpt>\n");
    }
    gpx.append("    </trkseg>\n");
    gpx.append("  </trk>\n");
    
    // Waypoints for APs
    for (AccessPoint ap : trail.getAccessPoints()) {
      gpx.append("  <wpt lat=\"").append(ap.lat).append("\" lon=\"").append(ap.lon).append("\">\n");
      gpx.append("    <name>AP: ").append(ap.bssid).append("</name>\n");
      gpx.append("    <extensions>\n");
      gpx.append("      <bounce:rssiMean>").append(ap.rssiMean).append("</bounce:rssiMean>\n");
      gpx.append("      <bounce:rssiVariance>").append(ap.rssiVariance).append("</bounce:rssiVariance>\n");
      gpx.append("    </extensions>\n");
      gpx.append("  </wpt>\n");
    }
    
    gpx.append("</gpx>");
    return gpx.toString();
  }
  
  // KML and CSV similar...
}
```

### JavaScript Export UI:
```javascript
// modules/ui/exportPanel.js
export function createExportPanel() {
  const formats = [
    { id: 'geojson', label: 'GeoJSON', ext: 'geojson', mime: 'application/geo+json' },
    { id: 'gpx', label: 'GPX 1.1', ext: 'gpx', mime: 'application/gpx+xml' },
    { id: 'kml', label: 'KML 2.2', ext: 'kml', mime: 'application/vnd.google-earth.kml+xml' },
    { id: 'csv', label: 'CSV', ext: 'csv', mime: 'text/csv' }
  ];
  
  return formats.map(f => ({
    ...f,
    export: async () => {
      const data = await Bounce.viz.trail.export(f.id);
      downloadBlob(new Blob([data], { type: f.mime }), `bounce_trail_${Date.now()}.${f.ext}`);
    }
  }));
}
```

### Target: v1.0.94 | Status: Planned | Master List Ref: P2-05

---

## 10.2 RF030 — Accessibility (Content Descriptions + TalkBack) (P2, Low Effort)

**Component:** `bounce.html` (HTML/CSS) + `MainActivity.java` (Android views)  
**Issue:** No accessibility support — excluded users with visual/motor impairments  
**Current State:** Canvas-only Three.js scene, no semantic HTML, no TalkBack labels  
**Proposed Refinement:** Full a11y compliance (WCAG 2.1 AA)  

### WebView Accessibility (HTML/JS):
```html
<!-- bounce.html - Semantic structure -->
<main role="main" aria-label="BOUNCE Indoor Positioning">
  <!-- Three.js canvas with accessible fallback -->
  <div id="scene-container" role="img" aria-label="3D positioning visualization" tabindex="0">
    <canvas id="three-canvas" aria-hidden="true"></canvas>
    <!-- Text alternative for screen readers -->
    <div id="scene-description" class="sr-only" aria-live="polite">
      Current position: Lobby. Accuracy: 2.3 meters. 12 access points visible. 
      Trail shows path from Entrance to Conference Room.
    </div>
  </div>
  
  <!-- Accessible HUD (not canvas-rendered) -->
  <aside id="hud" role="region" aria-label="Position metrics" aria-live="polite">
    <dl class="metrics">
      <dt>Position Accuracy</dt>
      <dd id="metric-accuracy" aria-live="polite">2.3 m</dd>
      <dt>Zone</dt>
      <dd id="metric-zone" aria-live="polite">Lobby</dd>
      <dt>Access Points</dt>
      <dd id="metric-aps" aria-live="polite">12 visible</dd>
      <dt>Algorithm</dt>
      <dd id="metric-algo">EKF + Particle Filter</dd>
    </dl>
  </aside>
  
  <!-- Keyboard-navigable controls -->
  <nav id="controls" role="navigation" aria-label="App controls">
    <button id="btn-scan" aria-pressed="false">Start Scan</button>
    <button id="btn-export" aria-haspopup="menu">Export Trail</button>
    <button id="btn-settings">Settings</button>
  </nav>
</main>
```

### Screen Reader Updates:
```javascript
// modules/ui/accessibility.js
class AccessibilityAnnouncer {
  constructor() {
    this.liveRegion = document.getElementById('scene-description');
    this.lastAnnouncement = '';
  }
  
  announcePosition(position) {
    const msg = `Position updated. ${position.zone}, accuracy ${position.accuracy.toFixed(1)} meters. ${position.apCount} access points.`;
    if (msg !== this.lastAnnouncement) {
      this.liveRegion.textContent = msg;
      this.lastAnnouncement = msg;
    }
  }
  
  announceZoneChange(from, to, confidence) {
    this.liveRegion.textContent = `Zone changed from ${from} to ${to}. Confidence ${Math.round(confidence * 100)} percent.`;
  }
  
  announceAlert(type, message) {
    this.liveRegion.textContent = `Alert: ${message}`;
  }
}

// Connect to positioning updates
eventBus.on('nav.position.update', (pos) => announcer.announcePosition(pos));
eventBus.on('nav.zone.transition', (t) => announcer.announceZoneChange(t.from, t.to, t.confidence));
eventBus.on('nav.alert.hazard', (h) => announcer.announceAlert('hazard', h.message));
```

### CSS for Screen Readers:
```css
/* bounce.html <style> */
.sr-only {
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip: rect(0, 0, 0, 0);
  white-space: nowrap;
  border: 0;
}

:focus-visible {
  outline: 3px solid var(--accent-primary);
  outline-offset: 2px;
}

/* High contrast mode support */
@media (prefers-contrast: more) {
  #scene-container { border: 3px solid #fff; }
  .metrics dd { font-weight: bold; }
}

/* Reduced motion */
@media (prefers-reduced-motion: reduce) {
  #three-canvas { transition: none !important; }
  .trail-animation { animation: none !important; }
}
```

### Android Native Accessibility:
```java
// MainActivity.java - View accessibility
private void setupAccessibility() {
  // Toolbar / ActionBar
  getSupportActionBar().setTitle("BOUNCE Indoor Positioning");
  
  // Floating action buttons
  fabScan.setContentDescription("Start Bluetooth and Wi-Fi scan");
  fabScan.setOnLongClickListener(v -> {
    announceForAccessibility("Double tap to start scanning");
    return true;
  });
  
  // Custom views (if any non-canvas)
  trailView.setAccessibilityDelegate(new View.AccessibilityDelegate() {
    @Override
    public void onInitializeAccessibilityNodeInfo(View host, AccessibilityNodeInfo info) {
      super.onInitializeAccessibilityNodeInfo(host, info);
      info.setClassName(Button.class.getName());
      info.setContentDescription("Trail visualization. " + getTrailDescription());
      info.addAction(AccessibilityNodeInfo.AccessibilityAction.ACTION_CLICK);
    }
  });
  
  // Live region for announcements
  AccessibilityManager am = (AccessibilityManager) getSystemService(ACCESSIBILITY_SERVICE);
  if (am.isEnabled()) {
    // Use TTS announcer (RF027) for critical alerts
  }
}

private String getTrailDescription() {
  Position pos = positioningEngine.getCurrentPosition();
  return String.format("Current zone: %s. Accuracy: %.1f meters. %d access points.", 
    pos.zone, pos.accuracy, pos.apCount);
}
```

### TalkBack Testing Checklist:
- [ ] Swipe navigation reaches all controls
- [ ] Double-tap activates buttons
- [ ] Position updates announced via live region
- [ ] Zone changes announced
- [ ] Alerts announced immediately
- [ ] Export menu navigable
- [ ] Settings screen fully accessible
- [ ] Color contrast ratios ≥ 4.5:1 (AA)
- [ ] Touch targets ≥ 48×48dp
- [ ] No keyboard traps

### Target: v1.0.95 | Status: Planned | Master List Ref: Android a11y

---

*End of Piece 10/13*
---

# Refinement_Existing_Parts_Prioritized — Piece 11/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 11 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Prioritization Matrix & Roadmap (RF001–RF030)

## 11.1 Prioritization Framework

### Scoring Model (WSJF - Weighted Shortest Job First):
```
Priority Score = (User Value + Time Criticality + Risk Reduction) / Effort

Where:
- User Value: 1-10 (impact on user experience)
- Time Criticality: 1-10 (urgency, deadlines)
- Risk Reduction: 1-10 (technical debt, bug prevention)
- Effort: 1-10 (person-weeks, inverted so lower effort = higher score)
```

### Refined Scores for All 30 Refinements:

| ID | Refinement | User Value | Time Critical | Risk Red. | Effort | WSJF Score | Priority |
|----|------------|------------|---------------|-----------|--------|------------|----------|
| RF002 | EKF vy bug fix | 10 | 10 | 10 | 1 | **30.0** | P0 ✅ Done |
| RF003 | Wi-Fi RTT ranging | 9 | 9 | 8 | 8 | **3.25** | P0 |
| RF005 | Trilateration self-calibration | 9 | 8 | 8 | 7 | **3.57** | P0 |
| RF021 | Release keystore/signing | 10 | 10 | 9 | 6 | **4.83** | P0 |
| RF001 | MainActivity split | 8 | 7 | 9 | 8 | **3.00** | P1 |
| RF004 | Particle filter adaptive | 8 | 6 | 7 | 7 | **3.00** | P1 |
| RF006 | Build SDK auto-detect | 7 | 8 | 6 | 2 | **10.5** | P1 |
| RF009 | Chart.js metrics expansion | 6 | 5 | 5 | 2 | **8.00** | P1 |
| RF010 | Trail adaptive rebuild | 6 | 4 | 5 | 2 | **7.50** | P1 |
| RF011 | BT scan adaptive | 7 | 5 | 6 | 2 | **9.00** | P1 |
| RF013 | EKF adaptive Q | 7 | 5 | 7 | 4 | **4.75** | P1 |
| RF014 | Zone HMM adaptive | 6 | 4 | 6 | 4 | **4.00** | P1 |
| RF016 | Bloom auto-scale | 7 | 6 | 7 | 5 | **4.00** | P1 |
| RF017 | PermissionManager | 6 | 5 | 7 | 5 | **3.60** | P1 |
| RF018 | JS Bridge namespaces | 7 | 4 | 6 | 3 | **5.67** | P1 |
| RF019 | ErrorReporter | 7 | 5 | 8 | 3 | **6.67** | P1 |
| RF022 | Unit tests (6 algos) | 8 | 7 | 9 | 8 | **3.00** | P1 |
| RF027 | Voice/TTS alerts | 8 | 6 | 5 | 3 | **6.33** | P1 |
| RF028 | Multi-format export | 6 | 4 | 4 | 3 | **4.67** | P1 |
| RF007 | HTML/Three.js modules | 6 | 3 | 6 | 5 | **3.00** | P2 |
| RF008 | Three.js version mgmt | 4 | 3 | 4 | 2 | **5.50** | P2 |
| RF012 | SSID broadcast adaptive | 5 | 3 | 4 | 2 | **6.00** | P2 |
| RF015 | Trail tension param | 3 | 2 | 2 | 1 | **7.00** | P2 |
| RF020 | APK size audit | 4 | 3 | 4 | 3 | **3.67** | R2 |
| RF023 | CI/CD pipeline | 7 | 6 | 8 | 6 | **3.50** | P2 |
| RF024 | Auto-version from git | 4 | 3 | 4 | 2 | **5.50** | P2 |
| RF025 | ProGuard/R8 | 5 | 3 | 5 | 3 | **4.33** | P2 |
| RF026 | Offline vector tiles | 7 | 4 | 6 | 9 | **1.89** | P2 |
| RF029 | Theme system | 5 | 2 | 3 | 2 | **5.00** | P2 |
| RF030 | Accessibility | 6 | 4 | 5 | 3 | **5.00** | P2 |

---

## 11.2 Release Roadmap (v1.0.92 → v1.0.96)

### v1.0.92 — **Critical Bug Fix** ✅ COMPLETE
- RF002: EKF vy initialization bug fix
- Pre-built APK: `CSMWip/05_BOUNCE/BOUNCE.WIP/v92/out/Bounce-v1.0.92.apk`

### v1.0.93 — **Foundation & Release Readiness** (Target: 2 weeks)
| Ref | Title | Effort | Owner |
|-----|-------|--------|-------|
| RF003 | Wi-Fi RTT ranging implementation | High | Radio team |
| RF005 | Trilateration AP self-calibration | High | Positioning team |
| RF006 | Build script SDK auto-detection | Low | Build team |
| RF021 | Release keystore & signing config | High | Release team |

**Gate:** Signed release APK uploads to Play Console internal track

### v1.0.94 — **Core Algorithm & UI Modernization** (Target: 4 weeks)
| Ref | Title | Effort | Owner |
|-----|-------|--------|-------|
| RF004 | Particle filter adaptive parameters | High | Positioning |
| RF007 | HTML/Three.js modularization | Medium | Frontend |
| RF008 | Three.js version management | Low | Frontend |
| RF009 | Chart.js metrics expansion | Low | Frontend |
| RF010 | Trail adaptive rebuild | Low | Frontend |
| RF011 | BT scan adaptive duty cycle | Low | Radio |
| RF012 | SSID broadcast adaptive | Low | Radio |
| RF013 | EKF adaptive process noise | Medium | Positioning |
| RF014 | Zone HMM adaptive transitions | Medium | Positioning |
| RF015 | Trail tension parameter | Low | Frontend |
| RF016 | Bloom auto-scale by GPU tier | Medium | Frontend |
| RF018 | JS Bridge namespace organization | Low | Bridge |
| RF019 | Centralized ErrorReporter | Low | Frontend |
| RF020 | APK size audit + ProGuard (RF025) | Low | Build |
| RF022 | Unit tests for 6 algorithms | High | QA |
| RF024 | Auto-version from git tags | Low | Build |
| RF028 | Multi-format export (GPX/KML/CSV) | Low | Data |
| RF029 | Theme system (CSS variables) | Low | Frontend |

**Gate:** All P1 items complete; unit test coverage >80%; APK <200KB

### v1.0.95 — **Architecture & Platform** (Target: 3 weeks)
| Ref | Title | Effort | Owner |
|-----|-------|--------|-------|
| RF001 | MainActivity split (4 services) | High | Architecture |
| RF017 | Unified PermissionManager | Medium | Architecture |
| RF023 | CI/CD pipeline (GitHub Actions) | Medium | DevOps |
| RF027 | Voice/TTS announcements | Low | Platform |

**Gate:** CI/CD passing; modular architecture deployed; Play Store beta

### v1.0.96 — **Advanced Features** (Target: 4 weeks)
| Ref | Title | Effort | Owner |
|-----|-------|--------|-------|
| RF026 | Offline vector map tiles | High | Maps |
| RF030 | Accessibility (TalkBack) | Low | Frontend |

**Gate:** Offline mode functional; WCAG 2.1 AA compliant; Production release

---

## 11.3 Dependency Graph

```
                    ┌─────────────┐
                    │  RF006      │ Build auto-detect
                    │  (P1, Low)  │
                    └──────┬──────┘
                           │
          ┌────────────────┼────────────────┐
          ▼                ▼                ▼
    ┌───────────┐    ┌───────────┐    ┌───────────┐
    │  RF021    │    │  RF023    │    │  RF024    │
    │ Release   │    │ CI/CD     │    │ Version   │
    │ signing   │    │ pipeline  │    │ auto-gen  │
    └─────┬─────┘    └─────┬─────┘    └─────┬─────┘
          │                │                │
          └────────────────┼────────────────┘
                           ▼
              ┌─────────────────────────┐
              │     v1.0.93 Release     │
              └───────────┬─────────────┘
                          │
        ┌─────────────────┼─────────────────┐
        ▼                 ▼                 ▼
┌───────────────┐ ┌───────────────┐ ┌───────────────┐
│ Positioning   │ │ Frontend/     │ │ Build/Infra   │
│ RF003, RF005  │ │ RF007-016     │ │ RF020, RF025  │
│ RF004, RF013  │ │ RF018, RF019  │ │ RF022, RF024  │
│ RF014         │ │ RF028, RF029  │ │               │
└───────┬───────┘ └───────┬───────┘ └───────┬───────┘
        │                 │                 │
        └─────────────────┼─────────────────┘
                          ▼
              ┌─────────────────────────┐
              │     v1.0.94 Release     │
              └───────────┬─────────────┘
                          │
        ┌─────────────────┼─────────────────┐
        ▼                 ▼                 ▼
┌───────────────┐ ┌───────────────┐ ┌───────────────┐
│ Architecture  │ │ Platform      │ │ DevOps        │
│ RF001, RF017  │ │ RF027         │ │ RF023         │
└───────┬───────┘ └───────┬───────┘ └───────┬───────┘
        │                 │                 │
        └─────────────────┼─────────────────┘
                          ▼
              ┌─────────────────────────┐
              │     v1.0.95 Release     │
              └───────────┬─────────────┘
                          │
                          ▼
              ┌─────────────────────────┐
              │      RF026, RF030       │
              │   Offline + A11y        │
              └───────────┬─────────────┘
                          ▼
              ┌─────────────────────────┐
              │     v1.0.96 Release     │
              │    Production Ready     │
              └─────────────────────────┘
```

---

## 11.4 Resource Allocation (5-Person Team)

| Sprint | Focus | Person 1 | Person 2 | Person 3 | Person 4 | Person 5 |
|--------|-------|----------|----------|----------|----------|----------|
| 1-2 | v1.0.93 | RF003 | RF005 | RF006 | RF021 | RF021 |
| 3-6 | v1.0.94 | RF004 | RF007 | RF009 | RF010 | RF011 |
|  |  | RF013 | RF014 | RF016 | RF018 | RF019 |
|  |  | RF022 | RF022 | RF020 | RF025 | RF028 |
| 7-9 | v1.0.95 | RF001 | RF001 | RF017 | RF023 | RF027 |
| 10-13 | v1.0.96 | RF026 | RF026 | RF030 | RF026 | RF026 |

---

## 11.5 Risk-Adjusted Timeline

| Version | Optimistic | Realistic | Pessimistic | Key Risks |
|---------|------------|-----------|-------------|-----------|
| v1.0.93 | 1 week | 2 weeks | 3 weeks | RTT hardware availability |
| v1.0.94 | 3 weeks | 4 weeks | 6 weeks | Algorithm complexity, Three.js migration |
| v1.0.95 | 2 weeks | 3 weeks | 5 weeks | Architecture refactor scope creep |
| v1.0.96 | 3 weeks | 4 weeks | 6 weeks | Tile generation pipeline, a11y testing |
| **Total** | **9 weeks** | **13 weeks** | **20 weeks** | |

---

*End of Piece 11/13*
---

# Refinement_Existing_Parts_Prioritized — Piece 12/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 12 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Risk Assessment & Dependencies (RF001–RF030)

## 12.1 Risk Register

| Risk ID | Description | Likelihood | Impact | Score | Mitigation | Owner | Trigger |
|---------|-------------|------------|--------|-------|------------|-------|---------|
| RISK-001 | Wi-Fi RTT hardware unavailable on test devices | High | High | 9 | Procure Pixel 6+/Samsung S21+; simulate in CI | Radio Lead | Device procurement |
| RISK-002 | MainActivity split breaks existing JS bridge | High | High | 9 | Incremental extraction; bridge compatibility layer | Arch Lead | v1.0.95 sprint start |
| RISK-003 | Three.js module migration breaks visual features | Medium | High | 6 | Visual regression tests; feature flags; rollback plan | Frontend Lead | v1.0.94 sprint start |
| RISK-004 | Particle filter adaptive params diverge in production | Medium | Medium | 4 | Extensive synthetic testing; fallback to fixed params | Positioning Lead | v1.0.94 integration |
| RISK-005 | Release keystore lost/compromised | Low | Critical | 5 | HSM backup; split knowledge; documented recovery | Release Lead | Keystore generation |
| RISK-006 | CI/CD pipeline fails on GitHub Actions runners | Medium | Medium | 4 | Local validation script; self-hosted runner option | DevOps Lead | Pipeline creation |
| RISK-007 | Offline tiles exceed app size limit (150MB) | Medium | High | 6 | Progressive download; regional bundles; compression | Maps Lead | Tile generation |
| RISK-008 | Accessibility audit reveals major gaps | Low | Medium | 3 | Early a11y testing; automated axe-core in CI | Frontend Lead | v1.0.96 start |
| RISK-009 | Unit test coverage <80% for algorithms | Medium | Medium | 4 | Test-first for new code; coverage gate in CI | QA Lead | v1.0.94 test phase |
| RISK-010 | APK size exceeds 200KB after features | Low | Medium | 3 | Size budget per feature; ProGuard; bundle analyzer | Build Lead | Each release |
| RISK-011 | EKF adaptive Q causes filter instability | Medium | High | 6 | Clamping bounds; divergence detection; fallback | Positioning Lead | RF013 integration |
| RISK-012 | Zone HMM learning produces invalid transitions | Low | Medium | 2 | Dirichlet prior; min transition count; validation | Positioning Lead | RF014 integration |
| RISK-013 | Bluetooth adaptive scan misses beacons | Low | Medium | 2 | Minimum scan floor; configurable bounds | Radio Lead | RF011 integration |
| RISK-014 | GPX/KML export loses precision | Low | Low | 1 | Fixed decimal places (7); validation tests | Data Lead | RF028 integration |
| RISK-015 | Theme system breaks Chart.js/Three.js colors | Medium | Medium | 4 | CSS variable mapping tests; theme snapshot testing | Frontend Lead | RF029 integration |

---

## 12.2 Technical Dependencies

### Internal Dependencies (Within BOUNCE):
```
RF006 (Build auto-detect)
    ├─→ RF021 (Release signing) - needs detected paths
    ├─→ RF023 (CI/CD) - needs reproducible build
    └─→ RF024 (Auto-version) - needs build script integration

RF021 (Release keystore)
    ├─→ RF023 (CI/CD) - needs secrets in GitHub
    └─→ RF025 (ProGuard) - needs release build

RF003 (Wi-Fi RTT)
    ├─→ RF005 (Trilateration calibration) - needs RTT ranges
    └─→ RF013 (EKF adaptive Q) - needs RTT variance

RF004 (Particle filter adaptive)
    ├─→ RF013 (EKF adaptive Q) - shared RSSI variance
    └─→ RF014 (Zone HMM) - shared zone/RSSI data

RF007 (HTML modules)
    ├─→ RF008 (Three.js version) - needs module build
    ├─→ RF009 (Chart.js metrics) - needs event bus
    ├─→ RF010 (Trail adaptive) - needs trail module
    ├─→ RF015 (Trail tension) - needs trail module
    ├─→ RF016 (Bloom auto-scale) - needs render module
    ├─→ RF018 (JS Bridge) - needs bridge module
    ├─→ RF019 (ErrorReporter) - needs core module
    ├─→ RF028 (Export) - needs trail module
    ├─→ RF029 (Theme) - needs CSS variable system
    └─→ RF030 (A11y) - needs semantic HTML structure

RF022 (Unit tests)
    ├─→ RF002 (EKF vy fix) - regression test
    ├─→ RF003 (RTT) - test RTT ranging
    ├─→ RF004 (Particle) - test adaptive params
    ├─→ RF005 (Trilateration) - test calibration
    ├─→ RF013 (EKF adaptive) - test Q adaptation
    └─→ RF014 (HMM adaptive) - test transition learning

RF023 (CI/CD)
    ├─→ RF006 (Build script) - build step
    ├─→ RF021 (Signing) - release step
    ├─→ RF022 (Tests) - test step
    ├─→ RF024 (Version) - version step
    └─→ RF025 (ProGuard) - optimize step
```

### External Dependencies:
| Refinement | External Dependency | Version | Risk |
|------------|---------------------|---------|------|
| RF003 | Android SDK (WifiRttManager) | API 28+ | Hardware required |
| RF003 | Google Play Services | Latest | Runtime availability |
| RF007 | Three.js | r158+ | Breaking changes |
| RF007 | ES6 Modules | WebView 60+ | Android 7+ only |
| RF008 | jsDelivr/CDN | - | Network for updates |
| RF009 | Chart.js | 4.x | Breaking from 3.x |
| RF016 | WebGL2 | Android 7+ | GPU tier detection |
| RF021 | keytool/jarsigner | JDK 17+ | Build environment |
| RF023 | GitHub Actions | ubuntu-latest | Runner availability |
| RF026 | OpenStreetMap data | Current | License (ODbL) |
| RF026 | tippecanoe/tilemaker | Latest | Build toolchain |
| RF027 | Android TTS | API 21+ | Voice availability |
| RF029 | CSS Custom Properties | WebView 59+ | Android 7+ |
| RF030 | Accessibility APIs | API 14+ | Universal |

---

## 12.3 Cross-Refinement Synergies

### Shared Infrastructure Investments:
| Investment | Benefits | Refinements Enabled |
|------------|----------|---------------------|
| **Event Bus** (core module) | Decoupled communication | RF007, RF009, RF010, RF015, RF016, RF018, RF019, RF028, RF029, RF030 |
| **RSSI Variance Pipeline** | Shared signal quality metric | RF004, RF013, RF014 |
| **AP Position Store** | Calibrated positions persist | RF003, RF005, RF014 |
| **Error/Telemetry Pipeline** | Unified observability | RF019, RF022, RF023 |
| **Settings/Preferences Store** | User config persistence | RF008, RF015, RF016, RF029, RF030 |
| **Asset Manager** | Offline asset loading | RF008, RF026, RF029 |

### Parallelizable Workstreams:
```
Workstream A: Positioning Core (RF003, RF004, RF005, RF013, RF014)
    → Independent of frontend, requires radio hardware

Workstream B: Frontend Architecture (RF007, RF008, RF009, RF010, RF015, RF016, RF029)
    → Independent of positioning, requires Three.js/Chart.js expertise

Workstream C: Bridge & Platform (RF018, RF019, RF027, RF028, RF030)
    → Requires Android + JS coordination

Workstream D: Build & Release (RF006, RF021, RF023, RF024, RF025)
    → Independent, foundational for all releases

Workstream E: Testing & Quality (RF022)
    → Parallel with all, gates releases
```

---

## 12.4 Rollback & Contingency Plans

| Refinement | Rollback Trigger | Rollback Plan | Contingency |
|------------|------------------|---------------|-------------|
| RF003 (RTT) | Hardware unsupported on >50% devices | Disable RTT; fallback to RSSI-only | Ship without RTT; revisit v1.0.97 |
| RF007 (Modules) | Visual regression >5% | Feature flag: `useModules=false` | Keep monolithic HTML; modularize v1.0.97 |
| RF013 (Adaptive Q) | Filter divergence rate >5% | Clamp Q to fixed bounds | Fixed Q with manual tuning |
| RF016 (Bloom) | FPS drop >15% on mid-tier | Disable bloom on `mid`/`low` tiers | Static bloom config |
| RF021 (Keystore) | Keystore generation fails | Use debug key for internal; delay Play Store | Document manual process |
| RF026 (Offline tiles) | Size >150MB | Reduce zoom levels; drop regions | Online-only with caching |
| RF030 (A11y) | TalkBack breaks core flow | Minimal labels only; defer full a11y | WCAG 2.1 A only |

---

## 12.5 Definition of Done (Per Refinement)

| Ref | Code Complete | Unit Tests | Integration Tests | Docs | Code Review | Deployed to Staging |
|-----|---------------|------------|-------------------|------|-------------|---------------------|
| RF001 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF003 | ✅ | ✅ | ✅ (hw) | ✅ | ✅ | ✅ |
| RF004 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF005 | ✅ | ✅ | ✅ (hw) | ✅ | ✅ | ✅ |
| RF006 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF007 | ✅ | ✅ | ✅ (visual) | ✅ | ✅ | ✅ |
| RF008 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF009 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF010 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF011 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF012 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF013 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF014 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF015 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF016 | ✅ | ✅ | ✅ (perf) | ✅ | ✅ | ✅ |
| RF017 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF018 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF019 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF020 | ✅ | N/A | ✅ (size) | ✅ | ✅ | ✅ |
| RF021 | ✅ | N/A | ✅ (sign) | ✅ | ✅ | ✅ |
| RF022 | ✅ | ✅ (>80%) | ✅ | ✅ | ✅ | ✅ |
| RF023 | ✅ | N/A | ✅ (pipeline) | ✅ | ✅ | ✅ |
| RF024 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF025 | ✅ | N/A | ✅ (size) | ✅ | ✅ | ✅ |
| RF026 | ✅ | ✅ | ✅ (offline) | ✅ | ✅ | ✅ |
| RF027 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF028 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF029 | ✅ | ✅ | ✅ (visual) | ✅ | ✅ | ✅ |
| RF030 | ✅ | ✅ | ✅ (a11y) | ✅ | ✅ | ✅ |

---

*End of Piece 12/13*
---

# Refinement_Existing_Parts_Prioritized — Piece 13/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 13 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Summary & Next Steps

## 13.1 Complete Refinement Catalog (30 Items)

| ID | Title | Priority | Effort | Target | Status | Dependencies |
|----|-------|----------|--------|--------|--------|--------------|
| RF001 | MainActivity split (4 services) | P1 | High | v1.0.95 | Planned | RF006, RF017, RF022 |
| RF002 | EKF vy initialization bug fix | P0 | Low | v1.0.92 | **Done** | — |
| RF003 | Wi-Fi RTT ranging implementation | P0 | High | v1.0.93 | Planned | API 28+, HW |
| RF004 | Particle filter adaptive params | P1 | High | v1.0.94 | Planned | Scan history |
| RF005 | Trilateration AP self-calibration | P0 | High | v1.0.93 | Planned | Movement data, RF003 |
| RF006 | Build script SDK auto-detection | P1 | Low | v1.0.93 | Planned | — |
| RF007 | HTML/Three.js modularization | P2 | Medium | v1.0.94 | Planned | ES6 modules |
| RF008 | Three.js version management | P2 | Low | v1.0.94 | Planned | Build pipeline |
| RF009 | Chart.js metrics expansion (12→4) | P1 | Low | v1.0.94 | Planned | Telemetry pipe |
| RF010 | Trail adaptive rebuild | P1 | Low | v1.0.94 | Planned | Velocity data |
| RF011 | BT scan adaptive duty cycle | P1 | Low | v1.0.94 | Planned | Device activity |
| RF012 | SSID broadcast adaptive | P2 | Low | v1.0.94 | Planned | GPS/accel |
| RF013 | EKF adaptive process noise | P1 | Medium | v1.0.94 | Planned | RSSI variance |
| RF014 | Zone HMM adaptive transitions | P1 | Medium | v1.0.94 | Planned | Zone history |
| RF015 | Trail tension parameter | P2 | Low | v1.0.94 | Planned | User settings |
| RF016 | Bloom auto-scale by GPU tier | P1 | Medium | v1.0.94 | Planned | WebGL2 bench |
| RF017 | Unified PermissionManager | P1 | Medium | v1.0.95 | Planned | All perms |
| RF018 | JS Bridge namespaces | P1 | Low | v1.0.94 | Planned | Bridge refactor |
| RF019 | Centralized ErrorReporter | P1 | Low | v1.0.94 | Planned | Error boundary |
| RF020 | APK size audit + ProGuard | R2 | Low | v1.0.94 | Planned | Build pipeline |
| RF021 | Release keystore & signing | P0 | High | v1.0.93 | Planned | Keystore gen |
| RF022 | Unit tests (6 algorithms) | P1 | High | v1.0.94 | Planned | JUnit 5 |
| RF023 | CI/CD pipeline (GitHub Actions) | P2 | Medium | v1.0.95 | Planned | RF006, RF021 |
| RF024 | Auto-version from git tags | P2 | Low | v1.0.94 | Planned | Git tags |
| RF025 | ProGuard/R8 minification | P2 | Low | v1.0.94 | Planned | RF020 |
| RF026 | Offline vector map tiles | P2 | High | v1.0.96 | Planned | OSM data |
| RF027 | Voice/TTS announcements | P1 | Low | v1.0.95 | Planned | TTS API |
| RF028 | Multi-format export (GPX/KML/CSV) | P1 | Low | v1.0.94 | Planned | Trail system |
| RF029 | Theme system (CSS variables) | P2 | Low | v1.0.94 | Planned | CSS vars |
| RF030 | Accessibility (TalkBack) | P2 | Low | v1.0.95 | Planned | WCAG 2.1 AA |

**Priority Summary:** P0=5 (1 Done), P1=14, P2=9, R2=2 | **Total Effort:** High=6, Medium=14, Low=10

---

## 13.2 Forensic Analysis Integration

This refinement catalog is directly derived from forensic analysis of **91 BOUNCE versions** (v1.0.0–v1.0.91):

### Key Forensic Drivers:
1. **Code Growth:** MainActivity 160→1,416 lines (8.8×), HTML 303→770 lines (2.5×)
2. **Build Failures:** 5 versions with APK size anomalies (v1.0.77, 80, 81, 82, 83)
3. **Critical Bug:** EKF vy initialization (PositionEKF.java:38) — fixed in v1.0.92
4. **Algorithm Evolution:** 6 positioning algorithms added without test coverage
5. **Architecture Debt:** Zero modularization, monolithic HTML, flat JS bridge

### Spreadsheet Cross-Reference:
- **Refinement_Existing_Parts_Spreadsheet.csv** — This catalog (30 rows)
- **Future_Progress_Spreadsheet.csv** — P0-P3 roadmap alignment
- **Repeated_Errors_Catalog_Spreadsheet.csv** — Root causes driving RF002, RF006, RF019
- **Best_Practices_AntiPatterns_Spreadsheet.csv** — Anti-patterns driving RF001, RF007, RF017
- **Working_Features_Versions_Spreadsheet.csv** — Feature timeline informing targets
- **Connection_Pathways_Spreadsheet.csv** — Bridge refactoring scope (RF018)

---

## 13.3 Immediate Next Steps (This Week)

### Week 1: Foundation (v1.0.93 Prep)
- [ ] **RF006:** Implement build.sh auto-detection (2 days)
- [ ] **RF021:** Generate release keystore, document credentials (1 day)
- [ ] **RF003:** Begin Wi-Fi RTT ranging prototype (3 days)
- [ ] **RF005:** Design trilateration calibration algorithm (2 days)

### Week 2: v1.0.93 Release
- [ ] Complete RF003 RTT ranging (integration with WifiRttManager)
- [ ] Complete RF005 self-calibration (Gauss-Newton solver)
- [ ] Integrate RF006 + RF021 into build.sh
- [ ] Produce signed release APK
- [ ] Internal testing on Pixel 6+/Samsung S21+

### Week 3-4: v1.0.94 Sprint Planning
- [ ] Set up Three.js module build pipeline (esbuild/rollup)
- [ ] Create test infrastructure (JUnit 5 + synthetic data)
- [ ] Begin Particle Filter adaptive parameters (RF004)
- [ ] Begin EKF adaptive Q (RF013)
- [ ] Begin HTML modularization (RF007) — config + eventBus first

---

## 13.4 Success Metrics

### Release Gate Criteria:

| Version | Metric | Target |
|---------|--------|--------|
| v1.0.93 | Signed release APK | ✅ Play Console upload |
|  | RTT ranging functional | ✅ 3+ devices |
|  | AP self-calibration | ✅ <2m error |
| v1.0.94 | Unit test coverage | >80% (algorithms) |
|  | APK size | <200KB |
|  | Three.js modules | Zero visual regressions |
|  | All P1 items | ✅ Complete |
| v1.0.95 | CI/CD pipeline | ✅ Green on main |
|  | Modular architecture | ✅ 4 services extracted |
|  | Play Store beta | ✅ Live |
| v1.0.96 | Offline mode | ✅ Functional |
|  | Accessibility | ✅ WCAG 2.1 AA |
|  | Production release | ✅ 1.0.96 on Play Store |

### Ongoing KPIs:
- **Crash-free sessions:** >99.5%
- **Position accuracy (median):** <3m indoor
- **Build time:** <5 minutes
- **APK size:** <200KB
- **Test coverage:** >80% (algorithms), >60% (overall)

---

## 13.5 Long-Term Vision (Post v1.0.96)

| Horizon | Focus | Key Initiatives |
|---------|-------|-----------------|
| **v1.1** | Mesh Networking | Device-to-device ranging, cooperative localization |
| **v1.2** | AI/ML Positioning | Neural network RSSI fingerprinting, learned motion models |
| **v1.3** | Standards & Interop | IEEE 802.11az, OmniLock, FiRa Consortium alignment |
| **v2.0** | Platform | Cross-platform (iOS via Capacitor), web PWA, desktop |

---

## 13.6 Appendix: File Locations

| Artifact | Location |
|----------|----------|
| This section (13 pieces) | `CSMApps/Bounce/work-in-progress/BOUNCE_EVOLUTION/article10_A3-10_piece_XX.md` |
| Refinement spreadsheet | `CSMApps/Bounce/work-in-progress/BOUNCE_EVOLUTION/Refinement_Existing_Parts_Spreadsheet.csv` |
| Forensic analysis | `CSMApps/Bounce/work-in-progress/BOUNCE_EVOLUTION/forensic/analysis/` |
| Master index | `CSMApps/Bounce/work-in-progress/BOUNCE_EVOLUTION/MASTER_INDEX.md` |
| GitHub handler script | `csmpieces/05_scripts_tools/GitHub_handler.sh` |
| Session resume file | `CSMApps/Bounce/work-in-progress/BOUNCE_EVOLUTION/framework/RESUME_SESSION_NEXT_RUNNER.md` |

---

## 13.7 Final Notes

This completes **Section 10: Refinement of Existing Parts** — the 10th of 13 planned sections in the BOUNCE Evolution documentation suite.

**Sections Complete (10/13):**
1. ✅ HTML Aspects / Three.js Visualization
2. ✅ Android Main Features / Radio Positioning
3. ✅ Connection Pathways / Bidirectional
4. ✅ SDK / Tools / Methods / Build Pipeline
5. ✅ Best Practices / Anti-Patterns Catalog
6. ✅ Repeated Errors Catalog / Solutions
7. ✅ Future Progress / Roadmap P0-P3
8. ✅ TGAPP Monetization Architecture
9. ✅ Working Features + Versions History
10. ✅ **Refinement of Existing Parts (THIS SECTION)**

**Sections Remaining (3/13):**
11. ⏳ Future Thoughts / Evaluations / Vision
12. ⏳ Forensic Analysis Data / 91 Versions
13. ✅ Master Index + Cross-Reference (already complete)

---

*End of Section 10 — Refinement of Existing Parts Prioritized*
*Total: 13 pieces, ~4,500 lines of technical documentation*
*Ready for GitHub Handler workflow: concat → zip → verify → organize → commit-push*
---

