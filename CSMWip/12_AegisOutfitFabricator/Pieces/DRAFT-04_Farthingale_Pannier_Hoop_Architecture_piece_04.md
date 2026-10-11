## 3. Tape Suspension System (Catenary)

### 3.1 Catenary Curve Equation
```
y(x) = a cosh(x/a),  a = H / w
```
Where:
- H = horizontal tension in tape
- w = weight per unit length = W_skirt / (N_tapes × L_tape)
- L_tape = vertical tape length

### 3.2 Tape Tension Distribution
**Ideal Equal Sharing (N tapes):**
```
T_ideal = W_skirt / N
```

**Actual Distribution (Friction + Geometry):**
```
T_i = T_ideal × (1 + μ × θ_i + ΔL_i / L)
μ = friction coefficient at waistband ≈ 0.1-0.2
θ_i = contact angle at waistband
ΔL_i = length variation due to hoop ellipticity
```

**Tension at Waistband (Maximum):**
```
T_waist = T_ideal × cosh(L/2a)
```

