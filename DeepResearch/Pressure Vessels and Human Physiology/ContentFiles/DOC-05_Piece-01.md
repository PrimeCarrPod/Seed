# DOC-05: Lamé Applications — Internal vs. External Pressure Regimes
## Document 5 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 3601-4500 | Piece 1 of 9 | ~100 Lines

---

### ABSTRACT

This document applies the Lamé equations derived in DOC-04 to the two fundamental pressure regimes encountered in PVHO engineering: **internal pressure dominant** (hyperbaric chambers, high-altitude aircraft, medical chambers) and **external pressure dominant** (submersibles, diving bells, subsea habitats). For each regime, we analyze stress distributions, failure modes (yield, buckling, plastic collapse), design criteria, and PVHO-specific numerical examples. The document also covers **combined loading** (pressure + thermal + axial), **interference fits** (viewport-to-hull, penetration seals), and **multilayer vessels** (overwrapped composites, thermal insulation). The analysis uses Tresca and von Mises yield criteria, elastic buckling theory with knockdown factors, and plastic limit analysis — all calibrated to ASME VIII-2, ABS, DNV, and NASA-STD-3001 requirements.

**Keywords:** Internal pressure PVHO, external pressure PVHO, submersible hull design, hyperbaric chamber design, elastic buckling, plastic collapse, combined loading, interference fits, multilayer vessels, ASME VIII-2, ABS, DNV

---

### 5. LAMÉ APPLICATIONS — INTERNAL VS. EXTERNAL PRESSURE REGIMES

#### 5.1 Internal Pressurization Stress Profiles

**5.1.1 Governing Equations (Review from DOC-04)**

For internal pressure $P_i$, external $P_o = 0$:
$$\sigma_r(r) = \frac{P_i r_i^2}{r_o^2 - r_i^2} \left(1 - \frac{r_o^2}{r^2}\right)$$
$$\sigma_{\theta}(r) = \frac{P_i r_i^2}{r_o^2 - r_i^2} \left(1 + \frac{r_o^2}{r^2}\right)$$
$$\sigma_z = \frac{P_i r_i^2}{r_o^2 - r_i^2} \quad \text{(closed ends)}$$

**Key Features:**
- $\sigma_r$: Compressive at inner surface ($-P_i$), zero at outer surface
- $\sigma_{\theta}$: Tensile everywhere, **maximum at inner surface**
- $\sigma_z$: Constant tensile (closed ends)

**5.1.2 Stress Ratios & Design Implications**

Define $k = r_o/r_i$:
$$\frac{\sigma_{\theta}(r_i)}{\sigma_{\theta}(r_o)} = \frac{k^2 + 1}{2} \quad \text{(hoop stress gradient)}$$
$$\frac{\sigma_{\theta}(r_i)}{\sigma_z} = k^2 + 1 \quad \text{(hoop vs axial)}$$

| $k$ | $t/r_i$ | $\sigma_{\theta}(r_i)/\sigma_{\theta}(r_o)$ | $\sigma_{\theta}(r_i)/\sigma_z$ |
|-----|---------|---------------------------------------------|--------------------------------|
| 1.05 | 0.05 | 1.05 | 2.10 |
| 1.10 | 0.10 | 1.11 | 2.21 |
| 1.25 | 0.25 | 1.28 | 2.56 |
| 1.50 | 0.50 | 1.63 | 3.25 |
| 2.00 | 1.00 | 2.50 | 5.00 |

**Design Insight:** For thick walls ($k > 1.5$), hoop stress at inner surface is **2.5–5× the axial stress** — vessel fails by hoop yielding/bursting, not axial.

**5.1.3 Yield Initiation & Burst Pressure**

**Tresca Yield Pressure (Initial Yield at Inner Surface):**
$$P_{y,\text{Tresca}} = \frac{\sigma_y}{2} \left(1 - \frac{1}{k^2}\right)$$

**von Mises Yield Pressure:**
$$P_{y,\text{VM}} = \frac{\sigma_y}{\sqrt{3}} \left(1 - \frac{1}{k^2}\right)$$

**Burst Pressure (Full Plastic Collapse, Tresca, Perfectly Plastic):**
$$P_{\text{burst}} = 2 \sigma_y \ln k$$

**Burst Pressure (von Mises, Perfectly Plastic):**
$$P_{\text{burst,VM}} = \frac{2\sigma_y}{\sqrt{3}} \ln k$$

**Strain Hardening Effect (Real Materials):**
For power-law hardening $\sigma = K \epsilon^n$:
$$P_{\text{burst,real}} = P_{\text{burst,perfect}} \times (1 + \alpha n)$$
Where $\alpha \approx 0.5\text{–}1.0$ depending on $k$.

**5.1.4 PVHO Example: Hyperbaric Chamber (ASME PVHO-1)**

**Parameters:**
- $r_i = 1.2$ m, $t = 40$ mm ($r_o = 1.24$ m, $k = 1.033$)
- $P_i = 600$ kPa (6 ATA), cyclic (10,000 cycles design)
- Material: SA-516 Gr. 70 ($\sigma_y = 260$ MPa, $\sigma_u = 485$ MPa)

**Lamé Stresses at $P_i = 600$ kPa:**
$$\sigma_{\theta}(r_i) = 0.6 \frac{1.24^2 + 1.2^2}{1.24^2 - 1.2^2} = 0.6 \frac{2.978}{0.0976} = 18.3 \text{ MPa}$$
$$\sigma_z = 0.6 \frac{1.2^2}{0.0976} = 8.8 \text{ MPa}$$

**Yield Check (von Mises at Inner Surface):**
$$\sigma_{\text{vm}} = \sqrt{18.3^2 + 8.8^2 - 18.3 \times 8.8} = \sqrt{335 + 77 - 161} = \sqrt{251} = 15.8 \text{ MPa}$$
$$\text{SF} = 260 / 15.8 = 16.5 \quad \text{(very high — fatigue governs)}$$

**Fatigue Assessment (ASME VIII-2):**
- Stress range $\Delta \sigma = 15.8$ MPa (0 to max)
- $S-N$ curve for SA-516: $\Delta \sigma_{10^6} \approx 100$ MPa
- At 10,000 cycles: Allowable $\Delta \sigma \approx 200$ MPa
- **Actual $\Delta \sigma = 15.8$ MPa $\ll$ Allowable** — infinite fatigue life

**Why So Thick?** 40 mm is for **external pressure (vacuum inside)** during maintenance, **corrosion allowance**, and **nozzle reinforcement** — not operating pressure.

---

*End of Piece 1 — DOC-05 Lines 3601-3700*
*Next: Piece 2 — Section 5.2 External Pressure Stress Profiles & Buckling*