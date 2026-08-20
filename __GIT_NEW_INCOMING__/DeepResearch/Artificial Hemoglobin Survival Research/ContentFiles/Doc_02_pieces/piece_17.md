# Document 2: First & Second Generation HBOCs - Toxicity & Polymerization
## Piece 17/18: Species Translation and Preclinical Model Predictivity for HBOC Toxicity

The failure of HBOCs in human clinical trials despite promising preclinical data highlights critical gaps in species translation. Understanding which animal models predict which human toxicities is essential for designing predictive preclinical packages for next-generation products.

**Species Differences in Hemoglobin Biology**:

| Parameter | Human | Dog | Pig | Sheep | Rat/Mouse | Baboon |
|-----------|-------|-----|-----|-------|-----------|--------|
| Hb MW | 64.5 kDa | 64.5 kDa | 64.5 kDa | 64.5 kDa | 64.5 kDa | 64.5 kDa |
| P50 (mmHg) | 27 | 32 | 29 | 30 | 38 | 28 |
| Bohr coeff | -0.48 | -0.42 | -0.45 | -0.40 | -0.35 | -0.47 |
| 2,3-DPG (mM) | 5.0 | 4.5 | 4.8 | 4.0 | 0.1 | 4.9 |
| NO reactivity | 1.0× | 1.2× | 0.9× | 1.1× | 0.8× | 1.0× |
| Haptoglobin | 1-2 g/L | 0.5-1 g/L | 1-2 g/L | 0.8-1.5 | 0.01 g/L | 1-2 g/L |
| CD163 affinity | High | High | High | High | Low | High |
| Spleen Hb clearance | Moderate | High | Moderate | Low | Very high | Moderate |

**Key Translational Gaps**:

1. **Haptoglobin Levels**: Rodents have negligible haptoglobin (0.01 g/L vs 1-2 g/L human). HBOC dimer clearance is Hp-dependent. Rodent studies underestimate dimer persistence and renal toxicity.
   
2. **Splenic Sequestration**: Rodents and dogs have high splenic filtration capacity (open circulation). Pigs and humans have closed splenic circulation — less sequestration. HBOCs cleared faster in rodents/dogs → underestimate human half-life.

3. **NO Reactivity**: Species vary in Hb-NO kinetics. Dog Hb reacts 20% faster with NO → overpredicts vasoconstriction. Pig Hb reacts 10% slower → underpredicts.

4. **2,3-DPG Content**: Rats have minimal 2,3-DPG (0.1 mM) — left-shifted P50 (38 mmHg). HBOC P50 effects differ in low-2,3-DPG species. Human 2,3-DPG (5 mM) right-shifts native Hb; HBOCs lack 2,3-DPG binding → larger relative deficit in humans.

5. **Complement System**: Rodent complement differs (C3, C5 structure). Anti-PEG responses strong in humans, weak in rodents. Complement activation by HBOCs poorly predicted by rodents.

6. **Vascular Anatomy**: Hamster cheek pouch (window chamber) has unique microvascular architecture — not representative of human skeletal muscle or cerebral microvasculature.

**Model Predictivity Assessment**:

*Hamster Window Chamber (Microvascular)*:
- Predicts: Microvascular perfusion, RBC/particle deformation, leukocyte adhesion, NO-mediated vasodilation.
- Does NOT predict: Systemic hemodynamics, renal clearance, immunogenicity, cardiac effects.
- Utility: High for rheology, microvascular O₂ delivery; Low for systemic toxicity.

*Rat Hemorrhage/Resuscitation*:
- Predicts: Volume expansion, Hb rise, lactate clearance, survival (short-term).
- Does NOT predict: Vasoconstriction magnitude (low Hp, high spleen clearance), renal toxicity (no Hp), immunogenicity.
- Utility: Moderate for efficacy; Low for safety.

*Dog Conscious Instrumented*:
- Predicts: Systemic hemodynamics (MAP, CO, SVR), coronary flow, renal blood flow, platelet function.
- Does NOT predict: Human NO reactivity exactly (dog Hb faster), Hp kinetics (lower Hp), immunogenicity.
- Utility: HIGH for cardiovascular safety; MODERATE for renal/immunological.

*Pig (Anesthetized or Conscious)*:
- Predicts: Cardiovascular (similar coronary anatomy), pulmonary, renal, coagulation.
- Does NOT predict: Exact NO reactivity (pig Hb slower), Hp similar but CD163 differences.
- Utility: HIGH for integrated cardiovascular-renal safety; best single large animal model.

*Sheep (Pulmonary Focus)*:
- Predicts: Pulmonary vascular response, liquid ventilation, gas exchange.
- Does NOT predict: Systemic vasoconstriction well (low Hp, different NO).
- Utility: HIGH for PFC/liquid ventilation; MODERATE for HBOCs.

