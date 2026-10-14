## 1. Renaissance Court Dress Engineering (1600-1700 CE)

### 1.1 Alcega's Geometric Drafting Legacy

Juan de Alcega's *Libro de Geometría, Pratica y Traca* (1589) establishes the **first systematic geometric approach** to garment patterning in Western Europe. His system operates on **developable surface theory** — mapping 3D body surfaces to 2D cloth without distortion.

**Core Algorithmic Principles:**

$$\text{Developable Surface: } \mathbf{r}(u,v) = \mathbf{c}(u) + v \cdot \mathbf{g}(u) \quad \text{where } \mathbf{g}(u) \cdot \mathbf{c}'(u) = 0$$

- **Directrix curve** $\mathbf{c}(u)$: Body silhouette cross-section (bust, waist, hip)
- **Generatrix ruling** $\mathbf{g}(u)$: Straight grain lines parallel to selvage
- **Loom width constraint**: $W_{\text{loom}} = 560\text{ mm}$ (22-inch standard, per Alcega Table 1)

**Unfolding Algorithm (Alcega §12-15):**
1. Slice body surface along principal curvature lines
2. Project each slice onto plane along ruling direction
3. Nest resulting pattern pieces within $W_{\text{loom}} \times L_{\text{fabric}}$
4. Add seam allowances per CIETA Class 1 (10 mm) or Class 2 (15 mm)

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
| RM-SG | 1.15 | 0.92 | 1.12 | (-20, -35, +25) mm |

### 1.3 CIETA Textile Typologies as Engineering Specifications

The **Centre International d'Étude des Textiles Anciens (CIETA)** classification provides **mechanical property baselines** for historical weaves. Each typology maps to specific structural roles in the 12-layer stack.

| CIETA Class | Weave Structure | Warp/Weft Ratio | Orthotropic $E_1/E_2$ | Poisson's $\nu_{12}$ | Application Layer |
|-------------|-----------------|-----------------|----------------------|---------------------|-------------------|
| **Lampas** | Compound, 2 warp + 2 weft | 1:1 to 2:1 | 1.8-2.5 | 0.32-0.38 | L3, L6 (EMI brocade) |
| **Brocatelle** | Heavy figured, supplementary weft | 1:2 to 1:3 | 2.2-3.0 | 0.28-0.34 | L4 (Fractal FSS ground) |
| **Damask** | Reversible figured, satin ground | 1:1 | 1.5-2.0 | 0.35-0.40 | Base textile (L9) |
| **Ciselé Velvet** | Cut/uncut pile, figured | 1:1 (ground) | 0.8-1.2 (pile) | 0.40-0.45 | Interior comfort (L12) |
| **Taqueté/Samitum** | Weft-faced compound tabby | 1:3 to 1:5 | 3.0-4.5 | 0.25-0.30 | Ceramic tile pockets (L2, L7) |

**Orthotropic Elasticity Tensor (per SYNTH-01 §4.2):**

$$\mathbb{C} = \begin{bmatrix}
E_1/(1-\nu_{12}\nu_{21}) & \nu_{12}E_2/(1-\nu_{12}\nu_{21}) & 0 \\
\nu_{21}E_1/(1-\nu_{12}\nu_{21}) & E_2/(1-\nu_{12}\nu_{21}) & 0 \\
0 & 0 & G_{12}
\end{bmatrix}$$

Where $\nu_{21} = \nu_{12} \cdot E_2/E_1$ (reciprocity), $G_{12} \approx 0.4 \cdot \sqrt{E_1 E_2}$ for woven fabrics.

---
