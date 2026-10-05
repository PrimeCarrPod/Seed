# DOC-07: EMU Architecture — Anthropomorphic Pressure Vessels
## Document 7 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 5801-5900 | Piece 5 of 9 | ~100 Lines

---

#### 7.5 Restraint Layer Load Distribution & Sizing

**7.5.1 Restraint as Tension Structure**

The restraint layer is a **tension-only fabric structure** that:
- Carries pressure load ($P \cdot r$)
- Distributes joint bearing loads
- Attaches to Hard Upper Torso (HUT)
- Provides attachment for PLSS, tools, tethers

**Load Path:**
$$P \rightarrow \text{Bladder} \rightarrow \text{Restraint} \rightarrow \text{Joint Bearings} \rightarrow \text{HUT} \rightarrow \text{PLSS}$$

**7.5.2 Membrane Stress in Restraint (Axisymmetric Regions)**

For cylindrical section (torso, limbs):
$$\sigma_{\theta} = \frac{P \cdot r}{t_r}$$
$$\sigma_z = \frac{P \cdot r}{2 t_r} \quad \text{(if closed ends)}$$

**Torso ($r = 0.2$ m, $P = 30$ kPa, $t_r = 1.0$ mm Dacron®):**
$$\sigma_{\theta} = \frac{30,000 \times 0.2}{0.001} = 6 \text{ MPa}$$
$$\sigma_z = 3 \text{ MPa}$$

**Dacron® Properties:**
- Tensile strength: 600 MPa (warp), 500 MPa (fill)
- Modulus: 12 GPa
- **SF = 100** (pressure stress only)

**Why So Thick?** Not for pressure — for:
- **Abrasion resistance** (EVA worksite contact)
- **Seam strength** (joining panels)
- **Handling/manufacturing** (minimum fabric weight)
- **Joint reinforcement** (local load concentrations)

**7.5.3 Joint Region Reinforcement — The Real Design Driver**

At joints, restraint must:
1. **Transfer pressure load** across joint
2. **React bearing loads** from joint housing
3. **Prevent bladder herniation** through joint gaps

**Elbow Restraint Design (Shuttle EMU):**
- **Bellows restraint:** Integral fabric convolutes
- **End fittings:** Aluminum rings (bonded to restraint)
- **Load at 90° bend:** $F = P \cdot A_{proj} = 30,000 \times \pi \times 0.08^2 = 603$ N
- **Stress in restraint at fitting:** $\sigma = F / (t_r \cdot w) = 603 / (0.001 \times 0.05) = 12$ MPa

**Still only 2% of strength!** But **fatigue at fitting radius** is the concern.

**7.5.4 Cable/Tendon Restraint System (Shoulder, Waist, Wrist)**

**Concept:** High-strength cables carry tension, fabric provides coverage.

**Shoulder Tendons (Shuttle EMU):**
- **Material:** Vectran® (LCP), 2 mm diameter
- **Count:** 8 tendons (4 anterior, 4 posterior)
- **Preload:** 50 N each (total 400 N)
- **Function:** Center arm in bearing, prevent ballooning

**Cable Stress:**
$$\sigma_{cable} = \frac{F}{A} = \frac{50}{\pi \times 1^2} = 15.9 \text{ MPa}$$
Vectran® strength: 3,000 MPa → **SF = 188**

**Why Cables?** Fabric cannot efficiently carry **uniaxial tension** across rotating joint.
Cables + bearings = **efficient load path**.

**7.5.5 Hard Upper Torso (HUT) — The Structural Anchor**

**HUT Material:** Fiberglass/epoxy (Shuttle) → **Carbon/epoxy (xEMU)**
**Geometry:** Rigid shell matching 95th %ile male torso
**Attachments:**
- Arm bearings (2×)
- Waist bearing (1×)
- PLSS mount (4×)
- Helmet ring (1×)
- Display/Control Module (DCM) mount

**HUT Stress (Pressure-Induced):**
HUT is **rigid** — pressure loads transferred to bearings.
**Bearing Load (Arm):**
$$F_{bearing} = P \cdot A_{arm\_base} = 30,000 \times \pi \times 0.12^2 = 1,357 \text{ N}$$
**Bearing Housing Stress:** ~50 MPa (Al 7075-T6, SF = 10)

**HUT Weight:**
- Shuttle (Fiberglass): 14 kg
- xEMU (Carbon): 9 kg (35% reduction)

**7.5.6 Restraint Sizing Methodology (Design Process)**

1. **Pressure Load:** $\sigma_{\theta} = P r / t_r$ → $t_{r,min} = P r / \sigma_{allow}$
2. **Joint Reinforcement:** Local thickness buildup (2–3×) at bearings
3. **Seam Allowance:** Panel joints every 150–200 mm → seam efficiency 0.85
4. **Abrasion Margin:** +0.3 mm (outer surface wear)
5. **Degradation Margin:** +20% for UV/atomic oxygen (15-year life)
6. **Final:** $t_r = \max(t_{r,min} \times \text{factors})$

**Example (xEMU Torso):**
1. $t_{r,min} = 30,000 \times 0.2 / (500 \times 10^6 / 2) = 0.024$ mm (theoretical)
2. Joint buildup: ×3 → 0.07 mm
3. Seam efficiency: /0.85 → 0.08 mm
4. Abrasion: +0.3 mm → 0.38 mm
5. Degradation: ×1.2 → 0.46 mm
6. **Minimum fabric weight:** 200 g/m² (Vectran® 500 denier)
7. **Selected:** 350 g/m² (margin for handling, seams)

**7.5.7 Restraint Fatigue — Cyclic Loading at Joints**

**Cycle Spectrum (ISS EMU):**
- 25 EVAs × 200 joint cycles/EVA = 5,000 cycles
- Pressure cycles: 25 (don/doff)

**Critical Location:** Restraint at bearing fitting (stress concentration)
**Fatigue Test:** 10,000 cycles at 1.5× operating load (no failure)
**S-N Curve (Dacron®):** $\sigma_{max} N^{0.1} = C$ (very flat — fabric is fatigue resistant)

**Life Limiter:** **UV/atomic oxygen degradation**, not mechanical fatigue.
**Vectran® advantage:** 10× better UV resistance → 25-year life.

---

*End of Piece 5 — DOC-07 Lines 5801-5900*
*Next: Piece 6 — Section 7.6 Mobility-Torque Trade Space & Metabolic Cost*