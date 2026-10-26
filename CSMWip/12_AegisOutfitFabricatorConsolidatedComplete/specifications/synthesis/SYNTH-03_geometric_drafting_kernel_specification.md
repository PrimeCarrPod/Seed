# SYNTH-03: Geometric Drafting Kernel Specification


## AegisOutfitFabricator Research Synthesis Document 3



## 1. Alcega Developable Surface Engine

### 1.1 Historical Foundation (Research Doc 1 §4.1, Lines 45-51)

Juan de Alcega 1589: *Libro de Geometría, Práctica y Traça* established the mathematical foundation for zero-waste pattern drafting on standard rectangular loom widths. The standard silk loom width for 18th century silks was 22 inches (560mm).

**Alcega's Core Algorithm:**
```
1. Define directrix curves from body landmarks
2. Compute generatrix rulings (tangent planes to directrices)
3. Intersect with 560mm loom width planes
4. Output flat pattern pieces with grain lines
```

### 1.2 Directrix Curve Definition

**Anthropometric Landmarks → Parametric Curves:**

| Landmark | Measurement | Curve Parameter |
|----------|-------------|-----------------|
| Nape center | Nape-to-waist length | u = 0 |
| Shoulder point | Shoulder slope angle | u = 0.25 |
| Bust apex | Bust circumference / 4 | u = 0.5 |
| Waist point | Waist circumference / 4 | u = 0.75 |
| Hip point | Hip circumference / 4 | u = 1.0 |

**Directrix Curve Formulation:**
```
D₁(u) = (x₁(u), y₁(u), z₁(u))  -- Front bodice directrix
D₂(u) = (x₂(u), y₂(u), z₂(u))  -- Back bodice directrix

Where each is a cubic B-spline through landmarks:
D(u) = Σᵢ Nᵢ,₃(u) · Pᵢ  (N = basis functions, P = control points)
```

### 1.3 Generatrix Ruling Construction

**Developable Surface Generation:**
```
A plane moving in space, tangent to two directrix curves, generates a developable surface.
The segment determined by the points of tangency constitutes the generatrix.

S(u,v) = D₁(u) + v × (D₂(u) - D₁(u)) / |D₂(u) - D₁(u)|
Where v ∈ [0, 1] parameterizes along the ruling.
```

**Gaussian Curvature Constraint (Zero for Developable):**
```
K = det(II) / det(I) = 0
Where I = first fundamental form, II = second fundamental form
This requires: (Sᵤ × Sᵥ) · Sᵤᵥ = 0
```

### 1.4 Osculating Circle Tangent Calculation (Bodice Suppression)

For extreme bodily suppression (corsetry), the zero-curvature direction gives the bodice panel boundaries:

```
Osculating circle at parameter u:
C(u) = D(u) + (1/κ(u)) · N(u)
Where κ = curvature, N = principal normal

Tangent direction (zero curvature):
T_zero = D'(u) / |D'(u)|  at inflection points where κ(u) = 0
```

**Bodice Suppression Curve:**
```
Suppression depth δ = (bust_circ - waist_circ) / (4π)
Panel boundary = directrix projected along T_zero by distance δ
```

### 1.5 Loom Width Constraint Enforcement (560mm)

**Rectangular Packing with Grain Alignment:**
```
Container: 560mm (width) × L (variable length)
Pattern pieces: polygons with grain direction vector gᵢ
Constraint: gᵢ · (1, 0) = ±1  (grain parallel to selvage)
```

**Zero-Waste Nesting Algorithm:**
```
1. Sort pieces by height descending
2. Bottom-left placement with 4 rotations (0°, 90°, 180°, 270°)
3. No-fit polygon (NFP) collision detection
4. Simulated annealing for global optimization
5. Target: >85% marker efficiency, <5% waste
```

### 1.6 DXF/SVG Output Specification

| Layer | Purpose | Color | Line Type |
|-------|---------|-------|-----------|
| CUT | Cutting lines | Red | Continuous |
| FOLD | Fold lines | Blue | Dashed |
| NOTCH | Match points | Green | Dash-dot |
| GRAINLINE | Grain direction | Magenta | Phantom |
| LABEL | Piece identification | Black | Continuous |

