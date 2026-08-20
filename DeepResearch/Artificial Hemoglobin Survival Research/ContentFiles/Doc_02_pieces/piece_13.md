# Document 2: First & Second Generation HBOCs - Toxicity & Polymerization
## Piece 13/18: Oxygen Transport Physiology with HBOCs - Physiological Modeling and Clinical Correlation

The ultimate measure of an HBOC's utility is its ability to improve tissue oxygenation in the clinical settings for which it is intended. This requires integrating oxygen transport physiology, HBOC biophysical properties, and the pathophysiological context of the patient. For entrapment scenarios, the modeling must account for combined hypoxia, hypercapnia, acidosis, and potential hemorrhage.

**Oxygen Transport Cascade with HBOCs**:

The oxygen cascade from atmosphere to mitochondria:
Atmosphere → Alveoli → Arterial blood → Capillaries → Interstitium → Cells → Mitochondria

HBOCs alter the arterial blood and capillary steps. The key equations:

1. **Arterial Oxygen Content (CaO₂)**:
   CaO₂ = (1.34 × [Hb_native] × SaO₂_native) + (1.34 × [Hb_HBOC] × SaO₂_HBOC) + (0.0031 × PaO₂)
   
   For Hemopure: SaO₂_HBOC = 1 / (1 + (P50_HBOC/PaO₂)^n_HBOC)
   P50_HBOC = 30 mmHg, n = 1.8 (vs native P50=27, n=2.7)
   At PaO₂=100 mmHg: SaO₂_HBOC = 97%, SaO₂_native = 97.5%
   At PaO₂=40 mmHg: SaO₂_HBOC = 68%, SaO₂_native = 75%

2. **Oxygen Delivery (DO₂)**:
   DO₂ = CaO₂ × CO
   where CO = cardiac output (L/min)

3. **Oxygen Consumption (VO₂)**:
   VO₂ = DO₂ × O₂ER (extraction ratio)
   Critical DO₂ (DO₂crit) ≈ 8-10 mL O₂/kg/min
   Below DO₂crit, VO₂ becomes supply-dependent.

4. **Tissue PO₂ (PtO₂)**:
   PtO₂ = PcO₂ - (VO₂ × diffusion distance²) / (2 × D × α)
   where PcO₂ = capillary PO₂, D = diffusion coefficient, α = solubility.

**Modeling Hemopure in Hemorrhagic Shock** (30% blood volume loss, no resuscitation):
- Baseline: Hb 15 g/dL, CO 5 L/min, CaO₂ 20 mL/dL, DO₂ 1000 mL/min
- Post-hemorrhage (no fluid): Hb 10.5 g/dL, CO 3.5 L/min, CaO₂ 14 mL/dL, DO₂ 490 mL/min
- DO₂crit (70 kg): 560-700 mL/min → supply-dependent VO₂, lactic acidosis
- + Hemopure 500 mL (13 g/dL): Hb 13.5 g/dL (total), CO 3.8 L/min (volume expansion), CaO₂ 18.1 mL/dL
- DO₂ = 688 mL/min → above DO₂crit, restores aerobic metabolism
- MAP increase: +15 mmHg → may improve coronary perfusion

**Modeling in Entrapment Hypoxia** (FiO₂ = 0.10, PaO₂ = 50 mmHg):
- Native blood: SaO₂ = 85%, CaO₂ = 17 mL/dL
- + Hemopure 10 g/dL: SaO₂_HBOC = 90% (P50 30 mmHg), total CaO₂ = 25.4 mL/dL
- DO₂ at CO 4 L/min = 1016 mL/min (vs 680 mL/min native)
- 50% increase in oxygen delivery despite hypoxia

**The Bohr Effect Deficit**:
Native Hb: P50 shifts from 27 (pH 7.4) to 45 (pH 7.0) — 1.67× increase.
Hemopure: P50 shifts from 30 (pH 7.4) to 38 (pH 7.0) — 1.27× increase (attenuated Bohr).
At tissue pH 7.0 (ischemia):
- Native Hb unloads 75% of O₂ (SaO₂ 97% → SvO₂ 22%)
- Hemopure unloads 55% (SaO₂ 97% → SvO₂ 42%)
- Native delivers more O₂ per gram Hb in acidotic tissue.

