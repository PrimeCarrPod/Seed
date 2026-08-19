# DOC-14: Perfluorocarbon Chemistry — Molecular Engineering
## Document 14 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 12301-12400 | Piece 7 of 9 | ~100 Lines

---

#### 14.7 PFC Emulsion Engineering for IV Delivery

**14.7.1 Emulsion Formulation Science**

**Target Composition (Clinical Grade):**
| Component | Concentration | Function |
|-----------|---------------|----------|
| **PFC Core** | 40–60% vol | O₂/CO₂ carrier |
| **Phospholipid** | 1.2–2.0% wt | Emulsifier (monolayer) |
| **PEG-Lipid** | 0.5–1.0% wt | Steric stabilization |
| **Electrolyte** | Isotonic (280 mOsm) | Tonicity |
| **Buffer** | Phosphate/Hepes | pH 7.4 |
| **Antioxidant** | α-Tocopherol (0.01%) | Prevent oxidation |
| **Water** | q.s. to 100% | Carrier |

**Droplet Size Control (Critical):**
- **Target:** 0.15–0.25 µm (mean)
- **PDI (Polydispersity):** < 0.15
- **Method:** High-pressure homogenization (15,000–25,000 psi, 3–5 passes)
- **Cooling:** Essential (ΔH_mix > 0)

**14.7.2 Phospholipid Monolayer Engineering**

**Lipid Composition (Molar %):**
| Lipid | % | Function |
|-------|---|----------|
| **Egg Yolk PC (EPC)** | 70–80% | Primary emulsifier |
| **DSPC (sat. PC)** | 10–15% | Rigidity, stability |
| **Cholesterol** | 5–10% | Membrane fluidity buffer |
| **DSPE-PEG2000** | 3–5% | Steric shield (stealth) |
| **DSPE-PEG350** | 1–2% | Shorter PEG, denser brush |

**Monolayer Packing:**
- **Area per Molecule:** 0.5–0.7 nm²
- **Surface Pressure:** 30–35 mN/m (near collapse)
- **Phase:** Liquid-condensed (LC) at 37°C

**PEG Brush Parameters:**
- **PEG2000:** Mushroom-to-brush transition at ~3%
- **Grafting Density:** 3–5% → **Brush regime** (steric stabilization)
- **Brush Height:** ~15 nm (PEG2000)
- **Repulsion Range:** 30 nm (prevents aggregation)

**14.7.3 Emulsion Stability — The Shelf-Life Challenge**

**Degradation Pathways:**
| Pathway | Mechanism | Rate | Mitigation |
|---------|-----------|------|------------|
| **Ostwald Ripening** | Gas diffusion large→small droplets | $dr/dt \propto \gamma/r^2$ | Low γ (PFCs help!), low T |
| **Coalescence** | Droplet fusion (film rupture) | Exponential in γ | PEG steric barrier |
| **Creaming/Sedimentation** | Buoyancy (Δρ = 0.9 g/mL) | Stokes law | Small droplets, viscosity |
| **Oxidation** | Radical chain (PFC stable, lipids not) | Autocatalytic | α-Tocopherol, N₂ headspace |
| **Hydrolysis** | Ester hydrolysis (phospholipids) | pH-dependent | pH 7.4, chelators |

**Stability Metrics (Accelerated Aging, 40°C):**
| Parameter | Acceptance Criteria |
|-----------|---------------------|
| **Mean Diameter** | < 300 nm (from 180 nm) |
| **PDI** | < 0.20 (from 0.10) |
| **Zeta Potential** | < -30 mV (PEG masks charge) |
| **PFC Content** | > 95% of initial |
| **Peroxide Value** | < 10 meq/kg |
| **pH** | 7.0–7.8 |

**Projected Shelf Life (2–8°C): 18–24 months**

**14.7.4 In Vivo Fate — Pharmacokinetics of IV PFC Emulsion**

**IV Bolus (10 mL/kg of 60% emulsion):**
| Phase | Half-life | Process |
|-------|-----------|---------|
| **Distribution (α)** | 5–15 min | Vascular → tissue |
| **Elimination (β)** | 2–6 hr | RES uptake (liver, spleen) |
| **Terminal (γ)** | 2–5 days | Slow release from RES |

**Organ Distribution (24 hr post-dose, rat):**
| Organ | % Injected Dose | PFC Concentration |
|-------|----------------|-------------------|
| **Liver** | 40–50% | 20–30% w/w |
| **Spleen** | 15–20% | 10–15% w/w |
| **Lung** | 5–10% | 2–5% w/w |
| **Blood** | 2–5% | 0.5–1% w/w |
| **Kidney** | < 1% | < 0.5% w/w |
| **Brain** | < 0.1% | < 0.01% w/w (BBB intact) |

**Clearance Mechanism:**
1. **Opsonization:** Complement (C3b), IgG → recognized by macrophages
2. **Phagocytosis:** Kupffer cells (liver), splenic macrophages
3. **Intracellular:** PFC droplets in lysosomal vacuoles
3. **Release:** Slow evaporation → exhalation (vapor pressure driven)

**14.7.5 O₂ Delivery Kinetics (IV Emulsion)**

**O₂ Loading (Ex Vivo):**
- **Gas:** 100% O₂ at 2–3 atm
- **Time:** 10–20 min (membrane oxygenator)
- **Saturation:** > 95% of theoretical capacity

**O₂ Release In Vivo:**
$$\frac{dC_{O_2}}{dt} = -k_{\text{release}} \cdot (C_{O_2} - C_{\text{equil}})$$
$k_{\text{release}} \approx 0.1\text{–}0.2 \text{ min}^{-1}$ (capillary transit)

**O₂ Delivery per Pass (Capillary):**
- **Transit Time:** ~1 sec
- **Release Fraction:** ~10–15%
- **Arteriovenous Difference:** 1–2 vol% (vs. 5 vol% for blood)

**Total O₂ Delivery (10 mL/kg, 60% emulsion):**
- **O₂ Capacity:** 30 mL O₂/100 mL emulsion
- **Dose:** 6 mL O₂/kg
- **Duration:** 30–60 min (continuous infusion)

**14.7.6 Clinical Emulsion Products (Historical/Current)**

| Product | PFC | Surfactant | Size [nm] | PFC [%] | Status |
|---------|-----|------------|-----------|---------|--------|
| **Fluosol-DA-20** (Green Cross) | Perfluorodecalin | Pluronic F-68 | 200 | 20% | **Approved Japan (1989), withdrawn** |
| **Oxygent** (Alliance) | Perfluoro-n-octane | Egg phospholipid | 180 | 60% | **Phase III (failed — stroke risk)** |
| **Oxycyte** (Synthetic Blood) | Perfluoro-tert-butylcyclohexane | Egg phospholipid | 200 | 60% | **Phase II (trauma)** |
| **PHER-O₂** (Sanguine) | Perfluorooctyl bromide | Phospholipid/PEG | 150 | 40% | **Preclinical** |
| **NanO₂** (NanoBlood) | Perfluoro-n-octane | DSPE-PEG/Chol | 150 | 50% | **Preclinical** |

**Key Failure Modes (Historical):**
- **Fluosol:** Complement activation, low O₂ capacity (20% PFC)
- **Oxygent:** **Stroke risk** (microemboli from 200 nm droplets?), platelet activation
- **Lesson:** **< 200 nm, PEGylated, complement-inert** essential

---

*End of Piece 7 — DOC-14 Lines 12301-12400*
*Next: Piece 8 — Section 14.8 Environmental Impact & Green Chemistry*