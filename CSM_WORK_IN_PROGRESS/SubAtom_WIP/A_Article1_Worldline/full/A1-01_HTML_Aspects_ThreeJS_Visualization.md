# HTML Aspects ThreeJS Visualization — Complete Article
## Article A1: A1-01 — HTML Aspects ThreeJS Visualization
**Generated:** 2026-10-08 04:08:34 UTC  
**Structure:** 13 pieces concatenated  
**Target:** ≥350 lines

---

# HTML_Aspects_ThreeJS_Visualization — Piece 01/13
## Article A1: A1-01 — HTML Aspects ThreeJS Visualization
**Piece:** 01 of 13  
**Generated:** 2026-10-08 04:00:49 UTC

---

## THREE.JS CORE FOUNDATION (v1.0.0 → v1.0.91)

### Three.js Core (r128 embedded locally)
- **First Version:** 1.0.0 | **Last Version:** 1.0.91
- **Module:** three.min.js (local asset, ~200KB)
- **Connects to Android via:** WebView JS context
- **Performance:** Stable across all versions
- **Key Decision:** Use local copy, never CDN — works offline
- **Worked Well:** Zero external dependencies, consistent behavior
- **Issues:** None
- **Solution:** Embedded in assets/js/three.min.js from day one

### OrbitControls
- **First Version:** 1.0.0 | **Last Version:** 1.0.91
- **Module:** OrbitControls.js (bundled)
- **Features:** Rotate, zoom, pan, auto-spin
- **Connects to Android via:** JS bridge for camera state sync
- **Performance:** Lightweight, 60fps on most devices
- **Worked Well:** Auto-rotate damping works smoothly
- **Issues:** None
- **Solution:** Standard implementation, no modifications needed

---

## REFERENCE GRID & COMPASS (v1.0.0 → v1.0.91)

### Grid Floor + Compass Rose
- **First Version:** 1.0.0 | **Last Version:** 1.0.91
- **Implementation:** 40×40 LineBasicMaterial grid + N/S/E/W colored markers
- **Type:** Static reference (no Android connection needed)
- **Performance:** Minimal GPU cost
- **Worked Well:** Clear orientation reference for users
- **Issues:** None
- **Solution:** Static geometry, created once at init

---

## TARDIGRADE SPHERE — VEHICLE AVATAR (v1.0.0 → v1.0.91)

### Core 3D Object
- **First Version:** 1.0.0 | **Last Version:** 1.0.91
- **Geometry:** 2-lobe mesh + wireframe cage + torus ring + bearing arrow
- **Triangle Count:** ~500 triangles
- **Connects to Android via:** MainActivity→JS: vehicle state (position, orientation, fleet status)
- **Performance:** Iconic design, recognizable at distance
- **Worked Well:** Unique visual identity, scales well
- **Issues:** Complex geometry for mobile GPU
- **Solution:** Simplified over time, LOD considerations for future

---

## PIECE 01 SUMMARY
This piece covers the foundational Three.js components that existed from v1.0.0: the core engine, camera controls, reference grid, and the signature Tardigrade Sphere vehicle avatar. These form the visual foundation upon which all later features were built.

**Next Piece (02):** Vehicle Beacons + Physics Engine + Beacon Labels
---

# HTML_Aspects_ThreeJS_Visualization — Piece 02/13
## Article A1: A1-01 — HTML Aspects ThreeJS Visualization
**Piece:** 02 of 13  
**Generated:** 2026-10-08 04:00:49 UTC

---

## VEHICLE BEACONS — DYNAMIC DOTS (v1.0.20 → v1.0.91)

### Vehicle Beacons
- **First Version:** 1.0.20 | **Last Version:** 1.0.91
- **Geometry:** SphereGeometry(0.5) + TorusGeometry(0.65) + CanvasTexture labels
- **Connects to Android via:** MainActivity→JS: beacon array (positions, states)
- **Physics:** Spring physics — repulsion + home attraction + damping 0.88
- **Performance:** Smooth animation at 60fps on most devices
- **Worked Well:** Natural movement, visually appealing
- **Issues:** Physics parameter sensitivity
- **Solution:** Damping 0.88 found optimal through tuning

### Beacon Physics Engine
- **First Version:** 1.0.20 | **Last Version:** 1.0.91
- **Implementation:** Custom JS physics — velocity + spring forces + repulsion + damping
- **Type:** JS internal (no Android bridge needed)
- **Performance:** 60fps on most devices
- **Worked Well:** Natural, organic movement
- **Issues:** Parameter sensitivity — small changes cause instability
- **Solution:** Damping 0.88, spring constant 0.05, repulsion radius 2.0

---

## STATIC NODE FIELD — Wi-Fi APs (v1.0.30 → v1.0.91)

### Static Node Field (Wi-Fi Access Points)
- **First Version:** 1.0.30 | **Last Version:** 1.0.91
- **Visual:** Purple additive blending spheres
- **Connects to Android via:** MainActivity→JS: AP positions (from scan results)
- **Max Nodes:** ~100 nodes
- **Performance:** Real AP positions displayed accurately
- **Worked Well:** Clear visualization of Wi-Fi landscape
- **Issues:** Position accuracy depends on trilateration quality
- **Solution:** Trilateration refinement in v1.0.90+ (GDOP weighting)

---

## BEACON LABELS — CANVASTEXTURE (v1.0.20 → v1.0.91)

### CanvasTexture Labels
- **First Version:** 1.0.20 | **Last Version:** 1.0.91
- **Usage:** Beacon labels + AP labels (dynamic text on 3D objects)
- **Implementation:** Generated in JS, updates on label change
- **Performance:** Clear, readable at distance
- **Issues:** Performance degrades if many labels (>50)
- **Solution:** Cache textures, only regenerate on text change

