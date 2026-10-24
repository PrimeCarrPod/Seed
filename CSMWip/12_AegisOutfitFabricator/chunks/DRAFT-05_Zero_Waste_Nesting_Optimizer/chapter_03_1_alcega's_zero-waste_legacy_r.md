## 1. Alcega's Zero-Waste Legacy (Research Doc 1 §4.1, Lines 45-51)

### 1.1 Historical Foundation
Juan de Alcega's 1589 *Libro de Geometría, Práctica y Traça* established the principle of absolute fabric waste minimization:
- Standard loom width: 22 inches (560mm) for 18th C silks
- All pattern pieces nested within fixed width
- Length determined by optimal arrangement

### 1.2 Algorithmic Translation
Modern nesting optimization directly maps to Alcega's constraint:
- Container: W = 560mm (fixed), L = variable (minimize)
- Items: Set of 2D pattern pieces P_i (polygons with grain direction)
- Objective: Minimize L → Maximize yield η = Σ Area(P_i) / (W × L)

