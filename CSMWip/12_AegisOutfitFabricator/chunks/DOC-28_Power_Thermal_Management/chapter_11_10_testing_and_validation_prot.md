## 10. Testing and Validation Protocol

### 10.1 MHD Generator Validation
```
Test Conditions:
  - MR fluid: σ = 500, 800, 1000 S/m
  - Flow rate: 0.5, 1.0, 2.0 L/min
  - B-field: 0.5, 0.8, 1.0 T
  - Load: 0.1-10 Ω (MPPT sweep)

Acceptance:
  - Power: ≥485 W net at design point
  - Efficiency: ≥85% (electrical/hydraulic)
  - Pressure drop: ≤50 kPa
  - Electrode wear: <0.1mm/1000h
  - Voltage stability: ±5% (constant flow)
```

### 10.2 Battery Validation
```
Li-S Pack:
  - Capacity: ≥1.55 kWh (25°C, C/3)
  - Energy density: ≥280 Wh/kg (pack)
  - Cycle life: ≥500 cycles (25°C, C/3, 80% DoD)
  - Rate: 2C discharge, 1C charge
  - Thermal: -20°C discharge ≥80% capacity

LTO Reserve:
  - Capacity: ≥0.92 kWh (25°C)
  - Cycle life: ≥20,000 (25°C, 1C)
  - -40°C discharge: ≥90% capacity
  - 10C charge: ≤6 min to 80%
```

### 10.3 Heat Pump Validation
```
Cooling Mode:
  - COP ≥3.5 (35°C cond / 5°C evap)
  - Capacity ≥500 W (peak), ≥200 W (continuous)
  - Temperature stability: ±2°C (electronics)

Heating Mode:
  - COP ≥4.0 (40°C cond / -10°C evap)
  - Capacity ≥300 W
  - Body LCG: 32°C ±2°C skin temp

Sublimator:
  - Heat rejection: 500 W (peak)
  - Water consumption: ≤0.8 kg/h
  - Startup: <30s from cold soak

Radiator:
  - Heat rejection: 300 W (25°C ambient)
  - Deploy time: <60s
  - Stowed volume: <0.1 m²
```

### 10.4 Integrated System Validation
```
Power + Thermal Combined:
  - 8h mission profile (variable load, environment)
  - MHD + battery + heat pump simultaneous
  - Telemetry: 1 kHz all parameters
  - Pass criteria: All zones in spec, no faults

EMI/EMC:
  - MIL-STD-461G full suite
  - RE102: ≤limit -6 dB margin
  - CE102: ≤limit -6 dB margin
  - CS101/114/RS103: Pass
```

---
