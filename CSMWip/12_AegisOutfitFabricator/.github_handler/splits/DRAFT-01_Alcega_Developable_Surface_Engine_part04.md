```
I_3D = E du² + 2F du dv + G dv²
I_2D = du² + dv²  (after unfolding)
```

**Unfolding via Geodesic Polar Coordinates:**
```
p(u,v) = ( ∫₀ᵛ √G(u,0) dv', ∫₀ᵘ √E(u',0) du' )
```
For developable surfaces: √(EG - F²) = √G(u,0) (metric preservation)

**Discrete Unfolding (Triangle Mesh):**
```
For each triangle: preserve edge lengths
Angle defect at vertices: Σ θ_i = 2π - K_G × A ≈ 2π
```

## 4. DXF/SVG Output Specification

### 4.1 Layer Structure
| Layer Name | Color | Linetype | Description |
|------------|-------|----------|-------------|
| CUT | Red (1) | Continuous | Cutting lines |
| FOLD | Yellow (2) | Dashed | Fold lines |
| NOTCH | Green (3) | Continuous | 3mm V-notches at match points |
| GRAINLINE | Cyan (4) | Center | Grain direction arrows |
| LABEL | Magenta (6) | Continuous | Piece labels, size, edition |
| SEAM_ALLOWANCE | Blue (5) | Phantom | 13mm offset from CUT |
| CONSTRUCTION | White (7) | Construction | Internal construction lines |

