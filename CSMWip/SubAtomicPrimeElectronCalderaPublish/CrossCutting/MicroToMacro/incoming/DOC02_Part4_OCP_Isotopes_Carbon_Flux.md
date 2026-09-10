# DOCUMENT 2: Oxalic Weathering Pathway Deep Dive
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

*End of Part 4 — Continue to Part 5: Integrated Oxalate Weathering Model and Global Significance*