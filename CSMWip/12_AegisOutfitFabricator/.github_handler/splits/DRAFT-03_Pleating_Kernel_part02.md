A_anchor = cross-sectional area of shoulder seam
Target: σ_shoulder < σ_uts_silk / SF (SF=3)
```

## 2. Cartridge Pleating S-Curve (Research Doc 1 §6.2, Lines 95-99)

### 2.1 Extreme Volumetric Compression
Cartridge pleating achieves extreme compression via S-curve folds:
- S-curve folds (figures of eight)
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
