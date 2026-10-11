## 5. Zero-Waste Nesting Optimizer (from DRAFT-05)

### 5.1 Problem Formulation

**Input** (DRAFT-05 §2):
```
Pattern pieces: P = {p₁, p₂, ..., p_n} (polygons with grain direction)
Container: Rectangle C = [0, 560] × [0, L] (mm)
Constraints:
- Grain alignment: piece warp ∥ container warp (0° or 180° rotation only)
- Seam allowance: 13mm offset (Minkowski sum with 13mm square)
- Notches: 3mm V-notch clearance
- Pattern matching: alignment constraints for repeating motifs
```

**Objective** (DRAFT-05 §2):
```
Minimize L (fabric length) → Maximize yield Y = Σ Area(p_i) / (560 × L)
Target: Y > 0.95 ( <5% waste )
```

### 5.2 Optimization Algorithm

**Bottom-Left Heuristic with Rotation Search** (DRAFT-05 §3):
```
Algorithm:
1. Sort pieces by height descending (largest first)
2. For each piece p_i:
   For rotation r ∈ {0°, 180°}:
     Place at lowest valid y-position (bottom-left)
     Check collision using No-Fit Polygon (NFP)
   Select rotation with lowest y-placement
3. Simulated annealing for global optimization:
   - Temperature schedule: T_k = T₀ / log(1+k)
   - Neighborhood: swap piece order, rotate piece
   - Acceptance: ΔL < 0 or exp(-ΔL/T_k) > random()
   - Iterations: 10,000 per edition
```

**No-Fit Polygon (NFP) for Collision Detection** (DRAFT-05 §3):
```
NFP(p_i, p_j) = { v | p_i translated by v intersects p_j }
= p_j ⊕ (-p_i)  (Minkowski sum with reflection)

