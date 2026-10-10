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