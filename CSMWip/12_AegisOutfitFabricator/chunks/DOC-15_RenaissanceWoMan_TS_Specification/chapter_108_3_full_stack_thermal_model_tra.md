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
L2: ZrB₂-SiC 25mm (k=12 W/m·K) ──→ R₂ = 0.0025/12 = 0.00021 m²K/W
    │
    ▼
L3/L4: MXene+FSS (negligible R) ──→ R₃₄ ≈ 0
    │
    ▼
L5: Aerogel 3mm (k=0.014) ──────→ **R₅ = 0.214 m²K/W (DOMINANT)**
    │
    ▼
L6: MXene (negligible) ──────────→ R₆ ≈ 0
    │
    ▼
L7: ZrB₂-SiC 15mm (k=12) ────────→ R₇ = 0.0015/12 = 0.00013 m²K/W
    │
    ▼
L8/L9: STF layers (k≈0.3) ───────→ R₈₉ = 0.0035/0.3 = 0.012 m²K/W
    │
    ▼
L10: Chassis + Farthingale air gap → R₁₀ ≈ 0.05 m²K/W (air gap advantage)
    │
    ▼
L11/L12: PVDF+Spinel ────────────→ R₁₁₁₂ ≈ 0
    │
    ▼
T_skin (target < 54°C)
```

### 3.3 Total Thermal Resistance

$$R_{total} = 0.00021 + 0 + \textbf{0.214} + 0 + 0.00013 + 0.012 + 0.05 = \textbf{0.276 m}^2\text{K/W}$$

### 3.4 Transient FEM Result (SYNTH-03 §5, validated)

| Time (s) | T_ext (°C) | T_L2 Inner (°C) | T_L5 Inner (°C) | T_skin (°C) |
|----------|------------|-----------------|-----------------|-------------|
| 0 | 1100 | 25 | 25 | 25 |
| 30 | 1100 | 780 | 100 | 34 |
| 60 | 1100 | 850 | 150 | 39 |
| 120 | 1100 | 920 | 210 | 44 |
| 180 | 1100 | 960 | 260 | 48 |
| 240 | 1100 | 990 | 300 | 51 |
| **300** | **1100** | **1010** | **330** | **54** |

**Result: T_skin = 54°C @ 300s** ✅ (Target: <60°C)

---

