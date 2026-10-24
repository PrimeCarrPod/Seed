## 2. Inspection Intervals — Phase Inspection Program

### 2.1 Inspection Categories & Triggers

```
INSPECTION TRIGGERS:
  Calendar-Based:
    - Phase A:  30 days / 50 operating hours    (O-Level)
    - Phase B:  90 days / 150 operating hours   (O-Level)
    - Phase C:  180 days / 300 operating hours  (I-Level)
    - Phase D:  365 days / 600 operating hours  (I-Level + D-Level sampling)
    - Phase E:  730 days / 1200 operating hours (D-Level full)
  
  Condition-Based (CBM+):
    - HI (Health Index) <0.7 → Immediate Phase B
    - Seal leak rate >5×10⁻⁷ cm³/s → Phase A + seal focus
    - MR fluid yield stress drift >15% → I-Level fluid service
    - Tile loss >2 per edition → O-Level inventory + replace
    - Battery SOC drift >10% cell-to-cell → I-Level module test
    - EMI SE drop >10 dB → I-Level MXene inspection
  
  Event-Based:
    - Post-mission (every): Phase A subset
    - Thermal exposure >800°C: Phase B + thermal focus
    - Ballistic/blast impact: Phase C + structural focus
    - Chemical exposure: Phase B + permeation test
    - Electrical arc contact: Phase B + dielectric test
```

### 2.2 Phase A Inspection (30 Days / 50 Hours) — O-Level

```
PHASE A CHECKLIST (Target: 45 minutes, 1 technician):

VISUAL INSPECTION:
  [ ] Ceramic tiles: All present, no cracks/chips, magnetic alignment
  [ ] Outer brocade (Layer 1): YInMn coating intact, no abrasion
  [ ] Tile articulation: Shoulder ±45°, elbow ±135°, hip ±90°
  [ ] Brocade fabric (Layers 3,6): MXene threads, no fraying
  [ ] FSS embroidery (Layer 4): No broken conductive threads
  [ ] Aerogel quilting (Layer 5): No compression damage, 18-22 SPI
  [ ] STF base layer (Layer 9): Flex test 90°→flat <2s
  [ ] Framework (Layer 10): Baleen straight, steel no kinks, hoops circular
  [ ] Liner (Layer 12): CoAl₂O₄ coating, no delamination
  [ ] Lacing system: Dyneema SK99 no fraying, Ti₃AlC₂ cleats functional
  [ ] Seal interfaces: 8× gaskets, no cuts, adhesive tape intact

FUNCTIONAL TESTS:
  [ ] PVDF-TrFE self-test: 240 nodes green (<30s)
  [ ] EMI continuity: Warp/weft <1Ω (multimeter)
  [ ] NIR reflectance: >85% @ 1000nm (spot check 3 locations)
  [ ] Schumann resonance: >78 dB @ 7.83 Hz (portable analyzer)
  [ ] MR fluid pressure: 0.5±0.05 bar (12 zones)
  [ ] Battery SOC: >20%, cell balance ΔV<50mV
  [ ] MHD output: 0.30-0.35 VAC open circuit
  [ ] BIT: PBIT 01-12 all PASS

CLEANING:
  [ ] Dry brush: Tiles, brocade, framework
  [ ] Spot clean: Mild soap, cold water, air dry (no heat)
  [ ] Seal surfaces: IPA wipe, lint-free
  [ ] Optical fibers: Lens tissue, 99% IPA

DOCUMENTATION:
  [ ] Garment Health Record update (digital + physical tag)
  [ ] Discrepancy report for any FAIL items
  [ ] Next inspection due date calculation
```

### 2.3 Phase B Inspection (90 Days / 150 Hours) — O-Level

```
PHASE B CHECKLIST (Target: 2 hours, 2 technicians):
  Includes all Phase A items PLUS:

DEEP INSPECTION:
  [ ] Ceramic tile tap test: Acoustic resonance (each tile)
  [ ] Aerogel batting: Compression test springback >90%
  [ ] STF rheology: Portable rheometer spot check (3 locations)
  [ ] Lacing tension calibration: All 12 zones ±5% target
  [ ] Framework alignment: Laser tracker ±0.5mm (optional)
  [ ] Seal interface pressure test: 150 kPa, 30s hold
  [ ] OFS fiber continuity: 4/4 channels, 1kHz sampling
  [ ] RF mesh topology: 24/24 nodes, ≤4 hops

FLUID SAMPLES:
  [ ] MR fluid: Viscosity (on/off), particle settling, conductivity
  [ ] Coolant (HFE-7100): Dielectric strength >25 kV, pH 6.5-7.5
  [ ] CO₂ scrubber: MOF capacity spot test (CO₂ breakthrough)

FIRMWARE/SOFTWARE:
  [ ] Protonic HFET: Version check, update if >30 days old
  [ ] Neuromorphic models: Hash verification, reload if mismatch
  [ ] BIT software: Version, test vector currency

DOCUMENTATION:
  [ ] Trend analysis: HI, seal rate, MR yield, EMI SE (6-month plots)
  [ ] CBM+ alerts: Review and clear/resolve
  [ ] Spares consumption: Update logistics forecast
```

