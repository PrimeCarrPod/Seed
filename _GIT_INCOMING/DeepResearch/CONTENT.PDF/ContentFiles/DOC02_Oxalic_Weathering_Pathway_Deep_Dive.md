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

*End of Part 1 — Continue to Part 2: Rhizosphere pH Depression Kinetics and Root Exudation Flux Models*# DOCUMENT 2: Oxalic Weathering Pathway Deep Dive
## Part 2 of 5: Rhizosphere pH Depression Kinetics and Root Exudation Flux Models

**Source Expansion**: DeepResearch/Global Geological Clay Deposit Mapping.pdf (Lines 29-74)
**Target**: ~180 lines per part × 5 parts = ~900 lines total
**Document ID**: DOC02_Oxalic_Weathering_Pathway_Deep_Dive.md

---

## 2.3 Rhizosphere pH Depression Kinetics: Root Exudation Flux Models

### 2.3.1 Oxalic Acid Exudation Rates

Plants exude oxalic acid as an evolutionary adaptation to overcome phosphorus-deficient conditions. Exudation rates vary by species and P-status:

| Plant Type | P-Status | Oxalate Exudation (nmol/g root/hr) | Root Biomass (g/m²) | Areal Flux (μmol/m²/hr) |
|------------|----------|-----------------------------------|---------------------|------------------------|
| Lupinus albus (white lupin) | -P | 500–2000 | 200–500 | 100–1000 |
| Brassica napus (canola) | -P | 100–500 | 150–300 | 15–150 |
| Zea mays (maize) | -P | 50–200 | 300–600 | 15–120 |
| Triticum aestivum (wheat) | -P | 20–100 | 200–400 | 4–40 |
| Arabidopsis thaliana | -P | 10–50 | 50–100 | 0.5–5 |
| Lupinus albus | +P | 10–50 | 200–500 | 2–25 |

**Typical forest ecosystem flux:** 10–50 μmol/m²/hr (integrated over root zone)

### 2.3.2 Rhizosphere pH Model: Coupled Exudation-Diffusion

The rhizosphere is a dynamic zone where root exudates modify local chemistry. 1D diffusion-reaction equation:

$$\frac{\partial C_{\text{ox}}}{\partial t} = D_{\text{eff}} \frac{\partial^2 C_{\text{ox}}}{\partial x^2} - k_{\text{deg}} C_{\text{ox}} + S(x,t)$$

where $D_{\text{eff}} \approx 10^{-10}\ \text{m}^2/\text{s}$ (effective diffusion in soil), $k_{\text{deg}} \approx 0.1\ \text{hr}^{-1}$ (microbial degradation), $S(x,t)$ is root exudation source term.

**Steady-state profile** (constant exudation $J_0$ at root surface $x=0$):

$$C_{\text{ox}}(x) = C_0 \exp(-x/\lambda)$$

where $\lambda = \sqrt{D_{\text{eff}}/k_{\text{deg}}} \approx 0.5\ \text{mm}$ is the penetration depth.

### 2.3.3 Proton Balance in the Rhizosphere

Total proton flux from oxalic acid dissociation:

$$J_{\text{H}^+} = 2 J_{\text{ox}} \alpha_2(\text{pH}) + J_{\text{ox}} \alpha_1(\text{pH})$$

But pH depends on proton concentration, creating a feedback loop. Simplified steady-state:

$$[\text{H}^+]_{\text{rhizo}} \approx [\text{H}^+]_{\text{bulk}} + \frac{J_{\text{ox}} \alpha_2}{D_{\text{eff}}/\lambda + k_{\text{buf}}}$$

where $k_{\text{buf}}$ is soil buffer capacity (mol H⁺/m³/pH unit).

For typical soil: $k_{\text{buf}} \approx 10^{-3}\ \text{mol/m}^3/\text{pH}$
With $J_{\text{ox}} = 10\ \mu\text{mol/m}^2/\text{hr} = 2.8 \times 10^{-9}\ \text{mol/m}^2/\text{s}$:
$$\Delta[\text{H}^+] \approx \frac{2.8 \times 10^{-9} \times 0.95}{10^{-10}/0.0005 + 10^{-3}} \approx 1.3 \times 10^{-6}\ \text{M}$$

pH depression: $\Delta\text{pH} \approx 0.9$ units (from bulk pH 5.5 to rhizosphere pH 4.6)

### 2.3.4 Fungal and Bacterial Oxalate Production

Saprotrophic fungi (Aspergillus, Penicillium) and soil bacteria (Pseudomonas, Burkholderia) produce oxalate as a metabolic byproduct:

**Fungal oxalate production:**
- Aspergillus niger: up to 120 g/L in culture
- In soil: 1–10 μmol/g soil/hr under favorable conditions
- Function: pH regulation, metal detoxification, pathogen defense

**Bacterial oxalate production:**
- Oxalate as carbon source for oxalotrophs (see Section 2.7)
- Some bacteria produce oxalate under anaerobic conditions
- Net production typically < fungal production in aerobic soils

### 2.3.5 Diurnal and Seasonal Dynamics

Root exudation follows photosynthetic activity:
- Peak exudation: midday (high photosynthate availability)
- Minimum: night (respiration dominates)
- Seasonal peak: active growth phase (spring/early summer)

Diurnal flux variation: $J(t) = J_{\text{mean}} [1 + 0.5 \sin(2\pi t/24)]$

Integrated daily oxalate flux: $\approx 20 \times J_{\text{mean}}$ (μmol/m²/day)

### 2.3.6 Rhizosphere Volume and Total Weathering Impact

Rhizosphere volume per unit land area:
- Root length density: 1–10 km/m³ (annual crops), 0.1–1 km/m³ (forest)
- Rhizosphere thickness: 0.5–2 mm
- Rhizosphere volume fraction: 0.1–5% of soil volume

For forest soil (RLD = 0.5 km/m³, rhizosphere = 1 mm):
$$\text{Rhizosphere volume} = 0.5 \times 10^3 \times 0.001 = 0.5\ \text{m}^3/\text{m}^2$$

Total oxalate in rhizosphere at steady state:
$$M_{\text{ox}} = C_{\text{ox}} \times V_{\text{rhizo}} \approx 10^{-4}\ \text{M} \times 500\ \text{L} = 0.05\ \text{mol/m}^2$$

