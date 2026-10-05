# CSMFAB078-H — Aegis Iron Man: Maintenance & Field Repair Manual
## Preventive Maintenance, Field Expedient Repair, Phoenix Protocol Recycling, Tech Data
## Version 1.0 | August 2026

---

## 1. Maintenance Philosophy

**DESIGN PRINCIPLE:** Every component field-repairable by single operator with carried tools.
**NO SPECIAL TOOLS** beyond issued kit. **NO SHOP EQUIPMENT** required for 90% of repairs.
**MAXIMUM DOWNTIME:** 30 minutes for any single failure mode.

---

## 2. Preventive Maintenance Schedule

### 2.1 Daily (Pre-Mission, 10 minutes)

```
[ ] VISUAL INSPECTION (5 min)
    □ All 140 tiles: cracks, chips, delamination (magnifier 10×)
    □ Magnetic alignment: gaps ≤0.1mm (feeler gauge)
    □ Gaskets: compression, extrusion, cuts (visual + pinch test)
    □ MXene tape bridges: continuity (handheld 4-pt probe)
    □ Coating: QD fluorescence spot check (UV torch, 520nm)
    □ Cleats: 54 engaged, no debris in cam (visual + pull test 50N)
    □ Lacing: tension zones 1-12 ±5% (torque wrench, 2.5Nm)
    □ DIM penetrations: seated, locked, no corrosion (visual)
    
[ ] SYSTEM CHECK (3 min)
    □ Battery: >80% (HUD), solar charging (if daylight)
    □ MR fluid: 12 zones pressure 0.5±0.05 bar (gauge manifold)
    □ PVDF-TrFE: 240 channels green (self-test, 10s)
    □ EMI spot: 3 joints ≥120dB (handheld probe)
    □ Comm: FEATHER mesh + Protonic + BLE (radio check)
    □ Haptic: 16 patterns (wrist HUD test)
    
[ ] DOCUMENTATION (2 min)
    □ Log: mission ID, date, operator, anomalies
    □ Photo: 4-view (front/back/sides) + any damage
    □ QR code scan: suit ID → cloud log auto-sync
```

### 2.2 Weekly (Post-Mission Deep, 60 minutes)

```
[ ] MR FLUID SYSTEM (15 min)
    □ Drain 10% each bladder → inspect for particles (magnet trap)
    □ Top off to 0.5 bar (carried reservoir, 100mL)
    □ Cycle each zone 3× (full field → zero) → verify 3ms response
    
[ ] LACING & CLEATS (15 min)
    □ Full detension → inspect Dyneema for wear (zero tolerance)
    □ Cleat cam profile: gauge 15° lead angle (go/no-go)
    □ Re-tension per edition spec → torque verify
    
[ ] TILE & JOINT (20 min)
    □ Remove 4 sample tiles (corners) → inspect gaskets, MXene tape
    □ SE test: 3 joints (MIL-STD-285 handheld)
    □ Reinstall → magnetic alignment verify
    
[ ] ELECTRONICS (10 min)
    □ Protonic HFET: firmware hash verify (signed)
    □ Battery: capacity test (C/10 discharge, 5hr) → log
    □ Solar: IV curve (if deployed) → log
    □ Comm: mesh hop count, RSSI map → log
```

### 2.3 Monthly (Depot Level, 4 hours)

```
[ ] FULL DISASSEMBLY & INSPECTION
    □ All 112 tiles off → chassis access
    □ BFRP chassis: UT scan (delamination), hardpoint torque
    □ Aerogel core: thickness gauge (25±1mm), λ spot check
    □ MXene films: conductivity map (4-pt probe grid)
    □ YInMn/QD coating: adhesion (cross-hatch 5B), fluorescence
    □ PVDF-TrFE mesh: node-by-node sensitivity (shaker table)
    □ MR bladders: hydrostatic proof (2 bar, 5 min)
    □ DIM penetrations: 10kV hipot, optical power budget
    
[ ] RECALIBRATION
    □ Bio-acoustic baseline (shaker table, 12 regions)
    □ MR yield stress vs. current (rheometer)
    □ Health index algorithm validation (reference subject)
    □ Haptic output force vs. voltage (load cell)
```

---

## 3. Field Expedient Repair — Carried Kit

### 3.1 Issued Repair Kit (2.3 kg, thigh pocket)

