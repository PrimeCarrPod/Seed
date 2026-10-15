## 3. Protection Performance Gates (CSMFAB078-B §3)

### 3.1 Gate P-01: Ballistic (NIJ STD-0101.06)

| Test | Projectile | Velocity | RM-SS Result | Pass |
|------|------------|----------|--------------|------|
| V₅₀ | 7.62×63mm APM2 | 878 m/s | 942 m/s | ✓ |
| BFD | Clay backing | 878 m/s | 36 mm | ✓ (<44 mm) |
| Multi-hit | 3 shots | 878 m/s | 3/3 stop | ✓ |

### 3.2 Gate P-02: Thermal (ASTM F1291)

| Test | Condition | RM-SS Result | Pass |
|------|-----------|--------------|------|
| Flash fire | 1100°C, 300s | T_skin = 58°C | ✓ (<60°C) |
| Radiant heat | 50 kW/m², 600s | T_skin = 52°C | ✓ |
| Convective | 300°C air, 120s | T_skin = 48°C | ✓ |

### 3.3 Gate P-03: EMI Shielding (MIL-STD-461G RS103)

| Frequency | RM-SS SE | Requirement | Status |
|-----------|----------|-------------|--------|
| 100 MHz | 54 dB | >50 dB | ✓ |
| **1 GHz** | **58.5 dB** | **>60 dB** | **⚠️ MARGINAL** |
| 2.4 GHz | 62 dB | >55 dB | ✓ |
| 5.8 GHz | 65 dB | >55 dB | ✓ |

*Note: Marginal at 1 GHz; operational protocol adds MXene tape at seams for +3 dB*

### 3.4 Gate P-04: Force Trauma (ASTM F2371)

| Test | Impact Energy | RM-SS Force Reduction | Pass |
|------|---------------|----------------------|------|
| Blunt impact | 150 J | 66% | ✓ (≥65%) |
| Blast fragment | 50 kPa | 68% | ✓ |
| Less-lethal | 120 J | 70% | ✓ |

### 3.5 Gate P-05: Directed Energy (MIL-STD-461G Custom)

| Threat | RM-SS ΔT | Requirement | Pass |
|--------|----------|-------------|------|
| Laser 1.06µm | +11°C | ≤14°C | ✓ |
| Microwave 94 GHz | +3°C | ≤14°C | ✓ |

### 3.6 Gate P-06: Bio-Acoustic (IEC 61000-4-9)

| Metric | RM-SS Result | Requirement | Pass |
|--------|--------------|-------------|------|
| Schumann detection | 1.8 mV @ 7.83 Hz | >1 mV | ✓ |
| Absorption coeff. | α = 0.87 @ 7.83 Hz | >0.85 | ✓ |

### 3.7 Gate P-07: Environmental (MIL-STD-810G)

| Condition | Post-Test Ballistic | Pass |
|-----------|---------------------|------|
| Thermal cycle (-40 to +70°C) | 935 m/s | ✓ |
| Humidity (95% RH, 40°C) | 938 m/s | ✓ |
| Salt fog (96 hrs) | 932 m/s | ✓ |
| Vibration (5g RMS) | 936 m/s | ✓ |

### 3.8 Gate P-08: Durability (ASTM D4935, CSMFAB078-B §3.6)

| Test | Cycles | SE Retention | Pass |
|------|--------|--------------|------|
| Flex | 50,000 | 92% | ✓ |
| Abrasion | 2,000 | 88% | ✓ |
| UV | 1,000 hrs | 95% | ✓ |

---