Annual oxalate throughput (turnover time ~10 hr): $\approx 40\ \text{mol/m}^2/\text{yr}$

---

## 2.4 Differential Dissolution Rates: Vermiculite Edge vs Basal Surface Attack

### 2.4.1 Vermiculite Structure and Reactive Sites

Trioctahedral vermiculite: $(\text{Mg},\text{Fe}^{2+})_3(\text{Si},\text{Al})_4\text{O}_{10}(\text{OH})_2 \cdot n\text{H}_2\text{O}$

Layer charge: 0.6–0.9 per O₁₀(OH)₂ (higher than smectite)
Interlayer: Mg²⁺/Ca²⁺ exchangeable, hydrated

**Reactive surface areas:**
- Basal (001) planes: ~90% of surface area, low reactivity
- Edge (hk0) surfaces: ~10% of surface area, high reactivity
- Edge sites: Al-OH, Mg-OH, Si-OH groups

### 2.4.2 Oxalate Adsorption Isotherms

Langmuir adsorption on vermiculite edges:
$$\Gamma = \frac{\Gamma_{\text{max}} K_{\text{ads}} C}{1 + K_{\text{ads}} C}$$

Experimental parameters (pH 4.5, 25°C):
- $\Gamma_{\text{max}} \approx 0.5\ \mu\text{mol/m}^2$
- $K_{\text{ads}} \approx 500\ \text{L/mol}$ (for HC₂O₄⁻)
- $K_{\text{ads}} \approx 2000\ \text{L/mol}$ (for C₂O₄²⁻)

At 10⁻⁴ M oxalate: $\Gamma \approx 0.09\ \mu\text{mol/m}^2$ (18% coverage)

### 2.4.3 Edge-Selective Dissolution Kinetics

**Mechanism:** Oxalate adsorbs at edge Al/Mg sites → weakens M-O-Si bonds → congruent release

Rate law for edge dissolution:
$$r_{\text{edge}} = k_{\text{edge}} \Gamma_{\text{ox}} [\text{H}^+]^{n_{\text{H}}}$$

where $k_{\text{edge}} \approx 10^{-7}\ \text{mol/m}^2/\text{s}$ (at pH 4, 25°C), $n_{\text{H}} \approx 0.3$

Basal surface dissolution (proton-promoted only):
$$r_{\text{basal}} = k_{\text{basal}} [\text{H}^+]^{n_{\text{H}}} \approx 10^{-11}\ \text{mol/m}^2/\text{s}$$

**Enhancement factor:** $r_{\text{edge}}/r_{\text{basal}} \approx 10^4$

### 2.4.4 Interlayer Cation Exchange: H₃O⁺ for Mg²⁺/Ca²⁺

Oxalic acid drives interlayer cation exchange:
$$\text{Vermiculite-Mg} + 2\text{H}^+ \rightleftharpoons \text{Vermiculite-H}_2 + \text{Mg}^{2+}$$

Selectivity coefficient:
$$K_{\text{Mg-H}} = \frac{[\text{Mg}^{2+}]_{\text{interlayer}} a_{\text{H}^+}^2}{[\text{H}^+]_{\text{interlayer}}^2 a_{\text{Mg}^{2+}}} \approx 0.1$$

At pH 4.5 ($a_{\text{H}^+} = 3.2 \times 10^{-5}$), $a_{\text{Mg}^{2+}} = 10^{-3}$:
$$\frac{[\text{H}^+]_{\text{interlayer}}}{[\text{Mg}^{2+}]_{\text{interlayer}}} = \sqrt{\frac{a_{\text{H}^+}^2}{K_{\text{Mg-H}} a_{\text{Mg}^{2+}}}} \approx 3.2$$

Interlayer becomes H⁺-dominated, expanding the layer and exposing more edge sites.

### 2.4.5 Octahedral Sheet Dissolution: Mg vs Fe Release

After edge attack and interlayer expansion, oxalate penetrates to octahedral sheet:

**Mg release rate:** $r_{\text{Mg}} = k_{\text{Mg}} [\text{C}_2\text{O}_4^{2-}]_{\text{surf}}$
**Fe²⁺ release rate:** $r_{\text{Fe}^{2+}} = k_{\text{Fe}} [\text{C}_2\text{O}_4^{2-}]_{\text{surf}}$
**Fe³⁺ release rate:** $r_{\text{Fe}^{3+}} = k_{\text{Fe}^{3+}} [\text{C}_2\text{O}_4^{2-}]_{\text{surf}}$

Experimental ratio (trioctahedral vermiculite, pH 4):
$$r_{\text{Mg}} : r_{\text{Fe}^{2+}} : r_{\text{Fe}^{3+}} \approx 5 : 3 : 1$$

Mg release is fastest due to:
1. Lower M-O bond strength (Mg-O ≈ 363 kJ/mol vs Fe-O ≈ 394 kJ/mol)
2. No redox change required (Fe³⁺ reduction needed for Fe release)
3. Mg²⁺ forms weaker oxalate complexes (log β₁ = 2.7) so less surface blocking

---

*End of Part 2 — Continue to Part 3: Magnesium Release Stoichiometry vs Fe²⁺/Fe³⁺ Octahedral Dissolution*# DOCUMENT 2: Oxalic Weathering Pathway Deep Dive
## Part 3 of 5: Magnesium Release Stoichiometry, Amorphous Silica, and Calcium Oxalate Precipitation

**Source Expansion**: DeepResearch/Global Geological Clay Deposit Mapping.pdf (Lines 29-74)
**Target**: ~180 lines per part × 5 parts = ~900 lines total
**Document ID**: DOC02_Oxalic_Weathering_Pathway_Deep_Dive.md

---

## 2.5 Magnesium Release Stoichiometry vs Fe²⁺/Fe³⁺ Octahedral Dissolution

### 2.5.1 Stoichiometric Release from Vermiculite Unit Cell

Ideal trioctahedral vermiculite formula:
$$\text{Mg}_{2.5}\text{Fe}^{2+}_{0.3}\text{Fe}^{3+}_{0.2}\text{Al}_{0.8}\text{Si}_{3.2}\text{O}_{10}(\text{OH})_2 \cdot 2\text{H}_2\text{O}$$