| Item | Qty | Use Case | Time |
|------|-----|----------|------|
| MXene conductive tape (45μm, 12mm×1m) | 2 rolls | Joint bridge repair, EMI patch | 2 min |
| ePTFE gasket strip (2mm×1.5mm×2m) | 1 | Gasket replacement | 5 min |
| ZrO₂-silicone putty (50g syringe) | 1 | Gasket repair, fill voids | 3 min |
| Dyneema SK99 lace (2.4mm×5m) | 1 | Lace replacement | 10 min |
| Ti₃AlC₂ cleat (spare) | 2 | Cleat replacement | 3 min |
| Ceramic epoxy (ZrO₂-filled, 2-part) | 1 syringe | Tile crack arrest, bond repair | 5 min |
| NdFeB N52 magnets (8×3mm) | 8 | Magnet replacement | 2 min |
| Torque wrench (preset 2.5Nm, 4mm hex) | 1 | Cleat torque | — |
| 4-pt probe (MXene continuity) | 1 | SE verification | — |
| UV torch (365nm, QD check) | 1 | Coating diagnostic | — |
| Pressure gauge (0-1 bar, MR) | 1 | Bladder pressure | — |
| Multi-tool (ceramic blades) | 1 | General | — |

### 3.2 Common Repair Procedures

#### REPAIR 1: Tile Crack / Chip (Most Common)

```
SYMPTOM: Visual crack <50mm, no delamination, SE intact
TIME: 5 minutes
PROCEDURE:
  1. Clean crack: IPA wipe, dry compressed air
  2. Inject ceramic epoxy: syringe along full crack length
  3. Capillary action draws epoxy in (30s)
  4. Wipe excess → UV cure 60s (if sunny) or ambient 5min
  5. Verify: tap test (ring vs. dull), SE spot check
LIMIT: Crack >50mm OR delamination → REPLACE TILE (Repair 2)
```

#### REPAIR 2: Tile Replacement (Single)

```
SYMPTOM: Crack >50mm, delamination, SE failure, missing tile
TIME: 15 minutes
PROCEDURE:
  1. Detension adjacent zones (2-3 cleats each side)
  2. Pry tile: magnetic release tool (thin Ti₃AlC₂ shim)
  3. Remove old gasket/MXene tape → clean mating surfaces
  4. Apply new ePTFE strip (inner) + ZrO₂-silicone (outer)
  5. Place MXene tape bridge (inner + outer faces)
  6. Install new tile: magnetic alignment → seats with click
  6. Re-tension cleats → torque 2.5Nm
  7. Verify: SE spot check, gap ≤0.1mm
SPARES: Carry 2 tiles (1 outer, 1 inner) per mission
```

#### REPAIR 3: MR Bladder Leak

```
SYMPTOM: Pressure drop >0.1 bar/hr, visible fluid
TIME: 10 minutes
PROCEDURE:
  1. Isolate zone: close check valve (manual override)
  2. Locate leak: soap bubble or UV dye (carried)
  3. If seam: ZrO₂-silicone putty → smooth → cure 5min
  4. If puncture: MXene tape patch (inner + outer) + epoxy
  5. Refill: carried reservoir (100mL) → 0.5 bar
  6. Cycle 3× → verify pressure hold 1hr
NOTE: Can operate with 1 zone isolated (adjacent zones compensate)
```

#### REPAIR 4: Lace Failure / Cleat Damage

```
SYMPTOM: Dyneema frayed/broken, cleat won't hold
TIME: 10 minutes (lace) / 3 minutes (cleat)
PROCEDURE (LACE):
  1. Detension zone → remove old lace (pull through channels)
  2. Thread new lace: routing card (laminated, carried)
  3. Tension to spec → torque cleats 2.5Nm
  4. Verify: pull test 50N each cleat
PROCEDURE (CLEAT):
  1. Remove damaged cleat: 4× M5 ceramic nuts (socket carried)
  2. Install spare cleat → ZrO₂ adhesive if inserts damaged
  3. Torque 4.5Nm → verify cam action
```

#### REPAIR 5: DIM Penetration Fault

