```
Position t is valid iff t ∉ NFP(A, B) for all placed B
```

**Inner Fit Polygon (IFP) for Container:**
```
IFP = Container ⊖ P_i  (Minkowski difference)
Valid region for piece i's reference point
```

### 3.3 Simulated Annealing for Global Optimization
**State Representation:**
```
S = {(x_i, y_i, θ_i) for i = 1..n}
```

**Neighborhood Moves:**
1. Translate: (x_i, y_i) → (x_i + Δx, y_i + Δy)
2. Rotate: θ_i → θ_i ± 90°
3. Swap: Exchange positions of two pieces
4. Reorder: Change placement sequence

**Energy Function:**
```
E(S) = L(S) + λ₁ × Overlap_Penalty + λ₂ × Grain_Penalty + λ₃ × Clearance_Penalty
Overlap_Penalty = Σ max(0, -penetration_depth)
Grain_Penalty = Σ I(θ_i ∉ allowed)
Clearance_Penalty = Σ max(0, 13mm - min_dist)
```

