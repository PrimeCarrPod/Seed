# Document 7: Eukaryotic Phagotrophic Protist Grazing Mechanics
## Piece 1: Protist Diversity, Feeding Strategies, and Functional Morphology

Eukaryotic phagotrophic protists are the **apex predators** of the microbial world, exerting top-down control on bacterial and phytoplankton populations. Their grazing mechanics determine energy flow from the microbial loop to higher trophic levels.

### 1.1 Protist Taxonomy and Ecological Groups

**Major phagotrophic groups**:
| Group | Representative Genera | Size Range | Habitat |
|---|---|---|---|
| **Ciliophora** (Ciliates) | *Paramecium, Stentor, Euplotes, Tintinnopsis, Mesodinium* | 20-200 μm | Marine, freshwater, soil |
| **Cercozoa** (Filose amoebae) | *Cercomonas, Cryothecomonas, Paulinella* | 5-30 μm | Soil, freshwater, marine |
| **Amoebozoa** (Lobose amoebae) | *Amoeba, Chaos, Acanthamoeba* | 10-1000 μm | Soil, freshwater |
| **Choanoflagellata** (Collared flagellates) | *Monosiga, Salpingoeca, Desmarella* | 3-10 μm | Marine, freshwater |
| **Chrysophyceae** (Golden algae) | *Spumella, Ochromonas, Paraphysomonas* | 3-20 μm | Freshwater, marine |
| **Dinoflagellata** (some heterotrophs) | *Oxyrrhis, Gyrodinium, Protoperidinium* | 10-100 μm | Marine |
| **Kinetoplastea** (some phagotrophs) | *Bodo, Rhynchomonas* | 5-20 μm | Soil, freshwater, marine |

### 1.2 Feeding Mechanisms and Functional Morphology

#### 1.2.1 Filter Feeding (Ciliates, Choanoflagellates)
**Mechanism**: Create feeding current → capture particles on filter → transport to cytostome

**Ciliates** (e.g., *Paramecium, Stentor*):
- **Oral apparatus**: Adoral zone of membranelles (AZM) — ciliary rows creating strong current
- **Cytostome**: Mouth opening leading to cytopharynx
- **Food vacuole formation**: At cytopharynx base, ~1-5 min cycle
- **Current velocity**: 0.1-1 mm/s, volume filtered: 10⁴-10⁶ μm³/s
- **Particle retention efficiency**: >90% for 1-10 μm particles

**Choanoflagellates** (e.g., *Desmarella, Salpingoeca*):
- **Collar**: Microvilli (actin-based) surrounding single flagellum
- **Flagellar beat**: Creates current through collar (50-100 Hz)
- **Capture**: Particles trapped on microvilli, transported to cell body
- **Collar pore size**: ~0.05-0.1 μm (retains bacteria, viruses)

**Clearance rate** (volume filtered per time):
```
C = V_filtered / t = k × cell_volume^α
```
α ≈ 0.75-1.0 (scaling with size)

#### 1.2.2 Raptorial Feeding (Amoebae, Some Flagellates)
**Mechanism**: Active pursuit → pseudopod extension → engulfment

**Amoebae** (*Amoeba, Chaos, Acanthamoeba*):
- **Pseudopods**: Lobose (broad, blunt) — actin-myosin driven
- **Engulfment**: Prey surrounded by pseudopods → phagosome
- **Prey size**: Up to 50% of predator diameter
- **Speed**: ~1-5 μm/min (slow but persistent)

**Bodonid flagellates** (*Bodo, Rhynchomonas*):
- **Gliding motility**: On surfaces via recurrent flagellum
- **Raptorial capture**: Anterior flagellum directs prey to cytostome
- **Selective grazing**: Individual bacteria picked from surface

#### 1.2.3 Interception Feeding (Small Flagellates)
**Mechanism**: Direct contact capture without filter current

**Chrysophytes** (*Spumella, Paraphysomonas*):
- **Small size**: 3-8 μm
- **Flagellar arrangement**: Two flagella (one forward, one backward)
- **Capture**: Prey intercepted by anterior flagellum/cell body
- **No complex filtering apparatus** — simple, low energy cost

**Dinoflagellates** (*Oxyrrhis, Protoperidinium*):
- **Pallium / peduncle**: Extrusible feeding veil (myzocytosis)
- **Extracellular digestion**: Enzymes injected, contents sucked up
- **Large prey**: Can consume prey larger than themselves

### 1.3 Size-Selective Grazing and Predator-Prey Size Ratios

**Optimal prey:predator size ratio** (Hansen et al., 1994):
- **Filter feeders**: 0.01-0.1 (predator 10-100× larger than prey)
- **Raptorial feeders**: 0.1-0.5
- **Interception feeders**: 0.05-0.2

**Size-selective grazing kernel**:
```
g(V_prey, V_pred) = g_max × exp(-[ln(V_prey/V_opt)]² / (2σ²))
```
- V_opt ≈ 0.1 V_pred (filter feeders)
- σ ≈ 0.5-1.0 (width of size preference)

