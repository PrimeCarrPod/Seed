# Document 4: Microbial Loop, Carbon Pumps, and DOM Assimilation Dynamics
## Piece 1: Foundations of the Microbial Loop and Carbon Flow

The **microbial loop** (Azam et al., 1983; Pomeroy, 1974) is the central carbon processing pathway in aquatic and many terrestrial microbial ecosystems. It describes the flow of dissolved organic carbon (DOC) from primary producers → heterotrophic bacteria → protistan grazers → higher trophic levels, with massive respiratory losses at each step.

### 1.1 Carbon Flow Partitioning

**Primary production (PP)** partitions into:
```
PP = POC_production + DOC_exudation
```
- **POC_production**: Particulate organic carbon (cells, colonies, aggregates) → sinking, grazing
- **DOC_exudation**: Dissolved organic carbon → microbial loop

**Exudation fraction** (f_exudate = DOC_exudation / PP):
- Oligotrophic: 0.1-0.3 (low nutrient, high light stress)
- Eutrophic: 0.05-0.15 (nutrient-replete, lower stress)
- Bloom senescence: 0.3-0.5 (lysis, viral shunt)

**DOC composition**:
- Labile DOC (LDOC): Turnover hours-days, low molecular weight (amino acids, sugars, organic acids)
- Semi-labile DOC: Turnover weeks-months
- Refractory DOC (RDOC): Turnover millennia, high molecular weight, aromatic

### 1.2 Bacterial Growth Efficiency (BGE)

**Definition**: BGE = Bacterial Production (BP) / Bacterial Carbon Demand (BCD)
where BCD = BP + Bacterial Respiration (BR)

**Mathematically**:
```
BGE = BP / (BP + BR) = 1 / (1 + BR/BP)
```

**BP** = μ_B × B_B (bacterial growth rate × biomass)
**BR** = q_O2 × B_B (respiration rate × biomass) or CO₂ production

**Typical BGE values**:
- Lab cultures (rich media): 0.4-0.6
- Coastal oceans: 0.1-0.3
- Open ocean gyres: 0.05-0.15
- Deep sea: 0.01-0.05
- Soils: 0.3-0.6 (but mostly growth on polymers, not DOC)

**BGE controls**:
- **Substrate quality** (C:N, C:P): High C:nutrient → low BGE (more C respired per nutrient acquired)
- **Temperature**: BGE decreases with T (respiration Q₁₀ > growth Q₁₀)
- **Nutrient availability**: N,P limitation → lower BGE (overflow metabolism)
- **Community composition**: Different taxa have different intrinsic BGE

### 1.3 BGE as a Function of Substrate Stoichiometry

**Theoretical basis** (Goldman et al., 1987; del Giorgio & Cole, 1998):

Bacterial biomass C:N:P ≈ 50:10:1 (or 60:10:1, variable)
Substrate C:N:P = R_C:N:P

**Nutrient demand** for growth:
```
N_demand = BP / (C:N)_biomass
P_demand = BP / (C:P)_biomass
```

**Nutrient supply** from substrate:
```
N_supply = BCD × (N/C)_substrate
P_supply = BCD × (P/C)_substrate
```

At steady state: N_supply = N_demand + N_excretion, P_supply = P_demand + P_excretion

**BGE limited by most limiting nutrient**:
```
BGE = min { BGE_C, BGE_N, BGE_P }
BGE_N = (N/C)_substrate / (N/C)_biomass × Y_max,N
BGE_P = (P/C)_substrate / (P/C)_biomass × Y_max,P
```

Where Y_max is the maximum BGE when nutrient is non-limiting (≈ 0.5-0.6).

**Result**: BGE decreases as substrate C:N or C:P increases above biomass ratio. This is the **stoichiometric constraint on carbon use efficiency**.

### 1.4 Microbial Loop Efficiency

**Transfer efficiency** from bacteria to protists:
```
ε_loop = BGE × ε_grazing × ε_assimilation
```
- BGE: 0.05-0.3 (bacteria)
- ε_grazing: 0.1-0.3 (fraction of bacterial production grazed)
- ε_assimilation: 0.3-0.6 (protist assimilation efficiency)

**Overall**: ε_loop ≈ 0.002-0.05 (0.2% to 5% of DOC reaches protists)

**Link vs Sink debate** (Ducklow, 2000; Legendre & Rivkin, 2002):
- **Link**: Microbial loop returns C to higher trophic levels (via protists)
- **Sink**: Microbial loop respires most C, retains nutrients in euphotic zone

**Resolution**: It is BOTH — a **leaky link**. The "leakiness" is quantified by:
```
f_respired = 1 - ε_loop
f_nutrient_retained = (1 - BGE) × (nutrient demand/supply)
```

### 1.5 Carbon Pumps

Three major pumps export carbon from surface ocean:

#### 1.5.1 Biological Carbon Pump (BCP)
- **Mechanism**: Gravitational sinking of POC (cells, fecal pellets, aggregates)
- **Export flux**: ~10-15 Pg C/yr globally
- **Attenuation**: Martin curve: Flux(z) = Flux₀ × (z/z₀)^{-b}, b ≈ 0.8-1.2
- **Key players**: Diatoms (silica ballast), coccolithophores (CaCO₃ ballast), fecal pellets

