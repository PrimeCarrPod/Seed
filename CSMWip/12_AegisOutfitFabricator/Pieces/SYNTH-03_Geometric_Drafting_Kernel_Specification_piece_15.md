For each remnant r:
  Find pattern pieces p with area(p) ≤ area(r) × 0.9
  Check grain compatibility
  Check pattern matching requirements
  Assign to next garment in production queue
```

**Inventory Tracking:**
```
Remnant database:
  - Shape class, dimensions, area
  - Fabric type, color, pattern
  - Location in storage
  - Assigned garment (if any)
```

## 6. Traceability Matrix — SYNTH-03

| Section | Source Document | Section/Line | Key Values |
|---------|----------------|--------------|------------|
| 1.1 Alcega Foundation | Research Doc 1 | §4.1, Lines 45-51 | 560mm loom, developable surfaces |
| 1.2 Directrix Curves | Research Doc 1 | §4.1, Lines 47-51 | Convolute surfaces, generatrix |
| 1.3 Generatrix | Research Doc 1 | §4.1, Lines 49-50 | S(u,v) = D₁ + v(D₂-D₁)/|D₂-D₁| |
| 1.4 Osculating Circle | Research Doc 1 | §4.1, Lines 50-51 | Zero curvature direction |
| 1.5 Loom Constraint | Research Doc 1 | §4.1, Line 49 | 22 inches = 560mm |
| 1.6 DXF/SVG Spec | NEXT_RUNNER_001_C | §3.1, Lines 992-1000 | Layer structure, units |
| 2.1 Garsault Foundation | Research Doc 1 | §4.1, Lines 51-52 | Proportional strips |
| 2.2 Anthropometrics | Research Doc 1 | §4.1, Line 51 | 8+ measurements |
| 2.3 Scaling Algorithms | NEXT_RUNNER_001_C | §3.2, Lines 1002-1007 | Affine + non-linear |
| 2.4 Edition Patterns | NEXT_RUNNER_001_B | §3.3, Lines 168-177 | 8 editions table |
