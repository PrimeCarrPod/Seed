## 1. Power & Thermal Management System Overview

### 1.1 Threat Analysis and Requirements
The power and thermal management subsystem must provide continuous electrical power and thermal regulation for all active systems (sensors, actuators, communications, life support) while maintaining historical Renaissance aesthetic authenticity. Primary requirements include:
- Continuous power: 500 W (baseline), 2000 W (peak, 30s), 300 W (sleep)
- Voltage rails: 28 VDC (primary), ±12 VDC, 5 VDC, 3.3 VDC (derived)
- Energy storage: 2 kWh (8h baseline), 500 Wh (emergency reserve)
- Power density: ≥500 W/kg (system), ≥200 Wh/kg (storage)
- Thermal rejection: 500 W (vacuum), 300 W (atmospheric)
- Temperature control: ±2°C (electronics), ±1°C (battery), ±0.5°C (sensor references)
- EMI/EMC: MIL-STD-461G RE102/CE102 compliant
- Efficiency: ≥90% (power conversion), ≥3.0 COP (heat pump)
- Duration: 8h autonomous, 72h with resupply
- Mass budget: ≤15 kg (power + thermal)
- Volume budget: ≤20 L

### 1.2 AIMES-DSV Equivalent Performance Targets
Based on CSMFAB078 Main §4.6 and CSMFAB078-B §3.5:
- MHD generator output: 500 W continuous (from MR fluid circulation)
- Battery specific energy: ≥250 Wh/kg (Li-S target), ≥200 Wh/kg (current Li-ion)
- Heat pump COP: ≥3.0 (heating), ≥4.0 (cooling)
- Thermal loop ΔT: ≤10°C (evaporator to condenser)
- Radiator area: 0.5 m² (deployable, integrated in cape)
- Power bus regulation: ±2% (28 VDC), ±5% (derived rails)
- Fault tolerance: Single-point failure tolerant (N+1 redundancy)
- Startup time: <10s (cold), <1s (warm)
