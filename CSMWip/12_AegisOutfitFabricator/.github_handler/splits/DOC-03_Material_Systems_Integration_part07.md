
**ZrB₂-SiC Scaling Laws (from CSMFAB078 Main §4.2):**

Original AIMES tile: 150 mm × 150 mm × 6 mm, $V_{50} = 930\text{ m/s}$ (.30-06 APM2)

**Miniaturization to 25-50 mm:**

$$\frac{V_{50,\text{mini}}}{V_{50,\text{orig}}} = \left(\frac{t_{\text{mini}}}{t_{\text{orig}}}\right)^\alpha \left(\frac{A_{\text{mini}}}{A_{\text{orig}}}\right)^\beta$$

Where $\alpha = 0.5$, $\beta = -0.15$ (edge effect exponent).

**Target Specifications:**
| Parameter | 25 mm Tile | 50 mm Tile |
|-----------|------------|------------|
| Thickness | 4 mm | 6 mm |
| $V_{50}$ (est.) | 780 m/s | 890 m/s |
| Edge magnetic alignment | ±0.05 mm | ±0.1 mm |
| Gasket seal pressure | 0.5 MPa | 0.3 MPa |
| Areal density | 2.8 kg/m² | 4.2 kg/m² |

**Flash Sintering Profile (Scaled):**

$$\rho(t) = \rho_0 + (\rho_{\text{theo}} - \rho_0) \left[1 - \exp\left(-\frac{t}{\tau}\right)^n\right]$$
