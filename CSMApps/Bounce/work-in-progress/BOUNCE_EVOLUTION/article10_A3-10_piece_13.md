# Refinement_Existing_Parts_Prioritized — Piece 13/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 13 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Summary & Next Steps

## 13.1 Complete Refinement Catalog (30 Items)

| ID | Title | Priority | Effort | Target | Status | Dependencies |
|----|-------|----------|--------|--------|--------|--------------|
| RF001 | MainActivity split (4 services) | P1 | High | v1.0.95 | Planned | RF006, RF017, RF022 |
| RF002 | EKF vy initialization bug fix | P0 | Low | v1.0.92 | **Done** | — |
| RF003 | Wi-Fi RTT ranging implementation | P0 | High | v1.0.93 | Planned | API 28+, HW |
| RF004 | Particle filter adaptive params | P1 | High | v1.0.94 | Planned | Scan history |
| RF005 | Trilateration AP self-calibration | P0 | High | v1.0.93 | Planned | Movement data, RF003 |
| RF006 | Build script SDK auto-detection | P1 | Low | v1.0.93 | Planned | — |
| RF007 | HTML/Three.js modularization | P2 | Medium | v1.0.94 | Planned | ES6 modules |
| RF008 | Three.js version management | P2 | Low | v1.0.94 | Planned | Build pipeline |
| RF009 | Chart.js metrics expansion (12→4) | P1 | Low | v1.0.94 | Planned | Telemetry pipe |
| RF010 | Trail adaptive rebuild | P1 | Low | v1.0.94 | Planned | Velocity data |
| RF011 | BT scan adaptive duty cycle | P1 | Low | v1.0.94 | Planned | Device activity |
| RF012 | SSID broadcast adaptive | P2 | Low | v1.0.94 | Planned | GPS/accel |
| RF013 | EKF adaptive process noise | P1 | Medium | v1.0.94 | Planned | RSSI variance |
| RF014 | Zone HMM adaptive transitions | P1 | Medium | v1.0.94 | Planned | Zone history |
| RF015 | Trail tension parameter | P2 | Low | v1.0.94 | Planned | User settings |
| RF016 | Bloom auto-scale by GPU tier | P1 | Medium | v1.0.94 | Planned | WebGL2 bench |
| RF017 | Unified PermissionManager | P1 | Medium | v1.0.95 | Planned | All perms |
| RF018 | JS Bridge namespaces | P1 | Low | v1.0.94 | Planned | Bridge refactor |
| RF019 | Centralized ErrorReporter | P1 | Low | v1.0.94 | Planned | Error boundary |
| RF020 | APK size audit + ProGuard | R2 | Low | v1.0.94 | Planned | Build pipeline |
| RF021 | Release keystore & signing | P0 | High | v1.0.93 | Planned | Keystore gen |
| RF022 | Unit tests (6 algorithms) | P1 | High | v1.0.94 | Planned | JUnit 5 |
| RF023 | CI/CD pipeline (GitHub Actions) | P2 | Medium | v1.0.95 | Planned | RF006, RF021 |
| RF024 | Auto-version from git tags | P2 | Low | v1.0.94 | Planned | Git tags |
| RF025 | ProGuard/R8 minification | P2 | Low | v1.0.94 | Planned | RF020 |
| RF026 | Offline vector map tiles | P2 | High | v1.0.96 | Planned | OSM data |
| RF027 | Voice/TTS announcements | P1 | Low | v1.0.95 | Planned | TTS API |
| RF028 | Multi-format export (GPX/KML/CSV) | P1 | Low | v1.0.94 | Planned | Trail system |
| RF029 | Theme system (CSS variables) | P2 | Low | v1.0.94 | Planned | CSS vars |
| RF030 | Accessibility (TalkBack) | P2 | Low | v1.0.95 | Planned | WCAG 2.1 AA |

**Priority Summary:** P0=5 (1 Done), P1=14, P2=9, R2=2 | **Total Effort:** High=6, Medium=14, Low=10

---

## 13.2 Forensic Analysis Integration

This refinement catalog is directly derived from forensic analysis of **91 BOUNCE versions** (v1.0.0–v1.0.91):

### Key Forensic Drivers:
1. **Code Growth:** MainActivity 160→1,416 lines (8.8×), HTML 303→770 lines (2.5×)
2. **Build Failures:** 5 versions with APK size anomalies (v1.0.77, 80, 81, 82, 83)
3. **Critical Bug:** EKF vy initialization (PositionEKF.java:38) — fixed in v1.0.92
4. **Algorithm Evolution:** 6 positioning algorithms added without test coverage
5. **Architecture Debt:** Zero modularization, monolithic HTML, flat JS bridge

### Spreadsheet Cross-Reference:
- **Refinement_Existing_Parts_Spreadsheet.csv** — This catalog (30 rows)
- **Future_Progress_Spreadsheet.csv** — P0-P3 roadmap alignment
- **Repeated_Errors_Catalog_Spreadsheet.csv** — Root causes driving RF002, RF006, RF019
- **Best_Practices_AntiPatterns_Spreadsheet.csv** — Anti-patterns driving RF001, RF007, RF017
- **Working_Features_Versions_Spreadsheet.csv** — Feature timeline informing targets
- **Connection_Pathways_Spreadsheet.csv** — Bridge refactoring scope (RF018)

