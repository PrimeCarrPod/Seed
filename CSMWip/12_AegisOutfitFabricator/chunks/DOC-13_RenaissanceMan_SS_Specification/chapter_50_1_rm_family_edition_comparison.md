## 1. RM Family Edition Comparison Matrix

### 1.1 Complete Parameter Comparison

| Parameter | **RM-SS** | RM-TS | RM-SG | RM-TG | RW-SS | RW-TS | RW-SG | RW-TG |
|-----------|-----------|-------|-------|-------|-------|-------|-------|-------|
| **Morphology Class** | Short-Skinny | Tall-Skinny | Short-Girthy | Tall-Girthy | Short-Skinny | Tall-Skinny | Short-Girthy | Tall-Girthy |
| **Gender** | Male | Male | Male | Male | Female | Female | Female | Female |
| **Height Range (cm)** | 155-170 | 185-195 | 155-170 | 185-195 | 145-160 | 175-185 | 145-160 | 175-185 |
| **Chest/Bust (cm)** | 76-86 | 85-95 | 105-115 | 110-120 | 82-92 (B) | 92-102 (B) | 105-115 (B) | 110-120 (B) |
| **Waist (cm)** | 65-75 | 70-80 | 95-105 | 100-110 | 60-70 | 65-75 | 95-105 | 100-110 |
| **Hip (cm)** | — | — | — | — | 85-95 (Hₚ) | 95-105 (Hₚ) | 100-110 (Hₚ) | 115-125 (Hₚ) |
| **Morphology Factor (αₑ)** | **-0.15** | 0.00 (ref) | +0.18 | +0.25 | -0.12 | +0.05 | +0.20 | +0.30 |
| **Mass Ratio (Mₑ/M_ref)** | **0.78** | 1.00 | 1.05 | 1.27 | 0.81 | 1.03 | 1.12 | 1.32 |
| **Panel Count** | **28** | 30 | 34 | 36 | 30 | 32 | 36 | 38 |
| **Primary Tile Count** | **150** (20mm) | 180 (25mm) | 210 (25mm) | 240 (50mm) | 140 (20mm) | 170 (25mm) | 200 (25mm) | 230 (50mm) |
| **Backup Tile Count** | **280** (15mm) | 360 (15mm) | 420 (15mm) | 480 (25mm) | 260 (15mm) | 340 (15mm) | 400 (15mm) | 460 (25mm) |
| **Total Mass (kg)** | **13.73** | 16.47 | 17.21 | 20.88 | 13.22 | 16.00 | 16.78 | 20.13 |
| **Mobility Index** | **0.89** | 0.82 | 0.75 | 0.71 | 0.90 | 0.83 | 0.76 | 0.72 |
| **Thermal Protection (°C)** | 58 | 55 | 52 | 48 | 57 | 54 | 51 | 47 |
| **Ballistic V₅₀ (m/s)** | 942 | 955 | 960 | 980 | 938 | 952 | 958 | 978 |
| **EMI Shielding (dB @ 1 GHz)** | 58.5 | 62 | 63 | 65 | 59 | 62.5 | 63.5 | 65.5 |
| **Donning Time (s)** | **90** | 105 | 100 | 115 | 95 | 100 | 105 | 110 |
| **LES Base Tension Range (N)** | 50-65 | 55-70 | 65-85 | 75-95 | 48-62 | 52-68 | 62-82 | 72-92 |

### 1.2 Pareto Frontier Analysis

**Mobility vs. Protection Trade Space:**
```
Protection (V₅₀ + Thermal + EMI)
    ↑
980 |                    RM-TG ●
    |                RM-SG ●
960 |            RM-TS ●       RW-TG ●
    |        RW-TS ●
942 |    RM-SS ●               RW-SG ●
    |              RW-SS ●
    +----+----+----+----+----+----+----+→ Mobility Index
      0.70  0.75  0.80  0.85  0.90  0.95
```

**RM-SS Position:** Maximum mobility (0.89) with full NIJ IV protection — **Pareto optimal**

### 1.3 Mass Distribution by Category

| Category | RM-SS | RM-TS | RM-SG | RM-TG |
|----------|-------|-------|-------|-------|
| Ceramic (L2+L7) | 39.3% | 41.2% | 43.1% | 48.2% |
| Textiles | 25.9% | 24.8% | 23.5% | 20.1% |
| Chassis | 6.6% | 7.2% | 6.8% | 6.3% |
| MXene/FSS | 9.1% | 8.5% | 8.2% | 7.5% |
| Aerogel | 0.2% | 0.3% | 0.3% | 0.5% |
| STF Layers | 15.9% | 14.8% | 14.5% | 13.2% |
| Electronics | 0.2% | 0.2% | 0.2% | 0.2% |
| Hardware | 1.3% | 1.5% | 1.6% | 1.8% |

### 1.4 Cross-References

- CSMFAB078-A §3.1: Edition definitions
- CSMFAB078-A §3.2: Scaling laws
- CSMFAB078-A §3.4: Mobility targets
- CSMFAB078-A §3.5: Transition rules
- Chapter 02: RM-SS overview
- Chapter 05: Performance targets
- Chapter 74: Mobility index
- Chapter 84: Mass budget
- Chapter 129: Edition transitions
- Chapter 130: Reverse transitions
- Chapter 131: LES calibration across editions

---
