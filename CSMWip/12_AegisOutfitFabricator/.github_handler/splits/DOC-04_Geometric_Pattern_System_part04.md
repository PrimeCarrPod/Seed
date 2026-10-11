
## 3. Pleating Kernel (from DRAFT-03, Research Doc 1 §4.4, SYNTH-01 §3.3, MAT-04 §5.2, CSMFAB078 Main §5.3)

### 3.1 Watteau Back Pleating (Double Box Pleat)

**Geometry: 3:1 Compression Ratio**

$$L_{\text{unpleated}} = 3 \cdot L_{\text{pleated}}$$

**Pleat Depth Calculation:**

$$d_p = \frac{L_{\text{unpleated}} - L_{\text{pleated}}}{2 \cdot N_{\text{pleats}}} = \frac{L_{\text{pleated}}}{N_{\text{pleats}}}$$

**Load Distribution (Column Action):**

$$\sigma_{\text{pleat}} = \frac{F_{\text{vertical}}}{A_{\text{pleat}}} = \frac{F_{\text{vertical}}}{2 \cdot d_p \cdot t_{\text{fabric}} \cdot N_{\text{pleats}}}$$

**Beeswax Thread Integration (Historical Lubrication):**

$$\mu_{\text{beeswax}} = 0.15 \quad \text{vs.} \quad \mu_{\text{dry}} = 0.35 \quad \text{(silk-on-silk)}$$

### 3.2 Cartridge Pleating (S-Curve Fold Geometry)

**Parametric S-Curve:**

$$\mathbf{c}(s) = \begin{bmatrix} R \sin(2\pi s / \lambda) \\ s \\ R (1 - \cos(2\pi s / \lambda)) \end{bmatrix}, \quad s \in [0, L]$$

Where $R$ = fold radius, $\lambda$ = wavelength (pleat repeat).

**Volumetric Compression Ratio:**
