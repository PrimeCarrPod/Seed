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

## 2. Sumptuary Law as Constraint System

### 2.1 Algorithmic Constraints from Historical Regulation

