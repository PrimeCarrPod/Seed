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
