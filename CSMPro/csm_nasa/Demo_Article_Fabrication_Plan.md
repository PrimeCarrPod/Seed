# DEMO ARTICLE FABRICATION PLAN
## CLPS Campaign — Phase 1: Foundation (Months 1-3)
**Document:** CSM-CLPS-FAB-001  
**Date:** August 26, 2026  
**Author:** Jason Isaac Brodsky (California 1976) — Author, Conducier  
**Technical Lead:** Nematron AI  
**Status:** ACTIVE — Partner AFP Facility #1 Coordination  

---

## OVERVIEW

Fabricate **3 demonstration articles** at Partner AFP Facility #1 for independent contractor testing. Articles represent critical CLPS lander structural elements where LBFRP-001 provides maximum risk reduction.

### TARGET SHIP DATE: September 15, 2026 (21 days)

---

## ARTICLE 1: LANDER LEG SEGMENT
**Designation:** LBFRP-001-DEMO-LEG-001  
**Relevance:** Direct replacement for aluminum honeycomb crush core landing legs (Griffin, Nova-C, Blue Ghost, SERIES-2)

### Specifications
| Parameter | Value |
|-----------|-------|
| **Length** | 1.0 meter (representative segment) |
| **Cross-Section** | Tapered hexagonal, 300mm base → 150mm tip |
| **Wall Thickness** | 6mm (baseline) / 4mm (optimized) |
| **Layup Schedule** | [0/±45/90]₂s symmetric |
| **Integrated Features** | Strain gauge mounts (8), thermocouple ports (6), bolt pattern for lander interface |
| **Instrumentation** | 8x foil strain gauges (0°, ±45°, 90°), 6x Type-K thermocouples, 2x FBG optical fibers |
| **Mass Target** | <8 kg (vs. Al honeycomb equivalent: 18 kg) |
| **Digital Twin ID** | DT-LEG-001-20260826 |

### AFP Process Parameters
- **Tow:** 12K basalt, Elium 188 O + 3% lonsdaleite
- **Layup Rate:** 30 kg/hr (conservative for demo)
- **Tension:** 8 N (adaptive)
- **Compaction:** 300 N (adaptive)
- **Temperature:** 25°C ambient / 40°C tow
- **Cure:** Post-cure 180°C × 2 hrs (ramp 2°C/min)

### Acceptance Criteria
- [ ] Zero delamination (UT C-scan)
- [ ] Fiber volume fraction: 55% ± 3%
- [ ] Void content: <0.5%
- [ ] Dimensional tolerance: ±0.5 mm
- [ ] Digital twin correlation: <3% variance

---

## ARTICLE 2: PRESSURE VESSEL QUARTER-SECTION
**Designation:** LBFRP-001-DEMO-PV-001  
**Relevance:** Oxidizer/fuel tanks, crew module pressure vessels

### Specifications
| Parameter | Value |
|-----------|-------|
| **Representative Diameter** | 1.2 m (quarter section = 90° arc) |
| **Wall Thickness** | 4.5 mm (baseline) |
| **Layup Schedule** | [±45/0/90]₃s (hoop-dominant) |
| **Integrated Features** | Pyrolytic graphite thermal substrates (2 strips, 1500 W/m·K), boss reinforcement, burst test port |
| **Instrumentation** | 12x strain gauges (hoop/axial), 4x thermocouples, 1x pressure transducer port |
| **Design Pressure** | 2.5 MPa (proof) / 3.75 MPa (burst) |
| **Mass Target** | <12 kg (vs. Ti 6-4 equivalent: 35 kg) |
| **Digital Twin ID** | DT-PV-001-20260826 |

### AFP Process Parameters
- **Mandrel:** 3D printed dissolvable (PVA), segmented for removal
- **Tow:** 12K basalt, Elium 188 O + 3% lonsdaleite
- **Layup Rate:** 25 kg/hr (curved geometry)
- **Steering Radius:** 25 mm minimum
- **Cure:** In-situ IR + post-cure 180°C × 2 hrs

### Acceptance Criteria
- [ ] Proof test: 2.5 MPa hold 30 min, zero leakage
- [ ] Burst test: >3.75 MPa (target 4.5 MPa)
- [ ] Zero delamination (UT + visual)
- [ ] PGS thermal conductivity verified: >1200 W/m·K in-plane
- [ ] Digital twin correlation: <3% variance

---

## ARTICLE 3: PAYLOAD ADAPTER RING
**Designation:** LBFRP-001-DEMO-PA-001  
**Relevance:** Lander-to-payload interface (all CLPS landers)

### Specifications
| Parameter | Value |
|-----------|-------|
| **Diameter** | 1.0 m (standard CLPS payload interface) |
| **Height** | 150 mm |
| **Wall Thickness** | 8 mm (load-bearing) / 4 mm (web) |
| **Layup Schedule** | [0/±45/90]₂s with integrated webs |
| **Integrated Features** | 24x bolt pattern (M12), harness routing channels (6), thermal paths (4), separation system interfaces |
| **Instrumentation** | 16x strain gauges (bolt loads, bending), 4x thermocouples |
| **Mass Target** | <15 kg (vs. machined Al 2219: 42 kg) |
| **Digital Twin ID** | DT-PA-001-20260826 |

### AFP Process Parameters
- **Mandrel:** Aluminum, reusable, CNC machined
- **Tow:** 12K basalt, Elium 188 O + 3% lonsdaleite
- **Layup Rate:** 40 kg/hr (prismatic geometry)
- **Complex Features:** Bolt bosses co-molded, channels laid up with sacrificial inserts
- **Cure:** Post-cure 180°C × 2 hrs

