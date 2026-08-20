# DOC-04: Lamé Equations — Thick-Walled Cylinder Mechanics
## Document 4 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 3001-3100 | Piece 4 of 9 | ~100 Lines

---

#### 3.1.4 Integration to Lamé Stress Equations

**3.1.4.1 Eliminate Displacements — Stress Formulation**

From strain-displacement:
$$\epsilon_r = \frac{du}{dr}, \quad \epsilon_{\theta} = \frac{u}{r}$$

$$\frac{d}{dr}(r \epsilon_{\theta}) = \frac{d}{dr}(u) = \epsilon_r \quad \text{(compatibility)}$$

From Hooke's law (subtract hoop from radial):
$$\epsilon_r - \epsilon_{\theta} = \frac{1+\nu}{E} (\sigma_r - \sigma_{\theta})$$

Substitute compatibility:
$$\frac{d}{dr}(r \epsilon_{\theta}) - \epsilon_{\theta} = \frac{1+\nu}{E} (\sigma_r - \sigma_{\theta})$$

But $\epsilon_{\theta} = \frac{1}{E}[\sigma_{\theta} - \nu(\sigma_r + \sigma_z)]$ with $\sigma_z$ constant (generalized plane strain).

This path is algebraically heavy. **Simpler: Use the equilibrium equation directly with a stress function approach.**

**3.1.4.2 Lamé's Insight — Stress Function Form**

Assume stresses have the form:
$$\sigma_r = A - \frac{B}{r^2}$$
$$\sigma_{\theta} = A + \frac{B}{r^2}$$

Where $A, B$ are constants to be determined from boundary conditions.

**Verify Equilibrium:**
$$\frac{d\sigma_r}{dr} = \frac{2B}{r^3}$$
$$\frac{d\sigma_r}{dr} + \frac{\sigma_r - \sigma_{\theta}}{r} = \frac{2B}{r^3} + \frac{(A - B/r^2) - (A + B/r^2)}{r} = \frac{2B}{r^3} - \frac{2B}{r^3} = 0 \quad \checkmark$$

**The form satisfies equilibrium identically for any $A, B$.**

**3.1.4.3 Verify Compatibility (Strain Consistency)**

From Hooke's law:
$$\epsilon_r = \frac{1}{E}[\sigma_r - \nu \sigma_{\theta} - \nu \sigma_z]$$
$$\epsilon_{\theta} = \frac{1}{E}[\sigma_{\theta} - \nu \sigma_r - \nu \sigma_z]$$

Substitute stress form:
$$\epsilon_r = \frac{1}{E}\left[A(1-\nu) - \frac{B}{r^2}(1+\nu) - \nu \sigma_z\right]$$
$$\epsilon_{\theta} = \frac{1}{E}\left[A(1-\nu) + \frac{B}{r^2}(1+\nu) - \nu \sigma_z\right]$$

Check compatibility: $\frac{d}{dr}(r \epsilon_{\theta}) \stackrel{?}{=} \epsilon_r$

$$r \epsilon_{\theta} = \frac{r}{E}\left[A(1-\nu) - \nu \sigma_z\right] + \frac{B}{E}(1+\nu)\frac{1}{r}$$

$$\frac{d}{dr}(r \epsilon_{\theta}) = \frac{1}{E}\left[A(1-\nu) - \nu \sigma_z\right] - \frac{B}{E}(1+\nu)\frac{1}{r^2}$$

$$\epsilon_r = \frac{1}{E}\left[A(1-\nu) - \nu \sigma_z\right] - \frac{B}{E}(1+\nu)\frac{1}{r^2}$$

**They match exactly. The stress form satisfies compatibility for any constant $\sigma_z$.**

**3.1.4.4 Boundary Conditions — Determining A and B**

**General Case: Internal Pressure $P_i$, External Pressure $P_o$**

Radial stress boundary conditions:
$$\sigma_r(r_i) = -P_i \quad \text{(compressive, negative)}$$
$$\sigma_r(r_o) = -P_o$$

Sign convention: Tensile positive. Pressure acts inward → compressive radial stress.

Substitute $\sigma_r = A - B/r^2$:

At $r = r_i$:
$$A - \frac{B}{r_i^2} = -P_i \quad \text{(1)}$$

At $r = r_o$:
$$A - \frac{B}{r_o^2} = -P_o \quad \text{(2)}$$

Subtract (2) from (1):
$$B\left(\frac{1}{r_o^2} - \frac{1}{r_i^2}\right) = P_i - P_o$$
$$B \frac{r_i^2 - r_o^2}{r_i^2 r_o^2} = P_i - P_o$$
$$B = \frac{(P_i - P_o) r_i^2 r_o^2}{r_i^2 - r_o^2} = \frac{(P_i - P_o) r_i^2 r_o^2}{r_o^2 - r_i^2} \quad \text{(note sign)}$$

From (1):
$$A = -P_i + \frac{B}{r_i^2} = -P_i + \frac{(P_i - P_o) r_o^2}{r_o^2 - r_i^2}$$
$$A = \frac{-P_i(r_o^2 - r_i^2) + (P_i - P_o)r_o^2}{r_o^2 - r_i^2} = \frac{-P_i r_o^2 + P_i r_i^2 + P_i r_o^2 - P_o r_o^2}{r_o^2 - r_i^2}$$
$$A = \frac{P_i r_i^2 - P_o r_o^2}{r_o^2 - r_i^2}$$

**Lamé Constants:**
$$A = \frac{P_i r_i^2 - P_o r_o^2}{r_o^2 - r_i^2}$$
$$B = \frac{(P_i - P_o) r_i^2 r_o^2}{r_o^2 - r_i^2}$$

---

*End of Piece 4 — DOC-04 Lines 3001-3100*
*Next: Piece 5 — Section 3.1.5 Final Lamé Equations & Special Cases*