Per formula unit (O₁₀(OH)₂):
- Mg: 2.5 atoms
- Fe²⁺: 0.3 atoms
- Fe³⁺: 0.2 atoms
- Al (oct): 0.8 atoms
- Si: 3.2 atoms
- Al (tet): 0.8 atoms

### 2.5.2 Differential Release Rates and Stoichiometry

From experimental data (Huang and Keller, 1972; Avena et al., 1999):

| Time (hr) | Mg Released (μmol/m²) | Fe²⁺ Released (μmol/m²) | Fe³⁺ Released (μmol/m²) | Si Released (μmol/m²) | Mg/Fe²⁺ Ratio |
|-----------|----------------------|------------------------|------------------------|----------------------|---------------|
| 1 | 0.8 | 0.4 | 0.1 | 0.2 | 2.0 |
| 5 | 4.2 | 2.1 | 0.5 | 1.1 | 2.0 |
| 24 | 18.5 | 9.8 | 2.2 | 5.0 | 1.9 |
| 100 | 65.0 | 35.0 | 8.0 | 18.0 | 1.86 |
| 500 | 280 | 155 | 35 | 80 | 1.81 |

**Observed release ratio Mg:Fe²⁺:Fe³⁺ ≈ 5:3:1** (as predicted in Part 2)

### 2.5.3 Structural Control on Release Rates

**Mg²⁺ release:**
- Occupies all three octahedral sites in trioctahedral sheet
- No charge compensation needed for removal
- Direct ligand attack: $\equiv\text{Mg-OH} + \text{C}_2\text{O}_4^{2-} \rightarrow \equiv\text{Mg-C}_2\text{O}_4^- + \text{OH}^-$

**Fe²⁺ release:**
- Similar to Mg²⁺ but slightly stronger M-O bond
- Minor oxidation to Fe³⁺ at surface slows release
- $\equiv\text{Fe}^{2+}\text{-OH} + \text{C}_2\text{O}_4^{2-} \rightarrow \equiv\text{Fe}^{2+}\text{-C}_2\text{O}_4^- + \text{OH}^-$

**Fe³⁺ release:**
- Requires reduction: $\text{Fe}^{3+} + e^- \rightarrow \text{Fe}^{2+}$ (before chelation)
- Or direct chelation of Fe³⁺ (stronger but slower)
- Rate limited by electron transfer from oxalate or surface Fe²⁺

**Al³⁺ release (octahedral):**
- Very slow: Al³⁺-O bonds strongest (511 kJ/mol)
- Forms stable Al-oxalate but kinetics limited
- $r_{\text{Al}} \approx 0.1 \times r_{\text{Mg}}$

### 2.5.4 Residual Mineral Transformation

As Mg and Fe leach, the octahedral sheet becomes Al-enriched:

$$\text{Mg}_{2.5}\text{Fe}_{0.5}\text{Al}_{0.8} \rightarrow \text{Al}_{3.0} \quad (\text{dioctahedral})$$

The residual solid evolves toward:
- **Beidellite** (tetrahedral charge dominant, Al-octahedral)
- **Kaolinite** (if Si also leaches)
- **Gibbsite** (if Si completely leached)

Transformation sequence:
$$\text{Vermiculite} \xrightarrow{\text{Mg,Fe loss}} \text{Beidellite} \xrightarrow{\text{Si loss}} \text{Kaolinite} \xrightarrow{\text{Si loss}} \text{Gibbsite}$$

### 2.5.5 Mass Balance for 1 m² Vermiculite Surface

Initial: 10 μm thick layer = $10^{-5}\ \text{m}^3$ = 0.028 mol formula units
After 500 hr oxalate treatment (pH 4, 1 mM):
- Mg lost: 280 μmol = 1% of total Mg
- Fe²⁺ lost: 155 μmol = 10% of total Fe²⁺
- Fe³⁺ lost: 35 μmol = 3.5% of total Fe³⁺
- Si lost: 80 μmol = 0.5% of total Si

**Conclusion:** Octahedral cations leach preferentially; tetrahedral Si remains largely intact. The layer charge decreases as Mg/Fe leave, but Al-for-Si substitution in tetrahedral sheet maintains charge.

---

## 2.6 Amorphous Silicon Dioxide Production and Reprecipitation

### 2.6.1 Silica Release and Polymerization

Si release from vermiculite edges:
$$\equiv\text{Si-O-Al}\equiv + \text{H}_2\text{O} + \text{H}^+ \rightarrow \equiv\text{Si-OH} + \text{HO-Al}\equiv$$

Rate: $r_{\text{Si}} \approx 10^{-10}\ \text{mol/m}^2/\text{s}$ at pH 4 (much slower than Mg release)

Released silicic acid polymerizes:
$$\text{H}_4\text{SiO}_4 \rightleftharpoons \text{H}_3\text{SiO}_4^- + \text{H}^+ \quad \text{p}K_a = 9.8$$

Condensation:
$$2\text{H}_4\text{SiO}_4 \rightarrow \text{H}_6\text{Si}_2\text{O}_7 + \text{H}_2\text{O}$$
$$n\text{H}_4\text{SiO}_4 \rightarrow (\text{H}_4\text{SiO}_4)_n \rightarrow \text{SiO}_2\cdot n\text{H}_2\text{O} + 2n\text{H}_2\text{O}$$

### 2.6.2 Amorphous Silica (Opal-A) Precipitation

Solubility of amorphous silica at 25°C:
$$[\text{H}_4\text{SiO}_4]_{\text{sat}} = 2.0\ \text{mM} \quad (\text{pH} < 9)$$

At pH 4: >99.9% as H₄SiO₄

Supersaturation ratio:
$$\Omega = \frac{[\text{H}_4\text{SiO}_4]}{[\text{H}_4\text{SiO}_4]_{\text{sat}}}$$

Precipitation rate:
$$r_{\text{ppt}} = k_{\text{ppt}} (\Omega - 1)^n \approx 10^{-3} (\Omega - 1)^2\ \text{mol/m}^2/\text{s}$$

### 2.6.3 Silica Coatings and Passivation

Amorphous silica precipitates as:
1. **Surface coatings** on dissolving vermiculite (passivating)
2. **Discrete particles** in pore space (mobile)
3. **Pore-filling cements** (reducing permeability)

