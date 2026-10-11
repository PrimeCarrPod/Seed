**Key Innovation:** Alcega's **"convolute surfaces"** — ruled surfaces where generatrix is tangent to a space curve (edge of regression). This enables **zero-waste bodice suppression** by converting dart intake into curved seam lines.

### 1.2 Garsault's Proportional Scaling System

Garsault's *L'Art du Tailleur* (1769) introduces **anthropometric proportional scaling** — the precursor to modern grading. His system uses **primary measurements** to derive all secondary dimensions via fixed ratios.

**Garsault Proportional Constants (Male):**

| Measurement | Ratio to Stature | Ratio to Chest | Historical Source |
|-------------|------------------|----------------|-------------------|
| Stature (H) | 1.000 | — | Garsault Plate I |
| Chest (C) | 0.525 | 1.000 | Garsault Plate II |
| Waist (W) | 0.435 | 0.829 | Garsault Plate III |
| Nape-to-waist (NW) | 0.235 | 0.448 | Garsault Plate IV |
| Across-back (AB) | 0.195 | 0.371 | Garsault Plate V |
| Sleeve length (SL) | 0.345 | 0.657 | Garsault Plate VI |

**Scaling Transformation (Affine per Edition):**

$$\mathbf{P}_e = \mathbf{P}_{\text{base}} \cdot \mathbf{S}_e + \mathbf{T}_e$$

Where $\mathbf{S}_e = \text{diag}(s_x, s_y, s_z)$ edition-specific scale factors, $\mathbf{T}_e$ translation for morphology offset.

**Edition Morphology Factors (from CSMFAB078-A):**

| Edition | $s_x$ (circumference) | $s_y$ (length) | $s_z$ (depth) | $\mathbf{T}_e$ Offset |
|---------|----------------------|----------------|---------------|----------------------|
| RM-TS | 0.92 | 1.08 | 0.90 | (+15, +40, -10) mm |
| RM-TG | 1.15 | 1.08 | 1.12 | (-20, +40, +25) mm |
| RM-SS | 0.92 | 0.92 | 0.90 | (+15, -35, -10) mm |
