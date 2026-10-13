Cartridge pleat centerline:
y(x) = A · sin(2πx/λ) + B · x

Where:
A = fold amplitude = pleat_depth / 2
λ = fold wavelength = 2 × pleat_depth
B = waistband slope (typically 0 for horizontal)
```

**Perpendicular Force Alignment:**
```
Fold normal at waistband: n = (0, -1)  (perpendicular to waistband)
Gravitational force: F_g = (0, -m·g)
Force per pleat thread: T = |F_g| / N_pleats
```

**Stress Diffusion at Waistband:**
```
Stress concentration factor at fold apex: K_t ≈ 2-3
Beeswax-coated linen thread capacity (Research Doc 1 §6.1):
σ_thread_max ≈ 300 MPa, A_thread ≈ 0.5 mm²
Max thread force: F_max = σ_thread_max × A_thread ≈ 150 N
Required: T × K_t < F_max  →  N_pleats > W_skirt × K_t / F_max
```

### 3.3 Pleat Depth Calculation

```
General formula:
d = (W_unpleated - W_target) / (2 × N_pleats)