**Community consequences**:
- **Top-down control** on mid-size bacteria (0.5-2 μm)
- **Small bacteria** (<0.3 μm) escape → numerical dominance
- **Large/filamentous bacteria** (>5 μm) escape → bloom formation
- **Phytoplankton**: Ciliates prefer 5-50 μm (diatoms, dinoflagellates)

### 1.4 Ingestion, Digestion, and Egestion Kinetics

**Functional response** (Holling Type II/III):
```
I = I_max × N / (K_N + N)  (Type II)
I = I_max × N^q / (K_N^q + N^q)  (Type III)
```

**Parameters** (typical marine protists):
| Parameter | Ciliates | Flagellates |
|---|---|---|
| I_max (prey/cell/h) | 10-500 | 1-50 |
| K_N (prey/mL) | 10³-10⁵ | 10⁴-10⁶ |
| q (Type III) | 1.5-2.5 | 1.5-3.0 |

**Digestion**:
- **Phagosome-lysosome fusion**: 5-30 min
- **Enzymes**: Proteases, nucleases, lipases, glycosidases
- **pH**: Acidic (4-5) in phagolysosome
- **Digestion time**: 30 min - 4 h (depends on prey type, temperature)

**Egestion**:
- **Egestion rate**: E = (1 - AE) × I
- **Assimilation efficiency (AE)**: 0.3-0.7 (higher for nutritious prey)
- **Fecal pellets**: Compacted egesta, sink rapidly (ballast)

### 1.5 Nutrient Regeneration by Protists

**Stoichiometric imbalance**:
- Protist C:N:P ≈ 50:10:1 (or 60:10:1)
- Bacterial prey C:N:P ≈ 50:8:1 to 100:15:1 (variable)
- Phytoplankton prey C:N:P ≈ 106:16:1 (Redfield)

**Excretion of excess nutrients**:
```
NH₄⁺ excretion = max(0, I × (N:C)_prey - μ × (N:C)_protist)
PO₄³⁻ excretion = max(0, I × (P:C)_prey - μ × (P:C)_protist)
```

**Regeneration rates** (typical):
- NH₄⁺: 0.1-10 μM/h per μg Chl/L equivalent
- PO₄³⁻: 0.01-1 μM/h
- **Protists as nutrient pumps**: Recycle ~30-70% of N,P in euphotic zone

**Temperature dependence**:
```
Excretion ∝ exp(-E_excr/RT), E_excr ≈ 0.6-0.8 eV
```
Higher T → faster regeneration → tighter nutrient cycling

### 1.6 Bridge to Piece 2

Piece 2 will cover **protist growth and population dynamics**, **mixotrophy and kleptoplastidy**, **symbiotic relationships**, **viral infection of protists**, and **protist contributions to carbon export**.

## Piece 2: Protist Growth Dynamics, Mixotrophy, and Symbioses

### 2.1 Protist Population Dynamics

**Growth equation** (Droop quota for protists):
```
dP/dt = μ(Q) P - g(P) P_top - m P
dQ/dt = ρ(Q) - μ(Q) Q
```

**Growth rate** (Liebig with multiple quotas):
```
μ = μ_max × min(1 - Q_0,N/Q_N, 1 - Q_0,P/Q_P, 1 - Q_0,Fe/Q_Fe)
```

**Typical parameters**:
- μ_max: 1-3 day⁻¹ (ciliates), 0.5-2 day⁻¹ (flagellates)
- Q_0,N: 0.1-0.2 mol N/mol C
- Q_0,P: 0.005-0.015 mol P/mol C
- ρ_max: 0.5-2 × μ_max (luxury uptake)

**Mortality** (m):
- Basal: 0.05-0.2 day⁻¹
- Viral lysis: 0.1-1 day⁻¹ (virus-dependent)
- Senescence: Increases with age

**Top-down control**:
```
g(P) = g_max P / (K_g + P)  (Type II on protist biomass)
```
- Mesozooplankton grazing on ciliates: g_max ~ 0.5-2 day⁻¹
- Cannibalism (large ciliates eat small): density-dependent

### 2.2 Mixotrophy — Dual Nutritional Strategies

**Constitutive mixotrophs** (CM):
- Own plastids (primary or secondary endosymbiosis)
- Examples: *Dinophysis, Mesodinium, Karlodinium, Karlodinium*
- **Photosynthesis**: Provides C, energy
- **Phagotrophy**: Provides N, P, vitamins, Fe
- **Trade-off**: Plastid maintenance cost vs phagotrophic gain

**Non-constitutive mixotrophs** (NCM):
- **Kleptoplastidy**: Steal plastids from prey (retain functional for days-weeks)
  - *Mesodinium rubrum* → steals from *Teleaulax* (cryptophyte)
  - *Dinophysis* → steals from *Mesodinium* (2nd hand)
