# CLPS_PREPARE_PACKAGE — FABRICATION
## Automated Fiber Placement (AFP) Process & Demo Article Campaign
**Document:** CSM-CLPS-FAB-002 | **Date:** August 2026  
**Cross-references:** [03_MATERIAL_SCIENCE.md](./03_MATERIAL_SCIENCE.md) | [05_TESTING.md](./05_TESTING.md) | [09_PRODUCTION.md](./09_PRODUCTION.md)

---

## 1. AFP PROCESS OVERVIEW

**Automated Fiber Placement (AFP)** is the robotic fabrication process that turns LBFRP-001 raw materials into CLPS flight hardware.

### Process Description

A **six-axis robotic arm** dispenses continuous basalt fiber tows (12,000 filaments per tow) pre-impregnated with Elium 188 O resin containing a dispersion of lonsdaleite nanodiamonds at 3% by weight. The tows are laid down in layers on a rotating mandrel, each layer oriented at a specific angle relative to the previous layer:

| Orientation | Purpose |
|-------------|---------|
| **0°** | Axial strength |
| **±45°** | Torsional stiffness |
| **90°** | Hoop strength (pressure vessels, tanks) |

The thermoplastic resin enables **in-situ consolidation** — each layer bonds to the previous layer as it's laid down, building up a laminate that is simultaneously lightweight, strong, self-healing, and radiation-resistant.

### AFP Process Parameters

| Parameter | Value |
|-----------|-------|
| **Layup Rate** | 50 kg/hr (typical) |
| **Tow Tension** | 5-15 N (adaptive) |
| **Compaction Force** | 200-500 N (adaptive) |
| **Layup Temperature** | 20-40°C |
| **In-Situ Cure** | Optional (laser/IR) or post-cure |
| **Post-Cure Cycle** | 180°C × 2 hrs (ramp 2°C/min) |
| **Minimum Steering Radius** | 25 mm |
| **Maximum Curvature** | 1/50 mm⁻¹ |
| **Gap Tolerance** | ±0.2 mm |
| **Overlap Tolerance** | ≤10% tow width |
| **Digital Twin Capture Rate** | 1 kHz per tow (position, tension, temp, force) |

---

## 2. DEMO ARTICLE FABRICATION CAMPAIGN

**Campaign Designation:** CSM-CLPS-FAB-001  
**Facility:** Partner AFP Facility #1 (Pacific Northwest)  
**Target Ship Date:** September 15, 2026 (21 days from kickoff)  
**Status:** ACTIVE

### Article 1: Lander Leg Segment

| Parameter | Value |
|-----------|-------|
| **Designation** | LBFRP-001-DEMO-LEG-001 |
| **Length** | 1.0 meter (representative segment) |
| **Cross-Section** | Tapered hexagonal, 300mm base → 150mm tip |
| **Wall Thickness** | 6mm (baseline) / 4mm (optimized) |
| **Layup Schedule** | [0/±45/90]₂s symmetric |
| **Instrumentation** | 8x foil strain gauges, 6x Type-K thermocouples, 2x FBG optical fibers |
| **Mass Target** | <8 kg (vs. Al honeycomb equivalent: 18 kg) |
| **Digital Twin ID** | DT-LEG-001-20260826 |

**AFP Process Parameters:**
- Tow: 12K basalt, Elium 188 O + 3% lonsdaleite
- Layup Rate: 30 kg/hr (conservative for demo)
- Tension: 8 N (adaptive)
- Compaction: 300 N (adaptive)
- Temperature: 25°C ambient / 40°C tow
- Cure: Post-cure 180°C × 2 hrs

**Acceptance Criteria:**
- Zero delamination (UT C-scan)
- Fiber volume fraction: 55% ± 3%
- Void content: <0.5%
- Dimensional tolerance: ±0.5 mm
- Digital twin correlation: <3% variance

### Article 2: Pressure Vessel Quarter-Section

