Input: Pieces P = {P_1, ..., P_n}, Container width W
Sort P by area descending (largest first)
For each piece P_i in sorted order:
  For each rotation θ ∈ {0°, 90°, 180°, 270°}:
    Compute rotated polygon P_i(θ)
    For y from 0 to L_current step Δy:
      For x from 0 to W - w_i(θ) step Δx:
        If feasible(P_i(θ), x, y):
          Place at lowest y, then leftmost x
          Break
  Select best rotation (minimizes local height increase)
```

**Feasibility Test:**
```
feasible(P_i, x, y):
  1. BB check: no overlap with placed pieces' BBs
  2. Polygon overlap: Separating Axis Theorem (SAT)
  3. Grain constraint: θ ∈ allowed_orientations(i)
  4. Clearance: min_dist > 13mm
```

### 3.2 No-Fit Polygon (NFP) for Collision Detection
**NFP Definition:**
```
NFP(A, B) = {t | A ∩ (B + t) ≠ ∅}
          = A ⊕ (-B)  (Minkowski sum)
```

**Placement Validity:**
