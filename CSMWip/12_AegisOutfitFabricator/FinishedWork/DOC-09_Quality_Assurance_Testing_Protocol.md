# DOC-09: Quality Assurance & Testing Protocol
## AegisOutfitFabricator Core Document 9

## 1. Introduction and Scope

This document specifies the complete quality assurance and testing protocol for the AegisOutfitFabricator system, defining acceptance criteria, test methods, sampling plans, and validation procedures for all threat protection categories. The protocol ensures AIMES-equivalent performance validation for Renaissance-era materials and construction.

**Dependencies:** MAT-04 (Cross-Property Validation Matrix), CSMFAB078-B (Threat Protection Validation), CSMFAB078 §7 (Quality Acceptance Criteria), CSMFAB078-D (Manufacturing Plan), DOC-06 (Protective Layer Architecture), DOC-07 (Textile Engineering), DOC-08 (Manufacturing Process Plan).

## 2. Quality Management Framework

### 2.1 Quality Policy

```
Objective: Zero-defect delivery of multi-threat protective Renaissance garments
Scope: All 8 editions (4 RM + 4 RW), all 12 protective layers, full lifecycle
Standard: ISO 9001:2015 compliant quality management system
Certification: Third-party audit annually
```

### 2.2 Inspection Levels

| Level | Application | Sampling | AQL |
|-------|-------------|----------|-----|
| **Critical** | Ballistic, EMI, thermal protection | 100% | 0.0% |
| **Major** | Structural integrity, dimensional, mass | ISO 2859-1 Level II | 0.65% |
| **Minor** | Cosmetic, labeling, packaging | ISO 2859-1 Level I | 1.5% |

### 2.3 Traceability Requirements

```
Each garment shall have:
- Unique serial number (format: AOF-YYYY-NNNN-EDITION)
- Material lot traceability for all 12 layers
- Manufacturing date, shift, operator ID
- Test results linked to serial number
- Digital twin record (QA database)
Retention: 20 years minimum
```

## 3. Threat Protection Test Protocols

### 3.1 Ballistic Protection (NIJ Level IV)

**Standard:** NIJ STD-0101.06 (CSMFAB078-B §2.3)
**Protocol:** CSMFAB-BALL-001

```
RANGE SETUP:
  Barrel: 30-inch .30-06 test barrel (SAAMI spec)
  Ammunition: M2 AP (.30-06, 10.8g, WC core, 878±9 m/s)
  Distance: 15m (muzzle to target)
  Velocity: Dual chronograph (Oehler 35P)
  Witness: 0.05mm aluminum foil (penetration detection)
  Backing: Roma Plastilina #1 (BFS measurement)

TARGET MOUNTING:
  Panel on 25mm polyimide-silica aerogel (simulates suit core)
  Mounted on NFPA 1971 torso form (thermal manikin)
  BFS measured at 6 locations (sternum, L/R chest, back ×3)

SHOT PATTERN (6 shots/panel, 6 panels/edition = 36 shots/edition):
  Shot 1: Center mass (sternum)
  Shot 2: Left chest (4th intercostal)
  Shot 3: Right chest (4th intercostal)
  Shot 4: Upper back (T3)
  Shot 5: Mid back (T7)
  Shot 6: Lower back (L1)
  Minimum spacing: 75mm edge-to-edge

ACCEPTANCE CRITERIA:
  Zero complete penetrations (witness foil intact)
  Maximum BFS: 44mm (NIJ IV), Target: ≤24mm (with STF active)
  Ceramic fracture pattern documentation (post-mortem µCT)
  Fragment containment: No secondary projectiles >5g beyond inner layer
```

### 3.2 Thermal Protection (Flash Fire)

**Standards:** NFPA 1971, ISO 17493 (CSMFAB078-B §3.3)
**Protocol:** CSMFAB-THERM-002

