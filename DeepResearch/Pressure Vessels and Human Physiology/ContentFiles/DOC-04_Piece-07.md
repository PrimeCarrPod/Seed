# DOC-04: Lamé Equations — Thick-Walled Cylinder Mechanics
## Document 4 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 3301-3400 | Piece 7 of 9 | ~100 Lines

---

#### 3.1.7 Displacement Solution & Strain Energy

**3.1.7.1 Radial Displacement Field**

From $\epsilon_{\theta} = u/r$ and Hooke's law:
$$\epsilon_{\theta} = \frac{1}{E}[\sigma_{\theta} - \nu \sigma_r - \nu \sigma_z]$$

$$u(r) = r \epsilon_{\theta} = \frac{r}{E}[\sigma_{\theta} - \nu \sigma_r - \nu \sigma_z]$$

Substitute Lamé stresses ($\sigma_r = A - B/r^2$, $\sigma_{\theta} = A + B/r^2$):

$$u(r) = \frac{r}{E}\left[(A + B/r^2) - \nu(A - B/r^2) - \nu \sigma_z\right]$$
$$= \frac{r}{E}\left[A(1-\nu) + \frac{B}{r^2}(1+\nu) - \nu \sigma_z\right]$$

**For Internal Pressure Only ($P_o = 0$), Closed Ends ($\sigma_z = A$):**
$$A = \frac{P_i r_i^2}{r_o^2 - r_i^2}, \quad B = \frac{P_i r_i^2 r_o^2}{r_o^2 - r_i^2}, \quad \sigma_z = A$$

$$u(r) = \frac{r}{E}\left[A(1-\nu) + \frac{B}{r^2}(1+\nu) - \nu A\right] = \frac{r}{E}\left[A(1-2\nu) + \frac{B}{r^2}(1+\nu)\right]$$

$$u(r) = \frac{P_i r_i^2}{E(r_o^2 - r_i^2)} \left[ r(1-2\nu) + \frac{r_o^2}{r}(1+\nu) \right]$$

**Inner Surface Displacement ($r = r_i$):**
$$u(r_i) = \frac{P_i r_i}{E} \left[ \frac{(1-2\nu)r_i^2 + (1+\nu)r_o^2}{r_o^2 - r_i^2} \right]$$

**Outer Surface Displacement ($r = r_o$):**
$$u(r_o) = \frac{P_i r_i^2}{E r_o} \left[ \frac{(1-2\nu)r_o^2 + (1+\nu)r_o^2}{r_o^2 - r_i^2} \right] = \frac{2 P_i r_i^2 r_o}{E(r_o^2 - r_i^2)}$$

**Volume Change (per unit length):**
$$\Delta V = \pi (r_i + u_i)^2 - \pi r_i^2 \approx 2\pi r_i u_i \quad \text{(small displacement)}$$

**Compliance (Displacement per Pressure):**
$$C = \frac{u(r_i)}{P_i} = \frac{r_i}{E} \left[ \frac{(1-2\nu)r_i^2 + (1+\nu)r_o^2}{r_o^2 - r_i^2} \right]$$

**3.1.7.2 Strain Energy & Castigliano's Theorem**

Strain energy density:
$$W = \frac{1}{2} \boldsymbol{\sigma} : \boldsymbol{\epsilon} = \frac{1}{2}(\sigma_r \epsilon_r + \sigma_{\theta} \epsilon_{\theta} + \sigma_z \epsilon_z)$$

Total strain energy (per unit length):
$$U = \int_{r_i}^{r_o} W \cdot 2\pi r dr$$

For linear elasticity, $U = \frac{1}{2} P_i \Delta V = \frac{1}{2} P_i (2\pi r_i u_i)$

**Castigliano's Theorem Verification:**
$$\frac{\partial U}{\partial P_i} = \pi r_i u_i + \frac{1}{2} P_i \pi r_i \frac{\partial u_i}{\partial P_i} = \pi r_i u_i + \frac{1}{2} \pi r_i u_i = \frac{3}{2} \pi r_i u_i \quad \text{(wait...)}$$

Actually, $U = \frac{1}{2} P_i \delta_i$ where $\delta_i = 2\pi r_i u_i$ (radial displacement of inner surface times circumference).

$$\frac{\partial U}{\partial P_i} = \frac{1}{2} \delta_i + \frac{1}{2} P_i \frac{\partial \delta_i}{\partial P_i} = \frac{1}{2} \delta_i + \frac{1}{2} \delta_i = \delta_i \quad \text{(linear elasticity)} \quad \checkmark$$

**3.1.7.3 Thermal Stress Superposition (PVHO Relevance)**

For a temperature distribution $T(r)$ in a thick cylinder:

**Thermal Strain:** $\epsilon_{\text{th}} = \alpha \Delta T(r)$ (free expansion)
**Thermal Stress:** Arises from constraint of thermal expansion.

**Governing Equation (with thermal):**
$$\frac{d}{dr}\left(\frac{1}{r} \frac{d}{dr}(r u)\right) = (1+\nu) \alpha \frac{dT}{dr}$$

**Solution for Linear Gradient $T(r) = T_i + (T_o - T_i)\frac{r - r_i}{r_o - r_i}$:**

Radial displacement:
$$u_{\text{th}}(r) = \frac{\alpha}{r} \int_{r_i}^r T(r) r dr + C_1 r + \frac{C_2}{r}$$

Thermal stresses (from Hooke's law with total strain = mechanical + thermal):
$$\sigma_r = \frac{E}{1-\nu} \left[ \frac{du}{dr} - \alpha T - \frac{\nu}{r}(u - \alpha \int T dr) \right]$$

**PVHO Application: Hyperbaric Chamber Fire Scenario**
- Inner surface: $T = 800°C$ (fire)
- Outer surface: $T = 50°C$ (ambient)
- Gradient through 50 mm steel wall
- Thermal stress adds to pressure stress → **must be combined in design**

---

*End of Piece 7 — DOC-04 Lines 3301-3400*
*Next: Piece 8 — Section 3.1.8 PVHO Applications: Numerical Examples*