# DRAFT-05: Zero-Waste Nesting Optimizer
## AegisOutfitFabricator Geometric Drafting System Document 5

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

## 2. Nesting Problem Formulation

### 2.1 Mathematical Model
**Decision Variables:**
- Position: (x_i, y_i) for each piece i
- Rotation: θ_i ∈ {0°, 90°, 180°, 270°} (grain-preserving)
- Sequence: Order of placement

**Constraints:**
```
1. No Overlap: P_i(x_i, y_i, θ_i) ∩ P_j(x_j, y_j, θ_j) = ∅  ∀ i≠j
2. Container: 0 ≤ x_i ≤ W - w_i, 0 ≤ y_i ≤ L - h_i
3. Grain Direction: θ_i ∈ {0°, 90°} for main pieces, {45°, 135°} for bias
