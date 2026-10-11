For RW-TG: W=8kg, N=16, L=1000mm → w = 4.9 N/m
Target sag at mid-span: δ = a·cosh(L/2a) - a ≈ 50mm
Solving: a ≈ L²/(8δ) = 1²/(8×0.05) = 2.5m
H = a·w = 2.5 × 4.9 ≈ 12.25 N
```

**Tension Distribution** (DRAFT-04 §3):
```
At waistband (x=0): T_waist = H·cosh(L/2a) ≈ 12.25 × cosh(0.2) ≈ 12.5 N
At hem (x=L/2): T_hem = H = 12.25 N
Max tension variation: <3% (nearly uniform)

Friction at waistband: μ ≈ 0.3 (cotton on silk)
Effective tension reduction: T_eff = T_waist · e^(-μ·θ)
θ = wrap angle ≈ π/2 → T_eff ≈ 12.5 × e^(-0.3×1.57) ≈ 7.9 N
```

### 2.3 Deployment Kinematics & Locking

**Spring Energy Storage** (DRAFT-04 §4):
```
Hoop material: Spring steel 17-7 PH, E = 200 GPa
Collapsed radius: r_collapsed ≈ 25mm (storage)
Expanded radius: r_expanded = a_i (per edition)

Strain energy per hoop: U = ½·k·x²
Bending stiffness: k = E·I / L³ (L = hoop length)
For hoop 4 (RW-TG): I = I_x = 1.52×10⁻² m⁴, L = 3.5m
k ≈ 200×10⁹ × 1.52×10⁻² / 3.5³ ≈ 7.1×10⁵ N·m/rad

Deployment angle: θ = π (180° unfurling)
U = ½ × 7.1×10⁵ × π² ≈ 3.5 J per hoop
Total (5 hoops): U_total ≈ 17.5 J
```

**Deployment Dynamics** (DRAFT-04 §4):
```
