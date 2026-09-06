# DOC-04: Lamé Equations — Thick-Walled Cylinder Mechanics
## Document 4 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 3101-3200 | Piece 5 of 9 | ~100 Lines

---

#### 3.1.5 Final Lamé Equations & Special Cases

**3.1.5.1 General Lamé Stress Equations**

Substitute $A, B$ into $\sigma_r = A - B/r^2$, $\sigma_{\theta} = A + B/r^2$:

**Radial Stress:**
$$\sigma_r(r) = \frac{P_i r_i^2 - P_o r_o^2}{r_o^2 - r_i^2} - \frac{(P_i - P_o) r_i^2 r_o^2}{(r_o^2 - r_i^2) r^2}$$

**Hoop Stress:**
$$\sigma_{\theta}(r) = \frac{P_i r_i^2 - P_o r_o^2}{r_o^2 - r_i^2} + \frac{(P_i - P_o) r_i^2 r_o^2}{(r_o^2 - r_i^2) r^2}$$

**Axial Stress (Generalized Plane Strain):**
$$\sigma_z = \text{constant} = \frac{F_z}{\pi(r_o^2 - r_i^2)} + \nu(\sigma_r + \sigma_{\theta})_{\text{avg}}$$

For **closed ends**: $F_z = P_i \pi r_i^2 - P_o \pi r_o^2$
$$\sigma_z = \frac{P_i r_i^2 - P_o r_o^2}{r_o^2 - r_i^2} = A \quad \text{(constant!)}$$

For **open ends**: $F_z = 0$, but $\epsilon_z = \epsilon_0$ (constant) determined by compatibility.

**3.1.5.2 Special Case 1: Internal Pressure Only ($P_o = 0$)**

$$A = \frac{P_i r_i^2}{r_o^2 - r_i^2}, \quad B = \frac{P_i r_i^2 r_o^2}{r_o^2 - r_i^2}$$

$$\sigma_r(r) = \frac{P_i r_i^2}{r_o^2 - r_i^2} \left(1 - \frac{r_o^2}{r^2}\right)$$
$$\sigma_{\theta}(r) = \frac{P_i r_i^2}{r_o^2 - r_i^2} \left(1 + \frac{r_o^2}{r^2}\right)$$

**At Inner Surface ($r = r_i$):**
$$\sigma_r(r_i) = -P_i$$
$$\sigma_{\theta}(r_i) = P_i \frac{r_o^2 + r_i^2}{r_o^2 - r_i^2} \quad \text{(MAXIMUM HOOP STRESS)}$$

**At Outer Surface ($r = r_o$):**
$$\sigma_r(r_o) = 0$$
$$\sigma_{\theta}(r_o) = \frac{2 P_i r_i^2}{r_o^2 - r_i^2}$$

**Stress Ratio (Inner/Outer Hoop):**
$$\frac{\sigma_{\theta}(r_i)}{\sigma_{\theta}(r_o)} = \frac{r_o^2 + r_i^2}{2 r_i^2} = \frac{1}{2}\left(k^2 + 1\right) \quad (k = r_o/r_i)$$

For $k=1.1$ (thin): ratio = 1.105
For $k=2.0$ (thick): ratio = 2.5

**3.1.5.3 Special Case 2: External Pressure Only ($P_i = 0$)**

$$A = \frac{-P_o r_o^2}{r_o^2 - r_i^2}, \quad B = \frac{-P_o r_i^2 r_o^2}{r_o^2 - r_i^2}$$

$$\sigma_r(r) = \frac{-P_o r_o^2}{r_o^2 - r_i^2} \left(1 - \frac{r_i^2}{r^2}\right)$$
$$\sigma_{\theta}(r) = \frac{-P_o r_o^2}{r_o^2 - r_i^2} \left(1 + \frac{r_i^2}{r^2}\right)$$

**Both stresses are COMPRESSIVE (negative) everywhere.**

**At Inner Surface ($r = r_i$):**
$$\sigma_r(r_i) = 0$$
$$\sigma_{\theta}(r_i) = -P_o \frac{2 r_o^2}{r_o^2 - r_i^2} \quad \text{(MAXIMUM COMPRESSIVE HOOP)}$$

**At Outer Surface ($r = r_o$):**
$$\sigma_r(r_o) = -P_o$$
$$\sigma_{\theta}(r_o) = -P_o \frac{r_o^2 + r_i^2}{r_o^2 - r_i^2}$$

**Critical Insight for Subsea Hulls:** Under external pressure, the **maximum compressive stress is at the INNER surface** — opposite to internal pressure case. This governs **buckling and plastic collapse** initiation.

**3.1.5.4 Thin-Wall Limit ($r_o \to r_i = r, t = r_o - r_i \ll r$)**

Let $r = (r_i + r_o)/2$, $t = r_o - r_i$, $k = 1 + t/r \approx 1$.

$$r_o^2 - r_i^2 = (r_o - r_i)(r_o + r_i) \approx t \cdot 2r$$
$$r_o^2 + r_i^2 \approx 2r^2$$

Internal pressure only:
$$\sigma_{\theta}(r_i) \approx P_i \frac{2r^2}{2rt} = \frac{P_i r}{t} \quad \text{(Thin-wall formula ✓)}$$
$$\sigma_{\theta}(r_o) \approx \frac{2 P_i r^2}{2rt} = \frac{P_i r}{t} \quad \text{(Uniform ✓)}$$

**Radial stress:** $\sigma_r \approx 0$ (varies from -$P_i$ to 0 over $t$)

**3.1.5.5 Spherical Shell (Lamé for Sphere) — Brief Note**

For a **thick-walled sphere** (deep-sea pressure hulls, e.g., Trieste sphere):

$$\sigma_r(r) = \frac{P_i r_i^3 - P_o r_o^3}{r_o^3 - r_i^3} - \frac{(P_i - P_o) r_i^3 r_o^3}{(r_o^3 - r_i^3) r^3}$$
$$\sigma_{\theta}(r) = \sigma_{\phi}(r) = \frac{P_i r_i^3 - P_o r_o^3}{r_o^3 - r_i^3} + \frac{(P_i - P_o) r_i^3 r_o^3}{2(r_o^3 - r_i^3) r^3}$$

**Hoop stress is half the cylinder value at same $r/t$** — spheres are more efficient.

---

*End of Piece 5 — DOC-04 Lines 3101-3200*
*Next: Piece 6 — Section 3.1.6 Maximum Shear Stress & Yield Criteria*