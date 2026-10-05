# Document 11: Viral Shunt, Virophages, and Tripartite Parasitism ODEs
## Piece 1: The Viral Shunt — Lysis, Recycling, and Ecosystem Impact

Viruses are the most abundant biological entities on Earth (~10³¹ particles), and their lytic activity fundamentally reshapes microbial food webs through the **viral shunt** — the redirection of organic matter from higher trophic levels back into the dissolved organic matter (DOM) pool.

### 1.1 The Viral Shunt Mechanism

**Process**:
1. Virus infects host (bacteria, archaea, phytoplankton)
2. Host machinery hijacked for viral replication
3. Host cell lyses → releases progeny viruses + cellular contents
4. Cellular contents (DOM, POM, nutrients) enter dissolved/particulate pools
5. **Shunt**: Carbon/nutrients recycled to bacteria instead of flowing to grazers

**Stoichiometry of lysis** (typical marine bacterium):
- **Cell carbon**: ~20 fg C
- **Released DOM**: ~80% of cell C (proteins, nucleic acids, lipids, metabolites)
- **Released POM**: ~20% (cell debris, membrane fragments)
- **Nutrients**: N, P, Fe, vitamins released in Redfield proportions
- **Viral progeny**: 10-1000 virions per lysis (burst size)

### 1.2 Quantitative Impact of the Viral Shunt

**Global statistics**:
- **Marine viral abundance**: 10⁶-10⁸ viruses/mL
- **Infection rate**: 10-50% of bacteria infected daily
- **Lysis rate**: 10-40% of bacterial production
- **Carbon flux through shunt**: ~150 Gt C/yr (global)
- **Fraction of PP shunted**: 20-40% (marine), 10-20% (freshwater)

**Nutrient regeneration**:
- **N regeneration**: 30-70% of bacterial N demand met by viral lysis
- **P regeneration**: 20-50% of bacterial P demand
- **Iron regeneration**: Significant (Fe-binding proteins released)

### 1.3 Viral Shunt vs. Grazing — Carbon Flow Partitioning

**Carbon flow pathways** (marine):
```
Primary Production (PP)
    │
    ├── Grazing (20-30% PP) → Mesozooplankton → Fish → Export
    │
    ├── Viral Lysis (20-40% PP) → DOM → Bacteria → Shunt
    │       │
    │       ├── Respiration (CO₂) → Atmosphere
    │       ├── Bacterial Biomass → Grazing → Higher Trophic
    │       └── Refractory DOM (RDOC) → Long-term Storage
    │
    └── Sinking (10-20% PP) → Deep Ocean/Sediments
```

**Transfer efficiency**:
- **Grazing pathway**: ~10-20% of PP reaches mesozooplankton
- **Viral shunt pathway**: ~1-5% of PP reaches mesozooplankton (via bacteria)
- **Net effect**: Viral shunt **reduces** transfer efficiency to higher trophic levels

### 1.4 Host-Virus Population Dynamics (Classic Model)

**Model** (Beretta & Kuang, 1998):
```
dB/dt = μ B (1 - B/K) - β B V
dI/dt = β B V - δ I
dV/dt = b δ I - m V - β B V
```
- B: Susceptible bacteria
- I: Infected bacteria (latent)
- V: Free viruses
- β: Adsorption rate (mL/virus/h) ~ 10⁻¹⁰-10⁻⁸
- δ: Lysis rate (1/latent period) ~ 0.2-1 h⁻¹
- b: Burst size (virions/cell) ~ 10-1000
- m: Viral decay rate ~ 0.1-1 day⁻¹

**Basic reproductive ratio**:
```
R₀ = β b B / (m + β B)
```
- R₀ > 1: Virus invades
- R₀ < 1: Virus goes extinct

**Equilibrium** (coexistence):
```
B* = m / (β (b - 1))
V* = μ (1 - B*/K) / β
```
(requires b > 1)

**Stability**: Typically stable focus; oscillations damp quickly.

### 1.5 Virus-Host Coevolution (Red Queen Dynamics)

**Kill-the-Winner (KTW)** (Thingstad, 2000):
- Fastest-growing strain ("Winner") dominates
- Specialist virus targets Winner
- Winner suppressed → slower growers coexist
- **Diversity maintenance** via negative frequency-dependent selection

**Mathematical formulation**:
```
dB_i/dt = r_i B_i (1 - Σ B_j/K) - Σ_j β_ij B_i V_j
dV_j/dt = Σ_i b_ij β_ij B_i V_j - m_j V_j
```
- β_ij: Specificity (high for matching i-j)
- **Negative frequency dependence**: Rare hosts escape viruses

**Evolutionary implications**:
- **Rapid evolution**: Host surface receptors, viral tail fibers
- **Diversity maintenance**: Hundreds of coexisting strains
- **Genomic signatures**: dN/dS > 1 in receptor/tail fiber genes