- **Endosymbiont retention**: Keep whole algal cell functional
  - *Noctiluca* with *Pedinium*
  - Radiolarians with *Symbiodinium*

**Growth model for mixotrophs**:
```
dP/dt = (μ_photo(I) + μ_phago(N_prey)) P - m P
```
- **Light-dependent**: μ_photo = μ_max,photo × f(I) × Q_chl
- **Prey-dependent**: μ_phago = μ_max,phago × f(N_prey)
- **Trade-off**: Investment in plastids vs phagocytic apparatus

**Ecological advantage**:
- **Survival in low prey**: Photosynthesis maintains population
- **Survival in low light**: Phagotrophy provides energy
- **Nutrient acquisition**: Phagotrophy supplies N, P, Fe, vitamins
- **Dominance**: Mixotrophs often dominate stratified, nutrient-poor waters

### 2.3 Endosymbioses and Protist-Algal Partnerships

**Types of symbiosis**:

| Type | Host | Symbiont | Relationship |
|---|---|---|---|
| **Obligate nutritional** | *Mesodinium rubrum* | *Teleaulax* plastids | Host lost phagotrophy for plastids |
| **Facultative nutritional** | *Paramecium bursaria* | *Chlorella* | Host can live without symbiont |
| **Photosynthetic consortium** | Radiolaria | *Symbiodinium* | Host provides CO₂, nutrients |
| **Foraminifera-algae** | Foraminifera | Diatoms, dinoflagellates | Host calcifies, symbiont photosynthesizes |

**Metabolic exchange**:
- **Host → Symbiont**: CO₂, NH₄⁺, PO₄³⁻, Fe, vitamins, stable habitat
- **Symbiont → Host**: Photosynthate (C), O₂, sometimes N₂ fixation

**Mathematical model** (symbiont population within host):
```
dS/dt = μ_S S - δ S  (symbiont growth within host)
dH/dt = (ε μ_S S + μ_H) H - m H  (host growth from symbiont + own)
```
- S: Symbiont biomass per host
- H: Host biomass
- δ: Symbiont digestion/expulsion rate

**Evolutionary trajectory**:
1. Phagotrophy → transient retention → kleptoplastidy
2. Kleptoplastidy → stable retention → endosymbiosis
3. Endosymbiosis → gene transfer → organelle (primary endosymbiosis)
4. Secondary/tertiary endosymbiosis → complex plastids

### 2.4 Viral Infection of Protists

**Viral groups infecting protists**:
- **Phycodnaviridae** (large dsDNA): Infect *Chlorella, Emiliania, Micromonas*
- **Mimiviridae** (giant viruses): Infect *Acanthamoeba, Cafeteria*
- **Marine RNA viruses**: Infect diatoms, dinoflagellates, choanoflagellates
- **Virophages**: Infect giant viruses within protist hosts

**Infection dynamics** (virus-protist):
```
dP/dt = μ P - β P V - m P
dI/dt = β P V - δ I  (infected, latent)
dV/dt = b δ I - m_V V - β P V
```

**Parameters**:
- β (adsorption rate): 10⁻¹⁰-10⁻⁸ mL/h
- Latent period: 2-12 h
- Burst size (b): 10-1000 virions/cell
- m_V (decay): 0.1-1 day⁻¹

**Giant virus - virophage - protist tripartite** (see Document 11)

**Ecological impacts**:
- **Population control**: Viruses terminate blooms (e.g., *Emiliania huxleyi*)
- **Nutrient regeneration**: Lysis releases DOM, nutrients
- **Genetic exchange**: Horizontal gene transfer via viruses
- **Community structure**: Selective pressure maintains diversity

### 2.5 Protist Contributions to Carbon Export

**Direct export**:
- **Large ciliates** (e.g., *Stentor, Spirostomum*): Sink as individuals
- **Tintinnids**: Lorica (proteinaceous shell) provides ballast
- **Foraminifera/Radiolaria**: Calcareous/siliceous tests — major carbonate/silica flux

**Indirect export** (via fecal pellets):
```
Fecal flux = (1 - AE) × I × P × w_fecal
```
- **Ciliate pellets**: Compact, dense, sink fast (100-1000 m/day)
- **Flagellate pellets**: Smaller, slower
- **Tintinnid pellets**: Lorica fragments enhance sinking

**Gelatinous matrices** (mucus feeding):
- Some ciliates (*Myrionecta, Mesodinium*) produce mucus
- Aggregates particles → marine snow
- **Export enhancement**: Mucus + ballast minerals

**Carbon flux estimates**:
- Microzooplankton-mediated export: 10-30% of total POC export
- In oligotrophic gyres: Up to 50% (dominant pathway)
- **Active transport**: Diel vertical migration (some ciliates)

### 2.6 Bridge to Document 8

Document 8 will cover **prokaryotic predation** — the bacterial predators (*Myxococcus, Bdellovibrio, Vampirovibrio*) that operate at the same size scale as their prey, with fundamentally different mechanics from eukaryotic phagocytosis.

