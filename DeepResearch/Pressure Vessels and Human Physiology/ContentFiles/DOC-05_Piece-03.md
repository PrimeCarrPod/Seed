# DOC-05: Lamé Applications — Internal vs. External Pressure Regimes
## Document 5 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 3801-3900 | Piece 3 of 9 | ~100 Lines

---

#### 5.3 Combined Loading: Pressure + Thermal + Axial

**5.3.1 Superposition Principle**

For linear elasticity, stresses from multiple loads **superpose**:
$$\boldsymbol{\sigma}_{\text{total}} = \boldsymbol{\sigma}_{\text{pressure}} + \boldsymbol{\sigma}_{\text{thermal}} + \boldsymbol{\sigma}_{\text{axial}} + \boldsymbol{\sigma}_{\text{bending}} + \boldsymbol{\sigma}_{\text{residual}}$$

**Each component solved independently, then added.**

**5.3.2 Thermal Stress in Thick Cylinder**

**Temperature Distribution (Steady State, Radial Only):**
$$T(r) = T_i + (T_o - T_i) \frac{\ln(r/r_i)}{\ln(r_o/r_i)} \quad \text{(logarithmic for cylinder)}$$

**For Linear Approximation (small $t/r$):**
$$T(r) \approx T_i + (T_o - T_i) \frac{r - r_i}{r_o - r_i}$$

**Thermal Strain (Free):**
$$\epsilon_{\text{th}}(r) = \alpha [T(r) - T_{\text{ref}}]$$

**Thermal Stress (Constrained Expansion):**
Solve equilibrium with thermal strain as eigenstrain:
$$\frac{d\sigma_r}{dr} + \frac{\sigma_r - \sigma_{\theta}}{r} = 0$$
$$\epsilon_r = \frac{du}{dr}, \quad \epsilon_{\theta} = \frac{u}{r}$$
$$\epsilon_r = \frac{1}{E}[\sigma_r - \nu \sigma_{\theta} - \nu \sigma_z] + \alpha \Delta T(r)$$
$$\epsilon_{\theta} = \frac{1}{E}[\sigma_{\theta} - \nu \sigma_r - \nu \sigma_z] + \alpha \Delta T(r)$$

**Solution (Timoshenko, Goodier):**
$$\sigma_r^{\text{th}}(r) = \frac{E \alpha}{1-\nu} \left[ \frac{1}{r^2} \int_{r_i}^r T(r) r dr - \frac{1}{r_o^2 - r_i^2} \int_{r_i}^{r_o} T(r) r dr \right]$$

$$\sigma_{\theta}^{\text{th}}(r) = \frac{E \alpha}{1-\nu} \left[ \frac{1}{r^2} \int_{r_i}^r T(r) r dr + T(r) - \frac{1}{r_o^2 - r_i^2} \int_{r_i}^{r_o} T(r) r dr \right]$$

**For Linear Gradient $T(r) = T_i + \Delta T \frac{r - r_i}{t}$:**
$$\int T(r) r dr = \frac{T_i r^2}{2} + \Delta T \frac{r^3}{3t} - \Delta T \frac{r_i r^2}{2t} + C$$

**Result at Inner Surface ($r = r_i$):**
$$\sigma_r^{\text{th}}(r_i) = 0$$
$$\sigma_{\theta}^{\text{th}}(r_i) = \frac{E \alpha \Delta T}{1-\nu} \frac{1 + \nu}{2} \frac{r_o}{r_o + r_i} \quad \text{(tensile if $T_i > T_o$)}$$

**At Outer Surface ($r = r_o$):**
$$\sigma_{\theta}^{\text{th}}(r_o) = -\frac{E \alpha \Delta T}{1-\nu} \frac{1 + \nu}{2} \frac{r_i}{r_o + r_i} \quad \text{(compressive if $T_i > T_o$)}$$

**5.3.3 PVHO Thermal Scenarios**

| Scenario | $\Delta T$ | Location | Effect |
|----------|------------|----------|--------|
| **Hyperbaric Chamber Fire** | 800°C (inside) → 50°C (outside) | Inner surface tensile | Adds to pressure stress → **Critical** |
| **Submersible Cold Soak** | 25°C (inside) → 2°C (outside) | Outer surface tensile | Subtracts from external pressure compression |
| **Aircraft Skin** | -50°C (outside) → 20°C (inside) | Inner surface compressive | Adds to pressure tensile |
| **Spacecraft Sun/Eclipse** | +150°C / -100°C cycling | Through-thickness | **Fatigue driver** (thermal cycling) |

**5.3.4 Combined Stress Example: Hyperbaric Chamber Fire**

**Parameters (from DOC-04 §3.1.8.1):**
- $r_i = 1.5$ m, $t = 40$ mm, $P_i = 600$ kPa
- Fire: $T_i = 800°C$, $T_o = 50°C$, $\Delta T = 750°C$
- Steel: $E = 200$ GPa, $\alpha = 12 \times 10^{-6}$/°C, $\nu = 0.3$

**Pressure Stresses (at inner surface):**
$$\sigma_{\theta}^P = 18.3 \text{ MPa}, \quad \sigma_r^P = -0.6 \text{ MPa}$$

**Thermal Stresses (at inner surface):**
$$\sigma_{\theta}^{\text{th}} = \frac{200 \times 10^3 \times 12 \times 10^{-6} \times 750}{1-0.3} \times \frac{1.3}{2} \times \frac{1.54}{3.04} = 2,571 \times 0.65 \times 0.506 = 847 \text{ MPa}$$

**Total von Mises at Inner Surface:**
$$\sigma_1 = \sigma_{\theta}^{\text{total}} = 18.3 + 847 = 865 \text{ MPa}$$
$$\sigma_2 = \sigma_z^{\text{total}} = 8.8 + \sigma_z^{\text{th}} \approx 8.8 + 423 = 432 \text{ MPa}$$
$$\sigma_3 = \sigma_r^{\text{total}} = -0.6 \text{ MPa}$$

$$\sigma_{\text{vm}} = \sqrt{\frac{1}{2}[(865-432)^2 + (432+0.6)^2 + (-0.6-865)^2]} = \sqrt{0.5[187,489 + 186,624 + 749,952]} = \sqrt{562,032} = 750 \text{ MPa}$$

**Yield Strength at 800°C:** $\sigma_y(800°C) \approx 50$ MPa (for carbon steel)
**Total Stress (750 MPa) $\gg$ Hot Yield (50 MPa) → PLASTIC DEFORMATION**

**This is why fire protection (insulation, deluge) is MANDATORY for PVHOs.**

---

*End of Piece 3 — DOC-05 Lines 3801-3900*
*Next: Piece 4 — Section 5.4 Interference Fits & Viewport Sealing*