#### 1.5.2 Microbial Carbon Pump (MCP)
- **Mechanism**: Bacterial transformation of labile DOC → refractory DOC (RDOC)
- **Production**: ~0.2-0.5 Pg C/yr (RDOC production rate)
- **Reservoir**: ~660 Pg C (RDOC pool, comparable to atmospheric CO₂)
- **Timescale**: τ_RDOC ≈ 4000-6000 years
- **Key process**: Bacterial reworking + selective preservation

#### 1.5.3 Carbonate Pump (CaCO₃ Pump)
- **Mechanism**: Calcification by coccolithophores, foraminifera, pteropods
- **Export**: ~1-2 Pg C/yr as CaCO₃ (0.5-1 Pg C as CaCO₃-C)
- **Counter pump**: CaCO₃ dissolution releases CO₂ (reduces alkalinity pump efficiency)
- **Ballast effect**: CaCO₃ and opal increase POC sinking speed

### 1.6 Coupling of Pumps via Microbial Loop

**MCP-BCP coupling**: 
- Bacterial processing of DOC → RDOC (MCP) + CO₂ + bacterial biomass
- Bacterial biomass → protists → fecal pellets → BCP
- Viral lysis → DOM → MCP + bacterial substrate

**MCP-BCP-Carbonate coupling**:
- Coccolithophores produce CaCO₃ (ballast) + POC + DOC
- DOC → MCP (RDOC)
- POC + CaCO₃ → BCP (enhanced sinking)
- **Rain ratio** (CaCO₃:POC) affects BCP efficiency

**Mathematical coupling** (steady-state surface box):
```
d[DOC]/dt = Exudation + Lysis + Sloppy_feeding - Uptake_B - Photodegradation
d[POC]/dt = PP - Sinking - Grazing - Lysis
d[RDOC]/dt = f_MCP × Uptake_B - Dilution
d[CaCO₃]/dt = Calcification - Dissolution - Sinking
```
## Piece 2: DOM Dynamics, Lability Spectrum, and RDOC Formation

### 2.1 DOM Lability Continuum

DOC is not a single pool but a **spectrum of lability**. The **reactivity continuum model** (Burdige, 2007; Amon & Benner, 1996):

**Reactivity distribution**: 
```
k ~ f(k) = a k^{-β}  (power-law distribution of rate constants)
```
or discrete pools:
```
DOC = Σ_i DOC_i, each with decay rate k_i
```

**Typical pool structure** (3-pool model):
| Pool | Fraction of DOC | Turnover time | Examples |
|---|---|---|---|
| Labile (LDOC) | 1-5% | Hours-days | Amino acids, monosaccharides, organic acids |
| Semi-labile | 10-30% | Weeks-months | Oligosaccharides, peptides, some humics |
| Refractory (RDOC) | 70-90% | Centuries-millennia | Humic substances, black carbon, aromatic polymers |

**Operationally defined** by:
- **Biological lability**: BOD (biochemical oxygen demand) over 5-30 days
- **Photochemical lability**: Loss under UV exposure
- **Chemical characterization**: FT-ICR MS, NMR, optical properties (SUVA, S_R)

### 2.2 DOC Uptake Kinetics

**Bacterial uptake** follows Michaelis-Menten per compound, but integrated over spectrum:

```
Uptake = Σ_i V_max,i [DOC_i] / (K_s,i + [DOC_i])
```

**Composite kinetics** for bulk DOC:
```
Uptake = V_max,eff [DOC] / (K_s,eff + [DOC])
```
where V_max,eff and K_s,eff depend on community composition and DOC quality.

**DOC quality indices**:
- **C:N ratio**: Low C:N (≈ 5-10) = labile; High C:N (> 20) = refractory
- **C:P ratio**: Similar pattern
- **Aromaticity (SUVA₂₅₄)**: High = more refractory
- **Molecular weight**: Low MW = more labile

### 2.3 RDOC Formation Mechanisms

**Microbial Carbon Pump (MCP)** (Jiao et al., 2010) produces RDOC via:

#### 2.3.1 Selective Preservation
Bacteria preferentially consume labile compounds, leaving refractory ones:
```
d[DOC_lab]/dt = -k_lab [DOC_lab]
d[DOC_ref]/dt = -k_ref [DOC_ref] + (1 - BGE) k_lab [DOC_lab]  (partial transformation)
```
If k_ref << k_lab, refractory accumulates.

#### 2.3.2 Microbial Transformation (Neogenesis)
Bacteria **synthesize** refractory compounds:
- **Exopolysaccharides (EPS)**: Capsular, structural
- **Peptidoglycan fragments**: Cell wall turnover
- **Siderophores**: Fe-binding compounds (some refractory)
- **Quorum sensing molecules**: AHLs, AI-2 (some persistent)
- **Extracellular enzymes**: Denatured, persistent

**Transformation rate**: f_trans × Bacterial Production
where f_trans ≈ 0.1-0.3 (fraction of BP converted to RDOC)

#### 2.3.3 Viral Lysis and Sloppy Feeding
- **Viral shunt**: Cell lysis releases intracellular DOM (proteins, nucleic acids, lipids)
  - Some labile → rapid bacterial uptake
  - Some refractory (DNA, membrane lipids) → RDOC
- **Sloppy feeding**: Protists release DOM during grazing (10-30% of ingested)
  - Fragmented cells, partially digested material
  - Enriches semi-labile and refractory pools

