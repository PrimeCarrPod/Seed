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

$$\eta_{\text{cart}} = \frac{V_{\text{unpleated}}}{V_{\text{pleated}}} = \frac{L \cdot W \cdot t}{L \cdot W_{\text{eff}} \cdot t_{\text{eff}}} \approx 2.5\text{--}3.5$$

**Perpendicular Force Distribution:**

$$F_{\perp}(s) = \frac{EI}{R^2} \kappa(s) \quad \text{where } \kappa(s) = \frac{2\pi}{\lambda} \text{ (constant curvature)}$$

### 3.3 Pleat Stitch Specification (ISO 4915 ↔ Historical Mapping)

| Historical Stitch | ISO 4915 Class | SPI | Thread | Application |
|-------------------|----------------|-----|--------|-------------|
| Backstitch | 301 (Lockstitch) | 18-22 | Silk/Beeswax | Watteau pleat anchor |
| Running stitch | 101 (Chainstitch) | 16-20 | Linen | Cartridge pleat gather |
| Whip stitch | 503 (Overedge) | 20-24 | Silk | Pleat edge finish |
| Stab stitch | 304 (Zigzag) | 12-16 | Metallic | Decorative pleat topstitch |

---