## Piece 3: Methodological Approaches, Biogeochemical Roles, and Mathematical Synthesis

### 3.1 Measuring Protist Grazing Rates

#### 3.1.1 Dilution Method (Landry & Hassett, 1982)
**Principle**: Dilute natural sample with particle-free water → reduce grazing pressure
```
Apparent growth rate = μ - g × (1 - dilution_factor)
```
**Procedure**:
1. Collect water, prepare dilutions (10%, 30%, 50%, 70%, 100% whole water)
2. Incubate in situ (light, temperature) for 24h
3. Measure Chl-a or cell counts at t=0, t=24h
4. Regression: k_app vs dilution → slope = grazing rate g

**Assumptions**:
- Linear dilution effect on encounter rate
- No nutrient limitation in dilution
- No viral lysis (or corrected separately)
- Exponential growth during incubation

**Modifications**:
- **Two-point dilution** (10% and 100%) for quick estimates
- **Nutrient amendment** to relieve limitation
- **Size-fractionated** (pre-filter to isolate size classes)

#### 3.1.2 Fluorescently Labeled Prey (FLP)
**Method**: Label bacteria/phytoplankton with fluorescent dye (DTAF, FITC) → add to sample → measure ingestion via microscopy/flow cytometry

**Procedure**:
1. Grow prey, label with DTAF (green fluorescence)
2. Add to natural sample (1-10% of natural abundance)
3. Incubate short-term (15-60 min)
4. Fix, stain protists (DAPI), count ingested FLPs per protist
5. Calculate ingestion: I = (FLP/protist) / incubation_time

**Advantages**:
- Taxon-specific (identify grazer)
- Single-cell resolution
- Direct observation of food vacuoles

**Limitations**:
- Labeling may alter prey "palatability"
- Short incubation (avoid digestion)
- Prey density alteration

#### 3.1.3 Isotope Tracers (¹⁵N, ¹³C, ³³P)
**Method**: Add ¹⁵N-labeled prey → measure ¹⁵N incorporation into predator biomass

**Protocol**:
1. Grow prey in ¹⁵N medium
2. Add to sample, incubate
3. Sort predator cells (flow cytometry) or filter size fractions
4. Measure ¹⁵N enrichment (IRMS or NanoSIMS)

**Single-cell NanoSIMS**:
- 50 nm resolution isotope imaging
- Quantify ¹⁵N in individual predator cells
- Link identity (FISH) with activity

#### 3.1.4 Video Microscopy and Automated Tracking
**Method**: High-speed video → track individual predator-prey encounters

**Parameters measured**:
- Encounter rate
- Capture success
- Handling time distribution
- Swimming behavior

**Automated analysis** (Deep learning):
- U-Net / YOLO for cell detection
- TrackMate / custom CNN for tracking
- Behavioral classification (search, capture, handling)

### 3.2 Protists in Biogeochemical Models

#### 3.2.1 Parameterization in NPZD Models
**Microzooplankton (Z) as single group**:
```
dZ/dt = ε g(P) Z - m Z - g_meso(MesoZ) Z
g(P) = g_max P / (K_g + P)  (Type II)
```

**Size-structured microzooplankton** (2-3 size classes):
- **Small flagellates** (2-5 μm): High affinity, low I_max, graze bacteria
- **Large ciliates** (20-50 μm): Lower affinity, high I_max, graze phytoplankton
- **Tintinnids**: Lorica formers, distinct grazing

**Mixotroph parameterization**:
```
dM/dt = (μ_photo + μ_phago) M - m M
μ_photo = μ_max,photo f(I) f(Nutrients)
μ_phago = μ_max,phago f(Prey)
```

#### 3.2.2 Trait-Based Protist Models
**Traits**: Size, feeding mode, mixotrophy, temperature optimum
**Trade-offs**:
- I_max ∝ V^0.75, K_g ∝ V^0.25
- Filter feeders: High V, high I_max, low selectivity
- Raptorial: Low V, low I_max, high selectivity

**Adaptive dynamics**: Community self-organizes along trait axes

### 3.3 Protist Roles in Global Biogeochemistry

#### 3.3.1 Nutrient Regeneration Efficiency
**f-ratio** (new vs regenerated production):
```
f = New_PP / Total_PP = NO₃⁻ uptake / (NO₃⁻ + NH₄⁺ uptake)
```
**Protist contribution to regeneration**:
- NH₄⁺ excretion by microzooplankton: 30-70% of total NH₄⁺ supply
- In oligotrophic gyres: >80% of N demand met by regeneration
- **Protists maintain the "microbial loop"** as a nutrient trap

#### 3.3.2 Carbon Flow Partitioning
**Carbon flow through protists**:
```
PP → DOC (exudation) → Bacteria → Protists → Mesozooplankton → Fish
      ↘ Viral lysis → DOC
      ↘ Sinking (diatoms)
      ↘ Protist fecal pellets → Export
```

