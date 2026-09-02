# TEST CAMPAIGN #1 PLAN
## CLPS Campaign — Phase 1: Foundation (Months 1-3)
**Document:** CSM-CLPS-TEST-001  
**Date:** August 26, 2026  
**Author:** Jason Isaac Brodsky (California 1976) — Author, Conducier  
**Technical Lead:** Nematron AI  
**Status:** PLANNED — Execution upon demo article delivery  

---

## OVERVIEW

Execute **Test Campaign #1** on 3 demonstration articles at contractor facilities (independent validation) and partner test labs (baseline correlation). Campaign covers 4 critical environments aligned with CLPS lander risk drivers.

### TARGET COMPLETION: October 31, 2026

---

## TEST MATRIX

| Test | Standard/Method | Article(s) | Facility | Duration | Status |
|------|-----------------|------------|----------|----------|--------|
| **Static Load (200% DLL)** | ASTM D3039 / Custom | LEG-001, PA-001 | Contractor load frame | 2 days each | ⏳ Pending |
| **Thermal Cycle (-170°C to +120°C × 100)** | Custom / NASA-STD | All 3 | Thermal vacuum chamber | 14 days | ⏳ Pending |
| **Vibration (GEVS Protoflight)** | NASA-STD-7001 | All 3 | Shaker table | 3 days each | ⏳ Pending |
| **Radiation (50 krad Si)** | Custom / NASA-HDBK | PV-001, PA-001 | Proton/electron beam | 5 days | ⏳ Pending |

---

## TEST 1: STATIC LOAD (200% DESIGN LIMIT LOAD)

### Objective
Validate structural margin and specific energy absorption vs. aluminum honeycomb baseline.

### Articles
- **LEG-001:** Axial compression to 200% DLL (landing impact simulation)
- **PA-001:** Shear + bending to 200% DLL (payload interface loads)

### Test Setup
| Parameter | LEG-001 | PA-001 |
|-----------|---------|--------|
| **Load Frame Capacity** | 500 kN | 250 kN |
| **Loading Rate** | 1 mm/min (quasi-static) | 1 mm/min |
| **Instrumentation** | 8 strain gauges, 2 FBG, 2 LVDTs | 16 strain gauges, 4 LVDTs |
| **Data Rate** | 100 Hz | 100 Hz |
| **Temperature** | +20°C (ambient) | +20°C (ambient) |

### Acceptance Criteria
- [ ] **LEG-001:** No failure at 200% DLL; specific energy absorption >40% vs. Al honeycomb
- [ ] **PA-001:** No failure at 200% DLL; bolt pattern integrity maintained
- [ ] Strain distribution matches FEA prediction (<10% variance)
- [ ] Zero delamination (post-test UT C-scan)
- [ ] Digital twin correlation: predicted vs. measured strain <5%

### Baseline Comparison (Contractor Independent)
Each contractor tests LBFRP-001 article alongside their current baseline:
- Intuitive Machines: Al honeycomb leg segment
- Firefly: Al honeycomb leg segment  
- Astrobotic: Machined Al adapter ring

---

## TEST 2: THERMAL VACUUM CYCLING

### Objective
Validate integrated thermal management (PGS), CTE behavior, and zero-delamination over 100 lunar day/night cycles.

### Test Setup
| Parameter | Value |
|-----------|-------|
| **Chamber Pressure** | <10⁻⁶ Torr |
| **Hot Soak** | +120°C (4 hours) |
| **Cold Soak** | -170°C (4 hours) |
| **Transition Rate** | 10°C/min (max chamber capability) |
| **Cycles** | 100 (equivalent to 100 lunar days) |
| **Instrumentation** | Thermocouples (all articles), strain gauges (LEG, PA), PGS thermal mapping (PV) |
| **Data Rate** | 1 Hz (thermal), 10 Hz (strain during transitions) |

### Acceptance Criteria
- [ ] **Zero delamination** (pre/post UT C-scan)
- [ ] **Mass loss <0.1%** (outgassing)
- [ ] **PGS thermal spreading** verified: ΔT across PV-001 <15°C at steady state
- [ ] **CTE behavior** matches prediction: no ratcheting strain accumulation
- [ ] **Self-healing check:** Post-cycle inspection for microcrack closure
- [ ] Digital twin thermal model correlation: <5°C variance

### Special: LEG-001 Lunar Night Survival
- Cold soak at -170°C for 14 days (continuous)
- Verify no microcrack initiation at strain gauge locations
- Verify instrumentation survival

---

## TEST 3: VIBRATION (GEVS PROTOFLIGHT)

### Objective
Validate monolithic AFP structure survival through launch loads without bolted-joint fatigue.

### Test Setup
| Parameter | Value |
|-----------|-------|
| **Specification** | NASA-STD-7001, Protoflight levels |
| **Axes** | X, Y, Z (3 orthogonal) |
| **Sine Sweep** | 5-100 Hz, 4g, 2 oct/min |
| **Random Vibration** | 20-2000 Hz, 14.1 g-rms, 120 sec/axis |
| **Acoustic** | 142.5 dB OASPL, 60 sec (if chamber available) |
| **Pyroshock** | Not required for demo (separation shock simulated in static test) |
| **Instrumentation** | Accelerometers (12), strain gauges (all), response monitoring |
| **Pre/Post** | Modal survey (0.5g sine sweep) |

### Acceptance Criteria
- [ ] **No structural damage** (pre/post UT C-scan, visual)
- [ ] **Modal shift <2%** (frequency, damping)
- [ ] **Strain response** within elastic limit (no yield)
- [ ] **Bolt pattern integrity** (PA-001): no loosening, no bearing failure
- [ ] Digital twin dynamic correlation: <5% frequency variance