```
SYMPTOM: Comm loss, power fault, SE drop at penetration
TIME: 5 minutes
PROCEDURE:
  1. Identify faulty DIM: HUD shows zone
  2. Unlock bayonet → remove module
  3. Inspect: optical fiber (clean/cleave), power contacts (burnish)
  4. Replace module: spare carried (universal, 3 types)
  5. Lock → self-test (optical power, isolation 10kV)
  6. Verify: comms restore, SE spot check
```

---

## 4. Phoenix Protocol — Field Recycling Prep

### 4.1 End-of-Mission Material Segregation (30 minutes)

```
STEP 1: DECONTAMINATION (10 min)
  □ Gross wash: water + surfactant (biodegradable)
  □ Technical decon: per mission profile (chem/bio/rad)
  □ UV-C sterilize: 5 min (collapsible chamber carried)
  □ Dry: compressed air + desiccant pack

STEP 2: COMPONENT SEGREGATION (15 min)
  □ TILES → Tile cassette (magnetic, 14 tiles max)
      → Label: edition, position, condition (QR)
  □ CHASSIS → Fold flat (quick-release struts)
      → Bag: BFRP chassis bag (VCI lined)
  □ MR FLUID → Drain to reservoir bottles (12× 300mL)
      → Cap, label, magnetic trap installed
  □ ELECTRONICS → Remove: Protonic HFET, DSP, battery
      → ESD bag, anti-static foam
  □ LACING/CLEATS → Coil lace, bag cleats
  □ COATINGS → Leave on tiles (recovered in Phoenix)

STEP 3: DOCUMENTATION (5 min)
  □ Phoenix manifest: every component, condition, hours
  □ QR scan each → cloud upload (blockchain log)
  □ Seal crate: tamper-evident, desiccant, humidity indicator
  □ Ship: Phoenix Protocol facility (prepaid label in crate)
```

### 4.2 Phoenix Facility Processing (5 Days)

```
DAY 1: RECEIVING & SORT
  → Automated QR scan → digital twin update
  → X-ray tile inspection (internal cracks)
  → Sort: A-grade (reuse), B-grade (reprocess), C-grade (recycle)

DAY 2-3: MATERIAL RECOVERY (PARALLEL)
  TILES (A) → Ultrasonic clean → Re-coat → Re-certify (70% yield)
  TILES (B/C) → H₂SO₄ leach → ZrO₂ recovery → Re-boronization
  CHASSIS → 350°C depolymerization → MMA + Basalt fiber
  MR FLUID → CIP separation → Oil distillation → Reformulate
  ELECTRONICS → Component test → Reflash → Re-certify
  COATINGS → Ionic liquid extraction → In/Y recovery

DAY 4: RE-MANUFACTURE
  → Recovered materials → production line (Z1-Z10)
  → Priority: tiles, chassis, MXene, fluid

DAY 5: CERTIFICATION & SHIP
  → Full FAT (CSMFAB078-D §4.2)
  → Phoenix certificate (blockchain)
  → Ship to forward depot / customer
```

**Recovery Economics:** 95% mass recovery, 60% value retention, net positive at >100 suits/yr

---

## 5. Technical Reference Data

### 5.1 Torque Specifications

| Fastener | Material | Torque | Tool | Notes |
|----------|----------|--------|------|-------|
| Cleat latch (cam) | Ti₃AlC₂ | 2.5 Nm | Preset wrench | 54 per suit |
| Cleat mount (M5) | ZrO₂ ceramic | 4.5 Nm | 4mm hex | 216 per suit |
| Strut bolt (M6) | Ti₃AlC₂ | 4.5 Nm | 5mm hex | 256 per suit (TG) |
| DIM bayonet | Ti₃AlC₂ | Hand tight + ¼ turn | — | 12 per suit |
| MR bladder fill | Brass | 0.8 Nm | 6mm hex | 12 per suit |
| Battery terminal | Brass | 1.2 Nm | 3mm hex | 4 per suit |

### 5.2 Fluid Specifications

| Fluid | Spec | Capacity | Refresh | Field Top-Off |
|-------|------|----------|---------|---------------|
| MR Fluid | LORD MRF-140CG equiv | 3.2 L total | Annual | 100mL carried |
| Hydraulic (if equipped) | MIL-PRF-87257 | 0.5 L | 2 yr | — |
| Coolant (PCM loop) | RT27HC (solid) | 800 kJ/m² | 5 yr | — |

### 5.3 Electrical Specifications

