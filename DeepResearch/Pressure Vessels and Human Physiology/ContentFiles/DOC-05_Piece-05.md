# DOC-05: Lamé Applications — Internal vs. External Pressure Regimes
## Document 5 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 4001-4100 | Piece 5 of 9 | ~100 Lines

---

#### 5.5 Multilayer Vessels & Overwrapped Composites

**5.5.1 Multilayer Metallic Vessels (Autofrettage, Shrink-Fit)**

**Concept:** Multiple concentric cylinders assembled with interference fits.
- **Inner liner:** High strength, corrosion resistant
- **Middle layers:** High strength, pre-compressed by shrink-fit
- **Outer layer:** Toughness, containment

**Autofrettage (Self-Preinforcement):**
Single thick cylinder pressurized beyond yield at inner surface, then unloaded.
Residual stresses: Compressive at inner surface, tensile at outer.
**Benefit:** Compressive residual stress subtracts from pressure tensile stress.

**Lamé Analysis of Autofrettage:**
1. **Pressurize to $P_{\text{auto}}$** → yield to radius $r_y$
2. **Unload elastically** → residual stresses

**Residual Stress (Tresca, Perfectly Plastic):**
For $r_i \leq r \leq r_y$ (yielded zone):
$$\sigma_r^{\text{res}} = \frac{\sigma_y}{2} \left[ 2\ln\frac{r}{r_i} - \left(1 - \frac{r_i^2}{r^2}\right) \right]$$
$$\sigma_{\theta}^{\text{res}} = \frac{\sigma_y}{2} \left[ 2\ln\frac{r}{r_i} + \left(1 + \frac{r_i^2}{r^2}\right) \right]$$

For $r_y \leq r \leq r_o$ (elastic zone):
$$\sigma_r^{\text{res}} = -\frac{\sigma_y}{2} \frac{r_y^2}{r^2} \ln\frac{r_o^2}{r_y^2} \left(\frac{r_o^2}{r^2} - 1\right)$$
$$\sigma_{\theta}^{\text{res}} = -\frac{\sigma_y}{2} \frac{r_y^2}{r^2} \ln\frac{r_o^2}{r_y^2} \left(\frac{r_o^2}{r^2} + 1\right)$$

**At Inner Surface ($r = r_i$):**
$$\sigma_{\theta}^{\text{res}}(r_i) = -\sigma_y \quad \text{(COMPRESSIVE, magnitude = yield!)}$$

**Operating Stress + Residual:**
$$\sigma_{\theta}^{\text{total}} = \sigma_{\theta}^P + \sigma_{\theta}^{\text{res}}$$

**Effective Yield Pressure Increase:**
$$P_{y,\text{auto}} = P_{y,\text{virgin}} + \frac{\sigma_y}{2} \left(1 - \frac{r_y^2}{r_o^2}\right) \quad \text{(simplified)}$$

**Typical Gain:** 30–50% higher operating pressure for same weight.

**5.5.2 Overwrapped Composite Vessels (Type 3, 4, 5)**

**Architecture:**
- **Type 3:** Metallic liner (Al, Ti) + full composite overwrap
- **Type 4:** Polymer liner (HDPE, PA) + full composite overwrap
- **Type 5:** Linerless (composite only, non-permeable resin)

**Load Sharing (Internal Pressure):**
Liner and overwrap deform together → **strain compatibility** at interface.

**Hoop Strain Compatibility:**
$$\epsilon_{\theta}^{\text{liner}} = \epsilon_{\theta}^{\text{wrap}}$$

**Liner Stress (Thin, $t_l \ll r$):**
$$\sigma_{\theta}^l = E_l \epsilon_{\theta}$$

**Wrap Stress (Orthotropic, Filament Wound):**
$$\sigma_{\theta}^w = E_{\theta}^w \epsilon_{\theta}$$
$$\sigma_z^w = E_z^w \epsilon_z \quad \text{(from winding angle)}$$

**Force Equilibrium:**
$$P r = \sigma_{\theta}^l t_l + \sigma_{\theta}^w t_w$$

**Strain Solution:**
$$\epsilon_{\theta} = \frac{P r}{E_l t_l + E_{\theta}^w t_w}$$

**Liner Stress:**
$$\sigma_{\theta}^l = \frac{E_l}{E_l t_l + E_{\theta}^w t_w} P r$$

**Wrap Stress:**
$$\sigma_{\theta}^w = \frac{E_{\theta}^w}{E_l t_l + E_{\theta}^w t_w} P r$$

**Example: 700 bar H₂ Tank (Type 4)**
- $r = 200$ mm, $P = 70$ MPa
- Liner: HDPE, $t_l = 3$ mm, $E_l = 1$ GPa
- Wrap: Carbon/T700, $t_w = 15$ mm, $E_{\theta}^w = 100$ GPa

$$\epsilon_{\theta} = \frac{70 \times 200}{1 \times 3 + 100 \times 15} = \frac{14,000}{1,503} = 0.0093$$

$$\sigma_{\theta}^l = 1 \times 0.0093 = 9.3 \text{ MPa} \quad \text{(HDPE yield ~25 MPa, SF=2.7)}$$
$$\sigma_{\theta}^w = 100 \times 0.0093 = 930 \text{ MPa} \quad \text{(T700 strength ~2,500 MPa, SF=2.7)}$$

**Liner carries only 6% of load!** Composite does the work.

**5.5.3 External Pressure on Composite Overwrap**

**Critical Issue:** Composite overwrap is **excellent in tension, poor in compression**.
Under external pressure, liner compresses, overwrap sees **compressive hoop stress**.

**Buckling of Overwrap (Microbuckling):**
Fiber microbuckling stress:
$$\sigma_{\text{mb}} = \frac{G_m}{1-V_f} \quad \text{(shear mode)}$$
$$\sigma_{\text{mb}} = \frac{2 V_f}{\pi} \sqrt{\frac{E_f E_m}{3(1-V_f)}} \quad \text{(kink mode)}$$

For T700/epoxy ($V_f = 0.6$): $\sigma_{\text{mb}} \approx 1.5\text{–}2.0$ GPa

**But:** Liner provides support against buckling.
**Effective buckling pressure** depends on liner stiffness.

**Design Rule:** Type 3/4 vessels **not rated for external pressure** without internal support.
For subsea: Use **syntactic foam fairing** or **pressure-balanced design** (internal pressure = external).

---

*End of Piece 5 — DOC-05 Lines 4001-4100*
*Next: Piece 6 — Section 5.6 Non-Circular Cross-Sections & Flat Heads*