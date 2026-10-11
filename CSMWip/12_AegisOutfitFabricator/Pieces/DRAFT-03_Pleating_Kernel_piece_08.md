N_threads = ceil(T_pleat / (σ_allowable × A_thread))
σ_allowable = σ_uts / SF = 200-250 MPa (SF=3)
A_thread = π × (0.6mm)² / 4 = 0.28 mm²
N_threads = ceil(T_pleat / 70N) ≈ 1-3 per pleat
```

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
   Generate S-curve fold line: y(x) = A sin(2π(x-x_i)/λ) + B(x-x_i)
   Clip to pattern boundaries
3. Assign fold types: alternating M-V-M-V...
4. Add attachment points at waistband
