# CSMFAB078-D — Aegis Iron Man: Fabrication Process Flow & Manufacturing Plan
## End-to-End Production, In-House Synthesis, Quality Assurance, Circular Economy
## Version 1.0 | August 2026

---

## 1. Manufacturing Facility Layout — CSMFAB Aegis Iron Man Production Cell

### 1.1 Facility Zones (Total: 2,400 m²)

| Zone | Area | Function | Key Equipment | Class |
|------|------|----------|---------------|-------|
| Z1: Raw Material Prep | 300 m² | Basalt crushing, powder mixing, slurry prep | Jaw crusher, ball mills (2×50L), planetary mixer, doctor blade coater | ISO 8 |
| Z2: Basalt Fiber Draw | 400 m² | Basalt melting, fiber drawing, sizing | 2-ton Pt-Rh bushing furnace (1450°C), winder, sizing bath, QC tensile tester | ISO 7 |
| Z3: Elium® Formulation | 150 m² | MMA polymerization, resin QC | Jacketed reactor (500L), peroxide dosing, viscometer, GPC | ISO 7 |
| Z4: BFRP VARTM | 500 m² | Preform layup, infusion, cure | 12 VARTM stations (2×3m molds), vacuum pumps, RT cure ovens | ISO 7 |
| Z5: Ceramic Lamination | 350 m² | ZrB₂-SiC tape casting, lamination | Continuous tape caster (300mm), isostatic press (200MPa), CNC grinder | ISO 7 |
| Z6: Flash Sintering | 250 m² | Flash sintering furnaces | 4× Flash Sintering furnaces (300 V/cm, 1600°C), DC power supplies | ISO 6 |
| Z7: MAX Phase/MXene | 200 m² | MAX phase synthesis, MXene etching | Hot press (50MPa, 1400°C), etching reactors (LiF/HCl), sonicators, spray coater | ISO 6 |
| Z8: Aerogel Casting | 150 m² | Hybrid aerogel gelation, drying | Gel casting tables, ambient-pressure dryer (TMCS), supercritical CO₂ dryer (30L) | ISO 5 |
| Z9: Panel Assembly | 300 m² | Layer stacking, joint sealing, coating | Cleanroom assembly jigs, MXene tape applicator, gasket dispenser, HVLP spray booth | ISO 5 |
| Z10: Integration & Test | 200 m² | Lacing, MR fill, sensor integration, QA | Torque wrenches, MR fluid fill station, PVDF mesh laminator, test chambers | ISO 6 |

**Support:** Powder characterization lab (XRD, PSD, BET, SEM), Rheology lab, EMI test chamber (3m), Ballistic range (15m), Thermal test cell, Vibration shaker table.

---

## 2. Process Flow — Critical Path

