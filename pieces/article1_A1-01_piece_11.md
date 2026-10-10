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