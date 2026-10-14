## 1. Silk Fibroin System (from MAT-01, Research Doc 1 §4.2, SYNTH-01 §4.1)

### 1.1 Macromolecular Structure & Degumming Kinetics

**Silk Fibroin Primary Structure (per Research Doc 1 §4.2, MAT-01 §3.1):**
- Heavy chain: ~390 kDa, 5,263 amino acids (Gly-Ser-Gly-Ala-Gly-Ala repeats)
- Light chain: ~26 kDa, 222 amino acids
- P25 glycoprotein: ~25 kDa, disulfide-linked to heavy chain
- **Crystalline domains**: β-sheet (GAGAGS)ₙ, 60-70% crystallinity
- **Amorphous domains**: Random coil, helical regions, 30-40% content

**Degumming Kinetics (Alkaline Hydrolysis):**

$$\frac{d[\text{Sericin}]}{dt} = -k \cdot [\text{OH}^-]^n \cdot [\text{Sericin}]^m$$

Where $k = A \exp(-E_a/RT)$, $E_a = 85\text{ kJ/mol}$, $A = 2.3\times10^7\text{ s}^{-1}$, $n=1.2$, $m=0.8$.

**Process Window (per MAT-01 §3.1, Research Doc 1 §4.2, CSMFAB078 Main §4.1):**
- Temperature: 95-100°C
- Na₂CO₃ concentration: 0.5-1.0% w/v
- Time: 60-90 minutes
- Liquor ratio: 1:50 (silk:water)
- Target sericin removal: ≥95% (residual <5%)

**Post-Degumming Properties:**
| Property | Value | Test Method |
|----------|-------|-------------|
| Tensile strength | 500-700 MPa | ASTM D3822 |
| Young's modulus | 8-12 GPa | ASTM D3822 |
| Elongation at break | 15-25% | ASTM D3822 |
| Density | 1.32 g/cm³ | ASTM D1505 |
| Moisture regain | 11% (65% RH, 20°C) | ISO 6741 |

### 1.2 Orthotropic Constitutive Model (Yeoh/Holzapfel)

**Strain Energy Function (Yeoh for isotropic, Holzapfel for anisotropic):**

$$W = \sum_{i=1}^{3} C_{i0} (\bar{I}_1 - 3)^i + \frac{k_1}{2k_2} \sum_{j=4,6} \left[\exp\left(k_2 (\bar{I}_j - 1)^2\right) - 1\right]$$

Where $\bar{I}_1 = \text{tr}(\bar{\mathbf{C}})$, $\bar{I}_4 = \mathbf{a}_0 \cdot \bar{\mathbf{C}} \mathbf{a}_0$, $\bar{I}_6 = \mathbf{g}_0 \cdot \bar{\mathbf{C}} \mathbf{g}_0$.

**Fiber Directions:**
- $\mathbf{a}_0$: Warp direction (machine direction)
- $\mathbf{g}_0$: Weft direction (cross-machine)

**Fitted Parameters (per MAT-01 §4.2):**
- $C_{10} = 1.8\text{ MPa}$, $C_{20} = 0.05\text{ MPa}$, $C_{30} = 0.002\text{ MPa}$
- $k_1 = 150\text{ MPa}$, $k_2 = 8.5$
- $\kappa = 0.15$ (dispersion parameter)

### 1.3 Strain-Rate Sensitivity & Environmental Aging

**Strain-Rate Dependency (Cowper-Symonds):**

$$\sigma_y(\dot{\varepsilon}) = \sigma_0 \left[1 + \left(\frac{\dot{\varepsilon}}{D}\right)^{1/q}\right]$$

Where $D = 40\text{ s}^{-1}$, $q = 4.5$ for degummed silk.

**Environmental Aging (Arrhenius + Humidity):**

$$\frac{P(t)}{P_0} = \exp\left[-\left(\frac{t}{\tau_0}\right)^\beta \exp\left(-\frac{E_a}{RT}\right) \cdot \text{RH}^\gamma\right]$$

Where $\tau_0 = 10^5\text{ h}$, $\beta = 0.7$, $E_a = 95\text{ kJ/mol}$, $\gamma = 1.2$.

---
