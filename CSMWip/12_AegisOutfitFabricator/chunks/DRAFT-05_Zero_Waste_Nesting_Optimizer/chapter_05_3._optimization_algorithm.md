## 3. Optimization Algorithm

### 3.1 Bottom-Left Heuristic with Rotation Search
**Algorithm:**
```
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

**Annealing Schedule:**
```
T_0 = 1000, T_f = 0.1
T_{k+1} = α × T_k, α = 0.95
Iterations per T: 100 × n
Acceptance: P = exp(-ΔE/T) if ΔE > 0
```

### 3.4 Genetic Algorithm Alternative
**Chromosome Encoding:**
```
Gene i = (x_i, y_i, θ_i, order_i)
```

**Fitness Function:**
```
Fitness = 1 / (1 + E(S))
```

**Operators:**
- Crossover: Order-based (OX) for sequence, blend for positions
- Mutation: Random position/rotation change
- Selection: Tournament (size 3)
