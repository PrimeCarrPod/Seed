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

