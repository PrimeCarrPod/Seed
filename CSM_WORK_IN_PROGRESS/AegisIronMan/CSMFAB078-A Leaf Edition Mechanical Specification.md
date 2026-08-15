# CSMFAB078-A — Aegis Iron Man: Leaf Edition Mechanical Specification
## Detailed Panel Geometry, Lacing Topology, and Morphology Transition Mechanics
## Version 1.0 | August 2026

---

## 1. Standardized Tile Geometry

### 1.1 Primary Tile — ZrB₂-SiC Laminated Ceramic

| Parameter | Value | Tolerance | Notes |
|-----------|-------|-----------|-------|
| Length × Width | 150 × 150 mm | ±0.2 mm | CNC diamond ground post-sinter |
| Thickness (outer) | 10 mm | ±0.15 mm | 12-ply LOM, 0°/90° |
| Thickness (inner) | 8 mm | ±0.15 mm | 8-ply LOM |
| Corner radius | 3 mm | ±0.1 mm | Stress concentration relief |
| Mass (outer tile) | 1.26 kg | ±0.03 kg | ρ = 5.6 g/cm³ |
| Mass (inner tile) | 1.01 kg | ±0.02 kg | |
| Magnetic alignment | 8 × NdFeB N52 8×3mm | ±0.05 mm position | Embedded in edge groove |
| Edge gasket groove | 2mm W × 1.5mm D | ±0.1 mm | Double-gasket retention |

### 1.2 Tile Edge Profile — Double-Gasket Joint

```
┌─────────────────────────────────────────────────────────┐
│  EXTERIOR                                               │
│  ┌─────────┐  ┌─────────┐  ┌─────────────────────────┐  │
│  │ ZrB₂-SiC│  │ MXene   │  │ ePTFE (inner gasket)    │  │
│  │ Tile    │  │ Tape    │  │ ε_r=2.1, σ<10⁻¹⁸ S/m    │  │
│  └────┬────┘  └────┬────┘  └───────────┬─────────────┘  │
│       │          │                   │                  │
│       └──────────┴───────────────────┘                  │
│                  │                                      │
│       ┌──────────┴───────────────────┐                  │
│       │ ZrO₂-Silicone (outer gasket) │                  │
│       │ ε_r=8.5, -60°C to +260°C     │                  │
│       └──────────┬───────────────────┘                  │
│                  │                                      │
│  ┌─────────┐  ┌─────────┐  ┌─────────────────────────┐  │
│  │ ZrB₂-SiC│  │ MXene   │  │ ePTFE (inner gasket)    │  │
│  │ Tile    │  │ Tape    │  │ ε_r=2.1, σ<10⁻¹⁸ S/m    │  │
│  └─────────┘  └─────────┘  └─────────────────────────┘  │
│  INTERIOR                                               │
└─────────────────────────────────────────────────────────┘
```

**Joint SE Penalty:** ≤12 dB per joint (measured MIL-STD-285)
**Compression Force:** 1.8 MPa nominal (achieved via Dyneema lacing tension)

---

## 2. Panel Layouts per Leaf Edition

### 2.1 LE-TS (Tall-Skinny) — 42 Tiles

```
TORSO (18 tiles):
  Front: 3 wide × 4 high = 12
  Back:  3 wide × 4 high = 12
  (Overlap at sides: 2 tiles shared) → Net 18

SHOULDERS (4 tiles):
  Left:  2 (anterior + posterior)
  Right: 2 (anterior + posterior)

UPPER ARMS (6 tiles):
  Left:  3 (proximal, mid, distal)
  Right: 3

FOREARMS (4 tiles):
  Left:  2
  Right: 2

THIGHS (6 tiles):
  Left:  3 (proximal, mid, distal)
  Right: 3

LOWER LEGS (4 tiles):
  Left:  2
  Right: 2

TOTAL: 42 tiles | Mass: ~47.5 kg (ceramic only)
```

