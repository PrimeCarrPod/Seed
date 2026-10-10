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