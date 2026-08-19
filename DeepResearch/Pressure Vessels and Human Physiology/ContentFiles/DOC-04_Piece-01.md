# DOC-04: Lamé Equations — Thick-Walled Cylinder Mechanics
## Document 4 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 2701-3600 | Piece 1 of 9 | ~100 Lines

---

### ABSTRACT

This document provides the complete mathematical derivation of **Lamé's equations** for stress distribution in thick-walled cylinders under internal and external pressure. Starting from first principles of continuum mechanics — equilibrium of a differential element, strain-displacement relations, Hooke's law for isotropic materials, and boundary conditions — we derive the radial and tangential (hoop) stress distributions. The analysis covers both open-ended and closed-ended cylinders, generalized plane strain conditions, and the transition to thin-wall approximations. Applications to PVHO structures (submersible hulls, hyperbaric chambers, viewport mountings) are developed with numerical examples. The Tresca and von Mises yield criteria are applied to determine pressure limits for ductile materials.

**Keywords:** Lamé equations, thick-walled cylinder, pressure vessel mechanics, radial stress, hoop stress, generalized plane strain, Tresca yield criterion, von Mises yield criterion, PVHO structural analysis

---

### 3. SOLID MECHANICS OF THICK-WALLED PRESSURE BOUNDARIES

#### 3.1 Derivation and Application of Lamé's Equations

**3.1.1 When Thin-Wall Theory Fails — The Validity Criterion**

The classical thin-wall membrane approximation for hoop stress:
$$\sigma_{\theta} = \frac{\Delta P \cdot r}{t}$$
assumes **uniform stress through the thickness** and **negligible radial stress** ($\sigma_r \approx 0$).

This is valid only when:
$$\frac{t}{r_i} \ll \frac{1}{20} \quad \text{or} \quad \frac{r_o}{r_i} < 1.1$$

**Derivation of Criterion:**
For a cylinder with internal pressure $P_i$ and external pressure $P_o = 0$:
- Thin-wall hoop stress: $\sigma_{\theta,thin} = \frac{P_i r_i}{t}$
- Thick-wall maximum hoop stress (at inner surface, from Lamé): $\sigma_{\theta,max} = P_i \frac{r_o^2 + r_i^2}{r_o^2 - r_i^2}$

**Ratio:**
$$\frac{\sigma_{\theta,max}}{\sigma_{\theta,thin}} = \frac{r_o^2 + r_i^2}{r_o^2 - r_i^2} \cdot \frac{t}{r_i} = \frac{(r_o/r_i)^2 + 1}{(r_o/r_i)^2 - 1} \cdot \left(\frac{r_o}{r_i} - 1\right)$$

Let $k = r_o/r_i = 1 + t/r_i$:
$$\frac{\sigma_{\theta,max}}{\sigma_{\theta,thin}} = \frac{k^2 + 1}{k^2 - 1} (k - 1) = \frac{k+1}{k-1} \cdot \frac{k-1}{k} \cdot \frac{k^2 + 1}{k^2 - 1} \quad \text{... simplifying}$$
$$= \frac{k^2 + 1}{k(k+1)} = \frac{(1+t/r_i)^2 + 1}{(1+t/r_i)(2+t/r_i)}$$

For $t/r_i = 0.05$ (1/20): Ratio = 1.024 → **2.4% error**
For $t/r_i = 0.10$: Ratio = 1.095 → **9.5% error**
For $t/r_i = 0.20$: Ratio = 1.33 → **33% error**

**PVHO Thickness Ratios:**
| PVHO Class | $r_i$ [m] | $t$ [m] | $t/r_i$ | Theory Required |
|------------|-----------|---------|---------|-----------------|
| Aircraft fuselage | 1.8 | 0.002 | 0.001 | Thin-wall ✓ |
| Hyperbaric chamber | 1.5 | 0.050 | 0.033 | **Lamé required** |
| Submersible hull (Shinkai) | 1.0 | 0.150 | 0.150 | **Lamé required** |
| Deep-sea sphere (Trieste) | 1.0 | 0.250 | 0.250 | **Lamé + plasticity** |
| Viewport flange | 0.2 | 0.100 | 0.500 | **Lamé + FEA** |

---

*End of Piece 1 — DOC-04 Lines 2701-2800*
*Next: Piece 2 — Section 3.1.2 Differential Element Equilibrium*