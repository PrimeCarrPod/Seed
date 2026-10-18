## 6. Thermal Test Protocol — CSMFAB-THERM-002/003 (Adapted)

### 6.1 Flash Fire Test (CSMFAB-THERM-002)

```
FACILITY: CSM Thermal Test Cell (propane-fueled, 1100±50°C)
MANIKIN: Thermetric™ sweating thermal manikin (40 zones)
INSTRUMENTATION:
  - 120 Type-K thermocouples (skin, each layer interface)
  - 15 heat flux sensors (Gardone 0.1 MW/m²)
  - IR camera (FLIR A6750, 640×512, 120Hz)
  - Gas analysis (O₂, CO, CO₂, HCN)

TEST CONDITIONS:
  Exposure: 300s at 1100°C ±50°C
  Heat flux: 150±15 kW/m²
  Ambient: 25°C, 40% RH
  Airflow: 1.5 m/s

ACCEPTANCE CRITERIA (per edition):
  Mean skin temperature: ≤60°C (all zones)
  Maximum local skin temp: ≤70°C
  Total heat transfer: ≤120 kJ/m²
  No ignition, melting, delamination
  Post-test SE: ≥120 dB (no thermal degradation)
```

### 6.2 Radiant Panel Test (CSMFAB-THERM-003 / ASTM F1939)

```
EXTENDED TEST: 600s at 800°C (radiant panel)
TPP (Thermal Protective Performance): ≥45 cal/cm²
Heat flux: 84 kW/m² (ASTM F1939 standard)
```

### 6.3 Edition-Specific Zone Mapping

| Edition | Manikin Zones | Critical Zones | Additional Zones |
|---------|---------------|----------------|------------------|
| RM-TS | 40 | 12 (torso) | — |
| RM-TG | 40 | 16 (torso + abdomen) | +4 |
| RM-SS | 40 | 10 (compact torso) | — |
| RM-SG | 40 | 14 (torso + lower) | +2 |
| RW-TS | 40 | 14 (torso + breast) | +2 |
| RW-TG | 40 | 18 (full) | +4 |
| RW-SS | 40 | 12 (compact + breast) | +2 |
| RW-SG | 40 | 16 (full) | +2 |

---
