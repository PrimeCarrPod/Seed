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