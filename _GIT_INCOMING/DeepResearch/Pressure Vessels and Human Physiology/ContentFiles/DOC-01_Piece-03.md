# DOC-01: PVHO Taxonomic Framework & Operational Parameters
## Document 1 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 201-300 | Piece 3 of 9 | ~100 Lines

---

#### 1.3 Pressure Differential Thresholds & Safety Factors

The structural design of every PVHO is governed by the differential pressure $\Delta P = |P_{int} - P_{ext}|$ and the applicable safety factor philosophy for its operational domain. Unlike industrial pressure vessels where leak-before-break and economic optimization dominate, PVHOs employ **human-rated safety factors** that account for the non-redundant nature of the pressure boundary as a life-support barrier.

**Threshold Definitions:**

| Threshold | Value | Physiological/Structural Basis |
|-----------|-------|-------------------------------|
| PVHO Activation | $\Delta P \geq 15 \text{ kPa}$ | Barotrauma risk threshold for naive occupants |
| Hypoxia Onset (unacclimatized) | $P_{O_2} < 16 \text{ kPa}$ | Alveolar gas equation at rest |
| DCS Risk (rapid decompression) | $\Delta P / P_{initial} > 0.5$ | Henry's Law supersaturation ratio |
| Ebullism (Armstrong Limit) | $P_{ext} < 6.3 \text{ kPa}$ | Water vapor pressure at 37°C |
| Oxygen Toxicity (CNS) | $P_{O_2} > 160 \text{ kPa}$ | Paul Bert effect, seizure threshold |
| Oxygen Toxicity (Pulmonary) | $P_{O_2} > 50 \text{ kPa} \times t > 12 \text{ hr}$ | Lorrain Smith effect |
| Nitrogen Narcosis Onset | $P_{N_2} > 320 \text{ kPa}$ | ~30 msw / 100 fsw equivalent |
| HPNS Onset (He) | $P_{He} > 1.2 \text{ MPa}$ | ~120 msw / 400 fsw |

**Safety Factor Matrix by Domain:**

| Domain | Loading | Failure Mode | Safety Factor | Basis |
|--------|---------|--------------|---------------|-------|
| Aerospace Fuselage | Cyclic $\Delta P$ (10⁴–10⁵) | Fatigue crack growth | 1.5–2.0 on limit load | Damage tolerance (Comet legacy) |
| Aerospace Window | Cyclic $\Delta P$ + Thermal | Fatigue / brittle fracture | 2.0–3.0 | Redundant panes, fail-safe |
| Subsea Hull (External) | Static $P_{ext}$ | Elastic buckling / plastic collapse | 1.5–2.0 on collapse pressure | ASME VIII-2 / ABS / DNV |
| Subsea Window (External) | Static $P_{ext}$ | Compressive yield / buckling | 2.0–3.0 | PMMA viscoelastic creep |
| Hyperbaric Chamber (Internal) | Cyclic $\Delta P$ (10³–10⁴) | Fatigue / yield | 2.0–3.0 on yield | ASME PVHO-1 empirical |
| Hyperbaric Window (Internal) | Cyclic $\Delta P$ | Tensile creep rupture | 3.0–4.0 | PMMA 10-yr calendar limit |
| EMU Bladder | Static $\Delta P$ (25–50 cycles) | Burst / leak | 4.0 on burst | NASA-STD-3001, 4x factor |
| EMU Restraint | Static $\Delta P$ | Yield / ultimate | 1.5–2.0 | Dacron/Vectran allowables |
| Saturation Habitat | Static $\Delta P \approx 0$ | External collapse (emergency) | 1.5–2.0 | Same as subsea hull |
| Medical Chamber (O₂) | Cyclic $\Delta P$ + Fire | Yield / fire propagation | 2.0–3.0 + fire mitigation | ASME PVHO-1 + NFPA 99 |

**Derivation of Aerospace Cyclic Safety Factor (1.5–2.0):**

The factor of 1.5 on limit load derives from the requirement that **no permanent deformation** occurs at limit load (maximum expected operational pressure). The factor of 2.0 on ultimate load ensures **no catastrophic failure** at 2× limit load. For cyclic loading, the damage-tolerance approach (post-Comet) requires:

$$\frac{da}{dN} = C(\Delta K)^m \quad \text{(Paris Law)}$$

Where $\Delta K = Y \Delta \sigma \sqrt{\pi a}$ is the stress intensity factor range. The inspection interval $N_{insp}$ must satisfy:

$$N_{insp} \leq \frac{1}{2} N_{critical}(a_{detect} \rightarrow a_{critical})$$

With $a_{detect}$ = minimum detectable crack (NDI capability), $a_{critical}$ = critical crack length at limit load. This yields the effective safety factor on fatigue life of **2.0 to 4.0** depending on inspectability.

**Derivation of Subsea Collapse Safety Factor (1.5–2.0):**

For external pressure, the collapse pressure $P_{collapse}$ of a perfect cylinder (elastic buckling) is:

$$P_{collapse} = \frac{2E}{1-\nu^2} \left(\frac{t}{D}\right)^3 \quad \text{(classical)}$$

Real cylinders exhibit knockdown factors $\alpha$ due to imperfections:

$$P_{collapse,real} = \alpha P_{collapse}, \quad \alpha \approx 0.3\text{–}0.7$$

The safety factor $SF = P_{collapse,real} / P_{design} \geq 1.5$ ensures that even with worst-case imperfections, the design pressure remains below the lower-bound collapse pressure. For plastic collapse (thick walls, D/t < 20):

$$P_{collapse,plastic} = 2 \sigma_y \ln\left(\frac{r_o}{r_i}\right) \quad \text{(Lamé-based)}$$

With $SF \geq 1.5$ on $\sigma_y$ at design pressure.

**Derivation of Hyperbaric Chamber Internal Safety Factor (2.0–3.0):**

ASME PVHO-1 uses empirical data from destructive testing of acrylic viewports and steel chambers. The factor of 3.0 on acrylic tensile strength accounts for:
1. Viscoelastic creep (time-dependent strain under constant stress)
2. Environmental stress cracking (chemical exposure)
3. Surface flaw sensitivity (machining, handling damage)
4. Statistical scatter in polymer properties (Weibull modulus $m \approx 5\text{–}10$)

For steel chambers, the factor of 2.0 on yield accounts for cyclic fatigue (10,000+ cycles) and corrosion allowance.

**EMU Bladder Safety Factor (4.0 on Burst):**

The NASA EMU bladder operates at 30 kPa (4.3 psi) with a 4× burst factor:

$$P_{burst} \geq 4 \times P_{op} = 120 \text{ kPa} \quad (17.2 \text{ psi})$$

This high factor accommodates:
- Stress concentrations at joints/convolutes
- Micrometeoroid/orbital debris (MMOD) penetration risk
- Material degradation (UV, atomic oxygen, thermal cycling)
- No redundancy — single bladder failure = loss of crew

The restraint layer (Dacron/Vectran) carries the load at a lower factor (1.5–2.0) because it is inspectable and redundant (multiple plies).

---

*End of Piece 3 — DOC-01 Lines 201-300*
*Next: Piece 4 — Section 1.4 Life-Support Parameter Envelopes*