## 6. Condition-Based Maintenance (CBM+) — PHM & RUL

### 6.1 Prognostics & Health Management Architecture
Per **ISO 13374** (Open System Architecture for CBM) and **SAE AS6294** (PHM Data):

```
PHM DATA FLOW:
  Sensors (240 PVDF + 4 OFS + 12 MR + 24 RF) 
    → Edge preprocessing (Protonic HFET, 1kHz)
    → Feature extraction (RMS, kurtosis, spectral entropy, HI)
    → Wireless (FEATHER mesh) → Ground station
    → PHM Server (TimescaleDB + ML pipeline)
    → RUL prediction → Maintenance work order (auto)

KEY FEATURES (Per DOC-32 Algorithms):
  1. Ceramic Health: UT-PA amplitude decay → delamination growth
  2. MR Fluid Health: Yield stress trend + particle index → fluid life
  3. Battery Health: Capacity fade + impedance rise → RUL (calendar + cycle)
  4. Seal Health: He leak rate trend + pressure cycle count → seal life
  5. Thermal Health: COP degradation + ΔT rise → heat pump life
  6. EMI Health: SE trend (spot check) → MXene degradation
  7. Structural Health: Framework strain (OFS) → fatigue damage
  8. Coating Health: NIR reflectance + fluorescence → coating life
```

### 6.2 RUL Prediction Models

```
RUL MODEL FORMULATION (Per DOC-32 §5):

Ceramic Tile RUL:
  RUL_tile = (K_IC / (Y·σ_max·√(π·a_current)))^(2/(2-m)) · (1/C)^(1/(2-m))
  Paris Law: da/dN = C·(ΔK)^m
  Where: K_IC=4.5 MPa√m (ZrB₂-SiC), m=4.2, C=2.1×10⁻¹²
  Input: a_current from UT-PA, σ_max from OFS strain

MR Fluid RUL:
  RUL_MR = (τ_yield_0 - τ_yield_min) / (dτ_yield/dt)
  dτ_yield/dt = k₁·exp(-Ea/RT)·t^(-0.5) + k₂·N_cycles
  Input: Rheometer yield stress, operating temp, cycle count

Battery RUL:
  RUL_batt = min(RUL_calendar, RUL_cycle)
  RUL_calendar = (SOC_0 - SOC_EOL) / (k_cal·exp(-Ea/RT)·t^0.5)
  RUL_cycle = (Q_0 - Q_EOL) / (k_cyc·DOD^α·rate^β)
  Input: Impedance spectroscopy, coulomb counting, temp history

Seal RUL:
  RUL_seal = (Leak_max - Leak_current) / (dLeak/dt)
  dLeak/dt = A·(ΔP)^n·exp(-Ea/RT)·N_cycles^m
  Input: He leak trend, pressure cycles, temp cycles
```

### 6.3 CBM+ Decision Logic

```
MAINTENANCE ACTION TRIGGERS:
  GREEN (Normal):    All RUL > 2× inspection interval → Continue schedule
  YELLOW (Watch):    Any RUL < 2× interval → Increase monitoring (1Hz→10Hz)
  AMBER (Plan):      Any RUL < 1.5× interval → Schedule I-Level repair
  RED (Act):         Any RUL < 1.0× interval → Immediate O-Level action
  BLACK (Ground):    Any critical RUL < 0.5× → Ground until repair

AUTO WORK ORDER GENERATION:
  Trigger: AMBER/RED alert
  Content: Suit ID, failed LRU, RUL, required spares, technician cert
  Routing: Nearest I-Level shop (GIS + inventory)
  Priority: Mission-critical (fire/HazMat) vs. training
```

---