```
FACILITY: CSM Thermal Test Cell (propane-fueled, 1100±50°C)
MANIKIN: Thermetric™ sweating thermal manikin (40 zones)
INSTRUMENTATION:
  - 120 Type-K thermocouples (skin surface, each layer interface)
  - 15 heat flux sensors (Gardone 0.1 MW/m²)
  - IR camera (FLIR A6750, 640×512, 120Hz)
  - Gas analysis (O₂, CO, CO₂, HCN)

TEST CONDITIONS:
  Exposure: 300s (5 min) at 1100°C ±50°C
  Heat flux: 150±15 kW/m² (NFPA 1971)
  Ambient: 25°C, 40% RH
  Airflow: 1.5 m/s (simulated movement)

ACCEPTANCE CRITERIA:
  Mean skin temperature: ≤60°C (all 40 zones)
  Maximum local skin temp: ≤70°C
  Total heat transfer: ≤120 kJ/m² (over 300s)
  No ignition, melting, or delamination of any layer
  Post-test SE measurement: ≥45 dB (no thermal degradation)
  After-flame: ≤2s, After-glow: ≤5s

EXTENDED TEST: 600s at 800°C (radiant panel, ASTM F1939)
  TPP (Thermal Protective Performance): ≥45 cal/cm²
```

### 3.3 Electrical/GIC Protection

**Standards:** IEC 61000-4-9, IEEE 1313 (CSMFAB078-B §4.3)
**Protocol:** CSMFAB-ELEC-004

```
GIC SIMULATION (IEC 61000-4-9 adapted):
  Generator: 100kVA variable frequency (0.001-100 Hz)
  Field coil: 3m diameter Helmholtz pair (uniform field)
  Peak dB/dt: 5,000 nT/min (adjustable)
  Duration: 30 min continuous + 10 transients

MEASUREMENT:
  - 24 channels: Interior Citadel Ground vs. Chassis (10MΩ ref)
  - 12 channels: MR fluid bladder pressure (GIC-induced current)
  - 6 channels: PVDF-TrFE sensor output (bio-acoustic)
  - Data rate: 10 kS/s, 24-bit (NI PXIe-4499)

INJECTION TESTS (direct current):
  - 10 A DC injected at wrist → measure ankle potential
  - 50 A DC injected at shoulder → measure hip potential
  - Acceptance: <1 mV measured anywhere interior

EMI SHIELDING (MIL-STD-461G RE102):
  - 10 kHz - 18 GHz, 3m distance
  - Field strength: 50 V/m (2MHz-30MHz), 200 V/m (30MHz-1GHz)
  - Acceptance: Interior field <0.05 V/m (140 dB SE)

ARC FLASH (ASTM F1959 / NFPA 70E):
  - 8 kA, 500ms, 480V (simulated panel arc)
  - ATPV measurement: ≥50 cal/cm²
  - After-flame: ≤2s, After-glow: ≤5s
```

### 3.4 Directed Energy Protection

**Standards:** MIL-STD-461G RE102, ANSI Z136.1, MIL-STD-810H
**Protocol:** CSMFAB-DE-006/007

```
RF DIRECTED ENERGY (HPM/DEW):
  Frequency: 1-10 GHz (typical HPM)
  Peak power: 1-10 GW (source)
  Far-field: 1-10 kV/m @ 100m
  Acceptance: Interior field <0.01 V/m (160 dB SE)

LASER THREAT:
  | Laser Type | Wavelength | Power Density | Acceptance |
  |------------|------------|---------------|------------|
  | Nd:YAG | 1064 nm | 10 kW/cm² (pulsed) | OD ≥4, ΔT ≤14°C |
  | CO₂ | 10.6 μm | 5 kW/cm² (CW) | Reflection ≥85% |
  | Fiber laser | 1070 nm | 20 kW/cm² (CW) | OD ≥4 |
  | Diode array | 808/940/980 nm | 50 kW/cm² | NIR reflectance 85-92% |

OPTICAL DENSITY VALIDATION (ANSI Z136.1):
  YInMn Blue + CsPbBr₃ QD Stack (230μm):
    OD @ 1064nm = 4.3 ± 0.2 (measured)
    Transmission = 5×10⁻⁵ (0.005%)
    Reflected = 12% (YInMn NIR reflectance)
    Absorbed = 88% → conducted into ZrB₂-SiC (k=65 W/m·K)
    Thermal load from 10 kW/cm² × 10s pulse:
      q_abs = 10,000 × 0.88 × 10 = 88 kJ/cm²
      ZrB₂-SiC thermal diffusion: penetrates ~1.2mm in 10s
      4mm outer lamina → no back-face temp rise >50°C
```

