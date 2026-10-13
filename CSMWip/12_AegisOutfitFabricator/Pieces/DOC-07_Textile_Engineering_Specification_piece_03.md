
```
Yield stress evolution: σ_y = σ_y0 + H × ε_p
Initial yield stress: σ_y0 ≈ 0.4 × σ_uts = 200-280 MPa
Hardening modulus: H = 1.5-2.5 GPa [TBD:RESEARCH - exact value]
Plastic strain: ε_p = ε_true - σ_true/E
```

### 2.3 Strain-Rate Sensitivity (MAT-01 §2.3)

```
σ_y(ε̇) = σ_y0 × (1 + C × ln(ε̇/ε̇₀))
Reference strain rate: ε̇₀ = 10⁻³ s⁻¹ (quasi-static)
Strain-rate coefficient: C ≈ 0.05-0.08 for silk fibroin
Impact strain rate: ε̇_impact ≈ 10³ s⁻¹
Dynamic yield increase: 1.35-1.55× static yield
```

### 2.4 Environmental Aging Models (MAT-01 §2.4)

**UV Degradation:**
```
Chain scission rate: k_uv = A × exp(-E_a/RT) × I_uv
E_a ≈ 80-100 kJ/mol [TBD:RESEARCH]
Tensile retention: σ(t) = σ₀ × exp(-k_uv × t)
