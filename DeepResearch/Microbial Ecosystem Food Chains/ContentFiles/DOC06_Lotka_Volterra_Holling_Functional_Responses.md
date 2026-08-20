# Document 6: Lotka-Volterra Paradigm with Holling Functional Responses
## Piece 1: Foundations of Predator-Prey Theory in Microbial Ecology

The **Lotka-Volterra (LV) equations** are the cornerstone of mathematical ecology. Originally developed independently by Alfred Lotka (1925) and Vito Volterra (1926) for chemical kinetics and fishery statistics, they provide the minimal mathematical framework for understanding predator-prey oscillations. In microbial ecology, they describe the dynamics of bacteria-protist, phytoplankton-zooplankton, and virus-host interactions.

### 1.1 Classical Lotka-Volterra Model

**Assumptions**:
1. Prey grows exponentially in absence of predators
2. Predation rate proportional to both prey and predator densities (mass action)
3. Predator growth proportional to prey consumed
4. Predators die exponentially without prey
5. No time delays, spatial homogeneity, constant environment

**Equations** (prey N, predator P):
```
dN/dt = r N - a N P
dP/dt = ε a N P - m P
```

**Parameters**:
- r: Prey intrinsic growth rate (1/time)
- a: Attack rate / search rate (volume/time)
- ε: Conversion efficiency (predator biomass / prey biomass)
- m: Predator mortality rate (1/time)

**Equilibria**:
1. **Trivial**: (0, 0) — unstable (saddle)
2. **Predator-free**: (K, 0) where K → ∞ (no carrying capacity in basic LV)
3. **Coexistence**: (N*, P*) = (m/(ε a), r/a)

**Dynamics at coexistence**:
- Neutral cycles (center): Eigenvalues λ = ±i√(rm)
- Period: T = 2π/√(rm)
- Prey leads predator by 1/4 cycle
- Amplitude depends on initial conditions (not structurally stable)

### 1.2 Limitations of Classical LV for Microbial Systems

1. **No prey carrying capacity** → unrealistic exponential growth
2. **Linear functional response** (Type I) → infinite consumption at high prey
3. **No handling time** → predators can eat infinitely fast
4. **No prey refuge** → extinction possible
5. **No time delays** → maturation, digestion ignored
6. **No spatial structure** → patchiness, refuges ignored
7. **No stoichiometric constraints** → fixed conversion efficiency

**Microbial-specific issues**:
- Bacteria have carrying capacity (nutrients)
- Protists have handling time (ingestion, digestion)
- Viruses have latency period (eclipse phase)
- Stoichiometry varies (C:N:P not fixed)

### 1.3 Logistic Lotka-Volterra (Rosenzweig-MacArthur)

**Add prey carrying capacity K**:
```
dN/dt = r N (1 - N/K) - a N P
dP/dt = ε a N P - m P
```

**Equilibria**:
1. (0, 0) — unstable
2. (K, 0) — stable if r < 0 or m > ε a K
3. **Coexistence**: 
   N* = m/(ε a)
   P* = (r/a) (1 - N*/K) = (r/a) (1 - m/(ε a K))

**Existence condition**: N* < K → m < ε a K

**Stability** (Jacobian at coexistence):
```
J = [ -r N*/K,    -a N*;
       ε a P*,       0 ]
```
Trace = -r N*/K < 0, Determinant = r a ε N* P*/K > 0
→ **Always stable** (node or spiral)

**Paradox of Enrichment** (Rosenzweig, 1971):
As K increases:
- N* constant = m/(ε a)
- P* increases
- System approaches Hopf bifurcation when N* = K/2
- For K > 2N*: Limit cycles emerge (destabilization!)
- **Enrichment can cause extinction** via large oscillations

### 1.4 Holling Functional Responses

Holling (1959a,b,c) derived functional responses from **mechanistic assumptions** about predator behavior:

**Disk equation** (Type II):
- Predator searches at rate a, handles prey for time h
- Total time = T = search_time + handling_time = N_eaten/a + h N_eaten
- Fraction of time searching = 1/(1 + a h N)
- Ingestion rate = a N / (1 + a h N)

