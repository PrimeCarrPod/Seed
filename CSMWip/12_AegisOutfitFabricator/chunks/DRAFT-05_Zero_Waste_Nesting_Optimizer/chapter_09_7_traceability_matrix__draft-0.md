## 7. Traceability Matrix — DRAFT-05

| Section | Source Document | Section/Line | Key Values |
|---------|----------------|--------------|------------|
| 1.1 Alcega Legacy | Research Doc 1 | §4.1, Lines 45-51 | 560mm loom, zero-waste |
| 1.2 Algorithmic Map | Research Doc 1 | §4.1 | Constraint translation |
| 2.1 Math Model | SYNTH-03 | §7 | Min L, Max η |
| 2.2 Polygon Rep | SYNTH-03 | §7 | SAT, bounding box |
| 3.1 Bottom-Left | SYNTH-03 | §7 | Heuristic + rotation |
| 3.2 NFP | SYNTH-03 | §7 | NFP = A⊕(-B) |
| 3.3 Simulated Annealing | SYNTH-03 | §7 | T_0=1000, α=0.95 |
| 3.4 Genetic Algorithm | SYNTH-03 | §7 | Order-based crossover |
| 4.1 Min Remnant | Research Doc 1 | §4.1 | 100×100mm |
| 4.2 Shape Classes | SYNTH-03 | §7 | Rect/L-shape/Irregular |
| 4.3 Reuse Mapping | SYNTH-03 | §7 | Pockets, gussets, trim |
| 4.4 Inventory | CSMFAB078-D | §6 | Multi-garment tracking |
| 5.1 Efficiency | SYNTH-03 | §7 | η>85%, Waste<5% |
| 5.2 Edition Targets | CSMFAB078-A | §3.3 | Per edition metrics |
| 6.1 Pipeline Input | DRAFT-01,02,03 | All | DXF/SVG pieces |
| 6.2 Manufacturing Out | CSMFAB078-D | §6 | Cutting plan, remnant cat |

**Additional Cross-References:**
- Research Doc 1 §4.1 (Alcega 1589, loom width)
- Research Doc 1 §4.1 (Zero-waste algorithms)
- Research Doc 1 §4.1 (Geometric nesting)
- SYNTH-03 §7 (Nesting

**Packing Efficiency:**
```
$\eta = \frac{\sum A_{\text{parts}}}{A_{\text{sheet}}} \times 100\%$
```
```
$\text{Waste \%} = 100\% - \eta$
```

**Guillotine Cut Constraints:**
```
$\text{Guillotine feasible: } \exists \text{ recursive partitioning}$
```

**Simulated Annealing:**
```
$T(t) = T_0 / (1 + \alpha t)$  (cooling schedule)
```
```
$P(\text{accept}) = \exp(-\Delta E / T)$
```

 optimization)
- SYNTH-03 §7 (Bottom-left heuristic)
- SYNTH-03 §7 (Rotation search)
- SYNTH-03 §7 (Simulated annealing)
- SYNTH-03 §7 (Genetic algorithm)
- CSMFAB078-A §3.3 (Edition specifications)
- CSMFAB078-D §6 (Manufacturing integration)
- CSMFAB078-D §6 (Cutting instructions)
- DRAFT-01 (Developable surface pieces)
- DRAFT-02 (Scaled edition pieces)
- DRAFT-03 (Pleated pieces with annotations)
- MAT-01 (Silk fabric properties for grain direction)
- MAT-04 (Weight budget for efficiency targets)

**Standards Referenced:**
- ASTM D3776 (Fabric Width Measurement)
- ISO 7211-3 (Woven Fabric Construction)
- ASTM D6614 (Pattern Grading - CAD Systems)
- ISO 18245 (Garment Sizing - 3D Body Scanning)
- ISO 14125 (Composites - Flexural Properties)
- ASTM D5035 (Breaking Force of Textile Fabrics)
- EN 13402 (Size Designation of Clothes)
- ISO 15858 (Protective Clothing - Ergonomics)

