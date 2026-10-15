## 8. Edition-Specific Formulas

### 8.1 FSS Unit Cell Scaling

```
f_res = c / (2 × L_eff × √ε_eff)
L_eff = Hilbert length per unit cell (scaling with edition panel size)
ε_eff = (ε_r + 1)/2 ≈ 2.1 (air/silk effective)
```

### 8.2 Faraday Cage SE (N-Layer)

```
SE_total = Σ SE_i - 6(N-1)  (conservative coupling penalty)
SE_i = 20 log₁₀ |(Z_w + Z_s)² / (4 Z_w Z_s)|  (single layer)
Z_w = 377 Ω (free space), Z_s = √(jωμ/σ) (sheet impedance)
```

### 8.3 GIC Current Shunt Ratio

```
I_shunt / I_total = R_BFRP / (R_BFRP + R_shunt)
R_shunt = L_path / (σ_thread × A_cross)
A_cross = N_stitches × π × (d_thread/2)²
N_stitches = stitch_density × perimeter
```

### 8.4 BFRP Dielectric Time Constant

```
τ_dielectric = ε × ρ = 4.2 × 8.85×10⁻¹² × 10¹⁴ = 3.7 s
>> E3 pulse (1 s) → BFRP acts as open circuit for GIC
<< E1 pulse (1 ns) → Displacement current dominates
```

### 8.5 MXene Coating Thickness Optimization

```
t_opt = δ_skin = √(2 / (ωμσ))
@ 1 GHz: δ = √(2 / (2π×10⁹ × 4π×10⁻⁷ × 1.5×10⁷)) = 1.3 μm
@ 10 GHz: δ = 0.4 μm
Selected: 50-100 nm (<< δ_skin, full penetration, conformal)
```

---