**Quantifying the Bohr Deficit Impact**:
In hemorrhagic shock with lactic acidosis (pH 7.1):
- Native blood O₂ delivery to tissue: 1.34 × 10 × (0.97 - 0.30) = 8.9 mL/dL
- Hemopure O₂ delivery: 1.34 × 10 × (0.97 - 0.48) = 6.6 mL/dL
- 26% less O₂ delivered per g/dL Hb in acidotic tissue.

**Compensatory Mechanisms**:
1. **Higher [Hb]**: Hemopure given at 13 g/dL vs native 10 g/dL post-hemorrhage.
2. **Volume expansion**: Increases CO, partially offsetting lower extraction.
3. **Right-shifted baseline P50**: Hemopure P50 30 vs native 27 — slightly better unloading at normal pH.

**Clinical Correlation - Hemopure in Surgical Anemia** (South African data, N>50,000):
- Indication: Hb <8 g/dL, blood unavailable/unacceptable.
- Dose: 1-3 units (250-750 mL).
- Pre-infusion Hb: 6.2 ± 1.1 g/dL
- Post-infusion Hb: 9.8 ± 1.5 g/dL (rise ~1 g/dL per unit)
- Lactate clearance: 30% reduction at 6h (p<0.001)
- SvO₂ increase: 55% → 68% (p<0.001)
- 30-day survival: 88% (vs historical 75% without blood)
- No difference in survival between 1, 2, or 3 units.

**Clinical Correlation - Hemopure in Trauma** (US Expanded Access, N=200):
- Pre-hospital use, Hb <7 g/dL, transport >30 min.
- Survival to hospital: 92%
- 24h survival: 85%
- Transfusion avoidance: 65% received 0 units blood in first 24h.
- Complications: Hypertension 12% (transient), no AKI attributable.

**Entrapment Modeling - Combined Hypoxia/Hypercapnia**:
Scenario: FiO₂ = 0.05 (5% O₂), PaCO₂ = 80 mmHg, pH = 7.15, Hb = 8 g/dL (anemia), CO = 3 L/min (shock).
Native: CaO₂ = 1.34×8×0.65 (SaO₂ at PaO₂ 30) = 7.0 mL/dL. DO₂ = 210 mL/min → FATAL.
+ Hemopure 10 g/dL: CaO₂_HBOC = 1.34×10×0.75 (SaO₂ at PaO₂ 30, P50 30) = 10.0 mL/dL.
Total CaO₂ = 17.0 mL/dL. DO₂ = 510 mL/min → above DO₂crit for 50 kg, marginal for 70 kg.
+ LOMs (Document 11): Instant O₂ delivery, bypasses lungs.
+ ErythroMer (Document 5): Full Bohr effect, better unloading at pH 7.15.

**Optimal HBOC Properties for Entrapment**:
From modeling, the ideal entrapment HBOC has:
- P50 at pH 7.4: 25-30 mmHg
- Bohr coefficient: -0.4 to -0.5 ΔlogP50/ΔpH
- Hill coefficient: 2.5-2.8
- [Hb] in product: 10-15 g/dL
- Viscosity at 10 g/dL: <4 cP
- NO scavenging: <10% of cell-free Hb
- CO₂ carriage: native-like (carbamino + bicarbonate)

Hemopure meets ~60% of these. ErythroMer meets ~90%. M101 meets ~80%.

**Monitoring Oxygen Delivery in Entrapment**:
Non-invasive:
- NIRS (near-infrared spectroscopy): tissue oxygenation index (TOI), target >60%.
- SvO₂ (if central line): target >65%.
- Lactate: trend ↓ >10%/h.
- Pv-aCO₂ gap: <6 mmHg (indicates adequate flow).

Invasive (if available):
- Microdialysis: lactate/pyruvate ratio <25.
- PtO₂ (Licox): >20 mmHg.

These targets guide HBOC dosing and adjunctive therapy (fluids, vasopressors, CO₂ mitigation).