### 1.6 Bridge to Piece 2

Piece 2 will cover **giant viruses**, **virophages**, and the **tripartite parasitism** systems (host-giant virus-virophage) with their ODE models and stability analysis.

## Piece 2: Giant Viruses, Virophages, and Tripartite Parasitism

### 2.1 Giant Viruses — The Nucleocytoviricota

**Discovery**: *Acanthamoeba polyphaga* mimivirus (APMV) — 2003
**Phylum**: Nucleocytoviricota (Megavirales)
**Characteristics**:
- **Genome size**: 0.5-2.5 Mb (larger than some bacteria)
- **Particle size**: 200-700 nm (visible by light microscopy)
- **Genes**: 500-2500 (including translation components!)
- **Hosts**: Amoebae, protists, algae, some animals
- **Replication**: Cytoplasmic "viral factories" (pseudo-nucleus)

**Major families**:
| Family | Example | Genome (Mb) | Host |
|---|---|---|---|
| Mimiviridae | APMV, CroV | 1.2 | Acanthamoeba, Cafeteria |
| Marseilleviridae | Marseillevirus | 0.4 | Acanthamoeba |
| Pandoraviridae | Pandoravirus | 2.5 | Acanthamoeba |
| Pithoviridae | Pithovirus | 0.6 | Acanthamoeba |
| Phycodnaviridae | EhV, EsV | 0.4 | Algae (Emiliania, Ectocarpus) |
| Asfarviridae | ASFV | 0.2 | Swine (African swine fever) |

**Unique features**:
- **Translation machinery**: tRNAs, aaRS, translation factors (incomplete)
- **DNA repair**: Homologous recombination, base excision
- **Metabolic genes**: Glycolysis, nucleotide synthesis
- **Virophage resistance**: MIMIVIRE system (CRISPR-like)

### 2.2 Virophages — Viruses of Viruses

**Discovery**: Sputnik (2008) — parasitizes mimivirus in *Acanthamoeba*
**Definition**: Small dsDNA viruses that replicate **only** in cells co-infected with a giant virus
**Characteristics**:
- **Genome**: 15-30 kbp (ssDNA or dsDNA)
- **Capsid**: Icosahedral, 50-75 nm
- **Genes**: 20-30 (no DNA pol, no transcription machinery)
- **Dependency**: Require giant virus factory for replication

**Known virophages**:
| Virophage | Giant Virus Host | Host Protist | Genome (kb) |
|---|---|---|---|
| Sputnik | Mimivirus | Acanthamoeba | 18 |
| Sputnik 2 | Lentille virus | Acanthamoeba | 18 |
| Sputnik 3 | Mimivirus | Acanthamoeba | 23 |
| Mavirus | CroV | Cafeteria | 19 |
| Zamilon | Mimivirus | Acanthamoeba | 17 |
| YSLV | YSLV giant virus | Amoeba | 25 |

### 2.3 Tripartite Parasitism Systems

**Three players**:
1. **Host** (eukaryotic protist): *Acanthamoeba*, *Cafeteria*
2. **Giant Virus** (GV): Mimivirus, CroV
3. **Virophage** (VP): Sputnik, Mavirus, Zamilon

**Interaction types**:

#### 2.3.1 Sputnik-Mimivirus-Acanthamoeba (Paired Entry)
- **Entry**: Sputnik attaches to mimivirus capsid fibers → co-phagocytosed
- **Infection**: Mimivirus establishes viral factory → Sputnik hijacks it
- **Effect**: Sputnik delays mimivirus late gene expression
- **Outcome**: 70% reduction in mimivirus yield; amoeba survival ↑

#### 2.3.2 Mavirus-CroV-Cafeteria (Independent Entry)
- **Entry**: Mavirus enters independently (receptor-mediated endocytosis)
- **Integration**: Mavirus encodes **rve-integrase** → integrates into host genome
- **Provirus state**: Dormant until CroV infection triggers reactivation
- **Outcome**: Mavirus inhibits CroV production; host dies but neighbors protected

#### 2.3.3 Zamilon-Mimivirus (Resistance)
- **Zamilon**: Infects mimivirus but **does not** reduce yield
- **Mimivirus resistance**: MIMIVIRE system (CRISPR-like) targets Zamilon
- **Evolutionary arms race**: Zamilon evolves escape mutations

### 2.4 Mathematical Models of Tripartite Systems

#### 2.1.1 Independent Entry Model (Mavirus-CroV)

**State variables** (Yau et al., 2018):
- N: Naive host cells
- P: Provirus-carrying hosts (Mavirus integrated)
- C: CroV giant virus
- V: Mavirus virophage

**ODEs** (Yau et al., PLOS Comput Biol 2018):
```
dN/dt = r N (1 - (N+P)/K) - β_C N C - β_V N V
dP/dt = β_V N V - β_C P C - δ P
dC/dt = b_C β_C (N + P) C - m_C C
dV/dt = b_V β_V N V - m_V V - β_C V C
```