#### 2.3.4 Photochemical Alteration
- UV radiation breaks down refractory → labile (priming effect)
- UV also polymerizes labile → refractory (condensation reactions)
- Net effect: Complex, depth-dependent

### 2.4 Mathematical Model of RDOC Accumulation

**Steady-state RDOC** in a box model:
```
d[RDOC]/dt = P_RDOC - [RDOC]/τ_mixing
P_RDOC = f_MCP × BP
f_MCP = f_0 + f_1 (C:N)_DOM + f_2 (1 - BGE) + f_3 T
```

At steady state: [RDOC]* = P_RDOC × τ_mixing

**Global RDOC reservoir**:
- Ocean volume: 1.34×10¹⁸ m³
- [RDOC] ≈ 40-50 μM C
- Total RDOC = 660-800 Pg C
- τ_mixing ≈ 1000 years (deep ocean ventilation)
- P_RDOC ≈ 0.2-0.5 Pg C/yr (consistent with [RDOC]* = P_RDOC × τ)

### 2.5 DOM Stoichiometry and Bacterial Nutrient Limitation

**DOM C:N:P ratios** control bacterial nutrient status:
- **C:N < 10**: N-sufficient, C-limited → high BGE
- **C:N > 20**: N-limited → low BGE, high respiration
- **C:P < 50**: P-sufficient
- **C:P > 300**: P-limited → very low BGE

**Bacterial nutrient limitation** feeds back on DOM composition:
- N-limited bacteria: Excrete excess C → DOM C:N increases
- P-limited bacteria: Excrete excess C,N → DOM C:P, N:P increase
- **Microbial loop as nutrient buffer**: Retains N,P in euphotic zone via bacterial biomass

### 2.6 Seasonal and Spatial DOM Dynamics

**Spring bloom progression**:
1. Pre-bloom: Low DOC, high nutrients
2. Bloom: High PP → high exudation → LDOC accumulation
3. Post-bloom: Bacterial bloom consumes LDOC → RDOC production
4. Summer: Low nutrients, RDOC dominates, low bacteria
5. Fall mixing: Nutrient injection, new bloom cycle

**Vertical profiles**:
- Surface: High LDOC (fresh exudation), active bacteria
- Mesopelagic (200-1000m): Declining LDOC, accumulating RDOC, slow bacteria
- Deep (>1000m): Almost pure RDOC, ultra-slow turnover (apparent age 4000-6000 yr)

**Horizontal gradients**:
- Coastal: High DOC (terrestrial + marine), low C:N (labile)
- Open ocean: Lower DOC, high C:N (refractory)
- Upwelling: High labile DOC (fresh production)
- Gyres: Highest RDOC accumulation

### 2.7 Analytical Approaches for DOM Characterization

1. **FT-ICR MS** (Fourier Transform Ion Cyclotron Resonance Mass Spectrometry):
   - Molecular formula assignment (C_c H_h O_o N_n S_s P_p)
   - Van Krevelen diagrams (H/C vs O/C)
   - Aromaticity index (AI_mod)

2. **Excitation-Emission Matrix (EEM) Fluorescence**:
   - Protein-like (tyrosine, tryptophan): Labile
   - Humic-like (fulvic, humic acids): Refractory
   - PARAFAC components: C1-C5 typical

3. **NMR** (Nuclear Magnetic Resonance):
   - Functional group quantification
   - Aliphatic vs aromatic C

4. **Radiocarbon (¹⁴C)**:
   - Δ¹⁴C of DOC: Surface ≈ +50‰ (modern), Deep ≈ -200‰ (aged)
   - RDOC age: 4000-6000 years BP

### 2.8 Bridge to Piece 3

Piece 3 will cover **Bacterial Growth Efficiency (BGE) theory**, its temperature dependence, nutrient limitation effects, and integration into ecosystem models.

## Piece 3: Bacterial Growth Efficiency — Theory, Temperature Dependence, and Nutrient Controls

### 3.1 Theoretical Foundations of BGE

**BGE definition revisited**:
```
BGE = Bacterial Production (BP) / Bacterial Carbon Demand (BCD)
    = 1 / (1 + Respiration/Production)
    = 1 / (1 + R/P)
```

**R/P ratio** (respiration to production) is the key determinant:
- R/P = 0 → BGE = 1 (theoretical maximum, impossible)
- R/P = 1 → BGE = 0.5
- R/P = 4 → BGE = 0.2
- R/P = 9 → BGE = 0.1

**Why do bacteria respire?** Three fundamental reasons:
1. **Energy generation**: Catabolism (respiration) produces ATP for anabolism (biosynthesis)
2. **Overflow metabolism**: When C is in excess relative to nutrients, excess C is respired
3. **Maintenance costs**: Turnover, motility, osmoregulation, stress responses

### 3.2 Metabolic Basis of BGE

**ATP yield per C oxidized**:
- Aerobic respiration (glucose): ~30 ATP / 6 C = 5 ATP/C
- Anaerobic respiration (NO₃⁻): ~20-25 ATP / 6 C = 3-4 ATP/C
- Fermentation: 2-4 ATP / 6 C = 0.3-0.7 ATP/C

