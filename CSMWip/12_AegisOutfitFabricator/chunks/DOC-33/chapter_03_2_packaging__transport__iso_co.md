## 2. Packaging & Transport — ISO Container Load Plan

### 2.1 Shipping Container Architecture
Each Leaf Edition ships in a customized **ISO 20ft high-cube container** (6058mm × 2438mm × 2896mm internal) with integrated environmental control:

```
CONTAINER LAYOUT (TOP VIEW):
┌─────────────────────────────────────────────────────────────┐
│  FRONT (DOORS)                                              │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐  ┌─────────┐        │
│  │  BAY 1  │  │  BAY 2  │  │  BAY 3  │  │  BAY 4  │        │
│  │ Torso   │  │ Lower   │  │ Upper   │  │ Helmet/ │        │
│  │ Panels  │  │ Body    │  │ Extrem. │  │ Access. │        │
│  └────┬────┘  └────┬────┘  └────┬────┘  └────┬────┘        │
│       │            │            │            │              │
│  ┌────┴────┐  ┌────┴────┐  ┌────┴────┐  ┌────┴────┐        │
│  │  BAY 5  │  │  BAY 6  │  │  BAY 7  │  │  BAY 8  │        │
│  │ MR Fluid│  │ Battery │  │ Spare   │  │ Tools/  │        │
│  │ Reserve │  │ Modules │  │ Tiles   │  │ Test Eq │        │
│  └─────────┘  └─────────┘  └─────────┘  └─────────┘        │
│                                                             │
│  ENVIRONMENTAL CONTROL UNIT (ECU) - rear bulkhead          │
│  - Active temp control: -20°C to +50°C                     │
│  - Desiccant dehumidification: <10% RH                     │
│  - Shock isolation: 4× wire-rope isolators (40g rating)    │
└─────────────────────────────────────────────────────────────┘
```

### 2.2 Shock & Vibration Isolation Design
Per **MIL-STD-810H 514.8 Category 4** (Wheeled Vehicle Transport):

```
ISOLATION SYSTEM SPECIFICATION:
  Isolator Type: Wire-rope (Enidine WR4 series)
  Natural Frequency: 8-12 Hz (tuned below excitation)
  Transmissibility: <1.5 at resonance, <0.1 at >50 Hz
  Static Deflection: 25mm under loaded container (2400 kg)
  
  LOAD CALCULATION:
  Container tare: 2200 kg
  AIMES payload:  2400 kg (8 editions × 300 kg avg)
  Total mass:     4600 kg
  Isolator count: 4 (corner-mounted)
  Load per isolator: 1150 kg
  
  DYNAMIC RESPONSE (Random Vibration Profile):
  PSD Input:  0.04 g²/Hz @ 10Hz, 0.1 g²/Hz @ 100Hz, 0.01 g²/Hz @ 500Hz
  Response:   <0.5 g RMS at payload CG (verified by FEA)
```

### 2.3 Panel Cradle Design — Magnetic Tile Protection
Each ceramic-gilded tile panel (150×150×10mm, ZrB₂-SiC) mounts in individual cradles:

```
CRADLE SPECIFICATION:
  Material: BFRP/Elium® (MAT-02) with PTFE coating
  Tile Retention: Magnetic (NdFeB N52, 8×3mm) + mechanical lip
  Cradle Pitch: 155mm (allows 5mm gap for thermal expansion)
  Stack Height: 12 panels (max edition = 56 tiles / 2 per cradle = 28 cradles)
  
  VIBRATION ISOLATION:
  Tile-to-cradle: 0.5mm silicone gasket (Shore A 30)
  Cradle-to-frame: 10mm Sorbothane® (static deflection 3mm)
  
  SHOCK PROTECTION (40g):
  Δx_max = 2 × a_max / ω_n² = 2 × 40×9.81 / (2π×10)² = 19.9mm
  Available stroke: 25mm → Margin: 26%
```

### 2.4 Environmental Control Unit (ECU)
Active container conditioning during transport/storage:

```
ECU SPECIFICATION:
  Cooling Capacity: 5 kW (R-134a vapor compression)
  Heating Capacity: 3 kW (PTC ceramic)
  Dehumidification: 20 L/day (desiccant wheel + condenser)
  Airflow: 200 CFM (HEPA filtered, MERV 17)
  Power: 28 VDC (container ship power) / 120 VAC (shore)
  Control: PID ±1°C, ±3% RH
  Monitoring: 12× RTD (PT100), 6× capacitive RH, 3× accelerometer
  Data Logger: 30-day circular buffer (MIL-STD-810H compliance)
```

---
