# DOCUMENT 2: Oxalic Weathering Pathway Deep Dive
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

*End of Part 3 — Continue to Part 4: Oxalate-Carbonate Pathway (OCP) and Bacterial Metabolism Stoichiometry*