**ATP cost of biosynthesis** (per C incorporated):
- Protein: ~4 ATP/peptide bond × 400 aa / 110 Da/aa ≈ 14.5 ATP/C
- RNA: ~2 ATP/nucleotide × 4 bases / 340 Da ≈ 2.4 ATP/C
- DNA: ~2 ATP/nucleotide × 2 strands / 660 Da ≈ 0.6 ATP/C
- Lipid: ~7 ATP/acetyl-CoA × 2 C / 300 Da ≈ 4.7 ATP/C
- Polysaccharide: ~1 ATP/glucose / 180 Da ≈ 0.6 ATP/C

**Weighted average** (typical biomass): ~8-12 ATP/C incorporated

**Theoretical maximum BGE** (aerobic):
```
BGE_max = (ATP yield per C) / (ATP cost per C)
        ≈ 5 / 10 = 0.5
```

**Actual BGE** lower due to:
- Maintenance ATP not coupled to growth
- Overflow respiration
- Inefficiencies in transport, regulation

### 3.3 Temperature Dependence of BGE

**Empirical pattern**: BGE decreases with temperature (approx. -0.01 to -0.03 per °C)

**Mechanistic explanation** (Metabolic Theory of Ecology):
- Respiration rate: R = R₀ exp(-E_R / RT)
- Growth rate: μ = μ₀ exp(-E_μ / RT)
- Activation energies: E_R ≈ 0.65 eV, E_μ ≈ 0.3-0.4 eV (typically E_R > E_μ)

**BGE(T) = μ(T) / (μ(T) + R(T))**

Since E_R > E_μ, R increases faster than μ with T → BGE decreases.

**Arrhenius formulation**:
```
BGE(T) = 1 / (1 + (R₀/μ₀) exp(-(E_R - E_μ)/RT))
```

**Typical parameters**:
- R₀/μ₀ ≈ 3-10 (R/P at reference T)
- E_R - E_μ ≈ 0.2-0.3 eV
- Result: BGE drops from ~0.3 at 5°C to ~0.1 at 25°C

**Q₁₀ values**:
- Respiration Q₁₀ ≈ 2-3
- Growth Q₁₀ ≈ 1.5-2
- BGE Q₁₀ ≈ 0.6-0.8 (decreases with T)

### 3.4 Nutrient Limitation Effects on BGE

**Nitrogen limitation**:
- Low N → low protein synthesis → low ribosome content → low μ
- Excess C (relative to N) → overflow respiration
- **BGE vs N:C supply**: 
  ```
  BGE = BGE_max × min(1, (N:C)_supply / (N:C)_demand)
  ```
  where (N:C)_demand ≈ 0.2 (biomass N:C)

**Phosphorus limitation**:
- Low P → low RNA synthesis (ribosomes, tRNA) → low translation capacity
- RNA is P-rich (9% P by weight) → P limitation strongly reduces μ
- **BGE vs P:C supply**:
  ```
  BGE = BGE_max × min(1, (P:C)_supply / (P:C)_demand)
  ```
  where (P:C)_demand ≈ 0.01-0.02

**Co-limitation**: When both N and P low, BGE drops multiplicatively or by Liebig's law.

### 3.5 Substrate Quality Effects (C:N:P of DOM)

**DOM stoichiometry** directly controls BGE:

| DOM Type | C:N | C:P | Expected BGE | Mechanism |
|---|---|---|---|---|
| Fresh algal exudate | 5-10 | 30-60 | 0.3-0.5 | Nutrient-rich, labile |
| Bacterial reprocessed | 10-20 | 100-200 | 0.1-0.3 | N,P depleted |
| Terrestrial humic | 20-50 | 500-2000 | 0.01-0.1 | Very nutrient-poor |
| Refractory marine | 15-30 | 200-500 | 0.05-0.2 | Aged, partially processed |

**Mathematical formulation** (del Giorgio & Cole, 1998):
```
BGE = BGE_max / (1 + (C:N)_DOM / (C:N)_crit × (1 - BGE_max))
```
where (C:N)_crit ≈ 10-15 (threshold where BGE = 0.5 BGE_max)

### 3.6 Community-Level BGE

**BGE varies by phylogenetic group**:
| Group | Typical BGE | Traits |
|---|---|---|
| SAR11 (Pelagibacter) | 0.05-0.15 | Streamlined genome, high affinity, low BGE |
| Roseobacter | 0.15-0.3 | Versatile, can use DMSP, moderate BGE |
| Bacteroidetes | 0.2-0.4 | Polymer degraders, higher BGE on complex substrates |
| Actinobacteria | 0.2-0.4 | Soil/freshwater, high BGE |
| Gammaproteobacteria | 0.15-0.35 | Opportunistic, variable BGE |

**Community BGE** = Σ (f_i × BGE_i) where f_i = fraction of production by group i.

**Succession effect**: Early bloom → high BGE taxa (copiotrophs); Late bloom → low BGE taxa (oligotrophs).

### 3.7 BGE in Ecosystem Models

**Parameterization approaches**:

1. **Constant BGE**: Simple, but inaccurate (BGE = 0.1-0.3)
2. **Temperature-dependent**: BGE = BGE_ref × exp(-E_BGE/R (1/T - 1/T_ref))
3. **Substrate-quality dependent**: BGE = f(C:N, C:P)
4. **Nutrient-limitation dependent**: BGE = f(N:C_demand, P:C_demand)
5. **Mechanistic (DEB/Droop-based)**: 
   ```
   BGE = 1 / (1 + m/μ + R_overflow/μ)
   ```
   where m = maintenance, R_overflow = overflow respiration

