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
