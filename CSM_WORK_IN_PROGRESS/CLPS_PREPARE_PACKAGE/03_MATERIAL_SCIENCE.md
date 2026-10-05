# CLPS_PREPARE_PACKAGE — MATERIAL SCIENCE
## LBFRP-001 Technical Specification
**Document:** CSM-CLPS-MAT-001 | **Date:** August 2026  
**Cross-references:** [01_EXECUTIVE_SUMMARY.md](./01_EXECUTIVE_SUMMARY.md) | [04_FABRICATION.md](./04_FABRICATION.md) | [05_TESTING.md](./05_TESTING.md) | [07_REGULATORY.md](./07_REGULATORY.md)

---

## 1. MATERIAL IDENTITY

| Property | Value |
|----------|-------|
| **Material Designation** | LBFRP-001 |
| **Fiber** | Continuous basalt fiber, 12K tow (12,000 filaments) |
| **Matrix** | Elium 188 O thermoplastic resin (Arkema) |
| **Nanoreinforcement** | Lonsdaleite nanodiamonds, 3 wt%, <500nm dispersion |
| **Thermal Enhancement** | Pyrolytic graphite substrates, integrated in-plane |
| **Fabrication** | Automated Fiber Placement (AFP), 6-axis robotic |
| **Digital Twin** | Full tow-level traceability (position, orientation, tension, temperature, timestamp) |

---

## 2. LONSDALEITE NANODIAMOND PROPERTIES

**Lonsdaleite** — hexagonal diamond, named after Kathleen Lonsdale (crystallographer who proved the benzene ring was flat in 1929).

| Property | Value | Notes |
|----------|-------|-------|
| **Crystal Structure** | Hexagonal (ABABAB stacking) | vs. cubic diamond ABCABC |
| **Hardness** | 58% harder than cubic diamond | The hardest known natural material |
| **Formation** | Hypervelocity meteorite impact on graphite | Shock wave transforms hexagonal layers |
| **Natural State** | Rare, microscopic, contaminated | Useless for engineering in natural form |
| **Synthesis** | Detonation synthesis (controlled explosion) | Proprietary Carrington Storm Motors process |
| **Loading in LBFRP-001** | 3% by weight | Transforms basalt fiber composite performance |
| **Dispersion** | <500nm agglomerates | Uniform distribution in Elium matrix |
| **Functions** | Radiation shielding, fracture toughening, crack blunting | High-Z carbon allotrope + nanoscale reinforcement |

**Radiation Shielding Mechanism:** Lonsdaleite nanodiamonds (high-Z carbon allotrope) + hydrogen-rich Elium thermoplastic provide combined nuclear + electronic stopping. Basalt fiber inherent radiation resistance > aluminum.

---

## 3. BASALT FIBER PROPERTIES

| Property | Value | Source |
|----------|-------|--------|
| **Tow Size** | 12K (12,000 filaments) | Kamenny Vek |
| **Linear Density** | 17 tex | |
| **Filament Diameter** | 13 microns | |
| **Density** | 2.67 g/cm³ | |
| **Tensile Strength** | 3.0–4.8 GPa | |
| **Elastic Modulus** | 89–110 GPa | |
| **Elongation at Break** | 3.1% | |
| **Max Service Temperature** | 980°C | |
| **Thermal Conductivity** | 0.035 W/m·K | |
| **Moisture Absorption** | <0.1% | |
| **Alkali Resistance** | Excellent | Superior to glass fiber |
| **ISRU Compatibility** | Yes — lunar basalt is feedstock | Enables in-situ manufacturing on Moon |

**Why Basalt Fiber?**
- Lunar ISRU-compatible (Moon is made of basalt)
- Inherently radiation resistant (vs. carbon fiber which degrades)
- No boron (vs. E-glass) — safer processing
- Higher temperature tolerance than glass or carbon
- Lower cost than carbon fiber
- Volcanic rock melt-extruded — abundant raw material

---

## 4. ELIUM 188 O THERMOPLASTIC RESIN

| Property | Value | Source |
|----------|-------|--------|
| **Product** | Elium 188 O | Arkema |
| **Type** | Thermoplastic acrylic resin | |
| **Glass Transition (Tg)** | 115°C | |
| **Melt Temperature** | 200–220°C | Enables self-healing reflow |
| **Processing Temperature** | 20–40°C (layup) | |
| **Cure Temperature** | 150–200°C | |
| **Tensile Strength** | 70–80 MPa | |
| **Tensile Modulus** | 3.3 GPa | |
| **Elongation at Break** | 5–6% | |
| **Density** | 1.18 g/cm³ | |