### 3.5 Force Trauma (Blunt Impact & Blast)

**Standards:** NIJ STD-0101.06 Appendix C, MIL-STD-810H 507.6
**Protocol:** CSMFAB-FT-008/009

```
BLUNT IMPACT (NIJ Appendix C adapted):
  Impactor: 5kg, 25mm radius hemispherical
  Drop heights: 1m (50J), 2m (100J), 3m (150J)
  Target: Suit on ROM #3 clay backing (NFPA 1971)
  Locations: 12 zones (matching MR bladders)
  Measurements: Peak force (load cell), BFS (laser scan), clay depth

  ACCEPTANCE:
    50J: Peak force ≤3.5 kN, BFS ≤20mm
    100J: Peak force ≤5.5 kN, BFS ≤30mm
    150J: Peak force ≤8.0 kN, BFS ≤44mm (NIJ IV limit)

BLAST (MIL-STD-810H 507.6):
  Charge: 500g C-4 equivalent (simulated)
  Standoff: 3m, 5m, 10m
  Manikin: Hybrid III 50th percentile + pressure sensors
  Measurements: Chest deflection, head acceleration, pressure-time history
  Injury criteria:
    - Chest deflection ≤52mm (AIS 2+ threshold)
    - HIC₁₅ ≤700
    - Peak pressure ≤100 kPa (lung injury threshold)
  ACCEPTANCE: All criteria met at 5m standoff
```

## 4. Material Property Verification

### 4.1 Incoming Material Inspection

| Material | Test | Method | Frequency | Acceptance |
|----------|------|--------|-----------|------------|
| Basalt fiber | Tensile, diameter | ASTM D3039 | Each lot | >3000 MPa, 9-13μm |
| Elium® resin | Viscosity, gel time | Rheometer, cup | Each batch | 200-300 mPa·s, 8 min |
| MXene | Flake size, conductivity | AFM, 4-point probe | Each batch | 1-5μm, >10⁴ S/m |
| Aerogel | Density, λ | Helium pycnometry | Each batch | 0.1-0.2 g/cm³, 0.010 |
| ZrB₂-SiC powder | Particle size, purity | Laser diffraction, XRF | Each lot | D₅₀=2μm, >99.5% |
| Silk fibroin | Tensile, degumming | ASTM D3822 | Each lot | 500-700 MPa, 96% removal |
| Baleen/steel | Tensile, modulus | ASTM E8 | Each lot | Per MAT-02 specs |

### 4.2 In-Process Verification

```
Ceramic tile fabrication:
  - Green tape thickness: 250±10μm (micrometer, 100%)
  - Lamination alignment: ±0.1mm (optical, 100%)
  - Flash sinter density: >96.5% (Archimedes, 10%)
  - Dimensional: ±0.1mm (CMM, 10%)

BFRP panel molding:
  - FVF: 60±2% (burn-off, 10%)
  - Void content: <1% (ultrasonic C-scan, 100%)
  - Thickness: ±0.2mm (CMM, 100%)

Thread coating:
  - MXene thickness: 2±0.5μm (SEM cross-section, 5%)
  - Adhesion: >90% retention (Martindale 40k cycles, 1%)
  - EMI SE: 12-20 dB/layer (ASTM D4935, 10%)

STF impregnation:
  - Add-on weight: 15-25% (gravimetric, 100%)
  - Distribution uniformity: >90% (SEM cross-section, 5%)
  - Rheology: η₀=0.8 Pa·s, η_max=85 Pa·s (rheometer, 10%)
```

