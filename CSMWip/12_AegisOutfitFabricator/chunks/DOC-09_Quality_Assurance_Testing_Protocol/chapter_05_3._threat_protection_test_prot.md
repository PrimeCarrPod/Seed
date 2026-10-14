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
