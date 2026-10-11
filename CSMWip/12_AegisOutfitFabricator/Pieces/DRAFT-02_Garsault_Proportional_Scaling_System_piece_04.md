E_design_hip = 0-8 cm
```

### 2.4 Height-Proportional Length Scaling
**Vertical Proportions (based on stature H_stature):**
```
NW = 0.22 × H_stature
SW = 0.18 × H_stature
BW = 0.16 × H_stature
Sleeve_Length = 0.31 × H_stature
Skirt_Length = 0.45 × H_stature (floor length)
```

## 3. Dynamic Scaling Algorithms

### 3.1 Base Size → Target Size Transformation Matrix
**Affine Transformation (Per Piece):**
```
[x']   [ S_x  0   ] [ x ]   [ T_x ]
[y'] = [ 0   S_y ] [ y ] + [ T_y ]
```
Where:
- S_x = horizontal scale factor
- S_y = vertical scale factor
- T_x, T_y = translation for alignment

**Non-Uniform Scaling Factors:**
```
S_x = (Target_Girth - Ease) / (Base_Girth - Ease)
S_y = (Target_Length) / (Base_Length)