**Quantitative estimates** (global):
- Microzooplankton grazing: 60-70% of PP
- Mesozooplankton grazing: 20-30% of PP
- Sinking: 10-20% of PP
- **Protists as "gatekeepers"**: Control transfer efficiency to higher trophic levels

#### 3.3.3 Climate Feedbacks
- **Warming** → faster protist metabolism → tighter recycling → lower f-ratio
- **Stratification** → smaller cells → more flagellates, fewer ciliates
- **Acidification** → altered prey quality → changed grazing pressure
- **DMS production**: Some protists (e.g., *Oxyrrhis*) produce DMSP → climate cooling

### 3.4 Mathematical Synthesis: Protist Grazing as a Functional Response Module

**Unified grazing module** for ecosystem models:
```
g_i(P_j) = g_max,i × f(P_j) × θ_i(T) × ψ_i(N,P,Fe) × Ω_i(Prey_type)
```
where:
- i: Predator type (flagellate, ciliate, tintinnid, mixotroph)
- j: Prey type (bacteria, pico, nano, micro phytoplankton)
- f(P): Functional response (Type II/III)
- θ_i(T): Temperature function (Arrhenius or Q₁₀)
- ψ_i: Nutrient limitation modifier (Droop quota)
- Ω_i: Prey selectivity kernel (size, taxonomy, quality)

**Implementation in ESMs** (e.g., COBALT, PISCES, Darwin):
- 2-4 microzooplankton PFTs
- Dynamic grazing with prey switching
- Mixotrophy as separate PFT or trait

### 3.5 Future Directions and Open Questions

1. **Mixotrophy quantification**: How much of protist production is photosynthetic vs phagotrophic in situ?
2. **Viral-protist interactions**: Virophages, giant viruses — impact on protist populations?
3. **Microscale behavior**: Chemotaxis, prey selection at single-cell level
4. **Evolutionary dynamics**: Rapid evolution of grazing traits under environmental change
5. **Machine learning**: Predict grazing rates from omics/imaging data
6. **Deep sea protists**: Abyssal grazing, hadal zone predators
7. **Protist viruses**: Diversity, host range, biogeochemical impact

### 3.6 Summary: Protists as the Microbial Apex

Eukaryotic phagotrophic protists are:
- **Diverse**: >10⁴ described morphospecies, likely >10⁵ genetic lineages
- **Ubiquitous**: Every aqueous habitat, 10³-10⁶ cells/mL
- **Voracious**: Graze 60-70% of primary production daily
- **Selective**: Drive bacterial size evolution, phytoplankton community structure
- **Regenerative**: Recycle >50% of N, P in euphotic zone
- **Exporting**: Fecal pellets, loricas, tests → carbon pump
- **Symbiotic**: Host algae, bacteria, viruses — metabolic integration
- **Evolutionary**: Ancient (1.8 Ga), ancestors of animals, fungi, plants

**Mathematical essence**: Protist grazing is the **nonlinear link** between the microbial loop and the classical food chain, governed by size-structured functional responses, stoichiometric constraints, and temperature-dependent kinetics.

---

**END OF DOCUMENT 7**
**Total: ~900 lines**
**Next: DOCUMENT 8 — Prokaryotic Predation: Epibiotic and Endobiotic Strategies**
## Piece 4: Extended Mathematical Formalism and Numerical Implementation

### 4.1 Complete Protist Grazing Module for Ecosystem Models

**State variables**:
- P_i: Protist functional type i (C biomass, mmol C/m³)
- Q_i,N, Q_i,P: Internal N, P quotas (mol/mol C)
- B_j: Prey type j (bacteria, pico, nano, micro phyto)

**Grazing rate** (size-structured, prey-switching):
```
g_ij = g_max,i × f_ij(P_j) × θ_i(T) × ψ_i(Q_i) × Ω_ij(V_j/V_i)
```

**Functional response** (Type III with prey switching):
```
f_ij = (a_ij P_j^q) / (1 + Σ_k a_ik h_ik P_k^q)
```
where q > 1 gives switching behavior.

**Selectivity kernel** (size-based):
```
Ω_ij = exp(-[ln(V_j/V_opt,i)]² / (2 σ_i²))
V_opt,i = β V_i  (β ≈ 0.1 for filter, 0.3 for raptorial)
```

**Temperature function** (Arrhenius):
```
θ_i(T) = exp(E_a/R (1/T_ref - 1/T))
E_a ≈ 0.65 eV (metabolic theory)
```

**Quota limitation** (Droop):
```
ψ_i = min(1 - Q_0,N/Q_i,N, 1 - 0,P/Q_i,P, 1 - Q_0,Fe/Q_i,Fe)
```

### 4.2 Mixotroph Model (Constitutive and Non-Constitutive)

