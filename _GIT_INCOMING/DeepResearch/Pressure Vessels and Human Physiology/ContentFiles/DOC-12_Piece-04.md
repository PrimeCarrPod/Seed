# DOC-12: Meyer-Overton Narcosis & Lipid Bilayer Mechanics
## Document 12 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 10201-10300 | Piece 4 of 9 | ~100 Lines

---

#### 12.4 Pressure Reversal of Anesthesia & Narcosis

**12.4.1 The Pressure Reversal Phenomenon**

**Discovery (Johnson & Flagler, 1950):**
> "High hydrostatic pressure reverses anesthesia and narcosis."

**Experimental Observation:**
- Tadpoles anesthetized with 3% ethanol at 1 atm
- **Pressure to 100 atm (10 MPa):** **Full recovery** of righting reflex
- **Mechanism:** Pressure compresses lipid bilayer → opposes gas expansion

**12.4.2 Thermodynamic Basis — Le Chatelier's Principle**

**Volume Change of Anesthesia:**
$$\Delta V_{anesthesia} = V_{anesthetized} - V_{awake} > 0$$

**Pressure Effect on Equilibrium:**
$$\left(\frac{\partial \ln K}{\partial P}\right)_T = -\frac{\Delta V}{RT}$$

Where $K$ = equilibrium constant for channel gating (anesthetized/awake).

**Since $\Delta V > 0$ (expansion during anesthesia):**
$$\frac{\partial \ln K}{\partial P} < 0 \quad \Rightarrow \quad \text{Pressure shifts equilibrium toward AWAKE state}$$

**12.4.3 Quantitative Pressure Reversal**

**Volume Change per Channel:**
$$\Delta V_{channel} \approx 50\text{–}100 \text{ nm}^3 \quad \text{(from MD simulations)}$$

**Pressure Required for 50% Reversal ($P_{50,rev}$):**
$$P_{50,rev} = \frac{RT \ln 2}{\Delta V} = \frac{2.5 \text{ kJ/mol} \times 0.693}{75 \times 10^{-27} \text{ m}^3 \times 6.022 \times 10^{23}} \approx \mathbf{38 \text{ MPa}} \quad (380 \text{ bar})$$

**At 380 bar (3,800 msw): Narcosis/Anesthesia FULLY REVERSED.**

**12.4.4 Nitrogen Narcosis vs. Pressure Reversal**

**At Diving Depths (≤ 100 msw = 10 bar):**
- Pressure reversal effect: **Negligible** (10 bar vs. 380 bar needed)
- **Dominant effect:** N₂ expansion → narcosis

**At Extreme Depths (Helium Trimix, 300+ msw):**
- **Helium compresses bilayer** (opposite of N₂ expansion)
- **High pressure alone** → counteracts He bilayer compression
- **Net effect:** Complex balance (see HPNS in DOC-13)

**12.4.5 Pressure Reversal of Anesthetics — Clinical Relevance**

**Volatile Anesthetics (Halothane, Isoflurane):**
- $\Delta V \approx 100 \text{ nm}^3$ (large hydrophobic molecules)
- $P_{50,rev} \approx 30\text{–}50 \text{ MPa}$
- **Explains:** Why deep-sea divers need less anesthetic

**Intravenous Anesthetics (Propofol, Etomidate):**
- Smaller $\Delta V$ (more polar)
- $P_{50,rev} \approx 80\text{–}100 \text{ MPa}$
- **Less pressure-sensitive**

**12.4.6 Pressure Reversal in TLV Context**

**Total Liquid Ventilation (PFC):**
- **No gas in lungs** → no inert gas partitioning into bilayer
- **High pressure** → direct bilayer compression
- **Effect:** Pressure reversal of narcosis is **moot** (no narcosis to reverse)
- **BUT:** High pressure alone causes **HPNS** (see DOC-13) — different mechanism

**12.4.7 Thermodynamic Limit — The "Pressure Ceiling"**

**Maximum Theoretical Pressure for Biology:**
- **Protein denaturation:** > 1 GPa (10 kbar)
- **Lipid phase transition:** ~200 MPa (gel phase)
- **Water structure changes:** > 100 MPa

**Operational Ceiling for Air/Heliox Diving:**
- **Narcosis limit (air):** ~70 msw (N₂)
- **HPNS limit (heliox):** ~500 msw (He)
- **HPNS limit (trimix):** ~700 msw (He/N₂/O₂)
- **Theoretical limit (pressure reversal):** ~3,800 msw

**No human has reached pressure reversal depths — narcosis/HPNS are the practical limits.**

---

*End of Piece 4 — DOC-12 Lines 10201-10300*
*Next: Piece 5 — Section 12.5 Modern Molecular Dynamics Validation*