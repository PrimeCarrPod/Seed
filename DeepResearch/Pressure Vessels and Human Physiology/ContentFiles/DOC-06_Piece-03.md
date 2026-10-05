# DOC-06: Viewport Engineering — Acrylic Mechanics & ASME PVHO-1
## Document 6 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 4701-4800 | Piece 3 of 9 | ~100 Lines

---

#### 6.3 Viscoelastic/Visco-Plastic Creep & Creep Rupture

**6.3.1 Creep Mechanisms in PMMA**

**Primary Creep (Transient):** $\dot{\epsilon} \propto t^{-m}$ — decreasing rate
**Secondary Creep (Steady-State):** $\dot{\epsilon} = \text{constant}$ — power law
**Tertiary Creep (Accelerating):** Damage accumulation → rupture

**Power Law Creep (Norton-Bailey):**
$$\dot{\epsilon}_c = A \sigma^n \exp(-Q/RT)$$

**PMMA Parameters (23°C, Dry):**
- $A = 10^{-25}$ s⁻¹·MPa⁻ⁿ
- $n = 8\text{–}12$ (high stress exponent — very stress sensitive)
- $Q = 80\text{–}100$ kJ/mol

**At $\sigma = 10$ MPa, 23°C:**
$$\dot{\epsilon} \approx 10^{-25} \times 10^{10} = 10^{-15} \text{ s}^{-1} = 3.6 \times 10^{-12} \text{ hr}^{-1}$$
Very slow — but **accelerates dramatically with stress and temperature**.

**At $\sigma = 20$ MPa, 23°C:**
$$\dot{\epsilon} \approx 10^{-25} \times 20^{10} \approx 10^{-12} \text{ s}^{-1} \quad \text{(1000× faster!)}$$

**6.3.2 Creep Rupture — Time to Failure**

**Larson-Miller Parameter (LMP):**
$$P_{LM} = T (C + \log t_r)$$
Where $T$ = absolute temperature (K), $t_r$ = time to rupture (hr), $C \approx 20$ for PMMA.

**PMMA LMP Data (From NEDU Tests):**
| Stress [MPa] | $T = 296$ K (23°C) | $T = 323$ K (50°C) |
|--------------|---------------------|---------------------|
| 10 | > 100,000 hr | 15,000 hr |
| 15 | 40,000 hr | 2,000 hr |
| 20 | 5,000 hr | 300 hr |
| 25 | 800 hr | 50 hr |
| 30 | 150 hr | 10 hr |

**Design Stress for 40,000 hr at 23°C:** $\sigma_d \approx 15$ MPa
**ASME PVHO-1 allowable:** ~15 MPa for flat disc (matches empirical limit!)

**6.3.3 Visco-Plasticity — Yielding Under Sustained Load**

PMMA exhibits **yield drop** after initial elastic deformation.

**Stress-Strain at 23°C:**
- Elastic: $\epsilon_e = \sigma / 3200$
- Yield: $\sigma_y \approx 70$ MPa, $\epsilon_y \approx 0.05$
- Post-yield: Strain softening → crazing → failure

**Under Sustained Load (Creep):**
Effective yield stress **decreases with time**:
$$\sigma_{y,\text{eff}}(t) = \sigma_y \left(\frac{t_0}{t}\right)^{1/n_y}$$
Where $n_y \approx 10\text{–}15$ for PMMA.

**At $t = 40,000$ hr:** $\sigma_{y,\text{eff}} \approx 70 \times (1/40000)^{0.07} \approx 70 \times 0.45 = 31.5$ MPa

**This is why empirical limits are stress-based, not strain-based.**

**6.3.4 Environmental Effects on Creep**

| Environment | Effect on Creep Rupture Life |
|-------------|------------------------------|
| **Dry Air (23°C)** | Baseline (40,000 hr at 15 MPa) |
| **Humid Air (95% RH)** | **50% reduction** (water plasticizes) |
| **Salt Water Immersion** | **70% reduction** (stress corrosion) |
| **UV Exposure** | Surface crazing → crack initiation → **90% reduction** |
| **Chemical (cleaning agents)** | Variable — some solvents cause ESC |

**ASME PVHO-1 Assumption:** **Worst-case environment** (humid, salt, UV) → limits are conservative for controlled environments.

**6.3.5 Creep Deflection — Serviceability Limit**

**Flat Disc Deflection (Large Deformation Theory):**
$$w_{\max} = \frac{P r^4}{64 D} \left[ 1 + \frac{3}{2} \left(\frac{w_{\max}}{t}\right)^2 \right] \quad \text{(von Kármán)}$$

Where $D = E t^3 / [12(1-\nu^2)]$ is flexural rigidity.

**With Creep (Time-Dependent):**
$$w(t) = w_0 \left[ 1 + \phi(t) \right]$$
Where $\phi(t)$ = creep coefficient (from compliance $J(t)$).

**At Design Pressure (15 MPa equivalent), 10-year creep deflection:**
- Initial elastic: $w_0 \approx 1.5$ mm (for 300 mm disc, 50 mm thick)
- 10-year creep: $\phi \approx 1.5$ → $w_{10yr} \approx 3.75$ mm
- **Still acceptable** (optical distortion < 1 diopter)

**But at 2× design pressure:** $w_{10yr} \approx 15$ mm → **optical failure, seal compromise**

---

*End of Piece 3 — DOC-06 Lines 4701-4800*
*Next: Piece 4 — Section 6.4 Design by Analysis (DBA) Methodology*