**Units:** mm, Precision: 0.01mm
**Seam Allowance:** 13mm default (Ssa-1 per ASTM D1683), configurable
**Notches:** 3mm V-notch at match points


## 1. Alcega Developable Surface

**Surface Parametrization:**
```
$\mathbf{S}(u,v) = \sum_{i=0}^n \sum_{j=0}^m N_{i,p}(u) N_{j,q}(v) \mathbf{P}_{ij}$  (NURBS)
```
```
$N_{i,0}(u) = \begin{cases} 1 & u_i \le u < u_{i+1} \\ 0 & \text{otherwise} \end{cases}$
```
```
$N_{i,p}(u) = \frac{u-u_i}{u_{i+p}-u_i} N_{i,p-1}(u) + \frac{u_{i+p+1}-u}{u_{i+p+1}-u_{i+1}} N_{i+1,p-1}(u)$
```

**Gaussian Curvature:**
```
$K = \frac{LN - M^2}{EG - F^2}$
```

**Flattening (Developable Approximation):**
```
$\min_{\phi} \int_\Omega ||\nabla\phi - \mathbf{I}||^2 dA$  (isometric mapping)
```

 Engine

### 1.1 Historical Foundation (Research Doc 1 §4.1, Lines 45-51)

Juan de Alcega 1589: *Libro de Geometría, Práctica y Traça* established the mathematical foundation for zero-waste pattern drafting on standard rectangular loom widths. The standard silk loom width for 18th century silks was 22 inches (560mm).

**Alcega's Core Algorithm:**
```
1. Define directrix curves from body landmarks
2. Compute generatrix rulings (tangent planes to directrices)
3. Intersect with 560mm loom width planes
4. Output flat pattern pieces with grain lines
```

### 1.2 Directrix Curve Definition

**Anthropometric Landmarks → Parametric Curves:**

| Landmark | Measurement | Curve Parameter |
|----------|-------------|-----------------|
| Nape center | Nape-to-waist length | u = 0 |
| Shoulder point | Shoulder slope angle | u = 0.25 |
| Bust apex | Bust circumference / 4 | u = 0.5 |
| Waist point | Waist circumference / 4 | u = 0.75 |
| Hip point | Hip circumference / 4 | u = 1.0 |

**Directrix Curve Formulation:**
```
D₁(u) = (x₁(u), y₁(u), z₁(u))  -- Front bodice directrix
D₂(u) = (x₂(u), y₂(u), z₂(u))  -- Back bodice directrix

Where each is a cubic B-spline through landmarks:
D(u) = Σᵢ Nᵢ,₃(u) · Pᵢ  (N = basis functions, P = control points)
```

### 1.3 Generatrix Ruling Construction

**Developable Surface

**Surface Parametrization:**
```
$\mathbf{S}(u,v) = \sum_{i=0}^n \sum_{j=0}^m N_{i,p}(u) N_{j,q}(v) \mathbf{P}_{ij}$  (NURBS)
```
```
$N_{i,0}(u) = \begin{cases} 1 & u_i \le u < u_{i+1} \\ 0 & \text{otherwise} \end{cases}$
```
```
$N_{i,p}(u) = \frac{u-u_i}{u_{i+p}-u_i} N_{i,p-1}(u) + \frac{u_{i+p+1}-u}{u_{i+p+1}-u_{i+1}} N_{i+1,p-1}(u)$
```

**Gaussian Curvature:**
```
$K = \frac{LN - M^2}{EG - F^2}$
```

**Flattening (Developable Approximation):**
```
$\min_{\phi} \int_\Omega ||\nabla\phi - \mathbf{I}||^2 dA$  (isometric mapping)
```

 Generation:**
```
A plane moving in space, tangent to two directrix curves, generates a developable surface.
The segment determined by the points of tangency constitutes the generatrix.

S(u,v) = D₁(u) + v × (D₂(u) - D₁(u)) / |D₂(u) - D₁(u)|
Where v ∈ [0, 1] parameterizes along the ruling.
```

