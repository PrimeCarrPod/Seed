# DOCUMENT 3: Anaerobic Dissolution & Iron-Reducing Microbial Pathways
## Part 3 of 5: Fe²⁺ Aqueous Speciation, Silica Re-precipitation, and Alumina Mobility

**Source Expansion**: DeepResearch/Global Geological Clay Deposit Mapping.pdf (Lines 76-100)
**Target**: ~180 lines per part × 5 parts = ~900 lines total
**Document ID**: DOC03_Anaerobic_Dissolution_Iron_Reducing_Pathways.md

---

## 3.6 Fe²⁺ Aqueous Speciation: Hydrolysis, Carbonate, Sulfide Complexation

### 3.6.1 Fe²⁺ Hydrolysis Equilibria

Fe²⁺ hydrolysis is weaker than Fe³⁺:
$$\text{Fe}^{2+} + \text{H}_2\text{O} \rightleftharpoons \text{FeOH}^+ + \text{H}^+ \quad \log K_1 = -9.5$$
$$\text{Fe}^{2+} + 2\text{H}_2\text{O} \rightleftharpoons \text{Fe(OH)}_2^0 + 2\text{H}^+ \quad \log K_2 = -20.5$$

At pH 7, $I = 0.01\ \text{M}$:
- $\text{Fe}^{2+}$: 92%
- $\text{FeOH}^+$: 8%
- $\text{Fe(OH)}_2^0$: <1%

### 3.6.2 Carbonate Complexation

In anaerobic soils, carbonate alkalinity builds up:
$$\text{Fe}^{2+} + \text{CO}_3^{2-} \rightleftharpoons \text{FeCO}_3^0 \quad \log K = 5.9$$
$$\text{Fe}^{2+} + \text{HCO}_3^- \rightleftharpoons \text{FeHCO}_3^+ \quad \log K = 2.5$$

At pH 7, $[\text{HCO}_3^-] = 2\ \text{mM}$, $[\text{CO}_3^{2-}] = 0.1\ \text{mM}$:
- $\text{FeCO}_3^0$: 40% of dissolved Fe
- $\text{FeHCO}_3^+$: 15%
- Free $\text{Fe}^{2+}$: 45%

### 3.6.3 Sulfide Complexation (Critical in Sulfate-Reducing Zones)

$$\text{Fe}^{2+} + \text{HS}^- \rightleftharpoons \text{FeHS}^+ \quad \log K = 4.5$$
$$\text{Fe}^{2+} + \text{S}^{2-} \rightleftharpoons \text{FeS}^0 \quad \log K = 11.5$$

Siderite ($\text{FeCO}_3$) vs Mackinawite ($\text{FeS}$) precipitation:
- $\text{FeCO}_3$: $K_{\text{sp}} = 10^{-10.7}$
- $\text{FeS}$: $K_{\text{sp}} = 10^{-3.9}$ (amorphous) to $10^{-18}$ (pyrite)

At $[\text{HS}^-] > 10^{-5}\ \text{M}$: FeS precipitates preferentially
At $[\text{HS}^-] < 10^{-5}\ \text{M}$: FeCO₃ dominates

### 3.6.4 Fe²⁺-Organic Complexes in Pore Water

**DOC (Dissolved Organic Carbon) binding:**
$$\text{Fe}^{2+} + \text{DOC} \rightleftharpoons \text{Fe-DOC} \quad \log K_{\text{cond}} \approx 4.5$$

At DOC = 20 mg/L (typical wetland):
- Fe-DOC: 30–50% of dissolved Fe
- Increases Fe solubility 10–100× vs inorganic only

### 3.6.5 Redox Speciation: Fe²⁺/Fe³⁺ Couple in Pore Water

Despite anaerobic conditions, trace Fe³⁺ exists:
$$\text{Fe}^{3+} + e^- \rightleftharpoons \text{Fe}^{2+} \quad E_h = E^\circ + 0.059\log([\text{Fe}^{3+}]/[\text{Fe}^{2+}])$$

