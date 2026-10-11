N_pleats = variable (edition dependent)
Compression_Ratio = 3:1 to 5:1
d_cartridge = (CR × W_finished - W_finished) / (2 × N_pleats)
```

### 3.4 Cartridge Fold Geometry (S-Curve Parameterization)
**Fold Centerline:**
```
y(x) = A sin(2πx/λ) + B x
A = d/2
λ = 2 × W_finished / N_pleats
B = (W_waist - W_hip) / (2 × L_skirt)
```

**Fold Angle:**
```
θ(x) = arctan(dy/dx) = arctan(A × 2π/λ × cos(2πx/λ) + B)
```

**Curvature:**
```
κ(x) = |d²y/dx²| / (1 + (dy/dx)²)^(3/2)
d²y/dx² = -A × (2π/λ)² × sin(2πx/λ)
```

## 4. Load Distribution Analysis

### 4.1 Skirt Weight Distribution
**Total Skirt Weight (by edition):**
```