**Recommended for global models**: Combination of T + nutrient limitation:
```
BGE = BGE_max × f_T(T) × min(f_N(N_quota), f_P(P_quota))
f_T(T) = exp(-E_BGE/R (1/T - 1/T_ref))
f_N = Q_N / (Q_N + K_N)  (Droop-like for bacterial quota)
```

### 3.8 BGE and Carbon Sequestration

**Low BGE → more respiration → less carbon export**:
- High BGE: More bacterial biomass → more grazing → fecal pellets → BCP export
- Low BGE: More CO₂ → stays in surface → outgasses to atmosphere

**MCP connection**: Low BGE → more C respired per unit nutrient → but also more transformation to RDOC?
Actually: **f_RDOC ≈ 1 - BGE** (simplified). Carbon not used for growth becomes DOM → some becomes RDOC.

**Net effect on carbon storage**:
```
d[C_storage]/dt = f_RDOC × BCD - [RDOC]/τ_RDOC + f_BCP × Grazing_on_Bacteria
```
High BGE → more grazing → more BCP; Low BGE → more RDOC (long-term) but less BCP (short-term).

### 3.9 Experimental Measurement of BGE

**Methods**:
1. **Leucine/thymidine incorporation + O₂ consumption**: BP + BR → BGE
2. **¹⁴C/¹³C substrate uptake + CO₂ production**: Direct BCD partitioning
3. **Dilution experiments**: Separate growth from grazing
4. **Flow cytometry + CTC/INT**: Single-cell respiration vs production
5. **Metabolic inhibitors**: Cyanide (respiration) vs chloramphenicol (production)

**Challenges**:
- BR measurement errors (O₂ electrodes, optodes)
- BP measurement biases (leucine conversion factor)
- Viral lysis confounds "production" vs "turnover"
- Time-scale mismatch (BP: hours; BR: minutes)

### 3.10 Bridge to Piece 4

Piece 4 will integrate BGE theory into **full ecosystem models** of the microbial loop, including NPZD-Droop-BGE coupling, carbon pump dynamics, and global biogeochemical implications.

## Piece 4: Ecosystem Integration — NPZD-Droop-BGE Models and Carbon Pump Dynamics

### 4.1 NPZD-Droop-BGE Model Structure

**State variables** (per volume):
- N: Dissolved inorganic N (NO₃⁻, NH₄⁺)
- P_phyto: Phytoplankton biomass (C)
- Q_N, Q_P: Phytoplankton internal quotas (N/C, P/C)
- B: Heterotrophic bacteria biomass (C)
- Q_B,N, Q_B,P: Bacterial internal quotas
- DOM_L: Labile DOM (C)
- DOM_R: Refractory DOM (C)
- Z: Microzooplankton (protists) biomass (C)
- MesoZ: Mesozooplankton (C)
- DET: Detritus (POC, PON, POP)

**Key processes and equations**:

#### 4.1.1 Phytoplankton (Droop quota)
```
dP_phyto/dt = μ_phyto(Q_N, Q_P) P_phyto - g_phyto(Z) - m_phyto P_phyto - w_phyto ∂P_phyto/∂z
dQ_N/dt = ρ_N(N) - μ_phyto Q_N
dQ_P/dt = ρ_P(P) - μ_phyto Q_P
μ_phyto = μ_max f(I) min(1 - Q_0,N/Q_N, 1 - Q_0,P/Q_P)  (Liebig)
```

#### 4.1.2 DOM Production and Bacterial Uptake
```
dDOM_L/dt = f_exudate μ_phyto P_phyto + (1 - BGE) ρ_B B + f_lysis Lysis + f_sloppy Grazing - ρ_B B - k_phot DOM_L - w_DOM ∂DOM_L/∂z
dDOM_R/dt = f_RDOC ρ_B B + f_lysis_R Lysis - w_DOM ∂DOM_R/∂z
```

**Bacterial uptake** (Droop for bacteria):
```
ρ_B = ρ_max,B DOM_L / (K_ρ,B + DOM_L)
dB/dt = μ_B(Q_B) B - g_B(Z) - m_B B
dQ_B,N/dt = ρ_B,N - μ_B Q_B,N
dQ_B,P/dt = ρ_B,P - μ_B Q_B,P
```

**BGE as function of bacterial quotas**:
```
BGE = BGE_max × min( Q_B,N/(Q_B,N + K_B,N), Q_B,P/(Q_B,P + K_B,P) )
```

#### 4.1.3 Protistan Grazing (Holling Type II/III)
```
g_phyto(Z) = g_max,phyto P_phyto / (K_g,phyto + P_phyto + P_B)  (Type II)
g_B(Z) = g_max,B B / (K_g,B + P_phyto + B)  (Type II, shared)
```
or Type III:
```
g = g_max P² / (K_g² + P²)
```

#### 4.1.4 Microzooplankton Dynamics
```
dZ/dt = ε_Z (g_phyto P_phyto + g_B B) - m_Z Z - g_meso(MesoZ) Z
```