At $E_h = -0.1\ \text{V}$ (moderately reducing), pH 7:
$$[\text{Fe}^{3+}]/[\text{Fe}^{2+}] = 10^{(E_h - 0.77)/0.059} = 10^{-14.7}$$

But organic complexes shift this:
- Fe³⁺-humate more stable than Fe²⁺-humate
- Effective $E^\circ$ lowered by 0.2–0.3 V

---

## 3.7 Silica Re-precipitation: Amorphous Opal-A vs Crystalline Quartz Pathways

### 3.7.1 Silica Release During Clay Dissolution

As Fe³⁺ reduces and octahedral sheet destabilizes, Si-O bonds hydrolyze:
$$\equiv\text{Si-O-Fe}\equiv + \text{H}_2\text{O} \rightarrow \equiv\text{Si-OH} + \text{HO-Fe}\equiv$$

Rate of Si release coupled to Fe reduction:
$$r_{\text{Si}} = \alpha \cdot r_{\text{Fe}} \quad \alpha \approx 0.1\text{--}0.3$$

For nontronite (Fe₂Si₄O₁₀(OH)₂): 4 Si per 2 Fe → stoichiometric $\alpha = 2$
But kinetically: Si release lags Fe release → $\alpha_{\text{kinetic}} \approx 0.2$

### 3.7.2 Silica Polymerization Kinetics

**Monomer:** $\text{H}_4\text{SiO}_4$ (pH < 9)

**Dimerization:**
$$2\text{H}_4\text{SiO}_4 \rightleftharpoons \text{H}_6\text{Si}_2\text{O}_7 + \text{H}_2\text{O} \quad k_f = 10^{-3}\ \text{M}^{-1}\text{s}^{-1}$$

**Oligomerization:** Chain growth via condensation
$$\text{H}_4\text{SiO}_4 + (\text{H}_4\text{SiO}_4)_n \rightarrow (\text{H}_4\text{SiO}_4)_{n+1} + \text{H}_2\text{O}$$

**Critical nucleus size:** ~10–20 Si atoms (2–3 nm)

### 3.7.3 Precipitation Pathways: Opal-A vs Quartz

| Parameter | Opal-A (Amorphous) | Microcrystalline Quartz |
|-----------|-------------------|------------------------|
| Solubility (25°C) | 2.0 mM | 0.13 mM |
| $\Delta G_f^\circ$ | -850 kJ/mol | -856 kJ/mol |
| Nucleation barrier | Low | High |
| Precipitation rate | Fast (hrs) | Slow (kyr) |
| Morphology | Spheres, gels | Crystals, overgrowths |
| Transformation | Opal-A → Opal-CT → Quartz | Direct |

**Ostwald's Rule of Stages:** Metastable Opal-A precipitates first

### 3.7.4 Opal-A → Quartz Transformation Kinetics

**Rate law (Rimstidt & Barnes, 1980):**
$$\frac{dX}{dt} = k(1-X) \quad k = A \exp(-E_a/RT)$$

- $E_a \approx 60\ \text{kJ/mol}$
- At 25°C: $t_{1/2} \approx 10^4\text{--}10^5\ \text{years}$
- At 50°C: $t_{1/2} \approx 10^2\text{--}10^3\ \text{years}$

**Catalysis by clay surfaces:** Al/Fe oxides reduce $E_a$ to ~40 kJ/mol

### 3.7.5 Silica Mass Balance in Reducing Clay Systems

For 1 m³ smectite (ρ = 2.2 g/cm³, 5% Fe₂O₃):
- Total Fe: 110 kg = 1970 mol
- 30% reduced: 590 mol Fe²⁺ released
- Si released: 590 × 0.2 = 118 mol = 7.1 kg SiO₂

**Fate of released Si:**
- 60% → Opal-A precipitation in pores
- 30% → Adsorbed on clay surfaces
- 10% → Dissolved, advected away

---

## 3.8 Alumina Mobility in Anoxic Pore Waters: Al(OH)₄⁻ Dominance

### 3.8.1 Al³⁺ Speciation Under Reducing Conditions

