## 1. RM-TG Anthropometric Definition

### 1.1 Primary Measurements (Per DOC-01 §1.1, CSMFAB078-A §3.2)

| Measurement | RM-TG Range | Mean | Std Dev | Percentile Coverage |
|-------------|-------------|------|---------|---------------------|
| **Stature (Height)** | 185-195 cm | 190 cm | 3.5 cm | 5th-95th %ile |
| **Chest Circumference** | 115-125 cm | 120 cm | 3.0 cm | 5th-95th %ile |
| **Waist Circumference** | 105-115 cm | 110 cm | 3.0 cm | 5th-95th %ile |
| **Hip Circumference** | 118-128 cm | 123 cm | 3.0 cm | 5th-95th %ile |
| **Neck Circumference** | 42-46 cm | 44 cm | 1.5 cm | 5th-95th %ile |
| **Shoulder Breadth** | 48-54 cm | 51 cm | 2.0 cm | 5th-95th %ile |
| **Arm Length (spine-wrist)** | 82-90 cm | 86 cm | 2.5 cm | 5th-95th %ile |
| **Sleeve Length (shoulder-wrist)** | 65-72 cm | 68.5 cm | 2.0 cm | 5th-95th %ile |
| **Inseam** | 88-96 cm | 92 cm | 2.5 cm | 5th-95th %ile |
| **Torso Length (cervical-waist)** | 48-54 cm | 51 cm | 2.0 cm | 5th-95th %ile |

### 1.2 Derived Proportions (Garsault Scaling, DRAFT-02 §3.2)

$$\text{Garsault Ratio}_1 = \frac{\text{Chest}}{4} = \frac{120}{4} = 30.0 \text{ cm} \quad \text{(back width)}$$

$$\text{Garsault Ratio}_2 = \frac{\text{Waist}}{2} = \frac{110}{2} = 55.0 \text{ cm} \quad \text{(waist panel half-width)}$$

$$\text{Garsault Ratio}_3 = \frac{\text{Stature}}{8} = \frac{190}{8} = 23.75 \text{ cm} \quad \text{(bodice length unit)}$$

$$\text{Garsault Ratio}_4 = \frac{\text{Stature}}{10} = \frac{190}{10} = 19.0 \text{ cm} \quad \text{(skirt/hose length unit)}$$

**Comparison to RM-TS:**
| Ratio | RM-TS | RM-TG | Delta |
|-------|-------|-------|-------|
| Chest/4 | 22.5 cm | 30.0 cm | +7.5 cm |
| Waist/2 | 37.5 cm | 55.0 cm | +17.5 cm |
| Stature/8 | 23.75 cm | 23.75 cm | 0 cm |
| Stature/10 | 19.0 cm | 19.0 cm | 0 cm |

### 1.3 Edition Morphology Factor (MAT-04 §5.1, CSMFAB078-A §3.3)

$$\alpha_{\text{RM-TG}} = +0.12 \quad \text{(positive = increased girth vs. reference)}$$

$$M_{\text{ref}} = \text{RM-TG (reference edition for TG family)} = 1.00$$

$$\frac{M_{\text{RM-TG}}}{M_{\text{ref}}} = 1.15 \quad \text{✓ Validated across 4 RM editions}$$

**Morphology Vector:** $\mathbf{m}_{\text{RM-TG}} = [1.33, 1.47, 1.00, 1.00]^T$ for [Chest, Waist, Height, Limb Length] relative to RM-TS

---
