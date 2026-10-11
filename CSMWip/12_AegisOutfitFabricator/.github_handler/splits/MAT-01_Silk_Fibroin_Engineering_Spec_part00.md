# MAT-01: Silk Fibroin Engineering Specification
## AegisOutfitFabricator Material Science Bridge Document 1

## 1. Historical Degummed Silk Stress-Strain Curve

### 1.1 True Stress/True Strain to Failure
From Research Doc 1 §2.1 (Lines 12-16):
- Degummed silk fibroin: E = 8-12 GPa, σ_uts = 500-700 MPa, ε_break = 15-25%
- Elasto-plastic model with isotropic hardening: σ_y = f(ε_p)
- Sericin removal: 95-100°C, 60-90 min, alkaline hydrolysis, 96% removal

**Stress-Strain Relationship (Engineering):**
```
σ_eng = F / A₀
ε_eng = ΔL / L₀
```

**True Stress/True Strain Conversion:**
```
σ_true = σ_eng (1 + ε_eng)
ε_true = ln(1 + ε_eng)
```

**Failure Envelope (Historical Silk):**
```
σ_uts ∈ [500, 700] MPa
ε_break ∈ [0.15, 0.25]
E ∈ [8, 12] GPa
```

