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