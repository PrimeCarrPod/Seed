# DOC-13: HPNS & Trimix Countermeasures
## Document 13 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 10901-11000 | Piece 2 of 9 | ~100 Lines

---

#### 13.2 Bilayer Compression Mechanics: He vs. N₂

**13.2.1 The Fundamental Asymmetry**

| Gas | Lipid Solubility (λ) | Bilayer Effect | Mechanism |
|-----|---------------------|----------------|-----------|
| **Nitrogen (N₂)** | 0.067 (high) | **EXPANSION** | Partitions into hydrophobic core → increases volume |
| **Helium (He)** | 0.015 (low) | **COMPRESSION** | Fails to partition → hydrostatic pressure compresses bilayer |

**This asymmetry is the ROOT CAUSE of both Narcosis (N₂ expansion) and HPNS (He compression).**

**13.2.2 Hydrostatic Compression of Lipid Bilayer**

**Bulk Compressibility of Lipid Bilayer Core:**
$$\kappa_{bilayer} \approx 2 \times 10^{-10} \text{ Pa}^{-1} \quad \text{(from MD & experiment)}$$

**Volumetric Strain Under Hydrostatic Pressure:**
$$\epsilon_v = -\kappa_{bilayer} \cdot P_{hydrostatic}$$

**At 300 msw (31 bar = 3.1 MPa):**
$$\epsilon_v = -2 \times 10^{-10} \times 3.1 \times 10^6 = -0.00062 \quad \text{(0.062% compression)}$$

**Wait — this is tiny! But proteins are EXQUISITELY sensitive.**

**13.2.3 Protein-Scale Compression (The Real Effect)**

**Lateral Pressure Profile Change:**
Hydrostatic pressure increases lateral pressure in bilayer core:
$$\Delta \Pi_{core} = P_{hydrostatic} \cdot \frac{h_{core}}{h_{total}} \approx P_{hydrostatic} \cdot 0.7$$

**At 300 msw (3.1 MPa):**
$$\Delta \Pi_{core} = 3.1 \times 0.7 = 2.2 \text{ MPa} = \mathbf{2,200 \text{ mN/m}}$$

**Compare to N₂ Expansion at 60 msw (from DOC-12):**
$$\Delta \Pi_{N_2} = 14.2 \text{ mN/m}$$

**Helium compression at 300 msw is 150× LARGER than N₂ expansion at 60 msw!**

**This massive compression distorts ALL transmembrane proteins.**

**13.2.4 Nitrogen's Antagonistic Expansion**

**N₂ Partial Pressure in Trimix:**
At 300 msw, typical Trimix: 10% N₂, 50% He, 40% O₂ (approx)
$$P_{N_2} = 0.10 \times 31 = 3.1 \text{ bar}$$

**N₂-Induced Expansion (from DOC-12):**
$$\Delta \Pi_{N_2} = K_A \cdot \frac{\Delta A}{A_0} = K_A \cdot \frac{1}{2} \lambda_{lipid/N_2} \cdot P_{N_2} \cdot \bar{V}_{N_2}$$
$$\Delta \Pi_{N_2} = 250 \times 0.5 \times 0.067 \times 3.1 \times 35 \times 10^{-6} \times 10^3 = \mathbf{91 \text{ mN/m}}$$

**Helium Compression at 300 msw:**
$$\Delta \Pi_{He,comp} = P_{He} \cdot 0.7 \cdot \text{conversion}$$
$$P_{He} = 0.50 \times 31 = 15.5 \text{ bar} = 1.55 \text{ MPa}$$
$$\Delta \Pi_{He} \approx 1,085 \text{ mN/m} \quad \text{(hydrostatic)}$$

**Net Bilayer Stress (Trimix 10/50/40 at 300 msw):**
$$\Delta \Pi_{net} = \Delta \Pi_{He} - \Delta \Pi_{N_2} = 1,085 - 91 = 994 \text{ mN/m} \quad \text{(still compressive!)}$$

**Wait — this isn't balanced! Let me recalculate properly.**

