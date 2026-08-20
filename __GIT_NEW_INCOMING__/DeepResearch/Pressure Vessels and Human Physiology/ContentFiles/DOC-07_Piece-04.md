# DOC-07: EMU Architecture — Anthropomorphic Pressure Vessels
## Document 7 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 5701-5800 | Piece 4 of 9 | ~100 Lines

---

#### 7.4 Pressure Bladder Stress Analysis & Burst Criteria

**7.4.1 Bladder as Membrane — Stress State**

The bladder is a **thin membrane** (0.25 mm) carrying pressure until restraint engages.
**Stress in bladder:** $\sigma_b = \frac{P \cdot r}{t_b}$ (local radius of curvature)

**At Torso ($r \approx 0.2$ m):**
$$\sigma_b = \frac{30,000 \times 0.2}{0.00025} = 24 \text{ MPa}$$
Urethane nylon tensile strength: 50 MPa → **SF = 2.1** (on bladder alone)

**At Finger ($r \approx 0.01$ m):**
$$\sigma_b = \frac{30,000 \times 0.01}{0.00015} = 2 \text{ MPa}$$
Glove bladder (0.15 mm): **SF = 25** (very low stress due to small radius)

**Key Insight:** Bladder stress is **geometrically determined** — highest at large radii (torso), lowest at fingers.

**7.4.2 Restraint Engagement — Load Transfer**

**Sequence:**
1. $P = 0$ → Bladder loose on body
2. $P \uparrow$ → Bladder stretches, contacts restraint
3. $P \approx 5\text{–}10$ kPa → Restraint taut, takes load
4. $P > 10$ kPa → Bladder stress **constant** (restraint carries $\Delta P$)

**Load Transfer Analysis:**
$$\sigma_{total} = \sigma_{bladder} + \sigma_{restraint} \frac{t_r}{t_b}$$

Since $t_r \approx 1$ mm, $t_b \approx 0.25$ mm:
$$\frac{t_r}{t_b} \approx 4$$

**At Operating Pressure (30 kPa):**
- Bladder stress: ~10 MPa (clamped by restraint)
- Restraint stress: ~2 MPa (from $P \cdot r / t_r$)
- **Total equivalent:** Bladder sees $\approx 10 + 2 \times 4 = 18$ MPa

**7.4.3 Burst Criteria — NASA-STD-3001 Requirement**

**Requirement:** Bladder burst pressure $\geq 4 \times P_{op}$
$$P_{burst} \geq 4 \times 30 \text{ kPa} = 120 \text{ kPa} \quad (17.4 \text{ psi})$$

**Why 4×?**
- 1.5× for yield/ultimate (standard)
- 1.5× for **stress concentrations** (seams, joints, wrinkles)
- 1.5× for **degradation** (UV, atomic oxygen, thermal cycling, micrometeoroid)
- 1.5× for **no redundancy** (bladder failure = loss of crew)
- **Combined:** $1.5^4 \approx 5$ → 4× is conservative but practical

**7.4.4 Burst Test (Qualification)**

**Test Article:** Full bladder assembly (torso + limbs)
**Pressurization:** Helium (leak detection) or water (safety)
**Rate:** 10 kPa/min to 120 kPa
**Hold:** 5 min at 120 kPa
**Acceptance:** No rupture, leak rate < 1 sccm He

**Typical Results:**
- **Virgin bladder:** Burst at 250–300 kPa (SF = 8–10)
- **After thermal cycling (-100°C to +100°C, 50 cycles):** Burst at 180 kPa
- **After UV exposure (equiv. 5 years):** Burst at 200 kPa
- **After abrasion (1000 cycles):** Burst at 220 kPa

**All exceed 120 kPa requirement.**

**7.4.5 Seam Analysis — The Weak Link**

**Seam Types:**
| Type | Process | Strength Retention | Application |
|------|---------|-------------------|-------------|
| **RF Weld** | Dielectric heating | 90–95% | Torso, limbs (long seams) |
| **Ultrasonic Weld** | Vibration friction | 85–90% | Small parts, gloves |
| **Adhesive Bond** | Urethane adhesive | 80–85% | Complex 3D shapes |
| **Sewn + Sealed** | Stitch + tape | 70–75% | Legacy (Mercury/Gemini) |

**Seam Stress Concentration:**
$$K_t \approx 1.5\text{–}2.0 \quad \text{(for welded seam)}$$

**Design Rule:** Seam allowance $\geq 3 \times$ bladder thickness
**Test:** Peel strength $\geq 50$ N/cm, Shear $\geq 100$ N/cm

**7.4.6 Wrinkling & Stress Concentration — The Hidden Danger**

**Wrinkle Formation:** When bladder compresses (joint bend), excess material buckles.
**Wrinkle Stress Concentration:**
$$\sigma_{max} = K_w \sigma_{nom}$$
Where $K_w \approx 3\text{–}5$ for sharp wrinkle.

**Prevention:**
- **Patterning:** 3D CAD with finite element forming simulation
- **Darts/Gores:** Controlled excess material removal
- **Pre-stress:** Restraint keeps bladder taut at all joint angles
- **Lubrication:** Talc/Silicone between bladder and restraint

**7.4.7 Permeation & Leak Rate — Lifetime Budget**

**Total Allowed Leak (EMU):** $\leq 1.3 \times 10^{-4}$ std cm³/s (He)
**Sources:**
- Bladder permeation: $\approx 0.01 \times 10^{-4}$ (negligible)
- Seam permeation: $\approx 0.1 \times 10^{-4}$
- **Seals (neck, wrist, waist):** $\approx 1.0 \times 10^{-4}$ (dominant!)
- **Valves/Connectors:** $\approx 0.2 \times 10^{-4}$

**Seal Design Critical:** Neck ring, wrist disconnect, waist bearing — **metal-to-elastomer seals** with controlled compression (15–20% squeeze).

---

*End of Piece 4 — DOC-07 Lines 5701-5800*
*Next: Piece 5 — Section 7.5 Restraint Layer Load Distribution & Sizing*