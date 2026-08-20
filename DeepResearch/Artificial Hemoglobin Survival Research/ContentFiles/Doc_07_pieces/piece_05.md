# Document 7: Intravenous Carbon Dioxide Mitigation — THAM, IPRAC, Peritoneal Dialysis, and Emerging Technologies
## Piece 5/18: THAM — Pharmacogenomics, Personalized Dosing, and Special Populations

While THAM dosing follows standardized protocols, inter-individual variability in pharmacokinetics, acid-base physiology, and comorbidities necessitates personalized dosing approaches. This piece examines pharmacogenomic influences, special population adjustments, and precision dosing strategies for THAM in entrapment rescue.

**Pharmacogenomic Influences on THAM Response**:

*Genetic Determinants of Acid-Base Physiology*:
- **Carbonic Anhydrase (CA) Isoforms**: CA II (CA2 gene) polymorphisms affect CO₂ hydration rate → alters baseline PaCO₂ and THAM buffering demand.
  - **CA2 rs16928513 (G>A)**: Reduced CA activity → slower CO₂ hydration → higher baseline PaCO₂ → greater THAM requirement.
- **Hemoglobin Variants**: HbS, HbC, HbE alter Bohr effect and CO₂ carriage (carbamino formation).
  - **HbS (β6 Glu→Val)**: Reduced Bohr effect → impaired CO₂ unloading → higher THAM requirement in acidosis.
- **Renal Transporters**: 
  - **SLC4A4 (NBCe1)**: Proximal tubule bicarbonate reabsorption. Variants → altered HCO₃⁻ reclamation → affects THAM-generated HCO₃⁻ handling.
  - **SLC26A6 (PAT1)**: Anion exchanger (Cl⁻/HCO₃⁻/oxalate). Variants → altered HCO₃⁻ secretion.
- **THAM Metabolism/Transport**:
  - **SLC7A8 (LAT2)**: Amino acid transporter — may transport THAM (structural similarity to amino acids).
  - **OCT2 (SLC22A2)**: Organic cation transporter — potential THAM renal secretion pathway.
  - **MATE1 (SLC47A1)**: Multidrug and toxin extrusion — potential THAM-H⁺ complex excretion.

*Pharmacogenomic Dosing Algorithm (Future Implementation)*:
| Genotype | THAM Dose Adjustment | Rationale |
|----------|---------------------|-----------|
| **CA2 reduced activity (AA)** | +25% maintenance rate | Slower CO₂ hydration → higher PaCO₂ for given VCO₂ |
| **HbS trait (AS)** | +15% maintenance rate | Reduced Bohr effect → impaired CO₂ unloading |
| **NBCe1 reduced function** | -10% maintenance rate | Reduced HCO₃⁻ reabsorption → enhanced THAM effect |
| **OCT2/MATE1 reduced function** | -20% maintenance rate | Reduced renal clearance → higher THAM exposure |

*Current Practice*: Pharmacogenomic testing not routinely available in entrapment. **Empiric protocol with vigilant monitoring** remains standard. Pharmacogenomic panel (CA2, Hb variant, NBCe1, OCT2, MATE1) recommended for pre-deployment screening of high-risk personnel.

**Special Populations — Detailed Dosing Adjustments**:

*Renal Impairment*:
| CrCl (mL/min) | Bolus | Maintenance Rate | Monitoring | Rationale |
|---------------|-------|------------------|------------|-----------|
| **≥60** | Standard (250 mL) | 125 mL/hr (max 250) | Standard | Normal renal clearance |
| **30-59** | Standard | 94 mL/hr (75%) | Na⁺, K⁺, Osm q2h | Reduced renal clearance |
| **15-29** | 125 mL (50%) | 62 mL/hr (50%) | Na⁺, K⁺, Osm q1h | Significantly reduced clearance |
| **<15 / Dialysis** | 62 mL (25%) | 31 mL/hr (25%) + dialysis | Pre/post dialysis levels | Minimal renal clearance; dialysis removes THAM |

*Dialysis Considerations*:
- **Intermittent HD**: THAM cleared by diffusion (MW 121 Da, low protein binding). Add 50 mmol THAM to dialysate or give 125 mL post-HD.
- **CRRT**: Continuous clearance. Add THAM to replacement fluid (50 mmol/L) or pre-filter infusion at 25% dose.
- **Peritoneal Dialysis**: THAM in dialysate (50 mmol/L) → enhances CO₂ removal + systemic buffering.

*Hepatic Impairment*:
- **No dose adjustment** (renal clearance predominant).
- **Caution**: Impaired lactate clearance → lactic acidosis may increase THAM requirement.
- **Monitor**: Lactate q2h, ammonia (if severe liver disease).

*Cardiac Dysfunction / Heart Failure*:
- **Volume Overload Risk**: THAM 0.3M = 600 mOsm/L → significant osmolar load.
- **Adjustment**: 
  - Bolus: 125 mL (50%) over 30 min.
  - Maintenance: 62 mL/hr (50%).
  - **Concurrent**: Furosemide 20-40 mg IV q12h, strict I/O, daily weight.