---

## 13.3 Immediate Next Steps (This Week)

### Week 1: Foundation (v1.0.93 Prep)
- [ ] **RF006:** Implement build.sh auto-detection (2 days)
- [ ] **RF021:** Generate release keystore, document credentials (1 day)
- [ ] **RF003:** Begin Wi-Fi RTT ranging prototype (3 days)
- [ ] **RF005:** Design trilateration calibration algorithm (2 days)

### Week 2: v1.0.93 Release
- [ ] Complete RF003 RTT ranging (integration with WifiRttManager)
- [ ] Complete RF005 self-calibration (Gauss-Newton solver)
- [ ] Integrate RF006 + RF021 into build.sh
- [ ] Produce signed release APK
- [ ] Internal testing on Pixel 6+/Samsung S21+

### Week 3-4: v1.0.94 Sprint Planning
- [ ] Set up Three.js module build pipeline (esbuild/rollup)
- [ ] Create test infrastructure (JUnit 5 + synthetic data)
- [ ] Begin Particle Filter adaptive parameters (RF004)
- [ ] Begin EKF adaptive Q (RF013)
- [ ] Begin HTML modularization (RF007) — config + eventBus first

---

## 13.4 Success Metrics

### Release Gate Criteria:

| Version | Metric | Target |
|---------|--------|--------|
| v1.0.93 | Signed release APK | ✅ Play Console upload |
|  | RTT ranging functional | ✅ 3+ devices |
|  | AP self-calibration | ✅ <2m error |
| v1.0.94 | Unit test coverage | >80% (algorithms) |
|  | APK size | <200KB |
|  | Three.js modules | Zero visual regressions |
|  | All P1 items | ✅ Complete |
| v1.0.95 | CI/CD pipeline | ✅ Green on main |
|  | Modular architecture | ✅ 4 services extracted |
|  | Play Store beta | ✅ Live |
| v1.0.96 | Offline mode | ✅ Functional |
|  | Accessibility | ✅ WCAG 2.1 AA |
|  | Production release | ✅ 1.0.96 on Play Store |

### Ongoing KPIs:
- **Crash-free sessions:** >99.5%
- **Position accuracy (median):** <3m indoor
- **Build time:** <5 minutes
- **APK size:** <200KB
- **Test coverage:** >80% (algorithms), >60% (overall)

---

## 13.5 Long-Term Vision (Post v1.0.96)

| Horizon | Focus | Key Initiatives |
|---------|-------|-----------------|
| **v1.1** | Mesh Networking | Device-to-device ranging, cooperative localization |
| **v1.2** | AI/ML Positioning | Neural network RSSI fingerprinting, learned motion models |
| **v1.3** | Standards & Interop | IEEE 802.11az, OmniLock, FiRa Consortium alignment |
| **v2.0** | Platform | Cross-platform (iOS via Capacitor), web PWA, desktop |

---

## 13.6 Appendix: File Locations

| Artifact | Location |
|----------|----------|
| This section (13 pieces) | `CSMApps/Bounce/work-in-progress/BOUNCE_EVOLUTION/article10_A3-10_piece_XX.md` |
| Refinement spreadsheet | `CSMApps/Bounce/work-in-progress/BOUNCE_EVOLUTION/Refinement_Existing_Parts_Spreadsheet.csv` |
| Forensic analysis | `CSMApps/Bounce/work-in-progress/BOUNCE_EVOLUTION/forensic/analysis/` |
| Master index | `CSMApps/Bounce/work-in-progress/BOUNCE_EVOLUTION/MASTER_INDEX.md` |
| GitHub handler script | `csmpieces/05_scripts_tools/GitHub_handler.sh` |
| Session resume file | `CSMApps/Bounce/work-in-progress/BOUNCE_EVOLUTION/framework/RESUME_SESSION_NEXT_RUNNER.md` |

---

## 13.7 Final Notes

This completes **Section 10: Refinement of Existing Parts** — the 10th of 13 planned sections in the BOUNCE Evolution documentation suite.

**Sections Complete (10/13):**
1. ✅ HTML Aspects / Three.js Visualization
2. ✅ Android Main Features / Radio Positioning
3. ✅ Connection Pathways / Bidirectional
4. ✅ SDK / Tools / Methods / Build Pipeline
5. ✅ Best Practices / Anti-Patterns Catalog
6. ✅ Repeated Errors Catalog / Solutions
7. ✅ Future Progress / Roadmap P0-P3
8. ✅ TGAPP Monetization Architecture
9. ✅ Working Features + Versions History
10. ✅ **Refinement of Existing Parts (THIS SECTION)**

**Sections Remaining (3/13):**
11. ⏳ Future Thoughts / Evaluations / Vision
12. ⏳ Forensic Analysis Data / 91 Versions
13. ✅ Master Index + Cross-Reference (already complete)

---

*End of Section 10 — Refinement of Existing Parts Prioritized*
*Total: 13 pieces, ~4,500 lines of technical documentation*
*Ready for GitHub Handler workflow: concat → zip → verify → organize → commit-push*