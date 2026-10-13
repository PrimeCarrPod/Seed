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
