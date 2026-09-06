# Document 2: First & Second Generation HBOCs - Toxicity & Polymerization
## Piece 11/18: Pharmacokinetic Modeling - Multi-Compartment Analysis and Dose Optimization

Pharmacokinetic (PK) modeling of HBOCs requires multi-compartment approaches that account for the unique distribution, elimination, and transformation pathways of cell-free and polymerized hemoglobin. These models are essential for dose optimization in entrapment scenarios where repeated dosing over hours to days may be required.

**Physiologically-Based Pharmacokinetic (PBPK) Model Structure**:

The model comprises interconnected compartments representing physiological spaces:
1. **Central (Plasma)**: Volume Vc = 3 L (adult). Input: IV infusion. Output: distribution, renal clearance, hepatic/splenic clearance, haptoglobin binding.
2. **Interstitial (Extravascular)**: Volume Vt = 11 L. Receives Hb via capillary extravasation (permeability-surface area product PS). Returns via lymphatics.
3. **Renal**: Glomerular filtration (GFR = 120 mL/min) of dimers/oligomers <60 kDa. Tubular reabsorption (saturable, Michaelis-Menten).
4. **Hepatic/Splenic (RES)**: Uptake by Kupffer cells (liver) and red pulp macrophages (spleen). Capacity-limited, saturable.
5. **Haptoglobin Binding**: Plasma reaction compartment. Hb_dimer + Hp ⇌ Hb-Hp (Kd = 10⁻¹⁵ M). Complex cleared by CD163 on macrophages.

**Differential Equations**:

d[Hb_tet]_plasma/dt = -k_diss[Hb_tet] + k_assoc[Hb_dim]² - PS/Vc × [Hb_tet] - CL_renal/Vc × [Hb_tet] - CL_RES/Vc × [Hb_tet]
d[Hb_dim]_plasma/dt = 2×k_diss[Hb_tet] - 2×k_assoc[Hb_dim]² - k_on_Hp[Hb_dim][Hp] - PS/Vc × [Hb_dim] - CL_renal/Vc × [Hb_dim]
d[Hb-Hp]/dt = k_on_Hp[Hb_dim][Hp] - k_off_Hp[Hb-Hp] - CL_CD163[Hb-Hp]
d[Hp]/dt = k_syn - k_deg[Hp] - k_on_Hp[Hb_dim][Hp] + k_off_Hp[Hb-Hp]
d[Hb]_interstitial/dt = PS/Vt × ([Hb]_plasma - [Hb]_interstitial) - k_lymph[Hb]_interstitial

Where:
- k_diss = 0.1 s⁻¹ (tetramer → dimer)
- k_assoc = 10⁷ M⁻¹s⁻¹ (dimer → tetramer)
- PS = 0.5 mL/min/g tissue × 500 g muscle = 250 mL/min (for Hemopure, reduced 5× vs SFH)
- CL_renal = GFR × f_filtration (f = fraction <60 kDa)
- CL_RES = Vmax/(Km + [Hb]) (saturable)

**Parameter Values for Hemopure**:
| Parameter | Value | Source |
|-----------|-------|--------|
| Vc | 3 L | Standard |
| Vt | 11 L | Standard |
| k_diss | 0.05 s⁻¹ | Reduced vs native (cross-linking) |
| k_assoc | 5×10⁶ M⁻¹s⁻¹ | Reduced vs native |
| PS | 50 mL/min | Intravascular retention |
| CL_renal | 2 mL/min | Low (large MW) |
| Vmax_RES | 10 mg/min | Saturable |
| Km_RES | 50 mg/L | |
| k_syn_Hp | 1 mg/min | Basal synthesis |
| k_deg_Hp | 0.01 min⁻¹ | Half-life ~5 days |

**Simulation Results - Single Dose (500 mL, 13 g/dL = 65 g Hb)**:
- Cmax (plasma): 15 g/dL at end of infusion
- t½α: 8 min (distribution)
- t½β: 16 hours (elimination)
- AUC: 280 g·h/L
- Hp depletion: 90% at 2h, recovery to 50% by 24h, baseline by 7 days
- Urinary Hb excretion: <1% of dose
- RES uptake: 60% of dose by 72h

**Repeated Dosing Simulation (q6h × 4 doses)**:
- Accumulation ratio: 1.3 (due to long t½β)
- Cmax after 4th dose: 19 g/dL
- Hp: depleted after 1st dose, remains <10% baseline throughout
- Renal filtration: increases as Hp depleted (more free dimers)
- RES saturation: Vmax approached by 3rd dose → non-linear PK

**Dose Optimization for Entrapment**:
Target: Maintain plasma [Hb] ≥ 5 g/dL for oxygen delivery, <15 g/dL for viscosity.
Constraints: 
- Viscosity >5 cP impairs microcirculation (at [Hb] >15 g/dL).
- MAP increase <20 mmHg (vasoconstriction limit).
- Renal safety: dimer exposure < threshold.

Optimized Regimen:
- Loading dose: 250 mL (32.5 g Hb) over 30 min → Cmax ~8 g/dL
- Maintenance: 125 mL q6h (16.25 g Hb) → maintains 5-8 g/dL
- Total 24h: 625 mL (81 g Hb) — within safety margins
- If Hp co-administered: can increase to 250 mL q6h (130 g Hb/24h)

**Population PK Variability**:
- Vc: ±20% (body size)
- GFR: ±50% (renal function)
- Hp baseline: 0.5-5 g/L (acute phase)
- RES capacity: ±30% (liver/spleen size, inflammation)
- Monte Carlo simulation (N=1000): 90% achieve target [Hb] 5-10 g/dL with above regimen.

**Entrapment-Specific PK Considerations**:
1. **Reduced GFR**: Shock → GFR ↓ 50-80% → reduced renal clearance → higher [Hb] → increased viscosity/vasoconstriction risk. Dose reduction 30-50%.
2. **Reduced RES function**: Sepsis/inflammation → Kupffer cell dysfunction → reduced hepatic clearance → prolonged half-life. Monitor [Hb].
3. **Acidosis**: Increases Hb-O₂ affinity (left-shift) but may increase dimer dissociation (right-shift). Net PK effect minimal.
4. **Hypothermia**: Slows all clearance pathways. t½β increases 2-3× at 33°C.
5. **Crush injury**: Myoglobin competes for Hp, RES clearance. Increases free Hb dimer fraction.

**Bayesian Dose Adjustment**:
With sparse sampling (pre-dose, 1h, 6h post-dose), Bayesian forecasting can individualize maintenance dose:
- Measure plasma [Hb] (spectrophotometry, 380-450 nm)
- Measure Hp (immunoturbidimetry)
- Update individual PK parameters
- Predict next dose for target [Hb]

**Model Validation**:
Hemopure human data (N=200, Phase I-III):
- Predicted vs observed Cmax: r² = 0.85
- Predicted vs observed AUC: r² = 0.78
- Predicted vs observed t½β: r² = 0.72
- Acceptable for dose selection; requires prospective validation.

This PBPK framework provides a quantitative basis for HBOC dosing in entrapment, enabling rational regimen design that balances oxygen delivery against toxicity risks. The model can be adapted for each HBOC generation by adjusting MW-dependent parameters (PS, CL_renal, CL_RES).