### 2.2 LE-TG (Tall-Gordo) — 56 Tiles

```
TORSO (28 tiles):
  Front: 4 wide × 5 high = 20
  Back:  4 wide × 5 high = 20
  (Overlap: 4 tiles shared each side) → Net 28 (+10 vs TS)

SHOULDERS (6 tiles):
  Left:  3 (wider coverage)
  Right: 3

UPPER ARMS (6 tiles): Same as TS
FOREARMS (4 tiles): Same as TS

THIGHS (8 tiles):
  Left:  4 (wider wrap)
  Right: 4

LOWER LEGS (4 tiles): Same as TS

TOTAL: 56 tiles | Mass: ~63.4 kg (ceramic only)
```

### 2.3 LE-SS (Short-Skinny) — 36 Tiles

```
TORSO (14 tiles):
  Front: 3 wide × 3 high = 9
  Back:  3 wide × 3 high = 9
  (Overlap: 2 tiles shared) → Net 14 (-4 vs TS)

SHOULDERS (4 tiles): Same as TS
UPPER ARMS (6 tiles):
  Left:  3 (shorter segments)
  Right: 3

FOREARMS (4 tiles): Same as TS

THIGHS (4 tiles):
  Left:  2 (shorter)
  Right: 2

LOWER LEGS (4 tiles): Same as TS

TOTAL: 36 tiles | Mass: ~40.7 kg (ceramic only)
```

### 2.4 LE-SG (Short-Gordo) — 48 Tiles

```
TORSO (22 tiles):
  Front: 4 wide × 4 high = 16
  Back:  4 wide × 4 high = 16
  (Overlap: 3 tiles shared each side) → Net 22 (+4 vs SS)

SHOULDERS (6 tiles): Same as TG
UPPER ARMS (6 tiles): Same as SS
FOREARMS (4 tiles): Same as TS
THIGHS (6 tiles):
  Left:  3 (wider + shorter)
  Right: 3

LOWER LEGS (4 tiles): Same as TS

TOTAL: 48 tiles | Mass: ~54.3 kg (ceramic only)
```

---

## 3. Dyneema® SK99 Lacing Topology

### 3.1 Lacing Architecture — 12 Tension Zones

| Zone | Anatomical Region | Lace Path | Cleat Count | Target Tension |
|------|-------------------|-----------|-------------|----------------|
| Z1 | Left Shoulder | Over deltoid → scapula | 4 | 180 N |
| Z2 | Right Shoulder | Over deltoid → scapula | 4 | 180 N |
| Z3 | Chest (anterior) | Sternal midline → lateral | 6 | 220 N |
| Z4 | Upper Back | Vertebral → scapular | 6 | 200 N |
| Z5 | Lower Back | Lumbar → iliac crest | 6 | 240 N |
| Z6 | Abdomen | Xiphoid → pubic symphysis | 6 | 160 N |
| Z7 | Left Hip | Iliac → greater trochanter | 4 | 200 N |
| Z8 | Right Hip | Iliac → greater trochanter | 4 | 200 N |
| Z9 | Left Thigh | Proximal → distal | 4 | 180 N |
| Z10 | Right Thigh | Proximal → distal | 4 | 180 N |
| Z11 | Left Calf | Tibial tuberosity → malleolus | 3 | 140 N |
| Z12 | Right Calf | Tibial tuberosity → malleolus | 3 | 140 N |

**Total Cleats:** 54 per suit (Ti₃AlC₂ MAX Phase, machinable, dielectric)
**Lace Spec:** Dyneema SK99, 2.4mm diameter, break strength 4,250 MPa
**Routing:** Internal channels in BFRP chassis, ceramic tile edge guides

### 3.2 Cleat Design — Ti₃AlC₂ MAX Phase Cam Cleat

