## 1. Watteau Back Pleating (Research Doc 1 §4.2, Lines 53-58)

### 1.1 Historical Foundation
The Watteau back (robe à la française) features double box pleats descending from neckline to hem:
- Bodice and skirt *en fourreau* (continuous, uncut)
- 3:1 fabric consumption ratio (3 units planar → 1 unit finished)
- Target finished width across shoulder blades vs unpleated width

### 1.2 Double Box Pleat Geometry

**Pleat Fold Angles:**
```
$\theta_{\text{fold}} = 2 \arctan\left(\frac{h}{w/2}\right)$  (mountain/valley fold)
```
```
$\theta_{\text{dihedral}} = \pi - 2\alpha$  (dihedral angle)
```
```
$\text{Compression Ratio} = \frac{W_{\text{unpleated}}}{W_{\text{pleated}}} = \frac{1}{\cos(\alpha)}$
```


**Pleat Configuration:**
```
Two box pleats side by side at center back
Each box pleat = two knife pleats facing away from center
Total pleat depth = (W_unpleated - W_finished) / 2
```

**3:1 Compression Ratio:**
```
Compression_Ratio = W_unpleated / W_finished = 3:1
W_finished = W_unpleated / 3
Pleat_Depth = (W_unpleated - W_finished) / 4  (4 folds per double box)
```

**Pleat Dimensions:**
```
W_unpleated = shoulder blade width + ease ≈ 40-50 cm
W_finished = target back width ≈ 13-17 cm
Pleat_Depth ≈ 5-8 cm per fold
Pleat_Width (fold to fold) = Pleat_Depth × 2 ≈ 10-16 cm
```

### 1.3 Pleat Parametrization
**Fold Lines (in 2D pattern):**
```
Fold_1 (left outer): x = -3/8 × W_unpleated
Fold_2 (left inner): x = -1/8 × W_unpleated  
Fold_3 (right inner): x = +1/8 × W_unpleated
Fold_4 (right outer): x = +3/8 × W_unpleated
```

**Pleat Volume (3D):**
```
V_pleat = ∫ Pleat_Depth(y) × Pleat_Width(y) dy
y from neckline (y=0) to hem (y=L)
Pleat_Depth(y) varies with y (tapered at waist)
```

### 1.4 Load-Bearing Column Action
**Gravitational Force Distribution:**
```
Skirt weight: W_skirt distributed across N_pleats = 4 folds
Force per fold: F_fold = W_skirt / 4
```

**Stress at Shoulder Anchor:**
```
σ_shoulder = W_skirt / (2 × A_anchor)
A_anchor = cross-sectional area of shoulder seam
Target: σ_shoulder < σ_uts_silk / SF (SF=3)
```

