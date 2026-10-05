# DOC-04: Lamé Equations — Thick-Walled Cylinder Mechanics
## Document 4 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 3201-3300 | Piece 6 of 9 | ~100 Lines

---

#### 3.1.6 Maximum Shear Stress & Yield Criteria

**3.1.6.1 Principal Stresses in Cylindrical Coordinates**

For axisymmetric thick-walled cylinder, the stress tensor is diagonal:
$$\boldsymbol{\sigma} = \begin{bmatrix}
\sigma_r & 0 & 0 \\
0 & \sigma_{\theta} & 0 \\
0 & 0 & \sigma_z
\end{bmatrix}$$

The principal stresses are simply:
$$\sigma_1 = \max(\sigma_r, \sigma_{\theta}, \sigma_z)$$
$$\sigma_2 = \text{mid}(\sigma_r, \sigma_{\theta}, \sigma_z)$$
$$\sigma_3 = \min(\sigma_r, \sigma_{\theta}, \sigma_z)$$

**Ordering for Internal Pressure ($P_i > 0, P_o = 0$):**
- $\sigma_{\theta} > 0$ (tensile)
- $\sigma_z > 0$ (tensile, for closed ends)
- $\sigma_r \leq 0$ (compressive, zero at outer surface)

$$\sigma_1 = \sigma_{\theta}, \quad \sigma_2 = \sigma_z, \quad \sigma_3 = \sigma_r$$

**Ordering for External Pressure ($P_i = 0, P_o > 0$):**
- All stresses compressive ($\leq 0$)
- $\sigma_r$ most compressive at outer surface
- $\sigma_{\theta}$ most compressive at inner surface

$$\sigma_1 = 0 \text{ (or least compressive)}, \quad \sigma_2 = \text{mid}, \quad \sigma_3 = \text{most compressive}$$

**3.1.6.2 Maximum Shear Stress (Tresca Criterion)**

The maximum shear stress at any point:
$$\tau_{\max} = \frac{\sigma_1 - \sigma_3}{2}$$

**For Internal Pressure (Critical at Inner Surface $r = r_i$):**
$$\sigma_1 = \sigma_{\theta}(r_i) = P_i \frac{r_o^2 + r_i^2}{r_o^2 - r_i^2}$$
$$\sigma_3 = \sigma_r(r_i) = -P_i$$

$$\tau_{\max} = \frac{1}{2} \left[ P_i \frac{r_o^2 + r_i^2}{r_o^2 - r_i^2} + P_i \right] = \frac{P_i}{2} \left[ \frac{r_o^2 + r_i^2 + r_o^2 - r_i^2}{r_o^2 - r_i^2} \right]$$

$$\tau_{\max} = \frac{P_i r_o^2}{r_o^2 - r_i^2}$$

**Tresca Yield Criterion:** $\tau_{\max} \leq \sigma_y / 2$

**Yield Pressure (Internal, Tresca):**
$$P_{y,\text{Tresca}} = \frac{\sigma_y}{2} \frac{r_o^2 - r_i^2}{r_o^2} = \frac{\sigma_y}{2} \left(1 - \frac{r_i^2}{r_o^2}\right) = \frac{\sigma_y}{2} \left(1 - \frac{1}{k^2}\right)$$

**3.1.6.3 von Mises (Distortion Energy) Criterion**

von Mises equivalent stress:
$$\sigma_{\text{vm}} = \sqrt{\frac{1}{2}\left[(\sigma_1 - \sigma_2)^2 + (\sigma_2 - \sigma_3)^2 + (\sigma_3 - \sigma_1)^2\right]}$$

**At Inner Surface (Internal Pressure, Closed Ends):**
$$\sigma_1 = \sigma_{\theta}(r_i) = P_i \frac{k^2 + 1}{k^2 - 1}$$
$$\sigma_2 = \sigma_z = P_i \frac{1}{k^2 - 1}$$
$$\sigma_3 = \sigma_r(r_i) = -P_i$$

