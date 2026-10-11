    <path d="..."/>
  </g>
  <g id="GRAINLINE" stroke="cyan" stroke-width="0.1" fill="none">
    <line x1="..." y1="..." x2="..." y2="..." marker-end="url(#arrow)"/>
  </g>
</svg>
```

## 5. Cutting Layout Optimizer

### 5.1 Rectangular Packing on 560mm Width
**Problem Formulation:**
- Container: W = 560mm (fixed), L = variable (minimize)
- Items: Set of 2D pattern pieces P_i (polygons)
- Constraints: No overlap, grain direction, seam allowance clearance

**Guillotine Cutting Constraint:**
All cuts must be straight lines from one edge to opposite edge (guillotine cuts).

### 5.2 Pattern Orientation: Grain Direction Preservation
**Grain Direction Vector (per piece):**
```
g_i = (cos θ_i, sin θ_i)
θ_i ∈ {0°, 90°, 180°, 270°}  (warp/weft alignment)
```

**Orientation Constraints:**
- Main garment pieces: g_i = (1, 0) (warp = vertical)
- Bias pieces: g_i = (cos 45°, sin 45°)
- Cross-grain pieces: g_i = (0, 1) (weft = vertical)