---

## ADDITIVE BLENDING FOR GLOW (v1.0.30 → v1.0.91)

### AdditiveBlending
- **First Version:** 1.0.30 | **Last Version:** 1.0.91
- **Usage:** Static nodes + beacon highlights
- **Implementation:** Three.js material property
- **Performance:** Beautiful glow effect
- **Issues:** Z-fighting with overlapping objects
- **Solution:** Depth test configuration, render order management

---

## PIECE 02 SUMMARY
This piece covers the dynamic elements: Vehicle Beacons with spring physics, Static Node Field for Wi-Fi AP visualization, CanvasTexture for dynamic labels, and AdditiveBlending for glow effects. These components create the living, breathing visualization layer.

**Next Piece (03):** Trail System (CatmullRomCurve3) + GPU-Safe Disposal
---

# HTML_Aspects_ThreeJS_Visualization — Piece 03/13
## Article A1: A1-01 — HTML Aspects ThreeJS Visualization
**Piece:** 03 of 13  
**Generated:** 2026-10-08 04:00:49 UTC

---

## TRAIL SYSTEM — GPS HISTORY (v1.0.62 → v1.0.91)

### Trail Line (CatmullRomCurve3)
- **First Version:** 1.0.62 | **Last Version:** 1.0.91
- **Implementation:** Smooth CatmullRom spline through GPS points
- **Point Cap:** 2000 points (FIFO — shift oldest when full)
- **Connects to Android via:** MainActivity→JS: trail points array
- **Rebuild Frequency:** Every 5 frames (adaptive in v1.0.94+)
- **Performance:** GPU-safe disposal critical
- **Worked Well:** Smooth, beautiful trails showing vehicle path
- **Issues:** Memory leaks before v1.0.54 (geometry not disposed)
- **Solution:** `geometry.dispose() + material.dispose()` on every rebuild (BP016, CP009)

### GPU-Safe Disposal Pattern (Critical Best Practice)
```javascript
// ALWAYS dispose before creating new geometry
if (trailGeometry) trailGeometry.dispose();
if (trailMaterial) trailMaterial.dispose();
trailGeometry = new THREE.BufferGeometry().setFromPoints(points);
trailMaterial = new THREE.LineBasicMaterial({ color: 0x00ffff });
trailLine = new THREE.Line(trailGeometry, trailMaterial);
scene.add(trailLine);
```

### Trail Recording Enhancement Timeline
- **v1.0.49:** Basic trail recording (raw GPS points)
- **v1.0.54:** GPU-safe disposal fix (critical — prevented OOM crashes)
- **v1.0.62:** CatmullRomCurve3 smooth splines (2000pt cap)
- **v1.0.63:** Wake lock for background recording
- **v1.0.94+:** Adaptive rebuild (every frame when fast, every 10 when slow)

---

## CAMERA MODES — THREE VIEWS (v1.0.8 → v1.0.91)

### Camera Modes (Orbit / FLY / POV)
- **First Version:** 1.0.8 | **Last Version:** 1.0.91
- **Three Modes:**
  1. **Orbit:** OrbitControls with auto-rotate option
  2. **FLY:** Spring camera tour — auto-generated waypoints from all nodes
  3. **POV:** Chase camera — follows vehicle with adjustable offset (±10 units)
- **Connects to Android via:** JS bridge for mode switch
- **Worked Well:** Intuitive mode switching, smooth transitions
- **Issues:** FLY waypoint generation density
- **Solution:** Adaptive CatmullRom waypoint spacing

---

## AUTO-SPIN TOGGLE (v1.0.0 → v1.0.91)

### Auto-Spin Toggle
- **First Version:** 1.0.0 | **Last Version:** 1.0.91
- **Implementation:** OrbitControls.autoRotate = true/false
- **Control:** SPIN button in HUD
- **Connects to Android via:** JS→Android: setAutoSpin(boolean)
- **Performance:** Zero cost when off, minimal when on
- **Worked Well:** User preference respected
- **Issues:** None
- **Solution:** Simple boolean toggle, persisted in SharedPreferences

---

## PIECE 03 SUMMARY
This piece covers the Trail System (the most performance-critical visualization component with its GPU-safe disposal pattern) and Camera Modes (Orbit/FLY/POV) with auto-spin. The trail system's evolution from memory-leaking raw lines to GPU-safe CatmullRom splines represents a key learning in WebGL resource management.

**Next Piece (04):** HUD Tab-Tuck Panels + Control Buttons + Legend Panel
---

# HTML_Aspects_ThreeJS_Visualization — Piece 04/13
## Article A1: A1-01 — HTML Aspects ThreeJS Visualization
**Piece:** 04 of 13  
**Generated:** 2026-10-08 04:00:49 UTC

---

## HUD TAB-TUCK PANELS (v1.0.0 → v1.0.91)

### HUD Tab-Tuck Panels
- **First Version:** 1.0.0 | **Last Version:** 1.0.91
- **Implementation:** CSS transform panels with 0.4s cubic-bezier animation
- **Left Panel:** BEACONS / SCAN / BT (radio controls)
- **Right Panel:** FORGE / Controls / Legend / WiFi (settings & info)
- **Connects to Android via:** JS bridge for panel data updates
- **Performance:** Smooth 60fps animation
- **Worked Well:** Intuitive tab-tuck UX, saves screen space
- **Issues:** Touch targets too small on mobile
- **Solution:** Increased panel width to 320px in v1.0.91

### Panel Evolution
- **v1.0.0:** Basic left/right panels
- **v1.0.38:** SCAN pullout panel added
- **v1.0.64:** Legend panel integrated
- **v1.0.91:** Update notification panel added, width 320px

---

## CONTROL BUTTONS — JS→ANDROID BRIDGE (v1.0.0 → v1.0.91)