| Parameter | Value |
|-----------|-------|
| **Designation** | LBFRP-001-DEMO-PV-001 |
| **Representative Diameter** | 1.2 m (quarter section = 90° arc) |
| **Wall Thickness** | 4.5 mm (baseline) |
| **Layup Schedule** | [±45/0/90]₃s (hoop-dominant) |
| **Integrated Features** | Pyrolytic graphite thermal substrates (2 strips, 1500 W/m·K), boss reinforcement, burst test port |
| **Instrumentation** | 12x strain gauges (hoop/axial), 4x thermocouples, 1x pressure transducer port |
| **Design Pressure** | 2.5 MPa (proof) / 3.75 MPa (burst) |
| **Mass Target** | <12 kg (vs. Ti 6-4 equivalent: 35 kg) |
| **Digital Twin ID** | DT-PV-001-20260826 |

**AFP Process Parameters:**
- Mandrel: 3D printed dissolvable (PVA), segmented for removal
- Tow: 12K basalt, Elium 188 O + 3% lonsdaleite
- Layup Rate: 25 kg/hr (curved geometry)
- Steering Radius: 25 mm minimum
- Cure: In-situ IR + post-cure 180°C × 2 hrs

**Acceptance Criteria:**
- Proof test: 2.5 MPa hold 30 min, zero leakage
- Burst test: >3.75 MPa (target 4.5 MPa)
- Zero delamination (UT + visual)
- PGS thermal conductivity verified: >1200 W/m·K in-plane
- Digital twin correlation: <3% variance

### Article 3: Payload Adapter Ring

| Parameter | Value |
|-----------|-------|
| **Designation** | LBFRP-001-DEMO-PA-001 |
| **Diameter** | 1.0 m (standard CLPS payload interface) |
| **Height** | 150 mm |
| **Wall Thickness** | 8 mm (load-bearing) / 4 mm (web) |
| **Layup Schedule** | [0/±45/90]₂s with integrated webs |
| **Integrated Features** | 24x bolt pattern (M12), harness routing channels (6), thermal paths (4), separation system interfaces |
| **Instrumentation** | 16x strain gauges (bolt loads, bending), 4x thermocouples |
| **Mass Target** | <15 kg (vs. machined Al 2219: 42 kg) |
| **Digital Twin ID** | DT-PA-001-20260826 |

**AFP Process Parameters:**
- Mandrel: Aluminum, reusable, CNC machined
- Tow: 12K basalt, Elium 188 O + 3% lonsdaleite
- Layup Rate: 40 kg/hr (prismatic geometry)
- Complex Features: Bolt bosses co-molded, channels laid up with sacrificial inserts
- Cure: Post-cure 180°C × 2 hrs

**Acceptance Criteria:**
- Bolt pattern positional tolerance: ±0.1 mm
- Channel dimensional tolerance: ±0.3 mm
- Static load: 200% DLL — no failure
- Flatness: <0.2 mm/m
- Digital twin correlation: <3% variance

---

## 3. FABRICATION SCHEDULE (21 Days)

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

## 4. FACILITY DETAILS: PARTNER AFP FACILITY #1

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

**Location:** Pacific Northwest (redacted until NDA executed)  
**Robot:** Kuka KR500 (6-axis, ≥2.5m reach, ±0.05mm repeatability)

---

## 5. MATERIAL KIT (Shipped to Partner AFP #1)

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

## 6. QUALITY ASSURANCE & INLINE INSPECTION

### In-Process Inspection
- **Tow placement verification:** Real-time sensor comparison (position, tension, temperature, force)
- **Statistical Process Control (SPC):** Cp/Cpk >1.33 for all critical parameters
- **Gap/overlap monitoring:** ±0.2mm gap tolerance, ≤10% overlap
- **Void detection:** In-process thermography (optional)

### Post-Fabrication NDE
- **Ultrasonic C-scan:** Immersion or phased array — detects delaminations, voids, porosity
- **Thermography:** Flash thermography — detects subsurface defects
- **Dimensional inspection:** CMM or laser tracking — verifies geometry against digital twin
- **Fiber volume fraction:** Acid digestion or burn-off (ASTM D2584)
- **Void content:** Microscopy or UT attenuation