**Type I** (linear, no saturation):
```
f(N) = a N  (for N < N_max)
f(N) = a N_max (for N ≥ N_max)
```
- No handling time, no satiation
- Appropriate for filter feeders at low prey density

**Type II** (hyperbolic, saturating):
```
f(N) = a N / (1 + a h N)
```
- a: attack rate (search rate)
- h: handling time per prey
- Maximum ingestion: 1/h
- Half-saturation: N_½ = 1/(a h)

**Type III** (sigmoidal):
```
f(N) = a N² / (1 + a h N²)  (Holling)
f(N) = a N^q / (1 + a h N^q)  (Generalized, q > 1)
```
- Learning, switching, or prey refuge at low density
- Prey can persist at low density (refuge)

**Type IV** (dome-shaped, inhibition at high prey):
```
f(N) = a N / (1 + a h N + b N²)
```
- Prey interference, toxicity, or predator confusion

### 1.5 Rosenzweig-MacArthur with Holling Type II

```
dN/dt = r N (1 - N/K) - a N P / (1 + a h N)
dP/dt = ε a N P / (1 + a h N) - m P
```

**Equilibria**:
1. (0, 0) — unstable
2. (K, 0) — stable if m > ε a K/(1 + a h K)
3. **Coexistence** (N*, P*):
   N* = m / (ε a - m h)  (requires ε a > m h)
   P* = (r/a) (1 - N*/K) (1 + a h N*)

**Stability**: Jacobian trace = r(1 - 2N*/K) - a P*/(1 + a h N*)²
- **Destabilization** occurs when N* < K/2 (enrichment)
- **Limit cycles** for high K, low m, high a, high h
- **Extinction risk** increases with enrichment

### 1.6 Microbial Parameter Values

| Parameter | Bacteria-Protist | Phytoplankton-Zooplankton | Virus-Bacteria |
|---|---|---|---|
| r (day⁻¹) | 1-3 | 0.5-2 | 5-50 (burst size) |
| K (cells/mL) | 10⁶-10⁷ | 10³-10⁵ (Chl) | 10⁶-10⁸ |
| a (mL/cell/day) | 10⁻⁹-10⁻⁷ | 10⁻⁸-10⁻⁶ | 10⁻¹⁰-10⁻⁸ |
| h (day) | 0.01-0.1 | 0.1-1 | 0.1-1 (latent) |
| ε | 0.2-0.5 | 0.3-0.7 | 10-100 (burst) |
| m (day⁻¹) | 0.1-0.5 | 0.05-0.2 | 0.1-1 (decay) |

### 1.7 Bridge to Piece 2

Piece 2 will cover **Holling Type III in detail**, **stability analysis with functional responses**, **time-delayed models**, and **stochastic extensions** for microbial predator-prey systems.

## Piece 2: Holling Type III — Sigmoidal Responses and Prey Refuges

### 2.1 Mechanisms for Type III Response

Type III response (sigmoidal) arises from:
1. **Learning**: Predators improve search image with experience
2. **Prey switching**: Predators switch to abundant prey types
3. **Prey refuge**: Prey hide at low density (aggregation, size refuge)
4. **Predator interference**: At low prey, predators interfere with each other
4. **Functional response of filtering**: For filter feeders, capture efficiency increases with concentration

**Mathematical forms**:
- **Holling (1959)**: f(N) = a N² / (1 + a h N²)
- **Generalized**: f(N) = a N^q / (1 + a h N^q), q > 1
- **Ivlev**: f(N) = a (1 - exp(-b N)) ≈ a b N for small N
- **Sigmoidal with threshold**: f(N) = a (N - N₀)² / (1 + a h (N - N₀)²) for N > N₀

### 2.2 Type III with Prey Refuge

**Explicit refuge model** (Sih, 1987):
```
f(N) = a (N - N_refuge) / (1 + a h (N - N_refuge))  for N > N_refuge
f(N) = 0  for N ≤ N_refuge
```
where N_refuge = constant or fraction of N.

**Proportional refuge**: N_refuge = ρ N
```
f(N) = a (1-ρ) N / (1 + a h (1-ρ) N)
```
Equivalent to Type II with reduced attack rate a' = a(1-ρ).

