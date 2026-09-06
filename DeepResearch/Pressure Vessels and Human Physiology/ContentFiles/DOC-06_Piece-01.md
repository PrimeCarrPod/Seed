# DOC-06: Viewport Engineering — Acrylic Mechanics & ASME PVHO-1
## Document 6 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 4501-5400 | Piece 1 of 9 | ~100 Lines

---

### ABSTRACT

This document provides a comprehensive analysis of **viewport engineering** for Pressure Vessels for Human Occupancy (PVHOs), focusing on **Polymethyl Methacrylate (PMMA/acrylic)** as the dominant viewport material. The document covers the historical transition from brittle ceramics to acrylic (Stachiw, 1960s), the viscoelastic/viscoplastic behavior of PMMA, ASME PVHO-1 empirical design limits, the modern **Design by Analysis (DBA)** methodology with thermo-viscodamage models, and the BPVC Section VIII Appendix 48 acceptance criteria. Numerical examples cover flat disc, conical, and spherical viewports for hyperbaric chambers, submersibles, and spacecraft. The document establishes the mathematical framework for viewport structural integrity across all PVHO classes.

**Keywords:** PMMA, acrylic, viewport, ASME PVHO-1, Design by Analysis, thermo-viscodamage, viscoelasticity, creep rupture, Stachiw, Appendix 48, submersible window, hyperbaric chamber window, spacecraft window

---

### 6. VIEWPORT ENGINEERING AND ASME PVHO STANDARDS

#### 6.1 Viewport Failure Mode Analysis

**6.1.1 Why Viewports Are the Critical Failure Locus**

In any PVHO, the transparent viewport represents a **discontinuity** in the pressure boundary where:
- Geometry changes from axisymmetric (cylinder/sphere) to flat/curved disc
- Material changes from ductile metal (steel, Ti, Al) to **brittle/viscoelastic polymer**
- Stress state changes from membrane (hoop/axial) to **bending-dominated**
- **No redundancy** — single pane failure = catastrophic decompression

**Historical Failure Modes:**
| Material | Failure Mode | Example |
|----------|--------------|---------|
| **Soda-lime glass** | Brittle fracture, no warning | Early bathyspheres (1930s) |
| **Fused silica** | Thermal shock fracture | Deep-sea cameras (1950s) |
| **Polycarbonate** | Environmental stress cracking | Aircraft windows (1970s) |
| **Acrylic (PMMA)** | Creep rupture, slow crack growth | **Current standard — managed by ASME** |

**6.1.2 Acrylic (PMMA) — Material Properties**

**Chemical:** Poly(methyl methacrylate), $(C_5H_8O_2)_n$
**Density:** 1.18–1.20 g/cm³
**Refractive Index:** 1.49 (excellent optical clarity)
**Light Transmission:** > 92% (visible spectrum)

**Mechanical (23°C, Dry):**
| Property | Value | Test Standard |
|----------|-------|---------------|
| Tensile Strength | 70–75 MPa | ASTM D638 |
| Tensile Modulus | 3.0–3.3 GPa | ASTM D638 |
| Compressive Strength | 110–130 MPa | ASTM D695 |
| Flexural Strength | 100–115 MPa | ASTM D790 |
| Shear Strength | 55–60 MPa | ASTM D732 |
| Poisson's Ratio | 0.37–0.40 | — |
| **Fracture Toughness $K_{IC}$** | **0.7–1.2 MPa√m** | ASTM E1820 |
| **Izod Impact (Notched)** | **0.4–0.6 J/m** | ASTM D256 |

**Key Limitation:** **Very low fracture toughness** — behaves as brittle material at room temperature, but **viscoelastic** at elevated temperature/long duration.

**6.1.3 Viscoelastic Behavior — Time-Dependent Stress Relaxation**

PMMA is a **thermoplastic glassy polymer** below its $T_g \approx 105°C$.

**Relaxation Modulus (Tension):**
$$E(t) = E_0 \left[ \phi_0 + \sum_{i=1}^n \phi_i \exp(-t/\tau_i) \right]$$
Prony series with $\tau_i$ from $10^{-3}$ to $10^5$ seconds.

**Creep Compliance:**
$$J(t) = \frac{1}{E_0} \left[ 1 + \sum_{i=1}^n \psi_i (1 - \exp(-t/\tau_i)) \right]$$

**At 23°C, 10 MPa constant stress:**
- Instantaneous strain: $\epsilon_0 = 10 / 3200 = 0.0031$
- 1000 hr creep strain: $\epsilon_c \approx 0.0015$ (**50% increase!**)
- 10,000 hr: $\epsilon_c \approx 0.0030$ (**100% increase**)

**Design Implication:** **Stress relaxes, strain accumulates** — viewport deflection increases over time under constant pressure.

---

*End of Piece 1 — DOC-06 Lines 4501-4600*
*Next: Piece 2 — Section 6.2 Stachiw PMMA Transition & Empirical Limits*