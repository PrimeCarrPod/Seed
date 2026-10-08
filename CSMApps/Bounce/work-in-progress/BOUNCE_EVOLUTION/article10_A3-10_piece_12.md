# Refinement_Existing_Parts_Prioritized — Piece 12/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 12 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Risk Assessment & Dependencies (RF001–RF030)

## 12.1 Risk Register

| Risk ID | Description | Likelihood | Impact | Score | Mitigation | Owner | Trigger |
|---------|-------------|------------|--------|-------|------------|-------|---------|
| RISK-001 | Wi-Fi RTT hardware unavailable on test devices | High | High | 9 | Procure Pixel 6+/Samsung S21+; simulate in CI | Radio Lead | Device procurement |
| RISK-002 | MainActivity split breaks existing JS bridge | High | High | 9 | Incremental extraction; bridge compatibility layer | Arch Lead | v1.0.95 sprint start |
| RISK-003 | Three.js module migration breaks visual features | Medium | High | 6 | Visual regression tests; feature flags; rollback plan | Frontend Lead | v1.0.94 sprint start |
| RISK-004 | Particle filter adaptive params diverge in production | Medium | Medium | 4 | Extensive synthetic testing; fallback to fixed params | Positioning Lead | v1.0.94 integration |
| RISK-005 | Release keystore lost/compromised | Low | Critical | 5 | HSM backup; split knowledge; documented recovery | Release Lead | Keystore generation |
| RISK-006 | CI/CD pipeline fails on GitHub Actions runners | Medium | Medium | 4 | Local validation script; self-hosted runner option | DevOps Lead | Pipeline creation |
| RISK-007 | Offline tiles exceed app size limit (150MB) | Medium | High | 6 | Progressive download; regional bundles; compression | Maps Lead | Tile generation |
| RISK-008 | Accessibility audit reveals major gaps | Low | Medium | 3 | Early a11y testing; automated axe-core in CI | Frontend Lead | v1.0.96 start |
| RISK-009 | Unit test coverage <80% for algorithms | Medium | Medium | 4 | Test-first for new code; coverage gate in CI | QA Lead | v1.0.94 test phase |
| RISK-010 | APK size exceeds 200KB after features | Low | Medium | 3 | Size budget per feature; ProGuard; bundle analyzer | Build Lead | Each release |
| RISK-011 | EKF adaptive Q causes filter instability | Medium | High | 6 | Clamping bounds; divergence detection; fallback | Positioning Lead | RF013 integration |
| RISK-012 | Zone HMM learning produces invalid transitions | Low | Medium | 2 | Dirichlet prior; min transition count; validation | Positioning Lead | RF014 integration |
| RISK-013 | Bluetooth adaptive scan misses beacons | Low | Medium | 2 | Minimum scan floor; configurable bounds | Radio Lead | RF011 integration |
| RISK-014 | GPX/KML export loses precision | Low | Low | 1 | Fixed decimal places (7); validation tests | Data Lead | RF028 integration |
| RISK-015 | Theme system breaks Chart.js/Three.js colors | Medium | Medium | 4 | CSS variable mapping tests; theme snapshot testing | Frontend Lead | RF029 integration |

---

## 12.2 Technical Dependencies

### Internal Dependencies (Within BOUNCE):
```
RF006 (Build auto-detect)
    ├─→ RF021 (Release signing) - needs detected paths
    ├─→ RF023 (CI/CD) - needs reproducible build
    └─→ RF024 (Auto-version) - needs build script integration

RF021 (Release keystore)
    ├─→ RF023 (CI/CD) - needs secrets in GitHub
    └─→ RF025 (ProGuard) - needs release build

RF003 (Wi-Fi RTT)
    ├─→ RF005 (Trilateration calibration) - needs RTT ranges
    └─→ RF013 (EKF adaptive Q) - needs RTT variance

RF004 (Particle filter adaptive)
    ├─→ RF013 (EKF adaptive Q) - shared RSSI variance
    └─→ RF014 (Zone HMM) - shared zone/RSSI data

RF007 (HTML modules)
    ├─→ RF008 (Three.js version) - needs module build
    ├─→ RF009 (Chart.js metrics) - needs event bus
    ├─→ RF010 (Trail adaptive) - needs trail module
    ├─→ RF015 (Trail tension) - needs trail module
    ├─→ RF016 (Bloom auto-scale) - needs render module
    ├─→ RF018 (JS Bridge) - needs bridge module
    ├─→ RF019 (ErrorReporter) - needs core module
    ├─→ RF028 (Export) - needs trail module
    ├─→ RF029 (Theme) - needs CSS variable system
    └─→ RF030 (A11y) - needs semantic HTML structure

RF022 (Unit tests)
    ├─→ RF002 (EKF vy fix) - regression test
    ├─→ RF003 (RTT) - test RTT ranging
    ├─→ RF004 (Particle) - test adaptive params
    ├─→ RF005 (Trilateration) - test calibration
    ├─→ RF013 (EKF adaptive) - test Q adaptation
    └─→ RF014 (HMM adaptive) - test transition learning

RF023 (CI/CD)
    ├─→ RF006 (Build script) - build step
    ├─→ RF021 (Signing) - release step
    ├─→ RF022 (Tests) - test step
    ├─→ RF024 (Version) - version step
    └─→ RF025 (ProGuard) - optimize step
```

