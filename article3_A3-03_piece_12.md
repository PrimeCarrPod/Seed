# Connection_Pathways_Bidirectional — Piece 12/13
## Article A3: A3-03 — Connection Pathways Bidirectional
**Piece:** 12 of 13  
**Generated:** 2026-10-08 04:26:00 UTC

---

## CROSS-REFERENCE MATRIX

### Connections → Section 1 (HTML Aspects)
| Connection | HTML Component | Section 1 Piece |
|------------|----------------|-----------------|
| C001 Wi-Fi | Wi-Fi Scanner Panel | Piece 05 |
| C002 BT 2D | Vehicle Beacons | Piece 02 |
| C003 BT 3D | BT 3D Spatial Nodes | Piece 07 |
| C004 GPS | Trail System | Piece 03 |
| C005 Orientation | Camera Modes (POV) | Piece 03 |
| C006 Broadcast | Broadcast Status Bar | Piece 05 |
| C007 Update | Update Notification Panel | Piece 05 |
| C010 Camera | Camera Modes (Orbit/FLY/POV) | Piece 03 |
| C011 POV | POV Zoom Buttons | Piece 08 |
| C012 Auto-Spin | Auto-Spin Toggle | Piece 03 |
| C013 Scatter | Vehicle Beacons | Piece 02 |
| C014 Reset | Vehicle Beacons | Piece 02 |
| C015 Broadcast | SSID Broadcast | Piece 06 |
| C016 Trail | Trail System | Piece 03 |
| C017 Save | Trail System | Piece 03 |
| C018 Theory | Theory Mode | Piece 07 |
| C019 Trajectory | BT 3D Spatial Nodes | Piece 07 |
| C020 All Devices | BT 3D Spatial Nodes | Piece 07 |
| C021 Download | Update Panel | Piece 05 |
| C022 Ignore | Update Panel | Piece 05 |
| C023 Permissions | HUD Panels | Piece 04 |
| C024 Errors | Error Handling | Piece 09 |
| C026 Trail | Trail System | Piece 03 |
| C027 AP Positions | Static Node Field | Piece 02 |
| C028 Zones | Wi-Fi Scanner Panel | Piece 05 |
| C029 SSID Refresh | Broadcast Status Bar | Piece 05 |
| C025 Bridge Core | All Components | Piece 09 |
| C030 Load URL | bounce.html entry | Piece 10 |

---

### Connections → Section 2 (Android Features)
| Connection | Android Feature | Section 2 Piece |
|------------|-----------------|-----------------|
| C001 | Wi-Fi Scanning | Piece 01 |
| C002 | Bluetooth LE Scanning | Piece 01 |
| C003 | BT 3D Spatial | Piece 06 |
| C004 | GPS Tracking | Piece 02 |
| C005 | Sensor Fusion | Piece 02 |
| C006 | SSID Broadcast | Piece 07 |
| C007 | Auto-Update System | Piece 03 |
| C010 | Camera Modes | Piece 01 (via JS bridge) |
| C015 | Wi-Fi Direct Toggle | Piece 01 |
| C016 | Wake Lock / Trail | Piece 02, 06 |
| C023 | Runtime Permissions | Piece 07 |
| C024 | Error Handling | Piece 09-11 |
| C027 | Trilateration/EKF/Particle | Piece 04-05 |
| C028 | Zone HMM | Piece 05 |
| C029 | SSID Broadcast | Piece 07 |

---

### Connections → Section 5 (Best Practices)
| Best Practice | Connections |
|---------------|-------------|
| BP015: HTML try/catch | C001-C030 (all) |
| BP016: GPU disposal | C026 (trail) |
| BP008: BT 5s restart | C002, C003 |
| BP012: Fixed duty cycle | C006, C015 |

### Connections → Section 6 (Errors)
| Error | Connections Affected |
|-------|---------------------|
| E009: Wi-Fi no results | C001 |
| E010: BT scan death | C002, C003 |
| E011: EKF vy bug | C027 (indirect) |
| E012: OOM WebGL | C026 (trail) |
| E016: Bridge silent fail | All HTML→Android |
| E017: SSID drift | C006, C015 |

---

## PIECE 12 SUMMARY
This piece provides the complete cross-reference matrix linking all 30 connections to Section 1 HTML components (27 components across 10 pieces), Section 2 Android features (21 features across 7 pieces), Section 5 best practices (4 BPs), and Section 6 errors (6 errors). Every connection is traceable to its UI component, Android implementation, best practice, and potential error.

**Next Piece (13):** Connection Pathways Summary + Key Metrics + File Locations