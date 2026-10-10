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