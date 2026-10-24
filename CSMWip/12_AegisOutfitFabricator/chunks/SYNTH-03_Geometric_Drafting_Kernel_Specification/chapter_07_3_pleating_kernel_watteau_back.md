## 3. Pleating Kernel (Watteau Back + Cartridge)

### 3.1 Watteau Back Pleating (Research Doc 1 §4.2, Lines 53-58)

**Double Box Pleat Geometry:**
```
Target finished width: W_f (across shoulder blades)
Unpleated fabric width: W_u (from pattern)
Compression ratio: 3:1 (planar : finished)

Pleat depth: d = (W_u - W_f) / (2 × N_pleats)
N_pleats = 2 (double box pleat)
d = (W_u - W_f) / 4

Each pleat = two folds (box pleat) = 4 layers at center
```

**Load-Bearing Column Action:**
```
Skirt weight: W_skirt (2-5 kg for silk train)
Shoulder seam anchor: A_shoulder
Gravitational vector distribution:
F_pleat = W_skirt / N_pleats  (per pleat column)
Stress at shoulder: σ_shoulder = F_pleat / A_shoulder
```

**Pleat Geometry Equations:**
```
Pleat fold lines at: x = W_f/2 ± d, x = W_f/2 ± 3d
Fold angles: θ = 90° (sharp fold) or 60° (soft fold)
Fabric consumption per pleat: 2d (each side)
Total consumption: 4d = W_u - W_f ✓
```

### 3.2 Cartridge Pleating S-Curve (Research Doc 1 §6.2, Lines 95-99)

**S-Curve Fold Parameterization:**
```
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

For Watteau back:
N_pleats = 2 (double box), ratio = 3:1
d = (W_u - W_f) / 4

For Cartridge pleating:
N_pleats = variable (typically 20-40 for skirt)
d = (W_skirt_waist - W_bodice_waist) / (2 × N_pleats)
```

### 3.4 Gravitational Vector Distribution

```
Shoulder seam anchors: 2 points (left/right)
Load per anchor: F_anchor = W_skirt / 2
Moment at waist: M_waist = W_skirt × h_skirt_CG
Resisted by: baleen stays (corset) + cartridge pleat threads
```