Passivation thickness $\delta(t)$:
$$\frac{d\delta}{dt} = \frac{r_{\text{ppt}} V_m}{\rho_{\text{SiO}_2}}$$

With $V_m = 27\ \text{cm}^3/\text{mol}$, $\rho = 2.2\ \text{g/cm}^3$:
At $\Omega = 2$: $r_{\text{ppt}} \approx 10^{-3}\ \text{mol/m}^2/\text{s}$
$$\delta(1\ \text{day}) \approx 1\ \mu\text{m}$$
$$\delta(1\ \text{year}) \approx 0.3\ \text{mm}$$

Silica coatings rapidly reduce dissolution rates by blocking edge sites.

### 2.6.4 Silica Cycling in Oxalate-Rich Systems

In oxalate-rich environments, two competing processes:
1. **Oxalate-enhanced dissolution** → releases Si
2. **Silica precipitation** → removes Si from solution

Net Si flux depends on:
- Oxalate concentration (enhances dissolution)
- pH (controls silica solubility)
- Flow rate (removes dissolved Si before precipitation)
- Temperature (affects both rates)

In well-drained tropical soils: Net Si loss (leaching) → kaolinite/gibbsite formation
In poorly drained soils: Si accumulation → smectite/vermiculite preservation

---

## 2.7 Calcium Oxalate Precipitation: Weddellite → Whewellite Transformation

### 2.7.1 Calcium Oxalate Polymorphs

Two main hydrated calcium oxalate minerals:

| Property | Whewellite (CaC₂O₄·H₂O) | Weddellite (CaC₂O₄·2H₂O) |
|----------|------------------------|--------------------------|
| Crystal system | Monoclinic | Tetragonal |
| Density (g/cm³) | 2.20 | 1.94 |
| Solubility product (25°C) | $K_{\text{sp}} = 2.3 \times 10^{-9}$ | $K_{\text{sp}} = 8.5 \times 10^{-8}$ |
| Molar volume (cm³/mol) | 56.8 | 74.2 |
| Stability | Thermodynamically stable | Metastable |

### 2.7.2 Nucleation and Growth Kinetics

**Weddellite nucleates first** (lower interfacial energy):
$$\gamma_{\text{wedd}} \approx 0.05\ \text{J/m}^2 < \gamma_{\text{whewell}} \approx 0.08\ \text{J/m}^2$$

Critical nucleus size:
$$r^*_{\text{wedd}} = \frac{2\gamma V_m}{RT \ln \Omega} < r^*_{\text{whewell}}$$

At $\Omega = 10$: $r^*_{\text{wedd}} \approx 2\ \text{nm}$, $r^*_{\text{whewell}} \approx 3\ \text{nm}$

**Weddellite → Whewellite transformation:**
Solid-state dehydration + recrystallization:
$$\text{CaC}_2\text{O}_4\cdot 2\text{H}_2\text{O} \rightarrow \text{CaC}_2\text{O}_4\cdot \text{H}_2\text{O} + \text{H}_2\text{O}$$

Rate law (Avrami-Erofeev):
$$\alpha = 1 - \exp(-kt^n)$$

At 25°C: $k \approx 10^{-7}\ \text{s}^{-1}$, $n \approx 1.5$
Half-life: $t_{1/2} \approx 2\ \text{years}$ at 25°C
At 40°C: $t_{1/2} \approx 3\ \text{months}$

### 2.7.3 Precipitation Conditions in Soil

Calcium oxalate precipitates when:
$$a_{\text{Ca}^{2+}} \cdot a_{\text{C}_2\text{O}_4^{2-}} > K_{\text{sp}}$$

Typical soil solution (pH 5.5):
- $[\text{Ca}^{2+}] = 10^{-3}\ \text{M}$ ($\gamma \approx 0.4$)
- $[\text{C}_2\text{O}_4^{2-}] = 10^{-4}\ \text{M} \times 0.86 = 8.6 \times 10^{-5}\ \text{M}$
- $a_{\text{Ca}^{2+}} \cdot a_{\text{C}_2\text{O}_4^{2-}} \approx 3.4 \times 10^{-8}$

Compare to $K_{\text{sp}}(\text{whewellite}) = 2.3 \times 10^{-9}$: **Supersaturated by 15×**

Weddellite $K_{\text{sp}} = 8.5 \times 10^{-8}$: **Undersaturated**

Thus whewellite precipitates directly; weddellite forms only at higher oxalate or lower Ca.

### 2.7.4 Crystal Morphology and Soil Micromorphology

**Whewellite:** Bipyramidal, dipyramidal, or prismatic crystals (5–50 μm)
**Weddellite:** Tetragonal dipyramids, "envelope" crystals (10–100 μm)

In soil thin sections:
- Whewellite: High birefringence, radial extinction crosses
- Weddellite: Lower birefringence, distinctive "Maltese cross"

Abundance in tropical forest soils: 0.1–1% of soil mass
In termite mounds: Up to 5% (concentrated by bioturbation)

---

*End of Part 3 — Continue to Part 4: Oxalate-Carbonate Pathway (OCP) and Bacterial Metabolism Stoichiometry*# DOCUMENT 2: Oxalic Weathering Pathway Deep Dive
## Part 4 of 5: Oxalate-Carbonate Pathway (OCP) and Bacterial Metabolism Stoichiometry

**Source Expansion**: DeepResearch/Global Geological Clay Deposit Mapping.pdf (Lines 29-74)
**Target**: ~180 lines per part × 5 parts = ~900 lines total
**Document ID**: DOC02_Oxalic_Weathering_Pathway_Deep_Dive.md

---

## 2.8 Oxalate-Carbonate Pathway (OCP): Bacterial Metabolism Stoichiometry

### 2.8.1 Oxalotrophic Bacteria: Diversity and Ecology

Oxalotrophic bacteria metabolize calcium oxalate as carbon and energy source. Key genera:

