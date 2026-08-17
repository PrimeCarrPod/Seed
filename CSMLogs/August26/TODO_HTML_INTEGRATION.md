# CSMLogs/August26 — HTML Integration Todo List

**Updated:** 2026-08-17  
**Source:** CSM_WORK_IN_PROGRESS/README.md + INSTRUCTIONS.md + Session Logs

---

## 📋 Phase 3: LOL_v4_staging (IN PROGRESS)
**Target:** `CSM_WORK_IN_PROGRESS/DeepResearch/SubParticlesV4/LOL_v4_staging/index_v4.html`

- [x] **3.1** Create directory structure: `LOL_v4_staging/js/`, `LOL_v4_staging/css/`
- [x] **3.2** Read source: `DeepResearch/SubParticlesV1/Tardigradia/LOL_v3_staging/index_v3.html` (34 particles, glueball worldlines, swarm, flight controller)
- [x] **3.3** Read source: `CSMApps/landolil/v7b/src/main/assets/tardigradia.html` (18 microbe icons, camera follow, motion sensor, Android bridge)
- [x] **3.5** Copy local JS/CSS dependencies to `js/`, `css/`
  - [x] Downloaded Three.js r128, Chart.js, OrbitControls, EffectComposer, UnrealBloomPass, etc.
  - [x] Copied v2 CSS/JS from LOL_v2_staging
- [x] **3.4** Merge → `LOL_v4_staging/index_v4.html` with:
  - [x] 34 particle species (all V4.0)
  - [x] Microbe icons for all 34 (extended from 18)
  - [x] Camera Follow (5s hold, smooth lerp)
  - [x] Motion Sensor (accelerometer/gyro via Android bridge)
  - [x] Click raycast → detail panel
  - [x] Android bridge (`LandOLil` interface) preserved
  - [x] Local Three.js/Chart.js/shaders (no CDN)
  - [x] Particle count configurable (200-3000 default, up to 150k)
- [ ] **3.6** Test in browser/WebView

---

## 📋 Phase 4: TGPU004.htm (PENDING)
**Target:** `CSM_WORK_IN_PROGRESS/DeepResearch/SubParticlesV4/TGPU004.htm`

- [ ] **4.1** Read evolution: TGPU00000001.htm → TGPU00000002.htm → TGPU003.htm
- [ ] **4.2** Build V4.0 physics integration:
  - [ ] All 34+ particle species with V4.0 properties
  - [ ] Glueball worldlines with QCD string tension
  - [ ] Swarm mechanics + fluid dynamics coupling
  - [ ] Microbial ecosystem food chain visualization
  - [ ] One-electron universe worldline topology
  - [ ] Real-time metrics: Action, Benevolence, Coherence, Glueball energy
  - [ ] Camera follow, motion sensor, click detail, flight controller
  - [ ] Android bridge for native deployment
  - [ ] Local Three.js/Chart.js (offline capable)
- [ ] **4.3** Validate offline capability

---

## 📋 Phase 5: index_v4.html (PENDING)
**Target:** `CSM_WORK_IN_PROGRESS/DeepResearch/SubParticlesV4/index_v4.html`

- [ ] **5.1** Create main entry point / landing page
- [ ] **5.2** Link to LOL_v4_staging, TGPU004.htm, documentation
- [ ] **5.3** Include project overview, particle selector, credits link

---

## 📋 Phase 6: CREDITS.md (PENDING)
**Target:** `CSM_WORK_IN_PROGRESS/DeepResearch/SubParticlesV4/CREDITS.md`

- [ ] **6.1** Compile from running draft (CREDITS_DRAFT.md)
- [ ] **6.2** Credit all: papers (authors), experiments (collaborations), frameworks (originators), libraries (maintainers), AI tools (developers), Creative Director (Jason Brodsky)

---

## 📋 Phase 7: Git Push (PENDING)
**Branch:** `session/csm-work-in-progress-subparticlesv4-<timestamp>`

- [ ] **7.1** Commit Phase 3 complete
- [ ] **7.2** Commit Phase 4 complete
- [ ] **7.3** Commit Phase 5 complete
- [ ] **7.4** Commit Phase 6 complete
- [ ] **7.5** Final push to remote

---

## 📥 Local Log Files Ingested ✅ COMPLETE
**Target:** `CSMLogs/August26/`

- [x] **Log File 1:** session-legal-acts-qa-complete.md — Legal Acts QA completion & architecture
- [x] **Log File 2:** session-subparticles-v3v4-creation.md — SubParticlesV3/V4 creation & HTML integration
- [x] **Log File 3:** session-v5-prime-electron-build.md — V5 Prime Electron Build (7 series complete)
- [x] **Log File 4:** session-full-creation-log.md — Full SubParticlesV3/V4 creation & HTML integration log
- [x] **Log File 5:** session-legal-acts-todo-updates.md — Legal Acts MASTER TODO LIST updates (RTF source)
- [x] **Log File 6:** session-v4-gluon-creation.md — SubParticlesV4 Gluon V4.0 creation (RTF source)

---

## 🎯 Current Status
| Phase | Status | Next Action |
|-------|--------|-------------|
| Phase 1 (Glueball V4.0 Parts 11-14) | ✅ Complete | — |
| Phase 2A (33 V2.0→V4.0 upgrades) | ✅ Complete | — |
| Phase 2B (4 PDFs→V4.0) | ✅ Complete | — |
| **Phase 3 (LOL_v4_staging)** | ⏳ **READY TO START** | **Awaiting your approval to begin 3.1** |
| Phase 4 (TGPU004.htm) | ⏳ Pending | Awaits Phase 3 |
| Phase 5 (index_v4.html) | ⏳ Pending | Awaits Phase 4 |
| Phase 6 (CREDITS.md) | ⏳ Pending | Awaits Phase 5 |
| Phase 7 (Git Push) | ⏳ Pending | Awaits Phase 6 |
| **Log Ingestion** | ✅ **COMPLETE** | 6 log files added |

---

**Next Step:** Ready to begin **Phase 3.1** — create `LOL_v4_staging/js/`, `LOL_v4_staging/css/` directory structure. Awaiting your approval to proceed.

*V5 Particle series (Electron, Gluon, Graviton, Higgs, Neutrino, Photon, WZ) all complete — this HTML integration is the final SubParticlesV4 deliverable.*