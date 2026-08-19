# DOC-07: EMU Architecture — Anthropomorphic Pressure Vessels
## Document 7 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 6101-6200 | Piece 8 of 9 | ~100 Lines

---

#### 7.8 Comparative Analysis: NASA EMU vs. Orlan vs. xEMU vs. Feitian

**7.8.1 System-Level Comparison**

| Parameter | **NASA EMU (ISS)** | **Orlan-MKS** | **xEMU / Axiom** | **Feitian** |
|-----------|-------------------|---------------|------------------|-------------|
| **Agency** | NASA | Roscosmos | NASA/Axiom | CNSA |
| **Operating Pressure** | 29.6 kPa (4.3 psi) | 40 kPa (5.8 psi) | 29.6/34.5 kPa | 30 kPa |
| **Entry Method** | Waist (two-piece) | **Rear hatch** (one-piece) | Two-piece (modular) | Two-piece |
| **Pre-breathe (from 101 kPa)** | 4 hr @ 101 kPa + 45 min O₂ | **30 min O₂** | 4 hr / 30 min (8.3 psi) | ~4 hr |
| **EVA Duration** | 7–8 hr | 7 hr | 8 hr | 6–7 hr |
| **Suit Mass (dry)** | 60 kg | 55 kg | 55 kg | 58 kg |
| **PLSS Mass** | 29 kg | 28 kg (integrated) | 25 kg | 27 kg |
| **Total Suited Mass** | ~130 kg | ~110 kg | ~115 kg | ~115 kg |
| **Joint Type** | Bellows/convolute | Bellows/convolute | **Rolling lobe** | Bellows |
| **Glove** | Convolute + tendon | Convolute | **Rolling lobe** | Convolute |
| **Helmet** | Bubble (polycarbonate) | Fixed visor + lights | Bubble (enhanced) | Bubble |
| **Life (Cycles)** | 25 EVAs / 15 yr | 10 EVAs / 10 yr | **50 EVAs / 20 yr** | 15 EVAs |
| **Manufacturing** | Custom-fit (laser scan) | **S/M/L sizes only** | Modular (S/M/L/XL) | S/M/L |

**7.8.2 Rear-Entry vs. Waist-Entry — Structural Implications**

**Orlan (Rear Hatch):**
- **Hatch:** Elliptical (400 × 300 mm), rear torso
- **Sealing:** Inflatable seal (pressure-assisted)
- **Structural Advantage:** No waist bearing → continuous restraint around torso
- **Pressure Load on Hatch:** $F = P \cdot A = 40,000 \times 0.1 \times 0.08 = 320$ N
- **Hatch Torque (Open):** 50 N·m (manual crank)
- **Don/Doff Time:** 5 min (vs. 15 min for EMU)

**EMU (Waist Entry):**
- **Waist Bearing:** Rotary (ball bearing, 200 mm dia)
- **Seal:** Dual O-ring (metal-to-elastomer)
- **Structural Discontinuity:** Restraint split at waist → load transfer via bearing housing
- **Don/Doff Time:** 15 min (requires assistance)

**xEMU (Modular Two-Piece):**
- **Waist Interface:** Quick-disconnect (QD) flange with 8 bolts
- **Seal:** Metal C-ring (reusable, 50 cycles)
- **Advantage:** Separate upper/lower manufacturing, sizing
- **Don/Doff:** 10 min (self-don lower, assist upper)

**7.8.3 Rolling Lobe Joint — xEMU Innovation**

**NASA/ILC Patent (US 10,xxx,xxx): Rolling Lobe Joint**
- **Bladder:** Single toroidal lobe that rolls (no convolution creases)
- **Restraint:** Integrated fabric sleeve that rolls with bladder
- **Volume Change:** **Zero** ($dV/d\theta = 0$) — constant volume

**Torque Comparison (Elbow, 29.6 kPa):**
| Joint Type | Max Torque [N·m] | Torque at 45° [N·m] | Cycle Life |
|------------|------------------|---------------------|------------|
| **Bellows (EMU)** | 7.5 | 3.5 | 25,000 |
| **Convolute (Orlan)** | 8.5 | 4.0 | 15,000 |
| **Rolling Lobe (xEMU)** | **2.5** | **1.2** | **100,000** |

**Mechanism:**
- Bladder lobe rolls like tire sidewall
- Restraint fabric rolls synchronously
- **No creasing** → no fatigue at fold lines
- **Constant volume** → zero pressure torque

**7.8.4 Glove Comparison — The Human Interface**

| Feature | EMU (Phase VI) | Orlan | xEMU (Rolling) | Feitian |
|---------|----------------|-------|----------------|---------|
| **Bladder** | Dip-molded urethane | Dip-molded | Dip-molded + rolling | Dip-molded |
| **Restraint** | Knit Dacron + tendons | Knit Dacron | **Knit Vectran + rolling** | Knit Dacron |
| **Grip Strength** | 30% bare hand | 25% bare hand | **50% bare hand** | 28% bare hand |
| **Dexterity (Purdue Pegboard)** | 15 pegs/min | 12 pegs/min | **25 pegs/min** | 14 pegs/min |
| **Fatigue (20 min)** | Severe | Severe | **Moderate** | Severe |
| **Thermal (Fingertips)** | Heated (resistive) | Heated | Heated (improved) | Heated |

**xEMU Glove Target:** 50% bare-hand grip strength → **game changer for lunar construction.**

**7.8.5 Helmet & Visor — Optical & Structural**

| Parameter | EMU | Orlan | xEMU | Feitian |
|-----------|-----|-------|------|---------|
| **Geometry** | Bubble (spherical) | **Flat + curved visor** | Bubble (larger) | Bubble |
| **Material** | Polycarbonate (Lexan®) | Polycarbonate | **Polycarbonate + coating** | Polycarbonate |
| **Thickness** | 4 mm (inner) + 3 mm (outer) | 6 mm (single) | 4 mm + 3 mm | 5 mm |
| **Coating** | Anti-fog (inner), Gold (outer) | Anti-fog, Gold | **Anti-fog, Gold, Hardcoat** | Anti-fog, Gold |
| **FOV (Horizontal)** | 180° | 120° (visor limited) | **200°** | 160° |
| **Pressure Load** | Membrane (spherical) | Bending (flat) | Membrane | Membrane |
| **Debris Shield** | None (relies on TMG) | None | **Removable debris pane** | None |

**xEMU Helmet:** Larger bubble for **200° FOV** — critical for lunar driving/construction.
**Debris Pane:** 2 mm polycarbonate, replaceable on orbit (4 bolts).

**7.8.6 Manufacturing Philosophy — Custom vs. Sized**

**EMU (Custom-Fit):**
- Laser scan astronaut → 3D model
- Bladder/Restrain patterned to individual
- **Advantage:** Optimal fit, minimal wrinkles
- **Disadvantage:** 6-month lead time, no interchangeability

**Orlan (S/M/L Only):**
- 3 standard sizes (Small, Medium, Large)
- Adjustable straps for fit
- **Advantage:** Immediate availability, interchangeable
- **Disadvantage:** Suboptimal fit → wrinkles, pressure points

**xEMU (Modular S/M/L/XL):**
- 4 standard sizes per component (HUT, arms, legs, gloves)
- **Interchangeable** — any upper with any lower
- **Advantage:** Logistics flexibility, faster training
- **Fit:** Good (95% population coverage)

**Feitian (S/M/L):**
- Similar to Orlan philosophy
- 3 sizes, adjustable

---

*End of Piece 8 — DOC-07 Lines 6101-6200*
*Next: Piece 9 — References, Cross-Links, Validation & Document Closure*