# SYNTH-03: Geometric Drafting Kernel Specification
## AegisOutfitFabricator Research Synthesis Document 3

## 1. Alcega Developable Surface Engine

### 1.1 Historical Foundation (Research Doc 1 §4.1, Lines 45-51)

Juan de Alcega 1589: *Libro de Geometría, Práctica y Traça* established the mathematical foundation for zero-waste pattern drafting on standard rectangular loom widths. The standard silk loom width for 18th century silks was 22 inches (560mm).

**Alcega's Core Algorithm:**
```
1. Define directrix curves from body landmarks
2. Compute generatrix rulings (tangent planes to directrices)
3. Intersect with 560mm loom width planes
4. Output flat pattern pieces with grain lines
```

### 1.2 Directrix Curve Definition

**Anthropometric Landmarks → Parametric Curves:**

| Landmark | Measurement | Curve Parameter |
|----------|-------------|-----------------|
| Nape center | Nape-to-waist length | u = 0 |
| Shoulder point | Shoulder slope angle | u = 0.25 |
| Bust apex | Bust circumference / 4 | u = 0.5 |
| Waist point | Waist circumference / 4 | u = 0.75 |
| Hip point | Hip circumference / 4 | u = 1.0 |

**Directrix Curve Formulation:**