```
CRITICAL PATH (Lead time: 14 days per suit):

DAY 1-2: BASALT FIBER PRODUCTION (Z1→Z2)
  Basalt rock (Columbia River) → crush/grind → 1450°C melt → Pt-Rh bushing draw
  → silane sizing → roving wind → QC (tensile 4000+ MPa, OD ±0.02mm)
  Output: 50 kg roving (sufficient for 1 TG suit chassis)

DAY 2-3: ELIUM® RESIN FORMULATION (Z3)
  MMA (bulk, $2.20/kg) + peroxide (1.5%) + CTA (0.3%) → 80°C/2h polymerization
  → vacuum degas → QC (viscosity 150 mPa·s, Tg 95°C)
  Output: 35 kg Elium 150 equivalent

DAY 3-5: BFRP CHASSIS VARTM (Z4)
  Basalt UD preform (60% FVF) → mold → vacuum infusion (Elium) → RT cure 90min
  → post-cure 80°C/4h → demold → CNC trim (hardpoint drilling)
  → QC (tensile 1000 MPa, dielectric >10¹² Ω·m)
  Output: 1 chassis (edition-specific strut configuration)

DAY 1-4: ZrB₂-SiC POWDER SYNTHESIS (Z1, parallel)
  SHS route: Zr + 2B → ignite (argon) → mill → sieve (-325 mesh)
  → QC (XRD phase purity >99%, PSD d₅₀=1.2μm)
  Output: 120 kg ZrB₂ powder (TG suit)

DAY 2-4: SiC POWDER (Z1, parallel)
  Modified Acheson: SiO₂ + 3C → 2200°C → crush/mill → sinterable grade
  Output: 48 kg SiC powder

DAY 3-5: ZrB₂-SiC SLURRY & TAPE CASTING (Z5)
  Slurry: ZrB₂ (70%) + SiC (30%) + PVB (6%) + DBP (3%) + ethanol/MEK (400mL/kg)
  → ball mill 24h → doctor blade 250μm → green tape (150μm sintered)
  → QC (green density 3.1 g/cm³, tensile 8 MPa)
  Output: 500 m² green tape (outer + inner)

DAY 5-6: LAMINATION (Z5)
  12-ply (outer) / 8-ply (inner) → 0°/90° alternating → isostatic press 200MPa/70°C
  → binder burnout 500°C/2h/N₂ → green laminate
  Output: 84 outer laminates (TG), 56 inner laminates (TG)

DAY 6-8: FLASH SINTERING (Z6) — PARALLEL BATCHES
  300 V/cm DC → 1580°C flash onset → 8-15s densification → 96.9% density
  → diamond grind (Ra ≤0.8μm) → dimension check (±0.15mm)
  → QC (flexural 590 MPa, density 97%+, SE spot check)
  Output: 84 outer tiles, 56 inner tiles (TG)

DAY 4-7: MAX PHASE SYNTHESIS (Z7, parallel)
  3TiC + Ti + 2Al → hot press 50MPa/1400°C/2h/Ar → Ti₃AlC₂
  → machine cleats (CNC, Ti₃AlC₂) → QC (flexural 400 MPa, machinability)
  Output: 54 cleats + auxetic unit cells

DAY 6-8: MXene SYNTHESIS (Z7, parallel)
  Ti₃AlC₂ + LiF/HCl (35°C/24h) → multilayer clay → sonicate (water) → delaminate
  → spray coat tiles (45μm) → vacuum filter films (45μm)
  → QC (conductivity 4600 S/cm, SE 92 dB @ 1GHz)
  Output: Coated tiles + 10 m² MXene film

DAY 7-9: AEROGEL CORE CASTING (Z8, parallel)
  TEOS + PMDA-ODA polyimide → gel cast (25mm) → TMCS solvent exchange
  → ambient-pressure dry → λ=0.010 W/m·K, 650°C service
  → QC (density 0.12 g/cm³, λ verification)
  Output: 10.2 m² aerogel blanket (TG)

DAY 8-10: PANEL ASSEMBLY (Z9)
  Stack: YInMn/QD → ZrB₂-SiC outer → MXene → FSS → Aerogel → MXene → ZrB₂-SiC inner
  → ePTFE gasket + ZrO₂-silicone gasket + MXene tape bridge
  → compress to 1.8 MPa → cure gaskets
  → HVLP spray: ZrO₂ primer (20μm) → YInMn Blue (150μm) → CsPbBr₃ QD (80μm UV-cure)
  → QC (SE ≥120dB, surface resistivity ≥10¹² Ω/sq, flatness ≤0.5mm/m)
  Output: 140 finished panels (TG)

DAY 10-12: INTEGRATION (Z10)
  Panel mounting on BFRP chassis → magnetic alignment → Dyneema lacing (54 cleats)
  → MR bladder installation (12 zones, 3.2L total) → PVDF-TrFE mesh lamination
  → Protonic HFET electronics install → firmware flash → wire harness
  → QC: lacing tension, MR pressure, sensor continuity, SE spot check
  Output: 1 integrated suit (TG)

DAY 12-14: SYSTEM VALIDATION (Z10)
  Full EMI test (reverberation chamber) → Thermal manikin test (1100°C/300s)
  → Ballistic witness (witness panel) → Blast sim (shock tube)
  → Bio-acoustic calibration (shaker table) → Schumann isolation test
  → Health index baseline → Haptic vocabulary verification
  → Documentation package → Shipping crate (custom BFRP, desiccant)
  Output: 1 validated AIMES suit + certification packet
```

---

## 3. In-House Synthesis Programs — Cost Analysis

### 3.1 Basalt Fiber (HIGHEST IMPACT)

