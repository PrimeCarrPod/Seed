## 2. Cartridge Pleating S-Curve (Research Doc 1 §6.2, Lines 95-99)

### 2.1 Extreme Volumetric Compression
Cartridge pleating achieves extreme compression via S-curve

**S-Curve Parametrization:**
```
$y(x) = A \sin\left(\frac{2\pi x}{\lambda}\right) + B x$
```
```
$\text{Curvature: } \kappa(x) = \frac{|y''|}{(1 + y'^2)^{3/2}}$
```

 folds:
- S-curve

**S-Curve Parametrization:**
```
$y(x) = A \sin\left(\frac{2\pi x}{\lambda}\right) + B x$
```
```
$\text{Curvature: } \kappa(x) = \frac{|y''|}{(1 + y'^2)^{3/2}}$
```

 folds (figures of eight)
- Perpendicular alignment to waistband
- Gravitational force distribution across structural threads

### 2.2 S-Curve Fold Geometry
**Fold Centerline Parametrization:**
```
y(x) = A sin(2πx/λ) + B x
```
Where:
- A = amplitude (pleat depth / 2)
- λ = wavelength (2 × pleat width)
- B = linear taper term (for waist shaping)

**S-Curve Parameters:**
```
Pleat depth: d = (W_unpleated - W_finished) / (2 × N_pleats)
N_pleats = variable (typically 20-40 for cartridge)
λ = 2 × (W_finished / N_pleats)
A = d / 2
B = (W_waist - W_hip) / (2L)  (taper)
```

**Fold Surface (3D):**
```
S(u,v) = (u, y(u) + v × cos(θ(u)), v × sin(θ(u)))
θ(u) = arctan(dy/du)  (fold angle)
v ∈ [-d/2, d/2]  (through thickness)
```

### 2.3 Perpendicular Alignment to Waistband
**Constraint:**
```
Fold lines ⟂ waistband at attachment points
∇y(x_attach) · tangent_waistband = 0
```

**Waistband Interface:**
```
N_pleats equally spaced along waistband length L_wb
Spacing: s = L_wb / N_pleats
Attachment: each pleat stitched at 2 points (top/bottom of waistband)
```

### 2.4 Stress Diffusion at Waistband Juncture
**Force Distribution:**
```
Total skirt weight: W_skirt
Vertical component per pleat: F_v = W_skirt / N_pleats
Horizontal component: F_h = F_v × tan(θ_max)
θ_max = max fold angle ≈ 60-75°
```

**Beeswax-Coated Linen Thread Capacity (Research Doc 1 §6.1):**
```
Thread tensile: σ_thread ≈ 500-800 MPa
Thread diameter: d_thread ≈ 0.5-0.8 mm
Thread area: A = πd²/4 ≈ 0.2-0.5 mm²
Force capacity: F_max = σ_thread × A ≈ 100-400 N
SF = F_max / F_v > 3 (target)
```

