## 3. Energy Storage System

### 3.1 Primary Battery: Lithium-Sulfur (Li-S)
Next-generation chemistry for high specific energy:

```
Cell Chemistry: Li-S (lithium metal anode, sulfur-carbon cathode)
Specific Energy: 400 Wh/kg (cell), 280 Wh/kg (pack, with BMS)
Energy Density: 500 Wh/L (cell), 350 Wh/L (pack)
Cycle Life: 500 cycles (80% retention, C/3 rate)
Operating Temp: -20°C to +60°C (with thermal management)
Safety: Inherent overcharge protection (Li₂S passivation)

Pack Configuration:
  - Cells: 84 × 5 Ah pouch (3.7V nominal, 2.0-4.2V range)
  - Series: 7S (25.9V nominal) × 12P = 84 cells
  - Capacity: 60 Ah (25.9V) = 1.55 kWh
  - Mass: 5.5 kg (cells), 6.8 kg (pack with BMS, thermal, housing)
  - Volume: 4.4 L
  - BMS: Active balancing, cell monitoring, fault isolation
```

### 3.2 Emergency Reserve: Lithium-Titanate (LTO)
Ultra-long life, fast charge, wide temperature:

```
Cell Chemistry: LTO (Li₄Ti₅O₁₂ anode, NMC cathode)
Specific Energy: 90 Wh/kg (cell), 70 Wh/kg (pack)
Cycle Life: 20,000 cycles (80% retention)
Operating Temp: -40°C to +60°C (no thermal management needed)
Charge Rate: 10C (6 min full charge)
Power Density: 3000 W/kg

Pack Configuration:
  - Cells: 20 × 20 Ah cylindrical (2.3V nominal)
  - Series: 10S (23V nominal) × 2P = 20 cells
  - Capacity: 40 Ah (23V) = 0.92 kWh
  - Usable Reserve: 0.5 kWh (50% DoD limit for longevity)
  - Mass: 1.3 kg
  - Volume: 1.1 L
```

### 3.3 Battery Thermal Management
Integrated with main thermal loop:

```
Thermal Interface:
  - Cold plate: Aluminum microchannel (0.5mm channels, 1mm pitch)
  - Coolant: HFE-7100 (from main thermal loop)
  - Flow: 0.5 L/min per pack
  - ΔT: ≤5°C (cell to coolant)
  - Heating: 50 W resistive (for -40°C startup)
  - Temperature uniformity: ±1°C across pack
```
