# Future_Progress_Roadmap_P0_P3 — Piece 02/13
## Article A7: A7-07 — Future Progress Roadmap P0 P3
**Piece:** 02 of 13  
**Generated:** 2026-10-08 06:27:18 UTC

---

# P1 — High Priority (Should Have) — Architecture & Positioning

## FP003: Particle Filter Parameter Learning
- **Category:** Positioning
- **Priority:** P1 | **Effort:** High | **Target:** v1.0.94
- **Description:** Adaptive RSSI mean/variance/path-loss exponent per AP learned from scan history
- **Dependencies:** ParticleFilter.java, historical scan data storage
- **Success Criteria:** Parameters adapt to environment within 50 scans
- **Blockers:** Requires scan history persistence (currently in-memory only)
- **Notes:** P1-01 from master list; eliminates manual tuning

## FP004: Unit Test Suite (JUnit)
- **Category:** Architecture
- **Priority:** P1 | **Effort:** High | **Target:** v1.0.94
- **Description:** Comprehensive tests for all 6 positioning algorithms (Kalman, Particle, EKF, UKF, RSSI-ML, BT-3D)
- **Dependencies:** New `test/` directory, test fixtures from forensic data
- **Success Criteria:** >80% code coverage on positioning modules
- **Blockers:** Significant time investment; legacy code not testable without refactor
- **Notes:** P1-02 from master list; forensic diffs provide regression test cases

## FP005: Multi-Activity Architecture
- **Category:** Architecture
- **Priority:** P1 | **Effort:** High | **Target:** v1.0.95
- **Description:** Separate ScanningService, BroadcastService, UI Activity — eliminate God class
- **Dependencies:** New Service components, IPC design (AIDL/Binder)
- **Success Criteria:** No single class >300 lines; clear separation of concerns
- **Blockers:** Major refactor of 1,416-line MainActivity
- **Notes:** P1-03 from master list; critical for maintainability

## FP006: Background Scanning Service
- **Category:** Architecture
- **Priority:** P1 | **Effort:** Medium | **Target:** v1.0.95
- **Description:** Foreground Service with persistent notification for continuous scanning
- **Dependencies:** Service + Notification channel, battery optimization handling
- **Success Criteria:** Scans survive background/doze mode; <5% battery/hour
- **Blockers:** Notification UX, Android 12+ foreground service restrictions
- **Notes:** P1-04 from master list; enables true always-on positioning

---

## Architecture Debt Analysis (from Forensic Data)

| Version | MainActivity Lines | HTML Lines | Technical Debt |
|---------|-------------------|------------|----------------|
| v1.0.0 | 160 | 303 | Clean foundation |
| v1.0.25 | 639 | 461 | Sensor fusion added inline |
| v1.0.48 | 711 | 505 | BLE scanning added inline |
| v1.0.79 | 779 | 605 | Kalman filter added inline |
| v1.0.86 | 1,319 | 750 | BT 3D Spatial added inline |
| v1.0.90 | 1,396 | 766 | 6-algo stack added inline |
| v1.0.91 | 1,416 | 770 | Auto-update added inline |

**Pattern:** Every major feature added directly to MainActivity — zero modularization.

---

*End of Piece 02/13 — See Piece 03 for P1 Network & P2 Visualization items*