Let $\alpha = P_i / (k^2 - 1)$:
$$\sigma_1 = \alpha(k^2 + 1), \quad \sigma_2 = \alpha, \quad \sigma_3 = -\alpha(k^2 - 1)$$

$$\sigma_{\text{vm}}^2 = \frac{1}{2}\left[(\alpha k^2)^2 + (\alpha + \alpha(k^2 - 1))^2 + (-\alpha(k^2 - 1) - \alpha(k^2 + 1))^2\right]$$
$$= \frac{\alpha^2}{2}\left[k^4 + k^4 + 4k^4\right] = 3 \alpha^2 k^4$$

$$\sigma_{\text{vm}} = \sqrt{3} \alpha k^2 = \sqrt{3} P_i \frac{k^2}{k^2 - 1}$$

**Yield Pressure (Internal, von Mises):**
$$P_{y,\text{VM}} = \frac{\sigma_y}{\sqrt{3}} \frac{k^2 - 1}{k^2} = \frac{\sigma_y}{\sqrt{3}} \left(1 - \frac{1}{k^2}\right)$$

**Comparison Tresca vs. von Mises:**
$$\frac{P_{y,\text{VM}}}{P_{y,\text{Tresca}}} = \frac{2}{\sqrt{3}} \approx 1.155$$

**von Mises predicts 15.5% higher yield pressure** (less conservative).

**3.1.6.4 Yield Pressure Comparison — Thick vs. Thin Wall**

| $k = r_o/r_i$ | $P_{y,\text{Tresca}} / \sigma_y$ | $P_{y,\text{VM}} / \sigma_y$ | Thin-Wall $P_y / \sigma_y$ |
|---------------|----------------------------------|------------------------------|---------------------------|
| 1.05 (t/r=0.05) | 0.0476 | 0.0550 | $t/r = 0.05$ |
| 1.10 (t/r=0.10) | 0.0917 | 0.106 | $t/r = 0.10$ |
| 1.25 (t/r=0.25) | 0.210 | 0.243 | $t/r = 0.25$ |
| 1.50 (t/r=0.50) | 0.333 | 0.385 | $t/r = 0.50$ |
| 2.00 (t/r=1.00) | 0.375 | 0.433 | N/A |
| 3.00 (t/r=2.00) | 0.417 | 0.481 | N/A |

**As $k \to \infty$ (very thick):** $P_y \to \sigma_y/2$ (Tresca) or $\sigma_y/\sqrt{3}$ (von Mises)
**This is the "infinite cylinder" limit — same as plane strain indentation.**

**3.1.6.5 External Pressure Yield — Different Mechanism**

For external pressure, stresses are compressive. Yield criteria for compression:
- **Tresca:** Same formula, but $P_o$ instead of $P_i$
- **von Mises:** Same formula

**However:** For ductile materials under compression, **plastic collapse** (not yield initiation) is the failure mode. The structure collapses when the **entire cross-section yields** — limit load analysis.

**Limit Pressure (Plastic Collapse, Tresca, Perfectly Plastic):**
$$P_{\text{collapse}} = 2 \sigma_y \ln\left(\frac{r_o}{r_i}\right) = 2 \sigma_y \ln k$$

**Comparison:**
| $k$ | $P_{y,\text{Tresca}}/\sigma_y$ (Initial Yield) | $P_{\text{collapse}}/\sigma_y$ (Full Plastic) |
|-----|-----------------------------------------------|---------------------------------------------|
| 1.10 | 0.0917 | 0.191 |
| 1.25 | 0.210 | 0.446 |
| 1.50 | 0.333 | 0.811 |
| 2.00 | 0.375 | 1.386 |
| 3.00 | 0.417 | 2.197 |

**Large gap between initial yield and collapse for thick walls** — this is the **strain hardening reserve**. For strain-hardening materials, collapse pressure is higher.

---

*End of Piece 6 — DOC-04 Lines 3201-3300*
*Next: Piece 7 — Section 3.1.7 Displacement Solution & Strain Energy*