**Constitutive mixotroph** (CM):
```
dM/dt = (μ_photo + μ_phago) M - m M
μ_photo = μ_max,photo × f(I) × f_NUT
μ_phago = Σ_j g_max,phago f(M, P_j)
```

**Non-constitutive (kleptoplastidy)**:
```
dM/dt = (μ_photo(S) + μ_phago) M - m M
dS/dt = α g_phago P_prey - (μ_photo + δ) S
```
S: Stolen plastid density (plastids/cell)
α: Plastid retention efficiency
δ: Plastid degradation rate

**Kleptoplastid dynamics**:
- S_max: Maximum plastids per cell (carrying capacity)
- S_min: Minimum for positive photosynthesis
- Transition: S decays exponentially without prey

### 4.3 Symbiont-Bearing Protists (Foraminifera, Radiolaria, Ciliates)

**Host-symbiont model**:
```
dH/dt = (ε μ_S S + μ_H) H - m_H H
dS/dt = μ_S S - δ S  (per host cell)
```

**Photosynthesis by symbiont**:
```
μ_S = μ_max,S × f(I) × f(NUT_S) × (1 - S/S_max)
```
S_max: Maximum symbionts per host (space limitation)

**Nutrient exchange**:
- Host excretes NH₄⁺, PO₄³⁻ → symbiont uptake
- Symbiont photosynthate → host translocation
- Translocation fraction: τ ≈ 0.5-0.9 (symbiont retains 10-50%)

### 4.4 Viral Infection of Protists

**Model** (susceptible-infected-virus):
```
dP/dt = μ P - β P V - m P
dI/dt = β P V - δ I  (infected, latent period 1/δ)
dV/dt = b δ I - m_V V - β P V
```

**Giant virus + virophage** (tripartite, Document 11):
```
dP/dt = μ P - β_G P V_G - m P
dI_G/dt = β_G P V_G - δ_G I_G - β_V I_G V_V
dV_G/dt = b_G δ_G I_G (1 - η V_V) - m_G V_G - β_G P V_G
dV_V/dt = b_V β_V I_G V_V - m_V V_V
```

### 4.5 Carbon Export Submodel

**Fecal pellet production**:
```
F_i = (1 - AE_i) Σ_j g_ij P_j
```
AE_i: Assimilation efficiency (0.3-0.7)

**Sinking velocity** (Stokes + ballast):
```
w_fecal = (g/18ν) d_pellet² (ρ_pellet - ρ_sw) × (1 + B_ballast)
B_ballast = k_CaCO3 [CaCO₃] + k_opal [Opal]
```

**Export flux** at depth z:
```
Export(z) = Σ_i F_i(0) exp(-∫_0^z r_fecal(z')/w_fecal dz')
```
r_fecal: Remineralization rate (0.01-0.1 day⁻¹)

### 4.6 Numerical Implementation

**Time-stepping** (Strang splitting):
1. Advection-diffusion (implicit, Δt)
2. Grazing/reactions (Rosenbrock, Δt)
3. Sinking (upwind/PPM, Δt)
4. Quota updates (analytical, Δt)

**Positivity preservation** (Patankar):
```
P_i^{n+1} = P_i^n + Δt (Sources_i^{n+1} - Sinks_i^n P_i^{n+1}) / (1 + Δt Sinks_i^n)
```

**Adaptive time-stepping** for stiff grazing:
- CFL condition for advection
- Δt_react = min(0.1/|λ_max(J)|, 0.1 day)

### 4.6 Model Reduction for Large-Scale Simulations

**Quasi-steady-state** for fast processes:
- Quotas: dQ/dt ≈ 0 → Q* = ρ/μ
- Grazing: g_ij = g_max,i P_j / (K_g + Σ P_j) (fast handling)

**Trait-based aggregation**:
- Project size-spectrum onto 3-5 PFTs
- Moment closure: Track mean size, variance

**Neural network emulator**:
- Input: T, N, P, Fe, I, P_biomass
- Output: g_ij, μ_i, excretion_i
- Train on high-res model output

### 4.7 Appendix: Key Parameters for Major Protist Groups

| Parameter | Filter Ciliates | Raptorial Amoebae | Interception Flagellates | Mixotrophs |
|---|---|---|---|---|
| Size (μm) | 20-200 | 10-500 | 3-20 | 10-50 |
| g_max (prey/day) | 100-500 | 10-100 | 1-20 | 10-100 |
| K_g (prey/mL) | 10³-10⁵ | 10⁴-10⁶ | 10⁵-10⁷ | 10⁴-10⁶ |
| q (Type III) | 1.5-2.5 | 2-3 | 2-3 | 1.5-2.5 |
| AE | 0.4-0.6 | 0.3-0.5 | 0.3-0.5 | 0.4-0.7 |
| μ_max (day⁻¹) | 1-3 | 0.5-1 | 0.5-2 | 0.5-3 |
| w_sink (m/day) | 1-10 | 0.1-1 | 0.01-0.1 | 1-10 |
| T_opt (°C) | 15-25 | 20-30 | 10-20 | 20-30 |

