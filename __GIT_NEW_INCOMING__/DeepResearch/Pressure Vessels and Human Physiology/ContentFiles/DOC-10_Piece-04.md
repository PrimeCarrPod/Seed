# DOC-10: Closed-Loop Scrubbing Thermodynamics
## Document 10 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 8401-8500 | Piece 4 of 9 | ~100 Lines

---

#### 10.4 Advanced Scrubbing: MOFs, Electrochemical, Swing-Bed

**10.4.1 Metal-Organic Frameworks (MOFs) for CO₂ Capture**

**MOF Structure:** Crystalline porous materials (metal nodes + organic linkers)
**Key Property:** **Tunable pore size/chemistry** for selective CO₂ adsorption

**Promising MOFs for PVHO:**
| MOF | Metal | Linker | CO₂ Capacity [mmol/g] | Selectivity CO₂/N₂ | Regeneration T [°C] |
|-----|-------|--------|----------------------|-------------------|-------------------|
| **Mg-MOF-74** | Mg | DOBDC | 9.5 | 150 | 150 |
| **Zn-MOF-74** | Zn | DOBDC | 8.2 | 120 | 130 |
| **UiO-66** | Zr | BDC | 4.5 | 40 | 120 |
| **HKUST-1** | Cu | BTC | 6.8 | 80 | 150 |
| **CAU-10** | Al | HPDC | 5.2 | 60 | 100 |

**Adsorption Isotherm (Langmuir):**
$$q = \frac{q_{max} b P}{1 + b P}$$
Where $q$ = loading [mmol/g], $P$ = partial pressure [bar], $b$ = affinity.

**At 0.4 kPa CO₂ (cabin):**
- Mg-MOF-74: $q \approx 2.5$ mmol/g (26% of max)
- **Working capacity (0.04 → 0.4 kPa):** ~2 mmol/g = **0.088 g CO₂/g MOF**

**Comparison with LiOH:**
- LiOH: 0.7 g CO₂/g (chemical)
- MOF: 0.088 g CO₂/g (physical) → **8× more mass needed**

**BUT MOF Advantages:**
- **Regenerable** (thermal swing, 100–150°C)
- **No consumables** (indefinite cycles)
- **Lower heat per cycle** (physisorption ~25 kJ/mol vs chemisorption 95 kJ/mol)

**10.4.2 Thermal Swing Adsorption (TSA) Cycle for MOF**

**Cycle Steps:**
1. **Adsorption (45 min):** Cabin air through MOF bed → CO₂ captured
2. **Depressurization (5 min):** Bed evacuated to vacuum
3. **Heating (20 min):** Bed heated to 120°C → CO₂ desorbed
4. **Cooling (10 min):** Bed cooled to cabin T
5. **Repressurization (5 min):** Cabin air back

**Cycle Time:** 85 min → **Continuous operation with 2 beds (staggered)**

**Energy per Cycle (per kg MOF):**
- Heating: $m c_p \Delta T = 1 \times 1.0 \times 100 = 100$ kJ
- Vacuum pump: ~20 kJ
- **Total: ~120 kJ/kg MOF per cycle**
- CO₂ captured: 0.088 kg
- **Energy: 1.36 MJ/kg CO₂** (vs. LiOH 2.15 MJ/kg — **37% less!**)

**10.4.3 Electrochemical CO₂ Removal (ECCR)**

**Principle:** CO₂ → carbonate at cathode, O₂ released at anode
**Reactions:**
- **Cathode:** $\text{CO}_2 + 2e^- + 2\text{H}^+ \rightarrow \text{HCOO}^-$ (formate) or $\text{CO}_2 + 2e^- \rightarrow \text{CO} + \text{O}^{2-}$
- **Anode:** $\text{H}_2\text{O} \rightarrow 2\text{H}^+ + 2e^- + \frac{1}{2}\text{O}_2$

**Solid Electrolyte (PEM / Anion Exchange Membrane):**
- Conducts H⁺ or OH⁻
- Separates anode/cathode compartments

**NASA ECCR Development (ARTEMIS / xPLSS):**
- **Cell voltage:** 1.8–2.2 V
- **Current density:** 200–500 mA/cm²
- **CO₂ flux:** 0.5–1.0 mmol/cm²·hr
- **Power:** 15–30 W per person

**System Mass (per person):**
- Stack: 2.5 kg
- Power: 30 W (battery/solar)
- Cooling: 1.5 kg
- **Total: ~4 kg** (vs. LiOH 2.15 kg consumable per EVA)

**Advantage:** **Indefinite operation** (no consumables), **generates O₂**, **controllable rate**

**10.4.4 Solid Amine Swing-Bed (SASB) — ISS CDRA Heritage**

**ISS Carbon Dioxide Removal Assembly (CDRA):**
- **Sorbent:** Zeolite 5A (molecular sieve) — **NOT amine**
- **Cycle:** 4-bed thermal swing (2 adsorb, 2 desorb)
- **Cycle time:** 240 min (4 hr)
- **Capacity:** 2.5 persons continuous

**Advanced SASB (Amine-Functionalized Sorbent):**
- **Sorbent:** Polyethyleneimine (PEI) on silica/polymer support
- **Capacity:** 3–4 mmol/g (at 0.4 kPa CO₂)
- **Regeneration:** 100–120°C, vacuum swing
- **Cycle time:** 60–90 min (2-bed)

**xPLSS SASB Target (xEMU):**
- **Mass:** 3.5 kg (sorbent + hardware)
- **Power:** 50 W (heater + vacuum pump)
- **Cycle:** 60 min (continuous with 2 beds)
- **Life:** 5,000 cycles (10 years)

**10.4.5 Comparative Trade: Scrubber Technologies for PVHO Classes**

| Technology | Mass (per person) | Power | Consumables | TRL | Best For |
|------------|-------------------|-------|-------------|-----|----------|
| **LiOH Canister** | 2.2 kg/EVA | 0 W | 2.2 kg/EVA | 9 | **EMU, short EVA** |
| **Soda Lime** | 6.5 kg/EVA | 0 W (fan) | 6.5 kg/EVA | 9 | **Chambers, humid** |
| **Zeolite Swing-Bed (CDRA)** | 50 kg | 200 W | None | 9 | **ISS, long-duration** |
| **Amine Swing-Bed (SASB)** | 10 kg | 50 W | None | 7 | **xEMU, Gateway** |
| **MOF TSA** | 8 kg | 30 W | None | 5 | **Future lunar base** |
| **Electrochemical (ECCR)** | 4 kg | 30 W | None | 5 | **Mars transit, xPLSS** |

**Key Insight:** **Short missions (EVA) → Consumable (LiOH) wins on mass.**
**Long missions (habitat) → Regenerable (Swing-Bed, ECCR) wins on logistics.**

---

*End of Piece 4 — DOC-10 Lines 8401-8500*
*Next: Piece 5 — Section 10.5 Trace Contaminant Control*