```
┌────────────────────────────────────────┐
│  CLEAT BODY (Ti₃AlC₂, CNC machined)    │
│  ┌──────────────────────────────────┐  │
│  │ CAM PROFILE: 15° lead angle      │  │
│  │ Self-locking under load          │  │
│  │ Release lever: tool-less         │  │
│  └──────────────────────────────────┘  │
│  ┌──────────────────────────────────┐  │
│  │ LACE GROOVE: 2.6mm radius        │  │
│  │ Wear surface: h-BN coating       │  │
│  │ (λ=250 W/m·K, ε_r>10¹⁴)          │  │
│  └──────────────────────────────────┘  │
│  MOUNTING: 4× M5 ceramic inserts     │
│  (ZrO₂ adhesive bond to BFRP)        │
└────────────────────────────────────────┘
```

**Holding Force:** 500 N per cleat (2.7× safety factor)
**Cycle Life:** >10,000 latch/release cycles (MAX Phase non-brittle)
**Electrical Isolation:** >10¹² Ω between lace and chassis

---

## 4. Morphology Transition Mechanics

### 4.1 Transition Sequence (Single Wearer, <90s)

```
PHASE 1: DE-TENSION (15s)
  → Release all 12 zone levers simultaneously (pull-ring actuation)
  → BFRP chassis elastic recovery expands panel gaps to 8-12mm

PHASE 2: PANEL RECONFIGURATION (45s)
  → Remove/add tiles per edition delta table
  → Magnetic alignment self-centers (±0.05mm)
  → MXene tape bridges auto-contact (no tools)

PHASE 3: RE-TENSION (25s)
  → Engage all 12 zone levers in sequence: Z3→Z4→Z5→Z6→Z1→Z2→Z7→Z8→Z9→Z10→Z11→Z12
  → Torque verification: handheld torque wrench (preset 2.5 Nm/cleat)
  → PVDF-TrFE sensor auto-calibration (5s)

PHASE 4: VALIDATION (5s)
  → Joint SE spot-check (handheld EMI probe)
  → MR fluid pressure verify (12 zones)
  → Bio-acoustic baseline capture (10s)
```

### 4.2 Edition Delta — Tile Add/Remove Matrix

| Transition | Tiles Added | Tiles Removed | Net Change | Time Est. |
|------------|-------------|---------------|------------|-----------|
| TS → TG | +14 (torso +8, shoulders +2, thighs +4) | 0 | +14 | 55s |
| TS → SS | 0 | -6 (torso -4, thighs -2) | -6 | 40s |
| TS → SG | +6 (torso +4, shoulders +2) | 0 | +6 | 50s |
| TG → SG | 0 | -8 (torso -6, thighs -2) | -8 | 45s |
| SS → SG | +12 (torso +8, shoulders +2, thighs +2) | 0 | +12 | 52s |
| SS → TG | +20 (torso +14, shoulders +2, thighs +4) | 0 | +20 | 65s |

**Tile Storage:** Collapsible BFRP cassette (6 tiles) mounts on lower back (Z5 zone)
**Tool-Free:** All operations by hand; magnetic alignment guides placement

---

## 5. BFRP Chassis — Variable Geometry Frame

### 5.1 Chassis Architecture

The BFRP/Elium® chassis is the **load-bearing dielectric skeleton**. It does not change geometry between editions — instead, **modular extension struts** bolt to standardized hardpoints.

```
HARDPOINT GRID (50mm pitch, M6 Ti₃AlC₂ inserts):
  Torso:  20 × 25 grid (1000 × 1250 mm)
  Limbs:  8 × N grid per segment (variable length)
  
EXTENSION STRUTS (BFRP pultruded, 25×25mm □):
  Length options: 50, 100, 150, 200, 250 mm
  Connection: 4× M6 per end (torque 4.5 Nm)
  Dielectric: >10¹² Ω end-to-end
```

### 5.2 Edition Strut Configuration