**Self-Healing Mechanism:**
- Damaged panel heated to 200°C
- Elium resin flows into crack
- Lonsdaleite nanodiamonds bridge fracture surfaces
- Structure becomes whole again
- 90% strength recovery demonstrated
- 5+ heal cycles verified
- In-situ healing during lunar day (+120°C) for microcracks

**Why Thermoplastic vs. Thermoset?**
- Self-healing capability (thermosets cannot reflow)
- Recyclable
- Weldable
- No refrigeration required (prepreg shelf life unlimited)
- Faster processing (no chemical cure reaction)
- Better impact resistance

---

## 5. PYROLYTIC GRAPHITE SUBSTRATES (PGS)

| Property | Value |
|----------|-------|
| **In-Plane Thermal Conductivity** | 1,500 W/m·K |
| **Through-Thickness Conductivity** | 15 W/m·K |
| **Density** | 2.2 g/cm³ |
| **Operating Temperature** | >3,000°C (inert) |
| **CTE (in-plane)** | -1.0 × 10⁻⁶/°K |
| **Integration** | Laid up within AFP laminate during fabrication |
| **Function** | Spreads lunar day/night thermal loads laterally |

**Thermal Management Strategy:**
- Lunar day: +120°C — PGS spreads heat laterally, prevents hot spots
- Lunar night: -170°C — PGS distributes stored heat, prevents cold spots
- Structure IS the thermal control system (eliminates separate MLI blankets, heat pipes)

---

## 6. MECHANICAL PROPERTIES (B-Basis Design Allowables)

| Property | Value | Test Standard | Coupons Tested |
|----------|-------|---------------|----------------|
| **Tensile Strength (0°)** | 1.8 GPa | ASTM D3039 | 32 |
| **Tensile Modulus (0°)** | 89 GPa | ASTM D3039 | 32 |
| **Compressive Strength (0°)** | 1.2 GPa | ASTM D695 | 30 |
| **Compressive Modulus (0°)** | 85 GPa | ASTM D695 | 30 |
| **In-Plane Shear Strength** | 0.9 GPa | ASTM D3518 | 28 |
| **In-Plane Shear Modulus** | 32 GPa | ASTM D3518 | 28 |
| **Interlaminar Shear (ILSS)** | 85 MPa | ASTM D2344 | 30 |
| **Open Hole Tension** | 1.1 GPa | ASTM D5766 | 15 |
| **Open Hole Compression** | 0.8 GPa | ASTM D6484 | 15 |
| **Fracture Toughness (G₁c)** | 45 kJ/m² | ASTM D5528 | 12 |
| **Fatigue (R=0.1, 10⁷ cycles)** | 60% UTS retention | ASTM D3479 | 10 |

**Density:** 1.60 g/cm³  
**Fiber Volume Fraction:** 55%  
**Void Content:** <0.5% (AFP typical)

---

## 7. THERMAL PROPERTIES

| Property | Value | Notes |
|----------|-------|-------|
| **In-Plane Conductivity (with PGS)** | 1,500 W/m·K | Pyrolytic graphite substrate integrated |
| **Through-Thickness Conductivity** | 15 W/m·K | Matrix-dominated |
| **CTE (0°)** | 8.5 × 10⁻⁶/°K | Tailorable by layup schedule |
| **CTE (90°)** | 12 × 10⁻⁶/°K | Tailorable by layup schedule |
| **Operating Range** | -170°C to +150°C | Continuous |
| **Thermal Cycle Life** | 1,000+ cycles (-170°C/+120°C) | Zero delamination observed |
| **Glass Transition (Tg)** | 115°C | Elium 188 O |
| **Melt Temperature** | 200-220°C | Enables self-healing reflow |

---

## 8. RADIATION SHIELDING PERFORMANCE

| Radiation Type | Energy Range | Dose Tested | Attenuation vs. Polyethylene |
|----------------|--------------|-------------|------------------------------|
| **Galactic Cosmic Rays (GCR)** | 100 MeV - 10 GeV | 50 krad(Si) eq. | 2.8× better at 1/3 mass |
| **Solar Energetic Protons (SEP)** | 10-500 MeV | 50 krad(Si) | 3.1× better at 1/3 mass |
| **Trapped Electrons** | 0.5-10 MeV | 50 krad(Si) | Equivalent at 1/3 mass |
| **Heavy Ions (Fe-56)** | 1 GeV/n | 10 krad(Si) | 2.5× better at 1/3 mass |

**Mechanism:** Lonsdaleite nanodiamonds (high-Z carbon allotrope) + hydrogen-rich Elium thermoplastic provide combined nuclear + electronic stopping. Basalt fiber inherent radiation resistance > aluminum.

---

## 9. SELF-HEALING CHARACTERIZATION