### Acceptance Criteria
- [ ] Bolt pattern positional tolerance: ±0.1 mm
- [ ] Channel dimensional tolerance: ±0.3 mm
- [ ] Static load: 200% DLL (design limit load) — no failure
- [ ] Flatness: <0.2 mm/m
- [ ] Digital twin correlation: <3% variance

---

## FABRICATION SCHEDULE (21 Days)

| Day | Activity | Article | Owner |
|-----|----------|---------|-------|
| 1-2 | Mandrel prep, material staging, AFP cell setup | All | Partner AFP #1 |
| 3-5 | Layup: Lander leg segment | LEG-001 | Partner AFP #1 |
| 6-7 | Layup: Pressure vessel quarter (2 halves) | PV-001 | Partner AFP #1 |
| 8-9 | Layup: Payload adapter ring | PA-001 | Partner AFP #1 |
| 10 | Cure cycle (all articles, batched) | All | Partner AFP #1 |
| 11 | Mandrel removal, initial inspection | All | Partner AFP #1 |
| 12-13 | Instrumentation installation | All | CSM / Partner |
| 14 | NDE: UT C-scan, thermography, dimensional | All | Partner AFP #1 |
| 15 | Digital twin generation (STEP, NASTRAN, tow logs) | All | Nematron AI |
| 16 | Acceptance review, documentation package | All | CSM / Partner |
| 17 | Packaging, shipping prep | All | CSM Logistics |
| 18-19 | Ship to contractor facilities | All | CSM Logistics |
| 20-21 | Buffer / contingency | — | — |

---

## PARTNER AFP FACILITY #1 REQUIREMENTS

| Capability | Required | Status |
|------------|----------|--------|
| 6-axis AFP robot (Kuka/ABB/Fanuc) | ✅ | Confirmed |
| 12K tow capacity | ✅ | Confirmed |
| Elium 188 O processing experience | ✅ | Confirmed |
| In-situ IR/laser cure | ⭕ | Optional |
| Dissolvable mandrel 3D printing | ✅ | Confirmed |
| UT C-scan NDE | ✅ | Confirmed |
| Digital twin export (STEP, NASTRAN, CSV) | ✅ | In progress |
| Clean room (ISO 8) | ✅ | Confirmed |
| ITAR/EAR compliant | ✅ | Confirmed |

---

## MATERIAL KIT (Shipped to Partner AFP #1)

| Item | Quantity | Lot # |
|------|----------|-------|
| Basalt fiber 12K tow (Elium 188 O + 3% lonsdaleite) | 150 kg | BAS-LON-2026-001 |
| Pyrolytic graphite substrates (50×500×3mm) | 10 | PGS-2026-001 |
| Dissolvable mandrel filament (PVA) | 5 kg | PVA-2026-001 |
| Sacrificial inserts (PTFE) | 50 pcs | PTFE-2026-001 |
| Strain gauges (foil, high-temp) | 50 | SG-2026-001 |
| Thermocouples (Type-K, miniature) | 20 | TC-2026-001 |
| FBG optical fiber | 10 m | FBG-2026-001 |

---

## DIGITAL TWIN DELIVERABLES (Per Article)

| Deliverable | Format | Description |
|-------------|--------|-------------|
| **Tow Placement Log** | CSV / HDF5 | Every tow: x,y,z, θ, tension, temp, force, timestamp (1 kHz) |
| **3D Model (As-Built)** | STEP AP242 | Geometry + ply boundaries + fiber orientation |
| **FEA Model** | NASTRAN (.dat/.op2) | Meshed, material cards, boundary conditions |
| **Cure Record** | PDF + CSV | Temperature, pressure, time per zone |
| **NDE Report** | PDF + UT/TT data | Ultrasonic C-scan, thermography |
| **Acceptance Data Package** | PDF | Complete traceability to raw material lots |

---

## SHIPPING LOGISTICS

| Article | Destination | Method | Timeline |
|---------|-------------|--------|----------|
| LEG-001 | Intuitive Machines (Houston) | FedEx Custom Critical | Day 18 |
| PV-001 | Firefly Aerospace (Cedar Park) | FedEx Custom Critical | Day 18 |
| PA-001 | Astrobotic (Pittsburgh) | FedEx Custom Critical | Day 18 |

**Packaging:** Custom foam crates, nitrogen purge, shock/tilt indicators, temp loggers
**Insurance:** $500K per article (covers replacement fabrication)
**Chain of Custody:** Digital twin hash on blockchain (immutable)

---

## RISK MITIGATION

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| AFP cell downtime | Low | High | Backup: Partner AFP #2 on standby |
| Material defect | Low | High | 150 kg kit = 2× margin; lot traceability |
| Instrumentation failure | Medium | Medium | Redundant sensors (FBG + foil + TC) |
| Cure distortion | Low | Medium | Mandrel design FEA-validated; symmetric layup |
| Shipping damage | Very Low | High | Custom crates, N2 purge, shock monitoring |

---

## SUCCESS CRITERIA (Phase 1 Exit)

- [ ] All 3 articles fabricated, cured, inspected
- [ ] Digital twin packages delivered (<3% variance)
- [ ] Articles shipped to 3 contractor facilities
- [ ] SBIR Phase I submitted (DONE)
- [ ] All 3 email templates sent (DONE)
- [ ] Student competition live (DONE)
- [ ] Conference slots confirmed (DONE)

---

*Document Control: CSM-CLPS-FAB-001 Rev A | Next Review: Sep 5, 2026*
*Committed to Git, pushed to main*