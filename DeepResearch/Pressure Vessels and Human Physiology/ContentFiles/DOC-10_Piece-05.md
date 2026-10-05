# DOC-10: Closed-Loop Scrubbing Thermodynamics
## Document 10 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 8501-8600 | Piece 5 of 9 | ~100 Lines

---

#### 10.5 Trace Contaminant Control

**10.5.1 Sources of Trace Contaminants in PVHOs**

| Source | Compounds | Typical Rate |
|--------|-----------|--------------|
| **Human Metabolism** | Acetone, isoprene, ethanol, methanol, CO, CH₄ | 0.1–10 mg/hr/person |
| **Off-gassing (materials)** | Formaldehyde, siloxanes, phthalates, VOCs | 0.01–1 mg/hr/m² |
| **Equipment** | Ozone (electronics), freons (cooling), hydraulic fluid | Intermittent |
| **Payload/Experiments** | Experiment-specific | Variable |
| **Leaks** | Hydrazine (thrusters), NH₃ (coolant) | Emergency |

**10.5.2 Toxicological Limits (SMACs — Spacecraft Maximum Allowable Concentrations)**

**NASA SMACs (Selected, 24-hr / 7-day / 180-day):**
| Compound | 24-hr [mg/m³] | 7-day [mg/m³] | 180-day [mg/m³] | Target Organ |
|----------|---------------|---------------|-----------------|--------------|
| **CO** | 25 | 10 | 5 | Hypoxia (COHb) |
| **Formaldehyde** | 0.12 | 0.04 | 0.01 | Carcinogen |
| **Ammonia** | 27 | 14 | 7 | Irritant |
| **Freon 218** | 1,000 | 500 | 200 | CNS |
| **Methanol** | 260 | 40 | 20 | Visual/CNS |
| **Ethanol** | 1,900 | 1,000 | 500 | CNS |
| **Acetone** | 1,200 | 600 | 300 | CNS |
| **Siloxanes (D4/D5)** | 10 | 3 | 1 | Liver |

**10.5.3 Activated Carbon Adsorption — Primary Removal Method**

**Mechanism:** Physical adsorption (van der Waals) in micropores
**Capacity (Typical):**
- **VOCs:** 10–30% weight (100–300 g/kg carbon)
- **Formaldehyde:** Low (chemisorption needed)
- **Ammonia:** Low (acid-impregnated carbon)
- **Siloxanes:** High (50–100 g/kg)

**Carbon Bed Design (ISS Trace Contaminant Control System — TCCS):**
- **Mass:** 4.5 kg activated carbon (coconut shell, 4×8 mesh)
- **Flow:** 10% of total circulation (17 L/min)
- **Contact time:** 0.5 s (superficial velocity ~0.5 m/s)
- **Life:** 12 months (replaced during maintenance)

**Breakthrough Curve (Bohart-Adams Model):**
$$\frac{C}{C_0} = \frac{1}{1 + \exp\left[\frac{k N_0 Z}{U} - k C_0 t\right]}$$

Where $N_0$ = saturation capacity, $Z$ = bed depth, $U$ = velocity.

**10.5.4 Catalytic Oxidation — For Non-Adsorbables**

**Compounds Requiring Oxidation:**
- **CO** (not adsorbed) → CO₂
- **H₂** (flammability) → H₂O
- **CH₄** (not adsorbed) → CO₂ + H₂O
- **Formaldehyde** → CO₂ + H₂O

**Catalyst:** **Hopcalite** (MnO₂/CuO) or **Platinum on Alumina**
**Reaction:** $2\text{CO} + \text{O}_2 \xrightarrow{\text{catalyst}} 2\text{CO}_2$
**Temperature:** 100–200°C (self-sustaining after light-off)

**ISS TCCS Catalytic Oxidizer:**
- **Mass:** 2.3 kg
- **Power:** 80 W (heater for startup)
- **Flow:** 17 L/min (10% slipstream)
- **Efficiency:** > 95% CO conversion

**10.5.5 Photocatalytic Oxidation (PCO) — Emerging Technology**

**Principle:** UV light + TiO₂ catalyst → OH· radicals → mineralize VOCs
**Reaction:** $\text{VOC} + \text{OH·} \rightarrow \text{CO}_2 + \text{H}_2\text{O} + \text{intermediates}$

**Advantages:**
- **Low temperature** (room temp)
- **Broad spectrum** (most organics)
- **No consumables** (catalyst stable)

**Challenges:**
- **Incomplete oxidation** → toxic intermediates (formaldehyde, CO)
- **Catalyst fouling** (siloxanes, sulfurs)
- **UV lamp degradation** (mercury/LED)

**NASA PCO Development (Next-Gen TCCS):**
- **LED-UV (365 nm)** + **TiO₂/WO₃** catalyst
- **Mass:** 1.5 kg
- **Power:** 15 W
- **Target:** Replace carbon + catalytic oxidizer

**10.5.6 Trace Contaminant Monitoring**

**Instruments (ISS):**
| Instrument | Principle | Compounds | Range |
|------------|-----------|-----------|-------|
| **ANITA-2** | FTIR | 33 target gases | ppb–ppm |
| **MCA** | Mass Spec (quadrupole) | 10 major gases | ppm |
| **VOC Monitor** | GC/IMS | Volatiles | ppb |
| **Formaldehyde** | Fluorometric | HCHO | 1–100 ppb |

**Real-Time Data → Ground Analysis → Crew Procedures (ventilation, filter change)**

**10.5.7 PVHO Class Requirements Comparison**

| PVHO Class | CO₂ Scrubber | Trace Control | Monitoring |
|------------|--------------|---------------|------------|
| **Hyperbaric Chamber** | Soda Lime | Carbon + Catalytic | Periodic grab samples |
| **Submersible** | Soda Lime / LiOH | Carbon | Portable analyzers |
| **Aircraft** | None (bleed air) | Ozone converters | CO detectors |
| **EMU (EVA)** | LiOH | None (open loop) | Suit telemetry only |
| **ISS / Gateway** | CDRA (Zeolite) | TCCS (Carbon + CatOx) | ANITA-2, MCA |
| **Lunar Base** | SASB / ECCR | PCO + Carbon | Continuous GC/MS |

---

*End of Piece 5 — DOC-10 Lines 8501-8600*
*Next: Piece 6 — Section 10.6 Thermal Integration: LCVG, Sublimator, Flash Evaporator*