- **Hemodynamic Monitoring**: CVP/IVC ultrasound q4h, lung ultrasound q4h.

*Pulmonary Hypertension / Right Heart Failure*:
- **Risk**: THAM-induced osmotic diuresis → ↓ RV preload → may improve RV function.
- **Caution**: Rapid volume shifts → hemodynamic instability.
- **Protocol**: Slow bolus (250 mL over 60 min), maintenance 62 mL/hr, invasive monitoring.

*Obesity (BMI >35)*:
- **Vd Increased**: THAM distributes in total body water (TBW ↑ in obesity).
- **Dosing**: Use **adjusted body weight** (ABW = IBW + 0.4 × (TBW - IBW)) for dose calculation.
- **Bolus**: 3-5 mL/kg ABW (vs 3.5 mL/kg TBW standard).
- **Maintenance**: 1.5-2 mL/kg/hr ABW.

*Pediatrics*:
| Age/Weight | Bolus (0.3M) | Maintenance | Max Daily | Special Considerations |
|------------|--------------|-------------|-----------|------------------------|
| **Neonate (<1 mo)** | 3 mL/kg | 1 mL/kg/hr | 50 mL/kg/day | Immature renal function; monitor Na⁺, glucose |
| **Infant (1 mo - 1 yr)** | 3 mL/kg | 1.5 mL/kg/hr | 75 mL/kg/day | Higher metabolic rate → higher CO₂ production |
| **Child (1-12 yr)** | 3.5 mL/kg | 2 mL/kg/hr | 100 mL/kg/day | Standard monitoring |
| **Adolescent (>12 yr)** | Adult dosing | Adult dosing | Adult max | Adult protocol |

*Pregnancy*:
- **Category C**: No human teratogenicity data; animal studies negative.
- **Physiology**: ↑ VCO₂ (fetal + maternal), respiratory alkalosis (progesterone-driven hyperventilation) → compensated respiratory alkalosis baseline.
- **Entrapment Context**: If hypercapnia develops (airway obstruction, pulmonary edema), THAM indicated.
- **Dosing**: By maternal weight (standard). No fetal risk from THAM (MW 121, crosses placenta but rapidly cleared).
- **Monitoring**: Fetal heart rate (CTG), maternal ABG, fetal scalp pH if delivery imminent.

*Elderly (>65 years)*:
- **Renal Reserve**: ↓ GFR → reduced clearance.
- **Comorbidities**: HF, CKD, polypharmacy common.
- **Protocol**: 
  - Bolus: 125 mL (50%) over 60 min.
  - Maintenance: 62 mL/hr (50%).
  - Monitor: Na⁺, K⁺, osmolarity q2h, volume status q2h, mental status q1h.

**Therapeutic Drug Monitoring (TDM) for THAM**:

*Indications for TDM*:
- Renal impairment (CrCl <60).
- Obesity (BMI >35).
- Prolonged infusion (>24h).
- Unexplained hypernatremia/hypokalemia.
- Suspected accumulation (pH over-correction, rising Na⁺).

*Assay*: Plasma THAM concentration (HPLC-UV or LC-MS/MS).
- **Therapeutic Range**: 2-5 mmol/L (projected; not formally established).
- **Toxic Threshold**: >8 mmol/L (hypernatremia, hyperosmolality risk).
- **Sampling**: Trough (pre-dose) and peak (30 min post-bolus).

*Bayesian Dose Individualization*:
- **Prior**: Population PK model (CL = 120 mL/min, Vd = 0.6 L/kg).
- **Posterior**: Update with 1-2 measured concentrations.
- **Output**: Individualized CL, Vd → optimized maintenance rate.
- **Software**: Custom Bayesian forecaster (Stan/PyMC3) integrated into monitoring dashboard.

**THAM in Combination with Renal Replacement Therapy (RRT)**:

*Continuous Renal Replacement Therapy (CRRT)*:
- **Pre-filter Infusion**: THAM 50 mmol/L in replacement fluid → continuous buffering.
- **Dialysate Addition**: THAM 50 mmol/L in dialysate → enhances CO₂ clearance.
- **Dose**: Equivalent to 50-100 mL/hr of 0.3M THAM systemically.

*Intermittent Hemodialysis (IHD)*:
- **Pre-HD**: 250 mL bolus 30 min pre-HD.
- **During HD**: THAM 50 mmol/L in dialysate (if machine allows).
- **Post-HD**: 125 mL bolus if pH <7.30.

*Hybrid Therapy (CRRT + THAM Infusion)*:
- **Indication**: Severe metabolic + respiratory acidosis (pH <7.15) with AKI.
- **Protocol**: CRRT (CVVHDF, 25 mL/kg/hr) + THAM 62 mL/hr IV.
- **Target**: pH >7.25, lactate ↓ >10%/hr, circuit life >24h.

**Conclusion**: While standardized THAM protocols serve most entrapment victims, the integration of pharmacogenomics, special population adjustments, therapeutic drug monitoring, and RRT integration enables precision acid-base management. As pharmacogenomic testing becomes field-deployable (point-of-care genotyping), personalized THAM dosing will further optimize the risk-benefit ratio in the most vulnerable entrapment victims.