**Gaussian Curvature Constraint (Zero for Developable):**
```
K = det(II) / det(I) = 0
Where I = first fundamental form, II = second fundamental form
This requires: (Sᵤ × Sᵥ) · Sᵤᵥ = 0
```

### 1.4 Osculating Circle Tangent Calculation (Bodice Suppression)

For extreme bodily suppression (corsetry), the zero-curvature direction gives the bodice panel boundaries:

```
Osculating circle at parameter u:
C(u) = D(u) + (1/κ(u)) · N(u)
Where κ = curvature, N = principal normal

Tangent direction (zero curvature):
T_zero = D'(u) / |D'(u)|  at inflection points where κ(u) = 0
```

**Bodice Suppression Curve:**
```
Suppression depth δ = (bust_circ - waist_circ) / (4π)
Panel boundary = directrix projected along T_zero by distance δ
```

### 1.5 Loom Width Constraint Enforcement (560mm)

**Rectangular Packing with Grain Alignment:**
```
Container: 560mm (width) × L (variable length)
Pattern pieces: polygons with grain direction vector gᵢ
Constraint: gᵢ · (1, 0) = ±1  (grain parallel to selvage)
```

**Zero-Waste Nesting Algorithm:**
```
1. Sort pieces by height descending
2. Bottom-left placement with 4 rotations (0°, 90°, 180°, 270°)
3. No-fit polygon (NFP) collision detection
4. Simulated annealing for global optimization
5. Target: >85% marker efficiency, <5% waste
```

### 1.6 DXF/SVG Output Specification

| Layer | Purpose | Color | Line Type |
|-------|---------|-------|-----------|
| CUT | Cutting lines | Red | Continuous |
| FOLD | Fold lines | Blue | Dashed |
| NOTCH | Match points | Green | Dash-dot |
| GRAINLINE | Grain direction | Magenta | Phantom |
| LABEL | Piece identification | Black | Continuous |

**Units:** mm, Precision: 0.01mm
**Seam Allowance:** 13mm default (Ssa-1 per ASTM D1683), configurable
**Notches:** 3mm V-notch at match points



## 2. Garsault Proportional Scaling System

### 2.1 Historical Foundation (Research Doc 1 §4.1, Lines 51-52)

François-Alexandre de Garsault 1769: *L'Art du Tailleur* introduced proportional measurement systems utilizing scaled paper strips, creating dynamic algorithms that scaled automatically to individual anthropometrics.

### 2.2 Anthropometric Measurement System

**Primary Measurements (8+):**
```
1. Bust circumference (B)
2. Waist circumference (W)
3. Hip circumference (H)
4. Nape-to-waist length (NW)
5. Shoulder slope angle (SS)
6. Back width (BW)
7. Armhole depth (AH)
8. Bicep circumference (Bi)
9. Wrist circumference (Wr)
10. Neck circumference (Nk)
```

**18th Century Ideal Proportional Ratios:**
```
B : W : H ≈ 10 : 7 : 9.5
NW ≈ 0.18 × height
SS ≈ 15-20° from horizontal
```

### 2.3 Dynamic Scaling Algorithms

**Base Size → Target Size Transformation:**
```
Scale matrix S = diag(s_x, s_y, s_z) + non-linear corrections

Horizontal scaling: s_x = B_target / B_base
Vertical scaling: s_y = NW_target / NW_base
Ease factors: e_bust = 4-6cm, e_waist = 2-3cm, e_hip = 4-6cm
```

**Non-Uniform Scaling per Panel:**
```
Front bodice:  s_x = (B_target + e_bust) / (B_base + e_bust)
Back bodice:   s_x = (B_target + e_bust) / (B_base + e_bust)  (same)
Side panel:    s_x = (W_target + e_waist) / (W_base + e_waist)
Skirt panel:   s_x = (H_target + e_hip) / (H_base + e_hip)
```