| Segment | TS | TG | SS | SG |
|---------|----|----|----|----|
| Torso height | 4 struts (200mm) | 5 struts (250mm) | 3 struts (150mm) | 4 struts (200mm) |
| Torso width | 3 struts (150mm) | 4 struts (200mm) | 3 struts (150mm) | 4 struts (200mm) |
| Upper arm | 3 struts (150mm) | 3 struts (150mm) | 3 struts (150mm) | 3 struts (150mm) |
| Forearm | 2 struts (100mm) | 2 struts (100mm) | 2 struts (100mm) | 2 struts (100mm) |
| Thigh | 3 struts (150mm) | 4 struts (200mm) | 2 struts (100mm) | 3 struts (150mm) |
| Lower leg | 2 struts (100mm) | 2 struts (100mm) | 2 struts (100mm) | 2 struts (100mm) |

**Total Struts/Edition:** TS=52, TG=64, SS=44, SG=56
**Changeover:** Strut swap <30s (quick-release M6 ceramic nuts)

---

## 6. Validation & Test Protocols

### 6.1 Lacing Tension Verification

| Test | Method | Acceptance |
|------|--------|------------|
| Zone tension | Load cell inline (calibrated) | ±5% of target |
| Cleat hold | Pull test to 500N | No slip |
| Lace fatigue | 10,000 cycles 0-250N | No fiber damage |
| Dielectric | 10kV DC lace-to-chassis | No breakdown |

### 6.2 Joint SE Validation

| Test | Method | Acceptance |
|------|--------|------------|
| Panel joint | ASTM D4935 (150mm sample) | ≤12 dB penalty |
| Full suit | Reverberation chamber (1GHz) | ≥120 dB system |
| MXene continuity | 4-point probe across joint | <0.1 Ω/sq |

### 6.3 Morphology Transition Test

| Test | Method | Acceptance |
|------|--------|------------|
| TS→TG→TS cycle | Timed, single wearer | <90s each way |
| Panel alignment | CMM scan post-transition | ≤0.2mm positional |
| Sensor recal | PVDF baseline RMS | <2% variance |
| SE re-verify | Spot check 3 joints | ≤12 dB penalty |

---

## 7. Bill of Materials — Per Edition (Mechanical Only)

| Item | TS | TG | SS | SG | Unit Cost | Notes |
|------|----|----|----|----|-----------|-------|
| ZrB₂-SiC outer tiles | 42 | 56 | 36 | 48 | $185 | In-house flash sintered |
| ZrB₂-SiC inner tiles | 42 | 56 | 36 | 48 | $148 | In-house flash sintered |
| NdFeB magnets | 672 | 896 | 576 | 768 | $0.45 | 8 per tile edge |
| ePTFE gasket | 101m | 134m | 86m | 115m | $12/m | Continuous roll |
| ZrO₂-silicone gasket | 101m | 134m | 86m | 115m | $18/m | Continuous roll |
| MXene tape | 202m | 269m | 173m | 230m | $65/kg | 45μm, 12mm wide |
| Dyneema SK99 lace | 48m | 52m | 44m | 48m | $42/kg | 2.4mm dia |
| Ti₃AlC₂ cleats | 54 | 54 | 54 | 54 | $28 | Machined in-house |
| BFRP chassis | 1 | 1 | 1 | 1 | $2,400 | VARTM molded |
| Extension struts | 52 | 64 | 44 | 56 | $18 | Pultruded BFRP |
| MR fluid bladders | 12 | 12 | 12 | 12 | $85 | Silicone/TPU |
| PVDF-TrFE mesh | 1 | 1 | 1 | 1 | $320 | 240 nodes |

**Mechanical Subsystem Total:** TS ~$24.8k, TG ~$29.3k, SS ~$22.1k, SG ~$26.7k

---

*CSMFAB078-A | Version 1.0 | Mechanical Specification Appendix*
*Carrington Storm Motors / Safe Pod Engineering Company*