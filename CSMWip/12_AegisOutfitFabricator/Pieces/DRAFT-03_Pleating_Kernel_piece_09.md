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

## 6. Traceability Matrix — DRAFT-03

| Section | Source Document | Section/Line | Key Values |
|---------|----------------|--------------|------------|
| 1.1 Watteau History | Research Doc 1 | §4.2, Lines 53-58 | Double box, en fourreau |
| 1.2 Double Box | Research Doc 1 | §4.2 | 3:1 ratio |
| 1.3 Parametrization | SYNTH-03 | §3 | Fold lines at ±1/8, ±3/8 |
| 1.4 Load Bearing | SYNTH-03 | §3 | W_skirt/4 per fold |
| 2.1 Cartridge History | Research Doc 1 | §6.2, Lines 95-99 | S-curve folds |
| 2.2 S-Curve Geometry | SYNTH-03 | §4 | y=A sin(2πx/λ)+Bx |
| 2.3 Perpendicular | SYNTH-03 | §4 | ⟂ waistband |
| 2.4 Stress Diffusion | Research Doc 1 | §6.2 | Gravitational distribution |