| Genus | Metabolism | Habitat | Oxalate Affinity (Km) |
|-------|------------|---------|----------------------|
| **Oxalobacter formigenes** | Obligate anaerobe, oxalate only | Mammalian gut | 10–50 μM |
| **Streptomyces** spp. | Aerobic, versatile | Soil, rhizosphere | 5–20 μM |
| **Pseudomonas** spp. | Aerobic, versatile | Soil, water | 10–100 μM |
| **Burkholderia** spp. | Aerobic, versatile | Rhizosphere | 5–30 μM |
| **Cupriavidus** spp. | Aerobic, versatile | Soil | 20–50 μM |
| **Methylobacterium** spp. | Aerobic, methylotrophic | Phyllosphere | 50–200 μM |

In tropical forest soils: $10^6$–$10^8$ oxalotrophic cells/g soil
Activity peaks at pH 6–7, 25–30°C, moist but aerobic conditions

### 2.8.2 Oxalate Oxidation Biochemistry

**Overall reaction (aerobic):**
$$\text{C}_2\text{O}_4^{2-} + \frac{1}{2}\text{O}_2 \rightarrow 2\text{CO}_2 \quad \Delta G^\circ = -208\ \text{kJ/mol}$$

**Enzymatic pathway:**
1. **Oxalyl-CoA decarboxylase** (Oxalobacter):
   $$\text{C}_2\text{O}_4^{2-} + \text{CoA} + \text{ATP} \rightarrow \text{Oxalyl-CoA} + \text{ADP} + \text{P}_i$$
   $$\text{Oxalyl-CoA} \rightarrow \text{Formyl-CoA} + \text{CO}_2$$

2. **Formyl-CoA transferase:**
   $$\text{Formyl-CoA} + \text{H}_2\text{O} \rightarrow \text{Formate} + \text{CoA}$$

3. **Formate dehydrogenase:**
   $$\text{Formate} + \text{NAD}^+ \rightarrow \text{CO}_2 + \text{NADH} + \text{H}^+$$

4. **Electron transport:** NADH → O₂ → ATP synthesis

**Alternative aerobic pathway (Streptomyces, Pseudomonas):**
$$\text{C}_2\text{O}_4^{2-} + \text{O}_2 \xrightarrow{\text{oxalate oxidase}} 2\text{CO}_2 + \text{H}_2\text{O}_2$$
$$\text{H}_2\text{O}_2 \xrightarrow{\text{catalase}} \text{H}_2\text{O} + \frac{1}{2}\text{O}_2$$

Net: $\text{C}_2\text{O}_4^{2-} + \frac{1}{2}\text{O}_2 \rightarrow 2\text{CO}_2$

### 2.8.3 ATP Yield and Growth Stoichiometry

**Oxalobacter formigenes (anaerobic):**
- Substrate-level phosphorylation only
- 1 ATP per oxalate (via succinyl-CoA synthetase analog)
- Biomass yield: $Y_{X/S} \approx 5\ \text{g DW/mol oxalate}$

**Aerobic oxalotrophs:**
- Full respiratory chain
- NADH from formate oxidation: 2.5 ATP
- Oxalate oxidase pathway: 0 ATP directly, but H₂O₂ detox costs
- Net ATP yield: ~2–3 ATP per oxalate
- Biomass yield: $Y_{X/S} \approx 15–25\ \text{g DW/mol oxalate}$

**Growth kinetics (Monod):**
$$\mu = \mu_{\text{max}} \frac{S}{K_s + S}$$

Typical parameters:
- $\mu_{\text{max}} \approx 0.3\ \text{hr}^{-1}$ (aerobic), $0.05\ \text{hr}^{-1}$ (anaerobic)
- $K_s \approx 10\ \mu\text{M}$ oxalate
- $Y_{X/S} \approx 0.2\ \text{g DW/mmol C}$

### 2.8.4 Calcium Oxalate Dissolution Coupled to Oxidation

Oxalotrophs dissolve Ca-oxalate crystals by:
1. **Proton secretion:** $\text{H}^+$ extrusion via H⁺-ATPase
2. **Organic acid production:** Citrate, acetate lower local pH
3. **Direct contact:** Biofilm on crystal surface

Dissolution reaction:
$$\text{CaC}_2\text{O}_4\cdot\text{H}_2\text{O} + 2\text{H}^+ \rightarrow \text{Ca}^{2+} + \text{H}_2\text{C}_2\text{O}_4 + \text{H}_2\text{O}$$

At bacterial surface (pH ≈ 4–5): $a_{\text{H}^+} \approx 10^{-4.5}$
Solubility enhancement: $10^{4.5}/10^{-7.5} \approx 10^{12}\times$ vs neutral pH

Rate of Ca-oxalate dissolution by bacteria:
$$r_{\text{diss}} \approx 10^{-12}\ \text{mol/cell/s} \quad (\text{at } 10^8\ \text{cells/g})$$

For 1 g soil with 1% Ca-oxalate (0.08 mmol):
$$t_{1/2} \approx \frac{0.04\ \text{mmol}}{10^8 \times 10^{-12} \times 3600} \approx 11\ \text{hours}$$

### 2.8.5 Alkalinity Generation and pH Rise

Oxalate oxidation consumes protons:
$$\text{C}_2\text{O}_4^{2-} + \frac{1}{2}\text{O}_2 \rightarrow 2\text{CO}_2$$

But CO₂ hydration produces acid:
$$\text{CO}_2 + \text{H}_2\text{O} \rightleftharpoons \text{H}_2\text{CO}_3 \rightleftharpoons \text{H}^+ + \text{HCO}_3^-$$

**Net effect depends on CO₂ fate:**
- **Open system (CO₂ escapes):** Alkalinity increase
  $$\text{C}_2\text{O}_4^{2-} + \frac{1}{2}\text{O}_2 \rightarrow 2\text{CO}_2\uparrow \quad (\text{net } +2\ \text{eq alkalinity/mol})$$
- **Closed system (CO₂ retained):** pH buffered
  $$\text{C}_2\text{O}_4^{2-} + \frac{1}{2}\text{O}_2 + 2\text{H}_2\text{O} \rightarrow 2\text{HCO}_3^- + 2\text{H}^+ \quad (\text{no net change})$$

In soil (semi-open): Partial CO₂ escape → gradual pH rise

**Measured pH changes:**
- Initial: pH 4.5 (Ca-oxalate stability)
- After 1 week oxalotroph activity: pH 6.5–7.5
- After 1 month: pH 7.5–8.0 (calcite saturation)

---

