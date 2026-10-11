
## PIECE 9: PHYSICS ENGINE (tge_e1.html pieces 19-23)
- [x] step(): position update, eggshell collision detection
- [x] handleReflection(): normal calculation, velocity reflection, 0.99 damping
- [x] checkPrimeGaps(): radial distance vs prime gap threshold
- [x] updateHUD(): real-time stats display
- [x] Prime gap events via TGEBridge
- [x] Worldline reflection events via TGEBridge
- [x] onScanPressed(): random velocity kick

---

## PIECE 10: RENDERING PIPELINE (tge_e1.html pieces 24-28)
- [x] render(): clear, drawEggshell, drawWorldline, drawPrimeGapMarkers, drawElectron, drawReflectionCircles
- [x] drawEggshell(): elliptical stroke with rotation animation
- [x] drawWorldline(): gradient path from history (transparent → prime teal)
- [x] drawPrimeGapMarkers(): concentric ellipses for each crossed gap
- [x] drawElectron(): radial glow + core particle
