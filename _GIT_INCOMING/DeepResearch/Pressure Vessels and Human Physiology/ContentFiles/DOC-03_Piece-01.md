# DOC-03: Cyclic Fatigue & de Havilland Comet Forensic Analysis
## Document 3 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 1801-2700 | Piece 1 of 9 | ~100 Lines

---

### ABSTRACT

This document provides a comprehensive forensic analysis of the de Havilland Comet 1 disasters (1954), the pivotal event that transformed aerospace engineering from static strength design to **damage-tolerance philosophy**. The analysis covers the Comet's pressure vessel design, the three catastrophic in-flight breakups (G-ALYP, G-ALYY, G-ALYV), the Royal Aircraft Establishment (RAE) Farnborough hydrostatic testing program (3,000 cycles), the root cause identification (square window corners → stress concentration → fatigue crack initiation at rivet holes), and the resulting paradigm shift in pressurized fuselage design. Mathematical treatment includes Paris Law crack growth integration, stress intensity factor solutions for corner cracks, and the derivation of inspection intervals from fracture mechanics. The document establishes the direct lineage from Comet investigation to modern FAR 25.571 damage-tolerance requirements.

**Keywords:** de Havilland Comet, cyclic fatigue, fracture mechanics, stress concentration, square window corners, RAE Farnborough, hydrostatic testing, Paris Law, damage tolerance, FAR 25.571, Paris Erdogan law, crack growth

---

### 3. CYCLIC FATIGUE AND THE DE HAVILLAND COMET 1 DISASTERS

#### 3.1 Jet Age Fatigue Introduction

The de Havilland Comet 1 (DH-106) entered service in May 1952 as the **world's first commercial jet airliner**. Its pressurized fuselage was designed to **static strength requirements** (CAR 4b, 1945) with safety factors of 1.5 on limit load and 2.0 on ultimate load. **Fatigue was not a design requirement** — the prevailing assumption was that static safety factors provided adequate margin for cyclic loading.

**Comet 1 Pressure Vessel Specifications:**

| Parameter | Value | Design Basis |
|-----------|-------|--------------|
| **Fuselage Diameter** | 3.40 m (134 in) | Circular cross-section |
| **Skin Material** | DTD 546 / 564 (Al-Cu-Mg, similar to 2024-T3) | σ_y = 325 MPa, σ_u = 470 MPa |
| **Skin Thickness** | 1.6–2.0 mm (chemically milled) | Static hoop stress at ΔP = 27.6 kPa |
| **Operating ΔP** | 27.6 kPa (4.0 psi) | Cabin altitude 2,400 m at 12,200 m |
| **Hoop Stress (Nominal)** | σ_θ = ΔP·r/t = 27,600×1.70/0.0018 = **26.0 MPa** | **SF = 12.5 on yield** |
| **Window Geometry** | **Square with rounded corners (r = 3.2 mm / 0.125 in)** | Manufacturing convenience |
| **Window Size** | 305 × 203 mm (12 × 8 in) | Passenger view requirement |
| **Rivet Pattern** | 4.8 mm dia, 25 mm pitch, double row | Standard practice |
| **Design Life** | 10,000 pressurization cycles | Assumed "infinite" at SF > 10 |

**The Fatal Flaw:** At σ_θ = 26 MPa nominal, the static safety factor was **12.5**. However, at square window corners with r = 3.2 mm, the **stress concentration factor K_t ≈ 3.5–4.0** (Peterson's charts for rounded rectangle). Combined with rivet hole K_t = 3.0:

$$\sigma_{local} \approx K_{t,window} \times K_{t,rivet} \times \sigma_{nominal} \approx 3.5 \times 3.0 \times 26 = 273 \text{ MPa}$$

**This local stress (273 MPa) exceeded the fatigue limit of DTD 546 (~140 MPa at 10⁷ cycles, R = 0.1).** Crack initiation was **guaranteed within hundreds of cycles**, not tens of thousands.

---

*End of Piece 1 — DOC-03 Lines 1801-1900*
*Next: Piece 2 — Section 3.2 Comet 1 Disaster Sequence (1954)*