| Metric | Commercial | In-House | Savings |
|--------|------------|----------|---------|
| Capital equipment | N/A | $350,000 | — |
| Raw material (basalt rock) | N/A | $2-5/ton | ~100% |
| Energy (4 kWh/kg @ $0.08) | Included | $0.32/kg | — |
| Labor | Included | $0.80/kg | — |
| Amortization (10yr, 500t/yr) | N/A | $0.50/kg | — |
| **Total cost/kg** | **$4.50-14.00** | **$1.80-2.50** | **60-85%** |
| Annual production (500t) | $2.25-7.0M | $0.9-1.25M | $1.35-5.75M/yr |
| **ROI** | — | **<6 months** | — |

**Supply Security:** Domestic Columbia River basalt — zero geopolitical risk

### 3.2 ZrB₂ via SHS (SECOND HIGHEST IMPACT)

| Metric | Commercial | In-House SHS | Savings |
|--------|------------|--------------|---------|
| Capital equipment | N/A | $31,000 | — |
| Zr powder (99%, -100 mesh) | N/A | $45/kg | — |
| B powder (95%, -325 mesh) | N/A | $30/kg | — |
| Reagent cost/kg ZrB₂ | N/A | $58-72 | — |
| Labor + energy | N/A | $35/kg | — |
| **Total cost/kg** | **$120-420** | **$95-110** | **50-75%** |
| Annual (5,000 kg) | $0.6-2.1M | $0.48-0.55M | $0.12-1.55M/yr |
| **ROI** | — | **<3 months** | — |

### 3.3 MXene from In-House MAX Phase (TRANSFORMATIVE)

| Metric | Commercial MXene | In-House (MAX→MXene) | Savings |
|--------|------------------|----------------------|---------|
| MAX Phase source | N/A | In-house ($35-55/kg) | — |
| Etching chemicals (LiF/HCl) | N/A | $12/kg MXene | — |
| Delamination (sonication) | N/A | $8/kg MXene | — |
| **Total cost/kg** | **$1,500-2,500** | **$55-75** | **96-97%** |
| Annual (500 kg) | $0.75-1.25M | $0.028-0.038M | $0.72-1.21M/yr |
| **ROI** | — | **<1 month** (after MAX phase online) | — |

**Synergy:** MAX Phase equipment shared with ZrB₂ program → no additional capital

### 3.4 Aerogel Hybrid (HIGH VOLUME)

| Metric | Commercial | In-House | Savings |
|--------|------------|----------|---------|
| Capital (ambient dryer) | N/A | $80,000 | — |
| TEOS + polyimide precursors | N/A | $35/m² | — |
| Energy + labor | N/A | $20/m² | — |
| Amortization | N/A | $10/m² | — |
| **Total cost/m²** | **$200-280** | **$55-85** | **65-75%** |
| Annual (5,000 m²) | $1.0-1.4M | $0.28-0.43M | $0.72-1.12M/yr |

---

## 4. Quality Assurance — In-Process & Final

### 4.1 In-Process Control Points (IPC)

| Step | Parameter | Method | Frequency | Action Limit |
|------|-----------|--------|-----------|--------------|
| Basalt melt | Viscosity (1450°C) | Rotational viscometer | Hourly | 15-25 Pa·s |
| Fiber draw | Diameter | Laser micrometer | Continuous | 13±0.5 μm |
| Fiber tensile | Strength | Inline tensile tester | Every bobbin | >4000 MPa |
| Elium resin | Viscosity (25°C) | Rotational viscometer | Batch | 100-300 mPa·s |
| Elium resin | Tg (DSC) | DSC | Batch | 90-110°C |
| ZrB₂-SiC slurry | PSD (d₅₀) | Laser diffraction | Batch | 1.2±0.2 μm |
| Green tape | Thickness | Micrometer | Every 10m | 250±10 μm |
| Green tape | Density | Archimedes | Every 50m | 3.1±0.1 g/cm³ |
| Lamination | Ply alignment | Optical inspection | Every panel | 0°/90° ±1° |
| Flash sinter | Density | Archimedes | Every batch | ≥96.5% |
| Flash sinter | Grain size (ZrB₂) | SEM/Image analysis | Daily | 2.1±0.4 μm |
| MXene film | Conductivity | 4-point probe | Every m² | ≥4000 S/cm |
| MXene film | SE @ 1GHz | Coaxial fixture | Every m² | ≥90 dB |
| Aerogel | Thermal conductivity | Hot disk | Every batch | ≤0.012 W/m·K |
| Panel SE | Joint SE penalty | MIL-STD-285 | Every joint | ≤12 dB |