**Dynamic refuge** (prey behavior):
```
dN/dt = r N (1 - N/K) - f(N) P - m N
f(N) = a N / (1 + a h N) × (1 - φ(N))
φ(N) = exp(-β N)  (refuge effectiveness increases with density)
```

### 2.3 Stability with Type III Response

**Rosenzweig-MacArthur with Type III** (q=2):
```
dN/dt = r N (1 - N/K) - a N² P / (1 + a h N²)
dP/dt = ε a N² P / (1 + a h N²) - m P
```

**Coexistence equilibrium**:
N* = √[m / (ε a - m h)]  (requires ε a > m h)
P* = (r/a) (1 - N*/K) (1 + a h N*²) / N*

**Stability analysis** (Jacobian):
```
J = [ r(1-2N*/K) - 2a N* P*/(1+a h N*²)²,   -a N*²/(1+a h N*²);
       2ε a N* P*/(1+a h N*²)²,              0 ]
```

**Key difference from Type II**: 
- At low N*, derivative ∂f/∂N → 0 (vs a for Type II)
- **Stabilizing**: Predator cannot overexploit rare prey
- **No paradox of enrichment** for pure Type III (or much weaker)
- **Prey persistence** at low density guaranteed

**Hopf bifurcation** condition:
Trace = 0 → r(1 - 2N*/K) = 2a N* P*/(1 + a h N*²)²
- Occurs at higher K than Type II
- Often no bifurcation for biologically realistic parameters

### 2.4 Experimental Evidence for Type III in Microbes

**Protists grazing on bacteria**:
- *Pelagostrombidium mirabile* on bacteria: Type III (Verity, 1985)
- *Spumella* sp. on bacteria: Type III at low bacteria, Type II at high
- *Paramecium* on bacteria: Type II (no refuge)

**Mechanisms identified**:
- **Bacterial aggregation**: At low density, bacteria form microcolonies (harder to graze)
- **Size refuge**: Small bacteria (< 0.5 μm) escape filter feeders
- **Motility refuge**: Fast bacteria escape raptorial feeders
- **Protist learning**: *Oxyrrhis marina* improves capture with experience

**Size-selective grazing** (Thingstad et al.):
- Grazing rate g(V) peaks at intermediate prey size (~1-3 μm)
- Very small: hydrodynamic escape (Type III-like)
- Very large: handling limitation (Type II)
- **Community effect**: Grazing selects for size extremes → bimodal size distribution

### 2.5 Multi-Prey Type III (Switching)

**Murdoch-Oaten switching** (1975):
```
f_i = a_i N_i^q / (Σ_j a_j N_j^q) × (Total ingestion)
```
where q > 1 gives switching behavior.

**Optimal foraging prediction**: q ≈ 2 (frequency-dependent selection)

**Community consequences**:
- Rare prey protected (positive frequency dependence)
- **Stabilizes coexistence** of competing prey
- **Apparent competition** via shared predator
- **Alternative stable states** possible

### 2.6 Bridge to Piece 3

Piece 3 will cover **time-delayed predator-prey models**, **stochastic LV models**, **spatial extensions (reaction-diffusion)**, and **ratio-dependent functional responses** for microbial systems.

## Piece 3: Time Delays, Stochasticity, and Ratio-Dependent Responses

### 3.1 Time-Delayed Predator-Prey Models

**Biological delays**:
- **Gestation/maturation**: τ_g (prey → predator conversion)
- **Digestion**: τ_d (ingestion → biomass)
- **Latency period** (viruses): τ_L (infection → lysis)

**Delay differential equations (DDE)**:
```
dN/dt = r N (1 - N(t-τ_g)/K) - a N P
dP/dt = ε a N(t-τ_g) P(t-τ_g) - m P
```
or with distributed delay (gamma kernel):
```
dP/dt = ε ∫_0^∞ k(τ) a N(t-τ) P(t-τ) dτ - m P
k(τ) = τ^{n-1} e^{-nτ/τ̄} / (τ̄^n Γ(n))  (gamma, mean τ̄, shape n)
```

**Stability with discrete delay**:
Characteristic equation: λ² + A λ + B + C e^{-λ τ} = 0
- **Hopf bifurcation** at critical τ = τ_c
- τ > τ_c → sustained oscillations (even if ODE stable)
- Larger τ → larger amplitude, longer period