### External Dependencies:
| Refinement | External Dependency | Version | Risk |
|------------|---------------------|---------|------|
| RF003 | Android SDK (WifiRttManager) | API 28+ | Hardware required |
| RF003 | Google Play Services | Latest | Runtime availability |
| RF007 | Three.js | r158+ | Breaking changes |
| RF007 | ES6 Modules | WebView 60+ | Android 7+ only |
| RF008 | jsDelivr/CDN | - | Network for updates |
| RF009 | Chart.js | 4.x | Breaking from 3.x |
| RF016 | WebGL2 | Android 7+ | GPU tier detection |
| RF021 | keytool/jarsigner | JDK 17+ | Build environment |
| RF023 | GitHub Actions | ubuntu-latest | Runner availability |
| RF026 | OpenStreetMap data | Current | License (ODbL) |
| RF026 | tippecanoe/tilemaker | Latest | Build toolchain |
| RF027 | Android TTS | API 21+ | Voice availability |
| RF029 | CSS Custom Properties | WebView 59+ | Android 7+ |
| RF030 | Accessibility APIs | API 14+ | Universal |

---

## 12.3 Cross-Refinement Synergies

### Shared Infrastructure Investments:
| Investment | Benefits | Refinements Enabled |
|------------|----------|---------------------|
| **Event Bus** (core module) | Decoupled communication | RF007, RF009, RF010, RF015, RF016, RF018, RF019, RF028, RF029, RF030 |
| **RSSI Variance Pipeline** | Shared signal quality metric | RF004, RF013, RF014 |
| **AP Position Store** | Calibrated positions persist | RF003, RF005, RF014 |
| **Error/Telemetry Pipeline** | Unified observability | RF019, RF022, RF023 |
| **Settings/Preferences Store** | User config persistence | RF008, RF015, RF016, RF029, RF030 |
| **Asset Manager** | Offline asset loading | RF008, RF026, RF029 |

### Parallelizable Workstreams:
```
Workstream A: Positioning Core (RF003, RF004, RF005, RF013, RF014)
    → Independent of frontend, requires radio hardware

Workstream B: Frontend Architecture (RF007, RF008, RF009, RF010, RF015, RF016, RF029)
    → Independent of positioning, requires Three.js/Chart.js expertise

Workstream C: Bridge & Platform (RF018, RF019, RF027, RF028, RF030)
    → Requires Android + JS coordination

Workstream D: Build & Release (RF006, RF021, RF023, RF024, RF025)
    → Independent, foundational for all releases

Workstream E: Testing & Quality (RF022)
    → Parallel with all, gates releases
```

---

## 12.4 Rollback & Contingency Plans

| Refinement | Rollback Trigger | Rollback Plan | Contingency |
|------------|------------------|---------------|-------------|
| RF003 (RTT) | Hardware unsupported on >50% devices | Disable RTT; fallback to RSSI-only | Ship without RTT; revisit v1.0.97 |
| RF007 (Modules) | Visual regression >5% | Feature flag: `useModules=false` | Keep monolithic HTML; modularize v1.0.97 |
| RF013 (Adaptive Q) | Filter divergence rate >5% | Clamp Q to fixed bounds | Fixed Q with manual tuning |
| RF016 (Bloom) | FPS drop >15% on mid-tier | Disable bloom on `mid`/`low` tiers | Static bloom config |
| RF021 (Keystore) | Keystore generation fails | Use debug key for internal; delay Play Store | Document manual process |
| RF026 (Offline tiles) | Size >150MB | Reduce zoom levels; drop regions | Online-only with caching |
| RF030 (A11y) | TalkBack breaks core flow | Minimal labels only; defer full a11y | WCAG 2.1 A only |

---

## 12.5 Definition of Done (Per Refinement)

| Ref | Code Complete | Unit Tests | Integration Tests | Docs | Code Review | Deployed to Staging |
|-----|---------------|------------|-------------------|------|-------------|---------------------|
| RF001 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF003 | ✅ | ✅ | ✅ (hw) | ✅ | ✅ | ✅ |
| RF004 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF005 | ✅ | ✅ | ✅ (hw) | ✅ | ✅ | ✅ |
| RF006 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF007 | ✅ | ✅ | ✅ (visual) | ✅ | ✅ | ✅ |
| RF008 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF009 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF010 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF011 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF012 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF013 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF014 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF015 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF016 | ✅ | ✅ | ✅ (perf) | ✅ | ✅ | ✅ |
| RF017 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF018 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF019 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF020 | ✅ | N/A | ✅ (size) | ✅ | ✅ | ✅ |
| RF021 | ✅ | N/A | ✅ (sign) | ✅ | ✅ | ✅ |
| RF022 | ✅ | ✅ (>80%) | ✅ | ✅ | ✅ | ✅ |
| RF023 | ✅ | N/A | ✅ (pipeline) | ✅ | ✅ | ✅ |
| RF024 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF025 | ✅ | N/A | ✅ (size) | ✅ | ✅ | ✅ |
| RF026 | ✅ | ✅ | ✅ (offline) | ✅ | ✅ | ✅ |
| RF027 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF028 | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| RF029 | ✅ | ✅ | ✅ (visual) | ✅ | ✅ | ✅ |
| RF030 | ✅ | ✅ | ✅ (a11y) | ✅ | ✅ | ✅ |

---

*End of Piece 12/13*