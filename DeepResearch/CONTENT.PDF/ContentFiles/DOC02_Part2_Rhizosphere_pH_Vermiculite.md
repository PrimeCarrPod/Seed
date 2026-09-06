# DOCUMENT 2: Oxalic Weathering Pathway Deep Dive
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

*End of Part 2 — Continue to Part 3: Magnesium Release Stoichiometry vs Fe²⁺/Fe³⁺ Octahedral Dissolution*