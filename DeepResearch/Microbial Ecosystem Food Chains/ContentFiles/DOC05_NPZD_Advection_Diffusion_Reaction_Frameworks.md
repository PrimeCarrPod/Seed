# Document 5: NPZD+B Advection-Diffusion-Reaction Frameworks
## Piece 1: Foundations of NPZD Models and the Biological Pump

The **NPZD (Nutrient-Phytoplankton-Zooplankton-Detritus)** model is the canonical framework for modeling lower trophic level marine ecosystems. The **NPZD+B** extension adds explicit **bacteria (B)** and **dissolved organic matter (DOM)** to close the microbial loop.

### 1.1 Historical Development

**Riley (1946)**: First quantitative plankton model (N-P-Z)
**Steele (1958)**: Light limitation, vertical structure
**Fasham et al. (1990)**: ERSEM — European Regional Seas Ecosystem Model (NPZD with multiple nutrients)
**Franks et al. (1986)**: NPZD with physical coupling (advection-diffusion)
**Anderson (2005)**: Plankton functional types (PFTs) in NPZD
**Follows et al. (2007)**: Trait-based / size-structured NPZD (Darwin Project)

### 1.2 Basic NPZD Equations (0D, No Physics)

**State variables**:
- N: Nutrient (e.g., nitrate, mmol N/m³)
- P: Phytoplankton (mmol N/m³ or mg Chl/m³)
- Z: Zooplankton (mmol N/m³)
- D: Detritus (mmol N/m³)

**Equations**:
```
dN/dt = -μ(N) P + g(Z) + r_D D
dP/dt = μ(N) P - g(Z) - m_P P
dZ/dt = ε g(Z) - m_Z Z
dD/dt = m_P P + (1-ε) g(Z) + m_Z Z - r_D D
```

**Processes**:
- **μ(N)**: Phytoplankton growth (Monod, Droop, or light-limited)
- **g(Z)**: Grazing (Holling Type II or III)
- **m_P, m_Z**: Mortality (linear or quadratic)
- **r_D**: Remineralization (detritus → nutrient)
- **ε**: Grazing assimilation efficiency (0.3-0.7)

**Conservation**: d(N+P+Z+D)/dt = 0 (closed N cycle)

### 1.3 NPZD+B: Adding Bacteria and DOM

**Additional state variables**:
- B: Bacteria (mmol N/m³ or mmol C/m³)
- DOM_L: Labile dissolved organic matter
- DOM_R: Refractory dissolved organic matter (optional)

**Extended equations** (C-based, with N quotas):
```
dN/dt = -ρ_N(N) P - ρ_B,N B + (1-ε_Z) g_Z + r_D D + r_B B
dP/dt = μ_P(Q_P) P - g_Z(P,Z) - m_P P
dQ_P/dt = ρ_N(N) - μ_P Q_P  (Droop quota)
dB/dt = μ_B(Q_B) B - g_B(B,Z) - m_B B
dQ_B/dt = ρ_B(DOM_L) - μ_B Q_B  (Droop for bacteria)
dDOM_L/dt = f_exudate μ_P P + (1-BGE) ρ_B B + lysis + sloppy - ρ_B B - k_phot DOM_L
dDOM_R/dt = f_RDOC ρ_B B - k_RDOC DOM_R
dZ/dt = ε_Z g_Z - m_Z Z
dD/dt = m_P P + (1-ε_Z) g_Z + m_B B + m_Z Z - r_D D
```

**Key additions**:
- Bacterial DOM uptake (ρ_B)
- BGE parameterization
- Viral lysis (lysis)
- Sloppy feeding (sloppy)
- MCP (f_RDOC)

### 1.4 Coupling to Physics: Advection-Diffusion-Reaction

**General ADR equation** for tracer C(x,t):
```
∂C/∂t + ∇·(v C) = ∇·(K ∇C) + R(C)
```
where:
- v(x,t): 3D velocity field (m/s)
- K(x,t): Turbulent diffusivity tensor (m²/s)
- R(C): Reaction terms (biological sources/sinks)

**In components** (Cartesian, incompressible flow):
```
∂C/∂t + u ∂C/∂x + v ∂C/∂y + w ∂C/∂z 
= ∂/∂x (K_x ∂C/∂x) + ∂/∂y (K_y ∂C/∂y) + ∂/∂z (K_z ∂C/∂z) + R(C)
```

**For NPZD+B tracers** (N, P, B, DOM, Z, D):
```
∂N/∂t + ∇·(v N) = ∇·(K ∇N) + R_N(N,P,B,DOM,Z,D)
∂P/∂t + ∇·(v P) = ∇·(K ∇P) + R_P(N,P,B,DOM,Z,D) - w_P ∂P/∂z
∂B/∂t + ∇·(v B) = ∇·(K ∇B) + R_B(N,P,B,DOM,Z,D)
∂DOM/∂t + ∇·(v DOM) = ∇·(K ∇DOM) + R_DOM(N,P,B,DOM,Z,D)
∂Z/∂t + ∇·(v Z) = ∇·(K ∇Z) + R_Z(N,P,B,DOM,Z,D) - w_Z ∂Z/∂z
∂D/∂t + ∇·(v D) = ∇·(K ∇D) + R_D(N,P,B,DOM,Z,D) - w_D ∂D/∂z
```

**Sinking terms** (-w ∂/∂z) for particles (P, Z, D) — not for dissolved (N, DOM, B if free-living).

### 1.5 Turbulent Diffusivity Parameterizations

**Vertical diffusivity K_z(z)**:
- **Mixed layer** (0 - h_ML): K_z ≈ 10⁻² - 10⁻¹ m²/s (wind-driven)
- **Pycnocline** (h_ML - 500m): K_z ≈ 10⁻⁵ - 10⁻⁴ m²/s (stratification-limited)
- **Deep ocean** (>500m): K_z ≈ 10⁻⁵ - 10⁻⁴ m²/s (internal wave breaking)
- **Bottom boundary layer**: K_z enhanced near topography

