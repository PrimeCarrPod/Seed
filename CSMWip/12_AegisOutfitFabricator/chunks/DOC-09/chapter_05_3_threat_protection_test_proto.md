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

**Key Formulas:**
- Projectile kinetic energy: $E_k = \frac{1}{2} m v^2 = \frac{1}{2} \times 0.0108 \times 878^2 \approx 4160 \text{ J}$
- V50 velocity: $V_{50} = \text{velocity at 50\% penetration probability}$
- Ballistic limit: $BL(P) = V_{50} + k \cdot \sigma_{V50}$
- Back-face signature: $BFS = d_{clay} \quad \text{(depth of deformation)}$
- BFS limit (NIJ IV): $BFS_{max} = 44 \text{ mm}$
- Target BFS with STF: $BFS_{target} \leq 24 \text{ mm}$
- BFS reduction: $\eta_{BFS} = \frac{BFS_{without} - BFS_{with}}{BFS_{without}} \times 100\% \approx 45\%$
- Fragment containment: $m_{frag} \leq 5 \text{ g}$ beyond inner layer
- Shots per edition: $N_{shots} = 6 \text{ shots/panel} \times 6 \text{ panels} = 36$
- Minimum spacing: $s_{min} = 75 \text{ mm}$ edge-to-edge

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

**Key Formulas:**
- Exposure temperature: $T_{exp} = 1100 \pm 50^\circ\text{C}$
- Exposure time: $t_{exp} = 300 \text{ s}$
- Heat flux: $q'' = 150 \pm 15 \text{ kW/m}^2$
- Mean skin temperature: $\bar{T}_{skin} = \frac{1}{N} \sum_{i=1}^{N} T_{skin,i} \leq 60^\circ\text{C}$
- Maximum local skin temp: $T_{skin,max} = \max(T_{skin,i}) \leq 70^\circ\text{C}$
- Total heat transfer: $Q_{total} = \int_0^{300} q''(t) \, dt \leq 120 \text{ kJ/m}^2$
- Thermal protective performance: $TPP \geq 45 \text{ cal/cm}^2$
- After-flame time: $t_{AF} \leq 2 \text{ s}$
- After-glow time: $t_{AG} \leq 5 \text{ s}$
- Post-test EMI SE: $SE_{post} \geq 45 \text{ dB}$

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

**Key Formulas:**
- GIC peak dB/dt: $\frac{dB}{dt}_{peak} = 5000 \text{ nT/min}$
- GIC frequency range: $f = 0.001\text{--}100 \text{ Hz}$
- Field coil diameter: $D_{coil} = 3 \text{ m}$
- Measurement channels: $N_{ch} = 24 + 12 + 6 = 42$
- Data rate: $f_s = 10 \text{ kS/s}, \; 24\text{-bit}$
- DC injection (wrist-ankle): $I_{inj} = 10 \text{ A}, \; V_{meas} < 1 \text{ mV}$
- DC injection (shoulder-hip): $I_{inj} = 50 \text{ A}, \; V_{meas} < 1 \text{ mV}$
- EMI frequency range: $f = 10 \text{ kHz} \text{ to } 18 \text{ GHz}$
- Field strength (low): $E = 50 \text{ V/m} \quad (2\text{--}30 \text{ MHz})$
- Field strength (high): $E = 200 \text{ V/m} \quad (30 \text{ MHz} \text{--} 1 \text{ GHz})$
- Interior field limit: $E_{int} < 0.05 \text{ V/m}$
- Shielding effectiveness: $SE = 20 \log_{10}\left(\frac{E_{ext}}{E_{int}}\right) \geq 140 \text{ dB}$
- Arc flash current: $I_{arc} = 8 \text{ kA}, \; t_{arc} = 500 \text{ ms}, \; V = 480 \text{ V}$
- ATPV: $ATPV \geq 50 \text{ cal/cm}^2$

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

**Key Formulas:**
- HPM frequency range: $f = 1\text{--}10 \text{ GHz}$
- Peak power: $P_{peak} = 1\text{--}10 \text{ GW}$
- Far-field strength: $E_{ff} = 1\text{--}10 \text{ kV/m at } 100 \text{ m}$
- Interior field limit: $E_{int} < 0.01 \text{ V/m}$
- RF SE: $SE_{RF} = 20 \log_{10}(E_{ext}/E_{int}) \geq 160 \text{ dB}$
- Optical density: $OD = \log_{10}(1/T) \geq 4$
- Transmission: $T = 5 \times 10^{-5} = 0.005\%$
- Reflectance: $R = 12\% \quad (\text{YInMn NIR})$
- Absorption: $A = 88\%$
- Thermal conductivity: $k_{ZrB_2SiC} = 65 \text{ W/m·K}$
- Absorbed energy: $q_{abs} = I \times A \times t = 10,000 \times 0.88 \times 10 = 88 \text{ kJ/cm}^2$
- Thermal diffusion depth: $\delta = \sqrt{\alpha t} \approx 1.2 \text{ mm in } 10 \text{ s}$
- Lamina thickness: $t_{lamina} = 4 \text{ mm} > \delta$
- Back-face temp rise: $\Delta T_{back} < 50^\circ\text{C}$

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

**Key Formulas:**
- Impact energy: $E = mgh = 5 \times 9.81 \times h$
- 50J: $h = 1 \text{ m}, \; E = 50 \text{ J}$
- 100J: $h = 2 \text{ m}, \; E = 100 \text{ J}$
- 150J: $h = 3 \text{ m}, \; E = 150 \text{ J}$
- Peak force limits: $F_{peak,50J} \leq 3.5 \text{ kN}, \; F_{peak,100J} \leq 5.5 \text{ kN}, \; F_{peak,150J} \leq 8.0 \text{ kN}$
- BFS limits: $BFS_{50J} \leq 20 \text{ mm}, \; BFS_{100J} \leq 30 \text{ mm}, \; BFS_{150J} \leq 44 \text{ mm}$
- Blast charge: $m_{C4} = 500 \text{ g}$
- Standoff distances: $d = 3, 5, 10 \text{ m}$
- Chest deflection limit: $\delta_{chest} \leq 52 \text{ mm}$
- Head injury criterion: $HIC_{15} = \max \left[ \frac{1}{t_2-t_1} \int_{t_1}^{t_2} a(t) dt \right]^{2.5} (t_2-t_1) \leq 700$
- Peak pressure limit: $P_{peak} \leq 100 \text{ kPa}$
- Acceptance standoff: $d_{accept} = 5 \text{ m}$