*NHP (Baboon, Macaque)*:
- Predicts: All human-relevant endpoints (NO, Hp, CD163, immunogenicity, coagulation).
- Limitations: Cost ($50-100k/animal), ethics, availability, small N (6-12/group).
- Utility: HIGHEST predictivity; used for definitive safety packages.

**Quantitative Translation Framework**:

Allometric scaling for PK:
CL_human = CL_animal × (BW_human/BW_animal)^0.75
Vd_human = Vd_animal × (BW_human/BW_animal)^1.0
t½_human = t½_animal × (BW_human/BW_animal)^0.25

But for HBOCs, clearance is NOT purely allometric — it's mechanism-based (Hp, RES, renal). Better approach:

**Mechanism-Based Scaling**:
1. **Renal clearance**: Scale by GFR (human 120, dog 200, pig 80, rat 1 mL/min). Correct for filtration fraction and dimer fraction.
2. **RES clearance**: Scale by liver/spleen blood flow and Kupffer cell mass. Human RES capacity ≈ 10 mg/min Hb.
3. **Hp binding**: Scale by Hp concentration and synthesis rate. Human Hp 1.5 g/L, synthesis 10 mg/kg/day.
4. **NO scavenging**: Scale by vascular surface area and eNOS expression. Use in vitro human Hb-NO kinetics.

**Predictive Failure Case Studies**:

*Case 1: HemAssist (DCLHb)* — Rat: no mortality. Dog: MAP +40 mmHg. Human: mortality 2.4×. Dog model predicted vasoconstriction but not mortality magnitude (dog coronary circulation more resilient).

*Case 2: PolyHeme* — Pig: survival benefit in hemorrhage. Dog: MAP +25 mmHg. Human: mortality 1.3×. Pig model overpredicted benefit (pig spleen sequesters less, Hp higher).

*Case 3: Hemospan* — Rat: no complement activation. Human: strong anti-PEG complement. Rodent complement does not recognize PEG-IgM complexes.

*Case 4: Hemopure* — Dog: MAP +15 mmHg. Human: MAP +15 mmHg. GOOD prediction. Rat: no AKI. Human: no AKI (at approved doses). Dog renal model predicted human renal safety.

**Lessons for Next-Generation Preclinical Development**:

1. **Use mechanism-based models, not empirical allometry**.
2. **Test in at least two species with complementary strengths**: 
   - Dog/pig for cardiovascular-renal.
   - NHP for immunogenicity, NO, Hp (if feasible).
   - Humanized mouse (transgenic Hp, CD163) for renal/immunological.
3. **Include "stressed" models**: 
   - Hemorrhage + acidosis + hypothermia (trauma triad).
   - Sepsis + HBOC (inflammation priming).
   - Crush injury + HBOC (rhabdo + Hb).
4. **Measure human-relevant biomarkers in animals**: 
   - Syndecan-1 (glycocalyx), Ang-2 (endothelial), KIM-1 (renal), cfDNA (cell death).
5. **Use in vitro human systems**: 
   - Organ-chips (lung, kidney, vasculatures).
   - Human blood loop (ex vivo HBOC perfusion).
   - iPSC-derived endothelial cells, cardiomyocytes.

**FDA 2014 Guidance Alignment**:
The guidance explicitly requires:
- Two species (one non-rodent).
- Cardiovascular telemetry at supratherapeutic doses.
- Immunogenicity assessment.
- Mechanistic understanding of NO toxicity.

For ErythroMer and M101, the preclinical packages include:
- Dog: cardiovascular, renal, PK.
- Rat: efficacy (hemorrhage), PK, tissue distribution.
- NHP: immunogenicity, PK (limited N).
- Human organ-chips: microvascular perfusion, barrier function, NO.
- Human blood ex vivo: coagulation, complement, platelet function.

This multi-system approach addresses the translational gaps that doomed earlier products. The entrapment scenario adds complexity (combined hypoxia/hypercapnia/acidosis) that must be modeled in at least one species — the pig polytrauma model (hemorrhage + lung contusion + acidosis) is the current standard.

**Recommendation for Entrapment Product Development**:
1. **Primary efficacy model**: Pig 30% hemorrhage + 2h shock + FiO₂ 0.10 + PaCO₂ 60 mmHg (simulated entrapment). Endpoint: 24h survival, lactate, tissue PO₂.
2. **Primary safety model**: Conscious dog, telemetry, 3× human dose. Endpoint: MAP, HR, ECG, renal, coagulation, 7-day survival.
3. **Immunogenicity model**: Humanized mouse (hHp, hCD163) + NHP (if budget allows).
4. **Microvascular model**: Hamster window chamber + organ-chips.
5. **Biomarker qualification**: Syndecan-1, Ang-2, KIM-1, cfDNA in all models.

This comprehensive approach maximizes predictivity while respecting ethical and practical constraints. The goal is not perfect prediction (impossible) but sufficient confidence to proceed to human trials with a defined safety margin.