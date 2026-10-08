# Future_Progress_Roadmap_P0_P3 — Piece 04/13
## Article A7: A7-07 — Future Progress Roadmap P0 P3
**Piece:** 04 of 13  
**Generated:** 2026-10-08 06:27:18 UTC

---

# P2 — Medium Priority (Nice to Have) — Visualization Polish

## FP011: Night/Day Theme Toggle
- **Category:** Visualization
- **Priority:** P2 | **Effort:** Low | **Target:** v1.0.94
- **Description:** CSS variable swap for lighting conditions (auto-switch by time/ambient sensor)
- **Dependencies:** bounce.html CSS refactor, CSS custom properties
- **Success Criteria:** Auto-switch by time; manual override; smooth transition
- **Blockers:** Color design for both themes; Three.js material compatibility
- **Notes:** P2-04 from master list; simple but high user value

## FP012: Export Trail as GPX/KML
- **Category:** Visualization
- **Priority:** P2 | **Effort:** Low | **Target:** v1.0.94
- **Description:** Standard formats for mapping tools (GPX for tracks, KML for Google Earth)
- **Dependencies:** Trail save dialog, format serializers
- **Success Criteria:** Compatible with GIS tools (QGIS, Google Earth, Strava)
- **Blockers:** Format spec compliance; large trail memory management
- **Notes:** P2-05 from master list; enables post-drive analysis

## FP013: Bluetooth Mesh (BLE Mesh)
- **Category:** Network
- **Priority:** P3 | **Effort:** High | **Target:** v1.0.97+
- **Description:** Standard BLE Mesh provisioning for interoperable device networks
- **Dependencies:** New BLE Mesh module, provisioning UI
- **Success Criteria:** Standard interop with 3rd party BLE Mesh devices
- **Blockers:** Complex spec (Bluetooth Mesh Profile 1.0+); provisioning UX
- **Notes:** P3-01 from master list; long-term standardization play

## FP014: UWB Ranging (FiRa)
- **Category:** Positioning
- **Priority:** P3 | **Effort:** High | **Target:** v1.0.97+
- **Description:** Ultra-wideband distance measurement (API 29+) for cm-level accuracy
- **Dependencies:** New UWB module, FiRa-certified hardware
- **Success Criteria:** cm-level accuracy in LOS; <10cm in NLOS
- **Blockers:** Hardware required (limited device support); FiRa certification
- **Notes:** P3-02 from master list; ultimate positioning precision

---

## Visualization Evolution Context (Forensic)

| Version | HTML Lines | Three.js Features | Key Addition |
|---------|------------|-------------------|--------------|
| v1.0.0 | 303 | Basic scene | Canvas + simple shapes |
| v1.0.25 | 461 | Sensor fusion viz | Real-time particle display |
| v1.0.48 | 505 | BLE beacons | Beacon visualization |
| v1.0.79 | 605 | Kalman viz | Uncertainty ellipses |
| v1.0.86 | 750 | BT 3D Spatial | Azimuth/elevation arcs |
| v1.0.90 | 766 | 6-algo comparison | Algorithm selector UI |
| v1.0.91 | 770 | Auto-update banner | Version notification |

**Gap:** No export, no offline, no themes, no voice — all P2/P3 items.

---

*End of Piece 04/13 — See Piece 05 for P3 Positioning/Network/Visualization items*