# DOC-04: Lamé Equations — Thick-Walled Cylinder Mechanics
## Document 4 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 2901-3000 | Piece 3 of 9 | ~100 Lines

---

#### 3.1.3 Strain-Displacement Relations & Hooke's Law

**3.1.3.1 Kinematics — Axisymmetric Deformation**

For axisymmetric deformation (no $\theta$ or $z$ dependence), the displacement field is purely radial:
$$\vec{u} = u(r) \hat{e}_r$$

**Strain Components (Cylindrical Coordinates):**

Radial strain:
$$\epsilon_r = \frac{du}{dr}$$

Hoop (circumferential) strain:
$$\epsilon_{\theta} = \frac{u}{r}$$

Axial strain:
$$\epsilon_z = \text{constant} \quad \text{(generalized plane strain)}$$

Shear strains: $\epsilon_{r\theta} = \epsilon_{\theta z} = \epsilon_{zr} = 0$ (axisymmetry)

**Compatibility:**
$$\frac{d}{dr}(r \epsilon_{\theta}) = \epsilon_r$$

Substituting $\epsilon_{\theta} = u/r$:
$$\frac{d}{dr}\left(r \cdot \frac{u}{r}\right) = \frac{du}{dr} = \epsilon_r \quad \checkmark$$

**3.1.3.2 Hooke's Law — Isotropic Linear Elasticity**

For isotropic material (Young's modulus $E$, Poisson's ratio $\nu$):

$$\epsilon_r = \frac{1}{E} [\sigma_r - \nu(\sigma_{\theta} + \sigma_z)]$$
$$\epsilon_{\theta} = \frac{1}{E} [\sigma_{\theta} - \nu(\sigma_r + \sigma_z)]$$
$$\epsilon_z = \frac{1}{E} [\sigma_z - \nu(\sigma_r + \sigma_{\theta})]$$

**Invert for Stresses:**
$$\sigma_r = \frac{E}{(1+\nu)(1-2\nu)} [(1-\nu)\epsilon_r + \nu \epsilon_{\theta} + \nu \epsilon_z]$$
$$\sigma_{\theta} = \frac{E}{(1+\nu)(1-2\nu)} [(1-\nu)\epsilon_{\theta} + \nu \epsilon_r + \nu \epsilon_z]$$
$$\sigma_z = \frac{E}{(1+\nu)(1-2\nu)} [(1-\nu)\epsilon_z + \nu \epsilon_r + \nu \epsilon_{\theta}]$$

**Define Lamé Constants:**
$$\lambda = \frac{E \nu}{(1+\nu)(1-2\nu)}, \quad \mu = \frac{E}{2(1+\nu)} \quad \text{(shear modulus)}$$

Then:
$$\sigma_r = 2\mu \epsilon_r + \lambda (\epsilon_r + \epsilon_{\theta} + \epsilon_z)$$
$$\sigma_{\theta} = 2\mu \epsilon_{\theta} + \lambda (\epsilon_r + \epsilon_{\theta} + \epsilon_z)$$
$$\sigma_z = 2\mu \epsilon_z + \lambda (\epsilon_r + \epsilon_{\theta} + \epsilon_z)$$

**3.1.3.3 Generalized Plane Strain — The PVHO Condition**

For a **long cylinder** (length $\gg$ diameter) with **closed ends** or **constrained ends**:
- $\epsilon_z = \text{constant} = \epsilon_0$ (not necessarily zero)
- This is **generalized plane strain** (not plane strain where $\epsilon_z = 0$, not plane stress where $\sigma_z = 0$)

**Axial Force Equilibrium:**
$$F_z = \int_{r_i}^{r_o} \sigma_z \cdot 2\pi r dr = P_i \pi r_i^2 - P_o \pi r_o^2 \quad \text{(closed ends)}$$

For **open-ended** (pipe, no end caps): $F_z = 0$, but $\epsilon_z$ still constant due to constraint.

**We solve for $\epsilon_0$ using the axial force condition after finding $\sigma_r(r), \sigma_{\theta}(r)$.**

---

*End of Piece 3 — DOC-04 Lines 2901-3000*
*Next: Piece 4 — Section 3.1.4 Integration to Lamé Stress Equations*