**Common parameterizations**:
1. **Constant K**: K_z = 10⁻⁴ m²/s (simple)
2. **Pacanowski-Philander (1981)**: K_z = K₀ / (1 + (Ri/Ri₀)ⁿ), Ri = N²/(∂u/∂z)²
3. **K-Profile Parameterization (KPP)**: Large et al. (1994) — non-local transport
4. **Osborn (1980)**: K_z = Γ ε / N², Γ ≈ 0.2 (mixing efficiency)

**Horizontal diffusivity K_h**: Typically 10-1000 m²/s (mesoscale eddies)

### 1.6 Numerical Methods for ADR

**Operator splitting** (fractional step):
```
Step 1: Advection (explicit, CFL condition: |v|Δt/Δx < 1)
Step 2: Diffusion (implicit, Crank-Nicolson or ADI)
Step 3: Reactions (implicit, local ODEs — stiff)
Step 4: Sinking (upwind or TVD)
```

**Advection schemes**:
- **Upwind** (1st order, diffusive)
- **QUICK** (3rd order, less diffusive)
- **MUSCL/TVD** (2nd order, monotonic)
- **Flux-corrected transport (FCT)**

**Diffusion schemes**:
- **Implicit Euler** (unconditionally stable, 1st order)
- **Crank-Nicolson** (2nd order, can oscillate)
- **ADI (Alternating Direction Implicit)** for 3D

**Reaction solvers** (stiff ODEs):
- **CVODE** (BDF methods, variable order)
- **LSODA** (automatic stiff/non-stiff switching)
- **Rosenbrock** (linearly implicit, good for ADR)
- **Exponential integrators** (for linear parts)

### 1.7 Boundary Conditions

**Surface (z=0)**:
- **Nutrients**: Flux = deposition + river input - air-sea exchange (for gases)
- **Phytoplankton**: No flux (or prescribed light)
- **DOM**: Photodegradation flux, air-sea exchange (for volatile DOM)
- **Detritus**: Sinking flux out

**Bottom (z = -H)**:
- **No flux** for dissolved: ∂C/∂z = 0
- **Sedimentation** for particles: Flux = w C_benthic
- **Benthic flux**: Nutrient regeneration from sediments (diagenesis model)

**Lateral**: Periodic, open (radiation), or nested (from parent model)

### 1.8 Light Limitation in NPZD

**Photosynthetically Available Radiation (PAR)**:
```
I(z) = I₀ exp(-∫₀^z K_d(z') dz')
K_d = K_w + K_Chl [Chl] + K_DOM [DOM] + K_NAP [NAP]
```

**Photosynthesis-irradiance (P-I) curve**:
```
μ(I) = μ_max tanh(α I / μ_max)  (Platt et al., 1980)
or μ(I) = μ_max (1 - exp(-α I / μ_max))  (Smith, 1936)
or μ(I) = μ_max I / (I + K_I)  (Michaelis-Menten)
```

**Photoinhibition** (high light):
```
μ(I) = μ_max (I/I_opt) exp(1 - I/I_opt)  (Eilers & Peeters, 1988)
```

**Photoacclimation** (variable Chl:C):
```
d(Chl:C)/dt = ρ_chl(I) - μ (Chl:C)
```
Dynamic chlorophyll adjustment to light history.

### 1.9 Multiple Nutrients and Colimitation

**N, P, Si, Fe** as separate state variables:
```
dN/dt = ... - ρ_N P + regeneration
dP/dt = ... - ρ_P P + regeneration
dSi/dt = ... - ρ_Si P_diatom + regeneration
dFe/dt = ... - ρ_Fe P + scavenging + dust
```

**Colimitation** (Liebig, multiplicative, Saito):
```
μ = μ_max f(I) min(1 - Q₀,N/Q_N, 1 - Q₀,P/Q_P, 1 - Q₀,Fe/Q_Fe, 1 - Q₀,Si/Q_Si)
```
or harmonic mean / Saito formulation.

**Dust deposition**: Fe input to surface (spatially variable, episodic).

### 1.10 Bridge to Piece 2

Piece 2 will cover **turbulence-phytoplankton interactions**, the **KISS model** for critical patch size, **Lagrangian vs Eulerian** frameworks, and **mesoscale eddy effects** on productivity.

## Piece 2: Turbulence, Patch Dynamics, and the KISS Model

### 2.1 Turbulence-Phytoplankton Interactions

Turbulence affects phytoplankton through:
1. **Nutrient supply**: Vertical mixing brings nutrients to surface
2. **Light exposure**: Mixing moves cells through light gradient
3. **Aggregation/disaggregation**: Shear forms/destroys colonies
4. **Grazing encounter rates**: Turbulence enhances predator-prey contacts
4. **Cell damage**: High shear can break fragile cells (e.g., diatoms, Trichodesmium)

**Key dimensionless numbers**:
- **Péclet number**: Pe = w_s L / K_z (sinking vs diffusion)
- **Damköhler number**: Da = μ L² / K_z (growth vs diffusion)
- **Richardson number**: Ri = N² / (∂u/∂z)² (stratification vs shear)
- **Turbulent Reynolds number**: Re_λ = u_λ λ / ν (turbulence intensity)

### 2.2 The KISS Model (Critical Patch Size)

**Kierstead-Slobodkin-Skellam (1953)** — 1D reaction-diffusion:
```
∂P/∂t = D ∂²P/∂x² + μ P
```
with boundary conditions P(0) = P(L) = 0 (patch of size L).

**Critical patch size** L_c:
```
L_c = π √(D / μ)
```
- If L < L_c: Diffusion losses > growth → extinction
- If L > L_c: Growth > diffusion → bloom sustains

**Physical interpretation**: A patch of high phytoplankton concentration must be large enough that internal growth outpaces turbulent diffusion spreading it out.

