# DOC-05: Lamé Applications — Internal vs. External Pressure Regimes
## Document 5 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 3901-4000 | Piece 4 of 9 | ~100 Lines

---

#### 5.4 Interference Fits & Viewport Sealing

**5.4.1 Contact Pressure from Radial Interference**

Two cylinders (inner: shaft/insert, outer: hub/housing) with radial interference $\delta$:

**Interface Pressure $p_c$:**
$$p_c = \frac{\delta}{\frac{r}{E_o}\left(\frac{r_o^2 + r^2}{r_o^2 - r^2} + \nu_o\right) + \frac{r}{E_i}\left(\frac{r^2 + r_i^2}{r^2 - r_i^2} - \nu_i\right)}$$

Where $r$ = interface radius, $E_o, \nu_o$ = outer cylinder, $E_i, \nu_i$ = inner cylinder.

**For Solid Shaft ($r_i = 0$):**
$$p_c = \frac{\delta}{\frac{r}{E_o}\left(\frac{r_o^2 + r^2}{r_o^2 - r^2} + \nu_o\right) + \frac{r(1-\nu_i)}{E_i}}$$

**For Thin Outer Cylinder ($r_o \approx r$):**
$$p_c \approx \frac{\delta E_o}{r} \frac{r_o^2 - r^2}{r_o^2 + r^2} \quad \text{(if $E_i \gg E_o$)}$$

**5.4.2 Stresses from Interference (Lamé Superposition)**

**Outer Cylinder (Internal Pressure $p_c$):**
$$\sigma_r^{\text{int}}(r) = -p_c \frac{r_o^2}{r_o^2 - r^2} \left(1 - \frac{r^2}{r^2}\right) \quad \text{at interface}$$
$$\sigma_{\theta}^{\text{int}}(r) = p_c \frac{r_o^2 + r^2}{r_o^2 - r^2} \quad \text{(TENSILE at interface)}$$

**Inner Cylinder (External Pressure $p_c$):**
$$\sigma_r^{\text{ext}}(r) = -p_c$$
$$\sigma_{\theta}^{\text{ext}}(r) = -p_c \frac{r^2 + r_i^2}{r^2 - r_i^2} \quad \text{(COMPRESSIVE at interface)}$$

**5.4.3 Viewport-to-Hull Seal — Acrylic in Metal Flange**

**Geometry (from DOC-04 §3.1.8.3):**
- Acrylic disc: $r_i = 150$ mm, $t = 100$ mm ($r_o = 250$ mm)
- Metal retaining ring: $r = 250$ mm (interface), $t = 50$ mm ($r_o = 300$ mm)
- External pressure on viewport: $P_o = 10$ MPa
- Materials: PMMA ($E_a = 3.2$ GPa, $\nu_a = 0.37$), Steel ($E_s = 200$ GPa, $\nu_s = 0.3$)

**Design Requirement:** No separation at interface under max $P_o$.
Contact pressure $p_c$ must remain $\geq 0$ at all times.

**Pressure-Induced Separation (without preload):**
External pressure $P_o$ pushes acrylic outward → reduces contact pressure.
Radial displacement of acrylic outer surface under $P_o$:
$$u_a(P_o) = \frac{P_o r^2}{E_a} \left[ \frac{(1-2\nu_a)r^2 + (1+\nu_a)r_o^2}{r_o^2 - r^2} \right]_{r=250, r_o=250}$$
Wait — for solid disc, $r_o = r$, so use solid cylinder formula:
$$u_a(P_o) = \frac{P_o r}{E_a} (1-\nu_a) = \frac{10 \times 250}{3.2 \times 10^3} (1-0.37) = 0.78 \times 0.63 = 0.49 \text{ mm outward}$$

Radial displacement of steel ring inner surface under $P_o$ (acting on ring):
The ring sees internal pressure from acrylic reaction.
But acrylic is pushing out, ring is pushing in.

**Compatibility with Preload $\delta$:**
Initial interference $\delta$ creates contact pressure $p_{c0}$.
Under $P_o$, additional displacements:
$$\Delta u_a = u_a(P_o) + u_a(p_c) \quad \text{(outward positive)}$$
$$\Delta u_s = u_s(p_c) \quad \text{(inward negative for ring)}$$

No separation: $\Delta u_a - \Delta u_s \leq \delta$

**Bolt Preload Design:**
Bolts provide initial clamping force $F_b$.
Flange stiffness $K_f$ relates bolt force to contact pressure.
$$p_{c0} = \frac{F_b}{2\pi r \cdot n_b} \times \text{flange factor}$$

**ASME PVHO-1 Requirement:** Bolt preload $\geq 1.5 \times$ pressure end load.
Pressure end load on viewport: $F_p = P_o \pi r^2 = 10 \times \pi \times 0.25^2 = 1.96 \text{ MN}$
Bolt preload: $F_b \geq 2.94 \text{ MN}$ (for 12 bolts: 245 kN/bolt → M30 10.9 bolts)

**5.4.4 Penetration Seals — Electrical/Hydraulic Feedthroughs**

**Conical Seal (High Pressure):**
Metal cone (angle $\alpha$) forced into matching conical seat.
Axial force $F_a$ → contact pressure $p_c = F_a / (2\pi r L \sin \alpha)$

**Lamé Analysis of Conical Seat:**
Seat is a thick cylinder with internal pressure $p_c$.
$$\sigma_{\theta}(r_i) = p_c \frac{r_o^2 + r_i^2}{r_o^2 - r_i^2}$$

**Design for 70 MPa External (Hadal):**
- Seat: Ti-6Al-4V, $r_i = 20$ mm, $t = 10$ mm ($k = 1.5$)
- Cone angle: 15° (self-energizing)
- Required $p_c > P_o = 70$ MPa (to maintain seal)

$$\sigma_{\theta}(r_i) = 70 \frac{1.5^2 + 1}{1.5^2 - 1} = 70 \frac{3.25}{1.25} = 182 \text{ MPa}$$
SF = 830 / 182 = 4.6 (adequate)

**Axial Force Required:**
$$F_a = 2\pi r L p_c \sin \alpha = 2\pi \times 20 \times 15 \times 70 \times \sin 15° = 2\pi \times 20 \times 15 \times 70 \times 0.259 = 68.5 \text{ kN}$$

**Bolted Flange Alternative:** 8 × M16 bolts at 60 mm PCD.

---

*End of Piece 4 — DOC-05 Lines 3901-4000*
*Next: Piece 5 — Section 5.5 Multilayer Vessels & Overwrapped Composites*