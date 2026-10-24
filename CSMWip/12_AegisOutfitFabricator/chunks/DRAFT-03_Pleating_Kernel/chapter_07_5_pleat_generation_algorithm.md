## 5. Pleat Generation Algorithm

### 5.1 Watteau Back Pleat Generation
```
Input: Back pattern piece (DXF/SVG), W_unpleated, W_finished
1. Compute pleat fold lines at x = ±1/8, ±3/8 × W_unpleated
2. Mark fold type: Mountain (M) or Valley (V) alternating
   M-V-V-M for double box (center outward)
3. Add pleat depth dimension lines
4. Generate 3D fold simulation for visualization
5. Output: Pattern with pleat annotations (FOLD layer)
```

### 5.2 Cartridge Pleat Generation
```
Input: Waist/skirt pattern, W_unpleated, W_finished, N_pleats
1. Compute pleat spacing: s = W_finished / N_pleats
2. For each pleat i = 1 to N_pleats:
   x_i = i × s
   A = d/2, λ = 2s
   Generate S-curve

**S-Curve Parametrization:**
```
$y(x) = A \sin\left(\frac{2\pi x}{\lambda}\right) + B x$
```
```
$\text{Curvature: } \kappa(x) = \frac{|y''|}{(1 + y'^2)^{3/2}}$
```

 fold line: y(x) = A sin(2π(x-x_i)/λ) + B(x-x_i)
   Clip to pattern boundaries
3. Assign fold types: alternating M-V-M-V...
4. Add attachment points at waistband
5. Output: Pattern with pleat annotations
```

### 5.3 Pleat Annotation Standard (DXF/SVG)
**FOLD Layer:**
```
Line type: DASHED (2mm dash, 1mm gap)
Color: Yellow (2)
Arrow: At fold line ends indicating fold direction
Text: "PLEAT" + fold number + type (M/V)
```

**NOTCH Layer at Pleat Match Points:**
```
V-notch at each pleat fold intersection with seam
Depth: 3mm, Angle: 90°
```