### 2.4 Phase C Inspection (180 Days / 300 Hours) — I-Level

```
PHASE C CHECKLIST (Target: 8 hours, 2 technicians + 1 engineer):
  Includes all Phase B items PLUS:

DISASSEMBLY TO SUBASSEMBLY:
  [ ] Remove Layer 1-2 (outer shell) for internal access
  [ ] MR bladder removal: Inspect bladder walls, fittings, check valves
  [ ] Aerogel panel removal: Full compression mapping (grid 10×10cm)
  [ ] FSS substrate: VNA sweep 1MHz-10GHz, compare to baseline
  [ ] MXene films: 4-point probe conductivity map (100 points/layer)
  [ ] Ceramic panels: CMM flatness ≤0.5mm/m, edge chip inspection
  [ ] Baleen/steel framework: CMM dimensional, fatigue crack check (dye penetrant)

ADVANCED NDT (Per DOC-32 Baseline):
  [ ] UT-PA (Phased Array): All ceramic tiles, 5MHz, 0.5mm resolution
  [ ] IR Thermography: Powered thermal scan, ΔT map vs. baseline
  [ ] CT Scan (sampling): 10% tiles, internal delamination check
  [ ] ECT (Eddy Current): Framework, baleen channels, cleat bores

COMPONENT TESTING:
  [ ] MHD channels: Individual channel voltage/current (sample 50/600)
  [ ] Protonic HFET: Full parametric test (12 units)
  [ ] Battery modules: Capacity test C/3, impedance spectroscopy
  [ ] Heat pump: COP measurement at 3 load points
  [ ] CO₂ scrubber: Full cycle test (adsorption + regeneration)

REASSEMBLY:
  [ ] All seals replaced (ePTFE + ZrO₂-silicone + MXene tape)
  [ ] Torque all cleats to 2.5±0.2 Nm
  [ ] Full PBIT + CBIT verification
  [ ] Seal verification: He leak ≤1×10⁻⁶ cm³/s (all 8 interfaces)
```

### 2.5 Phase D Inspection (365 Days / 600 Hours) — I-Level + D-Level Sampling

```
PHASE D CHECKLIST (Target: 24 hours, team of 4):
  Includes all Phase C items PLUS:

DEPOT-LEVEL SAMPLING (10% fleet, or all if <10 suits):
  [ ] ZrB₂-SiC tile: Flash sinter re-validation (sample)
  [ ] BFRP chassis: VARTM panel tensile test (coupons)
  [ ] MXene synthesis: Batch quality verification (in-house)
  [ ] Aerogel: Ambient pressure dry cycle validation
  [ ] YInMn Blue: Fluorescence spectral verification (520nm±5nm)
  [ ] CoAl₂O₄: Schumann absorption >78 dB @ 7.83 Hz
  [ ] Neuromorphic ASIC: Burn-in 1000h, parameter drift <2%

OBSOLESCENCE REVIEW:
  [ ] Component obsolescence scan (DMSMS)
  [ ] Alternative source qualification
  [ ] Technology refresh planning (5-year horizon)
  [ ] Software security patch status

LIFECYCLE ASSESSMENT:
  [ ] Remaining Useful Life (RUL) prediction per suit
  [ ] Phoenix Protocol recyclability audit
  [ ] Cost-per-flight-hour update
```

### 2.6 Phase E Inspection (730 Days / 1200 Hours) — D-Level Full

```
PHASE E CHECKLIST (Target: 2 weeks, depot team):
  Complete disassembly to piece-part level:

FULL RECERTIFICATION:
  [ ] All ceramic tiles: Re-sinter or replace (aging assessment)
  [ ] All MXene films: Re-coat or replace
  [ ] All aerogel: Replace (compression set >10%)
  [ ] All MR fluid: Replace (particle chain degradation)
  [ ] Battery pack: Replace (calendar life limit)
  [ ] Framework: Baleen replace, steel NDT, hoops replace
  [ ] Sensors: PVDF-TrFE mesh replace (fatigue limit)
  [ ] Electronics: Protonic HFET, neuromorphic ASIC screen
  [ ] Seals: All 8 interfaces replace
  [ ] Coatings: YInMn + CoAl₂O₄ re-apply
  [ ] Full QA acceptance test per CSMFAB078 §7
  
OUTPUT: New 20-year service life certificate or retirement
```

---