### 4.2 Final Acceptance Test (FAT) — Per Suit

```
MECHANICAL:
  [ ] Dimensional scan (CMM) vs. CAD: ≤0.5mm all features
  [ ] Mass: within ±3% of edition spec (TG: 26±0.8 kg)
  [ ] Lacing tension: all 12 zones ±5% target
  [ ] Cleat function: 500N hold, tool-less release
  [ ] Panel alignment: magnetic gap ≤0.1mm
  [ ] Strut fasteners: 4.5Nm torque, ceramic inserts intact

ELECTROMAGNETIC:
  [ ] System SE (reverb chamber): 148-165 dB (1MHz-10GHz)
  [ ] Joint SE penalty: ≤12 dB (3 random joints)
  [ ] GIC injection: <1mV interior (10A DC wrist→ankle)
  [ ] Schumann attenuation: ≥65 dB @ 7.83, 14.3, 20.8 Hz
  [ ] Citadel Ground stability: <10mV drift (24h)
  [ ] DIM isolation: >10kV withstand, <1pA leakage

THERMAL:
  [ ] Manikin test: 1100°C/300s → max skin ≤60°C
  [ ] TPP (radiant): ≥45 cal/cm²
  [ ] Post-thermal SE: ≥120 dB (no degradation)
  [ ] Coating adhesion: cross-hatch 5B (ASTM D3359)
  [ ] QD fluorescence: 520±5nm (diagnostic)

BALLISTIC (witness panel from same batch):
  [ ] NIJ IV: 0mm penetration .30-06 APM2 @ 878m/s
  [ ] BFS (with MR active): ≤24mm
  [ ] Auxetic densification: verified post-mortem µCT

FORCE TRAUMA:
  [ ] 50J impact: peak force ≤3.5kN, BFS ≤20mm
  [ ] 100J impact: peak force ≤5.5kN, BFS ≤30mm
  [ ] MR activation: <3ms (90% yield stress)
  [ ] STF layer: 65% force reduction @ 50J

BIO-ACOUSTIC:
  [ ] Sensor network: 240 channels, noise <0.01g
  [ ] Cancellation: ≥20dB @ 4-6Hz, 8-12Hz, 20-30Hz
  [ ] Loop latency: <3ms total
  [ ] Health index: baseline HI=0.85±0.05
  [ ] Haptic: all 16 patterns verified

LEAF EDITION TRANSITION:
  [ ] TS→TG→TS cycle: <90s each way
  [ ] Post-transition SE: ≤12dB joint penalty
  [ ] Sensor recalibration: <5s, <2% variance
  [ ] Tile inventory: all accounted, no damage
```

---

## 5. Circular Economy — Phoenix Protocol Implementation

### 5.1 End-of-Life Material Recovery

| Material | Recovery Process | Efficiency | Recovered Value | Cost/kg Process |
|----------|------------------|------------|-----------------|-----------------|
| ZrB₂-SiC panels | H₂SO₄ leach (2M, 80°C, 2h) → ZrO₂ precip → re-boronization | 85-92% Zr | $180/kg ZrO₂ | $20/kg |
| YInMn Blue coating | Ionic liquid [P8888][Cl] extraction → In 99.4%, Y 95% | 99.4% In | In: $200/kg saved | $18-28/kg |
| BFRP/Elium® chassis | Thermal depolymerization 350°C → MMA (100%) + basalt fiber (95%) | 100% MMA | MMA: $2.20/kg | $0.50/kg |
| MXene films | Re-etch from recovered MAX Phase | 90% | $55/kg (in-house) | $12/kg |
| MR fluid | CIP magnetic separation → oil distillation → reformulate | 95% CIP | CIP: $12/kg | $5/kg |
| PVDF-TrFE | Solvent dissolution (DMF) → re-cast | 85% | $80/m² | $15/m² |
| Dyneema SK99 | Mechanical separation → re-braid | 90% | $35/kg | $8/kg |
| Ti₃AlC₂ cleats | Remachine / re-sinter | 100% | $35/kg | $10/kg |