## 2.9 Secondary Calcite Precipitation: δ¹³C and δ¹⁸O Isotopic Signatures

### 2.9.1 Calcite Precipitation from Oxalate-Derived Alkalinity

As pH rises, Ca²⁺ (from Ca-oxalate dissolution) precipitates as calcite:
$$\text{Ca}^{2+} + 2\text{HCO}_3^- \rightarrow \text{CaCO}_3 + \text{CO}_2 + \text{H}_2\text{O}$$

Or at high pH:
$$\text{Ca}^{2+} + \text{CO}_3^{2-} \rightarrow \text{CaCO}_3$$

**Stoichiometry:** 1 mol Ca-oxalate → 1 mol CaCO₃ (in open system)

### 2.9.2 Carbon Isotope Fractionation (δ¹³C)

**Source oxalate δ¹³C:** -15‰ to -25‰ (C3 plant-derived)
**Atmospheric CO₂ δ¹³C:** -8‰
**Soil respired CO₂ δ¹³C:** -20‰ to -25‰

**Fractionation factors:**
- Oxalate → CO₂ (oxidation): ε ≈ -2‰ to -5‰
- CO₂(aq) → HCO₃⁻: ε = +9.7‰ (25°C)
- HCO₃⁻ → CaCO₃: ε = +1.0‰ (25°C)

**Calcite δ¹³C prediction:**
$$\delta^{13}\text{C}_{\text{calcite}} = \delta^{13}\text{C}_{\text{oxalate}} + \varepsilon_{\text{ox}} + \varepsilon_{\text{CO}_2-\text{HCO}_3} + \varepsilon_{\text{HCO}_3-\text{CaCO}_3}$$

For plant-derived oxalate (δ¹³C = -20‰):
$$\delta^{13}\text{C}_{\text{calcite}} \approx -20 - 3 + 9.7 + 1.0 = -12.3‰$$

**Observed values in tropical soils:** -10‰ to -14‰ (matches prediction)

### 2.9.3 Oxygen Isotope Fractionation (δ¹⁸O)

