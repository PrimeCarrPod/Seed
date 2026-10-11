
### 3.2 Cartridge Pleating (S-Curve Volumetric Compression)

**S-Curve Fold Geometry** (Research Doc 1 §6.2; DRAFT-03 §2; SYNTH-03 §3.2):
```
Cartridge pleat centerline: y(x) = A·sin(2πx/λ) + B·x
Where:
  A = fold amplitude = pleat depth / 2
  λ = fold wavelength = 2 × pleat depth
  B = axial progression = W_finished / N_pleats

Fold geometry: Figure-eight (S-curve) with perpendicular force alignment
Each fold: two lobes, forces perpendicular to waistband
```

**Pleat Depth & Fabric Consumption** (DRAFT-03 §2):
```
For N_pleats cartridge pleats around waist:
W_finished = waist circumference (edition-specific)
W_unpleated = skirt panel width
d = (W_unpleated - W_finished) / (2 × N_pleats)

Typical values:
RW-TS: W_finished = 71cm, N_pleats = 24 → d ≈ 15mm, W_unpleated ≈ 2.8m
RW-TG: W_finished = 101cm, N_pleats = 32 → d ≈ 18mm, W_unpleated ≈ 3.5m
```

**Load Distribution & Stress Diffusion** (DRAFT-03 §3; SYNTH-03 §3.3):
```
Skirt weight W_skirt → N_pleats threads
Tension per thread: T = W_skirt / N_pleats

Stress concentration at fold apex: K_t ≈ 2.5 (finite element, DRAFT-03)
Beeswax-coated linen thread capacity (Research Doc 1 §6.1):
σ_thread = 400-600 MPa, A_thread = π(0.4mm)²/2 ≈ 0.25 mm²
F_max = σ_thread × A_thread ≈ 100-150 N per thread

Safety factor: SF = N_pleats × F_max / W_skirt ≥ 3.0 (target)
```

### 3.3 Beeswax Thread Integration

**Historical Thread Specification** (Research Doc 1 §6.1; Research Doc 2 §3.3):
```
