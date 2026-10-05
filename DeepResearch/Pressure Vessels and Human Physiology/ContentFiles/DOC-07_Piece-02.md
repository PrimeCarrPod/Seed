# DOC-07: EMU Architecture — Anthropomorphic Pressure Vessels
## Document 7 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 5501-5600 | Piece 2 of 9 | ~100 Lines

---

#### 7.2 Layered Architecture: LCVG, Bladder, Restraint, TMG

**7.2.1 Complete Layer Stack (Inside to Outside)**

| Layer | Name | Material | Thickness | Function |
|-------|------|----------|-----------|----------|
| **1** | **LCVG** | Spandex + PVC tubing | 2–3 mm | Liquid cooling, ventilation |
| **2** | **Pressure Bladder** | Urethane-coated nylon (Gore-Tex®) | 0.25–0.4 mm | **Gas retention (primary seal)** |
| **3** | **Restraint Layer** | Dacron® polyester / Vectran® | 1–2 mm | **Structural load carriage** |
| **4** | **TMG Liner** | Neoprene / Nomex® | 1 mm | Thermal micrometeoroid protection (inner) |
| **5** | **Insulation** | Multi-layer insulation (MLI) | 5–10 mm | Thermal (radiative) |
| **6** | **Outer Shell** | Ortho-fabric (Nomex®/Gore-Tex®/Kevlar®) | 1–2 mm | Abrasion, UV, atomic oxygen |

**Total Thickness (Unpressurized):** ~15–25 mm
**Total Mass (EMU, no PLSS):** ~60 kg (130 lb)

**7.2.2 Layer 1: Liquid Cooling & Ventilation Garment (LCVG)**

**Construction:**
- **Base:** Spandex/Lycra® knit (form-fitting, elastic)
- **Tubing:** PVC or polyurethane, 3.2 mm OD, 1.6 mm ID, spaced 25 mm
- **Flow:** Water-glycol (60/40) at 10–15°C, 0.5–1.0 L/min
- **Ventilation:** Separate gas ducts (O₂ in, CO₂ out) or integrated

**Thermal Capacity:**
$$\dot{Q}_{cool} = \dot{m} c_p \Delta T = 0.008 \times 4180 \times 10 = 334 \text{ W}$$
**Covers metabolic range:** 100 W (rest) to 500 W (EVA work) with $\Delta T$ adjustment.

**Pressure Interaction:** LCVG is **outside bladder** → experiences suit pressure.
- Compression at 30 kPa: ~3% volume reduction (spandex stretches)
- No structural role — purely thermal/physiological

**7.2.3 Layer 2: Pressure Bladder — The Gas Seal**

**Material Evolution:**
| Era | Material | Coating | Thickness | Permeability |
|-----|----------|---------|-----------|--------------|
| Mercury | Neoprene rubber | None | 1.0 mm | High |
| Gemini | Neoprene/nylon | Neoprene | 0.8 mm | Medium |
| Apollo | Urethane/nylon | Urethane | 0.5 mm | Low |
| **Shuttle/ISS** | **Urethane/nylon (Gore-Tex®)** | **Urethane** | **0.25 mm** | **Very Low** |
| xEMU | **Urethane/nylon (advanced)** | **Gore-Tex® Pro** | **0.2 mm** | **Ultra-Low** |

**Bladder Mechanics:**
- **Zero bending stiffness** — pure membrane
- **Carries pressure load** until restraint engages
- **Strain at 30 kPa:** $\epsilon \approx 5\text{–}10\%$ (urethane nylon)
- **Must conform to body + joints** without wrinkling (wrinkles → stress concentrations)

**Bladder Patterning (Critical Design):**
- **3D anthropometric patterning** from laser scans
- **Gores & darts** for compound curvature (shoulders, crotch)
- **Seamless molded** for fingers/gloves (dip molding)
- **Seam types:** Lap seam (urethane welded), RF welded, adhesive bonded
- **Seam strength:** $\geq 4 \times$ operating pressure (burst SF = 4)

**Permeation Rate (Gore-Tex® Bladder):**
$$\dot{m}_{O_2} = \frac{P \cdot A \cdot \Delta p}{t} \approx \frac{10^{-12} \cdot 2 \cdot 30,000}{0.00025} = 2.4 \times 10^{-4} \text{ mol/s} = 0.0077 \text{ g/hr}$$
**Negligible vs. metabolic consumption (0.84 g/hr).**

**7.2.4 Layer 3: Restraint Layer — The Structural Skeleton**

**Function:** Converts bladder pressure into **tension forces** that maintain suit shape and carry external loads.

**Materials:**
- **Shuttle/ISS EMU:** Dacron® polyester (Type 52, 1000 denier)
- **xEMU/Axiom:** **Vectran® (LCP — Liquid Crystal Polymer)**
  - 2× strength of Dacron®, lower creep, better UV/atomic oxygen resistance

**Restraint Patterning:**
- **Non-elastic** — zero stretch at operating load
- **Pre-shaped** to body geometry at 1 atm (flat pattern)
- **Engages at ~5 kPa** (bladder stretches first, then restraint takes load)
- **Load path:** Bladder pressure → restraint tension → joint bearings → hard upper torso (HUT)

**Stress in Restraint (Membrane Theory):**
$$\sigma_{\text{restraint}} = \frac{P \cdot r}{t_{\text{restraint}}}$$
For torso ($r = 0.2$ m, $P = 30$ kPa, $t = 1$ mm):
$$\sigma = \frac{30,000 \times 0.2}{0.001} = 6 \text{ MPa}$$
Dacron® tensile strength: 600 MPa → **SF = 100** (very conservative)
**Why so thick?** Abrasion resistance, handling, seam allowance, not pressure stress.

**7.2.5 Layer 4–6: Thermal Micrometeoroid Garment (TMG)**

**Multi-Layer Insulation (MLI):**
- 10–15 layers of aluminized Mylar® (25 µm) + Dacron® net spacers
- **Effective emissivity:** $\epsilon_{\text{eff}} \approx 0.02$ (vs. 0.8 for single layer)
- **Thermal resistance:** $R \approx 1.5$ m²K/W (in vacuum)

**Outer Shell (Ortho-fabric):**
- **Woven:** Nomex® (thermal) + Gore-Tex® (waterproof) + Kevlar® (abrasion)
- **Mass:** 250 g/m²
- **Micrometeoroid Protection:** Stops 1 mm Al sphere at 7 km/s (with MLI)

**Thermal Balance (EVA in Sun):**
$$\alpha_s G_s + \alpha_{IR} G_{IR} + \dot{Q}_{met} = \epsilon \sigma T^4 + \dot{Q}_{LCVG}$$
Where $\alpha_s \approx 0.3$ (white Ortho-fabric), $G_s = 1360$ W/m²
**LCVG rejects 80% of metabolic heat; MLI radiates rest.**

---

*End of Piece 2 — DOC-07 Lines 5501-5600*
*Next: Piece 3 — Section 7.3 Joint Mechanics: Bellows, Convolutes, Planar, Rotary*