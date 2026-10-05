# DOC-04: Lamé Equations — Thick-Walled Cylinder Mechanics
## Document 4 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 3401-3500 | Piece 8 of 9 | ~100 Lines

---

#### 3.1.8 PVHO Applications: Numerical Examples

**3.1.8.1 Hyperbaric Medical Chamber (ASME PVHO-1)**

**Parameters:**
- Internal diameter: 3.0 m ($r_i = 1.5$ m)
- Design pressure: 600 kPa (6 bar, 87 psi) — 6 ATA max
- Material: SA-516 Gr. 70 carbon steel ($\sigma_y = 260$ MPa, $E = 200$ GPa, $\nu = 0.3$)
- Corrosion allowance: 3 mm
- Joint efficiency: $E = 1.0$ (full RT)

**Required Thickness (ASME VIII-1, UG-27):**
$$t = \frac{P r_i}{\sigma_{\text{allow}} E - 0.6 P} + \text{CA}$$
$\sigma_{\text{allow}} = \min(\sigma_y/1.5, \sigma_u/3.5) = \min(173, 137) = 137 \text{ MPa}$ (at 50°C)

$$t = \frac{0.6 \times 1500}{137 \times 1.0 - 0.6 \times 0.6} + 3 = \frac{900}{136.6} + 3 = 6.6 + 3 = 9.6 \text{ mm}$$

**Use 12 mm plate (standard).** $r_o = 1512$ mm, $k = 1.008$

**Lamé Stress Check (Internal Pressure Only):**
$$\sigma_{\theta}(r_i) = P_i \frac{r_o^2 + r_i^2}{r_o^2 - r_i^2} = 0.6 \frac{1512^2 + 1500^2}{1512^2 - 1500^2} = 0.6 \frac{4,584,144}{36,144} = 76.0 \text{ MPa}$$

Thin-wall: $\sigma_{\theta} = 0.6 \times 1500 / 12 = 75.0$ MPa
**Lamé correction: +1.3%** (negligible for $t/r = 0.008$)

**Why Use Thick-Wall Formula?** ASME requires it for $t/r > 0.1$ or when precise stress needed for fatigue. Here $t/r = 0.008$ — thin-wall is fine, but **nozzle reinforcement** and **flat head** calculations need Lamé.

**3.1.8.2 Deep-Submergence Submersible Hull (Shinkai 6500)**

**Parameters:**
- Internal diameter: 2.0 m ($r_i = 1.0$ m)
- Operating depth: 6,500 m ($P_o = 65$ MPa, $P_i = 0.1$ MPa)
- Material: Ti-6Al-4V ELI ($\sigma_y = 830$ MPa, $E = 110$ GPa, $\nu = 0.34$)
- Safety factor: 1.5 on collapse (ABS/DNV)

**External Pressure Dominant:** $P_o \gg P_i$, treat as $P_i = 0, P_o = 65$ MPa

**Initial Yield Pressure (Tresca, Internal Surface):**
$$P_{y} = \frac{\sigma_y}{2} \frac{k^2 - 1}{k^2} = \frac{830}{2} \left(1 - \frac{1}{k^2}\right)$$

**Collapse Pressure (Plastic, Tresca):**
$$P_{\text{collapse}} = 2 \sigma_y \ln k$$

**DNV Requirement:** $P_{\text{design}} \leq P_{\text{collapse}} / 1.5$

$$65 \leq \frac{2 \times 830 \times \ln k}{1.5} = 1107 \ln k$$
$$\ln k \geq 0.0587 \quad \Rightarrow \quad k \geq 1.060$$
$$t = r_i(k - 1) = 1000 \times 0.060 = 60 \text{ mm}$$

**Check Elastic Buckling (DNV):**
$$P_{\text{cr}} = \frac{2E}{1-\nu^2} \left(\frac{t}{D}\right)^3 = \frac{2 \times 110 \times 10^3}{1-0.34^2} \left(\frac{60}{2000}\right)^3 = 2.5 \times 10^5 \times 2.7 \times 10^{-5} = 6.75 \text{ MPa}$$

**Knockdown Factor ($\alpha \approx 0.3$ for fabricated cylinder):**
$$P_{\text{allowable}} = 0.3 \times 6.75 = 2.0 \text{ MPa} \ll 65 \text{ MPa}$$

**Elastic buckling governs!** Need much thicker wall or stiffeners.

**Stiffened Design (Ring Frames at 200 mm spacing):**
With stiffeners, buckling mode controlled by frame spacing.
$$P_{\text{cr, stiffened}} \approx \frac{\pi^2 E I_s}{r^3 L_s} \quad \text{(frame-dominated)}$$

**Actual Shinkai 6500:** $t = 64$ mm, Ti-6Al-4V, ring frames at 150 mm, $P_{\text{collapse}} \approx 100$ MPa (tested).

**3.1.8.3 Viewport Flange — Acrylic-to-Metal Interface**

**Geometry:** Acrylic disc (PMMA) clamped in metal retaining ring.
- Acrylic: $r_i = 150$ mm, $t = 100$ mm ($r_o = 250$ mm, $k = 1.67$)
- Metal ring: $r_i = 250$ mm, $t = 50$ mm
- Pressure: $P_i = 0$, $P_o = 10$ MPa (external pressure on viewport)

**Acrylic Disc (External Pressure):**
$$\sigma_{\theta}(r_i) = -P_o \frac{2 r_o^2}{r_o^2 - r_i^2} = -10 \frac{2 \times 250^2}{250^2 - 150^2} = -10 \frac{125,000}{40,000} = -31.25 \text{ MPa}$$

**PMMA Compressive Yield:** $\sigma_{yc} \approx 110$ MPa
**SF = 110 / 31.25 = 3.5** (adequate for static)

**Creep Check (ASME PVHO-1):**
PMMA creeps under sustained compressive stress.
$$\epsilon_{\text{creep}}(t) = \epsilon_0 + A \sigma^n t^m$$
At 31 MPa, 10-year creep strain ≈ 0.5% — acceptable for sealing.

**Metal Ring (Internal Pressure from Acrylic Reaction):**
Acrylic pushes outward on ring → ring sees internal pressure.
Contact pressure $p_c$ from compatibility:
$$u_{\text{acrylic}}(r_o) = u_{\text{ring}}(r_i)$$

**Interface Pressure Calculation:**
$$p_c = \frac{\delta}{\frac{r_o}{E_a}\left(\frac{r_o^2+r_i^2}{r_o^2-r_i^2}+\nu_a\right) + \frac{r_i}{E_m}\left(\frac{r_o^2+r_i^2}{r_o^2-r_i^2}-\nu_m\right)}$$

Where $\delta$ = radial interference (designed gap closure under pressure).

**Design Result:** Flange bolts preloaded to maintain contact at max $P_o$.
Bolt load: $F_b = p_c \cdot 2\pi r_i \cdot \text{bolt pattern factor}$

---

*End of Piece 8 — DOC-04 Lines 3401-3500*
*Next: Piece 9 — References, Cross-Links, Validation & Document Closure*