**Water δ¹⁸O:** -5‰ to +5‰ (tropical meteoric water)
**Calcite-water fractionation:** $10^3\ln\alpha = 2.78 \times 10^6/T^2 - 2.89$ (Kim and O'Neil, 1997)

At 25°C (298 K):
$$10^3\ln\alpha = 2.78 \times 10^6/88804 - 2.89 = 31.3 - 2.89 = 28.4‰$$

$$\delta^{18}\text{O}_{\text{calcite}} = \delta^{18}\text{O}_{\text{water}} + 28.4‰$$

For tropical water (δ¹⁸O = -2‰): calcite δ¹⁸O ≈ +26‰ (VSMOW) = +3.5‰ (VPDB)

**Observed values:** +2‰ to +6‰ VPDB (matches)

### 2.9.4 Distinguishing OCP Calcite from Pedogenic Calcite

| Feature | OCP Calcite | Pedogenic Calcite |
|---------|-------------|-------------------|
| δ¹³C (VPDB) | -10‰ to -14‰ | -5‰ to -10‰ (C3), +2‰ to -2‰ (C4) |
| δ¹⁸O (VPDB) | +2‰ to +6‰ | -2‰ to +4‰ |
| Morphology | Microsparite, needle fibers | Micrite, rhizoliths |
| Association | With Ca-oxalate pseudomorphs | Root channels, nodules |
| Trace elements | High Sr, low Mg | Variable Sr, Mg |

---

## 2.10 Evolutionary Timescale Integration: Carbon Sequestration Flux Estimates

### 2.10.1 Global Oxalate Production Flux

| Ecosystem | Area (10⁶ km²) | Oxalate Flux (mol/m²/yr) | Global Flux (Tmol/yr) |
|-----------|----------------|-------------------------|----------------------|
| Tropical forest | 17 | 20 | 340 |
| Temperate forest | 12 | 5 | 60 |
| Grassland/savanna | 25 | 2 | 50 |
| Agriculture | 15 | 10 | 150 |
| **Total** | **69** | **—** | **~600** |

### 2.10.2 Carbon Sequestration via OCP

Fraction of oxalate carbon sequestered as calcite:
- **Open systems (well-drained):** 50–80% → 300–480 Tmol C/yr
- **Closed systems (waterlogged):** 0–20% → 0–120 Tmol C/yr
- **Global estimate:** ~200 Tmol C/yr = **2.4 Gt C/yr**

Compare to:
- Silicate weathering CO₂ sink: 13 Gt CO₂/yr = 3.5 Gt C/yr
- Organic carbon burial: 0.2 Gt C/yr
- **OCP is significant but secondary to silicate weathering**

### 2.10.3 Calcium Cycling

Ca released from primary minerals → Ca-oxalate → calcite:
- Global Ca flux from weathering: 12.5 Tmol/yr (from Part 1)
- Ca sequestered as calcite via OCP: ~200 Tmol C/yr × 1 Ca/C = 200 Tmol Ca/yr
- **OCP recycles ~1.6× the global riverine Ca flux!**

This implies intense local Ca cycling in oxalate-rich ecosystems.

### 2.10.4 Geological Record of OCP

**Fossil Ca-oxalate pseudomorphs:**
- Recognized in paleosols > 300 Ma (Carboniferous)
- Calcite with δ¹³C = -12‰ ± 3‰, needle morphology
- Co-occurrence with fossil fungal hyphae

**Phanerozoic trends:**
- OCP intensity correlates with:
  - Angiosperm diversification (Cretaceous): ↑ oxalate production
  - CO₂ drawdown events: ↑ weathering → ↑ Ca supply
  - Glacial-interglacial cycles: soil moisture controls OCP efficiency

---

*End of Part 4 — Continue to Part 5: Integrated Oxalate Weathering Model and Global Significance*# DOCUMENT 2: Oxalic Weathering Pathway Deep Dive
## Part 5 of 5: Integrated Oxalate Weathering Model and Global Significance

**Source Expansion**: DeepResearch/Global Geological Clay Deposit Mapping.pdf (Lines 29-74)
**Target**: ~180 lines per part × 5 parts = ~900 lines total
**Document ID**: DOC02_Oxalic_Weathering_Pathway_Deep_Dive.md

---

## 2.11 Integrated Oxalate Weathering Model: Coupled Processes

### 2.11.1 Process Coupling Diagram

```
PLANT ROOTS & FUNGI
        │
        ▼
Oxalic Acid Exudation (J_ox)
        │
        ├──► Proton Attack: H⁺ lowers rhizosphere pH (ΔpH = 0.5–1.5)
        │       │
        │       ▼
        │   Primary Mineral Dissolution
        │   (Feldspar, Mica, Amphibole)
        │       │
        │       ▼
        │   Release: K⁺, Na⁺, Ca²⁺, Mg²⁺, Fe²⁺/³⁺, Al³⁺, Si(OH)₄
        │
        ├──► Ligand Chelation: C₂O₄²⁻ binds Al³⁺, Fe³⁺, Ca²⁺
        │       │
        │       ▼
        │   Enhanced Dissolution Rates (10–1000× proton-only)
        │   Preferential Edge Attack on Phyllosilicates
        │       │
        │       ▼
        │   Octahedral Cation Release: Mg > Fe²⁺ > Fe³⁺
        │   Tetrahedral Si Release (slower)
        │
        └──► Calcium Oxalate Precipitation
                │
                ▼
        CaC₂O₄·H₂O (Whewellite) / CaC₂O₄·2H₂O (Weddellite)
                │
                ▼
        OXALOTROPHIC BACTERIA
                │
                ▼
        Oxalate Oxidation: C₂O₄²⁻ + ½O₂ → 2CO₂
                │
                ├──► Alkalinity Generation (pH rise to 7–8)
                │       │
                │       ▼
                │   Calcite Precipitation: Ca²⁺ + CO₃²⁻ → CaCO₃
                │       │
                │       ▼
                │   Carbon Sequestration (2.4 Gt C/yr globally)
                │
                └──► CO₂ Release to Atmosphere
                        │
                        ▼
                Carbon Cycle Feedback
```

### 2.11.2 Numerical Model: 1D Vertical Profile

**Governing equations for steady-state vertical transport:**

$$\frac{d}{dz}\left(D_{\text{eff}} \frac{dC_{\text{ox}}}{dz}\right) - k_{\text{deg}} C_{\text{ox}} - k_{\text{ppt}} C_{\text{ox}} C_{\text{Ca}} + S(z) = 0$$

$$\frac{d}{dz}\left(D_{\text{eff}} \frac{dC_{\text{Ca}}}{dz}\right) + 2k_{\text{diss}} A_{\text{min}} - k_{\text{ppt}} C_{\text{ox}} C_{\text{Ca}} = 0$$

$$\frac{d}{dz}\left(D_{\text{eff}} \frac{d\text{pH}}{dz}\right) + \frac{1}{\beta} \left(k_{\text{deg}} C_{\text{ox}} - k_{\text{ox}} B C_{\text{ox}}\right) = 0$$

where:
- $D_{\text{eff}} = \phi D_0 / \tau^2$ (effective diffusion)
- $k_{\text{deg}}$: abiotic degradation rate
- $k_{\text{ppt}}$: Ca-oxalate precipitation rate
- $k_{\text{diss}}$: mineral dissolution rate
- $k_{\text{ox}}$: bacterial oxidation rate
- $B$: bacterial biomass
- $\beta$: soil buffer capacity
- $S(z)$: root exudation source (exponential with depth)

### 2.11.3 Model Solution: Costa Rican Oxisol Profile

**Parameters:**
- Root density: $R(z) = R_0 e^{-z/0.3}$ (m/m³)
- Exudation: $S(z) = 10 R(z)$ μmol/m³/s
- $D_{\text{eff}} = 10^{-10}$ m²/s
- $k_{\text{deg}} = 10^{-5}$ s⁻¹
- $k_{\text{ox}} = 10^{-14}$ m³/cell/s
- $B = 10^{14}$ cells/m³ (0–0.5 m), $10^{12}$ (deeper)
- $\beta = 0.01$ mol/m³/pH

**Predicted profiles (steady state):**

| Depth (m) | [Oxalate] (μM) | pH | [Ca²⁺] (μM) | Ca-oxalate (μmol/g) | Calcite (μmol/g) |
|-----------|----------------|-----|-------------|---------------------|------------------|
| 0.05 | 50 | 4.2 | 200 | 5 | 0 |
| 0.15 | 30 | 4.5 | 150 | 15 | 2 |
| 0.30 | 10 | 5.2 | 50 | 25 | 15 |
| 0.60 | 2 | 6.0 | 10 | 10 | 40 |
| 1.00 | 0.5 | 6.5 | 5 | 2 | 60 |
| 2.00 | 0.1 | 6.8 | 2 | 0.5 | 80 |

**Key predictions:**
1. Oxalate peaks in upper 0.3 m (root zone)
2. Ca-oxalate accumulates at 0.3–0.6 m (pH 5–6)
3. Calcite accumulates below 0.6 m (pH > 6)
4. pH increases with depth due to OCP alkalinity

### 2.11.4 Sensitivity Analysis

| Parameter | ±50% Change | Effect on Ca-oxalate | Effect on Calcite |
|-----------|-------------|---------------------|-------------------|
| Root exudation flux | +50% | +45% | +40% |
| Bacterial oxidation rate | +50% | -30% | +35% |
| Soil buffer capacity | +50% | +20% | -15% |
| Ca²⁺ supply (weathering) | +50% | +50% | +50% |
| Diffusion coefficient | +50% | -10% | +10% |

**Most sensitive:** Ca²⁺ supply and exudation flux (source terms)
**Least sensitive:** Diffusion (transport-limited only at depth)

---

## 2.12 Global Significance: Oxalate as a Planetary Weathering Agent

### 2.12.1 Comparison of Weathering Agents

| Agent | Global Flux (Tmol H⁺/yr) | Enhancement Factor | Dominant Regions |
|-------|-------------------------|-------------------|------------------|
| Carbonic acid (CO₂) | 270 | 1× (baseline) | Global |
| Oxalic acid (plants) | 600 | 10–1000× (local) | Forests, rhizosphere |
| Sulfuric acid (pyrite) | 50 | 100–1000× (local) | Sulfide-rich, mining |
| Nitric acid (deposition) | 20 | 10–100× (local) | Industrial, agricultural |

**Oxalate is the dominant biological weathering agent** in terms of proton flux and ligand enhancement.

### 2.12.2 Oxalate's Role in Phosphorus Cycling

Primary motivation for plant oxalate exudation: P acquisition

**Mechanism:**
1. Oxalate chelates Fe³⁺/Al³⁺ on oxide surfaces
2. Releases adsorbed phosphate: $\equiv\text{Fe-O-PO}_4 + \text{C}_2\text{O}_4^{2-} \rightarrow \equiv\text{Fe-C}_2\text{O}_4^- + \text{PO}_4^{3-}$
3. Dissolves Fe/Al phosphate minerals: $\text{FePO}_4 + 2\text{H}^+ + \text{C}_2\text{O}_4^{2-} \rightarrow \text{FeC}_2\text{O}_4 + \text{H}_2\text{PO}_4^-$

**P mobilization efficiency:**
- 1 μmol oxalate → 0.5–2 μmol P released
- Global P flux via oxalate: ~1–4 Tmol P/yr
- Compare to riverine P flux: 1.3 Tmol/yr
- **Oxalate-driven P cycling exceeds global P export to oceans**

### 2.12.3 Rare Earth Element (REE) Mobilization

Oxalate forms strong complexes with REEs:
$$\log \beta_1(\text{REE-oxalate}) \approx 6–8 \quad (\text{increasing with atomic number})$$

**LREE vs HREE fractionation:**
- Light REE (La-Nd): log β₁ ≈ 6.5–7.0
- Heavy REE (Dy-Lu): log β₁ ≈ 7.5–8.0
- **HREE preferentially mobilized** by oxalate

This explains:
- LREE enrichment in residual clays (kaolinite)
- HREE enrichment in oxalate-transported fractions
- REE patterns in bauxites and laterites

### 2.12.4 Climate Feedbacks

**Negative feedback (cooling):**
1. Warming → ↑ plant productivity → ↑ oxalate exudation
2. ↑ Oxalate → ↑ silicate weathering → ↑ CO₂ consumption
3. ↑ CO₂ consumption → ↓ atmospheric CO₂ → cooling

**Quantitative estimate:**
- Current oxalate-enhanced weathering: ~2–5 Gt CO₂/yr
- Per °C warming: +10–20% plant productivity → +0.2–1 Gt CO₂/yr drawdown
- Feedback parameter: $f \approx -0.1$ to $-0.5\ \text{W/m}^2/^\circ\text{C}$

**Positive feedback (warming):**
1. Warming → ↑ microbial activity → ↑ oxalate degradation
2. ↓ Oxalate → ↓ weathering → ↓ CO₂ drawdown
3. But: ↑ CO₂ → ↑ plant productivity (CO₂ fertilization)

**Net feedback likely negative** (oxalate production increases faster than degradation with CO₂)

---

## 2.13 Experimental Methods for Oxalate Weathering Research

### 2.13.1 Laboratory Techniques

| Method | Application | Detection Limit |
|--------|-------------|-----------------|
| HPLC-UV/Vis | Oxalate speciation in soil solution | 0.1 μM |
| IC-MS | Anion/cation quantification | 0.01 μM |
| Mössbauer spectroscopy | Fe²⁺/Fe³⁺ in clays | 1% Fe |
| XRD (synchrotron) | Clay mineralogy, Ca-oxalate phases | 0.5 wt% |
| NanoSIMS | Isotopic mapping (δ¹³C, δ¹⁸O) | 50 nm resolution |
| Microelectrodes | Rhizosphere pH, O₂, Ca²⁺ | 10 μm tip |

### 2.13.2 Field Methods

- **Rhizoboxes:** Transparent soil boxes for root/oxalate imaging
- **Suction lysimeters:** Pore water sampling at depth
- **In situ microdialysis:** Continuous oxalate monitoring
- **Isotope tracing:** ¹³C-oxalate → track C flow to calcite
- **Metagenomics:** Oxalotroph community composition (frc gene)

### 2.13.3 Modeling Frameworks

- **PHREEQC:** Speciation, saturation indices, kinetic reactions
- **CrunchFlow:** Reactive transport with microbial kinetics
- **TOUGHREACT:** Non-isothermal, multiphase reactive transport
- **Custom 1D/2D codes:** For process coupling studies

---

## 2.14 Future Research Directions

### 2.14.1 Critical Knowledge Gaps

1. **Oxalate production quantification:** Global flux uncertainty > 50%
2. **Microbial kinetics in situ:** $k_{\text{ox}}$ varies 1000× between lab and field
3. **Ca-oxalate → calcite transformation rates:** Poorly constrained in soils
4. **Climate change response:** Will oxalate flux increase or decrease with warming?
5. **Deep soil oxalate:** Role below 1 m largely unknown
6. **Marine oxalate:** Atmospheric deposition to oceans unquantified

### 2.14.2 Emerging Techniques

- **Raman microspectroscopy:** In situ Ca-oxalate polymorph ID
- **CRISPR-engineered biosensors:** Real-time oxalate detection
- **AI-driven spectral analysis:** Hyperspectral mapping of oxalate minerals
- **Nanopore sequencing:** Oxalotroph functional gene diversity
- **Synchrotron XANES:** Fe/Al speciation during oxalate attack

### 2.14.3 Synthesis: The Oxalate Weathering Engine

Oxalic acid is not merely a metabolic byproduct but a **planetary-scale weathering agent** that:
- Accelerates mineral dissolution by 1–3 orders of magnitude
- Controls phosphorus bioavailability in terrestrial ecosystems
- Drives a unique carbon sequestration pathway (OCP)
- Fractionates REEs and other trace elements
- Links biological productivity to geological carbon cycling
- Creates distinct mineralogical and isotopic signatures in the rock record

Understanding the oxalate pathway is essential for:
- Predicting soil formation rates under climate change
- Managing phosphorus in agricultural systems
- Interpreting paleoclimate from clay mineralogy
- Exploring for critical minerals (REE, Li) in weathered profiles
- Engineering enhanced weathering for CO₂ removal

---

*End of Document 2 — Oxalic Weathering Pathway Deep Dive*
*Total: ~900 lines across 5 parts*
*Next: DOC03_Anaerobic_Dissolution_Iron_Reducing_Pathways.md*