**Parameters**:
- β_C, β_V: Adsorption rates (CroV, Mavirus)
- b_C, b_V: Burst sizes
- δ: Provirus loss rate
- m_C, m_V: Decay rates

**Key feature**: Integration rate β_V creates provirus reservoir P.

#### 2.1.2 Paired Entry Model (Sputnik-Mimivirus)

**State variables**:
- N: Naive amoebae
- M: Mimivirus-infected
- S: Sputnik-infected (co-infected with mimivirus)

**ODEs**:
```
dN/dt = r N (1 - N/K) - β_M N M
dM/dt = β_M N M - α M S - m_M M
dS/dt = α M S - m_S S
```

**Key parameter**: α = inhibition coefficient (0 < α < 1)
- α → 0: Strong virophage inhibition
- α → 1: Weak inhibition

### 2.5 Stability Analysis of Tripartite Systems

#### 2.5.1 Mavirus Model Stability

**Equilibria**:
1. **Extinction**: N=P=C=V=0
2. **Host only**: N=K, P=C=V=0
3. **Host-CroV**: Coexistence (N*, C*), P=V=0
4. **Full coexistence**: N*, P*, C*, V* > 0

**Jacobian** at full coexistence (4×4):
- Eigenvalues determine stability
- **Hopf bifurcation** possible → limit cycles

**Key result** (Yau et al.):
- Without virophage (V=0): Host-CroV system shows **limit cycles** (boom-bust)
- With virophage (V>0, α small): **Stable equilibrium** (damped oscillations)
- **Virophage stabilizes** the host-virus system!

**Mechanism**: Virophage acts as **top predator on the virus** → reduces viral pressure on host → prevents host overexploitation → system stabilizes.

### 2.6 Ecological Implications

#### 2.6.1 Population Control
- **Giant viruses**: Major mortality for protists (10-30% daily)
- **Virophages**: Reduce giant virus impact → increase host survival
- **Net effect**: Virophages **increase** protist population density

#### 2.6.2 Nutrient Cycling
- **Giant virus lysis**: Releases DOM, nutrients (like viral shunt)
- **Virophage moderation**: Reduces lysis intensity → smoother nutrient release
- **Provirus reservoir** (Mavirus): Long-term genetic memory

#### 2.6.3 Evolutionary Arms Race
- **Giant virus** evolves resistance to virophage (MIMIVIRE)
- **Virophage** evolves counter-resistance (escape mutations)
- **Host** evolves resistance to giant virus
- **Three-way Red Queen**: Coevolutionary dynamics in 3D trait space

### 2.7 Bridge to Piece 3

Piece 3 will cover **mathematical analysis of tripartite ODEs**, **bifurcation diagrams**, **stochastic effects**, **spatial models**, and **experimental validation**.

## Piece 3: Mathematical Analysis of Tripartite ODEs

### 3.1 Complete ODE Systems

#### 3.1.1 Independent Entry Model (Mavirus-CroV-Cafeteria)

**Variables**:
- N: Naive hosts
- P: Provirus carriers (Mavirus integrated)
- C: CroV giant virus
- V: Mavirus virophage

**Full ODE System** (Yau et al., 2018):
```
dN/dt = r N (1 - (N+P)/K) - β_C N C - β_V N V
dP/dt = β_V N V - β_C P C - δ P
dC/dt = b_C β_C (N + P) C - m_C C
dV/dt = b_V β_V N V - m_V V - β_C V C
```

**Parameters** (typical values):
| Parameter | Value | Units |
|---|---|---|
| r | 0.5-2 | day⁻¹ |
| K | 10⁵-10⁶ | cells/mL |
| β_C | 10⁻¹⁰-10⁻⁸ | mL/virus/day |
| β_V | 10⁻¹⁰-10⁻⁸ | mL/virus/day |
| b_C | 100-1000 | virions/cell |
| b_V | 10-50 | virions/cell |
| m_C | 0.1-1 | day⁻¹ |
| m_V | 0.1-1 | day⁻¹ |
| δ | 0.01-0.1 | day⁻¹ |

#### 3.1.2 Paired Entry Model (Sputnik-Mimivirus)

**Simplified system** (host-mimivirus-sputnik):
```
dN/dt = r N (1 - N/K) - β_M N M
dM/dt = β_M N M - α M S - m_M M
dS/dt = α M S - m_S S
```

### 3.2 Equilibrium Analysis

#### 3.2.1 Disease-Free Equilibrium (DFE)
**State**: N=K, P=C=V=0 (or N=K, M=S=0)
**Stability condition**: R₀ < 1
- **CroV R₀**: R₀,C = β_C b_C K / m_C
- **Mavirus R₀**: R₀,V = β_V b_V K / m_V