### Acceptance Data Package
Every article ships with:
1. Tow placement log (CSV / HDF5)
2. 3D as-built model (STEP AP242)
3. FEA model (NASTRAN)
4. Cure record (PDF + CSV)
5. NDE report (PDF + UT/TT data)
6. Acceptance data package (PDF) — full traceability to raw material lots

---

## 7. DIGITAL TWIN DELIVERABLES

| Deliverable | Format | Description |
|-------------|--------|-------------|
| **Tow Placement Log** | CSV / HDF5 | Every tow: x,y,z, θ, tension, temp, force, timestamp (1 kHz) |
| **3D Model (As-Built)** | STEP AP242 | Geometry + ply boundaries + fiber orientation |
| **FEA Model** | NASTRAN (.dat/.op2) | Meshed, material cards, boundary conditions |
| **Cure Record** | PDF + CSV | Temperature, pressure, time per zone |
| **NDE Report** | PDF + UT/TT data | Ultrasonic C-scan, thermography |
| **Acceptance Data Package** | PDF | Complete traceability to raw material lots |

---

## 8. SHIPPING LOGISTICS

| Article | Destination | Method | Timeline |
|---------|-------------|--------|----------|
| LEG-001 | Intuitive Machines (Houston) | FedEx Custom Critical | Day 18 |
| PV-001 | Firefly Aerospace (Cedar Park) | FedEx Custom Critical | Day 18 |
| PA-001 | Astrobotic (Pittsburgh) | FedEx Custom Critical | Day 18 |

**Packaging:** Custom foam crates, nitrogen purge, shock/tilt indicators, temp loggers  
**Insurance:** $500K per article (covers replacement fabrication)  
**Chain of Custody:** Digital twin hash on blockchain (immutable)

---

## 9. RISK MITIGATION

| Risk | Likelihood | Impact | Mitigation |
|------|------------|--------|------------|
| AFP cell downtime | Low | High | Backup: Partner AFP #2 on standby |
| Material defect | Low | High | 150 kg kit = 2× margin; lot traceability |
| Instrumentation failure | Medium | Medium | Redundant sensors (FBG + foil + TC) |
| Cure distortion | Low | Medium | Mandrel design FEA-validated; symmetric layup |
| Shipping damage | Very Low | High | Custom crates, N2 purge, shock monitoring |

---

## 10. AFP NETWORK EXPANSION (Phase 4)

For production scaling, 5 partner AFP facilities will be qualified:

| # | Facility | Location | Robot | Status | Notes |
|---|----------|----------|-------|--------|-------|
| **1** | Partner AFP #1 | Pacific Northwest | Kuka KR500 | ✅ Contracted | Demo article fabrication |
| **2** | Partner AFP #2 | Near Houston | ABB IRB 6700 | 🔄 Negotiating | Near IM |
| **3** | Partner AFP #3 | Near Austin | Fanuc M-900iB | 🔄 Negotiating | Near Firefly |
| **4** | Partner AFP #4 | Near Pittsburgh | Kuka KR1000 | 🔄 Identifying | Near Astrobotic |
| **5** | Partner AFP #5 | Near Boca Chica | ABB IRB 8700 | 🔄 Identifying | Near SpaceX |

**Target:** 3 facilities qualified by Month 12, 5 by Month 18  
**Capacity per Facility:** ~50 leg sets/year (single shift) → 150 (3 shifts)  
**Total Network Capacity:** 750 sets/year

---

*Document Control: CSM-CLPS-FAB-002 Rev A | Source: Demo_Article_Fabrication_Plan.md, AFP_Network_Qualification_Plan.md*  
*Cross-references: [03_MATERIAL_SCIENCE.md](./03_MATERIAL_SCIENCE.md) | [05_TESTING.md](./05_TESTING.md) | [09_PRODUCTION.md](./09_PRODUCTION.md)*