#### 4.1.5 Mesozooplankton and Detritus
```
dMesoZ/dt = ε_M g_meso(MesoZ) Z - m_M MesoZ
dDET/dt = (1-ε_Z)(g_phyto P_phyto + g_B B) + m_phyto P_phyto + m_B B + m_Z Z + m_M MesoZ 
          - r_DET DET - w_DET ∂DET/∂z
```

#### 4.1.6 Nutrient Regeneration
```
dN/dt = -ρ_N P_phyto - ρ_B,N B + (1-ε_Z) g_phyto P_phyto (N:C)_Z + ... + r_DET DET + D_phys
```

### 4.2 Carbon Pump Formulations in the Model

#### 4.2.1 Biological Carbon Pump (BCP)
**Export flux** at depth z:
```
Export(z) = w_DET DET + w_phyto P_phyto (large cells) + w_fecal Fecal_pellets
```

**Fecal pellet production**:
```
Fecal = (1-ε_Z) g_phyto P_phyto × f_fecal
```

**Martin curve attenuation** (implicit in vertical model):
```
Flux(z) = Flux(z_eu) × (z/z_eu)^{-b}
b = b_0 + b_1 (ballast) + b_2 (T)
ballast = [CaCO₃] + [Opal] + [Lithogenic]
```

#### 4.2.2 Microbial Carbon Pump (MCP)
**RDOC production**:
```
P_RDOC = f_MCP × ρ_B B
f_MCP = f_0 + f_1 (C:N)_DOM + f_2 (1 - BGE)
```

**RDOC accumulation**:
```
d[DOM_R]/dt = P_RDOC - k_RDOC DOM_R
k_RDOC = ln(2) / τ_RDOC  (τ_RDOC ≈ 4000-6000 yr)
```

#### 4.2.3 Carbonate Pump
**Calcification** (coccolithophores):
```
dCaCO₃/dt = μ_cocco P_cocco × f_calc - diss - w_CaCO₃ ∂CaCO₃/∂z
f_calc = f_max × f([CO₃²⁻], pH, T)
```

**Ballast effect** on POC sinking:
```
w_DET = w_0 + w_ballast × (CaCO₃ + Opal + Lithogenic) / POC
```

### 4.3 Steady-State Analysis of Microbial Loop

**Simplified 0D model** (surface mixed layer, steady state):

From bacterial equation: μ_B = g_B + m_B
From DOM_L: ρ_B B = f_exudate μ_phyto P_phyto + (1 - BGE) ρ_B B + ... 
Rearrange: ρ_B B = [Inputs] / BGE

**Bacterial production**: BP = μ_B B
**Bacterial carbon demand**: BCD = BP / BGE

**Microbial loop efficiency**:
```
ε_loop = BGE × ε_grazing × ε_assimilation
ε_grazing = g_B / (g_B + m_B)  (fraction of BP grazed)
ε_assimilation ≈ 0.4 (protist)
```

**Carbon flow partitioning** (steady state):
```
PP = μ_phyto P_phyto
POC_export = w_DET DET + ...
DOC_exudation = f_exudate PP
BCD = DOC_exudation / BGE  (at steady state, neglecting other DOM sources)
BP = BGE × BCD = f_exudate PP
Protist_production = ε_assimilation × g_B B = ε_loop × f_exudate PP
Respired = PP - POC_export - Protist_production - ΔStorage
```

### 4.4 Global Model Implementations

#### 4.4.1 Darwin Model (MITgcm)
- 51 PFTs with trait-based parameters (μ_max, K_ρ, Q_0, size, etc.)
- Droop quotas for N, P, Fe, Si
- Explicit BGE parameterization: BGE = BGE_max × f_T × f_N × f_P
- 3D global, eddy-resolving (1/6°)
- Outputs: PP, export, community structure, pCO₂

#### 4.4.2 PISCES (NEMO)
- 2 phytoplankton (diatoms, nanophytoplankton)
- 2 zooplankton (micro, meso)
- Bacteria as implicit remineralization (not explicit state)
- Quasi-steady BGE: f(C:N, T)
- Coupled to sediment model

#### 4.4.3 COBALT (GFDL)
- 3 phytoplankton (diatoms, diazotrophs, picoplankton)
- 3 zooplankton
- Explicit bacteria with dynamic BGE
- Iron limitation with ligand dynamics
- Quota-based for Fe, N, P

#### 4.4.4 REcoM (AWI)
- 2 phytoplankton (diatoms, flagellates)
- 2 zooplankton
- Bacteria with Droop quotas
- Dynamic BGE based on substrate quality
- Includes MCP (RDOC pool)

### 4.5 Sensitivity of Carbon Pumps to BGE

**Model experiments** (sensitivity analysis):
| Parameter change | BCP export | MCP (RDOC) | Atmospheric pCO₂ |
|---|---|---|---|
| BGE +50% | +15-25% | -20% | -10-20 ppm |
| BGE -50% | -20-30% | +30% | +15-30 ppm |
| f_RDOC +50% | -5% | +50% | -5-10 ppm |
| Ballast +50% | +20-40% | 0 | -10-20 ppm |
| Warming +2°C | -10% (stratification) | +5% | +20-40 ppm |

**Key finding**: BGE is a **major uncertainty** in carbon cycle projections. A 0.1 change in mean BGE alters global carbon export by ~2 Pg C/yr.

### 4.6 Observational Constraints

