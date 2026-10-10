# Future_Progress_Roadmap_P0_P3 — Piece 05/13
## Article A7: A7-07 — Future Progress Roadmap P0 P3
**Piece:** 05 of 13  
**Generated:** 2026-10-08 06:27:18 UTC

---

# P3 — Low Priority (Future Vision) — Positioning, Network, Visualization

## FP015: V2X / C-V2X Support
- **Category:** Network
- **Priority:** P3 | **Effort:** Very High | **Target:** v1.0.98+
- **Description:** Cellular V2X (LTE-V / NR-V2X) for highway scenarios without direct line-of-sight
- **Dependencies:** New module, carrier partnership, qualified modem
- **Success Criteria:** 300m+ range at highway speeds; <100ms latency
- **Blockers:** Carrier dependent; hardware qualification; regulatory
- **Notes:** P3-03 from master list; transforms from ad-hoc to infrastructure

## FP016: AR Overlay (ARCore)
- **Category:** Visualization
- **Priority:** P3 | **Effort:** High | **Target:** v1.0.97+
- **Description:** Camera feed + 3D annotations for immersive hazard/navigation view
- **Dependencies:** ARCore, camera permission, device compatibility
- **Success Criteria:** Immersive view at 30fps; annotations stable in world space
- **Blockers:** Device support (ARCore certified); battery drain; outdoor lighting
- **Notes:** P3-04 from master list; differentiates from 2D map apps

## FP017: Wear OS Companion
- **Category:** Visualization
- **Priority:** P3 | **Effort:** Medium | **Target:** v1.0.97+
- **Description:** Watch app for haptic alerts (hazard left/right, speed zone, navigation)
- **Dependencies:** Wear OS module, Data Layer API, haptic patterns
- **Success Criteria:** Glanceable alerts <1s latency; 24hr battery
- **Blockers:** New form factor; watch pairing flow; small screen UX
- **Notes:** P3-05 from master list; extends safety to non-phone contexts

## FP025: Trajectory Sharing
- **Category:** Network
- **Priority:** P1 | **Effort:** High | **Target:** v1.0.96
- **Description:** Fleet vehicles share predicted paths for collision avoidance
- **Dependencies:** Mesh protocol + BT 3D Spatial, fleet opt-in
- **Success Criteria:** Path prediction 3s ahead; <50cm error at 2s horizon
- **Blockers:** Privacy concerns; requires fleet opt-in; bandwidth
- **Notes:** From master list; core safety vision

---

## P3 Visionary Items (from landolil V4.0 Inspiration)

### FP027: ACES Tone Mapping
- **Category:** Visualization
- **Priority:** P2 | **Effort:** Low | **Target:** v1.0.94
- **Description:** Enable ACES filmic tone mapping (currently commented out in shaders)
- **Dependencies:** bounce.html shaders, Three.js tone mapping pass
- **Success Criteria:** Cinematic look; <2ms GPU overhead
- **Blockers:** Performance on low-end GPUs; currently commented out

### FP028: Glueball Worldlines
- **Category:** Visualization
- **Priority:** P3 | **Effort:** High | **Target:** v1.0.97+
- **Description:** QCD string tension visualization — flux tube dynamics
- **Dependencies:** Three.js + physics simulation, compute shaders
- **Success Criteria:** Physics accuracy; real-time at 60fps
- **Blockers:** Complex math (lattice QCD); compute shader support

### FP029: Microbial Ecosystem Food Chain
- **Category:** Visualization
- **Priority:** P3 | **Effort:** High | **Target:** v1.0.97+
- **Description:** Predator-prey simulation with emergent behavior visualization
- **Dependencies:** Three.js + agent-based simulation
- **Success Criteria:** Emergent behavior observable; educational value
- **Blockers:** Simulation complexity; from landolil V4.0 concepts

### FP030: One-Electron Universe Topology
- **Category:** Visualization
- **Priority:** P3 | **Effort:** High | **Target:** v1.0.97+
- **Description:** Worldline visualization — single electron traversing spacetime
- **Dependencies:** Three.js + mathematical topology
- **Success Criteria:** Conceptual physics accuracy; interactive exploration
- **Blockers:** Abstract concept; from landolil V4.0 visionary work

---

*End of Piece 05/13 — See Piece 06 for Monetization & Architecture items*