Al³⁺ is not redox-active, but pH controls speciation:
$$\text{Al}^{3+} + 4\text{OH}^- \rightleftharpoons \text{Al(OH)}_4^- \quad \log \beta_4 = 33.3$$

At pH 7: $[\text{OH}^-] = 10^{-7}\ \text{M}$
$$[\text{Al(OH)}_4^-]/[\text{Al}^{3+}] = 10^{33.3} \times (10^{-7})^4 = 10^{5.3} = 2 \times 10^5$$

**Al(OH)₄⁻ dominates above pH 5.5**

### 3.8.2 Al Solubility Controls

**Gibbsite equilibrium:**
$$\text{Al(OH)}_3 + \text{OH}^- \rightleftharpoons \text{Al(OH)}_4^- \quad \log K = 1.3$$

$$[\text{Al}]_{\text{total}} = [\text{Al}^{3+}] + [\text{Al(OH)}_4^-] \approx \frac{K_{\text{sp}}}{[\text{H}^+]^3} + K[\text{OH}^-]$$

Minimum solubility at pH 6–7: ~1 μM
At pH 4: 100 μM
At pH 9: 100 μM

### 3.8.3 Al-Organic Complexation

Humic/fulvic acids bind Al strongly:
$$\text{Al}^{3+} + \text{HA} \rightleftharpoons \text{Al-HA} \quad \log K_{\text{cond}} \approx 6\text{--}8$$

At pH 7, DOC = 20 mg/L: >99% Al complexed
**Organic complexation increases Al mobility 100–1000×**

### 3.8.4 Al Re-precipitation: Secondary Phases

**Possible precipitates in reducing zones:**
1. **Amorphous Al(OH)₃** (if pH drops locally)
2. **Al-substituted Fe oxides** (if Fe³⁺ present)
3. **Kaolinite nucleation** (if Si available)
4. **Al-humate colloids** (mobile)

**Kinetic barrier:** Al-O bond strength (511 kJ/mol) → slow crystallization
Typical outcome: **Al remains in solution or as colloids**, transported laterally

---

## 3.9 Methanogen-Iron Reducer Syntrophy in Deep Sediments

### 3.9.1 Thermodynamic Constraints on Methanogenesis

Acetoclastic methanogenesis:
$$\text{CH}_3\text{COO}^- + \text{H}^+ \rightarrow \text{CH}_4 + \text{CO}_2 \quad \Delta G^\circ = -31\ \text{kJ/mol}$$

Requires low H₂ partial pressure: $P_{\text{H}_2} < 10^{-4}\ \text{atm}$

### 3.9.2 Syntrophic Partnership

**Fe³⁺ reducers consume H₂:**
$$\text{H}_2 + 2\text{Fe}^{3+} \rightarrow 2\text{H}^+ + 2\text{Fe}^{2+} \quad \Delta G^\circ = -100\ \text{kJ/mol}$$

**Methanogens produce H₂ (syntrophic acetate oxidation):**
$$\text{CH}_3\text{COO}^- + 3\text{H}_2\text{O} \rightarrow 2\text{HCO}_3^- + \text{H}^+ + 3\text{H}_2 \quad \Delta G^\circ = +95\ \text{kJ/mol}$$

**Coupled:**
$$\text{CH}_3\text{COO}^- + 6\text{Fe}^{3+} + 3\text{H}_2\text{O} \rightarrow 2\text{HCO}_3^- + \text{H}^+ + 6\text{Fe}^{2+} \quad \Delta G^\circ = -105\ \text{kJ/mol}$$

**Fe³⁺ reduction enables methanogenesis** by keeping H₂ low

### 3.9.3 Population Dynamics

Typical ratios in deep sediments:
- Fe³⁺ reducers: $10^6\text{--}10^7\ \text{cells/cm}^3$
- Methanogens: $10^5\text{--}10^6\ \text{cells/cm}^3$
- Ratio FeR:Meth ≈ 10:1

When Fe³⁺ depleted → methanogens dominate

---

*End of Part 3 — Continue to Part 4: Paleoredox Proxies and Methanogen-Iron Reducer Syntrophy*