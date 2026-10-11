
### 5.3 Marker Efficiency Target
```
Efficiency η = (Σ Area(P_i)) / (W × L) × 100%
Target: η > 85%
```

**Waste Calculation:**
```
Waste = W × L - Σ Area(P_i) - Σ Area(offcuts)
Waste % = Waste / (W × L) × 100%
Target: <5%
```

### 5.4 Nesting Algorithm Details (Bottom-Left Heuristic)
**Bottom-Left Placement:**
```
For each piece P_i (sorted by area descending):
  For each valid position (x, y) on grid:
    Place P_i at lowest y, then leftmost x
    Check: no overlap with placed pieces
    Check: grain direction constraint satisfied
    Check: within 560mm width
```

**Rotation Search (4 orientations):**
```
θ ∈ {0°, 90°, 180°, 270°}
For each θ: compute bounding box, test placement
Select orientation with best local efficiency