**Virus-host model** (Beretta & Kuang, 1998):
```
dB/dt = r B (1 - B/K) - β B V
dI/dt = β B V - δ I  (infected, not yet lysing)
dV/dt = b δ I - m V - β B V  (b = burst size)
```
- **Critical burst size** for persistence: b > m/β + δ/β
- **Oscillations** intrinsic due to I-V delay

### 3.2 Stochastic Predator-Prey Models

**Demographic noise** (finite populations):
```
dN = [r N (1-N/K) - a N P] dt + √[r N (1-N/K) + a N P] dW₁
dP = [ε a N P - m P] dt + √[ε a N P + m P] dW₂
```

**Environmental noise** (fluctuating parameters):
```
dN = [r(t) N (1-N/K) - a N P] dt
r(t) = r₀ + σ ξ(t)  (Ornstein-Uhlenbeck)
```

**Extinction risk**:
- Mean time to extinction (MTE) scales exponentially with population size
- MTE ~ exp(N* / σ²) for demographic noise
- **Quasi-stationary distribution**: Conditional on non-extinction
- **Critical community size** for persistence: N* > ~50 (demographic)

**Stochastic resonance**: Noise can induce oscillations in stable deterministic system

### 3.3 Ratio-Dependent Functional Response

**Arditi-Ginzburg (1989)**: Predation depends on **prey:predator ratio** N/P
```
f(N,P) = a (N/P) / (1 + a h (N/P)) = a N / (P + a h N)
```

**Arguments for ratio-dependence**:
1. **Predator interference**: Search rate decreases with predator density
2. **Mechanistic derivation**: Mutual interference (Hassell-Varley, Beddington-DeAngelis)
3. **Empirical support**: Some field data fit better than prey-dependent

**Ratio-dependent LV**:
```
dN/dt = r N (1 - N/K) - a N P / (P + a h N)
dP/dt = ε a N P / (P + a h N) - m P
```

