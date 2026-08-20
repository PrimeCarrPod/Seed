# DOC-01: PVHO Taxonomic Framework & Operational Parameters
## Document 1 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 401-500 | Piece 5 of 9 | ~100 Lines

---

#### 1.5 Structural Integrity Mandates

The structural integrity of a PVHO is the non-redundant barrier between human physiology and lethal environments. Unlike industrial pressure vessels where leakage may be tolerable, PVHO failure modes are binary: **intact = survival, breach = fatality**. This mandates a structural philosophy of **damage tolerance, redundant load paths, and deterministic failure prediction**.

**1.5.1 Failure Mode Taxonomy**

| Failure Mode | Mechanism | Domain | Prevention Strategy |
|--------------|-----------|--------|---------------------|
| **Cyclic Fatigue** | Progressive crack growth under $\Delta P$ cycling | Aerospace, Hyperbaric chambers | Damage tolerance, NDI intervals, safe-life |
| **Elastic Buckling** | Geometric instability under external $P$ | Subsea hulls, diving bells | Knockdown factors, stiffeners, $D/t$ limits |
| **Plastic Collapse** | Yield propagation through wall thickness | Thick-walled subsea, hyperbaric | Limit analysis, strain-based design |
| **Brittle Fracture** | Cleavage at flaw below yield stress | Low-temp steel, acrylic windows | Fracture mechanics, $K_{IC}$ testing, temperature shift |
| **Creep Rupture** | Time-dependent strain at elevated $T$ | Acrylic viewports, high-temp | Empirical life limits, DBA, thermo-viscodamage |
| **Stress Corrosion** | Crack growth in corrosive environment | Marine, aerospace (chlorides) | Material selection, cathodic protection, inhibitors |
| **Hydrogen Embrittlement** | H diffusion reduces $K_{IC}$ | High-strength steel, cathodic protection | Hardness limits, bake-out, coating |
| **Impact/Blast** | Dynamic overpressure | All (debris, explosion) | Redundant barriers, blast walls, stand-off |
| **Fire Degradation** | Strength loss at elevated $T$ | O₂-enriched chambers | Fire suppression, insulation, material limits |

**1.5.2 Cyclic Fatigue — Damage Tolerance Framework (Aerospace Legacy)**

The de Havilland Comet disasters (1954) established the modern damage-tolerance paradigm. For a PVHO experiencing $N$ pressurization cycles:

**Stress Spectrum:** Each flight/pressurization generates a stress cycle $\Delta \sigma = \sigma_{max} - \sigma_{min}$.
For fuselage hoop stress: $\sigma_{\theta} = \frac{\Delta P \cdot r}{t}$ (thin-wall approx).

**Crack Growth Integration:**
$$N = \int_{a_0}^{a_c} \frac{da}{C(\Delta K)^m} = \frac{1}{C(\Delta \sigma \sqrt{\pi})^m Y^m} \int_{a_0}^{a_c} a^{-m/2} da$$

For $m \neq 2$:
$$N = \frac{2}{C(\Delta \sigma \sqrt{\pi} Y)^m (2-m)} \left[ a_c^{(2-m)/2} - a_0^{(2-m)/2} \right]$$

**Critical Crack Length ($a_c$):**
At limit load $\sigma_{limit}$:
$$K_{IC} = Y \sigma_{limit} \sqrt{\pi a_c} \quad \Rightarrow \quad a_c = \frac{1}{\pi} \left( \frac{K_{IC}}{Y \sigma_{limit}} \right)^2$$

**Inspection Interval:**
$$N_{inspect} \leq \frac{1}{2} N(a_{detect} \rightarrow a_c)$$

Where $a_{detect}$ = minimum crack detectable by NDI method (eddy current: ~1 mm, UT: ~2 mm, visual: ~5 mm).

**1.5.3 Elastic Buckling — Subsea Hull Design**