**Grade Rules per 2cm Size Increment:**
```
Bust:  +2cm → all horizontal dims +0.5cm
Waist: +2cm → waist horizontal +0.5cm
Hip:   +2cm → hip horizontal +0.5cm
Length: +1cm → all vertical dims +0.25cm
```

### 2.4 Edition-Specific Patterns (8 Editions)

| Edition | Morphology | Size Range | Scaling Factor | Notes |
|---------|------------|------------|----------------|-------|
| RM-TS | RenaissanceMan Tall-Skinny | 32-36 bust | 0.90-0.95 | Petite |
| RM-TG | RenaissanceMan Tall-Gordo | 38-42 bust | 1.00-1.05 | Standard |
| RM-SS | RenaissanceMan Short-Skinny | 30-34 bust | 0.85-0.90 | Small structure |
| RM-SG | RenaissanceMan Short-Gordo | 40-44 bust | 1.05-1.10 | Large structure |
| RW-TS | RenaissanceWoMan Tall-Skinny | 32-36 bust | 0.90-0.95 | Petite |
| RW-TG | RenaissanceWoMan Tall-Gordo | 38-42 bust | 1.00-1.05 | Standard |
| RW-SS | RenaissanceWoMan Short-Skinny | 30-34 bust | 0.85-0.90 | Small structure |
| RW-SG | RenaissanceWoMan Short-Gordo | 40-44 bust | 1.05-1.10 | Large structure |

**LES 12-Zone → Historical Lacing Point Mapping:**

| LES Zone | Historical Lacing Point | Tension Range |
|----------|------------------------|---------------|
| 1 Shoulders | Shoulder seam | 15-25 N |
| 2 Chest | Bodice front lacing | 20-40 N |
| 3 Waist | Waistband/cartridge pleats | 30-60 N |
| 4 Hips | Farthingale tapes | 20-40 N |
| 5 Thighs | Pannier hoops | 15-25 N |
| 6 Calves | Skirt hem weight | 10-20 N |
| 7 Upper Arms | Sleeve cap easing | 10-20 N |
| 8 Forearms | Sleeve cuff | 5-15 N |
| 9-12 | Additional corset channels | 10-30 N |

### 2.5 Continuous Adaptation Algorithm

```
For target measurements M_target and base pattern P_base:
1. Compute scale factors per panel: s_i = f(M_target, M_base, ease_i)
2. Apply affine transform with non-linear curvature correction:
   P_target = S · P_base + Δ_curvature
3. Δ_curvature computed from osculating circle analysis
4. Verify: seam lengths match within 0.5mm tolerance
5. Output edition-specific DXF/SVG
```


## 2. Garsault Proportional Scaling System

### 2.1 Historical Foundation (Research Doc 1 §4.1, Lines 51-52)

François-Alexandre de Garsault 1769: *L'Art du Tailleur* introduced proportional measurement systems utilizing scaled paper strips, creating dynamic algorithms that scaled automatically to individual anthropometrics.

### 2.2 Anthropometric Measurement System

**Primary Measurements (8+):**
```
1. Bust circumference (B)
2. Waist circumference (W)
3. Hip circumference (H)
4. Nape-to-waist length (NW)
5. Shoulder slope angle (SS)
6. Back width (BW)
7. Armhole depth (AH)
8. Bicep circumference (Bi)
9. Wrist circumference (Wr)
10. Neck circumference (Nk)
```

**18th Century Ideal Proportional Ratios:**
```
B : W : H ≈ 10 : 7 : 9.5
NW ≈ 0.18 × height
SS ≈ 15-20° from horizontal
```

### 2.3 Dynamic Scaling Algorithms

**Base Size → Target Size Transformation:**
```
Scale matrix S = diag(s_x, s_y, s_z) + non-linear corrections

Horizontal scaling: s_x = B_target / B_base
Vertical scaling: s_y = NW_target / NW_base
Ease factors: e_bust = 4-6cm, e_waist = 2-3cm, e_hip = 4-6cm
```