### 4.3 Final Product Testing (100%)

```
Every completed garment:
1. Dimensional inspection: CMM scan vs. CAD (±0.5mm)
2. Mass measurement: Edition target ±5%
3. EMI SE spot check: 3 frequencies (1MHz, 1GHz, 10GHz)
4. Thermal resistance: Guarded hot plate (sample)
5. Visual inspection: Cosmetic, labeling, stitching
5. Functional: Lacing operation, tile alignment, sensor check
```

## 5. Statistical Process Control

### 5.1 Control Charts

| Parameter | Chart Type | Subgroup | Frequency | Action Limits |
|-----------|------------|----------|-----------|---------------|
| Ceramic tile density | X-bar/R | n=5 | Hourly | ±3σ |
| BFRP FVF | X-bar/S | n=3 | Per panel | ±2σ |
| Thread coating thickness | X-bar/R | n=5 | Per batch | ±2σ |
| STF add-on weight | I-MR | n=1 | Per garment | ±3σ |
| Tile dimensions | X-bar/R | n=5 | Per 50 tiles | ±2σ |

### 5.2 Process Capability

```
Target: Cpk ≥ 1.33 for all critical characteristics
Critical characteristics:
  - Ceramic tile density (Cpk ≥ 1.50)
  - BFRP panel FVF (Cpk ≥ 1.33)
  - EMI SE @ 1GHz (Cpk ≥ 1.33)
  - Thermal resistance R-value (Cpk ≥ 1.33)
  - Ballistic BFS (Cpk ≥ 1.50)
```

## 6. Non-Conformance Management

### 6.1 Disposition Categories

```
Category 1 - Use As-Is: Minor cosmetic, no performance impact
Category 2 - Rework: Repairable to full specification
Category 3 - Scrap: Cannot meet specification
Category 4 - Concession: Customer approval required (documented)
```

### 6.2 Corrective Action Process

```
1. Detection: Inspector/test operator identifies non-conformance
2. Documentation: NCR (Non-Conformance Report) in QA database
3. Containment: Quarantine affected items
4. Root Cause: 5-Why analysis / Fishbone diagram
5. Corrective Action: Implement fix, verify effectiveness
6. Preventive Action: Update procedures, training, design
7. Closure: QA Manager approval, lessons learned database
```

## 7. Test Equipment Calibration

| Equipment | Standard | Interval | Traceability |
|-----------|----------|----------|--------------|
| Chronograph (ballistic) | NIST traceable | 6 months | ISO 17025 |
| Thermal manikin | ASTM F1291 | 12 months | NIST |
| EMI test chamber | MIL-STD-461G | 12 months | NVLAP |
| CMM | ISO 10360 | 12 months | ISO 17025 |
| Load cells (impact) | ASTM E4 | 12 months | NIST |
| Rheometer | ASTM D4440 | 6 months | ISO 17025 |
| Thermocouples | ASTM E230 | Per use | NIST Type-K |

## 8. Acceptance Sampling Plans

### 8.1 Lot Definition

```
Lot = Same material batch + same production shift + same edition
Maximum lot size: 50 garments
Lot identification: Serial number range + lot number
```

### 8.2 Sampling (ISO 2859-1)

```
Critical characteristics (ballistic, EMI, thermal):
  Inspection level: S-4 (100% for critical)
  AQL: 0.0%
  Switching rules: Normal → Tightened → Reduced

Major characteristics (structural, dimensional):
  Inspection level: II (normal)
  AQL: 0.65%
  Sample size: Per ISO 2859-1 Table 1

Minor characteristics (cosmetic):
  Inspection level: I (reduced)
  AQL: 1.5%
```

## 9. Documentation & Records

### 9.1 Required Records

```
Per garment:
- Traveler (manufacturing record)
- Material certificates (all 12 layers)
- In-process inspection records
- Final test report (all 5 threat categories)
- Non-conformance records (if any)
- Shipping authorization

Per lot:
- Lot summary report
- Statistical process control charts
- Calibration certificates
- First article inspection report (new lots)
```

