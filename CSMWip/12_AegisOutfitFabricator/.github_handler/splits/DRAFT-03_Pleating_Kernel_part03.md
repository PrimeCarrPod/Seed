
**Fold Surface (3D):**
```
S(u,v) = (u, y(u) + v × cos(θ(u)), v × sin(θ(u)))
θ(u) = arctan(dy/du)  (fold angle)
v ∈ [-d/2, d/2]  (through thickness)
```

### 2.3 Perpendicular Alignment to Waistband
**Constraint:**
```
Fold lines ⟂ waistband at attachment points
∇y(x_attach) · tangent_waistband = 0
```

**Waistband Interface:**
```
N_pleats equally spaced along waistband length L_wb
Spacing: s = L_wb / N_pleats
Attachment: each pleat stitched at 2 points (top/bottom of waistband)
```

### 2.4 Stress Diffusion at Waistband Juncture
**Force Distribution:**
```
Total skirt weight: W_skirt
Vertical component per pleat: F_v = W_skirt / N_pleats
Horizontal component: F_h = F_v × tan(θ_max)
θ_max = max fold angle ≈ 60-75°
```