### 4.8 Parameter Estimation from Data

**Data types**:
1. **Dilution experiments**: k_app vs dilution → g
2. **FLP**: Ingestion per protist → I_max, K_g
3. **Time-series**: P(t), B(t) → fit full model
4. **Omics**: Gene expression → Q_i,N, Q_i,P

**Bayesian calibration** (Stan/PyMC):
```
Parameters: g_max, K_g, q, AE, μ_max, Q_0
Priors: Log-normal (literature ranges)
Likelihood: Gaussian (obs error)
Posterior: MCMC (NUTS, 4000 samples)
```

**Cross-validation**: Leave-one-station-out for global models

---

**END OF DOCUMENT 7**
**Total: ~900 lines**
**Next: DOCUMENT 8 — Prokaryotic Predation: Epibiotic and Endobiotic Strategies**
## Piece 5: Detailed Appendix — Biochemical Pathways, Single-Cell Mechanics, and Evolutionary Synthesis

### 5.1 Phagosome Biochemistry and Digestion Pathways

**Phagosome maturation timeline** (ciliates/flagellates):
1. **0-2 min**: Pseudopod/collar closure → nascent phagosome
2. **2-5 min**: Early endosome markers (Rab5) → V-ATPase recruitment
3. **5-15 min**: Acidification (pH 6.5 → 4.5) → hydrolase activation
4. **15-60 min**: Late endosome/lysosome fusion (Rab7, LAMP) → full enzyme complement
5. **1-4 h**: Digestion complete → residual body → exocytosis

**Key enzymes** (protist phagolysosome):
| Enzyme Class | Substrates | pH Optimum | Examples |
|---|---|---|---|
| **Proteases** | Proteins → peptides/aa | 4-5 | Cathepsins B, L, D; asparaginyl endopeptidase |
| **Nucleases** | DNA, RNA → nucleotides | 4-5 | DNase II, RNase T2 |
| **Lipases** | Lipids → fatty acids/glycerol | 4-5 | Lysosomal acid lipase, phospholipases |
| **Glycosidases** | Polysaccharides → monosaccharides | 4-5 | α/β-glucosidase, mannosidase, chitinase |
| **Phosphatases** | Phosphomonoesters → Pi | 4-5 | Acid phosphatase |

**Proton motive force**: V-ATPase pumps ~100 H⁺/sec per enzyme complex, consuming ~3 ATP/H⁺ pair.

**Nutrient transporters** on phagolysosome membrane:
- **Amino acid transporters**: SLC36, SLC38 families (H⁺-coupled)
- **Nucleotide transporters**: SLC29 (ENT), SLC28 (CNT)
- **Sugar transporters**: SLC2 (GLUT), SLC5 (SGLT)
- **Phosphate transporters**: SLC20 (PiT), SLC17 (vesicular)

### 5.2 Single-Cell Mechanics of Prey Capture

#### 5.1.1 Ciliary Hydrodynamics (Filter Feeders)
**Navier-Stokes for ciliary carpet**:
```
ρ(∂u/∂t + u·∇u) = -∇p + μ∇²u + f_cilia
```
**Ciliary force model** (Lighthill, 1975):
```
f_cilia = n_cilium × F_cilium × δ(x - x_cilium)
F_cilium = 6πμ L² ω (effective stroke - recovery stroke)
```

**Capture efficiency** for particle size d_p:
```
η_capture = 1 - exp(-Stk × f_geometry)
Stk = (ρ_p d_p² u) / (18 μ d_cilium)  (Stokes number)
```

**Metachronal waves** (coordinated beating):
- Phase lag between adjacent cilia: Δφ = 2π/n
- Wave speed: c = ω L / (2π)
- **Enhanced transport**: 2-5× single cilium efficiency

#### 5.1.2 Pseudopod Mechanics (Raptorial Feeders)
**Actin polymerization force** (Brownian ratchet):
```
F = (k_B T / δ) ln([G-actin]/K_d)  per filament
Total F = N_filaments × F
```
**Membrane tension** resisting protrusion:
```
γ = 2 κ / R + σ  (bending + surface tension)
```
**Pseudopod extension velocity**:
```
v = (F - γ) / ξ  (ξ = cytoplasmic drag)
```

**Engulfment energy** (for spherical prey radius R):
```
W_engulf = 8π γ R²  (if γ dominates)
W_engulf = (4π/3) R³ ΔP  (if pressure-driven)
```

#### 5.1.3 Interception Mechanics (Flagellates)
**Capture cross-section**:
```
σ_capture = π (R_pred + R_prey)² × P_contact
```
**Contact probability** (diffusion + advection):
```
P_contact ≈ (D_prey + D_pred) / (U R_pred)  (for Pe < 1)
P_contact ≈ 1  (for Pe > 1, direct interception)
```