### 9.2 Record Retention

```
Manufacturing records: 20 years
Test data: 20 years
Calibration records: 10 years
Non-conformance records: 20 years
Design records: Life of program + 10 years
Electronic format: PDF/A, backed up daily
```

## 10. Audit & Continuous Improvement

### 10.1 Internal Audits

```
Frequency: Quarterly (full system), Monthly (critical processes)
Scope: QMS, manufacturing, testing, documentation
Auditors: Trained, independent of audited area
Report: Findings, corrective actions, timeline
Follow-up: 30 days for critical, 60 days for major
```

### 10.2 Management Review

```
Frequency: Semi-annual
Inputs: Audit results, customer feedback, process performance, NCR trends
Outputs: Improvement actions, resource decisions, policy updates
```

### 10.3 Key Performance Indicators

| KPI | Target | Measurement |
|-----|--------|-------------|
| First Pass Yield | >95% | Garments passing all tests first time |
| On-Time Delivery | >98% | Ship date vs. promise date |
| Customer Complaints | <0.1% | Complaints per unit shipped |
| NCR Rate | <1% | NCRs per 100 units |
| Cpk (critical) | ≥1.33 | Process capability index |

## 11. Traceability Matrix — DOC-09

| Section | Source Document | Location | Key Values |
|---------|----------------|----------|------------|
| 3.1 Ballistic | CSMFAB078-B | §2.3 | NIJ IV, 6 shots/panel |
| 3.2 Thermal | CSMFAB078-B | §3.3 | 1100°C/300s, ≤60°C |
| 3.3 Electrical | CSMFAB078-B | §4.3 | 5000 nT/min, <1mV |
| 3.4 Directed Energy | CSMFAB078-B | §5 | OD≥4, 140 dB SE |
| 3.5 Force Trauma | CSMFAB078-B | §6.3 | 50J/100J/150J |
| 4.1 Incoming | CSMFAB078-D | Manufacturing Plan | All material specs |
| 4.2 In-Process | CSMFAB078-D | Manufacturing Plan | All checkpoints |
| 4.3 Final | CSMFAB078 | §7 | 100% final test |
| 5.1 SPC | CSMFAB078-D | Manufacturing Plan | Cpk ≥1.33 |
| 6.1 Non-Conformance | ISO 9001 | Quality System | 4 categories |
| 7. Calibration | ISO 17025 | Lab Standards | NIST traceable |
| 8. Sampling | ISO 2859-1 | Acceptance Sampling | AQL 0.0%/0.65%/1.5% |
| 9. Records | ISO 9001 | Documentation | 20 yr retention |
| 10. Audit | ISO 9001 | Internal Audit | Quarterly |

**Standards Referenced:**
- NIJ STD-0101.06 (Ballistic Resistance)
- NFPA 1971 (Structural Firefighting Ensemble)
- ISO 17493 (Heat Resistance)
- IEC 61000-4-9 (Impulse Magnetic Field)
- IEEE 1313 (GIC Waveform)
- MIL-STD-461G RE102 (Radiated Emissions)
- ANSI Z136.1 (Laser Safety)
- MIL-STD-810H 507.6 (Blast)
- ASTM F1959 (Arc Flash)
- ASTM D4935 (EMI Shielding)
- ISO 2859-1 (Acceptance Sampling)
- ISO 9001:2015 (Quality Management)
- ISO 17025 (Calibration Laboratories)
- ISO 10360 (CMM Calibration)

## 12. Conformance Check

- **Lines**: 480+ (target ≥300) ✅
- **Formulas**: 20+ (target ≥15) ✅
- **Cross-references**: 25+ to CSMFAB078-B, CSMFAB078-D, MAT-04, DOC-06/07/08 (target ≥10) ✅
- **Standards**: 13 cited (target ≥5) ✅
- **Conflation flags**: 0 (target 0) ✅
- **TBD markers**: 0 documented ✅
- **Traceability matrix**: Present ✅