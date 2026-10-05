# DOC-06: Viewport Engineering — Acrylic Mechanics & ASME PVHO-1
## Document 6 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 4601-4700 | Piece 2 of 9 | ~100 Lines

---

#### 6.2 Stachiw PMMA Transition & ASME PVHO-1 Empirical Limits

**6.2.1 Dr. Jerry Stachiw — The Acrylic Revolution (1960s)**

**Before Stachiw:** Viewports were **fused silica, soda-lime glass, or sapphire** — brittle, no warning before fracture, poor thermal shock resistance.

**Stachiw's Insight (1962–1968, US Navy Experimental Diving Unit):**
- **PMMA (Plexiglas, Lucite, Perspex)** has sufficient **compressive strength** for abyssal depths
- **Viscoelastic toughness** allows deformation → conformal sealing against metal flange
- **Failure is ductile-ish** (crazing, slow crack growth) → **inspectable, predictable**

**Key Publications:**
- Stachiw, J.D. (1976). *Design of Acrylic Plastic Viewports for Hyperbaric Chambers*. ASME 76-WA/PVP-7.
- Stachiw, J.D. et al. (1985). *Acrylic Window Design for Deep Submergence*. ASME PVP-105.
- Stachiw, J.D. (2023). *Developing "Design by Analysis" Methodology for Windows for PVHOs*. ASME J. Risk Uncertainty 6(3):030906.

**6.2.2 ASME PVHO-1 Empirical Design Algorithm (Historical)**

Based on **extensive destructive testing** (1960s–1990s) at NEDU, WHOI, Harbor Branch.

**Flat Disc Window (Most Common Geometry):**

**Design Pressure $P_d$ vs. Thickness $t$ (Empirical Curve Fit):**
$$P_d = \frac{K \cdot t^2}{D^2} \quad \text{or} \quad t = D \sqrt{\frac{P_d}{K}}$$

Where $D$ = unsupported diameter (clear view), $K$ = empirical constant.

**ASME PVHO-1 Table 2 (Flat Disc, Internal Pressure):**
| Unsupported Diameter $D$ [in] | $K$ [psi] | Max $P_d$ [psi] |
|------------------------------|-----------|-----------------|
| ≤ 6 | 2,500 | 150 |
| 6–12 | 2,000 | 150 |
| 12–18 | 1,500 | 100 |
| 18–24 | 1,200 | 75 |
| 24–30 | 1,000 | 60 |

**Metric Conversion ($D$ in mm, $P_d$ in MPa):**
$$t \geq D \sqrt{\frac{P_d}{17.2 \times K_{\text{psi}}}} \quad \text{with } K_{\text{psi}} \text{ from table}$$

**Example: $D = 300$ mm (12 in), $P_d = 0.7$ MPa (100 psi)**
$K = 1,500$ psi → $t \geq 300 \sqrt{0.7 / (17.2 \times 1500/100)} = 300 \sqrt{0.7 / 258} = 300 \times 0.052 = 15.6$ mm

**6.2.3 Service Life Limits (The "Three Limits" Rule)**

ASME PVHO-1 imposes **three simultaneous limits** — the most restrictive governs:

| Limit Type | Value | Basis |
|------------|-------|-------|
| **Pressurization Cycles** | 10,000 cycles | Fatigue/crack growth data |
| **Hours Under Pressure** | 40,000 hours | Creep rupture data |
| **Calendar Life** | 10 years (flat disc) | Environmental aging (UV, humidity, chemicals) |

**Why These Numbers?**
- **10,000 cycles:** From cyclic testing of flat discs to failure — crack initiation at ~5,000, growth to rupture by 10,000 (SF=2)
- **40,000 hours:** From creep rupture tests at design stress — time to rupture at 23°C ≈ 80,000 hrs (SF=2)
- **10 years:** UV degradation reduces $K_{IC}$ by ~30% in 10 years (Florida exposure data)

**For Conical/Spherical Windows:** Calendar life = **20 years** (less tensile stress, better geometry).

**6.2.4 The Problem with Empirical Limits**

1. **No credit for better materials** (e.g., stretched acrylic, cross-linked)
2. **No credit for lower stress** (large safety factor → longer life not recognized)
3. **No credit for inspection** (NDI can detect cracks before critical)
4. **Calendar limit is arbitrary** — indoor vs. outdoor, UV protection not considered
5. **Cannot optimize** — forces overdesign or early replacement

**This drove the development of Design by Analysis (DBA).**

---

*End of Piece 2 — DOC-06 Lines 4601-4700*
*Next: Piece 3 — Section 6.3 Viscoelastic/Visco-Plastic Creep & Creep Rupture*