---

## TEST 4: RADIATION (50 KRAD Si EQUIVALENT)

### Objective
Validate lonsdaleite + Elium radiation shielding performance vs. polyethylene baseline.

### Test Setup
| Parameter | Value |
|-----------|-------|
| **Facility** | University/National lab beam line (e.g., TAMU, LBNL, NASA NSRL) |
| **Radiation Types** | Proton (200 MeV), Electron (10 MeV), Heavy Ion (Fe-56, 1 GeV/n) |
| **Total Dose** | 50 krad(Si) equivalent |
| **Dose Rate** | 10-50 rad(Si)/s |
| **Test Articles** | PV-001 (pressure vessel wall section), PA-001 (adapter section) |
| **Geometry** | Flat coupons (50×50mm) extracted from articles + intact sections |
| **Instrumentation** | In-situ conductivity, post-test mechanical properties, TML/CVCM |

### Test Matrix
| Radiation | Energy | Fluence | Dose | Coupons |
|-----------|--------|---------|------|---------|
| Proton | 200 MeV | 1×10¹¹ p/cm² | 20 krad | 6 |
| Electron | 10 MeV | 5×10¹³ e/cm² | 15 krad | 6 |
| Heavy Ion (Fe) | 1 GeV/n | 1×10⁶ ion/cm² | 10 krad | 4 |
| **Combined** | — | — | **50 krad** | **16** |

### Acceptance Criteria
- [ ] **Tensile strength retention >95%** (vs. pre-rad baseline)
- [ ] **Compressive strength retention >95%**
- [ ] **ILSS retention >90%**
- [ ] **TML <1.0%, CVCM <0.1%** (ASTM E595 post-rad)
- [ ] **No microcracking** (UT C-scan, microscopy)
- [ ] **Shielding effectiveness:** >2.5× polyethylene at 1/3 mass (validated by dosimetry behind coupon)

---

## CONTRACTOR INDEPENDENT TEST PROTOCOL

Each contractor receives:
1. **Demo article** (shipped Day 18)
2. **Digital twin package** (STEP, NASTRAN, tow logs, cure records)
3. **Test protocol template** (this document, customized for their lander)
4. **30-day test window** (contractor defines exact procedures)

### Contractor Deliverables (to CSM)
- Test report (PDF + raw data)
- Comparison to their baseline material
- Infusion recommendation (Go/No-Go/Modify)
- Digital twin correlation assessment

### CSM Support
- On-site engineer for first test (virtual or in-person)
- Digital twin import assistance
- Real-time consultation during test anomalies

---

## DATA MANAGEMENT

| Data Type | Format | Storage | Access |
|-----------|--------|---------|--------|
| Raw test data | HDF5 / CSV | CSM cloud (AWS GovCloud) | Contractor + CSM |
| Test reports | PDF | CSM cloud + contractor share | Contractor + CSM + NASA (on request) |
| Digital twin correlation | Jupyter notebooks | CSM GitHub (private) | CSM + Nematron |
| NDE images | DICOM / TIFF | CSM cloud | Contractor + CSM |
| Video documentation | MP4 | CSM cloud | Internal |

**Backup:** All raw data mirrored to partner AFP facility NAS

---

## SCHEDULE (Target: Aug 26 – Oct 31, 2026)

| Week | Activity |
|------|----------|
| 1-3 (Aug 26-Sep 15) | Demo article fabrication (FAB-001) |
| 3-4 (Sep 15-Sep 30) | Shipping, contractor receipt, test setup |
| 4-8 (Sep 30-Oct 31) | **Test Campaign #1 execution** |
| | • Week 4-5: Static load (all contractors parallel) |
| | • Week 5-7: Thermal vacuum (batched at test lab) |
| | • Week 6-7: Vibration (batched at test lab) |
| | • Week 7-8: Radiation (beam time scheduled) |
| 8 (Oct 26-31) | Data compilation, correlation, report generation |

---

## RESOURCE REQUIREMENTS

| Resource | Quantity | Source |
|----------|----------|--------|
| Thermal vacuum chamber (100 cycles) | 1 | Partner test lab / NASA |
| Vibration shaker (500kN, 3-axis) | 1 | Partner test lab |
| Load frame (500kN) | 3 | Contractor facilities |
| Radiation beam time | ~20 hrs | University / National lab |
| Instrumentation (strain, temp, accel) | 100+ channels | CSM + Partner |
| Data acquisition systems | 4 | CSM / Partner |

---

## SUCCESS CRITERIA (Phase 1 Exit)

- [ ] All 4 test environments completed on all 3 articles
- [ ] Contractor test reports received (3+ contractors)
- [ ] Digital twin correlation <5% across all tests
- [ ] Zero mechanical failures across all environments
- [ ] Baseline comparison data: LBFRP-001 meets/exceeds targets
- [ ] SBIR Phase I decision received
- [ ] FAA AST pre-application consultation completed

---

## GO/NO-GO GATES

| Gate | Criteria | Decision |
|------|----------|----------|
| **Post-Fabrication** | All 3 articles pass acceptance | GO → Ship |
| **Post-Static** | 200% DLL passed, no damage | GO → Thermal |
| **Post-Thermal** | Zero delamination, 100 cycles | GO → Vibration |
| **Post-Vibration** | Modal shift <2%, no damage | GO → Radiation |
| **Post-Radiation** | >95% property retention | GO → Phase 2 |

---

*Document Control: CSM-CLPS-TEST-001 Rev A | Next Review: Sep 15, 2026*
*Committed to Git, pushed to main*