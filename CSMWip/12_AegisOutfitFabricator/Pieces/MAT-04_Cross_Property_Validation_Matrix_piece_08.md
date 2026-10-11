| Knee | 0-140° flexion | Walking, stairs, crouching |
| Ankle | 20° DF, 50° PF | Walking, balance |

### 4.2 Ceramic Tile Articulation
**Tile Overlap Design:**
```
Tile gap at joint: g = 2-3 mm (allows 15-20° bending before contact)
Overlap pattern: imbricated (scale-like) for multi-directional flexion
Tile count per joint zone: 6-12 tiles (scales with edition)
```

**Bending Stiffness (Ceramic + Fabric Composite):**
```
D = E_ceramic × t³ / 12(1-ν²) + E_fabric × t_f³ / 12(1-ν²)
For 4mm ceramic + 2mm fabric: D ≈ 200-500 N·m
Moment for 15° bend over 100mm: M = D × κ = D × (0.26 rad / 0.1m) ≈ 500-1300 N·mm
Torque at shoulder/elbow: well within human capability (<10 Nm)
```

**Tile Contact Mechanics:**
```
Contact pressure: p = E* δ / (π a)
a = √(R δ)  (Hertz contact radius)
R = tile radius of curvature ≈ 50-100 mm
δ = interference = g - g_contact
```

### 4.3 STF Layer Impact on Mobility
- STF-impregnated fabric: 1.5-2× bending rigidity vs base fabric
- At low shear rates (normal movement): η ≈ η₀ (low viscosity)
