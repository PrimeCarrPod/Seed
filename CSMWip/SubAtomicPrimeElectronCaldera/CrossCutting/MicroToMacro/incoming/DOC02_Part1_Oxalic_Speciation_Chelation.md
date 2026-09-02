# DOCUMENT 2: Oxalic Weathering Pathway Deep Dive
## Part 1 of 5: Oxalic Acid Speciation and Proton Availability

**Source Expansion**: DeepResearch/Global Geological Clay Deposit Mapping.pdf (Lines 29-74)
**Target**: ~180 lines per part × 5 parts = ~900 lines total
**Document ID**: DOC02_Oxalic_Weathering_Pathway_Deep_Dive.md

---

## 2.1 Oxalic Acid Speciation: pKa₁=1.25, pKa₂=4.14 — Proton Availability

### 2.1.1 Acid-Base Equilibrium in the Rhizosphere

Oxalic acid (H₂C₂O₄, ethanedioic acid) is the smallest dicarboxylic acid and represents one of the strongest low-molecular-weight organic acids (LMWOAs) found in natural pedological environments. Its diprotic dissociation governs proton availability for mineral weathering:

**First dissociation:**
$$\text{H}_2\text{C}_2\text{O}_4 \rightleftharpoons \text{HC}_2\text{O}_4^- + \text{H}^+ \quad \text{p}K_{a1} = 1.25 \quad (K_{a1} = 5.6 \times 10^{-2})$$

**Second dissociation:**
$$\text{HC}_2\text{O}_4^- \rightleftharpoons \text{C}_2\text{O}_4^{2-} + \text{H}^+ \quad \text{p}K_{a2} = 4.14 \quad (K_{a2} = 7.2 \times 10^{-5})$$

### 2.1.2 Speciation as a Function of pH

The fractional distribution of oxalate species:

$$\alpha_0 = \frac{[\text{H}^+]^2}{[\text{H}^+]^2 + K_{a1}[\text{H}^+] + K_{a1}K_{a2}}$$

$$\alpha_1 = \frac{K_{a1}[\text{H}^+]}{[\text{H}^+]^2 + K_{a1}[\text{H}^+] + K_{a1}K_{a2}}$$

$$\alpha_2 = \frac{K_{a1}K_{a2}}{[\text{H}^+]^2 + K_{a1}[\text{H}^+] + K_{a1}K_{a2}}$$

| pH | α₀ (H₂C₂O₄) | α₁ (HC₂O₄⁻) | α₂ (C₂O₄²⁻) | Dominant Species |
|----|-------------|-------------|-------------|------------------|
| 1.0 | 0.64 | 0.36 | <0.01 | H₂C₂O₄ / HC₂O₄⁻ |
| 2.0 | 0.06 | 0.90 | 0.04 | HC₂O₄⁻ |
| 3.0 | <0.01 | 0.89 | 0.11 | HC₂O₄⁻ |
| 4.0 | <0.01 | 0.55 | 0.45 | HC₂O₄⁻ / C₂O₄²⁻ |
| 4.14 | <0.01 | 0.50 | 0.50 | Equal HC₂O₄⁻ / C₂O₄²⁻ |
| 5.0 | <0.01 | 0.14 | 0.86 | C₂O₄²⁻ |
| 6.0 | <0.01 | 0.02 | 0.98 | C₂O₄²⁻ |

### 2.1.3 Total Proton Donation Capacity

Each mole of oxalic acid can donate up to 2 moles of H⁺, but the effective proton concentration depends on pH. The total titratable acidity:

$$[\text{H}^+]_{\text{effective}} = [\text{H}_2\text{C}_2\text{O}_4] + [\text{HC}_2\text{O}_4^-] + 2[\text{C}_2\text{O}_4^{2-}]$$

At pH 5.5 (typical rhizosphere): α₀ ≈ 0, α₁ ≈ 0.05, α₂ ≈ 0.95
For 1 mM total oxalate: $[\text{H}^+]_{\text{effective}} \approx 1.95\ \text{mM}$

At pH 3.5 (intense root exudation zone): α₀ ≈ 0.01, α₁ ≈ 0.80, α₂ ≈ 0.19
For 1 mM total oxalate: $[\text{H}^+]_{\text{effective}} \approx 1.19\ \text{mM}$

### 2.1.4 Temperature Dependence of pKa Values

van't Hoff relationship:
$$\frac{d\ln K_a}{dT} = \frac{\Delta H_{\text{diss}}}{RT^2}$$

For oxalic acid:
- $\Delta H_{\text{diss},1} \approx -3.5\ \text{kJ/mol}$ (slightly exothermic)
- $\Delta H_{\text{diss},2} \approx +1.2\ \text{kJ/mol}$ (slightly endothermic)

At 10°C: pKa₁ ≈ 1.30, pKa₂ ≈ 4.20
At 25°C: pKa₁ = 1.25, pKa₂ = 4.14
At 40°C: pKa₁ ≈ 1.20, pKa₂ ≈ 4.08

