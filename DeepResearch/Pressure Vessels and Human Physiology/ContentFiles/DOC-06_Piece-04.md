# DOC-06: Viewport Engineering — Acrylic Mechanics & ASME PVHO-1
## Document 6 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 4801-4900 | Piece 4 of 9 | ~100 Lines

---

#### 6.4 Design by Analysis (DBA) Methodology

**6.4.1 Why DBA? Moving Beyond Empirical Limits**

The empirical ASME PVHO-1 limits (10k cycles, 40k hours, 10 years) are:
- **Overly conservative** for well-designed, low-stress viewports
- **Non-optimizable** — cannot trade stress for life
- **Non-inspectable** — no credit for NDI programs
- **Material-locked** — only covers standard PMMA grades

**DBA Goal:** Allow **any geometry, any material, any loading** with **quantified safety margins** using **validated FEA**.

**6.4.2 ASME PVHO-1 DBA Framework (5-Step V&V)**

From Stachiw et al. (2023) and BPVC VIII Appendix 48:

**Step 1: Conceptual Window — Design Specification**
- Define: Geometry, pressures (internal/external), temperatures, cycles, life
- Define: Material grade, lot qualification, manufacturing tolerances
- Define: Operational environment (UV, humidity, chemicals, thermal cycles)
- Define: Acceptance criteria (leak, crack, deflection, optical)

**Step 2: Preliminary Design — Parameter Determination**
- Geometry: Flat, conical, spherical, torispherical
- Pressures: $P_{\text{design}}, P_{\text{test}}, P_{\text{operating}}$
- Temperatures: $T_{\min}, T_{\max}, \Delta T$ through thickness
- Cycles: $N_{\text{design}}$ (pressure + thermal)
- Material: Grade, $E(T,t)$, $\sigma_y(T,t)$, $K_{IC}(T)$, creep data
- Stochastic Tolerances: Thickness $\pm 5\%$, diameter $\pm 1\%$, surface finish

**Step 3: Calculations — DOE for FEA Parameters**
- **Material Model:** Viscoelastic (Prony series) + Viscoplastic (Perzyna) + Damage
- **Geometry Model:** 3D solid (not shell) — through-thickness stress gradient critical
- **Mesh:** Refined at clamp edge (bending boundary layer), element size $\leq t/5$
- **Boundary Conditions:** Elastic foundation (flange compliance), bolt preload
- **Load Cases:** Pressure, thermal, bolt preload, combined
- **DOE:** Vary $E, \nu, \alpha, \sigma_y, K_{IC}, creep$ within tolerances → response surface

**Step 4: Review — Simulation vs. Bounding Parameters**
- Compare FEA results to:
  - **Analytical solutions** (flat plate, conical, spherical)
  - **Historical test data** (NEDU, WHOI, NRL databases)
  - **Code allowables** (ASME VIII-2 stress categories)
- Check: Convergence, energy balance, reaction forces
- Sensitivity: Which parameters drive stress/life?

**Step 5: Quantitative Comparison — Validation Testing**
- **Physical Test:** Prototype window tested to:
  - $1.3 \times P_{\text{design}}$ (proof test)
  - $3 \times P_{\text{design}}$ (burst test, optional)
  - Cyclic test: $N_{\text{design}}$ cycles at $P_{\text{design}}$
  - Creep test: $1000$ hrs at $P_{\text{design}}, T_{\max}$
- **Acceptance:** FEA predicts test results within $\pm 15\%$ for stress, $\pm 20\%$ for deflection

**6.4.3 Stress Categorization (ASME VIII-2) for Viewports**

| Category | Viewport Location | Typical Value | Allowable |
|----------|-------------------|---------------|-----------|
| $P_m$ (Primary Membrane) | Center of flat disc | Low (bending dominates) | $S_m$ |
| $P_b$ (Primary Bending) | Clamped edge | **HIGH** (peak) | $1.5 S_m$ |
| $P_m + P_b$ | Edge region | **HIGHEST** | $1.5 S_m$ |
| $Q$ (Secondary Thermal) | Through-thickness $\Delta T$ | Moderate | $3 S_m$ |
| $F$ (Peak, Notch) | Clamp corner, bolt hole | Highest | Fatigue only |

**For Acrylic:** $S_m = \min(\sigma_y/1.5, \sigma_u/3.5) \approx 23$ MPa (at 23°C)

**Edge Bending Stress (Flat Disc, Clamped):**
$$\sigma_b = \frac{3}{4} P \left(\frac{r}{t}\right)^2 \cdot K_{\text{edge}}$$
Where $K_{\text{edge}} \approx 1.2\text{–}1.5$ for elastic foundation.

**DBA Allowable Pressure (Simplified):**
$$P_{\text{DBA}} = \frac{4}{3} \frac{1.5 S_m}{K_{\text{edge}}} \left(\frac{t}{r}\right)^2 = \frac{2 S_m}{K_{\text{edge}}} \left(\frac{t}{r}\right)^2$$

**Compare to Empirical:**
Empirical: $P_{\text{emp}} = K \frac{t^2}{r^2}$ with $K \approx 10\text{–}17$ MPa
DBA: $P_{\text{DBA}} = \frac{2 \times 23}{1.3} \left(\frac{t}{r}\right)^2 = 35 \left(\frac{t}{r}\right)^2$

**DBA allows ~2–3× higher pressure for same geometry!** (With validation)

---

*End of Piece 4 — DOC-06 Lines 4801-4900*
*Next: Piece 5 — Section 6.5 Thermo-ViscoDamage Models (BPVC VIII Appendix 48)*