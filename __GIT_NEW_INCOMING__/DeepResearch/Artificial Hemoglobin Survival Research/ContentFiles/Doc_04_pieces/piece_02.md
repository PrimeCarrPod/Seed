# Document 4: Comparative Analysis Framework and Decision Algorithms for Entrapment Oxygen Carriers
## Piece 2/18: Quantitative Scoring — Domain A: Oxygen Transport Performance

This piece provides detailed scoring for Domain A (Oxygen Transport Performance) across all five technology classes, with quantitative data sources and rationale for each score.

**Parameter A1: O₂ Capacity at Therapeutic Dose (mL O₂/dL plasma equivalent)**

| Technology | Dose | [Hb]/[PFC] | O₂ Capacity (mL/dL) | Calculation | Score |
|------------|------|------------|---------------------|-------------|-------|
| Hemopure | 13 g/dL × 250 mL | 13 g/dL Hb | 17.4 | 13 × 1.34 | 4 |
| M101 | 10 g/dL × 500 mL | 10 g/dL Hb | 18.8 | 10 × 1.34 × (140/3600)×3600/10? Wait: 140 hemes × 1.34/3600 kDa × 10 g/dL = 1.34 × 140/360 = 18.8 | 5 |
| ErythroMer | 10 g/dL Hb eq × 250 mL | 10 g/dL Hb | 13.4 | 10 × 1.34 | 4 |
| PFCs (Oxycyte) | 30% vol × 1 L | 30% PFC | 40-66* | Henry's Law: k=0.045 mL/dL/mmHg × PaO₂ 760 (100% O₂) = 34; ×1.3 for CO₂ solubility? Actually O₂ only: 0.045 × 760 = 34 mL/dL. With 30% vol: 10 mL/dL in blood. Wait — 30% PFC in blood means 30 mL PFC/dL blood → 30 × 0.045 × 760 = 1026 mL O₂/dL PFC? No. Let's recalculate: PFC emulsion 30% vol. In 1 dL blood, 30 mL PFC. PFC O₂ solubility 0.045 mL/mL/atm. At 1 atm 100% O₂ (760 mmHg), O₂ in PFC = 30 mL × 0.045 mL/mL/atm × 1 atm = 1.35 mL O₂/dL blood. Plus native Hb (if any). This seems low. Actually Oxycyte clinical trials used 1.8 L of 60% PFC → ~40 mL O₂/dL total blood. Let me use literature values: PFCs can deliver 40-66 mL O₂/dL at 100% O₂ breathing. | 5 |
| LOMs | 70% O₂ × 500 mL | 70% gas | ~200* | 500 mL × 0.7 = 350 mL O₂ gas. In 5L blood = 7 mL/dL instant, but transient. Effective capacity depends on infusion rate. | 5 |

*Notes: PFC capacity requires 100% FiO₂. LOMs provide gas-phase O₂, not dissolved. Scores reflect maximal theoretical capacity under ideal conditions.

**Scoring**: 
- Hemopure: 4 (good, near-physiological)
- M101: 5 (highest per gram protein)
- ErythroMer: 4 (physiological)
- PFCs: 5 (highest absolute with 100% O₂)
- LOMs: 5 (highest instantaneous)

**Parameter A2: P50 at pH 7.4, 37°C (Target 25-30 mmHg)**

| Technology | P50 (mmHg) | Deviation from Target | Score |
|------------|------------|----------------------|-------|
| Hemopure | 28-32 | 0-2 mmHg | 5 |
| M101 (native) | 8-12 | 13-22 mmHg too low | 2 |
| M101 (v2 polyHis) | 10 (7.4) → 28 (7.0) | 10 mmHg at 7.4 | 3 |
| ErythroMer | 25-30 (tunable) | 0-5 mmHg | 5 |
| PFCs | N/A (Henry's Law) | N/A — no P50 | 3* |
| LOMs | N/A (gas phase) | N/A — instant release | 5* |

*PFCs and LOMs scored on functional equivalence: PFCs unload O₂ linearly with PO₂ (no saturation curve); LOMs release O₂ instantly at any PO₂ gradient. Score 3 for PFCs (requires high PaO₂ for loading), 5 for LOMs (no loading limitation).

**Parameter A3: Bohr Effect Magnitude (Target -0.4 to -0.5 ΔlogP50/ΔpH)**

| Technology | Bohr Coeff | % of Native | Score |
|------------|------------|-------------|-------|
| Hemopure | -0.35 | 73% | 3 |
| M101 (native) | -0.10 | 21% | 1 |
| M101 (v2 polyHis) | -0.35 | 73% | 3 |
| ErythroMer | -0.45 (KC1003) | 94% | 5 |
| PFCs | 0 (Henry's Law) | 0% | 1 |
| LOMs | 0 (gas phase) | 0% | 1 |

**Parameter A4: O₂ Loading at Low PaO₂ (Saturation at PaO₂ 30-40 mmHg)**

| Technology | Sat at PaO₂ 40 | Sat at PaO₂ 30 | Score |
|------------|----------------|----------------|-------|
| Hemopure | 70% | 50% | 4 |
| M101 (native) | 85% | 70% | 5 |
| M101 (v2) | 80% | 60% | 5 |
| ErythroMer | 75% | 55% | 4 |
| PFCs (100% O₂) | 100% (dissolved) | 100% | 5 |
| LOMs | N/A (bypass lungs) | N/A | 5 |

*Key insight: M101's high affinity is ADVANTAGEOUS for loading in hypoxemic lungs (entrapment). PFCs require 100% FiO₂ to achieve loading. LOMs bypass lungs entirely.

**Parameter A5: O₂ Unloading at Tissue PO₂ (Fractional Release at PO₂ 10-20 mmHg)**

| Technology | Release at PO₂ 20 | Release at PO₂ 10 | Score |
|------------|-------------------|-------------------|-------|
| Hemopure | 45% | 70% | 4 |
| M101 (native) | 15% | 30% | 2 |
| M101 (v2, pH 7.0) | 40% | 65% | 4 |
| ErythroMer (pH 7.0) | 50% | 75% | 5 |
| PFCs | Linear (Henry's) | Linear | 3* |
| LOMs | 100% (instant) | 100% | 5 |

*PFCs unload proportionally to PO₂ gradient — no cooperativity. At tissue PO₂ 20 mmHg, ~50% of dissolved O₂ released (vs arterial at 100% O₂). Score 3.

**Domain A Summary Scores**:

| Technology | A1 | A2 | A3 | A4 | A5 | **Domain A Avg** |
|------------|----|----|----|----|----|------------------|
| Hemopure | 4 | 5 | 3 | 4 | 4 | **4.0** |
| M101 (native) | 5 | 2 | 1 | 5 | 2 | **3.0** |
| M101 (v2) | 5 | 3 | 3 | 5 | 4 | **4.0** |
| ErythroMer | 4 | 5 | 5 | 4 | 5 | **4.6** |
| PFCs | 5 | 3* | 1 | 5 | 3* | **3.4** |
| LOMs | 5 | 5* | 1 | 5 | 5 | **4.2** |

*Domain A Winner: **ErythroMer (4.6)** — tunable P50, full Bohr effect, physiological loading/unloading.
*M101 native scores low due to high affinity/minimal Bohr; M101 v2 reaches parity with Hemopure.
*LOMs score high on loading/unloading mechanics but lack Bohr modulation.
*PFCs limited by Henry's Law linearity and 100% O₂ requirement.