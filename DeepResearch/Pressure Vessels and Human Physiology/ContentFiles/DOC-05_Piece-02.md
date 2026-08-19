# DOC-05: Lamé Applications — Internal vs. External Pressure Regimes
## Document 5 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 3701-3800 | Piece 2 of 9 | ~100 Lines

---

#### 5.2 External Pressure Stress Profiles & Buckling

**5.2.1 Governing Equations (External Pressure Only)**

For $P_i = 0, P_o > 0$:
$$\sigma_r(r) = \frac{-P_o r_o^2}{r_o^2 - r_i^2} \left(1 - \frac{r_i^2}{r^2}\right)$$
$$\sigma_{\theta}(r) = \frac{-P_o r_o^2}{r_o^2 - r_i^2} \left(1 + \frac{r_i^2}{r^2}\right)$$
$$\sigma_z = \frac{-P_o r_o^2}{r_o^2 - r_i^2} \quad \text{(closed ends)}$$

**Key Features:**
- **All stresses compressive** ($\leq 0$)
- $\sigma_r$: Zero at inner surface, $-P_o$ at outer surface
- $\sigma_{\theta}$: **Maximum compressive at INNER surface** (opposite to internal pressure!)
- $\sigma_z$: Constant compressive

**Stress at Inner Surface ($r = r_i$):**
$$\sigma_{\theta}(r_i) = -P_o \frac{2 r_o^2}{r_o^2 - r_i^2} = -2 P_o \frac{k^2}{k^2 - 1}$$
$$\sigma_r(r_i) = 0$$

**Stress at Outer Surface ($r = r_o$):**
$$\sigma_r(r_o) = -P_o$$
$$\sigma_{\theta}(r_o) = -P_o \frac{r_o^2 + r_i^2}{r_o^2 - r_i^2} = -P_o \frac{k^2 + 1}{k^2 - 1}$$

**5.2.2 Yield Initiation Under External Pressure**

**Tresca (at Inner Surface, $\sigma_1 = 0, \sigma_3 = \sigma_{\theta}$):**
$$\tau_{\max} = \frac{0 - \sigma_{\theta}(r_i)}{2} = P_o \frac{k^2}{k^2 - 1}$$
$$P_{y,\text{Tresca}} = \frac{\sigma_y}{2} \frac{k^2 - 1}{k^2} \quad \text{(SAME as internal pressure!)}$$

**von Mises (at Inner Surface):**
$$\sigma_{\text{vm}} = \sqrt{3} P_o \frac{k^2}{k^2 - 1}$$
$$P_{y,\text{VM}} = \frac{\sigma_y}{\sqrt{3}} \frac{k^2 - 1}{k^2} \quad \text{(SAME as internal pressure!)}$$

**Key Insight:** **Initial yield pressure is identical for internal and external pressure** (for same $k$). The stress state is mirrored.

**5.2.3 Plastic Collapse (External Pressure)**

For external pressure, collapse occurs by **progressive yielding from inner surface outward**.

**Limit Pressure (Tresca, Perfectly Plastic):**
$$P_{\text{collapse}} = 2 \sigma_y \ln k \quad \text{(SAME formula!)}$$

**BUT:** The collapse mechanism differs:
- **Internal:** Yield starts at inner surface, propagates outward → **burst**
- **External:** Yield starts at inner surface, propagates outward → **inward buckling/plastic collapse**

**5.2.4 Elastic Buckling — The Real External Pressure Limit**

For practical subsea hulls ($k < 2$), **elastic buckling occurs LONG BEFORE plastic collapse**.

**Classical Elastic Buckling (Perfect Cylinder):**
$$P_{\text{cr}} = \frac{2E}{1-\nu^2} \left(\frac{t}{D}\right)^3 = \frac{E}{4(1-\nu^2)} \left(\frac{t}{r}\right)^3 \quad \text{(for long cylinder)}$$

**Knockdown Factors (Imperfection Sensitivity):**

| Standard | Knockdown Factor $\alpha$ | Formula |
|----------|---------------------------|---------|
| **ASME VIII-2** | $\alpha = 0.8$ (conservative) | $P_{\text{allow}} = 0.8 P_{\text{cr}}$ |
| **ABS** | $\alpha = \frac{0.62}{(D/t)^{0.25}}$ | $D/t = 2r/t$ |
| **DNV-ST-E271** | $\alpha = 0.8 \sqrt{t/D}$ | With $P_{\text{design}} \leq 0.5 P_{\text{collapse}}$ |
| **API 5C3 (Casing)** | $\alpha = 0.7 - 0.001(D/t)$ | Empirical |

**Design Pressure (Allowable External Pressure):**
$$P_{\text{allow}} = \min\left(\alpha P_{\text{cr}}, \frac{P_{\text{collapse}}}{SF}\right)$$

Where $SF = 1.5\text{–}2.0$ on collapse.

**5.2.5 PVHO Example: Deep-Submergence Hull (Alvin/Shinkai Class)**

**Parameters:**
- $r_i = 1.0$ m, $D = 2.0$ m
- Operating depth: 4,500 m ($P_o = 45$ MPa)
- Material: Ti-6Al-4V ($E = 110$ GPa, $\nu = 0.34$, $\sigma_y = 830$ MPa)
- Target SF: 1.5 on collapse, 1.5 on buckling

**Required Thickness (Buckling Governed):**

Try $t = 60$ mm ($r_o = 1.06$, $k = 1.06$, $D/t = 33.3$):

$$P_{\text{cr}} = \frac{2 \times 110 \times 10^3}{1 - 0.34^2} \left(\frac{60}{2000}\right)^3 = 2.53 \times 10^5 \times 2.7 \times 10^{-5} = 6.8 \text{ MPa}$$

**ABS Knockdown:**
$$\alpha = \frac{0.62}{(33.3)^{0.25}} = \frac{0.62}{2.4} = 0.26$$
$$P_{\text{allow}} = 0.26 \times 6.8 = 1.77 \text{ MPa} \ll 45 \text{ MPa}$$

**Need much thicker or stiffened!**

**With Ring Stiffeners (DNV Approach):**
Stiffener spacing $L_s = 200$ mm, moment of inertia $I_s$:
$$P_{\text{cr,stiff}} = \frac{\pi^2 E I_s}{r^3 L_s} + \frac{2E}{1-\nu^2} \frac{t^3}{12 r^3}$$

For $I_s = 2 \times 10^6$ mm⁴ (T-stiffener 100×100×10):
$$P_{\text{cr,stiff}} = \frac{\pi^2 \times 110 \times 10^3 \times 2 \times 10^6}{1000^3 \times 200} + 6.8 = 10.8 + 6.8 = 17.6 \text{ MPa}$$
With $\alpha = 0.5$: $P_{\text{allow}} = 8.8$ MPa — still low.

**Actual Design:** $t = 64$ mm + frames at 150 mm + **conical ends** (stiffer) → Tested collapse > 100 MPa.

---

*End of Piece 2 — DOC-05 Lines 3701-3800*
*Next: Piece 3 — Section 5.3 Combined Loading & Thermal Stresses*