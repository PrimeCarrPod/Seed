## 4. Pattern Generation for 8 Editions

### 4.1 Edition-Specific Pattern Set
Each edition generates complete pattern set:
```
Pattern_Set = {Bodice_Front, Bodice_Back, Sleeve, Skirt_Front, Skirt_Back, 
               Watteau_Back, Collar, Cuff, Placket, Waistband}
```

### 4.2 Scaling Application per Piece
**Bodice Scaling:**
```
Front: S_x = (B_target - E_bust) / (B_base - E_bust_base)
       S_y = NW_target / NW_base
Back:  S_x = (B_target - E_bust) / (B_base - E_bust_base) × 0.5 (half back)
       S_y = NW_target / NW_base
```

**Sleeve Scaling:**
```
S_x = BC_target / BC_base (bicep)
S_y = (Sleeve_Length_target) / (Sleeve_Length_base)
S_wrist = WC_target / WC_base
```

**Sleeve Cap Height Adjustment:**
```
Cap_Height = AD_target × f(BC, SW)
f = 0.45 + 0.1 × (BC/SW - 1.5)
```

**Skirt Scaling:**
```
S_x = (H_target - E_hip) / (H_base - E_hip_base)  (panel width)
S_y = (Skirt_Length_target) / (Skirt_Length_base)
```

**Watteau Back Scaling (Special):**
```
S_x = (BW_target - E_back) / (BW_base - E_back_base)
S_y = (Skirt_Length_target + NW_target) / (Skirt_Length_base + NW_base)
Pleat_Depth_scaled = Pleat_Depth_base × S_x
Pleat_Count = 2 (fixed, double box pleat)
```

### 4.3 Automated Grading Pipeline
```
Input: Base_Pattern (DXF/SVG), Target_Measurements, Edition
1. Compute Scale_Factors per piece
2. Apply affine transformation to geometry
3. Adjust seam allowances (proportional)
4. Regenerate notches at scaled match points
5. Update grainline vectors
6. Output: Edition_Pattern (DXF/SVG)
7. Validate: Check piece counts, seam matching, grainline
```

### 4.4 Seam Matching Validation
```
For each seam pair (Piece_A_edge, Piece_B_edge):
  Length_A = arc_length(Piece_A_edge)
  Length_B = arc_length(Piece_B_edge)
  Match_Error = |Length_A - Length_B| / Length_A
  Require: Match_Error < 0.02 (2% tolerance)
```

### 4.5 Grainline Preservation
```
Grainline vector: g = (cos θ, sin θ)
After scaling: g' = R(θ) × g
Where R(θ) = rotation matrix for piece orientation
Require: |g' · g_warp| > 0.95 (within 18° of warp)
```