### Control Buttons
- **First Version:** 1.0.0 | **Last Version:** 1.0.91
- **Buttons:** +VEHICLE, +FLEET, FLY, SPIN, SCATTER, BROADCAST, TRAIL, SAVE
- **Implementation:** HTML buttons with onclick → Bounce.method()
- **Connects to Android via:** @JavascriptInterface direct method calls
- **Performance:** Responsive, immediate feedback
- **Worked Well:** Direct control, no latency
- **Issues:** None
- **Solution:** Proven pattern since v1.0.0

### Button → Android Method Mapping
| Button | JS Call | Android Method |
|--------|---------|----------------|
| +VEHICLE | Bounce.setVehicleData() | MainActivity.setVehicleData() |
| +FLEET | Bounce.setFleetMode() | MainActivity.setFleetMode() |
| FLY | Bounce.setCameraMode('fly') | MainActivity.setCameraMode() |
| SPIN | Bounce.setAutoSpin(true) | MainActivity.setAutoSpin() |
| SCATTER | Bounce.scatterBeacons() | MainActivity.scatterBeacons() |
| BROADCAST | Bounce.toggleBroadcast() | MainActivity.toggleBroadcast() |
| TRAIL | Bounce.toggleTrail() | MainActivity.toggleTrail() |
| SAVE | Bounce.saveTrail() | MainActivity.saveTrail() |

---

## LEGEND PANEL — REFERENCE DATA (v1.0.64 → v1.0.91)

### Legend Panel
- **First Version:** 1.0.64 | **Last Version:** 1.0.91
- **Content:** Color guide + FAA METAR codes + Wind format reference
- **Implementation:** Static HTML/CSS (no dynamic data)
- **Connects to Android via:** JS bridge for visibility toggle only
- **Worked Well:** Complete reference, always accessible
- **Issues:** None
- **Solution:** Static reference data, no computation needed

---

## PIECE 04 SUMMARY
This piece covers the HUD interface: Tab-tuck panels (left/right with smooth CSS animations), Control Buttons (8 buttons mapping directly to Android @JavascriptInterface methods), and the Legend Panel (static reference data for METAR codes, wind formats, color guides). The HUD is the primary user interaction surface.

**Next Piece (05):** Wi-Fi Scanner Panel + Broadcast Status Bar + Update Notification Panel
---

# HTML_Aspects_ThreeJS_Visualization — Piece 05/13
## Article A1: A1-01 — HTML Aspects ThreeJS Visualization
**Piece:** 05 of 13  
**Generated:** 2026-10-08 04:00:49 UTC

---

## WI-FI SCANNER PANEL (v1.0.38 → v1.0.91)

### Wi-Fi Scanner Panel
- **First Version:** 1.0.38 | **Last Version:** 1.0.91
- **Features:** Real-time AP list with live zone classification
- **Zones:** IMMEDIATE (< -55 dBm) / NEAR (-55 to -70) / FAR (> -70)
- **Connects to Android via:** MainActivity→JS: AP list (onWifiResult)
- **Update Frequency:** Every Wi-Fi scan (~2-5 seconds)
- **Performance:** Accurate zone colors, smooth list updates
- **Worked Well:** Clear visual hierarchy, actionable info
- **Issues:** None
- **Solution:** Direct data binding from scan results

