# DOC-04: Lamé Equations — Thick-Walled Cylinder Mechanics
## Document 4 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 2801-2900 | Piece 2 of 9 | ~100 Lines

---

#### 3.1.2 Differential Element Equilibrium — Radial Force Balance

Consider a **differential element** of a thick-walled cylinder in cylindrical coordinates $(r, \theta, z)$. The element spans:
- Radial: $r$ to $r + dr$
- Circumferential: $\theta$ to $\theta + d\theta$
- Axial: unit length ($dz = 1$)

**Forces on the Element:**

1. **Radial stress on inner face:** $\sigma_r(r) \cdot (r \, d\theta \cdot 1)$
2. **Radial stress on outer face:** $-\sigma_r(r+dr) \cdot ((r+dr) \, d\theta \cdot 1)$
3. **Hoop stress on circumferential faces:** $2 \cdot \sigma_{\theta} \cdot (dr \cdot 1) \cdot \sin(d\theta/2)$

For small $d\theta$: $\sin(d\theta/2) \approx d\theta/2$

**Hoop force resultant (radial component):**
$$2 \sigma_{\theta} dr \cdot \frac{d\theta}{2} = \sigma_{\theta} dr \, d\theta$$

**Equilibrium in Radial Direction ($\sum F_r = 0$):**
$$\sigma_r(r) r d\theta - \sigma_r(r+dr) (r+dr) d\theta + \sigma_{\theta} dr d\theta = 0$$

Divide by $d\theta$:
$$\sigma_r r - \sigma_r(r+dr)(r+dr) + \sigma_{\theta} dr = 0$$

Expand $\sigma_r(r+dr) = \sigma_r + \frac{d\sigma_r}{dr} dr$:
$$\sigma_r r - \left(\sigma_r + \frac{d\sigma_r}{dr} dr\right)(r + dr) + \sigma_{\theta} dr = 0$$

$$\sigma_r r - \left(\sigma_r r + \sigma_r dr + r \frac{d\sigma_r}{dr} dr + \frac{d\sigma_r}{dr} dr^2\right) + \sigma_{\theta} dr = 0$$

Neglect second-order term $dr^2$:
$$- \sigma_r dr - r \frac{d\sigma_r}{dr} dr + \sigma_{\theta} dr = 0$$

Divide by $dr$:
$$- \sigma_r - r \frac{d\sigma_r}{dr} + \sigma_{\theta} = 0$$

**Fundamental Equilibrium Equation:**
$$\frac{d\sigma_r}{dr} + \frac{\sigma_r - \sigma_{\theta}}{r} = 0$$

Or equivalently:
$$\frac{d}{dr}(r \sigma_r) = \sigma_{\theta}$$

**This is the exact equilibrium equation for axisymmetric cylindrical stress state — no approximations yet.**

---

*End of Piece 2 — DOC-04 Lines 2801-2900*
*Next: Piece 3 — Section 3.1.3 Strain-Displacement & Hooke's Law*