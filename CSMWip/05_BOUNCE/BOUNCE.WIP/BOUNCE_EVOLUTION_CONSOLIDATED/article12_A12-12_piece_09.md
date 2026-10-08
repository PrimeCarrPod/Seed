# Forensic_Analysis_Data_91_Versions — Piece 09/13
## Article A12: A12-12 — Forensic Analysis Data 91 Versions
**Piece:** 09 of 13  
**Generated:** 2026-10-08 22:14:32 UTC

---

# Diff Analysis: Visualization Evolution (bounce.html)

## Three.js Version & Architecture

| Version | Three.js | Renderer | Architecture |
|---------|----------|----------|--------------|
| 1.0.0 | r128 (2021) | WebGLRenderer | Single HTML file, inline JS |
| 1.0.91 | r128 (same) | WebGLRenderer | Single HTML file, inline JS |
| **Note** | **No upgrade** in 91 versions | | Migration planned (FT006) |

## Visualization Feature Timeline

### Foundation (v1.0.0 — v1.0.10)
| Feature | Version | Lines | Description |
|---------|---------|-------|-------------|
| Scene + Camera + Renderer | 1.0.0 | ~80 | PerspectiveCamera, WebGLRenderer, antialias |
| OrbitControls | 1.0.1 | +30 | Mouse drag/zoom/pan |
| Grid Floor | 1.0.0 | ~20 | GridHelper, 10m×10m, 1m divisions |
| Beacon Geometry | 1.0.1 | ~30 | SphereGeometry + MeshBasicMaterial (color by type) |
| Beacon Animation | 1.0.1 | ~15 | Pulse scale (sin(time)) |
| JS Bridge | 1.0.0 | ~40 | `window.android.onBeaconUpdate(json)` |

### Trail Visualization (v1.0.5 — v1.0.34)
| Feature | Version | Lines | Description |
|---------|---------|-------|-------------|
| Trail Curve | 1.0.5 | +50 | CatmullRomCurve3 from position history |
| Trail Tube | 1.0.5 | +20 | TubeGeometry along curve, gradient material |
| Trail Decay | 1.0.10 | +15 | Alpha fade by age, max 100 points |
| Speed Color | 1.0.33 | +16 | Green→Yellow→Red by velocity magnitude |
| Width by Accuracy | 1.0.33 | +8 | Thicker = lower accuracy |

### Camera & Interaction (v1.0.34 — v1.0.50)
| Feature | Version | Lines | Description |
|---------|---------|-------|-------------|
| Camera Modes | 1.0.34 | +2 | Enum: FOLLOW, ORBIT, TOP_DOWN, FIRST_PERSON |
| Follow Mode | 1.0.34 | +15 | Camera.lerp to vehicle position + offset |
| Top-Down | 1.0.34 | +8 | OrthographicCamera, fixed Y |
| First-Person | 1.0.34 | +12 | Camera attached to vehicle quaternion |
| HUD Panels | 1.0.49 | +30 | CSS2DObject overlays (not WebGL) |

### Sensor & Data Visualization (v1.0.18 — v1.0.79)
| Feature | Version | Lines | Description |
|---------|---------|-------|-------------|
| Sensor Overlay | 1.0.18 | +16 | Pitch/roll/yaw gauges (CSS2D) |
| BLE Device List | 1.0.49 | +44 | Scrollable panel, RSSI bars |
| RSSI History Chart | 1.0.49 | +12 | Canvas-based sparkline (last 60s) |
| Mesh Status Panel | 1.0.78 | +18 | Neighbor count, relay rate, TTL |
| Kalman Covariance Ellipse | 1.0.72 | +26 | 2D ellipse from P[0:2,0:2] eigendecomposition |
| EKF State Vectors | 1.0.79 | +8 | Arrows: position, velocity, acceleration |

### BT 3D Spatial Visualization (v1.0.86 — MAJOR)
| Feature | Version | Lines | Description |
|---------|---------|-------|-------------|
| 3D Beacon Geometry | 1.0.86 | +40 | Cone for direction, sphere for position |
| Phase Visualization | 1.0.86 | +30 | Wavefront rings from antenna array |
| Elevation View | 1.0.86 | +25 | Side view (X-Z plane) toggle |
| Antenna Array Model | 1.0.86 | +15 | 4-element array, configurable spacing |
| CTE Waveform | 1.0.86 | +14 | IQ sample visualization |

### 6-Algorithm Fusion UI (v1.0.90 — v1.0.91)
| Feature | Version | Lines | Description |
|---------|---------|-------|-------------|
| Algorithm Confidence Bars | 1.0.90 | +16 | Horizontal bars per algorithm |
| Source Badges | 1.0.90 | +8 | WiFi/BLE/RTT/BT3D/IMU icons |
| Fusion Weight Display | 1.0.90 | +12 | Real-time weight adjustment UI |
| Update Notification | 1.0.91 | +4 | Toast + banner for OTA |

## Shader Evolution

| Version | Shaders | Description |
|---------|---------|-------------|
| 1.0.0 | None | MeshBasicMaterial only |
| 1.0.33 | Beacon pulse | Vertex: `scale = 1.0 + 0.3*sin(time*5.0)` |
| 1.0.49 | BLE RSSI | Fragment: color by signal strength (dBm → HSV) |
| 1.0.72 | Covariance ellipse | Custom ShaderMaterial for 2D ellipse |
| 1.0.86 | BT 3D phase | Vertex: phase rings, Fragment: directional lobe |
| 1.0.91 | Same | No new shaders |

