## 2. Garsault Proportional Scaling System

### 2.1 Historical Foundation (Research Doc 1 §4.1, Lines 51-52)

François-Alexandre de Garsault 1769: *L'Art du Tailleur* introduced proportional measurement systems utilizing scaled paper strips, creating dynamic algorithms that scaled automatically to individual anthropometrics.

### 2.2 Anthropometric Measurement System

**Primary Measurements (8+):**
```
1. Bust circumference (B)
2. Waist circumference (W)
3. Hip circumference (H)
4. Nape-to-waist length (NW)
5. Shoulder slope angle (SS)
6. Back width (BW)
7. Armhole depth (AH)
8. Bicep circumference (Bi)
9. Wrist circumference (Wr)
10. Neck circumference (Nk)
```

**18th Century Ideal Proportional Ratios:**
```
B : W : H ≈ 10 : 7 : 9.5
NW ≈ 0.18 × height
SS ≈ 15-20° from horizontal
```

### 2.3 Dynamic Scaling Algorithms

**Base Size → Target Size Transformation:**
```
Scale matrix S = diag(s_x, s_y, s_z) + non-linear corrections

Horizontal scaling: s_x = B_target / B_base
Vertical scaling: s_y = NW_target / NW_base
Ease factors: e_bust = 4-6cm, e_waist = 2-3cm, e_hip = 4-6cm
```

**Non-Uniform Scaling per Panel:**
```
Front bodice:  s_x = (B_target + e_bust) / (B_base + e_bust)
Back bodice:   s_x = (B_target + e_bust) / (B_base + e_bust)  (same)
Side panel:    s_x = (W_target + e_waist) / (W_base + e_waist)
Skirt panel:   s_x = (H_target + e_hip) / (H_base + e_hip)
```

**Grade Rules per 2cm Size Increment:**
```
Bust:  +2cm → all horizontal dims +0.5cm
Waist: +2cm → waist horizontal +0.5cm
Hip:   +2cm → hip horizontal +0.5cm
Length: +1cm → all vertical dims +0.25cm
```

### 2.4 Edition-Specific Patterns (8 Editions)

| Edition | Morphology | Size Range | Scaling Factor | Notes |
|---------|------------|------------|----------------|-------|
| RM-TS | RenaissanceMan Tall-Skinny | 32-36 bust | 0.90-0.95 | Petite |
| RM-TG | RenaissanceMan Tall-Gordo | 38-42 bust | 1.00-1.05 | Standard |
| RM-SS | RenaissanceMan Short-Skinny | 30-34 bust | 0.85-0.90 | Small structure |
| RM-SG | RenaissanceMan Short-Gordo | 40-44 bust | 1.05-1.10 | Large structure |
| RW-TS | RenaissanceWoMan Tall-Skinny | 32-36 bust | 0.90-0.95 | Petite |
| RW-TG | RenaissanceWoMan Tall-Gordo | 38-42 bust | 1.00-1.05 | Standard |
| RW-SS | RenaissanceWoMan Short-Skinny | 30-34 bust | 0.85-0.90 | Small structure |
| RW-SG | RenaissanceWoMan Short-Gordo | 40-44 bust | 1.05-1.10 | Large structure |

**LES 12-Zone → Historical Lacing Point Mapping:**

| LES Zone | Historical Lacing Point | Tension Range |
|----------|------------------------|---------------|
| 1 Shoulders | Shoulder seam | 15-25 N |
| 2 Chest | Bodice front lacing | 20-40 N |
| 3 Waist | Waistband/cartridge pleats | 30-60 N |
| 4 Hips | Farthingale tapes | 20-40 N |
| 5 Thighs | Pannier hoops | 15-25 N |
| 6 Calves | Skirt hem weight | 10-20 N |
| 7 Upper Arms | Sleeve cap easing | 10-20 N |
| 8 Forearms | Sleeve cuff | 5-15 N |
| 9-12 | Additional corset channels | 10-30 N |

### 2.5 Continuous Adaptation Algorithm

```
For target measurements M_target and base pattern P_base:
1. Compute scale factors per panel: s_i = f(M_target, M_base, ease_i)
2. Apply affine transform with non-linear curvature correction:
   P_target = S · P_base + Δ_curvature
3. Δ_curvature computed from osculating circle analysis
4. Verify: seam lengths match within 0.5mm tolerance
5. Output edition-specific DXF/SVG
```