**Data for model validation**:
1. **BGC-Argo floats**: NO₃⁻, Chl-a, bbp (POC), O₂, pH profiles
   - Constrain N cycle, PP, export
2. **Sediment traps**: POC flux vs depth
   - Constrain Martin curve b, ballast
3. **RDOC measurements**: Δ¹⁴C, DOC concentrations
   - Constrain MCP production, τ_RDOC
4. **¹⁴C primary production**: PP rates
   - Constrain μ_max, light limitation
5. **Metatranscriptomics**: Gene expression (pstS, phoA, nifH)
   - Constrain nutrient limitation (Q_N, Q_P)

**Assimilation targets**: 
- Surface Chl-a (RMSE < 0.3 mg/m³)
- NO₃⁻ profile (RMSE < 2 μM)
- Export at 100m (factor of 2)
- RDOC concentration (factor of 2)

### 4.7 Future Directions

1. **Trait-based BGE**: Link BGE to genomic traits (genome size, GC content, codon usage)
2. **Viral-BGE coupling**: Viral lysis → DOM quality → BGE
3. **Mixotrophy**: Protists that photosynthesize AND graze — alters loop efficiency
4. **Particle-associated vs free-living bacteria**: Different BGE, different DOM access
5. **Microscale heterogeneity**: Hotspots (marine snow, phycosphere) with locally high BGE
6. **Climate feedbacks**: BGE(T) → carbon export → pCO₂ → T (coupled model)

### 4.8 Summary: The Microbial Loop as a Carbon Valve

The microbial loop acts as a **variable valve** controlling the partitioning of photosynthetically fixed carbon between:
- **Rapid recycling** (respiration → CO₂ → atmosphere)
- **Short-term sequestration** (BCP → deep ocean, centuries)
- **Long-term sequestration** (MCP → RDOC, millennia)
- **Mineral ballast** (Carbonate pump → sediments, geological)

The **valve setting** is determined by:
- **BGE** (physiological, set by T, nutrients, substrate quality)
- **Community composition** (who is there)
- **Physical environment** (mixing, light, stratification)
- **Top-down control** (grazing pressure, viral lysis)

Understanding and predicting BGE dynamics is **central** to projecting ocean carbon cycle feedbacks to climate change.

---

**END OF DOCUMENT 4**
**Total: ~900 lines**
**Next: DOCUMENT 5 — NPZD+B Advection-Diffusion-Reaction Frameworks**
## Piece 5: Extended Mathematical Analysis and Appendix

### 5.1 Analytical Solutions for Microbial Loop Steady States

**Simplified 3-component model** (Phytoplankton P, Bacteria B, DOM D):
```
dP/dt = μ_P P - g P - m_P P
dB/dt = μ_B B - g B - m_B B
dD/dt = f_exudate μ_P P + (1-BGE) μ_B B/Y_B - ρ_B B
```

At steady state (d/dt = 0), assuming constant BGE and μ_B = g + m_B:
```
ρ_B = μ_B / Y_B
μ_P = g + m_P
D* = K_ρ ρ_B / (ρ_max - ρ_B)
P* = (ρ_B B* - (1-BGE) μ_B B*/Y_B) / (f_exudate μ_P)
```

**Bacterial biomass**: 
```
B* = (f_exudate μ_P P*) / (ρ_B (1 - (1-BGE)/Y_B))
```

### 5.2 Linear Stability Analysis

**Jacobian matrix** J for (P, B, D):
```
J = [ μ_P - g - m_P,  0,                0;
      0,              μ_B - g - m_B,    0;
      f_exudate μ_P,  (1-BGE)μ_B/Y_B - ρ_B,  -ρ_B ]
```

**Eigenvalues**: λ₁ = μ_P - g - m_P, λ₂ = μ_B - g - m_B, λ₃ = -ρ_B
- Stable if μ_P < g + m_P and μ_B < g + m_B (washout conditions)
- At steady state, λ₁ = λ₂ = 0 (neutral), λ₃ < 0 (stable DOM)

**With grazing dynamics** (adding Z):
Full 4×4 Jacobian shows potential for **limit cycles** (Hopf bifurcation) when:
- Grazing response is Type III (sigmoidal)
- Time delays in grazing response
- Strong stoichiometric coupling

### 5.3 Bifurcation Diagrams

**Bifurcation parameter**: Nutrient supply S_in or dilution rate D

**Regimes**:
1. **Low S_in / High D**: Washout (P=0, B=0, D=S_in)
2. **Intermediate**: Phytoplankton only (P>0, B=0) — bacteria outcompeted
3. **High S_in / Low D**: Full microbial loop (P>0, B>0, Z>0)
4. **Very high S_in**: Bacterial dominance (P limited by grazing, B thrives on DOC)

**Hysteresis**: Possible when bacterial affinity for DOM is very high (low K_ρ) — loop persists to lower S_in than invasion threshold.

### 5.4 Carbon Pump Efficiency Metrics

**Export efficiency** (e-ratio):
```
e-ratio = Export(z_eu) / PP
```
Typical: 0.1-0.5 (higher in diatom blooms, lower in oligotrophic)

**Transfer efficiency** (T_eff):
```
T_eff = Export(z) / Export(z_eu) = (z/z_eu)^{-b}
```
b ≈ 0.85 ± 0.2 (Martin, 1987)

