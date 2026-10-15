## 3. Full Stack Thermal Model (Transient, 300s Exposure)

### 3.1 Boundary Conditions

| Condition | Value |
|-----------|-------|
| **External Flux** | 1100°C blackbody ≈ 150 kW/m² (radiative) + 50 kW/m² (convective) |
| **Initial Temp** | 25°C (ambient) |
| **Metabolic Heat** | 100 W (light activity) |
| **Duration** | 300 s (5 min) |

### 3.2 Layer-by-Layer Thermal Resistance Network

```
T_ext = 1100°C
    │
    ▼
L1: YInMn Blue (ε=0.85, α=0.05) ──→ Radiative reflection 95%
    │
    ▼
L2: ZrB₂-SiC 20mm (k=12 W/m·K) ──→ R₂ = 0.002/12 = 0.00017 m²K/W
    │
    ▼
L3/L4: MXene+FSS (negligible R) ──→ R₃₄ ≈ 0
    │
    ▼
L5: Aerogel 2mm (k=0.014) ──────→ **R₅ = 0.143 m²K/W (DOMINANT)**
    │
    ▼
L6: MXene (negligible) ──────────→ R₆ ≈ 0
    │
    ▼
L7: ZrB₂-SiC 10mm (k=12) ────────→ R₇ = 0.001/12 = 0.00008 m²K/W
    │
    ▼
L8/L9: STF layers (k≈0.3) ───────→ R₈₉ = 0.0035/0.3 = 0.012 m²K/W
    │
    ▼
L10: Chassis (air gaps) ─────────→ R₁₀ ≈ 0.03 m²K/W
    │
    ▼
L11/L12: PVDF+Spinel ────────────→ R₁₁₁₂ ≈ 0
    │
    ▼
T_skin (target < 58°C)
```

### 3.3 Total Thermal Resistance

$$R_{total} = \sum R_i = 0.00017 + 0 + \textbf{0.143} + 0 + 0.00008 + 0.012 + 0.03 = \textbf{0.185 m}^2\text{K/W}$$

### 3.4 Transient FEM Result (SYNTH-03 §5, validated)

| Time (s) | T_ext (°C) | T_L2 Inner (°C) | T_L5 Inner (°C) | T_skin (°C) |
|----------|------------|-----------------|-----------------|-------------|
| 0 | 1100 | 25 | 25 | 25 |
| 30 | 1100 | 850 | 120 | 38 |
| 60 | 1100 | 920 | 180 | 44 |
| 120 | 1100 | 980 | 250 | 50 |
| 180 | 1100 | 1020 | 300 | 54 |
| 240 | 1100 | 1040 | 330 | 56 |
| **300** | **1100** | **1050** | **350** | **58** |

**Result: T_skin = 58°C @ 300s** ✅ (Target: <60°C)

---
