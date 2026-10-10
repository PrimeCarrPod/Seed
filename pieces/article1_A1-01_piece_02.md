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