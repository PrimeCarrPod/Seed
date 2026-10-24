## 4. Heat Pump Thermal Loop

### 4.1 System Architecture
Vapor-compression heat pump with dual-mode operation:

```
HEAT PUMP LOOP:
  Compressor → Condenser → Expansion Valve → Evaporator → Compressor
                    ↓                              ↑
              Heat Rejection              Heat Absorption
              (Radiator/Sublimator)       (Electronics/Battery/Body)

Operating Modes:
  COOLING: Evaporator at electronics (cold), Condenser at radiator (hot)
  HEATING: Reverse cycle (4-way valve), Evaporator at radiator, Condenser at body
```

### 4.2 Component Specifications

**Compressor:**
```
Type: Brushless DC scroll (oil-free, hermetic)
Refrigerant: R-1234yf (GWP=1, non-flammable, -40°C to +120°C)
Displacement: 2.5 cm³/rev
Speed: 1800-6000 RPM (variable)
Mass: 1.2 kg
Power: 50-300 W (variable)
COP: 3.5 (cooling, 35°C cond / 5°C evap)
COP: 4.2 (heating, 40°C cond / -10°C evap)
```

**Condenser (Vacuum Mode - Sublimator):**
```
Type: Porous plate sublimator (water feed)
Heat Rejection: 500 W (peak)
Water Consumption: 0.8 kg/hour
Operating Pressure: <1 kPa
Mass: 1.2 kg (including 2kg water reserve)
```

**Condenser (Atmospheric Mode - Radiator):**
```
Type: Microchannel aluminum (deployable)
Area: 0.5 m² (stowed: 0.1 m², integrated in cape)
Flow: 2 L/min (HFE-7100)
Heat Rejection: 300 W continuous
Fan: 0.5 W (if forced convection needed)
Mass: 0.8 kg (radiator), 0.3 kg (deploy mechanism)
```

**Evaporator:**
```
Type: Cold plate (electronics) + liquid cooling garment (body)
Electronics Cold Plate: Al microchannel, 0.3°C/W
Body LCG: 50m tubing, 2mm ID, TPU
Total Heat Absorption: 500 W (peak), 200 W (continuous)
Mass: 1.5 kg (cold plates + LCG)
```

**Expansion Valve:**
```
Type: Electronic (stepper motor, PID controlled)
Capacity: 500 W (R-1234yf)
Response: <100 ms
Mass: 0.1 kg
```

### 4.3 Thermal Loop Fluids
```
Primary Loop (Heat Pump): R-1234yf
  - Charge: 0.8 kg
  - Operating Pressure: 200-1200 kPa
  - Temperature Range: -40°C to +100°C

Secondary Loop (Distribution): HFE-7100
  - Flow: 3 L/min total (1 L/min electronics, 1 L/min battery, 1 L/min body)
  - Pump: BLDC gear pump, 25 W
  - Reservoir: 0.5 L (with accumulator)
  - Heat Exchanger: Plate (R-1234yf/HFE-7100, 95% effectiveness)
```

### 4.4 Thermal Zones and Control
```
ZONE 1: Electronics (AIMES Layer 10-12 avionics)
  - Target: 25°C ±2°C
  - Sensors: 12× RTD (PT1000)
  - Control: PID → evaporator superheat → expansion valve

ZONE 2: Battery (Li-S + LTO packs)
  - Target: 25°C ±1°C
  - Sensors: 8× NTC (10kΩ) per pack
  - Control: Cold plate flow bypass valve

ZONE 3: Body (Liquid Cooling Garment)
  - Target: 32°C ±2°C (skin), 37°C ±0.5°C (core estimated)
  - Sensors: 6× NTC (skin), 2× ingestible (core)
  - Control: LCG flow rate + heat pump mode

ZONE 4: Sensor References (FOG, star tracker, atomic clock)
  - Target: 25°C ±0.5°C
  - Sensors: 4× RTD (PT1000, 4-wire)
  - Control: Dedicated micro-TEC + heat pump trim
```