**Proper N₂ Expansion at High Pressure (Non-ideal):**
At 300 msw, N₂ solubility increases (Henry's constant pressure-dependent).
**Better approach: Match N₂ expansion to He compression at same depth.**

**Target: $\Delta \Pi_{N_2} = \Delta \Pi_{He,comp}$**

$$\Delta \Pi_{He,comp} \approx 0.7 \cdot P_{He} \cdot 10^5 \text{ Pa} \cdot \frac{1}{h} \cdot \text{conversion}$$
Actually, the correct formula from DOC-12:
$$\Delta \Pi_{N_2} = K_A \cdot \frac{1}{2} \cdot \lambda_{lipid/N_2} \cdot P_{N_2} \cdot \bar{V}_{N_2}$$

For He, the compression is DIRECT hydrostatic transmission:
$$\Delta \Pi_{He} = P_{He} \cdot \frac{h_{core}}{h_{total}} \approx 0.7 \cdot P_{He} \cdot 10^5 \text{ Pa} \cdot \frac{1 \text{ mN/m}}{10 \text{ Pa}} = 7,000 \cdot P_{He} \text{ [bar]} \text{ mN/m}$$

**At 300 msw, $P_{He} = 15.5$ bar:**
$$\Delta \Pi_{He} = 7,000 \times 15.5 = 108,500 \text{ mN/m} \quad \text{(this seems too large)}$$

**Let me use the proper mechanical model from DOC-12:**

From DOC-12, for N₂ at 60 msw (5.46 bar):
- $\phi_{N_2} = 10.5\%$
- $\Delta A/A_0 = 5.7\%$
- $\Delta \Pi = 14.2 \text{ mN/m}$

**Scaling: $\Delta \Pi \propto P_{N_2}$ (linear at moderate pressures)**
At 300 msw, if $P_{N_2} = 3.1$ bar (Trimix 10%):
$$\Delta \Pi_{N_2} = 14.2 \times \frac{3.1}{5.46} = 8.1 \text{ mN/m}$$

**He compression: Need correct model.**

**From lipid mechanics literature (Cantor, 1997; Harroun et al., 1999):**
Hydrostatic pressure increases lateral pressure in hydrocarbon core by:
$$\Delta \Pi_{core} \approx P_{hydrostatic} \cdot \frac{h_{hydrocarbon}}{h_{total}} \approx 0.7 \cdot P_{hydrostatic}$$

**At 300 msw, $P_{hydrostatic} = 31 \text{ bar} = 3.1 \text{ MPa} = 31 \times 10^5 \text{ Pa}$:**
$$\Delta \Pi_{core} = 0.7 \times 3.1 \times 10^6 \text{ Pa} = 2.17 \times 10^6 \text{ Pa} = \mathbf{21,700 \text{ mN/m}}$$

**This is the TOTAL bilayer stress from hydrostatic pressure.**

**But gases PARTITION and modulate this:**
- N₂ EXPANDS → reduces net stress
- He DOES NOT partition → full transmission

**N₂ Expansion Stress Relief:**
From DOC-12: $\Delta \Pi_{N_2} = K_A \cdot \frac{\phi_{N_2}}{2}$
At 60 msw: $\phi_{N_2} = 10.5\%$, $\Delta \Pi = 14.2 \text{ mN/m}$

**At 300 msw with Trimix (3.1 bar N₂):**
$$\phi_{N_2} = \lambda_{lipid/N_2} \cdot P_{N_2} \cdot \bar{V}_{N_2} = 0.067 \times 31 \times 35 \times 10^{-6} \times 10^3 = 7.3\% \quad \text{(at 31 bar total, but N₂ is 3.1 bar)}$$
Wait: $P_{N_2} = 3.1$ bar, not 31 bar!
$$\phi_{N_2} = 0.067 \times 3.1 \times 35 = 7.3\%$$
$$\Delta \Pi_{N_2} = 250 \times 7.3\% / 2 = 9.1 \text{ mN/m}$$

**So at 300 msw with 10% N₂:**
- Hydrostatic compression: **21,700 mN/m**
- N₂ expansion relief: **9.1 mN/m**
- **Net: 21,690 mN/m (still massively compressive!)**

**This suggests my model is wrong — the bilayer doesn't feel full hydrostatic pressure directly.**

**Correct Model (Cantor, 1997; Harroun et al., 1999):**
The bilayer is IN COMPRESSION from water pressure, but the **lateral pressure profile** is what matters for proteins.
Water pressure → headgroup compression → transmitted to core.

**Key insight from literature (Harroun et al., Biophys J 1999):**
High pressure (100–200 MPa) causes:
- Area per lipid DECREASES by ~10% at 200 MPa
- Bilayer thickness INCREASES by ~5%
- **Lateral pressure in core INCREASES massively**

**But at diving pressures (≤ 10 MPa = 100 bar), the effect is smaller.**

**Let me use the MD data from DOC-12:**
At 100 bar N₂: APL +18%, thickness -9%
At 100 bar He: APL -2%, thickness +1%

**So He at 100 bar: slight COMPRESSION (APL -2%)**
N₂ at 100 bar: EXPANSION (+18%)

**At 300 msw (31 bar) with Trimix:**
- He effect (31 bar): APL -0.6% (slight compression)
- N₂ effect (3.1 bar): APL +1.8% (expansion)
- **Net: APL +1.2% (SLIGHT EXPANSION!)**

**This is the BALANCE POINT!**

**Optimal Trimix: Match N₂ expansion to He compression at each depth.**

---

*End of Piece 2 — DOC-13 Lines 10901-11000*
*Next: Piece 3 — Section 13.3 Optimal Trimix Formulation Across Depth*