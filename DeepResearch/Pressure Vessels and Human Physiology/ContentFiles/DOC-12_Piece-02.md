# DOC-12: Meyer-Overton Narcosis & Lipid Bilayer Mechanics
## Document 12 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 10001-10100 | Piece 2 of 9 | ~100 Lines

---

#### 12.2 Lipid Bilayer Mechanics: Expansion Under Gas Pressure

**12.2.1 Lipid Bilayer Structure & Mechanical Properties**

**Phospholipid Bilayer (Neuronal Membrane):**
- **Thickness:** $h_0 \approx 4.5$ nm (hydrophobic core)
- **Area per lipid:** $A_0 \approx 0.6$ nm²
- **Bending Modulus:** $K_c \approx 10^{-19}$ J (≈ 25 $k_B T$)
- **Area Compressibility Modulus:** $K_A \approx 250$ mN/m
- **Lateral Pressure Profile:** $\Pi(z)$ — peaks at headgroups, tension in core

**12.2.2 Gas Partitioning into Lipid Bilayer**

**Henry's Law for Lipid Phase:**
$$C_{lipid} = \lambda_{lipid/gas} \cdot P_{gas}$$

**Lipid/Gas Partition Coefficient ($\lambda_{lipid/gas}$):**
- **Similar to olive oil** for nonpolar gases
- $\lambda_{lipid/N_2} \approx 0.06$ mol/L·bar (at 37°C)
- $\lambda_{lipid/He} \approx 0.014$ mol/L·bar

**Molar Concentration in Bilayer Core:**
$$C_{N_2} = 0.06 \times P_{N_2} \quad \text{[mol/L]}$$

**At $P_{N_2} = 5$ bar (60 msw):**
$$C_{N_2} = 0.06 \times 5 = 0.3 \text{ mol/L} = \mathbf{300 \text{ mM}}$$

**Molecular Volume of Dissolved N₂:**
- **Partial molar volume in lipid:** $\bar{V}_{N_2} \approx 35 \text{ cm}^3/\text{mol}$
- **Volume fraction:** $\phi_{N_2} = C_{N_2} \cdot \bar{V}_{N_2} = 0.3 \times 35 = \mathbf{10.5\%}$

**12.2.3 Bilayer Volumetric Expansion**

**Expansion Strain (Isotropic Assumption):**
$$\epsilon_v = \frac{\Delta V}{V_0} = \phi_{N_2} \quad \text{(ideal mixing)}$$

**Area Expansion (Constant Thickness Approximation):**
$$\frac{\Delta A}{A_0} = \frac{1}{2} \epsilon_v = \frac{\phi_{N_2}}{2}$$

**At 60 msw ($P_{N_2} = 5.46$ bar):**
$$\epsilon_v = 0.06 \times 5.46 \times 35 = 0.115 \quad (11.5\%)$$
$$\frac{\Delta A}{A_0} = 5.7\%$$

**Thickness Change (Constant Volume):**
$$\frac{\Delta h}{h_0} = -\frac{1}{2} \epsilon_v = -5.7\% \quad \text{(bilayer THINS)}$$

**12.2.4 Mechanical Stress on Embedded Proteins**

**Lateral Pressure Change in Bilayer Core:**
$$\Delta \Pi_{core} = K_A \cdot \frac{\Delta A}{A_0} = 250 \text{ mN/m} \times 0.057 = \mathbf{14.2 \text{ mN/m}}$$

**Force on Transmembrane Protein (Radius $r_p$):**
$$F_{protein} = \Delta \Pi_{core} \times 2\pi r_p$$

**For K⁺ Channel ($r_p \approx 2$ nm):**
$$F = 14.2 \times 10^{-3} \times 2\pi \times 2 \times 10^{-9} = \mathbf{1.8 \times 10^{-10} \text{ N}} = 180 \text{ pN}$$

**Comparison: Gating Forces:**
- **Voltage-gated channel gating force:** ~50–100 pN
- **Mechanosensitive channel (MscL) gating:** ~200–300 pN
- **N₂-induced force at 60 msw:** **180 pN — IN THE GATING RANGE!**

**12.2.5 Depth-Dependent Narcotic Effect (Quantitative)**

**Narcotic Index ($NI$) — Proportional to Bilayer Stress:**
$$NI(P_{N_2}) = \alpha \cdot P_{N_2} \cdot \lambda_{lipid/N_2} \cdot K_A \cdot \frac{\bar{V}_{N_2}}{2}$$

**Calibration to Clinical Data:**
- At 30 msw ($P_{N_2} = 3.12$ bar): Mild impairment ($NI = 1$)
- At 60 msw ($P_{N_2} = 5.46$ bar): Moderate impairment ($NI = 1.75$)
- At 90 msw ($P_{N_2} = 7.8$ bar): Severe impairment ($NI = 2.5$)

**Nonlinearity (Cooperativity):**
$$NI = NI_{max} \cdot \frac{(P_{N_2}/P_{50})^n}{1 + (P_{N_2}/P_{50})^n}$$
Where $P_{50} \approx 4.5$ bar, $n \approx 2.5$ (Hill coefficient)

**12.2.6 Helium — Why It's Non-Narcotic**

**Helium Partitioning:**
- $\lambda_{lipid/He} \approx 0.014$ (vs. 0.06 for N₂)
- **4.3× lower solubility**

**At Same Pressure (5 bar):**
$$C_{He} = 0.014 \times 5 = 0.07 \text{ mol/L}$$
$$\phi_{He} = 0.07 \times 35 = 2.45\% \quad \text{(vs. 10.5% for N₂)}$$

**Bilayer Expansion from He:**
$$\frac{\Delta A}{A_0} = \frac{2.45\%}{2} = 1.2\% \quad \text{(vs. 5.7% for N₂)}$$

**Stress on Proteins:**
$$\Delta \Pi_{core,He} = 250 \times 0.012 = 3 \text{ mN/m} \quad \text{(vs. 14.2 for N₂)}$$

**Force on Channel:** 38 pN (vs. 180 pN for N₂) — **BELOW GATING THRESHOLD**

**This quantitatively explains why He is non-narcotic at diving pressures.**

---

*End of Piece 2 — DOC-12 Lines 10001-10100*
*Next: Piece 3 — Section 12.3 Ion Channel Distortion & Neurophysiological Effects*