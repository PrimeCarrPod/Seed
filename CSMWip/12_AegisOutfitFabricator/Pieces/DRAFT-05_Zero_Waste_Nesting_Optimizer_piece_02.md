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

## 3. Optimization Algorithm

### 3.1 Bottom-Left Heuristic with Rotation Search
**Algorithm:**
```
