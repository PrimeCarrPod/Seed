## 1. RM-TS Anthropometric Definition

### 1.1 Primary Measurements (Per DOC-01 §1.1, CSMFAB078-A §3.2)

| Measurement | RM-TS Range | Mean | Std Dev | Percentile Coverage |
|-------------|-------------|------|---------|---------------------|
| **Stature (Height)** | 185-195 cm | 190 cm | 3.5 cm | 5th-95th %ile |
| **Chest Circumference** | 85-95 cm | 90 cm | 3.0 cm | 5th-95th %ile |
| **Waist Circumference** | 70-80 cm | 75 cm | 3.0 cm | 5th-95th %ile |
| **Hip Circumference** | 88-98 cm | 93 cm | 3.0 cm | 5th-95th %ile |
| **Neck Circumference** | 36-40 cm | 38 cm | 1.5 cm | 5th-95th %ile |
| **Shoulder Breadth** | 42-48 cm | 45 cm | 2.0 cm | 5th-95th %ile |
| **Arm Length (spine-wrist)** | 82-90 cm | 86 cm | 2.5 cm | 5th-95th %ile |
| **Sleeve Length (shoulder-wrist)** | 65-72 cm | 68.5 cm | 2.0 cm | 5th-95th %ile |
| **Inseam** | 88-96 cm | 92 cm | 2.5 cm | 5th-95th %ile |
| **Torso Length (cervical-waist)** | 48-54 cm | 51 cm | 2.0 cm | 5th-95th %ile |

### 1.2 Derived Proportions (Garsault Scaling, DRAFT-02 §3.2)

$$\text{Garsault Ratio}_1 = \frac{\text{Chest}}{4} = \frac{90}{4} = 22.5 \text{ cm} \quad \text{(back width)}$$

$$\text{Garsault Ratio}_2 = \frac{\text{Waist}}{2} = \frac{75}{2} = 37.5 \text{ cm} \quad \text{(waist panel half-width)}$$

$$\text{Garsault Ratio}_3 = \frac{\text{Stature}}{8} = \frac{190}{8} = 23.75 \text{ cm} \quad \text{(bodice length unit)}$$

$$\text{Garsault Ratio}_4 = \frac{\text{Stature}}{10} = \frac{190}{10} = 19.0 \text{ cm} \quad \text{(skirt/hose length unit)}$$

### 1.3 Edition Morphology Factor (MAT-04 §5.1, CSMFAB078-A §3.3)

$$\alpha_{\text{RM-TS}} = -0.08 \quad \text{(negative = reduced girth vs. reference)}$$

$$M_{\text{ref}} = \text{RM-TG (reference edition)} = 1.00$$

$$\frac{M_{\text{RM-TS}}}{M_{\text{ref}}} = 0.92 \quad \text{✓ Validated across 4 RM editions}$$

**Morphology Vector:** $\mathbf{m}_{\text{RM-TS}} = [0.92, 0.92, 1.08, 1.08]^T$ for [Chest, Waist, Height, Limb Length]

---