For a perfect cylinder under external pressure:
$$P_{cr} = \frac{2E}{1-\nu^2} \left(\frac{t}{D}\right)^3 \quad \text{(classical elastic)}$$

Real cylinders require knockdown factor $\alpha$:
$$P_{allowable} = \alpha \cdot P_{cr}, \quad \alpha = f(D/t, L/D, \text{imperfections})$$

**ASME VIII-2 / ABS / DNV Empirical Formulations:**

ABS (2023) for circular cylinders:
$$\alpha = \frac{0.62}{(D/t)^{0.25}} \quad \text{for } 20 < D/t < 100$$

DNV-ST-E271:
$$\alpha = 0.8 \left( \frac{t}{D} \right)^{0.5} \quad \text{with } P_{design} \leq 0.5 P_{collapse}$$

**Stiffener Requirements:**
Ring stiffeners spaced at $L_s \leq 0.5 \sqrt{Dt}$ to enforce buckling half-wavelength.
Critical stiffener moment of inertia:
$$I_{req} = \frac{D^3 t}{12 \pi^4} \left( \frac{P_{design}}{E} \right)$$

**1.5.4 Plastic Collapse — Thick-Walled Vessels**

For $D/t < 20$, plastic collapse governs before elastic buckling.
Limit pressure (tresca, perfectly plastic):
$$P_{L} = 2 \sigma_y \ln\left(\frac{r_o}{r_i}\right)$$

ASME VIII-2 Design-by-Analysis uses elastic-plastic FEA with:
- Primary membrane stress $\leq \sigma_y$
- Primary + bending $\leq 1.5 \sigma_y$
- Primary + secondary (thermal) $\leq 3.0 \sigma_y$ (shakedown check)

**1.5.5 Brittle Fracture — Fracture Mechanics**

Linear Elastic Fracture Mechanics (LEFM) governs:
$$K_I = Y \sigma \sqrt{\pi a} \leq K_{IC} \quad \text{(plane strain fracture toughness)}$$

For ferritic steels, $K_{IC}$ is temperature-dependent (ductile-brittle transition):
$$K_{IC}(T) = A + B \exp[C(T - T_0)] \quad \text{(Master Curve, ASTM E1921)}$$

**PVHO Requirement:** $T_{operating} \geq T_{NDT} + 30°C$ (Nil Ductility Transition + margin).
For Arctic/Antarctic subsea: Charpy V-notch ≥ 27 J at $-40°C$.

**1.5.6 Acrylic Viewport — Creep Rupture & Thermo-ViscoDamage**

PMMA exhibits time-dependent failure under sustained stress:
$$\sigma_{allowable}(t) = \sigma_0 \left( \frac{t_0}{t} \right)^{1/n} \quad \text{(power law creep)}$$

ASME PVHO-1 empirical limits:
- 10,000 pressurization cycles
- 40,000 hours under pressure
- 10-year calendar life (flat discs)

**BPVC VIII Appendix 48 — Design by Analysis (DBA):**
Thermo-viscodamage model maps damage variable $\omega$ against deviatoric stress invariants:
$$\dot{\omega} = f(J_2, T, t) \quad \text{where } J_2 = \frac{1}{2} s_{ij} s_{ij} \text{ (second deviatoric invariant)}$$
Damage evolution calibrated against:
- Short-term tensile tests (strain rate sweep)
- Creep rupture tests (multiple stress/temperature)
- Fatigue tests (cyclic stress/strain)
- Environmental exposure (humidity, UV, chemicals)

Five-step V&V:
1. Conceptual Window → Design Specification
2. Preliminary Design → Geometry, pressures, cycles, materials, tolerances
3. Calculations → DOE for FEA model parameters
4. Review → Simulation vs. bounding parameters & literature
5. Quantitative Comparison → Simulation vs. physical test

---

*End of Piece 5 — DOC-01 Lines 401-500*
*Next: Piece 6 — Section 1.6 (Extended) Cross-Domain Parameter Comparison Matrix*