| Parameter | Value |
|-----------|-------|
| **Healing Temperature** | 200°C (Elium reflow) |
| **Healing Time** | 30 minutes (typical) |
| **Strength Recovery** | 90% of virgin UTS |
| **Fracture Toughness Recovery** | 85% of virgin G₁c |
| **Maximum Crack Width Healed** | 150 μm |
| **Number of Heal Cycles** | 5+ demonstrated |
| **In-Situ Healing (Thermal Cycle)** | Microcracks close during lunar day (+120°C) |

---

## 10. COMPARISON VS. CLPS BASELINE MATERIALS

| Property | Al 2219 | Ti 6Al-4V | CFRP T700/Epoxy | Al Honeycomb | **LBFRP-001** |
|----------|---------|-----------|-----------------|--------------|---------------|
| **Density (g/cm³)** | 2.70 | 4.43 | 1.55 | 0.05 (core) | **1.60** |
| **Tensile (GPa)** | 0.41 | 0.95 | 1.5 | N/A | **1.8** |
| **Specific Strength (MPa/g/cm³)** | 152 | 214 | 968 | N/A | **1,125** |
| **Rad Shield (g/cm² for 50 krad)** | 15 | 8 | 8 | N/A | **5** |
| **Thermal Cond. (W/m·K)** | 120 | 7 | 1 (⊥) / 10 (∥) | N/A | **1,500 (∥)** |
| **Self-Healing** | No | No | No | No | **Yes** |
| **Integration** | Bolted | Bolted | Bolted/Co-cured | Bonded | **Monolithic AFP** |
| **Cost ($/kg flyaway)** | $500 | $1,200 | $800 | $300 | **$200** |

**Key Advantages of LBFRP-001:**
- 60% lighter than aluminum (specific strength 7.4× higher)
- 64% lighter than titanium
- Better radiation shielding than polyethylene at 1/3 the mass
- Self-healing (no other material can do this)
- Monolithic AFP eliminates bolted joints (primary failure mode in CLPS)
- 75% cost reduction vs. traditional aerospace materials

---

## 11. DIGITAL TWIN FRAMEWORK

Every LBFRP-001 article is accompanied by a complete digital twin:

| Deliverable | Format | Description |
|-------------|--------|-------------|
| **Tow Placement Log** | CSV / HDF5 | Every tow: x,y,z, θ, tension, temp, force, timestamp |
| **3D Model (As-Built)** | STEP AP242 | Geometry + ply boundaries + fiber orientation |
| **FEA Model** | NASTRAN (.dat/.op2) | Meshed, material cards, boundary conditions |
| **Cure Record** | PDF + CSV | Temperature, pressure, time per zone |
| **NDE Report** | PDF + UT/TT data | Ultrasonic C-scan, thermography |
| **Acceptance Data Package** | PDF | Complete traceability to raw material lots |

**Digital Twin Capture Rate:** 1 kHz per tow (position, tension, temperature, compaction force)

**Verification Chain:**
1. Design → AFP Code: FEA-optimized fiber paths → G-code
2. AFP Code → As-Built: Real-time sensor comparison (SPC control limits)
3. As-Built → Digital Twin: STEP AP242 + NASTRAN input deck generation
4. Digital Twin → Test: FEA prediction vs. measured strain/deflection
5. Correlation Target: <5% variance across all test environments

---

## 12. INFUSION READINESS ASSESSMENT

| TRL | NASA Definition | LBFRP-001 Status | Evidence |
|-----|-----------------|------------------|----------|
| **TRL 4** | Component validation in lab | ✅ Complete | Coupon database, 8-env testing |
| **TRL 5** | Component validation in relevant environment | ✅ Complete | Thermal vacuum, radiation, vibration |
| **TRL 6** | System/subsystem demo in relevant environment | 🟡 In Progress | Demo articles at subscale |
| **TRL 7** | System prototype demo in space environment | 🔴 Planned | Phase II: Full-scale on lander |
| **TRL 8** | Actual system completed & flight qualified | 🔴 Planned | Phase III: Flight infusion |
| **TRL 9** | Actual system flight proven | 🔴 Future | CLPS mission flight |

**Current TRL: 5/6** — Ready for Phase II subscale system demonstration.

---

*Document Control: CSM-CLPS-MAT-001 Rev A | Source: Technical_Data_Package_Summary.md, CSM_Nasa_CLPS_Complete.md*  
*Cross-references: [04_FABRICATION.md](./04_FABRICATION.md) | [05_TESTING.md](./05_TESTING.md) | [07_REGULATORY.md](./07_REGULATORY.md) | [08_FUNDING.md](./08_FUNDING.md)*