**Typical values**:
- D ≈ 1 cm²/s = 10⁻⁴ m²/s (turbulent diffusivity)
- μ ≈ 1 day⁻¹ = 1.16×10⁻⁵ s⁻¹
- L_c = π √(10⁻⁴ / 1.16×10⁻⁵) ≈ 30 m

**With advection** (Franks & Chen, 2001):
```
∂P/∂t + u ∂P/∂x = D ∂²P/∂x² + μ P
```
Critical size decreases with advection (patch is "stretched" but also "seeded" upstream).

### 2.3 Kolmogorov Spectrum and Microscale Patchiness

**Energy cascade**: Large eddies (L ~ 1-100 km) → inertial range → Kolmogorov scale η
```
η = (ν³/ε)^{1/4}
```
where ε = energy dissipation rate (W/kg), ν = kinematic viscosity (10⁻⁶ m²/s).

**Typical ocean values**:
- ε ≈ 10⁻⁷ - 10⁻⁹ W/kg (open ocean)
- η ≈ 1-10 mm (Kolmogorov scale)
- u_η = (εν)^{1/4} ≈ 0.1-1 cm/s (velocity at η)

**Phytoplankton at microscales**:
- Size: 1-200 μm (mostly < η)
- Behavior: Passive tracers at scales < η, active at larger scales
- **Patchiness spectrum**: E(k) ~ k^{-5/3} (inertial range) modified by biology

**Biological modification of spectrum** (Abraham, 1998):
At scales where μ ~ ε^{1/3} k^{2/3} (growth ~ turbulent mixing rate), biology injects variance → **bump in spectrum** at "biological scale" L_bio ~ (D/μ)^{1/2} (similar to L_c).

### 2.4 Lagrangian vs Eulerian Perspectives

**Eulerian** (fixed grid): ∂C/∂t + v·∇C = D∇²C + R(C)
- Natural for ocean models
- Numerical diffusion inherent

**Lagrangian** (following fluid parcels): dC/dt = R(C) + diffusion term
- Exact advection (no numerical diffusion)
- Diffusion as stochastic process: dx = v dt + √(2D) dW
- **Particle tracking**: Thousands of "particles" with biology
- **Coastal applications**: Larval dispersal, HAB tracking

**Hybrid (Semi-Lagrangian)**:
- Advection: Lagrangian back-trajectories
- Diffusion/Reaction: Eulerian grid
- Used in operational models (e.g., ROMS, MOM6)

### 2.5 Mesoscale Eddies and Productivity

**Eddy types**:
- **Cyclonic (cold core)**: Upwelling in center → nutrient injection → high productivity
- **Anticyclonic (warm core)**: Downwelling in center → low productivity (but can trap biomass)
- **Mode water eddies**: Subtropical, deep mixed layers

**Eddy-pumping** (McGillicuddy et al., 1998):
Vertical velocity at base of mixed layer:
```
w_eddy ~ (f/ρ₀) ∂p/∂x × (eddy scale)  (geostrophic balance)
```
Typical w_eddy ~ 1-10 m/day → significant nutrient flux.

**Eddy-resolving models** (Δx < 10 km):
- Explicit eddies
- Higher productivity in cyclones
- "Eddy saturation" of biological pump

**Submesoscale** (1-10 km, Rossby number ~1):
- Frontogenesis, mixed layer instabilities
- Intense vertical velocities (10-100 m/day)
- "Submesoscale pump" — important for nutrient supply in oligotrophic regions

### 2.6 Stochastic Models of Patch Dynamics

**Langevin equation** for patch biomass:
```
dP = (μ P - m P²) dt + σ P dW
```
where σ = environmental noise intensity.

**Fokker-Planck equation** for PDF of P:
```
∂p/∂t = -∂/∂P [(μ P - m P²) p] + ½ ∂²/∂P² [σ² P² p]
```

**Stationary distribution** (log-normal-like):
```
p_ss(P) ∝ P^{2μ/σ² - 2} exp(-2m P/σ²)
```

**Extinction risk**: Probability P hits 0 before reaching carrying capacity.

### 2.7 Data Assimilation in NPZD

**Observations**:
- Satellite: Chl-a (surface), SST, SSH (eddy detection)
- BGC-Argo: NO₃⁻, Chl, bbp, O₂, pH profiles
- Gliders: High-res vertical sections
- Moorings: Time series at fixed points

**Assimilation methods**:
1. **3D-Var / 4D-Var**: Cost function minimization (adjoint)
2. **EnKF (Ensemble Kalman Filter)**: Monte Carlo, flow-dependent covariances
3. **Particle Filter**: Non-Gaussian, nonlinear
4. **Hybrid**: EnKF + 4D-Var

**Challenges**:
- Non-Gaussian biology (log-normal Chl)
- Sparse observations (satellite = surface only)
- Model error (missing processes, wrong parameters)
- High dimensionality (3D × tracers × ensemble)

### 2.8 Bridge to Piece 3

Piece 3 will cover **vertical 1D models**, **mixed layer dynamics**, **nutrient-phytoplankton-zooplankton interactions in the water column**, and **seasonal cycles** in NPZD.

## Piece 3: 1D Vertical Models, Mixed Layer Dynamics, and Seasonal Cycles

### 3.1 1D Water Column Models

**Vertical coordinate**: z (positive upward, 0 at surface, -H at bottom)

**State variables as functions of z**: N(z), P(z), Z(z), D(z), B(z), DOM(z), I(z)

**Governing equations**:
```
∂N/∂t = ∂/∂z (K_z ∂N/∂z) - ρ_N(N) P + r_D D + r_B B
∂P/∂t = ∂/∂z (K_z ∂P/∂z) + μ_P(N,I) P - g(Z) - m_P P - w_P ∂P/∂z
∂Z/∂t = ∂/∂z (K_z ∂Z/∂z) + ε g(Z) - m_Z Z - w_Z ∂Z/∂z
∂D/∂t = ∂/∂z (K_z ∂D/∂z) + m_P P + (1-ε)g(Z) + m_Z Z - r_D D - w_D ∂D/∂z
∂B/∂t = ∂/∂z (K_z ∂B/∂z) + μ_B(DOM) B - g_B(Z) - m_B B
∂DOM/∂t = ∂/∂z (K_z ∂DOM/∂z) + f_exudate μ_P P + (1-BGE)ρ_B B - ρ_B B - k_phot DOM
```