### 5.2 Closed-Loop Flow

```
RETIRED SUIT → DISASSEMBLY STATION (Z11, 200m²)
   │
   ├─→ ZrB₂-SiC tiles → ACID LEACH LINE → ZrO₂ recovery → RE-BORONIZATION → NEW TILES
   │
   ├─→ YInMn/QD coating → IONIC LIQUID EXTRACTION → In/Y recovery → NEW COATING
   │
   ├─→ BFRP chassis → THERMAL DEPOLYMERIZATION (350°C) → MMA + BASALT FIBER
   │       │                                         │
   │       ├─→ MMA → ELIUM® FORMULATION → NEW CHASSIS
   │       └─→ BASALT FIBER → RE-ROVE/VARTM → NEW CHASSIS
   │
   ├─→ MXene films → RE-ETCH from MAX PHASE → NEW MXENE
   │
   ├─→ MR fluid → CIP SEPARATION + OIL DISTILLATION → NEW MR FLUID
   │
   ├─→ PVDF-TrFE mesh → DMF DISSOLUTION → RE-CAST → NEW MESH
   │
   ├─→ Dyneema lace → MECHANICAL SEPARATION → RE-BRAID → NEW LACE
   │
   └─→ Ti₃AlC₂ cleats → RE-MACHINE / RE-SINTER → NEW CLEATS
```

**Recovery Rate Target:** >95% by mass
**Processing Time:** 5 days per suit
**Economic:** Net positive at >100 suits/year (recovered material value > processing cost)

---

## 6. Production Scaling Roadmap

| Phase | Timeline | Capacity | Facility | Investment | Unit Cost (TG) |
|-------|----------|----------|----------|------------|----------------|
| **Pilot** | Q3 2026 | 1/month | 2,400 m² (existing) | $2.8M | $185,000 |
| **Low Rate** | Q1 2027 | 4/month | +500m² (Z6, Z7 expand) | +$1.2M | $142,000 |
| **Full Rate** | Q3 2027 | 12/month | +1,000m² (parallel lines) | +$3.5M | $98,000 |
| **Surge** | 2028+ | 30/month | Second facility | +$8.0M | $72,000 |

**Cost Reduction Drivers:**
- Basalt fiber in-house: -$18k/unit (vs. commercial $7/kg)
- MXene in-house: -$12k/unit (vs. commercial $2000/kg)
- ZrB₂ SHS: -$8k/unit (vs. commercial $250/kg)
- Aerogel in-house: -$5k/unit (vs. commercial $240/m²)
- Learning curve (labor): -$15k/unit at 12/mo
- Volume materials pricing: -$10k/unit at 12/mo

---

## 7. Supply Chain Resilience — Critical Materials

| Material | Primary Source | Backup Source | Strategic Stock | Risk Level |
|----------|----------------|---------------|-----------------|------------|
| Basalt rock | Columbia River (OR/WA) | Snake River (ID), Hawaii | 5,000 ton (10 yr) | VERY LOW |
| MMA monomer | Trinseo (USA) | Arkema (FR), Mitsubishi (JP) | 6 month | LOW |
| Zr powder | BGRIMM (CN) | US stockpile, recycling | 12 month | MEDIUM |
| Boron (B powder) | US Borax (CA) | Turkey (Eti Maden) | 12 month | LOW |
| Indium (In₂O₃) | Zinc smelter byproduct | Phoenix Protocol recovery | 24 month | HIGH |
| Lithium (LiF) | Albemarle (USA/Chile) | Recycled Li-ion | 12 month | MEDIUM |
| Silver (AgNW) | Wheaton (USA) | Recycled PV/e-waste | 6 month | MEDIUM |
| NdFeB magnets | MP Materials (USA) | Vacuumschmelze (DE) | 12 month | MEDIUM |
| Pt-Rh bushings | Johnson Matthey (UK) | Heraeus (DE) | 24 month (long lead) | HIGH |

**Mitigation:** In-house synthesis for ZrB₂, MAX Phase, MXene, basalt fiber, Elium®, aerogel reduces external dependency to <30% of BOM cost.

---

*CSMFAB078-D | Version 1.0 | Fabrication Process Flow & Manufacturing Plan*
*Carrington Storm Motors / Safe Pod Engineering Company*