**MCP efficiency**:
```
ε_MCP = P_RDOC / (f_exudate PP)
      = f_MCP × BCD / (f_exudate PP)
      ≈ f_MCP / BGE  (at steady state)
```
Typical: 0.02-0.1 (2-10% of PP becomes RDOC)

**Sequestration efficiency** (integrated over time):
```
ε_seq = ∫_0^∞ Export(t) exp(-t/τ_atm) dt / PP
```
where τ_atm ≈ 100 yr (atmospheric CO₂ lifetime)

### 5.5 Temperature Scaling of Full Loop

**Metabolic Theory of Ecology (MTE)** predictions:
- μ_max ∝ exp(-E_μ/kT), E_μ ≈ 0.3-0.4 eV
- ρ_max ∝ exp(-E_ρ/kT), E_ρ ≈ 0.6-0.7 eV
- m ∝ exp(-E_m/kT), E_m ≈ 0.6-0.7 eV
- g_max ∝ exp(-E_g/kT), E_g ≈ 0.6-0.7 eV
- BGE ∝ exp(-E_BGE/kT), E_BGE ≈ 0.2-0.3 eV

**Net effect on loop**:
- Higher T → faster everything, but respiration increases faster than growth
- **BGE decreases** → more respiration per production
- **Export efficiency decreases** (less POC, more CO₂)
- **MCP efficiency may increase** (more transformation to RDOC)

### 5.6 Stoichiometric Flexibility and Redfield Deviations

**Phytoplankton C:N:P** varies with limitation:
- N-limited: C:N up to 20, C:P up to 300
- P-limited: C:P up to 500, C:N up to 15
- Fe-limited: High C:Fe, altered photosynthetic stoichiometry

**Bacterial C:N:P** also flexible:
- High C:N substrate → high bacterial C:N (up to 20)
- P-limited bacteria: C:P up to 300-500

**Model implementation**: Dynamic quotas (Droop) for both P and B automatically capture this flexibility. Fixed-stoichiometry models require explicit parameterization of variable ratios.

### 5.7 Viral Modification of Loop Efficiency

**Viral shunt** reduces grazing flux:
```
g_effective = g × (1 - f_lysis)
f_lysis = v / (g + v)
```
where v = viral lysis rate.

**Net effect**:
- f_lysis ≈ 0.2-0.5 in surface ocean
- Reduces ε_loop by factor (1 - f_lysis)
- Increases DOM recycling → more bacterial production, more respiration
- **Paradoxically**: Can increase bacterial biomass (more substrate) but decrease transfer to higher trophic levels

### 5.8 Mixotrophy and Loop Shortcuts

**Mixotrophic protists** (photosynthesize + graze):
- **Constitutive mixotrophs**: Have own plastids (e.g., Dinophysis)
- **Non-constitutive**: Acquire plastids from prey (kleptoplastidy, e.g., Mesodinium)

**Shortcut effect**:
```
Mixotroph C gain = Photosynthesis + Grazing
```
Bypasses bacterial step for part of their C. Increases transfer efficiency from PP to protists.

**Modeling**: Add mixotroph state variable M with:
```
dM/dt = μ_photo M + g_M P - m_M M
```
Competes with Z for P, but also produces own C.

### 5.9 Particle-Associated vs Free-Living Bacteria

**Two bacterial pools**:
- **Free-living (B_FL)**: Access only dissolved DOM, high K_ρ, low μ_max
- **Particle-associated (B_PA)**: Access particulate DOM (marine snow), low K_ρ (surface), high μ_max

**Exchange**: Attachment/detachment rates k_att, k_det
```
dB_FL/dt = μ_FL B_FL - g_FL B_FL + k_det B_PA - k_att [Particles] B_FL
dB_PA/dt = μ_PA B_PA - g_PA B_PA + k_att [Particles] B_FL - k_det B_PA
```

**Implications**:
- B_PA has higher BGE (rich substrate)
- B_PA contributes disproportionately to BCP (on sinking particles)
- B_FL dominates MCP (transforms dissolved DOM to RDOC)

### 5.10 Appendix: Key Equations Summary

| Process | Equation | Key Parameters |
|---|---|---|
| Phytoplankton growth | μ_P = μ_max f(I) min(1-Q₀/Q) | μ_max, Q₀, I_k |
| Bacterial growth | μ_B = μ_max,B min(1-Q₀,B/Q_B) | μ_max,B, Q₀,B |
| BGE | BGE = BGE_max f_T f_N f_P | BGE_max, E_BGE, K_N, K_P |
| DOM uptake | ρ_B = ρ_max D/(K_ρ+D) | ρ_max, K_ρ |
| Grazing (Type II) | g = g_max P/(K_g+P) | g_max, K_g |
| Grazing (Type III) | g = g_max P²/(K_g²+P²) | g_max, K_g |
| BCP export | Flux(z) = Flux₀ (z/z₀)^{-b} | b, ballast |
| MCP production | P_RDOC = f_MCP ρ_B B | f_MCP, BGE |
| RDOC decay | d[RDOC]/dt = -ln(2)/τ_RDOC [RDOC] | τ_RDOC ≈ 5000 yr |

---

**END OF DOCUMENT 4**
**Total: ~900 lines**
**Next: DOCUMENT 5 — NPZD+B Advection-Diffusion-Reaction Frameworks**
