```

**Simulated Annealing for Global Optimization:**
```
T_initial = 100, T_final = 0.1
Cooling: T_{k+1} = 0.95 × T_k
Move: swap piece positions, rotate piece, translate piece
Acceptance: P = exp(-ΔE/T) if ΔE > 0
```

### 5.5 Offcut Catalog for Remnants
```
Minimum viable remnant: 100mm × 100mm
Classification:
  - Rectangular: w × h, aspect ratio ∈ [0.5, 2.0]
  - L-shape: rectangular minus rectangular corner
  - Irregular: polygon with >4 vertices
Reuse mapping:
  - Rectangular → pockets, tabs, bias strips
  - L-shape → gussets, underarm panels
  - Irregular → appliqué, trim, test swatches
```

## 6. Traceability Matrix — DRAFT-01

| Section | Source Document | Section/Line | Key Values |
|---------|----------------|--------------|------------|
| 1.1 Alcega 1589 | Research Doc 1 | §4.1, Lines 45-51 | 22" loom, zero-waste |
| 2.1 Developable Math | Research Doc 1 | §4.1, Lines 47-51 | K_G=0, convolute surfaces |
| 2.1 Ruled Surface | Research Doc 1 | §4.1, Line 47 | S(u,v)=α(u)+vβ(u) |
