# Refinement_Existing_Parts_Prioritized — Piece 11/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 11 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Prioritization Matrix & Roadmap (RF001–RF030)

## 11.1 Prioritization Framework

### Scoring Model (WSJF - Weighted Shortest Job First):
```
Priority Score = (User Value + Time Criticality + Risk Reduction) / Effort

Where:
- User Value: 1-10 (impact on user experience)
- Time Criticality: 1-10 (urgency, deadlines)
- Risk Reduction: 1-10 (technical debt, bug prevention)
- Effort: 1-10 (person-weeks, inverted so lower effort = higher score)
```

### Refined Scores for All 30 Refinements:

| ID | Refinement | User Value | Time Critical | Risk Red. | Effort | WSJF Score | Priority |
|----|------------|------------|---------------|-----------|--------|------------|----------|
| RF002 | EKF vy bug fix | 10 | 10 | 10 | 1 | **30.0** | P0 ✅ Done |
| RF003 | Wi-Fi RTT ranging | 9 | 9 | 8 | 8 | **3.25** | P0 |
| RF005 | Trilateration self-calibration | 9 | 8 | 8 | 7 | **3.57** | P0 |
| RF021 | Release keystore/signing | 10 | 10 | 9 | 6 | **4.83** | P0 |
| RF001 | MainActivity split | 8 | 7 | 9 | 8 | **3.00** | P1 |
| RF004 | Particle filter adaptive | 8 | 6 | 7 | 7 | **3.00** | P1 |
| RF006 | Build SDK auto-detect | 7 | 8 | 6 | 2 | **10.5** | P1 |
| RF009 | Chart.js metrics expansion | 6 | 5 | 5 | 2 | **8.00** | P1 |
| RF010 | Trail adaptive rebuild | 6 | 4 | 5 | 2 | **7.50** | P1 |
| RF011 | BT scan adaptive | 7 | 5 | 6 | 2 | **9.00** | P1 |
| RF013 | EKF adaptive Q | 7 | 5 | 7 | 4 | **4.75** | P1 |
| RF014 | Zone HMM adaptive | 6 | 4 | 6 | 4 | **4.00** | P1 |
| RF016 | Bloom auto-scale | 7 | 6 | 7 | 5 | **4.00** | P1 |
| RF017 | PermissionManager | 6 | 5 | 7 | 5 | **3.60** | P1 |
| RF018 | JS Bridge namespaces | 7 | 4 | 6 | 3 | **5.67** | P1 |
| RF019 | ErrorReporter | 7 | 5 | 8 | 3 | **6.67** | P1 |
| RF022 | Unit tests (6 algos) | 8 | 7 | 9 | 8 | **3.00** | P1 |
| RF027 | Voice/TTS alerts | 8 | 6 | 5 | 3 | **6.33** | P1 |
| RF028 | Multi-format export | 6 | 4 | 4 | 3 | **4.67** | P1 |
| RF007 | HTML/Three.js modules | 6 | 3 | 6 | 5 | **3.00** | P2 |
| RF008 | Three.js version mgmt | 4 | 3 | 4 | 2 | **5.50** | P2 |
| RF012 | SSID broadcast adaptive | 5 | 3 | 4 | 2 | **6.00** | P2 |
| RF015 | Trail tension param | 3 | 2 | 2 | 1 | **7.00** | P2 |
| RF020 | APK size audit | 4 | 3 | 4 | 3 | **3.67** | R2 |
| RF023 | CI/CD pipeline | 7 | 6 | 8 | 6 | **3.50** | P2 |
| RF024 | Auto-version from git | 4 | 3 | 4 | 2 | **5.50** | P2 |
| RF025 | ProGuard/R8 | 5 | 3 | 5 | 3 | **4.33** | P2 |
| RF026 | Offline vector tiles | 7 | 4 | 6 | 9 | **1.89** | P2 |
| RF029 | Theme system | 5 | 2 | 3 | 2 | **5.00** | P2 |
| RF030 | Accessibility | 6 | 4 | 5 | 3 | **5.00** | P2 |

---

## 11.2 Release Roadmap (v1.0.92 → v1.0.96)

### v1.0.92 — **Critical Bug Fix** ✅ COMPLETE
- RF002: EKF vy initialization bug fix
- Pre-built APK: `CSMWip/05_BOUNCE/BOUNCE.WIP/v92/out/Bounce-v1.0.92.apk`

### v1.0.93 — **Foundation & Release Readiness** (Target: 2 weeks)
| Ref | Title | Effort | Owner |
|-----|-------|--------|-------|
| RF003 | Wi-Fi RTT ranging implementation | High | Radio team |
| RF005 | Trilateration AP self-calibration | High | Positioning team |
| RF006 | Build script SDK auto-detection | Low | Build team |
| RF021 | Release keystore & signing config | High | Release team |

**Gate:** Signed release APK uploads to Play Console internal track

### v1.0.94 — **Core Algorithm & UI Modernization** (Target: 4 weeks)
| Ref | Title | Effort | Owner |
|-----|-------|--------|-------|
| RF004 | Particle filter adaptive parameters | High | Positioning |
| RF007 | HTML/Three.js modularization | Medium | Frontend |
| RF008 | Three.js version management | Low | Frontend |
| RF009 | Chart.js metrics expansion | Low | Frontend |
| RF010 | Trail adaptive rebuild | Low | Frontend |
| RF011 | BT scan adaptive duty cycle | Low | Radio |
| RF012 | SSID broadcast adaptive | Low | Radio |
| RF013 | EKF adaptive process noise | Medium | Positioning |
| RF014 | Zone HMM adaptive transitions | Medium | Positioning |
| RF015 | Trail tension parameter | Low | Frontend |
| RF016 | Bloom auto-scale by GPU tier | Medium | Frontend |
| RF018 | JS Bridge namespace organization | Low | Bridge |
| RF019 | Centralized ErrorReporter | Low | Frontend |
| RF020 | APK size audit + ProGuard (RF025) | Low | Build |
| RF022 | Unit tests for 6 algorithms | High | QA |
| RF024 | Auto-version from git tags | Low | Build |
| RF028 | Multi-format export (GPX/KML/CSV) | Low | Data |
| RF029 | Theme system (CSS variables) | Low | Frontend |