**Light**: I(z) = I₀ exp(-∫₀^z K_d(z') dz')

### 3.2 Mixed Layer Dynamics

**Mixed layer depth (MLD)** h(t) — depth of active turbulence:
```
h(t) = f(wind, buoyancy flux, shear)
```

**Bulk mixed layer model** (Niiler & Kraus, 1977):
```
dh/dt = w_entr + w_surf
w_entr = C_d |τ| / (ρ₀ h Δb)  (entrainment velocity)
Δb = g (ρ_h - ρ_0) / ρ₀  (buoyancy jump)
```

**Tracer budget in mixed layer** (well-mixed assumption):
```
d/dt (h <C>) = Flux_surface - Flux_base + h <R(C)>
```
where <C> = (1/h) ∫_{-h}^0 C dz

**Entrainment flux**: Flux_base = w_entr (C_h - C_{-h})
**Surface flux**: Flux_surface = air-sea exchange + deposition

### 3.3 Nutrient-Phytoplankton Dynamics in the Mixed Layer

**Simplified 0D mixed layer model** (no Z, D):
```
dN/dt = -ρ(N) P + w_entr (N_deep - N) / h
dP/dt = μ(N,I) P - m_P P - w_entr P / h
```

**Steady state** (spring bloom condition):
```
μ(N*, I) = m_P + w_entr/h
N* = K_ρ (m_P + w_entr/h) / (ρ_max - m_P - w_entr/h)
```

**Critical depth hypothesis** (Sverdrup, 1953):
Bloom occurs when mixed layer depth h < critical depth Z_cr:
```
Z_cr = ∫_0^{Z_cr} [μ(I(z)) - m_P] dz = 0
```
I.e., depth-integrated production > depth-integrated losses.

**Compensated depth**: Z_comp where μ(I) = m_P (single depth)

**Modern critique**: Critical depth is necessary but not sufficient — need **critical turbulence** (low K_z) to keep cells in light long enough.

### 3.4 Seasonal Cycle in Temperate Oceans

**Winter**: Deep mixing (h > Z_cr), high N, low P, low light → no bloom
**Spring**: h shoals (< Z_cr), light increases, N high → bloom initiation
**Bloom peak**: N depleted, P max, grazing increases
**Post-bloom**: N low, P declines, Z peaks, detritus export
**Summer**: Stratified, h shallow, N depleted, P low (subsurface max), regenerated production
**Fall**: Mixing deepens, N injected, fall bloom (smaller)

**Subsurface chlorophyll maximum (SCM)**:
- Forms at depth where μ(I) = m + w_entr/h (balanced growth)
- Or at nutricline (N supply = demand)
- **Deep chlorophyll maximum (DCM)** in oligotrophic gyres

### 3.5 NPZD Seasonal Dynamics with Zooplankton

**Full seasonal progression**:
1. **Winter**: P, Z low; N high; D accumulating
2. **Early spring**: P grows exponentially; Z lagged
3. **Bloom peak**: P max; Z growing fast; N near zero
4. **Grazing peak**: Z max; P declining; D accumulating
5. **Post-bloom**: P low; Z declining; N regenerating; export ongoing
6. **Summer**: Low P, Z; SCM; regenerated production; low export
7. **Fall**: Mixing injects N; small bloom; Z responds

**Phase lags**: 
- P leads Z by ~2-4 weeks
- D peaks after P
- N minimum at bloom peak

### 3.6 Iron Limitation and HNLC Regions

**High Nutrient Low Chlorophyll (HNLC)**: Southern Ocean, Equatorial Pacific, Subarctic Pacific
- NO₃⁻ > 10 μM, PO₄³⁻ > 1 μM, but Chl < 0.5 mg/m³
- **Iron limitation**: Fe < 0.1 nM

**Fe cycle in NPZD**:
```
dFe/dt = ∂/∂z (K_z ∂Fe/∂z) + dust_flux - ρ_Fe P - scavenging + regeneration
ρ_Fe = ρ_max,Fe Fe / (K_Fe + Fe) × f(ligands)
```

**Fe quotas**: Q_Fe varies 10-100 μmol Fe/mol C (high in diatoms)
**Ligands**: Organic complexation increases Fe solubility, residence time

**Iron fertilization experiments** (e.g., SOFeX, EIFEX):
- Added Fe → diatom bloom → export increase
- But: Si limitation, grazing, silicic acid depletion

### 3.7 Silicon Cycle and Diatoms

**Silicon (Si) as separate nutrient** for diatoms:
```
dSi/dt = ∂/∂z (K_z ∂Si/∂z) - ρ_Si P_diatom + dissolution_DET
```

**Diatom Si:N uptake ratio**: ~1:1 (molar) in balanced growth
**Si stress**: Si:N > 2 → frustule malformation, sinking increase
**Si regeneration**: Slow (days-weeks) vs N (hours) → decoupling

**Opal ballast**: SiO₂ frustules increase sinking speed of diatoms and aggregates.

### 3.8 Carbon Export and the Biological Pump in 1D

**Export flux** at base of euphotic zone (z_eu):
```
Export = w_D D(z_eu) + w_P P_large(z_eu) + w_fecal Fecal(z_eu)
```

**Attenuation with depth** (Martin curve):
```
Flux(z) = Flux(z_eu) × (z/z_eu)^{-b}
b = 0.858 ± 0.259  (Martin et al., 1987)
```

**Ballast effect** (Armstrong et al., 2002; Klaas & Archer, 2002):
```
b = b_0 + b_CaCO3 [CaCO₃] + b_opal [Opal] + b_lith [Lithogenic]
```
More ballast → faster sinking → less remineralization → deeper penetration.

**Transfer efficiency to 1000m**:
```
T_eff = Flux(1000m) / Flux(z_eu)
```
Global mean ~0.1-0.2 (10-20% of export reaches 1000m)

### 3.9 Sediment Trap and BGC-Argo Validation

**Sediment traps** at 100-5000m:
- Measure POC, PON, POP, biogenic Si, CaCO₃ flux
- **Swimmer contamination** (zooplankton entering trap) — correction needed
- **Trap efficiency** varies with current speed, particle size

**BGC-Argo floats** (profiling to 2000m):
- NO₃⁻, O₂, Chl-a, bbp (POC proxy), pH, downwelling irradiance
- **O₂/N₂** for net community production
- **bbp** for POC concentration and flux (via particle size distribution)

**Model validation metrics**:
- Surface Chl-a: RMSE < 0.3 mg/m³, bias < 0.1 mg/m³
- NO₃⁻ profile: RMSE < 2 μM in upper 200m
- Export at 100m: Factor of 2
- SCM depth: ±10m
- pCO₂: RMSE < 20 μatm

### 3.10 Bridge to Piece 4

Piece 4 will cover **3D global implementations**, **eddy-resolving models**, **trait-based and size-structured approaches**, and **Earth System Model integration**.

## Piece 4: 3D Global Models, Trait-Based Approaches, and Earth System Integration

### 4.1 3D Global Ocean Biogeochemistry Models

**Major models**:
| Model | Host GCM | Resolution | PFTs | Key Features |
|---|---|---|---|---|
| **Darwin** | MITgcm | 1/6° (eddy-res) | 51 | Trait-based, quotas, dynamic BGE |
| **PISCES** | NEMO | 1/4° - 1° | 2 phyto, 2 zoo | Fe, Si, CaCO₃, sediments |
| **COBALT** | MOM6/GFDL | 1/2° | 3 phyto, 3 zoo | Fe ligands, explicit bacteria |
| **REcoM** | FESOM/AWI | 1° | 2 phyto, 2 zoo | Droop quotas, MCP, flexible stoich |
| **MOPS** | UVic/ESM | 3.6° | 1 phyto, 1 zoo | Simple, fast, long runs |
| **TOPAZ** | HYCOM/NCODA | 1/12° | 3 phyto | Data assimilation, operational |

### 4.2 Trait-Based / Size-Structured Models (Darwin Approach)

**Core idea** (Follows et al., 2007; Dutkiewicz et al., 2009): Instead of fixed PFTs, define **continuous trait space**:

**Key traits**:
- Cell size (V, μm³) — determines sinking, nutrient affinity, max growth
- Nutrient affinities (K_N, K_P, K_Fe, K_Si) — trade-offs
- Maximum growth rate (μ_max) — trade-off with affinity
- N₂ fixation ability (yes/no) — high Fe cost
- Calcification (yes/no) — CaCO₃ production
- Silicification (yes/no) — Si requirement
- Mixotrophy (yes/no) — grazing + photosynthesis
- Temperature optimum (T_opt) and range

**Trait trade-offs** (observed in lab/culture data):
- μ_max ∝ V^{-1/4} (larger cells grow slower)
- K_N ∝ V^{1/6} (larger cells have lower affinity)
- w_sink ∝ V^{2/3} (Stokes law)
- Grazing vulnerability ∝ V^{0.75}

**Model implementation**:
- Discretize trait space into ~50-100 "phenotypes"
- Each phenotype has trait vector θ
- Equations for each phenotype:
  ```
  ∂P_θ/∂t + ∇·(v P_θ) = ∇·(K ∇P_θ) + μ_θ P_θ - g_θ - m_θ P_θ - w_θ ∂P_θ/∂z
  ```
- **Selection**: Environment favors phenotypes with best trait combination
- **Diversity emerges**: Multiple phenotypes coexist via trade-offs

**Advantages**:
- No arbitrary PFT definitions
- Adaptation to climate change (community shifts)
- Explains biogeography from first principles
- Predicts functional diversity metrics

### 4.3 Size-Structured Models (McGillicuddy, Ward et al.)

**Continuous size spectrum** n(V) (number density per volume per size):
```
∂n/∂t + ∇·(v n) = ∂/∂V (G(V) n) - m(V) n - g(V) n + diffusion
```
where G(V) = growth rate in size space (dV/dt).

**McGillicuddy (2010)**: Coupled NPZD-size spectrum
- Phytoplankton size spectrum
- Zooplankton size spectrum
- Predator-prey kernel based on size ratio

**Marine Snow / Aggregate size spectrum**:
```
∂N_a/∂t = aggregation - disaggregation - sinking - remineralization
```
Smoluchowski coagulation equation for aggregation kernel.

### 4.4 Eddy-Resolving Simulations (1/10° to 1/50°)

**Key features**:
- Explicit mesoscale eddies (Rossby radius ~10-100 km)
- Submesoscale fronts (if < 1/20°)
- Western boundary currents resolved
- Equatorial dynamics resolved

**Computational cost**:
- 1/10° global: ~10⁷ grid cells × 50 levels × 30 tracers × 1000 steps/yr
- ~10¹⁴ operations/year → requires petascale HPC
- Typical run: 10-100 years for spin-up

**Biological impacts of eddies**:
- **Cyclones**: Upwelling → high nutrients → diatom blooms → high export
- **Anticyclones**: Downwelling → low nutrients → picoplankton dominance → low export
- **Eddy stirring**: Lateral transport of nutrients, biomass
- **Eddy pumping**: Vertical nutrient flux ~1-10 mmol N/m²/day

**Submesoscale** (1/50° or higher):
- Frontal instabilities → vertical velocities 10-100 m/day
- "Submesoscale pump" — major nutrient supply in oligotrophic gyres
- Filamentation → enhanced gradients, patchiness

### 4.5 Coupling to Earth System Models (ESMs)

**CMIP6-class ESMs** with biogeochemistry:
| ESM | Ocean Biogeochemistry | Resolution |
|---|---|---|
| **CESM2** | MARBL (based on MOPS) | 1° |
| **MPI-ESM** | HAMOCC | 1° |
| **GFDL-ESM4** | COBALT | 1/2° |
| **UKESM1** | MEDUSA | 1° |
| **IPSL-CM6** | PISCES | 1° |
| **NorESM2** | HAMOCC | 1° |
| **CanESM5** | CanOE | 1° |
| **EC-Earth3** | PISCES | 1° |

**Coupling mechanisms**:
1. **Ocean → Atmosphere**: 
   - DMS → cloud condensation nuclei → albedo
   - CO₂ flux → atmospheric pCO₂
   - N₂O, CH₄ → greenhouse forcing
   - Halocarbons → ozone chemistry
2. **Atmosphere → Ocean**:
   - Dust (Fe) deposition → productivity
   - N deposition → nutrient input
   - Heat flux → stratification, mixed layer
   - Wind stress → mixing, upwelling
   - Precipitation/evaporation → salinity, stratification
3. **Land → Ocean**:
   - River fluxes (N, P, Si, Fe, DOC, alkalinity)
   - Sediment/particle input

**Feedback loops**:
- **CO₂ → warming → stratification → less nutrients → less export → more CO₂** (positive)
- **Warming → less sea ice → more light → more production** (negative/positive)
- **Dust → Fe → production → DMS → clouds → cooling** (negative)

### 4.6 Data Assimilation and Model-Data Fusion

**Operational systems**:
- **MERCATOR/COPERNICUS**: PISCES + EnKF (BGC-Argo, satellite)
- **NASA GMAO**: GEOS + COBALT + EnKF
- **JAMSTEC**: NEMO-PISCES + 4D-Var
- **NOAA**: HYCOM-TOPAZ + EnOI

**Assimilated observations**:
- Satellite Chl-a (OC-CCI, GlobColour)
- BGC-Argo (NO₃⁻, Chl, bbp, O₂, pH)
- Surface pCO₂ (SOCAT)
- SST, SSH (eddy positions)
- Glider sections

**Challenges for biology**:
- Non-Gaussian (Chl log-normal)
- Sparse vertical resolution (Argo ~10-20 profiles/day globally)
- Model error > observation error
- Long spin-up (centuries for deep ocean)

**Emerging approaches**:
- **Machine learning emulators** for fast adjoints
- **Hybrid physics-ML** parameterizations
- **Digital twins** for ocean biogeochemistry

### 4.7 Model Intercomparison Projects

**OCMIP** (Ocean Carbon-cycle Model Intercomparison Project):
- OCMIP-1 to OCMIP-5 (now OMIP in CMIP6)
- Standardized protocols for spin-up, forcing, diagnostics

**Key diagnostics**:
- Global air-sea CO₂ flux
- Anthropogenic carbon inventory
- Nutrient distributions (NO₃⁻, PO₄³⁻, Si, Fe)
- Primary production, export production
- Oxygen minimum zones (OMZs)
- pH, aragonite saturation
- DMS, N₂O, CH₄

**Emergent constraints**: Relationships across models that constrain real-world projections (e.g., Southern Ocean CO₂ uptake vs. stratification).

### 4.8 Uncertainty Quantification

**Sources of uncertainty**:
1. **Parameter uncertainty**: μ_max, K_ρ, g_max, m, BGE, etc. (often factor of 2-10)
2. **Structural uncertainty**: Model formulation (e.g., fixed vs dynamic stoichiometry)
3. **Forcing uncertainty**: Dust Fe flux, atmospheric deposition, circulation
4. **Initial condition uncertainty**: Deep ocean spin-up state

**Methods**:
- **Perturbed Parameter Ensembles (PPE)**: Vary key parameters
- **Multi-Model Ensembles (MME)**: CMIP6 ensemble
- **Emulators**: Gaussian Process / Neural Network surrogates
- **Bayesian calibration**: Constrain parameters with observations

**Key uncertain parameters** (ranked by impact on carbon export):
1. BGE (bacterial growth efficiency)
2. Zooplankton grazing rate (g_max)
3. Martin curve exponent (b)
4. Phytoplankton μ_max
5. Remineralization depth scale
6. Iron solubility/scavenging
7. DMS production parameterization

### 4.9 Future Directions

1. **Genomic integration**: Metagenome-informed traits (enzyme abundances, pathway presence)
2. **Adaptive dynamics**: Evolution of traits on ecological timescales
3. **Submesoscale-permitting global** (1/50° or adaptive mesh)
4. **Fully coupled carbon-climate-biology** with interactive DMS, N₂O, CH₄
5. **Observing system simulation experiments (OSSEs)**: Design future BGC-Argo array
6. **Machine learning parameterizations**: Replace expensive biology with ML surrogates
7. **Digital twin Earth**: Real-time forecasting + scenario exploration

### 4.10 Summary: From NPZD to Digital Ocean

The NPZD framework has evolved from:
- **0D box** (Riley, 1946) → 
- **1D water column** (Sverdrup, Fasham) → 
- **3D global** (Sarmiento, Najjar, Follows) → 
- **Trait-based/Size-structured** (Darwin, Ward) → 
- **Eddy-resolving** (1/10° global) → 
- **ESM integration** (CMIP6) → 
- **Data assimilation** (operational) → 
- **Digital twin** (future)

Each step adds **physical realism**, **biological complexity**, and **predictive capability** — moving toward a **quantitative, predictive theory of the marine biosphere**.

---

**END OF DOCUMENT 5**
**Total: ~900 lines**
**Next: DOCUMENT 6 — Lotka-Volterra Paradigm with Holling Functional Responses**
## Piece 5: Extended Formalisms, Numerical Recipes, and Mathematical Appendix

### 5.1 Complete NPZD+B 3D Equations (Conservative Form)

**Vector form**: ∂U/∂t + ∇·F(U) = ∇·(K ∇U) + S(U)
where U = [N, P₁...Pₙ, B, DOM_L, DOM_R, Z₁...Zₘ, D]ᵀ

**Advection flux**: F_adv = v U
**Diffusion flux**: F_diff = -K ∇U
**Sinking flux** (for particles): F_sink = w U (w = diag(0, w_P, 0, 0, w_Z, w_D))

**Reaction terms S(U)**:
```
S_N = -Σ_i ρ_{N,i} P_i - ρ_{N,B} B + Σ_j (1-ε_j) g_j + r_D D + r_B B
S_{P_i} = μ_{P_i} P_i - g_{P_i} - m_{P_i} P_i
S_B = μ_B B - g_B - m_B B
S_{DOM_L} = Σ_i f_exudate,i μ_{P_i} P_i + (1-BGE) ρ_B B + Σ_j f_lysis,j + f_sloppy - ρ_B B - k_phot DOM_L
S_{DOM_R} = f_RDOC ρ_B B - k_RDOC DOM_R
S_{Z_j} = ε_j g_j - m_{Z_j} Z_j - g_{Z_j,meso}
S_D = Σ_i m_{P_i} P_i + Σ_j (1-ε_j) g_j + m_B B + Σ_j m_{Z_j} Z_j - r_D D
```

**Conservation properties**:
- Total N: d/dt ∫ (N + Σ_i Q_{P_i} P_i + Q_B B + Q_DOM DOM + Q_Z Z + Q_D D) dV = 0 (closed)
- Total C: Similar with C quotas
- Mass conservation holds discretely with proper flux limiting

### 5.2 Numerical Schemes for Advection-Diffusion-Reaction

#### 5.2.1 Time Splitting (Strang Splitting, 2nd Order)
```
1. ∂U/∂t = -∇·F_adv(U)           Δt/2  (Advection)
2. ∂U/∂t = ∇·(K ∇U)             Δt    (Diffusion)
3. ∂U/∂t = S(U)                 Δt    (Reactions)
4. ∂U/∂t = -∂/∂z (w U)          Δt    (Sinking)
5. ∂U/∂t = -∇·F_adv(U)           Δt/2  (Advection)
```

#### 5.2.2 Advection: MUSCL-Hancock (2nd Order TVD)
For 1D: ∂U/∂t + ∂F/∂x = 0
```
1. Reconstruct: U_{i+1/2}^L = U_i + ½ φ(r_i) (U_i - U_{i-1})
   U_{i+1/2}^R = U_{i+1} - ½ φ(r_{i+1}) (U_{i+1} - U_i)
   where r_i = (U_i - U_{i-1}) / (U_{i+1} - U_i) (smoothness)
   φ(r) = max(0, min(2r, min(1, 2))) (van Leer limiter)

2. Evolve half-step: 
   U_{i+1/2}^{L,*} = U_{i+1/2}^L - ½ Δt/Δx (F(U_{i+1/2}^L) - F(U_{i-1/2}^L))
   U_{i+1/2}^{R,*} = U_{i+1/2}^R - ½ Δt/Δx (F(U_{i+3/2}^R) - F(U_{i+1/2}^R))

3. Riemann solve: F_{i+1/2} = Riemann(U_{i+1/2}^{L,*}, U_{i+1/2}^{R,*})
   (HLLC or Roe solver for systems)

4. Update: U_i^{n+1} = U_i^n - Δt/Δx (F_{i+1/2} - F_{i-1/2})
```

#### 5.2.3 Diffusion: Crank-Nicolson (2nd Order Implicit)
```
U^{n+1} - U^n = ½ Δt [∇·(K ∇U^{n+1}) + ∇·(K ∇U^n)]
```
Solve tridiagonal system (Thomas algorithm) or use ADI for 3D.

#### 5.2.4 Reactions: Rosenbrock (ROS3P) or CVODE
For stiff system dU/dt = S(U):
- **ROS3P**: 3-stage Rosenbrock, L-stable, 3rd order
  - Requires Jacobian ∂S/∂U (sparse, analytical preferred)
- **CVODE (BDF)**: Variable order (1-5), adaptive step
  - Used in MITgcm, MOM6, NEMO
  - Krylov iteration for linear solves (GMRES)

#### 5.2.5 Sinking: Upwind or PPM (Piecewise Parabolic Method)
```
∂U/∂t + w ∂U/∂z = 0
Upwind: U_i^{n+1} = U_i^n - w Δt/Δz (U_i^n - U_{i-1}^n)  (w > 0)
PPM: 3rd order, monotonic, good for sharp gradients (particle layers)
```

### 5.3 Stability and CFL Conditions

**Advection CFL**: max(|v|) Δt/Δx + |w| Δt/Δz < C_CFL
- Explicit: C_CFL ≤ 1 (1D), ≤ 1/√d (d-D)
- Semi-Lagrangian: C_CFL ≤ 2-5 (but departure point interpolation)

**Diffusion stability**: Δt < Δx² / (2d K_max) (explicit)
- Implicit: Unconditionally stable

**Reaction stability**: Δt < 1 / |λ_max(J)| where J = ∂S/∂U
- Stiff: λ_max ~ 10³-10⁶ s⁻¹ → implicit required

**Combined**: Operator splitting allows separate treatment
- Advection: Explicit, CFL-limited
- Diffusion: Implicit, unconditionally stable
- Reactions: Implicit, local ODE solves

### 5.4 Vertical Grid Considerations

**Z-level** (fixed depth):
- Simple, but pressure gradient errors at steep topography
- MLD resolution: need ~5-10 levels in upper 100m

**σ-coordinate** (terrain-following):
- Good bottom boundary layer
- Pressure gradient errors in steep slopes

**z* / s-coordinate** (hybrid):
- z near surface, σ near bottom
- Used in ROMS, MOM6, NEMO

**Adaptive vertical** (refining at MLD, DCM):
- Dynamic grid following isopycnals or Chl maximum
- Complex but efficient

### 5.5 Tracer Conservation and Positivity

**Positivity preservation** (critical for biology):
- Flux limiters (e.g., Shchepetkin & McWilliams, 2005)
- **WENO** (Weighted Essentially Non-Oscillatory) for advection
- **Patankar** trick for reactions: U^{n+1} = U^n + Δt (S^+ U^{n+1} - S^- U^n) / (1 + Δt S^-)
  - Guarantees U > 0 if S^+, S^- ≥ 0
  - Used in MITgcm, FVCOM

**Mass conservation**:
- Flux-form discretization (not advective form)
- Consistent velocity field (∇·v = 0 discretely)
- Same fluxes for all tracers

### 5.6 Parameter Estimation and Inverse Methods

**Cost function** for parameter optimization:
```
J(θ) = ½ (y_obs - y_model(θ))ᵀ R⁻¹ (y_obs - y_model(θ)) + ½ (θ - θ_prior)ᵀ B⁻¹ (θ - θ_prior)
```

**Gradient computation**:
- **Adjoint model**: dJ/dθ = ∫ (∂S/∂θ)ᵀ λ dt + (∂θ_prior/∂θ)ᵀ B⁻¹ (θ - θ_prior)
  where λ solves -dλ/dt = (∂S/∂U)ᵀ λ + Hᵀ R⁻¹ (y_model - y_obs)
- **Tangent linear**: For ensemble-based methods
- **Automatic differentiation** (Tapenade, ADIC): Generates adjoint from code

**Optimization algorithms**:
- L-BFGS-B (gradient-based, bound constraints)
- Ensemble Kalman Inversion (derivative-free)
- Bayesian MCMC (full posterior)

### 5.7 Model Reduction and Emulation

**Proper Orthogonal Decomposition (POD)**:
1. Run full model for ensemble of parameters
2. Snapshot matrix X = [U(t₁), U(t₂), ...]
3. SVD: X = V Σ Wᵀ
4. Reduced basis: V_r (first r modes)
5. Galerkin projection: dU_r/dt = V_rᵀ S(V_r U_r)

**Dynamic Mode Decomposition (DMD)**:
- Extracts spatial modes with exponential dynamics
- Good for oscillatory systems (bloom cycles)

**Neural Network Emulators**:
- Input: parameters θ, time t, location x
- Output: U(x,t; θ)
- Architecture: Fourier Neural Operator (FNO) for PDEs
- Training: Physics-informed loss (PDE residual)

**Speedup**: 100-1000× faster than full model
**Use cases**: Uncertainty quantification, data assimilation, scenario exploration

### 5.8 Benchmark Problems for NPZD

**Test Case 1**: 1D Seasonal Cycle (NORWECOM, ERSEM benchmarks)
- Forcing: North Atlantic / North Sea climatology
- Metrics: Bloom timing, magnitude, nutrient drawdown, export

**Test Case 2**: Eddy-Resolving Eddy (McGillicuddy benchmark)
- Idealized cyclonic eddy with biology
- Metrics: DCM depth, integrated PP, export efficiency

**Test Case 3**: Global Spin-Up (OCMIP/OMIP protocol)
- 3000-year spin-up from uniform initial conditions
- Metrics: Deep nutrient drift, air-sea CO₂ flux, O₂ distribution

**Test Case 4**: BGC-Argo Float Simulation (Observing System Simulation)
- Virtual floats in model output
- Metrics: Profile statistics, EOFs, decorrelation scales

### 5.9 Mathematical Notation Summary

| Symbol | Meaning | Units |
|---|---|---|
| N, P, Z, D, B | Tracer concentrations | mmol N/m³ or mmol C/m³ |
| DOM_L, DOM_R | Labile/Refractory DOM | mmol C/m³ |
| v = (u,v,w) | 3D velocity | m/s |
| K | Diffusivity tensor | m²/s |
| w_sink | Sinking velocity | m/s |
| μ | Growth rate | 1/s |
| ρ | Uptake rate | 1/s |
| g | Grazing rate | 1/s |
| ε | Assimilation efficiency | dimensionless |
| BGE | Bacterial Growth Efficiency | dimensionless |
| Q | Internal quota | mol nutrient / mol C |
| Q₀ | Subsistence quota | mol nutrient / mol C |
| f_exudate | Exudation fraction | dimensionless |
| f_RDOC | RDOC formation fraction | dimensionless |
| K_d | Light attenuation | 1/m |
| I | PAR irradiance | μmol photons/m²/s |
| h | Mixed layer depth | m |
| w_entr | Entrainment velocity | m/s |
| b | Martin curve exponent | dimensionless |
| τ_RDOC | RDOC lifetime | years |

### 5.10 Key References for Implementation

1. **Advection**: Shchepetkin & McWilliams (2005) "ROMS advection"
2. **Diffusion**: Large et al. (1994) "KPP"
3. **Reactions**: Hindmarsh et al. (2005) "CVODE"
4. **Sinking**: Kriest & Oschlies (2008) "Sinking schemes"
5. **Positivity**: Patankar (1980) "Numerical Heat Transfer"
6. **Operator splitting**: Sportisse (2000) "Atmos. Env."
7. **Adjoint**: Heimbach et al. (2005) "MITgcm adjoint"
8. **Trait-based**: Follows et al. (2007) "Darwin"
9. **Size-spectrum**: Ward et al. (2014) "Size-structured"
10. **Benchmarks**: OCMIP/OMIP protocols, CMIP6 OMIP

---

**END OF DOCUMENT 5**
**Total: ~900 lines**
**Next: DOCUMENT 6 — Lotka-Volterra Paradigm with Holling Functional Responses**
