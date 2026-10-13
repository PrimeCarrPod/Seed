
**Input:**
- Set of 2D pattern pieces P = {p₁, p₂, ..., pₙ} (polygons)
- Each piece has grain direction gᵢ
- Container: rectangle 560mm × L (L = variable)

**Constraints:**
```
1. Grain alignment: gᵢ · (1, 0) = ±1
2. Seam allowance: 13mm (Ssa-1) or 25mm (SSn-2) or 40mm (SSd-2)
3. Notches: 3mm V-notch clearance
4. Pattern matching: aligned motifs for lampas/brocatelle
5. No overlap: pᵢ ∩ pⱼ = ∅ for i ≠ j
6. Containment: pᵢ ⊂ [0, 560] × [0, L]
```

**Objective:**
```
Minimize L (fabric length) → Maximize yield = Σ area(pᵢ) / (560 × L)
Target: >85% yield, <5% waste
```

### 5.3 Optimization Algorithm

**Bottom-Left Heuristic with Rotation Search:**
```
For each piece in sorted order (largest first):
  For rotation in {0°, 90°, 180°, 270°}:
    Place at lowest valid y, then leftmost valid x
    Check constraints (grain, seam allowance, notches)