**Gate:** All P1 items complete; unit test coverage >80%; APK <200KB

### v1.0.95 — **Architecture & Platform** (Target: 3 weeks)
| Ref | Title | Effort | Owner |
|-----|-------|--------|-------|
| RF001 | MainActivity split (4 services) | High | Architecture |
| RF017 | Unified PermissionManager | Medium | Architecture |
| RF023 | CI/CD pipeline (GitHub Actions) | Medium | DevOps |
| RF027 | Voice/TTS announcements | Low | Platform |

**Gate:** CI/CD passing; modular architecture deployed; Play Store beta

### v1.0.96 — **Advanced Features** (Target: 4 weeks)
| Ref | Title | Effort | Owner |
|-----|-------|--------|-------|
| RF026 | Offline vector map tiles | High | Maps |
| RF030 | Accessibility (TalkBack) | Low | Frontend |

**Gate:** Offline mode functional; WCAG 2.1 AA compliant; Production release

---

## 11.3 Dependency Graph

```
                    ┌─────────────┐
                    │  RF006      │ Build auto-detect
                    │  (P1, Low)  │
                    └──────┬──────┘
                           │
          ┌────────────────┼────────────────┐
          ▼                ▼                ▼
    ┌───────────┐    ┌───────────┐    ┌───────────┐
    │  RF021    │    │  RF023    │    │  RF024    │
    │ Release   │    │ CI/CD     │    │ Version   │
    │ signing   │    │ pipeline  │    │ auto-gen  │
    └─────┬─────┘    └─────┬─────┘    └─────┬─────┘
          │                │                │
          └────────────────┼────────────────┘
                           ▼
              ┌─────────────────────────┐
              │     v1.0.93 Release     │
              └───────────┬─────────────┘
                          │
        ┌─────────────────┼─────────────────┐
        ▼                 ▼                 ▼
┌───────────────┐ ┌───────────────┐ ┌───────────────┐
│ Positioning   │ │ Frontend/     │ │ Build/Infra   │
│ RF003, RF005  │ │ RF007-016     │ │ RF020, RF025  │
│ RF004, RF013  │ │ RF018, RF019  │ │ RF022, RF024  │
│ RF014         │ │ RF028, RF029  │ │               │
└───────┬───────┘ └───────┬───────┘ └───────┬───────┘
        │                 │                 │
        └─────────────────┼─────────────────┘
                          ▼
              ┌─────────────────────────┐
              │     v1.0.94 Release     │
              └───────────┬─────────────┘
                          │
        ┌─────────────────┼─────────────────┐
        ▼                 ▼                 ▼
┌───────────────┐ ┌───────────────┐ ┌───────────────┐
│ Architecture  │ │ Platform      │ │ DevOps        │
│ RF001, RF017  │ │ RF027         │ │ RF023         │
└───────┬───────┘ └───────┬───────┘ └───────┬───────┘
        │                 │                 │
        └─────────────────┼─────────────────┘
                          ▼
              ┌─────────────────────────┐
              │     v1.0.95 Release     │
              └───────────┬─────────────┘
                          │
                          ▼
              ┌─────────────────────────┐
              │      RF026, RF030       │
              │   Offline + A11y        │
              └───────────┬─────────────┘
                          ▼
              ┌─────────────────────────┐
              │     v1.0.96 Release     │
              │    Production Ready     │
              └─────────────────────────┘
```

---

## 11.4 Resource Allocation (5-Person Team)

| Sprint | Focus | Person 1 | Person 2 | Person 3 | Person 4 | Person 5 |
|--------|-------|----------|----------|----------|----------|----------|
| 1-2 | v1.0.93 | RF003 | RF005 | RF006 | RF021 | RF021 |
| 3-6 | v1.0.94 | RF004 | RF007 | RF009 | RF010 | RF011 |
|  |  | RF013 | RF014 | RF016 | RF018 | RF019 |
|  |  | RF022 | RF022 | RF020 | RF025 | RF028 |
| 7-9 | v1.0.95 | RF001 | RF001 | RF017 | RF023 | RF027 |
| 10-13 | v1.0.96 | RF026 | RF026 | RF030 | RF026 | RF026 |

---

## 11.5 Risk-Adjusted Timeline

| Version | Optimistic | Realistic | Pessimistic | Key Risks |
|---------|------------|-----------|-------------|-----------|
| v1.0.93 | 1 week | 2 weeks | 3 weeks | RTT hardware availability |
| v1.0.94 | 3 weeks | 4 weeks | 6 weeks | Algorithm complexity, Three.js migration |
| v1.0.95 | 2 weeks | 3 weeks | 5 weeks | Architecture refactor scope creep |
| v1.0.96 | 3 weeks | 4 weeks | 6 weeks | Tile generation pipeline, a11y testing |
| **Total** | **9 weeks** | **13 weeks** | **20 weeks** | |

---

*End of Piece 11/13*