**Invasion thresholds**:
- CroV invades if R₀,C > 1
- Mavirus invades if R₀,V > 1 (and CroV present for replication)

#### 3.2.2 Endemic Equilibrium (Full Coexistence)

**Mavirus model** (full coexistence N*, P*, C*, V* > 0):
From dP/dt = 0: β_V N* V* = (β_C C* + δ) P*
From dV/dt = 0: b_V β_V N* = m_V + β_C C*
From dC/dt = 0: b_C β_C (N* + P*) = m_C
From dN/dt = 0: r N*(1 - (N*+P*)/K) = β_C N* C* + β_V N* V*

**Existence condition**: R₀,C > 1 and R₀,V > 1 (with C* > 0)

**Provirus fraction at equilibrium**:
```
P*/N* = β_V V* / (β_C C* + δ)
```

### 3.3 Stability Analysis

#### 3.3.1 Jacobian Matrix (4×4)

**Jacobian J** at endemic equilibrium:
```
J = [ ∂f_N/∂N   ∂f_N/∂P   ∂f_N/∂C   ∂f_N/∂V
      ∂f_P/∂N   ∂f_P/∂P   ∂f_P/∂C   ∂f_P/∂V
      ∂f_C/∂N   ∂f_P/∂P   ∂f_C/∂C   ∂f_C/∂V
      ∂f_V/∂N   ∂f_V/∂P   ∂f_V/∂C   ∂f_V/∂V ]
```

**Elements** (at equilibrium):
- ∂f_N/∂N = r(1 - 2N*/K) - r P*/K - β_C C* - β_V V*
- ∂f_N/∂P = -r N*/K
- ∂f_N/∂C = -β_C N*
- ∂f_N/∂V = -β_V N*
- ∂f_P/∂N = β_V V*
- ∂f_P/∂P = -β_C C* - δ
- ∂f_P/∂C = -β_C P*
- ∂f_P/∂V = β_V N*
- ∂f_C/∂N = b_C β_C C*
- ∂f_C/∂P = b_C β_C C*
- ∂f_C/∂C = b_C β_C (N* + P*) - m_C = 0 (at equilibrium)
- ∂f_V/∂N = β_V V*
- ∂f_V/∂P = 0
- ∂f_V/∂C = -β_C V*
- ∂f_V/∂V = b_V β_V N* - m_V - β_C C* = 0 (at equilibrium)

**Stability criterion**: All eigenvalues of J have Re(λ) < 0
- **Routh-Hurwitz** criteria for 4×4 system

#### 3.2.3 Hopf Bifurcation Analysis

**Characteristic polynomial**:
```
λ⁴ + a₁ λ³ + a₂ λ² + a₃ λ + a₄ = 0
```

**Routh-Hurwitz conditions** for stability:
1. a₁ > 0
2. a₁ a₂ > a₃
3. a₁ a₂ a₃ > a₁² a₄ + a₃²
4. a₄ > 0

**Hopf bifurcation** when:
```
a₁ a₂ a₃ = a₁² a₄ + a₃²
```
- At this point: Pair of complex conjugate eigenvalues crosses imaginary axis
- **Limit cycle** emerges (stable if supercritical, unstable if subcritical)

**Bifurcation parameter**: β_V (virophage adsorption rate)
- As β_V increases: Oscillations emerge → stable equilibrium
- **Stabilizing effect**: Higher virophage pressure dampens oscillations

### 3.3 Bifurcation Diagrams

#### 3.3.1 β_V as Bifurcation Parameter

**Regimes** (as β_V increases):
1. **β_V = 0**: Host-CroV limit cycle (boom-bust)
2. **Low β_V**: Damped oscillations → stable equilibrium
3. **Intermediate β_V**: Stable focus (damped oscillations)
4. **High β_V**: Stable node (no oscillations)

**Critical β_V values**:
- β_V,1: Hopf bifurcation (oscillations → damped)
- β_V,2: Transition to stable node

**Phase diagram** (β_C vs β_V):
- **Region I**: Host only (both R₀ < 1)
- **Region II**: Host-CroV coexistence (R₀,C > 1, R₀,V < 1 or V=0)
- **Region III**: Full coexistence (both R₀ > 1)
- **Region IV**: Host extinction (if r too low)

### 3.3 Stochastic Effects

#### 3.2.1 Demographic Stochasticity

**Chemical Langevin Equation**:
```
dN = [r N (1-N/K) - β_C N C - β_V N V] dt + √(...) dW₁
dP = [β_V N V - β_C P C - δ P] dt + √(...) dW₂
dC = [b_C β_C (N+P) C - m_C C] dt + √(...) dW₃
dV = [b_V β_V N V - m_V V - β_C V C] dt + √(...) dW₄
```

**Extinction risk**: 
- Small populations → demographic noise → extinction
- **Quasi-stationary distribution**: Conditional on non-extinction

