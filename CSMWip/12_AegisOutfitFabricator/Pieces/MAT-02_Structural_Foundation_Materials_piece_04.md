**Typical Stay Dimensions:**
- Width: 6-8 mm, Thickness: 1.5-2.5 mm
- I ≈ (7 × 2³) / 12 = 4.67 mm⁴ = 4.67×10⁻¹² m⁴
- L ≈ 150 mm = 0.15 m
- P_cr ≈ π² × 4×10⁹ × 4.67×10⁻¹² / 0.15² ≈ 8.2 N per stay

With 20-30 stays per corset: Total buckling resistance ≈ 160-250 N

**Buckling Mode Shapes:**
```
w(x) = A sin(nπx/L)  (n = 1, 2, 3...)
P_cr_n = n² π² E I / L²
```

### 1.5 Viscoelastic Relaxation (Time-Dependent Behavior)
**Prony Series Representation:**
```
E(t) = E_∞ + Σ E_i exp(-t/τ_i)
E_∞ ≈ 2 GPa (long-term modulus)
τ_i ∈ [0.1, 1, 10, 100] s (relaxation times)
```

**Creep Compliance:**
```
J(t) = 1/E_∞ + Σ (1/E_i)(1 - exp(-t/τ_i))
```

## 2. Synthetic Baleen Candidates Comparison

| Property | Historical Baleen | PTFE-Fiberglass | PTFE-Quartz | Para-Aramid + SS |
