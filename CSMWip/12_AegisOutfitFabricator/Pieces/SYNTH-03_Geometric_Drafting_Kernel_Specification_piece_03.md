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