#### 3.2.2 Environmental Stochasticity

**Ornstein-Uhlenbeck noise** on parameters:
```
dr = θ_r (r̄ - r) dt + σ_r dW
dβ_C = θ_β (β̄_C - β_C) dt + σ_β dW
```

**Stochastic resonance**: Noise can induce oscillations in stable deterministic system

### 3.3 Spatial Models

#### 3.3.1 Reaction-Diffusion System

```
∂N/∂t = D_N ∇²N + r N (1 - (N+P)/K) - β_C N C - β_V N V
∂P/∂t = D_P ∇²P + β_V N V - β_C P C - δ P
∂C/∂t = D_C ∇²C + b_C β_C (N+P) C - m_C C
∂V/∂t = D_V ∇²V + b_V β_V N V - m_V V - β_C V C
```

**Diffusion coefficients**:
- D_N, D_P ≈ 10⁻⁶ cm²/s (amoeba motility)
- D_C, D_V ≈ 10⁻⁵ cm²/s (virus diffusion)

**Pattern formation**:
- **Turing patterns**: If D_V >> D_N (virophage diffuses faster)
- **Traveling waves**: Infection fronts propagating through population

**Wave speed** (Fisher-KPP):
```
c = 2 √(D_C (b_C β_C K - m_C))
```

### 3.4 Bridge to Piece 4

Piece 4 will cover **experimental validation**, **parameter estimation**, **metagenomic evidence**, **evolutionary dynamics**, and **synthesis** of viral ecology in microbial food webs.

## Piece 4: Experimental Validation, Evolutionary Dynamics, and Synthesis

### 4.1 Experimental Validation of Tripartite Models

#### 4.1.1 Laboratory Co-Culture Systems

**Mavirus-CroV-Cafeteria roenbergensis** (Fischer & Suttle, 2011):
- **Setup**: *Cafeteria roenbergensis* + CroV + Mavirus
- **Measurements**: Flow cytometry (host, virus counts), qPCR (provirus), plaque assays
- **Key findings**:
  - Mavirus integrates into host genome (provirus)
  - CroV infection → Mavirus reactivation
  - Mavirus inhibits CroV production by ~90%
  - Host population survives better with Mavirus

**Sputnik-Mimivirus-Acanthamoeba** (La Scola et al., 2008):
- **Setup**: *Acanthamoeba polyphaga* + Mimivirus + Sputnik
- **Measurements**: Electron microscopy, plaque assays, qPCR
- **Key findings**:
  - Sputnik co-enters with mimivirus (paired entry)
  - Sputnik reduces mimivirus yield by ~70%
  - Amoeba survival increased in presence of Sputnik

**Zamilon-Mimivirus** (Gaia et al., 2016):
- **MIMIVIRE system**: CRISPR-like immunity in mimivirus
- **Zamilon resistance**: Mimivirus stores Zamilon sequences → degrades Zamilon DNA
- **Coevolution**: Zamilon evolves escape mutations

#### 4.1.2 Natural Environment Surveys

**Metagenomic surveys** (Tara Oceans, freshwater lakes):
- **Giant virus diversity**: 1000+ viral populations (NCLDV)
- **Virophage diversity**: 100+ virophage populations
- **Co-occurrence**: Giant viruses and virophages co-occur in same samples
- **Host linkage**: CRISPR spacers, tRNA matches, proximity ligation

**Single-cell genomics**:
- **SAGs** (Single Amplified Genomes): Infected protist cells
- **Provirus detection**: Mavirus integrated in *Cafeteria* genomes
- **Activity**: RNA-seq shows active transcription during infection

### 4.2 Parameter Estimation from Data

#### 4.1.1 Time-Series Fitting

**Data**: Host (Cafeteria), CroV, Mavirus counts over 20-30 days
**Methods**:
1. **MLE**: Fit ODE model to time-series (L-BFGS-B)
2. **Bayesian MCMC**: Stan/PyMC for full posterior
3. **Profile likelihood**: Identifiability analysis

**Key identifiable parameters**:
- β_C, β_V (adsorption rates)
- b_C, b_V (burst sizes)
- m_C, m_V (decay rates)
- δ (provirus loss rate)

**Typical fitted values** (Yau et al., 2018):
| Parameter | Estimate | 95% CI |
|---|---|---|
| β_C | 2.5×10⁻⁹ | (1.8-3.2)×10⁻⁹ mL/day |
| β_V | 1.2×10⁻⁹ | (0.8-1.6)×10⁻⁹ mL/day |
| b_C | 320 | (250-400) |
| b_V | 22 | (15-30) |
| m_C | 0.85 | (0.7-1.0) day⁻¹ |
| m_V | 0.45 | (0.3-0.6) day⁻¹ |
| δ | 0.02 | (0.01-0.04) day⁻¹ |

**Model validation**: Cross-validation (leave-last-week-out)

### 4.2 Evolutionary Dynamics