| Bus | Voltage | Current | Connector | Isolation |
|-----|---------|---------|-----------|-----------|
| Main (battery) | 3.2V (LiFePO₄) | 20A peak | Anderson PP45 | 10kV DIM |
| Logic (DSP) | 3.3V | 500mA | JST-SH | 10kV DIM |
| MR Drivers | 12V | 2A×12 | Molex Micro-Fit | 10kV DIM |
| Haptic HV | ±150V | 10mA | Custom ceramic | 10kV DIM |
| Comm (Protonic) | 5V | 100mA | Optical (FC/APC) | Inherent |

### 5.4 Environmental Limits

| Parameter | Operating | Storage | Transport |
|-----------|-----------|---------|-----------|
| Temperature | -40°C to +130°C | -55°C to +85°C | -55°C to +85°C |
| Humidity | 0-100% (condensing) | 0-95% non-cond | 0-95% non-cond |
| Altitude | -500m to +5000m | Vacuum compatible | Any |
| Shock | 50g / 11ms | 100g / 6ms | 40g / 11ms |
| Vibration | 5g RMS 20-2000Hz | 10g RMS | 3g RMS |
| EMI | 200 V/m (MIL-STD-461G) | — | — |
| Pressure | 0.5-1.5 bar (surface) | 0-10 bar | 0-10 bar |
| Pressure (DSV) | 1-201 bar | 0-250 bar | 0-250 bar |

---

## 6. Troubleshooting Guide — Quick Reference

| Symptom | Likely Cause | Immediate Action | Repair Ref |
|---------|--------------|------------------|------------|
| HUD: "SE LOW JOINT 7" | MXene tape bridge broken | Apply MXene tape patch | Repair 1 |
| HUD: "MR Z3 PRESS LOW" | Bladder leak / valve | Isolate zone, patch/refill | Repair 3 |
| HUD: "PVDF CH 45 FAULT" | Sensor delamination | Mark zone, continue mission | Monthly depot |
| HUD: "BATT <20%" | High MR use / cold | Solar deploy / reduce MR duty | — |
| HUD: "CITADEL GND DRIFT" | DIM fault / contamination | Check DIM 12, clean contacts | Repair 5 |
| No comms (all) | Antenna damage / FEATHER fault | Switch to Protonic optical | Repair 5 |
| Haptic dead | HV charge pump fault | Reset: hold wrist 5s | Monthly depot |
| Tile loose (rattle) | Magnet failed / cleat loose | Torque cleats, check magnets | Repair 2/4 |
| Condensation inside | DIM seal breach | Desiccant swap, dry 1hr | Repair 5 |
| HI dropping fast | Physiological / sensor | Hydrate, rest, verify vitals | — |

---

## 7. Configuration Management

### 7.1 Edition Conversion Kit (Carried for Multi-Role)

| Item | TS→TG | TS→SS | TS→SG | Weight |
|------|-------|-------|-------|--------|
| Torso tiles (+14) | ✓ | — | ✓ | 17.6 kg |
| Shoulder tiles (+2) | ✓ | — | ✓ | 2.5 kg |
| Thigh tiles (+4) | ✓ | — | — | 5.0 kg |
| Torso tiles (-4) | — | ✓ | — | -5.0 kg |
| Thigh tiles (-2) | — | ✓ | — | -2.5 kg |
| Strut set | +12 | -8 | +4 | 2.2 kg |
| Lace length adj. | +4m | -4m | 0 | 0.2 kg |

**Conversion Time:** 45-65 minutes (per CSMFAB078-A §4.1)

### 7.2 Software/Firmware Versions

| Component | Current | Update Method | Rollback |
|-----------|---------|---------------|----------|
| Protonic HFET | v4.2.1 | OTA (Protonic) / USB-C | Dual bank |
| DSP (Cortex-M7) | v3.8.0 | OTA (FEATHER) / USB-C | Dual bank |
| FPGA (iCE40) | v2.1.0 | OTA (FEATHER) / USB-C | Dual bank |
| HUD Firmware | v1.5.3 | OTA (BLE) | Dual bank |
| Health Index Algo | v2.0.4 | OTA (FEATHER) | Dual bank |

**Update Policy:** Monthly security, quarterly feature, immediate critical

---

*CSMFAB078-H | Version 1.0 | Maintenance & Field Repair Manual*
*Carrington Storm Motors / Safe Pod Engineering Company*