**Non-Uniform Scaling per Panel:**
```
Front bodice:  s_x = (B_target + e_bust) / (B_base + e_bust)
Back bodice:   s_x = (B_target + e_bust) / (B_base + e_bust)  (same)
Side panel:    s_x = (W_target + e_waist) / (W_base + e_waist)
Skirt panel:   s_x = (H_target + e_hip) / (H_base + e_hip)
```

**Grade Rules per 2cm Size Increment:**
```
Bust:  +2cm → all horizontal dims +0.5cm
Waist: +2cm → waist horizontal +0.5cm
Hip:   +2cm → hip horizontal +0.5cm
Length: +1cm → all vertical dims +0.25cm
```

### 2.4 Edition-Specific Patterns (8 Editions)

| Edition | Morphology | Size Range | Scaling Factor | Notes |
|---------|------------|------------|----------------|-------|
| RM-TS | RenaissanceMan Tall-Skinny | 32-36 bust | 0.90-0.95 | Petite |
| RM-TG | RenaissanceMan Tall-Gordo | 38-42 bust | 1.00-1.05 | Standard |
| RM-SS | RenaissanceMan Short-Skinny | 30-34 bust | 0.85-0.90 | Small structure |
| RM-SG | RenaissanceMan Short-Gordo | 40-44 bust | 1.05-1.10 | Large structure |
| RW-TS | RenaissanceWoMan Tall-Skinny | 32-36 bust | 0.90-0.95 | Petite |
| RW-TG | RenaissanceWoMan Tall-Gordo | 38-42 bust | 1.00-1.05 | Standard |
| RW-SS | RenaissanceWoMan Short-Skinny | 30-34 bust | 0.85-0.90 | Small structure |
| RW-SG | RenaissanceWoMan Short-Gordo | 40-44 bust | 1.05-1.10 | Large structure |

**LES 12-Zone → Historical Lacing Point Mapping:**

| LES Zone | Historical Lacing Point | Tension Range |
|----------|------------------------|---------------|
| 1 Shoulders | Shoulder seam | 15-25 N |
| 2 Chest | Bodice front lacing | 20-40 N |
| 3 Waist | Waistband/cartridge pleats | 30-60 N |
| 4 Hips | Farthingale tapes | 20-40 N |
| 5 Thighs | Pannier hoops | 15-25 N |
| 6 Calves | Skirt hem weight | 10-20 N |
| 7 Upper Arms | Sleeve cap easing | 10-20 N |
| 8 Forearms | Sleeve cuff | 5-15 N |
| 9-12 | Additional corset channels | 10-30 N |

### 2.5 Continuous Adaptation Algorithm

```
For target measurements M_target and base pattern P_base:
1. Compute scale factors per panel: s_i = f(M_target, M_base, ease_i)
2. Apply affine transform with non-linear curvature correction:
   P_target = S · P_base + Δ_curvature
3. Δ_curvature computed from osculating circle analysis
4. Verify: seam lengths match within 0.5mm tolerance
5. Output edition-specific DXF/SVG
```



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






## 10. Traceability Matrix — SYNTH-03

| Section | Source | Key Values |
|---------|--------|------------|
| 1.1 Surface Parametrization | SYNTH-01 §3 | NURBS $\mathbf{S}(u,v)$ |
| 2.1 Gaussian Curvature | Research Doc 1 §4 | $K = (LN-M^2)/(EG-F^2)$ |
| 3.1 Flattening Kernel | Alcega 1589 | Harmonic map |
| 4.1 Pleating Kernel | Garsault 1769 | $\theta = 2\arctan(h/(w/2))$ |
| 5.1 Garsault Scaling | Research Doc 1 §5.2 | $D = k \cdot C$ |
| 6.1 Farthingale Hoop | SYNTH-03 §4 | $\sigma_h = pr/t$ |
| 7.1 Nesting Optimizer | SYNTH-03 §5 | $\eta = \sum A_{\text{parts}}/A_{\text{sheet}}$ |
| 8.1 Zero-Waste | Research Doc 2 §7 | Simulated annealing |

