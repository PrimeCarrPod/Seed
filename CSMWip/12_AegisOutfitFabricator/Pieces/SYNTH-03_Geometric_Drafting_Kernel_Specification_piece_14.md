  Select rotation with minimal y-advance
```

**No-Fit Polygon (NFP) for Collision Detection:**
```
NFP(pᵢ, pⱼ) = {v | (pᵢ + v) ∩ pⱼ ≠ ∅}
Valid placement: placement_vector ∉ NFP(pᵢ, pⱼ) for all placed pieces
```

**Simulated Annealing for Global Optimization:**
```
Temperature schedule: T₀ = 100, T_final = 0.01, cooling = 0.95
Neighborhood moves: swap pieces, rotate piece, translate piece
Acceptance: ΔE < 0 or exp(-ΔE/T) > random()
```

### 5.4 Offcut Catalog System (Phoenix Protocol Integration)

**Minimum Viable Remnant:** 100mm × 100mm

**Classification by Shape:**
| Class | Shape | Typical Use |
|-------|-------|-------------|
| R | Rectangular | Pockets, tabs, bias strips |
| L | L-shape | Gussets, sleeve caps |
| T | Triangular | Godets, insertions |
| I | Irregular | Appliqué, trim, test samples |

**Reuse Mapping Algorithm:**
```
