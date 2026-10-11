
**True Stress/True Strain Conversion:**
```
σ_true = σ_eng × (1 + ε_eng)
ε_true = ln(1 + ε_eng)
```

**Failure Envelope (Historical Degummed Silk):**
```
σ_uts ∈ [500, 700] MPa
ε_break ∈ [0.15, 0.25]
E ∈ [8, 12] GPa
```

### 2.2 Elasto-Plastic Model with Isotropic Hardening

From Research Doc 1 §2.1, Line 16:
```
σ_y = f(ε_p) = σ_y0 + H × ε_p
```
Where:
- σ_y = yield stress
- ε_p = plastic strain
- H = hardening modulus (silk-specific, TBD:RESEARCH)
- σ_y0 = initial yield stress ≈ 0.4 × σ_uts

### 2.3 Strain-Rate Sensitivity

From Research Doc 1 §2.1, Line 16 and Research Doc 2 §5:
```
σ_y(ε̇) = σ_y0 × (1 + C × ln(ε̇/ε̇₀))