#### 4.2.1 Adaptive Dynamics of Virophage Traits

**Evolving traits**:
- **β_V** (adsorption rate): Higher → better infection
- **b_V** (burst size): Higher → more progeny
- **Integration rate**: Higher → more provirus

**Trade-offs**:
- β_V vs host range (specialist vs generalist)
- b_V vs V size (genome size constraint)
- Integration rate vs host fitness cost

**Selection gradient** (adaptive dynamics):
```
D(θ) = ∂s(θ',θ)/∂θ'|_{θ'=θ}
```
where s = invasion fitness

**Singular strategies**:
- **CSS**: Stable coexistence (ESS + convergence stable)
- **Branching point**: Evolutionary branching → polymorphism
- **ESS boundary**: Constrained by biophysics

#### 4.2.2 Red Queen Coevolution

**Three-way arms race**:
1. **Host** ↔ **Giant Virus**: Receptor vs tail fiber
2. **Giant Virus** ↔ **Virophage**: Factory hijacking vs resistance (MIMIVIRE)
3. **Host** ↔ **Virophage**: Provirus integration vs host defense

**Coevolutionary cycles**:
- **Phase 1**: Host resistant → GV rare → VP rare
- **Phase 2**: Host susceptible → GV common → VP common
- **Phase 3**: VP suppresses GV → Host recovers
- **Cycle repeats**: Period ~ 10-50 generations

**Molecular signatures**:
- **Positive selection** (dN/dS > 1): Tail fibers, capsid proteins, integrases
- **Recombination**: Modular evolution of host-interaction domains
- **Gene gain/loss**: Accessory genes for host manipulation

### 4.3 Ecological Synthesis: Viruses as Ecosystem Engineers

#### 4.1.1 Viral Shunt + Virophage Modulation

**Net carbon flow** (with virophage):
```
PP → Viral Lysis (GV) → DOM → Bacteria
      ↑
      Virophage (reduces GV lysis)
```

**Net effect of virophage**:
- **Reduces** giant virus lysis → **less DOM released**
- **Increases** host protist survival → **more grazing** on bacteria
- **Net carbon export**: Potentially **increased** (more grazing → fecal pellets)

#### 4.1.2 Nutrient Cycling Impact

**Nutrient release** (per lysis event):
- **Giant virus lysis**: ~1000 fg C, 200 fg N, 20 fg P
- **Virophage modulation**: Reduces lysis frequency → smoother release

**Stoichiometric effect**:
- Giant viruses: High N/P in capsids → N,P release
- Virophages: Smaller, lower N/P
- **Net N:P release**: Altered by virophage presence

#### 4.1.3 Community Structure

**Top-down control**:
- **Without virophage**: GV boom-bust → host boom-bust → bacterial boom-bust
- **With virophage**: GV damped → stable host → stable bacteria

**Diversity maintenance**:
- **Kill-the-Winner** (GV on protists) + **Kill-the-Winner** (VP on GV)
- **Nested KTW**: Multi-level diversity maintenance

### 4.2 Evolutionary Synthesis

#### 4.2.1 The Virus-Virophage-Host Triangle

**Three-way interaction**:
```
Host ←→ Giant Virus ←→ Virophage
  ↑_______________________↓
```
- **Host ↔ GV**: Classic predator-prey (boom-bust)
- **GV ↔ VP**: Parasite-hyperparasite (stabilizing)
- **Host ↔ VP**: Mutualism? (VP protects host from GV)

**Evolutionary outcomes**:
1. **Stable coexistence**: All three persist
2. **VP extinction**: GV evolves complete resistance
3. **GV extinction**: VP too virulent (rare)
4. **Host extinction**: Uncontrolled GV (if VP absent)

#### 4.2.2 Genomic Evidence for Long-Term Coevolution

**MIMIVIRE system** (mimivirus):
- CRISPR-like: Stores virophage sequences
- Cas-like nuclease degrades virophage DNA
- **Adaptive immunity** in a virus!

**Provirus fossil record**:
- Mavirus integrations in *Cafeteria* genomes
- **Molecular clock**: Integration events dated to millions of years
- **Vertical transmission**: Provirus inherited with host

**Horizontal gene transfer**:
- Virophage genes in host genomes (integrases, capsid)
- Giant virus genes in virophages (DNA pol fragments)
- **Gene sharing network**: Host-GV-VP triad

### 4.3 Global Biogeochemical Impact

#### 4.3.1 Carbon Cycling

**Giant viruses in oceans**:
- **Abundance**: 10⁴-10⁶ particles/mL (surface)
- **Infection rate**: 1-10% of protists daily
- **Carbon flux**: 0.1-1 Gt C/yr through GV lysis

**Virophage modulation**:
- **Without VP**: GV lysis → 0.5 Gt C/yr to DOM
- **With VP**: GV lysis reduced 50% → 0.25 Gt C/yr to DOM
- **Net**: Virophages redirect ~0.25 Gt C/yr from shunt to grazing