**Total Custom Shaders**: 4 (pulse, RSSI, ellipse, phase)

## Performance Metrics (from Code Analysis)

### Object Counts by Version
| Version | Meshes | Geometries | Materials | Textures | Animation Frame Cost |
|---------|--------|------------|-----------|----------|---------------------|
| 1.0.0 | 12 | 5 | 8 | 0 | ~2ms |
| 1.0.25 | 45 | 12 | 20 | 1 | ~5ms |
| 1.0.48 | 78 | 18 | 32 | 2 | ~8ms |
| 1.0.79 | 95 | 22 | 38 | 2 | ~12ms |
| 1.0.86 | 180 | 35 | 55 | 5 | ~18ms |
| 1.0.91 | 200 | 38 | 60 | 5 | ~20ms |

**Bottleneck**: BT 3D (v1.0.86) adds 85 meshes (antenna array + phase rings × 4 antennas)

### Memory Profile (Estimated)
| Version | GPU Memory | JS Heap | Notes |
|---------|------------|---------|-------|
| 1.0.0 | ~15MB | ~10MB | Baseline |
| 1.0.48 | ~25MB | ~15MB | BLE device geometries |
| 1.0.79 | ~35MB | ~20MB | Kalman ellipse buffers |
| 1.0.86 | ~55MB | ~30MB | **BT 3D: 4 antenna arrays + phase rings** |
| 1.0.91 | ~60MB | ~32MB | Stable |

## HTML/JS Code Quality Metrics

| Metric | v1.0.0 | v1.0.91 | Change |
|--------|--------|---------|--------|
| Lines | 303 | 770 | +154% |
| Functions | 12 | 38 | +217% |
| Global Variables | 8 | 3 | **-63%** (modularization) |
| Event Listeners | 3 | 12 | +300% |
| Three.js Objects | 15 | 200+ | +1233% |
| Shader Programs | 0 | 4 | New |
| CSS2D Objects | 0 | 8 | New (HUD) |

## WebView Integration Evolution

### JavaScript Bridge (Android → WebView)
| Version | Methods | Data Types |
|---------|---------|------------|
| 1.0.0 | 1 (`onBeaconUpdate`) | JSON string |
| 1.0.18 | 3 (+ sensor, position) | JSON |
| 1.0.48 | 5 (+ ble, mesh) | JSON |
| 1.0.79 | 7 (+ ekf, kalman) | JSON |
| 1.0.86 | 10 (+ bt3d, algorithms) | JSON + ArrayBuffer (for IQ) |
| 1.0.91 | 11 (+ update, crash) | JSON + ArrayBuffer |

### WebView Settings Evolution
```java
// v1.0.0
webView.getSettings().setJavaScriptEnabled(true);
webView.addJavascriptInterface(bridge, "android");

// v1.0.91 (hardened)
webView.getSettings().setJavaScriptEnabled(true);
webView.getSettings().setDomStorageEnabled(true);
webView.getSettings().setWebGLRenderingContextEnabled(true);
webView.setWebContentsDebuggingEnabled(BuildConfig.DEBUG);
webView.addJavascriptInterface(bridge, "android");
// CSP header injected via loadDataWithBaseURL
```

## Visualization Bugs Found in Diffs

| Bug | Version Introduced | Version Fixed | Description |
|-----|-------------------|---------------|-------------|
| Trail memory leak | 1.0.5 | 1.0.10 | Unbounded point array (fixed: max 100) |
| Beacon flicker | 1.0.1 | 1.0.3 | Pulse animation not synced (fixed: shared time uniform) |
| Camera jump | 1.0.34 | 1.0.35 | Mode switch not lerped (fixed: smooth transition) |
| BLE chart crash | 1.0.49 | 1.0.51 | Canvas context lost (fixed: resize handler) |
| Kalman ellipse NaN | 1.0.72 | 1.0.74 | Eigendecomposition on singular P (fixed: regularization) |
| BT 3D phase wrap | 1.0.86 | 1.0.87 | Phase > 2π not wrapped (fixed: modulo) |

## Migration Readiness (for Three.js r158+)

### Breaking Changes Impact Assessment
| r128 → r158 Change | Impact | Migration Effort |
|-------------------|--------|------------------|
| `Geometry` → `BufferGeometry` | Low (already done) | Done |
| `EffectComposer` API | Medium (post-processing) | 1 week |
| `ShaderMaterial` → `NodeMaterial` | High (4 custom shaders) | 2 weeks |
| `InstancedMesh` API | Medium (BT 3D arrays) | 3 days |
| `WebGLRenderer` → `WebGL2Renderer` | Low (auto in r158+) | 1 day |
| `OrbitControls` imports | Low | 1 hour |

### Recommended Migration Path
1. **Branch**: `viz/threejs-r158`
2. **Update**: `three.module.js` import map
3. **Shaders**: Convert 4 shaders to `NodeMaterial` nodes
4. **Post-processing**: Migrate `EffectComposer` → `PostProcessing`
5. **Test**: Visual regression vs golden images (10 scenarios)
6. **Performance**: Benchmark on Pixel 6a, Galaxy S23, Pixel 8 Pro

---