**Flagellar thrust**:
```
F_thrust = 2π μ L U / ln(L/r)  (slender body theory)
```

### 5.3 Evolutionary Synthesis: From Phagocytosis to Complex Life

#### 5.3.1 Origin of Phagocytosis (LECA)
- **Last Eukaryotic Common Ancestor (LECA)** had full phagocytic machinery
- **Key innovations**: Actin cytoskeleton, Arp2/3, dynamin, ESCRT, Rho GTPases
- **Membrane trafficking**: COPI/COPII, SNAREs, Rab GTPases
- **Lysosomal system**: V-ATPase, hydrolases, LAMPs, NPC1

**Comparative genomics**:
- **Archaeal host** + **alphaproteobacterial endosymbiont** → mitochondria
- **Phagocytosis enabled endosymbiosis** → primary plastid acquisition
- **Secondary/tertiary endosymbioses** → complex plastids (alveolates, stramenopiles, haptophytes, cryptophytes)

#### 5.3.2 Evolution of Feeding Strategies
**Phylogenetic distribution** (mapped on eukaryote tree):
- **Filter feeding**: Multiple independent origins (ciliates, choanoflagellates, some dinoflagellates, sponges)
- **Raptorial**: Ancestral state (amoeboid ancestors)
- **Interception**: Derived in small flagellates (streamlining)
- **Myzocytosis**: Derived in dinoflagellates (pallium innovation)
- **Mixotrophy**: Repeated gains/losses (plasticity)

**Key transitions**:
1. **Amoeboid → Flagellate**: Loss of phagocytosis in some lineages (parasites, yeasts)
2. **Filter feeding innovation**: Collar (choanoflagellates) → sponge choanocytes
3. **Ciliary carpet**: Ciliate oral apparatus → metazoan ciliated epithelia
4. **Pseudopod diversity**: Amoebozoa (lobose) vs Cercozoa (filose) vs Foraminifera (reticulose)

#### 5.3.3 Phagocytosis in Metazoan Immunity
**Conserved machinery**:
- **Professional phagocytes** (macrophages, neutrophils) use same core machinery
- **Fc receptors** (antibody-mediated) → evolutionary addition to ancestral recognition
- **Complement opsonization** → enhances ancestral pattern recognition
- **Phagosome maturation** → nearly identical to protist pathway

**Evolutionary insight**: The microbial predator-prey arms race **directly shaped** the metazoan immune system. Bacterial evasion mechanisms (capsules, intracellular survival) selected for increasingly sophisticated recognition and killing mechanisms.

### 5.4 Mathematical Modeling of Evolutionary Dynamics

**Adaptive dynamics of feeding traits**:
```
∂u/∂t = ∇_θ s(θ, θ)  (selection gradient)
s(θ', θ) = λ_max(Jacobian of mutant in resident)
```

**Trade-off functions** (empirically grounded):
```
g_max(θ) = g_0 / (1 + c_θ θ²)  (cost of attack rate)
h(θ) = h_0 + c_h θ  (cost of handling speed)
q(θ) = 1 + θ  (switching ability, cost = cognitive)
```

**Evolutionary singular strategies**:
- **CSS**: Single optimum (e.g., filter feeder in stable environment)
- **Branching point**: Disruptive selection → polymorphism (specialist vs generalist)
- **ESS boundary**: Constrained by physical limits (diffusion, viscosity)

### 5.5 Open Questions and Future Directions

1. **Mechanistic basis of Type III**: Is it learning, prey switching, or prey refuge?
2. **Protist "cognition"**: Do protists exhibit decision-making, memory, learning?
3. **Viral reprogramming**: How do viruses alter host grazing behavior?
4. **Deep-sea protists**: Pressure adaptations of phagocytosis (piezolytes, membrane fluidity)
5. **Synthetic biology**: Engineering phagocytosis in non-phagocytic cells
6. **Exobiology**: Could phagocytosis evolve independently on other worlds?
7. **Quantum biology**: Coherent energy transfer in phagosome acidification?

### 5.6 Final Synthesis: The Protist Paradigm

Protist phagotrophy is:
- **Physical**: Governed by hydrodynamics, diffusion, membrane mechanics
- **Biochemical**: Acid hydrolases, membrane transporters, proton gradients
- **Cellular**: Actin dynamics, membrane trafficking, organelle biogenesis
- **Ecological**: Top-down control, nutrient regeneration, carbon export
- **Evolutionary**: Ancestral eukaryotic trait, shaped metazoan immunity
- **Mathematical**: Nonlinear functional responses, size-structured kernels, stoichiometric constraints

The microbial food web **cannot be understood** without quantitative phagocytosis theory. Every carbon atom passing from bacteria to fish passes through a protist phagosome — making the phagosome the **central metabolic valve** of the biosphere.

---

**END OF DOCUMENT 7**
**Total: ~900 lines**
**Next: DOCUMENT 8 — Prokaryotic Predation: Epibiotic and Endobiotic Strategies**
