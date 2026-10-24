## 2. Nesting

**Packing Efficiency:**
```
$\eta = \frac{\sum A_{\text{parts}}}{A_{\text{sheet}}} \times 100\%$
```
```
$\text{Waste \%} = 100\% - \eta$
```

**Guillotine Cut Constraints:**
```
$\text{Guillotine feasible: } \exists \text{ recursive partitioning}$
```

**Simulated Annealing:**
```
$T(t) = T_0 / (1 + \alpha t)$  (cooling schedule)
```
```
$P(\text{accept}) = \exp(-\Delta E / T)$
```

 Problem Formulation

### 2.1 Mathematical Model
**Decision Variables:**
- Position: (x_i, y_i) for each piece i
- Rotation: θ_i ∈ {0°, 90°, 180°, 270°} (grain-preserving)
- Sequence: Order of placement

**Constraints:**
```
1. No Overlap: P_i(x_i, y_i, θ_i) ∩ P_j(x_j, y_j, θ_j) = ∅  ∀ i≠j
2. Container: 0 ≤ x_i ≤ W - w_i, 0 ≤ y_i ≤ L - h_i
3. Grain Direction: θ_i ∈ {0°, 90°} for main pieces, {45°, 135°} for bias
4. Seam Allowance: Clearance ≥ 13mm between pieces
5. Pattern Matching: Align repeats for printed/brocaded fabrics
```

**Objective Function:**
```
Minimize: L = max(y_i + h_i) over all i
Subject to: Constraints 1-5
Equivalent: Maximize η = Σ Area(P_i) / (W × L)
```

### 2.2 Polygon Representation
**Pattern Piece as Polygon:**
```
P_i = {v_1, v_2, ..., v_n}  (vertices in CCW order)
Area(P_i) = ½ |Σ (x_k y_{k+1} - x_{k+1} y_k)|
Centroid: C_i = (1/6A) Σ (v_k + v_{k+1}) × (x_k y_{k+1} - x_{k+1} y_k)
```

**Bounding Box (for fast rejection):**
```
BB_i = [x_min, x_max] × [y_min, y_max]
w_i = x_max - x_min, h_i = y_max - y_min
```

