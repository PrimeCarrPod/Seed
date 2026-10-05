# DOC-05: Lamé Applications — Internal vs. External Pressure Regimes
## Document 5 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 4101-4200 | Piece 6 of 9 | ~100 Lines

---

#### 5.6 Non-Circular Cross-Sections & Flat Heads

**5.6.1 Oval/Elliptical Cross-Section (Saturation Habitat, Airlocks)**

**Geometry:** Semi-axes $a$ (horizontal), $b$ (vertical), $a > b$.
**Internal Pressure $P$.**

**Membrane Theory (Thin Wall, $t \ll b$):**
$$\sigma_{\theta} = \frac{P \rho}{t}$$
Where $\rho$ = local radius of curvature.

**At Crown (top, $\rho = b^2/a$):**
$$\sigma_{\theta,\text{crown}} = \frac{P b^2}{a t}$$

**At Sides (equator, $\rho = a^2/b$):**
$$\sigma_{\theta,\text{side}} = \frac{P a^2}{b t}$$

**Stress Ratio (Side/Crown):**
$$\frac{\sigma_{\text{side}}}{\sigma_{\text{crown}}} = \left(\frac{a}{b}\right)^3$$

**For $a/b = 1.5$ (typical habitat):** Side stress = **3.4× crown stress**.
**Design governed by side stress.**

**Bending Stresses (Junction to Cylinder):**
Elliptical head to cylinder junction → discontinuity stresses.
Use **Bijlaard equations** or **FEA**.
ASME VIII-1 provides charts for $\sigma_{\text{discontinuity}}$.

**5.6.2 Flat Circular Heads (Chamber End Caps, Viewport Flanges)**

**Thin Plate, Clamped Edge, Uniform Pressure $P$:**

**Maximum Stress (at edge, radial):**
$$\sigma_{\max} = \frac{3}{4} P \left(\frac{r}{t}\right)^2 \quad \text{(clamped)}$$
$$\sigma_{\max} = \frac{3}{2} P \left(\frac{r}{t}\right)^2 \quad \text{(simply supported)}$$

**Center Deflection:**
$$\delta_{\max} = \frac{P r^4}{64 D} \quad \text{(clamped)}, \quad D = \frac{E t^3}{12(1-\nu^2)}$$

**ASME VIII-1 (UG-34) Design Formula:**
$$t = r \sqrt{\frac{C P}{\sigma_{\text{allow}}}}$$
Where $C = 0.33$ (clamped), $0.5$ (simply supported), $1.0$ (unreinforced).

**5.6.3 Rectangular Cross-Section (Hyperbaric Chamber Door, Airlock)**

**Membrane Stresses (Simplified):**
- Long walls: $\sigma = P b / (2 t)$ (where $b$ = short span)
- Short walls: $\sigma = P a / (2 t)$ (where $a$ = long span)
- **Corner stress concentration: $K_t \approx 1.5\text{–}2.0$**

**ASME PVHO-1 Rectangular Door:**
- Designed as flat plate with reinforcement ribs
- Rib spacing $s \leq 20 t$ (to control plate buckling)
- Corner fillet radius $\geq 3t$ (to reduce $K_t$)

**5.6.4 Double-Bubble Fuselage (Stratocruiser, C-97, 377 — from DOC-02)**

**Cross-Section:** Two circles of radii $R_1, R_2$ intersecting at "keel".
**Internal Pressure $P$ (both lobes).**

**Hoop Stress (Membrane):**
$$\sigma_{\theta,1} = \frac{P R_1}{t_1}, \quad \sigma_{\theta,2} = \frac{P R_2}{t_2}$$

**Keel Beam Stress (Junction):**
Pressure end loads from both lobes → axial force in keel.
$$F_{\text{keel}} = P (\pi R_1^2 + \pi R_2^2)$$
Keel stress: $\sigma_{\text{keel}} = F_{\text{keel}} / A_{\text{keel}}$

**Bending at Junction:**
Lobe curvature mismatch → discontinuity moments.
**Bijlaard analysis** or **FEA required**.

**Stratocruiser (from DOC-02):**
- Lower lobe: $R_1 = 1.83$ m, $t_1 = 3.0$ mm (crown)
- Upper lobe: $R_2 = 1.37$ m, $t_2 = 2.5$ mm (crown)
- Keel: 4.0 mm web, 520 kg total
- $\sigma_{\text{keel}} \approx 66$ MPa (SF = 4.9 on yield)

**5.6.5 Conical/Cylindrical Transitions (Submersible End Caps, Capsule Ends)**

**Geometry:** Cone half-angle $\alpha$, cylinder radius $r$.
**Internal Pressure $P$.**

**Membrane Stresses:**
- Cylinder: $\sigma_{\theta} = P r / t_c$, $\sigma_z = P r / (2 t_c)$
- Cone: $\sigma_{\theta} = P r / (t_k \cos \alpha)$, $\sigma_{\phi} = P r / (2 t_k \cos \alpha)$

**Junction Discontinuity:**
Mismatch in radial displacement → local bending.
$$\Delta u = u_{\text{cyl}} - u_{\text{cone}} \cos \alpha$$

**ASME VIII-1 (1-4, 1-5) Discontinuity Analysis:**
Provides stress indices $K_1, K_2$ for:
- Pressure
- Thermal gradient
- External loads

**Design Rule:** Transition knuckle radius $\geq 0.1 r$ (torispherical) or use **conical with reinforcement**.

---

*End of Piece 6 — DOC-05 Lines 4101-4200*
*Next: Piece 7 — Section 5.7 Dynamic & Cyclic Loading: Fatigue from Pressure Spectra*