#### 4.3.2 Climate Relevance

**DMSP/DMS production**:
- Some protists produce DMSP (climate-cooling gas)
- GV lysis releases DMSP → bacterial consumption → DMS
- **VP protection** of DMSP-producers → more DMS → climate cooling

**Carbon export**:
- Protist survival → more fecal pellets → carbon export
- **VP enhances** biological pump efficiency

### 4.4 Summary: Viruses as Multilayered Regulators

The viral world in microbial ecosystems operates at **multiple nested levels**:

1. **Viruses** (shunt): Redirect carbon from grazing to DOM recycling
2. **Giant viruses**: Specialized predators of protists, create viral factories
3. **Virophages**: Hyperparasites that stabilize host-virus dynamics
4. **Proviruses**: Genomic memory, long-term coexistence

**Mathematical essence**: The tripartite ODE system reveals that **parasitism of a parasite can stabilize an otherwise unstable predator-prey system**. This is a fundamental principle: **adding a trophic level can stabilize food webs** (contrary to classical intuition).

**Evolutionary insight**: The **MIMIVIRE system** demonstrates that **adaptive immunity** evolved not just in vertebrates, but also in the viral world — blurring the line between "living" and "non-living."

**Future frontiers**:
- **Virophage therapy**: Engineered virophages against pathogenic giant viruses?
- **Synthetic virophages**: Designer hyperparasites for biocontrol?
- **Deep Earth virophages**: Do they exist in subsurface ecosystems?
- **Exobiology**: Virus-virophage systems as biosignatures?

---

**END OF DOCUMENT 11**
**Total: ~900 lines**
**Next: DOCUMENT 12 — Winogradsky Column: Stratified Redox Ecosystem Synthesis**
## Piece 5: Mathematical Appendix, Parameter Tables, and Final Synthesis

### 5.1 Complete ODE Systems Summary

#### 5.1.1 Standard Virus-Host (2 Species)
```
dB/dt = μ B (1 - B/K) - β B V
dI/dt = β B V - δ I
dV/dt = b δ I - m V - β B V
```
- R₀ = β b B / (m + β B)
- Coexistence: B* = m/(β(b-1)), V* = μ(1-B*/K)/β

#### 5.1.2 Mavirus-CroV-Cafeteria (4 Species)
```
dN/dt = r N (1 - (N+P)/K) - β_C N C - β_V N V
dP/dt = β_V N V - β_C P C - δ P
dC/dt = b_C β_C (N + P) C - m_C C
dV/dt = b_V β_V N V - m_V V - β_C V C
```

#### 5.1.3 Sputnik-Mimivirus-Acanthamoeba (3 Species)
```
dN/dt = r N (1 - N/K) - β_M N M
dM/dt = β_M N M - α M S - m_M M
dS/dt = α M S - m_S S
```

### 5.2 Key Parameter Tables

#### 5.2.1 Virus-Host Parameters

| Parameter | Symbol | Bacteriophage | Giant Virus | Virophage |
|---|---|---|---|---|
| Adsorption rate | β | 10⁻¹⁰-10⁻⁸ mL/h | 10⁻¹⁰-10⁻⁸ mL/day | 10⁻¹⁰-10⁻⁸ mL/day |
| Burst size | b | 10-500 | 100-1000 | 10-50 |
| Latent period | 1/δ | 20-60 min | 4-12 h | 6-24 h |
| Decay rate | m | 0.1-1 h⁻¹ | 0.1-1 day⁻¹ | 0.1-1 day⁻¹ |
| Burst size variance | σ²_b | ~b (Poisson) | ~b/2 | ~b/2 |

#### 5.2.2 Host Parameters

| Parameter | Symbol | Bacteria | Protists |
|---|---|---|---|
| Max growth rate | μ_max | 1-3 day⁻¹ | 0.5-2 day⁻¹ |
| Carrying capacity | K | 10⁶-10⁹ cells/mL | 10³-10⁶ cells/mL |
| Half-saturation | K_s | 0.1-10 μM | 0.1-10 μM |

#### 5.2.3 Virophage-Specific Parameters

| Parameter | Symbol | Sputnik | Mavirus | Zamilon |
|---|---|---|---|---|
| Genome size | — | 18 kb | 19 kb | 17 kb |
| Capsid size | — | 50 nm | 75 nm | 60 nm |
| Integration | — | No | Yes (rve) | No |
| Provirus loss | δ | — | 0.01-0.1 day⁻¹ | — |
| Inhibition coeff | α | 0.7 | 0.3 | 1.0 |

### 5.3 Analytical Solutions

#### 5.3.1 Steady States (Mavirus Model)

