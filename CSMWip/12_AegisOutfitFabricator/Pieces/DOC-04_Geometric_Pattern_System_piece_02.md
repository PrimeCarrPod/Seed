```
Pipeline stages:
1. Anthropometric extraction: 50+ landmarks from 3D scan
2. Directrix construction: spline through landmark chains
3. Generatrix distribution: equal-angle or equal-spacing
4. Developable mapping: S(u,v) → flat (u,v) domain
5. Seam placement: at ruling intersections
6. Grain line: align with warp direction (∂S/∂u)
```

**Metric Preservation in Unfolding** (SYNTH-03 §1.3):
```
First fundamental form: I = E du² + 2F du dv + G dv²
E = |∂S/∂u|², F = ∂S/∂u · ∂S/∂v, G = |∂S/∂v|²

For developable: F = 0 (orthogonal rulings), G = 1 (unit rulings)
Flat metric: I_flat = E du² + dv²
Area preservation: √(EG - F²) = √E
Distortion measure: η = |√E - 1| (target η < 0.05)
```

### 1.3 DXF/SVG Output Specification

**Layer Structure** (DRAFT-01 §1.4):
```
Layers:
- CUT:     Continuous lines, 0.25mm weight, red (#FF0000)
- FOLD:    Dashed lines (2mm/1mm), 0.18mm weight, blue (#0000FF)
- NOTCH:   V-notches 3mm × 1.5mm, green (#00FF00)
- GRAINLINE: Double arrow, 0.18mm weight, magenta (#FF00FF)
- LABEL:   Text annotations, 2.5mm height, black (#000000)
- SEAM_ALLOWANCE: Offset construction lines, 0.10mm weight, gray (#808080)
```

**Units & Precision** (DRAFT-01 §1.4):
```
Units: millimeters (mm)
Precision: 0.01 mm (2 decimal places)
Coordinate system: Origin at pattern piece centroid
Seam allowance: 13mm default (Ssa-1 per ASTM D1683), configurable per MAT-04
```

### 1.4 Cutting Layout Optimizer