Higher temperatures slightly increase acid strength, enhancing weathering in tropical soils.

### 2.1.5 Ionic Strength Effects: Davies Equation

Activity coefficients at I = 0.01 M (typical soil solution):
$$\log \gamma = -0.5 z^2 \left(\frac{\sqrt{I}}{1+\sqrt{I}} - 0.3I\right)$$

For H⁺ (z=1): $\gamma \approx 0.89$
For C₂O₄²⁻ (z=2): $\gamma \approx 0.35$

Effective pKa shifts:
$$\text{p}K_a^{\text{eff}} = \text{p}K_a^\circ - \log\left(\frac{\gamma_{\text{H}^+}\gamma_{\text{A}^-}}{\gamma_{\text{HA}}}\right)$$

At I = 0.01 M: pKa₁ shifts by ~+0.05, pKa₂ shifts by ~+0.20

---

## 2.2 Ligand-Exchange Chelation Mechanisms: Al³⁺, Fe³⁺, Ca²⁺ Binding Constants

### 2.2.1 Chelation Thermodynamics

Oxalate forms exceptionally stable complexes with polyvalent cations via bidentate chelation, creating 5-membered rings:

$$\text{M}^{n+} + \text{C}_2\text{O}_4^{2-} \rightleftharpoons \text{MC}_2\text{O}_4^{(n-2)+}$$

**Formation constants (log β) at 25°C, I=0:**

| Cation | log β₁ (ML) | log β₂ (ML₂) | log β₃ (ML₃) | Geometry |
|--------|-------------|--------------|--------------|----------|
| Al³⁺ | 7.2 | 13.2 | 17.0 | Octahedral |
| Fe³⁺ | 9.5 | 17.5 | 22.0 | Octahedral |
| Fe²⁺ | 3.8 | 6.2 | 7.5 | Octahedral |
| Ca²⁺ | 3.2 | 4.8 | 5.5 | 7–8 coordinate |
| Mg²⁺ | 2.7 | 4.2 | 5.0 | Octahedral |
| Mn²⁺ | 3.1 | 5.0 | 6.0 | Octahedral |
| Cu²⁺ | 5.1 | 8.8 | 10.5 | Square planar |
| Zn²⁺ | 4.0 | 6.8 | 8.0 | Tetrahedral |
| Pb²⁺ | 4.8 | 8.2 | 9.5 | Distorted |

### 2.2.2 Conditional Stability Constants at Soil pH

At pH 5.5 (α₂ = 0.86), conditional constants:

$$\log K_{\text{cond}} = \log \beta + \log \alpha_2$$

| Cation | log β₁ | log K_cond (pH 5.5) | Effective at [Ox] = 10⁻⁴ M |
|--------|--------|---------------------|---------------------------|
| Al³⁺ | 7.2 | 7.2 - 0.06 = 7.14 | >99.9% complexed |
| Fe³⁺ | 9.5 | 9.5 - 0.06 = 9.44 | >99.9% complexed |
| Ca²⁺ | 3.2 | 3.2 - 0.06 = 3.14 | ~99% complexed |
| Mg²⁺ | 2.7 | 2.7 - 0.06 = 2.64 | ~98% complexed |

At pH 4.0 (α₂ = 0.45):
- Al³⁺: log K_cond = 7.2 - 0.35 = 6.85
- Fe³⁺: log K_cond = 9.5 - 0.35 = 9.15

### 2.2.3 Competitive Binding: Selectivity Sequence

For oxalate at pH 5.5:
$$\text{Fe}^{3+} \gg \text{Al}^{3+} > \text{Cu}^{2+} > \text{Pb}^{2+} > \text{Ca}^{2+} > \text{Mg}^{2+} > \text{Mn}^{2+} > \text{Fe}^{2+} > \text{Zn}^{2+}$$

Fe³⁺ binds 10²·³ times more strongly than Al³⁺, explaining preferential Fe dissolution in oxalate-rich environments.

### 2.2.4 Ligand-Exchange Mechanism at Mineral Surfaces

The chelation occurs via ligand exchange at the mineral-water interface:

$$\equiv\text{Al-OH} + \text{C}_2\text{O}_4^{2-} \rightleftharpoons \equiv\text{Al-O}_2\text{C-CO}_2^- + \text{OH}^-$$

$$\equiv\text{Fe-OH} + \text{HC}_2\text{O}_4^- \rightleftharpoons \equiv\text{Fe-O}_2\text{C-CO}_2\text{H} + \text{OH}^-$$

Rate law for ligand-promoted dissolution:
$$r_{\text{lig}} = k_{\text{lig}} [\text{L}]_{\text{surf}} \theta_{\text{site}}$$

where $[\text{L}]_{\text{surf}}$ is surface-bound ligand concentration, $\theta_{\text{site}}$ is fraction of reactive sites.

---

*End of Part 1 — Continue to Part 2: Rhizosphere pH Depression Kinetics and Root Exudation Flux Models*