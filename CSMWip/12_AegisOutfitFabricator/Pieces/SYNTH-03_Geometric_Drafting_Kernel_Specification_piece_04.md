5. Target: >85% marker efficiency, <5% waste
```

### 1.6 DXF/SVG Output Specification

| Layer | Purpose | Color | Line Type |
|-------|---------|-------|-----------|
| CUT | Cutting lines | Red | Continuous |
| FOLD | Fold lines | Blue | Dashed |
| NOTCH | Match points | Green | Dash-dot |
| GRAINLINE | Grain direction | Magenta | Phantom |
| LABEL | Piece identification | Black | Continuous |

**Units:** mm, Precision: 0.01mm
**Seam Allowance:** 13mm default (Ssa-1 per ASTM D1683), configurable
**Notches:** 3mm V-notch at match points

## 2. Garsault Proportional Scaling System

### 2.1 Historical Foundation (Research Doc 1 §4.1, Lines 51-52)

François-Alexandre de Garsault 1769: *L'Art du Tailleur* introduced proportional measurement systems utilizing scaled paper strips, creating dynamic algorithms that scaled automatically to individual anthropometrics.

### 2.2 Anthropometric Measurement System

**Primary Measurements (8+):**
```
1. Bust circumference (B)
2. Waist circumference (W)
3. Hip circumference (H)