**Full coexistence**:
```
C* = (m_V - b_V β_V N*) / β_C
V* = (β_C C* + δ) P* / (β_V N*)
P*/N* = β_V V* / (β_C C* + δ)
N* solves: r(1 - (N+P)/K) = β_C C + β_V V
```

#### 5.2.2 Invasion Thresholds

**CroV R₀**: R₀,C = β_C b_C K / m_C
**Mavirus R₀**: R₀,V = β_V b_V K / m_V
**Sputnik R₀**: R₀,S = α b_S / m_S (within mimivirus)

### 5.3 Bifurcation Summary

| Bifurcation | Parameter | Condition | Effect |
|---|---|---|---|
| Transcritical | R₀ = 1 | Virus invades | DFE loses stability |
| Hopf | Tr(J) = 0 | Delay/params | Limit cycles emerge |
| Saddle-node | Det(J) = 0 | High D/β | Bistability |
| Branching | ∂²s/∂θ² = 0 | Trade-offs | Polymorphism |

### 5.3 Numerical Methods

#### 5.3.1 ODE Solvers
- **Non-stiff**: Dormand-Prince (RK45), tolerance 1e-6
- **Stiff**: CVODE (BDF), LSODA, Radau IIA
- **With delays**: DDE solvers (dde23, dde_solver)

#### 5.2.2 Stochastic Simulation
- **Gillespie SSA**: Exact for discrete populations
- **Tau-leaping**: Approximate for large populations
- **Chemical Langevin**: Continuous approximation

#### 5.2.3 Bifurcation Software
- **AUTO-07p**: Continuation, bifurcation tracking
- **MatCont**: MATLAB toolbox
- **PyDSTool**: Python toolbox
- **XPPAUT**: Classic bifurcation tool

### 5.4 Experimental Parameter Estimation

#### 5.4.1 Key Assays

| Assay | Measures | Parameters |
|---|---|---|
| Plaque assay | Infectious units | β, b, m |
| One-step growth curve | Latent period, burst | δ, b |
| Adsorption assay | Adsorption kinetics | β |
| qPCR/ddPCR | Absolute quantification | N, V, P |
| Flow cytometry | Cell/virus counts | B, V, N |
| Single-cell genomics | Provirus detection | P, integration rate |

#### 5.2.2 Fitting Methods

| Method | Use Case | Pros |
|---|---|---|
| MLE (NLS) | Time-series, known errors | Fast, standard errors |
| Bayesian MCMC | Full uncertainty, priors | Full posterior |
| Profile likelihood | Identifiability | Rigorous |
| ABC | Intractable likelihood | Model flexibility |
| Ensemble Kalman | Data assimilation | Real-time |

### 5.5 Synthesis: The Viral Multiverse

The microbial world is governed by a **hierarchy of parasitism**:

**Level 1: Bacteriophages** (10³¹ particles)
- Shunt carbon from bacteria to DOM
- Drive bacterial diversity (KTW)
- Horizontal gene transfer

**Level 2: Giant Viruses** (10⁶-10⁸ particles/mL)
- Predators of protists
- Create viral factories
- Encode translation machinery

**Level 3: Virophages** (10⁴-10⁶ particles/mL)
- Hyperparasites of giant viruses
- Stabilize host-virus dynamics
- Provirus integration (Mavirus)

**Level 4: Proviruses** (genomic fossils)
- Long-term memory
- Vertical transmission
- Evolutionary record

**Mathematical unification**:
All levels described by **nested ODE systems** with:
- **Mass action** infection terms
- **Thermodynamic constraints** (energy, genome size)
- **Evolutionary feedback** (R₀ optimization)
- **Spatial structure** (diffusion, biofilms)

**Unsolved problems**:
1. **Quantum virology**: Coherent effects in viral assembly?
2. **Viral dark matter**: Unknown viral diversity (>90%)
3. **Virus-virophage-protist-bacteria**: 4-level models
4. **Synthetic virophages**: Engineered hyperparasites
5. **Exoviral ecology**: Viruses in extraterrestrial oceans?

### 5.5 Final Reflection

The viral world is not a **peripheral accessory** to microbial ecology — it is the **central organizing force**. From the viral shunt that recycles 25% of marine primary production, to the giant viruses that encode their own ribosomes, to the virophages that tame the giants, viruses write the **evolutionary script** of microbial life.

**Mathematical virology** — the application of dynamical systems, game theory, and information theory to viral systems — is revealing that viruses are not merely **parasites** but **architects of biological complexity**. The tripartite systems studied here demonstrate that **parasitism of a parasite can stabilize an ecosystem**, a principle that likely extends across all scales of biological organization.

As we continue to sequence, model, and experimentally probe the viral world, we are not just cataloging diversity — we are uncovering the **fundamental algorithms of life**.

---

**END OF DOCUMENT 11**
**Total: ~900 lines**
**Next: DOCUMENT 12 — Winogradsky Column: Stratified Redox Ecosystem Synthesis**