### Zone Classification Colors
- **IMMEDIATE:** Red (#ff4444) — within ~10m
- **NEAR:** Yellow (#ffaa00) — within ~30m
- **FAR:** Green (#44ff44) — beyond ~30m

---

## BROADCAST STATUS BAR (v1.0.20 → v1.0.91)

### Broadcast Status Bar
- **First Version:** 1.0.20 | **Last Version:** 1.0.91
- **Display:** 4-slot rotating SSID display (shows current TX SSID)
- **Slots:** SLOT 0, 1, 2, 3 — each 5.1s duty cycle
- **Connects to Android via:** MainActivity→JS: broadcastStatus (onBroadcastStatus)
- **Update Frequency:** Every slot change (5.1s)
- **Performance:** Clear feedback on what's broadcasting
- **Worked Well:** Users know exactly what's being transmitted
- **Issues:** Slot timing drift in early versions
- **Solution:** Fixed 5.1s duty cycle (2.5s ON + 2.6s OFF) in v1.0.20

---

## UPDATE NOTIFICATION PANEL (v1.0.91 → v1.0.91)

### Update Notification Panel
- **First Version:** 1.0.91 | **Last Version:** 1.0.91
- **Features:** CHECK UPDATE button + version display
- **Connects to Android via:** MainActivity→JS: updateAvailable (onUpdateAvailable)
- **Trigger:** Manual user action (auto-check removed in v1.0.93)
- **Worked Well:** User control over updates
- **Issues:** Auto-check on startup caused permission prompts
- **Solution:** Manual trigger only (moved to TGAPP in v1.0.93+)

---

## PIECE 05 SUMMARY
This piece covers the data-display panels: Wi-Fi Scanner (real-time AP list with zone classification), Broadcast Status Bar (4-slot SSID rotation with fixed 5.1s duty cycle), and Update Notification Panel (manual update check, moved to TGAPP). These panels surface Android-side data to the user through the JS bridge.

**Next Piece (06):** Chart.js Metrics + GLSL Shaders + Post-Processing Pipeline
---

# HTML_Aspects_ThreeJS_Visualization — Piece 06/13
## Article A1: A1-01 — HTML Aspects ThreeJS Visualization
**Piece:** 06 of 13  
**Generated:** 2026-10-08 04:00:49 UTC

---

## CHART.JS METRICS VISUALIZATION (v1.0.86 → v1.0.91)

### Chart.js Integration
- **First Version:** 1.0.86 | **Last Version:** 1.0.91
- **Library:** Chart.js (local asset, embedded in assets/js/)
- **Charts:** Action / Benevolence / Coherence / Glueball Energy
- **Connects to Android via:** JS bridge for data updates
- **Performance:** Lightweight, responsive
- **Worked Well:** Clean metrics display, local copy works offline
- **Issues:** None
- **Solution:** Local asset (BP014 — no CDN)

### Metric Definitions
| Metric | Source | Range | Meaning |
|--------|--------|-------|---------|
| Action | Particle filter weight | 0-1 | Movement decisiveness |
| Benevolence | Mesh relay count | 0-1 | Cooperative behavior |
| Coherence | Zone HMM probability | 0-1 | Position certainty |
| Glueball | BT trajectory density | 0-1 | Network cohesion |

---

## GLSL SHADERS — CUSTOM POST-PROCESSING (v1.0.50 → v1.0.91)

### GLSL Shaders
- **First Version:** 1.0.50 | **Last Version:** 1.0.91
- **Shaders:** LuminosityHighPassShader + CopyShader + custom ACES tone mapping
- **Implementation:** Embedded in HTML (not separate files)
- **Connects to Android via:** JS bridge for uniform updates (bloom strength, etc.)
- **Performance:** Mobile compatible with `highp` precision
- **Worked Well:** Beautiful HDR glow, cinematic look
- **Issues:** Precision issues on older mobile GPUs
- **Solution:** Use `highp` for mobile, fallback to `mediump` if needed

### Shader Pipeline
```
RenderPass → UnrealBloomPass (LuminosityHighPass + CopyShader) 
  → ShaderPass (ACES tone mapping - commented out)
  → Output
```

---

## POST-PROCESSING PIPELINE — EFFECTCOMPOSER (v1.0.50 → v1.0.91)

### EffectComposer Pipeline
- **First Version:** 1.0.50 | **Last Version:** 1.0.91
- **Chain:** RenderPass → UnrealBloomPass → ShaderPass
- **Module:** EffectComposer.js + UnrealBloomPass.js + ShaderPass.js
- **Connects to Android via:** JS bridge for bloom parameters
- **Default Params:** Strength 1.0, Radius 0.4, Threshold 0.8
- **Performance:** GPU intensive on old devices
- **Worked Well:** HDR glow makes visualization pop
- **Issues:** Mobile GPU limits — bloom too strong
- **Solution:** Configurable via Android (reduce to 0.5-0.8 on mobile)

### UnrealBloomPass
- **First Version:** 1.0.50 | **Last Version:** 1.0.91
- **Effect:** HDR glow using luminosity threshold
- **Parameters:** Strength, Radius, Threshold (all adjustable)
- **Mobile Adaptation:** Auto-scale by GPU tier (planned v1.0.94, RF016)

---

## PIECE 06 SUMMARY
This piece covers the metrics and visual effects layer: Chart.js for real-time algorithm metrics (Action/Benevolence/Coherence/Glueball), GLSL shaders for custom post-processing (LuminosityHighPass, CopyShader, ACES tone mapping), and the EffectComposer pipeline (RenderPass → UnrealBloomPass → ShaderPass) creating the signature HDR glow. All assets are local for offline capability.

**Next Piece (07):** Bluetooth 3D Spatial Nodes + Theory Mode (Ghost Trajectories)
---

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
---

# HTML_Aspects_ThreeJS_Visualization — Piece 08/13
## Article A1: A1-01 — HTML Aspects ThreeJS Visualization
**Piece:** 08 of 13  
**Generated:** 2026-10-08 04:00:49 UTC

---

## POV ZOOM BUTTONS (v1.0.55 → v1.0.91)

### POV Zoom Buttons
- **First Version:** 1.0.55 | **Last Version:** 1.0.91
- **Buttons:** btn-pov-less / btn-pov-more (in right HUD panel)
- **Function:** Adjust chase camera distance in POV mode
- **Range:** ±10 units from default chase distance
- **Connects to Android via:** JS→Android: setPOVOffset(delta)
- **Precision:** Integer steps, immediate visual feedback
- **Worked Well:** Precise control over chase distance
- **Issues:** None
- **Solution:** Simple integer offset, clamped to [-10, +10]

---

## CAMERA CONTROLS DEEP DIVE

### OrbitControls Configuration (All Versions)
```javascript
const controls = new THREE.OrbitControls(camera, renderer.domElement);
controls.enableDamping = true;
controls.dampingFactor = 0.05;
controls.enablePan = true;
controls.enableZoom = true;
controls.enableRotate = true;
controls.autoRotate = false; // toggled via SPIN button
controls.autoRotateSpeed = 1.0;
controls.minDistance = 5;
controls.maxDistance = 200;
controls.target.set(0, 0, 0);
```

### Camera State Sync (Android ↔ HTML)
- **Android → HTML:** Camera position/orientation on mode change
- **HTML → Android:** POV offset adjustments, auto-spin toggle
- **Sync Frequency:** On user interaction only (not continuous)

### Mode Transition Logic
```javascript
function setCameraMode(mode) {
  switch(mode) {
    case 'orbit':
      controls.enabled = true;
      camera.position.set(0, 50, 100);
      break;
    case 'fly':
      controls.enabled = false;
      startFlyTour(); // CatmullRom through all nodes
      break;
    case 'pov':
      controls.enabled = false;
      attachToVehicle(povOffset); // Chase camera
      break;
  }
}
```

---

## HUD POLISH & TOUCH TARGETS

### Touch Target Improvements (v1.0.91)
- **Issue:** Buttons too small for finger touch
- **Fix:** Minimum 44×44px touch targets (Apple/Google guidelines)
- **Panel Width:** Increased to 320px for comfortable tapping
- **Button Spacing:** 8px minimum between interactive elements

### CSS Animation Performance
```css
.panel {
  transform: translateX(-100%);
  transition: transform 0.4s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}
.panel.open {
  transform: translateX(0);
}
/* GPU-accelerated: transform + opacity only */
```

---

## PIECE 08 SUMMARY
This piece covers POV zoom controls (precise ±10 unit chase distance adjustment), deep-dive into OrbitControls configuration (damping, limits, auto-rotate), camera mode transition logic (Orbit/FLY/POV state management), and HUD touch-target polish (44px minimum, 320px panel width, GPU-accelerated CSS animations). These refinements make the 3D visualization usable on touch devices.

**Next Piece (09):** Error Handling Architecture + HTML Try/Catch Wrapper + Window.onerror
---

# HTML_Aspects_ThreeJS_Visualization — Piece 09/13
## Article A1: A1-01 — HTML Aspects ThreeJS Visualization
**Piece:** 09 of 13  
**Generated:** 2026-10-08 04:00:49 UTC

---

## ERROR HANDLING ARCHITECTURE (v1.0.52 → v1.0.91)

### HTML Try/Catch Wrapper (Critical Best Practice — BP015)
- **First Version:** 1.0.52 | **Last Version:** 1.0.91
- **Problem:** WebView crashes on JS bridge errors (E016)
- **Solution:** Wrap ALL bridge calls in try/catch + global window.onerror

### Implementation
```javascript
// Global error handler
window.onerror = function(msg, url, line, col, error) {
  console.error('Global error:', msg, 'at', url, ':', line);
  UI.showError(msg); // Display in HUD
  return true; // Prevent default browser handler
};

// Bridge call wrapper
function safeBridgeCall(method, ...args) {
  try {
    return Bounce[method](...args);
  } catch (e) {
    console.error('Bridge call failed:', method, e);
    UI.showError('Bridge error: ' + e.message);
    return null;
  }
}

// Usage everywhere
safeBridgeCall('setVehicleData', data);
safeBridgeCall('toggleBroadcast');
safeBridgeCall('getTrajectory', addr);
```

### Error Display in HUD
- **Component:** UI.showError(message)
- **Display:** Toast-style notification in top center
- **Duration:** 5 seconds auto-dismiss
- **Queue:** Multiple errors queued, shown sequentially

---

## WEBVIEW JAVASCRIPT BRIDGE STABILITY

### Bridge Architecture (v1.0.0 → v1.0.91)
- **Android Side:** `@JavascriptInterface` annotated methods in MainActivity
- **HTML Side:** `window.Bounce` object injected via `addJavascriptInterface`
- **Communication:** Bidirectional — Android pushes, HTML pulls

### Android → HTML (Push)
```java
// MainActivity.java
webView.evaluateJavascript(
  "javascript:UI.updateWifiList(" + json + ")", 
  null
);
```

### HTML → Android (Pull/Call)
```javascript
// bounce.html
Bounce.setVehicleData(data); // @JavascriptInterface
Bounce.getTrajectory(addr);  // Returns JSON string
```

### Bridge Reliability Improvements
| Version | Improvement |
|---------|-------------|
| 1.0.0 | Basic addJavascriptInterface |
| 1.0.52 | HTML try/catch wrapper (BP015) |
| 1.0.91 | Comprehensive error handling |

---

## PERFORMANCE MONITORING

### FPS Monitoring (Built-in)
```javascript
let lastTime = performance.now();
let frames = 0;
function measureFPS() {
  frames++;
  const now = performance.now();
  if (now - lastTime >= 1000) {
    console.log('FPS:', frames);
    frames = 0;
    lastTime = now;
  }
  requestAnimationFrame(measureFPS);
}
```

### Memory Leak Prevention (BP016, CP009)
- **Rule:** ALWAYS dispose Three.js geometries & materials
- **Pattern:** `geometry.dispose(); material.dispose();`
- **Trail:** 2000pt FIFO cap (BP017, CP014)
- **Rebuild:** Every 5 frames (adaptive in v1.0.94+)

---

## PIECE 09 SUMMARY
This piece covers the error handling architecture that stabilized the WebView: global `window.onerror` handler, `safeBridgeCall()` wrapper for all Android↔HTML communication, HUD error display, and the bridge architecture itself. Also documents performance monitoring (FPS) and the critical GPU-safe disposal pattern that eliminated OOM crashes (E012). This is the stability foundation.

**Next Piece (10):** Asset Management — Local Three.js/Chart.js + Offline Capability
---

# HTML_Aspects_ThreeJS_Visualization — Piece 10/13
## Article A1: A1-01 — HTML Aspects ThreeJS Visualization
**Piece:** 10 of 13  
**Generated:** 2026-10-08 04:00:49 UTC

---

## ASSET MANAGEMENT — LOCAL FIRST (v1.0.0 → v1.0.91)

### Local Assets Only (Best Practice BP014)
- **First Version:** 1.0.0 | **Last Version:** 1.0.91
- **Rule:** Zero CDN dependencies — everything in `assets/`
- **Reason:** Offline capability mandatory for vehicle use
- **Assets:**
  - `assets/js/three.min.js` (r128, ~200KB)
  - `assets/js/OrbitControls.js`
  - `assets/js/EffectComposer.js`
  - `assets/js/UnrealBloomPass.js`
  - `assets/js/ShaderPass.js`
  - `assets/js/CopyShader.js`
  - `assets/js/LuminosityHighPassShader.js`
  - `assets/js/Chart.min.js` (~150KB)
  - `assets/css/bounce.css`
  - `bounce.html` (main entry, injected as asset)

### Asset Injection (build.sh Step 2b)
```bash
# After aapt2 link creates base.apk
zip -r base.apk assets/
# Injects all assets into APK
```

### Version Lock (Three.js r128)
- **Current:** r128 (2021) — stable, well-tested
- **Planned Upgrade:** Three.js r158+ (RF008)
- **Migration Path:** ES6 modules (RF007)

---

## OFFLINE CAPABILITY

### Complete Offline Operation
- **No network required** for core visualization
- **Wi-Fi/Bluetooth scanning** works without internet
- **GPS tracking** works without internet
- **Map tiles:** NOT cached (limitation — P2-01, RF026)
- **Chart.js:** Local, works offline
- **Three.js:** Local, works offline

### Online-Only Features (Minimal)
- **Auto-update check:** GitHub API (moved to TGAPP)
- **Map tiles:** Would need Mapbox/OSM (not implemented)
- **License validation:** TGAPP (future)

---

## BUILD INTEGRATION

### HTML as Android Asset
- **Location:** `src/main/assets/bounce.html`
- **Injected by:** build.sh → aapt2 → zip
- **Loaded by:** `webView.loadUrl("file:///android_asset/bounce.html")`
- **Cache:** WebView caches automatically

### Resource Loading Order
```html
<!-- bounce.html head -->
<script src="js/three.min.js"></script>
<script src="js/OrbitControls.js"></script>
<script src="js/EffectComposer.js"></script>
<script src="js/UnrealBloomPass.js"></script>
<script src="js/ShaderPass.js"></script>
<script src="js/CopyShader.js"></script>
<script src="js/LuminosityHighPassShader.js"></script>
<script src="js/Chart.min.js"></script>
<link rel="stylesheet" href="css/bounce.css">
```

---

## PIECE 10 SUMMARY
This piece covers the asset management strategy: zero CDN dependencies, all libraries local in `assets/` for complete offline operation. Three.js r128 locked since v1.0.0 (upgrade planned RF008). Asset injection via build.sh zip step. Complete offline capability for core features (scanning, GPS, visualization) — only auto-update and map tiles need network (both addressed in roadmap).

**Next Piece (11):** Performance Optimization History — Memory Leaks, FIFO Caps, Adaptive Rebuilds
---

# HTML_Aspects_ThreeJS_Visualization — Piece 11/13
## Article A1: A1-01 — HTML Aspects ThreeJS Visualization
**Piece:** 11 of 13  
**Generated:** 2026-10-08 04:00:49 UTC

---

## PERFORMANCE OPTIMIZATION HISTORY

### Memory Leak Crisis (v1.0.49 → v1.0.54)
- **Error:** E012 — OutOfMemoryError: WebGL context lost
- **Root Cause:** Trail recording created new Three.js geometry every frame, never disposed
- **Impact:** App crashes after ~5 minutes of trail recording
- **Fix (v1.0.54):** `geometry.dispose() + material.dispose()` before rebuild
- **Best Practice:** BP016 — GPU-safe disposal ALWAYS
- **Anti-Pattern:** CP009 — Never rebuild without disposal

### FIFO Cap Implementation (v1.0.62)
- **Error:** E014 — Unbounded trail point array
- **Root Cause:** Points array grew indefinitely
- **Fix:** 2000 point cap with FIFO (shift oldest)
- **Best Practice:** BP017 — 2000pt cap
- **Anti-Pattern:** CP014 — Unbounded arrays

```javascript
// Trail point management
const MAX_TRAIL_POINTS = 2000;
trailPoints.push(newPoint);
if (trailPoints.length > MAX_TRAIL_POINTS) {
  trailPoints.shift(); // Remove oldest
}
rebuildTrailGeometry(); // With disposal
```

### Rebuild Frequency Optimization (v1.0.62 → v1.0.94)
| Version | Rebuild Frequency | Reason |
|---------|-------------------|--------|
| 1.0.49 | Every frame | Naive implementation |
| 1.0.62 | Every 5 frames | Balance smoothness/performance |
| 1.0.94+ | Adaptive | Fast movement: every frame; Slow: every 10 |

### UnrealBloomPass Mobile Tuning (v1.0.50+)
- **Error:** E029 — Too bright on mobile
- **Root Cause:** HDR bloom strength 1.0 overwhelms mobile GPU
- **Fix:** Reduce strength to 0.5-0.8 on mobile
- **Planned:** Auto-scale by GPU tier benchmark (RF016)

---

## RENDER LOOP OPTIMIZATION

### Main Render Loop (Optimized)
```javascript
function animate() {
  requestAnimationFrame(animate);
  
  // Update controls (damping)
  controls.update();
  
  // Update beacon physics (60fps target)
  updateBeaconPhysics();
  
  // Update theory mode trajectories
  if (theoryMode) updateTheoryTrajectories();
  
  // Render scene
  if (usePostProcessing) {
    composer.render();
  } else {
    renderer.render(scene, camera);
  }
  
  // FPS monitoring
  measureFPS();
}
```

### Conditional Rendering
- **Post-processing:** Only when `usePostProcessing = true`
- **Theory mode:** Only renders when toggle ON
- **Beacon physics:** Always runs (lightweight spring sim)
- **Trail rebuild:** Only every N frames (not every frame)

---

## MOBILE GPU STRATEGIES

### Device Tier Detection (Planned v1.0.94)
```javascript
// Benchmark on startup
const canvas = document.createElement('canvas');
const gl = canvas.getContext('webgl2');
const perf = gl.getExtension('WEBGL_debug_renderer_info');
const renderer = gl.getParameter(perf.UNMASKED_RENDERER_WEBGL);

// Tier classification
if (renderer.includes('Adreno') || renderer.includes('Mali')) {
  // Mobile GPU — reduce bloom, simplify shaders
  bloomStrength = 0.6;
  useHighPrecision = false;
} else {
  // Desktop/High-end — full quality
  bloomStrength = 1.0;
  useHighPrecision = true;
}
```

---

## PIECE 11 SUMMARY
This piece documents the performance optimization journey: the memory leak crisis (E012) fixed by GPU-safe disposal (BP016), FIFO cap preventing unbounded growth (BP017), adaptive rebuild frequency (every 5 frames → adaptive), and mobile GPU tuning for UnrealBloomPass. The render loop is optimized with conditional rendering. Device-tier detection planned for automatic quality scaling (RF016).

**Next Piece (12):** Future HTML Roadmap — ES6 Modules, WebGPU, AR, Declarative UI
---

# HTML_Aspects_ThreeJS_Visualization — Piece 12/13
## Article A1: A1-01 — HTML Aspects ThreeJS Visualization
**Piece:** 12 of 13  
**Generated:** 2026-10-08 04:00:49 UTC

---

## FUTURE HTML ROADMAP

### Three.js Upgrade — r128 → r158+ (RF008, FT006)
- **Current:** r128 (2021) — stable but aging
- **Target:** r158+ (2024) — modern, maintained
- **Effort:** Medium (breaking changes in materials, geometries)
- **Benefits:** Better performance, new features, security patches
- **Migration:** ES6 modules (RF007), update all shaders

### ES6 Module Architecture (RF007)
- **Current:** Monolithic bounce.html (2200 lines)
- **Target:** Split into modules
```
src/
├── scene/          # Three.js scene, camera, renderer
├── ui/             # HUD panels, controls, legend
├── camera/         # Orbit/FLY/POV modes
├── trail/          # Trail system, CatmullRom
├── bt3d/           # Bluetooth 3D spatial nodes
├── beacons/        # Beacon physics, labels
├── shaders/        # GLSL shaders, EffectComposer
├── metrics/        # Chart.js integration
└── bridge/         # Android JS bridge wrapper
```
- **Build:** Vite/esbuild for bundling
- **Loading:** Dynamic imports for code splitting

### WebGPU for Compute Shaders (FT007)
- **Concept:** Move beacon physics / trail computation to GPU
- **Benefit:** Massive parallelism for 1000+ beacons
- **Blocker:** WebGPU not in Android WebView yet
- **Timeline:** 2+ years (wait for WebView support)

### Declarative UI (React/Lit in WebView) (FT008)
- **Current:** Imperative HTML/JS (hard to maintain)
- **Target:** Lit or React components in WebView
- **Benefit:** Maintainable, testable, scalable
- **Risk:** Bundle size increase
- **Timeline:** 3-6 months research

---

## AR & IMMERSIVE VISION

### AR Overlay (ARCore) (FP016, FT006, FT023)
- **Concept:** Camera feed + 3D annotations (trajectories, hazards, vehicles)
- **Platform:** ARCore (Android) + WebXR (WebView)
- **Challenge:** WebView ARCore integration complex
- **Timeline:** 12+ months

### AR Heads-Up Display (FT023)
- **Concept:** Project trajectory/hazards on windshield
- **Hardware:** AR HUD prototypes needed
- **Timeline:** 2+ years (partnership required)

---

## DATA & SYNC ARCHITECTURE

### CRDTs for Mesh State (FT009)
- **Concept:** Conflict-free Replicated Data Types for fleet state sync
- **Library:** Yjs (works in WebView)
- **Benefit:** Offline-first, eventual consistency
- **Timeline:** 6-12 months research

### Local-First Architecture (FT010)
- **Concept:** All data local; sync when connected
- **Principle:** Resilient, works offline
- **Challenge:** Conflict resolution
- **Timeline:** 3-6 months design

---

## PIECE 12 SUMMARY
This piece outlines the future HTML roadmap: Three.js upgrade to r158+ with ES6 module architecture (splitting 2200-line monolith), WebGPU compute shaders for massive beacon parallelism (blocked on WebView), declarative UI with Lit/React for maintainability, AR integration via ARCore/WebXR, and CRDT-based local-first mesh sync. These are research-phase items (FT006-FT010) with 3-month to 2+ year horizons.

**Next Piece (13):** HTML Aspects Summary + Cross-References + Key Metrics
---

# HTML_Aspects_ThreeJS_Visualization — Piece 13/13
## Article A1: A1-01 — HTML Aspects ThreeJS Visualization
**Piece:** 13 of 13  
**Generated:** 2026-10-08 04:00:49 UTC

---

## HTML ASPECTS — COMPLETE SUMMARY

### Component Inventory (27 Tracked Components)

| # | Component | First Ver | Last Ver | Category |
|---|-----------|-----------|----------|----------|
| 1 | Three.js Core (r128) | 1.0.0 | 1.0.91 | Engine |
| 2 | OrbitControls | 1.0.0 | 1.0.91 | Camera |
| 3 | EffectComposer Pipeline | 1.0.50 | 1.0.91 | Post-Process |
| 4 | UnrealBloomPass | 1.0.50 | 1.0.91 | Post-Process |
| 5 | ShaderPass (Custom) | 1.0.50 | 1.0.91 | Post-Process |
| 6 | Tardigrade Sphere | 1.0.0 | 1.0.91 | Vehicle Avatar |
| 7 | Vehicle Beacons | 1.0.20 | 1.0.91 | Dynamic Objects |
| 8 | Beacon Physics Engine | 1.0.20 | 1.0.91 | Physics |
| 9 | Static Node Field (Wi-Fi) | 1.0.30 | 1.0.91 | Visualization |
| 10 | Grid Floor + Compass | 1.0.0 | 1.0.91 | Reference |
| 11 | Trail Line (CatmullRom) | 1.0.62 | 1.0.91 | GPS History |
| 12 | BT 3D Spatial Nodes | 1.0.86 | 1.0.91 | 3D Positioning |
| 13 | Camera Modes (3) | 1.0.8 | 1.0.91 | Camera |
| 14 | HUD Tab-Tuck Panels | 1.0.0 | 1.0.91 | UI |
| 15 | Control Buttons (8) | 1.0.0 | 1.0.91 | UI/Control |
| 16 | Legend Panel | 1.0.64 | 1.0.91 | Reference |
| 17 | Wi-Fi Scanner Panel | 1.0.38 | 1.0.91 | Data Display |
| 18 | Broadcast Status Bar | 1.0.20 | 1.0.91 | Status |
| 19 | Update Notification | 1.0.91 | 1.0.91 | System |
| 20 | Chart.js Metrics | 1.0.86 | 1.0.91 | Metrics |
| 21 | GLSL Shaders | 1.0.50 | 1.0.91 | Shaders |
| 22 | CanvasTexture Labels | 1.0.20 | 1.0.91 | Labels |
| 23 | AdditiveBlending | 1.0.30 | 1.0.91 | Materials |
| 24 | Auto-Spin Toggle | 1.0.0 | 1.0.91 | Camera |
| 25 | POV Zoom Buttons | 1.0.55 | 1.0.91 | Camera |
| 26 | FLY Mode Waypoints | 1.0.9 | 1.0.91 | Camera |
| 27 | Theory Mode | 1.0.86 | 1.0.91 | Visualization |

---

## CROSS-REFERENCES TO OTHER SECTIONS

| Section | Connection | Details |
|---------|------------|---------|
| **Sec 2: Android Features** | JS Bridge | 30 connections mapped (Sec 3) |
| **Sec 3: Connections** | C001-C030 | Android→HTML: 13, HTML→Android: 12, Bidirectional: 2 |
| **Sec 4: SDK/Tools** | Build | build.sh injects HTML as asset |
| **Sec 5: Best Practices** | BP014-BP017 | Local assets, try/catch, GPU disposal, FIFO cap |
| **Sec 5: Anti-Patterns** | CP009-CP014 | No disposal, no error handling, unbounded arrays |
| **Sec 6: Errors** | E012, E016, E029 | OOM, silent bridge failures, bloom too bright |
| **Sec 7: Future** | FP008, FP010-012 | Offline maps, voice, GPX/KML, themes |
| **Sec 9: Working Features** | WF006-WF010 | 3D viz, beacons, trail, BT 3D, camera modes |
| **Sec 10: Refinements** | RF007-RF010, RF015-RF016 | ES6 modules, adaptive rebuild, bloom auto-scale |

---

## KEY METRICS

| Metric | Value |
|--------|-------|
| **HTML Lines (v1.0.91)** | 770 |
| **HTML Lines (v1.0.0)** | 303 |
| **Growth** | 2.54x |
| **Three.js Version** | r128 (locked) |
| **Chart.js Version** | Latest local |
| **Post-Processing** | EffectComposer + UnrealBloomPass |
| **Max Trail Points** | 2000 (FIFO) |
| **Max BT 3D Points** | 50 active / 100 global |
| **Camera Modes** | 3 (Orbit/FLY/POV) |
| **HUD Panels** | 6 (Beacons/Scan/BT/Forge/Controls/Legend/WiFi/Update) |
| **Control Buttons** | 8 |
| **GLSL Shaders** | 3 custom + 2 Three.js built-in |
| **Offline Capable** | Yes (all core features) |

---

## CRITICAL LESSONS LEARNED

1. **Local Assets Mandatory** — CDN fails offline (BP014)
2. **GPU Disposal Non-Negotiable** — OOM crashes without it (BP016, E012)
3. **Error Handling on Bridge** — Silent failures are debugging hell (BP015, E016)
4. **FIFO Caps Prevent Leaks** — Unbounded arrays = OOM (BP017, E014)
5. **Adaptive Rebuild Beats Fixed** — Every 5 frames → adaptive by speed (RF010)
6. **Mobile GPU Different** — Bloom strength must scale (RF016, E029)
7. **Touch Targets Matter** — 44px minimum for vehicle use
8. **Three.js Version Lock** — r128 stable; upgrade planned (RF008)

---

## FILE LOCATIONS

| File | Purpose |
|------|---------|
| `HTML_Aspects_Spreadsheet.csv` | 27 components × 11 columns |
| `bounce.html` | Main entry (2200 lines, in assets/) |
| `assets/js/three.min.js` | Three.js r128 core |
| `assets/js/OrbitControls.js` | Camera controls |
| `assets/js/EffectComposer.js` | Post-processing |
| `assets/js/UnrealBloomPass.js` | HDR bloom |
| `assets/js/ShaderPass.js` | Custom shaders |
| `assets/js/Chart.min.js` | Metrics charts |
| `assets/css/bounce.css` | All styling |
| `forensic/source/v*/bounce.html` | Historical versions (91) |

---

## PIECE 13 SUMMARY
This final piece provides the complete component inventory (27 tracked), cross-reference matrix to all 12 other sections, key metrics (770 lines, 2.54x growth, offline capable), critical lessons learned (8 hard-won principles), and file locations. The HTML layer evolved from 303 lines (v1.0.0) to 770 lines (v1.0.91) — a 2.54x growth — while maintaining zero CDN dependencies, GPU-safe disposal, and comprehensive error handling.

---

**END OF SECTION 1: HTML ASPECTS — THREE.JS VISUALIZATION**
*13 pieces covering: Core Engine → Beacons/Physics → Trail/Camera → HUD/Controls → Data Panels → Metrics/Shaders → BT 3D/Theory/FLY → POV/Camera Deep-Dive → Error Handling → Asset Management → Performance History → Future Roadmap → Summary/Cross-Refs*

*Next: Section 2 — Android Main Features (article2_A2-02)*
---

