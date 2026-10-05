# DOC-12: Meyer-Overton Narcosis & Lipid Bilayer Mechanics
## Document 12 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 10101-10200 | Piece 3 of 9 | ~100 Lines

---

#### 12.3 Ion Channel Distortion & Neurophysiological Effects

**12.3.1 Target Channels for Narcosis**

**Primary Targets (Lipid-Sensitive Channels):**
| Channel Type | Function | Lipid Sensitivity | Narcotic Effect |
|--------------|----------|-------------------|-----------------|
| **GABA_A Receptor** | Inhibitory (Cl⁻ influx) | **High** (allosteric lipid site) | Potentiation → sedation |
| **Glycine Receptor** | Inhibitory (Cl⁻ influx) | High | Potentiation → motor impairment |
| **NMDA Receptor** | Excitatory (Ca²⁺/Na⁺) | Moderate | Inhibition → cognitive deficit |
| **Voltage-Gated K⁺ (Kv)** | Repolarization | High (mechanosensitive) | Altered gating → excitability change |
| **Voltage-Gated Na⁺ (Nav)** | Action potential | Moderate | Slowed inactivation → prolonged AP |
| **HCN (pacemaker)** | Rhythmic firing | High | Altered rhythm → consciousness change |
| **Two-Pore K⁺ (K2P)** | Background leak | **Very High** (mechanosensitive) | Major target for anesthetics |

**12.3.2 Mechanosensitivity of K2P Channels (TREK-1, TRAAK)**

**K2P Channels = "Lipid Bilayer Stress Sensors"**
- **Gating:** Directly coupled to lateral tension $\Pi_{core}$
- **Open Probability:** $P_{open} = \frac{1}{1 + \exp[-(T - T_{50})/k]}$
- **Tension Sensitivity:** $T_{50} \approx 5\text{–}10 \text{ mN/m}$

**N₂-Induced Tension at 60 msw:** $\Delta T = 14.2 \text{ mN/m}$
**Result:** **Massive K2P activation** → hyperpolarization → neuronal silencing

**12.3.3 GABA_A Receptor Potentiation**

**Allosteric Lipid Site:**
- **Location:** Transmembrane domain (M1-M4 helices)
- **Mechanism:** Bilayer expansion → increased hydrophobic mismatch → conformational change
- **Effect:** ↑ GABA affinity, ↑ channel open time

**Quantitative Potentiation:**
$$\frac{I_{GABA}(P_{N_2})}{I_{GABA}(0)} = 1 + \beta \cdot \frac{\Delta A}{A_0}$$
Where $\beta \approx 10\text{–}20$ (steep cooperativity)

**At 60 msw ($\Delta A/A_0 = 5.7\%$):**
$$\text{Potentiation} = 1 + 15 \times 0.057 = \mathbf{1.86\times} \quad (86\% \text{ increase})$$

**12.3.4 NMDA Receptor Inhibition**

**Mechanism:** Bilayer expansion → altered subunit conformation → reduced open probability
**Functional Effect:** Reduced Ca²⁺ influx → impaired synaptic plasticity → memory deficits

**Quantitative Inhibition:**
$$\frac{I_{NMDA}(P_{N_2})}{I_{NMDA}(0)} = \frac{1}{1 + \gamma \cdot P_{N_2}}$$
Where $\gamma \approx 0.15 \text{ bar}^{-1}$

**At 60 msw ($P_{N_2} = 5.46$ bar):**
$$\text{Inhibition} = \frac{1}{1 + 0.15 \times 5.46} = \frac{1}{1.82} = \mathbf{0.55\times} \quad (45\% \text{ reduction})$$

**12.3.5 Network-Level Effects — The "Narcotic State"**

**Combined Channel Effects:**
| Effect | Channel | Direction | Network Consequence |
|--------|---------|-----------|---------------------|
| **Potentiation** | GABA_A, Glycine | ↑ Inhibition | Global slowing, sedation |
| **Potentiation** | K2P (TREK/TRAAK) | ↑ Leak K⁺ | Hyperpolarization, ↓ firing |
| **Inhibition** | NMDA | ↓ Excitation | Memory impairment, confusion |
| **Modulation** | Kv, Nav | Altered gating | Slowed APs, prolonged refractory |
| **Modulation** | HCN | Altered pacemaker | Consciousness alteration |

**Net Result: "Cortical Depression" — Similar to Anesthetic State**
- **EEG:** ↑ Slow waves (δ, θ), ↓ α, β
- **Metabolism:** ↓ CMRO₂ by 15–25% at 60 msw
- **Consciousness:** Graded impairment (not all-or-none)

**12.3.6 Reversibility & Adaptation**

**Acute Tolerance (During Dive):**
- **Mechanism:** Channel phosphorylation, lipid composition remodeling
- **Time Course:** 20–60 min at constant depth
- **Magnitude:** 20–30% reduction in narcotic effect

**Chronic Tolerance (Repeated Dives):**
- **Lipid Composition:** ↑ Cholesterol, ↑ saturated lipids → ↓ gas solubility
- **Channel Expression:** ↑ K2P, ↓ GABA_A subunits
- **Time Course:** Days to weeks
- **Operational Impact:** Experienced divers show less impairment

**12.3.7 Individual Variability**

**Genetic Factors:**
- **GABA_A subunit polymorphisms** (α1, β2, γ2) → 2–3× sensitivity range
- **K2P (KCNK2) variants** → altered mechanosensitivity
- **CYP2E1** (metabolizes volatile anesthetics) → indirect effect

**Physiological Factors:**
- **Body Fat %:** ↑ Fat → ↑ N₂ storage → ↑ brain delivery
- **Age:** ↓ Lipid fluidity → ↓ gas partitioning
- **Fitness:** ↑ Cerebral blood flow → faster equilibration

---

*End of Piece 3 — DOC-12 Lines 10101-10200*
*Next: Piece 4 — Section 12.4 Pressure Reversal of Anesthesia & Narcosis*