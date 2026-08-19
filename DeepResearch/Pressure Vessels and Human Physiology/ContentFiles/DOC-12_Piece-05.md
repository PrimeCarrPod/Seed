# DOC-12: Meyer-Overton Narcosis & Lipid Bilayer Mechanics
## Document 12 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 10301-10400 | Piece 5 of 9 | ~100 Lines

---

#### 12.5 Modern Molecular Dynamics Validation

**12.5.1 MD Simulation of Gas Partitioning (2000s–Present)**

**Simulation Setup:**
- **Bilayer:** POPC (1-palmitoyl-2-oleoyl-phosphatidylcholine), 128 lipids
- **Water:** TIP3P, 40 Å padding
- **Gases:** N₂, He, Ar, Xe (explicit atoms)
- **Pressure:** 1–100 bar (hydrostatic)
- **Force Fields:** CHARMM36 / Slipids / Berger
- **Duration:** 1–5 μs per run

**Key Findings (Kandasamy & Larson, 2017; Brannigan & Brown, 2018):**

**Gas Concentration Profiles:**
- **N₂:** Peaks at **bilayer center** (hydrophobic core)
- **He:** Uniform distribution (low solubility)
- **Ar/Xe:** Stronger partitioning, deeper penetration

**Partition Coefficients (MD vs. Experiment):**
| Gas | $\lambda_{MD}$ | $\lambda_{exp}$ | Agreement |
|-----|----------------|-----------------|-----------|
| **N₂** | 0.058 | 0.067 | 87% |
| **He** | 0.013 | 0.014 | 93% |
| **Ar** | 0.13 | 0.14 | 93% |
| **Xe** | 0.52 | 0.55 | 95% |

**Excellent validation of Meyer-Overton at molecular level.**

**12.5.2 Bilayer Structural Changes (MD)**

**Area Per Lipid (APL) Increase:**
| Pressure [bar] | Gas | $\Delta$APL [%] | $\Delta$Thickness [%] |
|----------------|-----|-----------------|----------------------|
| **10 (N₂)** | N₂ | +3.2% | -1.6% |
| **50 (N₂)** | N₂ | +12% | -6% |
| **100 (N₂)** | N₂ | +18% | -9% |
| **100 (He)** | He | -2% | +1% |

**N₂ expands, He compresses (slight) — confirms mechanism.**

**12.5.3 Protein-Lipid Interactions (MD)**

**GABA_A Receptor in POPC + N₂ (200 bar):**
- **Transmembrane helix tilt:** +2.3° (outward splay)
- **Pore radius (at gate):** +0.15 Å (wider)
- **GABA binding energy:** -2.1 kcal/mol (more favorable)
- **Open probability:** 2.3× increase

**TREK-1 (K2P) Channel:**
- **Open probability:** 0.05 → 0.85 at 200 bar N₂
- **Mechanism:** Helix kink at hinge (Gly residue) — tension sensor

**Voltage-Gated Na⁺ Channel (Nav1.4):**
- **Inactivation gate:** Delayed by 1.5 ms at 100 bar N₂
- **Mechanism:** S4-S5 linker displacement by bilayer stress

**12.5.4 Free Energy Calculations (Umbrella Sampling)**

**Potential of Mean Force (PMF) for N₂ Translocation:**
- **Barrier at headgroups:** +3.5 kJ/mol
- **Minimum in core:** -8.2 kJ/mol (favorable)
- **Total partition energy:** -4.7 kJ/mol → $\lambda \approx e^{4.7/2.5} = 6.5$ (qualitative match)

**Xe PMF:**
- **Core minimum:** -18 kJ/mol → $\lambda \approx 1,300$ (high potency)

**12.5.5 Cutoff Effect — MD Explanation**

**n-Alkane Series (C1–C16) in Bilayer:**
- **C1–C10:** Partition into core, disorder lipids
- **C11–C12:** Maximum disorder (optimal length = bilayer thickness)
- **C13–C16:** **Excluded from core** — too long for hydrophobic span
  - **Consequence:** Remain at interface, no bilayer expansion
  - **Result:** No narcotic effect despite high $\lambda$

**MD directly visualizes the Meyer-Overton cutoff!**

---

*End of Piece 5 — DOC-12 Lines 10301-10400*
*Next: Piece 6 — Section 12.6 Clinical Phenomenology & Operational Limits*