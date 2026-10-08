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