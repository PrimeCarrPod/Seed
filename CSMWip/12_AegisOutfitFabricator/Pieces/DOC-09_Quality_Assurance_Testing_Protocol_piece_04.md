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