**Dynamics**:
- **No paradox of enrichment** (K doesn't destabilize)
- **Bistability**: (K,0) and coexistence both stable for some params
- **Extinction risk** higher at low N (Allee effect for predator)
- **Limit cycles** possible but different structure

**Beddington-DeAngelis** (unifies prey- and ratio-dependent):
```
f(N,P) = a N / (1 + a h N + c P)
```
- c = interference coefficient
- c → 0: Prey-dependent (Holling II)
- c → ∞: Ratio-dependent

### 3.4 Spatial Predator-Prey (Reaction-Diffusion)

**Reaction-diffusion system**:
```
∂N/∂t = D_N ∇²N + r N (1 - N/K) - f(N) P
∂P/∂t = D_P ∇²P + ε f(N) P - m P
```

**Turing patterns** (diffusion-driven instability):
Requires: D_P >> D_N (predator diffuses faster)
- **Spots/stripes** of high/low density
- Wavelength λ ~ 2π √(D_P D_N / (f_N ε f_N - f_P r))

**Traveling waves** (invasion):
- Predator invades prey-only state
- Wave speed c = 2 √(D_P (ε f'(N*) N* - m))
- **Waves of chase**: Predator chases prey in oscillatory wake

**Patch models** (metapopulation):
```
dN_i/dt = r N_i (1 - N_i/K) - f(N_i) P_i + D_N Σ_j (N_j - N_i)
dP_i/dt = ε f(N_i) P_i - m P_i + D_P Σ_j (P_j - P_i)
```
- **Rescue effect**: Migration prevents local extinction
- **Synchrony** vs **asynchrony** depending on coupling

### 3.5 Microbial Applications of Spatial Models

**Marine snow / particle-associated**:
- Bacteria on particles = prey
- Protists grazing on particles = predators
- **Diffusion limited** to particle surface
- **Encounter rates** enhanced by particle concentration

**Biofilm predator-prey**:
- *Bdellovibrio* (predator) vs *E. coli* (prey) in biofilm
- 2D diffusion on surface
- **Rippling waves** (Myxococcus) = traveling waves

**Chemostat with spatial structure**:
- Immobilized prey (biofilm) + free predator
- Coexistence via spatial refuge

### 3.6 Bridge to Piece 4

Piece 4 will cover **multi-species extensions** (food chains, omnivory, intraguild predation), **adaptive dynamics of functional responses**, and **evolutionary stable strategies** for microbial predators.

## Piece 4: Multi-Species Extensions, Food Chains, and Adaptive Dynamics

### 4.1 Food Chains and Trophic Cascades

**3-species chain** (Nutrient → Prey → Predator → Top predator):
```
dN/dt = D(N_in - N) - ρ(N) P₁
dP₁/dt = μ(N) P₁ - f₁(P₁) P₂ - m₁ P₁
dP₂/dt = ε₁ f₁(P₁) P₂ - f₂(P₂) P₃ - m₂ P₂
dP₃/dt = ε₂ f₂(P₂) P₃ - m₃ P₃
```

**Trophic cascade** (Hairston-Smith-Slobodkin):
- Top predator (P₃) suppresses P₂ → P₁ increases → N decreases
- **Odd chain**: Top predator benefits plants (N)
- **Even chain**: Top predator harms plants
- **Strength** depends on functional response types at each level

**Cascade in microbes**:
- Viruses (top) → protists → bacteria → DOM → phytoplankton
- Protists (top) → bacteria → phytoplankton (via nutrient regeneration)
- **Viral shunt** weakens classic cascade by recycling nutrients

### 4.2 Omnivory and Intraguild Predation

**Omnivory** (P₂ eats both P₁ and P₃'s prey):
```
dP₂/dt = ε₁ f₁(P₁) P₂ + ε₃ f₃(P₃) P₂ - m₂ P₂
```
- **Stabilizing** (P₂ has alternative food)
- **Destabilizing** if P₂ strongly suppresses P₁ (apparent competition)
- **Persistence** of P₃ requires ε₁ f₁(P₁) < m₂ (P₂ not too efficient on P₁)

**Intraguild predation** (Polis et al.):
- P₂ (IG predator) eats P₁ (IG prey) AND competes for shared resource N
- **Coexistence conditions**:
  1. P₂ must be better competitor for N
  2. P₂ must not overexploit P₁
  3. **Priority effects**: Who arrives first matters

**Microbial examples**:
- Mixotrophic protists (photosynthesize + graze) = omnivores
- Large ciliates eating small ciliates + shared bacteria = IGP
- Viruses infecting protists that eat bacteria = viral IGP

### 4.3 Apparent Competition

**Two prey (N₁, N₂) sharing predator P**:
```
dN₁/dt = r₁ N₁ (1 - N₁/K₁) - f₁(N₁) P
dN₂/dt = r₂ N₂ (1 - N₂/K₂) - f₂(N₂) P
dP/dt = ε₁ f₁(N₁) P + ε₂ f₂(N₂) P - m P
```

**Apparent competition**: Increase in N₁ → more P → N₂ declines
- **Not direct competition** (no shared resource)
- **Mediated by shared predator**
- **Exclusion** if one prey supports P above other's threshold

**Microbial example**: Two bacterial strains, one protist grazer
- Fast-growing strain supports high grazer density → slow strain excluded
- **Coexistence** if grazer has Type III (prey switching) or spatial structure

### 4.4 Adaptive Dynamics of Functional Responses

**Evolutionary question**: What functional response (a, h, q) evolves?

**Trade-offs**:
- High a (attack rate) ↔ high metabolic cost
- Low h (handling time) ↔ low digestion efficiency
- High q (switching) ↔ cognitive/neural cost

**Adaptive dynamics framework** (Geritz et al., 1998):
1. **Resident** with trait θ
2. **Mutant** with trait θ'
3. **Invasion fitness**: s(θ', θ) = growth rate of rare mutant
4. **Selection gradient**: D(θ) = ∂s/∂θ'|_{θ'=θ}
5. **Singular strategy** θ*: D(θ*) = 0
6. **Evolutionary stability**: ∂²s/∂θ'² < 0
7. **Convergence stability**: ∂D/∂θ < 0

**Evolutionary outcomes**:
- **CSS (Continuously Stable Strategy)**: ESS and convergence stable
- **Branching point**: Convergence stable but not ESS → **evolutionary branching** (dimorphism)
- **Repellor**: Not convergence stable
- **Garden of Eden**: ESS but not convergence stable

### 4.5 Evolution of Functional Response Parameters

**Attack rate (a) evolution**:
- High a favored when prey rare (need to find prey)
- Low a favored when prey abundant (avoid handling saturation)
- **Trade-off**: a vs metabolic cost c(a) = c₀ + c₁ a²

**Handling time (h) evolution**:
- Low h favored for high prey density (process more prey)
- High h may allow better digestion (higher ε)
- **Trade-off**: h vs conversion efficiency ε(h) = ε_max - ε₁ h

**Switching exponent (q) evolution**:
- q > 1 (Type III) favored when multiple prey, rare prey need protection
- q = 1 (Type II) favored when single prey, no learning needed
- **Evolutionary branching**: Coexistence of specialist (q=1) and generalist (q>1)

### 4.6 Coevolution of Predator and Prey

**Prey defense** (v, virulence, size, aggregation):
- Defense reduces a or increases h
- **Cost of defense**: Lower r or higher m

**Predator counter-adaptation**:
- Overcome defense (higher a, lower h)
- **Cost**: Lower ε or higher m

**Red Queen dynamics** (Van Valen, 1973):
- Continuous coevolutionary arms race
- **Cycles in trait space** (Red Queen cycles)
- **Evolutionary branching** → diversification

**Microbial Red Queen**:
- Bacteria evolve phage resistance (surface receptor modification)
- Phages evolve counter-resistance (new receptor binding)
- **Diversity maintenance** via negative frequency-dependent selection
- **Kill-the-Winner** dynamics (Thingstad, 2000)

### 4.7 Kill-the-Winner (KTW) Model

**Mechanism** (Thingstad & Lignell, 1997):
1. Fastest growing strain (Winner) dominates
2. Specialist predator (virus, protist) targets Winner
3. Winner controlled → slower growers coexist
4. New Winner emerges → cycle continues

**Mathematical formulation**:
```
dN_i/dt = r_i N_i (1 - Σ N_j/K) - Σ_j f_{ij} N_i P_j
dP_j/dt = ε_j f_{ij} N_i P_j - m_j P_j
```
- **Specialist predators**: f_{ij} high for specific i
- **Negative frequency-dependence**: Rare prey escape predation

**Predictions**:
- **Stable coexistence** of many strains (paradox of plankton)
- **Power-law abundance distribution** (Zipf's law)
- **Strain turnover** on timescale of predation

### 4.8 Bridge to Piece 5

Piece 5 will provide **mathematical appendix** with analytical solutions, bifurcation diagrams, numerical methods for DDE/stochastic models, and **parameter estimation techniques** for functional response parameters from microbial time-series data.

## Piece 5: Mathematical Appendix — Analytical Solutions, Bifurcations, and Parameter Estimation

### 5.1 Analytical Solutions for Classical LV

**Classical LV** (no K, Type I):
```
dN/dt = r N - a N P
dP/dt = ε a N P - m P
```

**First integral** (conserved quantity):
```
H(N,P) = ε a N - m ln N + a P - r ln P = constant
```

**Phase plane trajectories**: Closed orbits around (m/εa, r/a)
**Period**: T = 2π / √(rm) (exact for linearized, approximate for nonlinear)

**Time series** (parametric):
```
N(t) = N* [1 + (N(0)/N* - 1) cos(ω t) + ...]
P(t) = P* [1 + (P(0)/P* - 1) sin(ω t) + ...]
```
where ω = √(rm), N* = m/(εa), P* = r/a

### 5.2 Logistic LV with Type II (Rosenzweig-MacArthur)

**Equations**:
```
dN/dt = r N (1 - N/K) - a N P / (1 + a h N)
dP/dt = ε a N P / (1 + a h N) - m P
```

**Coexistence equilibrium**:
```
N* = m / (ε a - m h)  (requires ε a > m h)
P* = (r/a) (1 - N*/K) (1 + a h N*)
```

**Jacobian at equilibrium**:
```
J = [ r(1 - 2N*/K) - a P*/(1 + a h N*)²,   -a N*/(1 + a h N*);
       ε a P*/(1 + a h N*)²,              0 ]
```

**Characteristic equation**: λ² - Tr λ + Det = 0
```
Tr = r(1 - 2N*/K) - a P*/(1 + a h N*)²
Det = ε a² N* P*/(1 + a h N*)² > 0
```

**Stability**: 
- Stable if Tr < 0 (spiral or node)
- Unstable if Tr > 0 (unstable spiral)
- **Hopf bifurcation** at Tr = 0

**Hopf condition** (critical K):
```
K_Hopf = 2 N* (1 + a h N*)² / (1 + a h N* (2 - ε))
```
For K > K_Hopf: Limit cycles

**Limit cycle approximation** (near Hopf):
- Amplitude ∝ √(K - K_Hopf)
- Period T ≈ 2π / √(Det) at bifurcation
- **Period increases** with K (slower oscillations)

### 5.3 Type III Model Bifurcations

**Equations** (q=2):
```
dN/dt = r N (1 - N/K) - a N² P / (1 + a h N²)
dP/dt = ε a N² P / (1 + a h N²) - m P
```

**Equilibrium**:
```
N* = √[m / (ε a - m h)]
P* = (r/a) (1 - N*/K) (1 + a h N*²) / N*
```

**Trace**:
```
Tr = r(1 - 2N*/K) - 2a N* P*/(1 + a h N*²)²
```

**Key result**: Tr < 0 for all K if a h N*² > 1 (strong satiation)
- **No Hopf bifurcation** for pure Type III with q=2
- **No paradox of enrichment**
- Prey has **effective refuge** at low density

### 5.4 Delay Differential Equations (DDE) Analysis

**Discrete delay DDE**:
```
dN/dt = r N (1 - N(t-τ)/K) - a N P
dP/dt = ε a N(t-τ) P(t-τ) - m P
```

**Linearization** at (N*, P*):
```
d/dt [δN; δP] = J_0 [δN; δP] + J_τ [δN(t-τ); δP(t-τ)]
```

**Characteristic equation**:
```
λ² - (Tr_0 + Tr_τ e^{-λτ}) λ + Det_0 + Det_τ e^{-λτ} = 0
```

**Stability boundary** (Hopf):
- Find τ = τ_c where λ = iω is a root
- Separate real/imaginary parts:
  -ω² + Det_0 + Det_τ cos(ωτ) = 0
  -ω(Tr_0 + Tr_τ cos(ωτ)) + Det_τ sin(ωτ) = 0

**Critical delay**:
```
τ_c = (1/ω) arccos[(ω² - Det_0)/Det_τ]
```
where ω satisfies ω⁴ + (Tr_0² - 2Det_0 - Tr_τ²)ω² + (Det_0² - Det_τ²) = 0

### 5.5 Bifurcation Diagrams

**Standard bifurcation diagrams** (K as parameter):
```
P* 
│     ● (unstable)
│    ╱
│   ╱  Limit cycle amplitude
│  ╱
│ ╱ 
●────────────────────── (stable equilibrium)
│
└──────────────────────── K
  K_Hopf
```

**Bistability** (ratio-dependent, Allee):
```
P*
│     ● (stable)
│    ╱│
│   ╱ │
│  ╱  │  Unstable equilibrium (separatrix)
│ ╱   │
●─────┼──────────── K
```

**Hysteresis** (subcritical Hopf):
```
P*
│     ● (stable large cycle)
│    ╱╲
│   ╱  ╲  Unstable cycle
│  ╱    ╲
●──────────╲──── (stable equilibrium)
│         ╲
│          ╲
└──────────────── K
```

### 5.6 Parameter Estimation from Time-Series Data

**Data**: N(t_i), P(t_i) with measurement error

**Methods**:
1. **Nonlinear least squares** (NLS):
   ```
   min_θ Σ [N(t_i) - N_model(t_i;θ)]²/σ_N² + [P(t_i) - P_model(t_i;θ)]²/σ_P²
   ```

2. **State-space / Kalman filtering**:
   - Process model: N(t+1) = N(t) + f(N,P;θ) Δt + process_noise
   - Observation model: y = N + obs_noise
   - Kalman filter for likelihood
   - MLE or Bayesian

3. **Bayesian inference** (MCMC, Stan):
   - Prior on θ (physiological ranges)
   - Likelihood from state-space model
   - Posterior: P(θ|data) ∝ P(data|θ) P(θ)

4. **Synthetic likelihood** (for intractable likelihood):
   - Simulate many trajectories for given θ
   - Fit Gaussian to summary statistics
   - Use synthetic likelihood in MCMC

**Identifiability issues**:
- r and a often correlated (both affect prey growth rate)
- ε and a correlated (both affect predator growth)
- K and m correlated
- **Solution**: Joint estimation with multiple experiment types (chemostat, batch, dilution)

**Profile likelihood** for identifiability:
```
PL(θ_i) = min_{θ_j≠i} -2 log L(θ)
```
- Flat profile → unidentifiable
- Sharp minimum → identifiable

### 5.7 Experimental Designs for Functional Response

**Type I/II/III discrimination**:
1. **Short-term feeding experiments** (fixed predator, varying prey):
   - Measure ingestion rate over 1-4 hours
   - Plot ingestion vs prey density
   - Fit models: f = aN, f = aN/(1+ahN), f = aN²/(1+ahN²)
   - **AIC/BIC** for model selection

2. **Time-series in chemostat**:
   - Vary dilution rate D
   - Measure steady-state N*, P*
   - Fit full model (ρ, μ, g, m, ε)

3. **Dilution experiments** (Landry & Hassett, 1982):
   - Dilute natural sample with particle-free water
   - Measure apparent growth rate vs dilution
   - Separate growth from grazing

4. **Video microscopy** (single-cell):
   - Track individual predator-prey encounters
   - Measure handling time, attack rate directly
   - **Distribution of handling times** (not just mean)

### 5.8 Numerical Methods for Parameter Estimation

**Gradient-based** (for NLS, MLE):
- Levenberg-Marquardt (scipy.optimize.least_squares)
- L-BFGS-B (bound constraints)

**Derivative-free** (for black-box simulators):
- Nelder-Mead (simplex)
- CMA-ES (covariance matrix adaptation)
- Bayesian optimization (Gaussian process)

**MCMC samplers** (Bayesian):
- NUTS (No-U-Turn Sampler, Stan, PyMC)
- Metropolis-Hastings (simple)
- SMC (Sequential Monte Carlo, for sequential data)

**Approximate Bayesian Computation (ABC)**:
- When likelihood intractable
- Simulate data, accept if distance(obs, sim) < ε
- SMC-ABC for efficiency

### 5.9 Model Selection and Validation

**Information criteria**:
- AIC = -2 log L + 2k (k = parameters)
- BIC = -2 log L + k log n
- WAIC / LOO-CV (Bayesian, predictive)

**Cross-validation**:
- Time-series CV: Rolling window (predict next h steps)
- Block CV: Leave out time blocks

**Posterior predictive checks**:
- Simulate from posterior predictive
- Compare summary statistics (mean, var, autocorr, extremes)
- **Bayesian p-values**

### 5.10 Summary: LV-Holling in Microbial Ecology

| System | Functional Response | Key Parameters | Key Phenomena |
|---|---|---|---|
| Bacteria-Protist | Type III (size refuge) | a ~ 10⁻⁹, h ~ 0.01, q ~ 2 | Coexistence, size bimodality |
| Phyto-Zooplankton | Type II/III | a ~ 10⁻⁸, h ~ 0.1 | Blooms, paradox of enrichment |
| Virus-Bacteria | Type II (with delay) | β ~ 10⁻¹⁰, τ ~ 0.5 day | Cycles, boom-bust |
| Myxococcus-prey | Type II (cooperative) | a swarm-dependent | Rippling waves, threshold |

**Future directions**:
- **Trait-based functional responses** (a, h, q as evolving traits)
- **Stochastic functional responses** (individual variation)
- **Spatially explicit** (microscale patchiness)
- **Multi-predator, multi-prey** (food web modules)
- **Eco-evolutionary dynamics** (LV + adaptive dynamics)

---

**END OF DOCUMENT 6**
**Total: ~900 lines**
**Next: DOCUMENT 7 — Eukaryotic Phagotrophic Protist Grazing Mechanics**
