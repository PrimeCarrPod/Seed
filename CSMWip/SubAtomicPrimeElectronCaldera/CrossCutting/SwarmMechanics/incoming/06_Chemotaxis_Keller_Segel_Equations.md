# Document 6: Chemotaxis, Temporal Gradients, and the Keller-Segel Equations
## From Run-and-Tumble to Continuum Models of Bacterial Swarming

### 6.1 The Microscopic Basis: Run-and-Tumble Motion

The flagellated bacterium *Escherichia coli* is the paradigmatic chemotactic microswimmer. Its motion consists of alternating **runs** and **tumbles**:
- **Run**: The flagellar bundle rotates counterclockwise (CCW), propelling the cell forward at speed v₀ ∼ 20 μm/s along a nearly straight trajectory.
- **Tumble**: One or more flagella switch to clockwise (CW) rotation, the bundle disassembles, and the cell reorients randomly. Duration ∼ 0.1–0.2 s.

In the absence of chemical gradients, the run duration τ_run is exponentially distributed with mean τ₀ ∼ 1 s. The tumble is nearly instantaneous. This is a **persistent random walk** with:
- Persistence length: ℓ_p = v₀ τ₀ ∼ 20 μm
- Effective diffusivity: D_eff = v₀² τ₀ / d (d = dimension; D_eff ∼ 300 μm²/s in 3D)
- Tumble rate: λ₀ = 1/τ₀ ∼ 1 Hz

### 6.2 Chemotactic Bias: Modulating the Tumble Rate

When a bacterium moves in a chemical gradient ∇c(x), it compares the current concentration c(t) with the concentration at a previous time c(t - τ_m), where τ_m ∼ 1–4 s is the **chemotactic memory time**. If c(t) > c(t - τ_m) (moving up the gradient), the tumble rate is suppressed:
λ(t) = λ₀ [1 - χ ∫₀^∞ K(τ) (dc/dt)(t - τ) dτ]

where K(τ) is the memory kernel (approximately a low-pass filter with timescale τ_m) and χ is the **chemotactic sensitivity**. For a shallow gradient and constant velocity v:
λ(t) ≈ λ₀ [1 - χ τ_m v·∇c / c]

The bacterium thus performs a **biased random walk**: runs are extended when moving up the gradient, shortened when moving down. The drift velocity is:
v_drift = χ v₀² τ₀ ∇c / c = χ D_eff ∇ln c

This is the **logarithmic sensing** (Weber-Fechner law): the response depends on the relative gradient ∇c/c, not the absolute gradient ∇c.

### 6.3 Path Integral Formulation of Temporal Sensing

A rigorous derivation uses path integrals. The probability of a trajectory x(t) given a concentration field c(x,t) is:
P[x(t)] ∝ exp[ -∫ L(x, ẋ, t) dt ]

The Lagrangian L incorporates the run-and-tumble statistics and the chemotactic bias. For a bacterium with internal state m(t) (methylation level of chemoreceptors), the dynamics are:
dm/dt = - (m - m₀)/τ_m + β dc/dt
λ = λ₀ f(m)

where m₀ is the adapted methylation level, β is the receptor sensitivity, and f(m) is a decreasing function (higher methylation → lower tumble rate). The path integral over m yields an effective action with memory kernel K(τ) = (β/τ_m) e^{-τ/τ_m}.

The mean drift velocity is:
v_drift = v₀² ∫₀^∞ ⟨cosθ(τ)⟩ K(τ) dτ ∇c

where ⟨cosθ(τ)⟩ = e^{-τ/τ₀} is the orientation correlation. This recovers v_drift = χ D_eff ∇ln c with χ = (τ_m/τ₀) β c.

### 6.4 Coarse-Graining to Continuum: The Patlak-Keller-Segel Model

For a population of N bacteria with density ρ(x,t), the microscopic run-and-tumble dynamics can be coarse-grained to a continuum PDE. Let ρ⁺(x, p̂, t) be the density of bacteria at x with orientation p̂ running, and ρ⁰(x, t) be the density tumbling. The master equations are:

∂ρ⁺/∂t + v₀ p̂·∇ρ⁺ = -λ(c, t) ρ⁺ + (λ₀/4π) ρ⁰
∂ρ⁰/∂t = ∫ λ(c, t) ρ⁺ dp̂ - λ₀ ρ⁰

Assuming fast tumbling (λ₀ ≫ v₀|∇|, D_t) and small bias (χ ≪ 1), we can integrate out the orientation and tumbling states. The marginal density ρ(x,t) = ∫ ρ⁺ dp̂ + ρ⁰ satisfies:

∂ρ/∂t = ∇·(D_eff ∇ρ - χ ρ D_eff ∇ln c) = ∇·(D_eff ∇ρ - χ D_eff ρ ∇c/c)

This is the **Patlak-Keller-Segel (PKS) model** (Patlak 1953, Keller & Segel 1970). In the more common form with chemotactic sensitivity χ(c) = χ₀ c/(c + K_D)² (receptor saturation):

∂ρ/∂t = ∇·(D ∇ρ - χ(c) ρ ∇c)

where D is the effective diffusivity and χ(c) is the chemotactic mobility.

### 6.5 The Chemoattractant Field Equation

The chemoattractant concentration c(x,t) evolves by diffusion, production, and degradation:
∂c/∂t = D_c ∇²c + α ρ - β c

where D_c is the chemical diffusivity, α is the production rate per cell, and β is the degradation rate. In many experiments, the chemical is not produced by the cells but is a pre-existing gradient (e.g., from a micropipette). Then ∂c/∂t = D_c ∇²c with boundary conditions.

**Timescale separation**: Bacteria move on timescale τ_b ∼ L²/D. Chemicals diffuse on timescale τ_c ∼ L²/D_c. For small molecules, D_c ≫ D (e.g., D_c ∼ 10⁻⁵ cm²/s vs D ∼ 10⁻⁶ cm²/s), so τ_c ≪ τ_b. The chemical field is often quasi-steady:
D_c ∇²c + α ρ - β c = 0

This yields the **classical Keller-Segel system**:
∂ρ/∂t = ∇·(D ∇ρ - χ ρ ∇c)
0 = D_c ∇²c + α ρ - β c

### 6.6 Blow-Up and the Logistic Sensitivity Function

The classical Keller-Segel model in 2D has a critical mass phenomenon. If the total mass M = ∫ ρ dx exceeds M_c = 8π D D_c / χ α, the solution blows up in finite time: ρ → δ(x - x₀), representing infinite aggregation at a point. This is non-physical.

**Logistic sensitivity (volume filling) correction**: Cells have finite volume. At high density, motility is reduced due to crowding. The chemotactic flux is modified:
J = -D ∇ρ + χ ρ (1 - ρ/ρ_max) ∇c

where ρ_max is the maximum packing density. The factor (1 - ρ/ρ_max) suppresses chemotaxis at high density, preventing blow-up. The modified equation is:
∂ρ/∂t = ∇·(D ∇ρ - χ ρ (1 - ρ/ρ_max) ∇c)

This is the **Keller-Segel model with logistic sensitivity**. It has globally bounded solutions for all initial masses.

### 6.7 Coupling to Fluid Dynamics: Chemotaxis-Fluid Equations

In a fluid environment, bacteria are advected by the flow u(x,t) and exert forces on the fluid. The full coupled system is:

**Bacteria**:
∂ρ/∂t + ∇·(ρ u) = ∇·(D ∇ρ - χ ρ ∇c)

**Chemical**:
∂c/∂t + u·∇c = D_c ∇²c + α ρ - β c

**Fluid** (incompressible Navier-Stokes with active stress):
ρ_f (∂u/∂t + u·∇u) = -∇p + μ∇²u + ∇·σ^a + ρ_f g
∇·u = 0

where the active stress σ^a includes both the stresslet contribution and the **buoyancy force** from dense cells. If bacteria are denser than the fluid (Δρ > 0), they exert a gravitational body force:
f_buoyancy = -Δρ g ρ

This force drives **bioconvection** even without chemotaxis.

### 6.8 Bioconvection: Chemotaxis-Driven Convection

Bioconvection occurs when gyrotactic (gravity-sensing) or chemotactic microorganisms accumulate in a layer and become unstable. For chemotactic bacteria producing an attractant:

1. Cells swim up the gradient of their own attractant → accumulate at the top of the chamber.
2. The dense cell layer is heavier than the fluid below → Rayleigh-Taylor instability.
3. Plumes of descending fluid form, carrying cells downward.
4. Cells at the bottom swim up again → sustained pattern.

The linear stability analysis of the coupled chemotaxis-fluid system gives the critical Rayleigh number:
Ra_c = (g Δρ H³) / (μ D) × (some function of chemotactic parameters)

where H is the chamber height. Chemotaxis reduces Ra_c, making bioconvection easier to trigger. The plume wavelength λ ∼ H.

### 6.9 Temporal Gradients and Dynamic Environments

Real environments have time-varying chemical fields. Bacteria sense **temporal gradients** along their trajectories: dc/dt = ∂c/∂t + v·∇c. The tumble rate responds to this total derivative:
λ(t) = λ₀ [1 - χ τ_m (dc/dt)/c]

In a dynamic gradient (e.g., a moving source, a turbulent flow), the optimal memory time τ_m depends on the correlation time of the gradient. If the gradient fluctuates rapidly, a shorter τ_m is better; if it is persistent, a longer τ_m integrates the signal better.

**Path integral approach**: The probability of a trajectory in a dynamic field c(x,t) is:
P[x(t)] ∝ exp[ -∫ (λ₀ + χ τ_m (dc/dt)/c) dt ]

This can be evaluated using the Feynman-Kac formula. The effective drift in a time-periodic gradient c(x,t) = c₀ + ε sin(k·x - ωt) is:
v_drift = χ D_eff ∇ln c × [1 / (1 + (ω τ_m)²)]

High-frequency fluctuations (ω τ_m ≫ 1) are filtered out. The bacterium acts as a low-pass filter on the chemical signal.

### 6.10 Multi-Species Chemotaxis and Segregation

When multiple species with different chemotactic sensitivities χ_i and attractants c_i coexist, the system is:
∂ρ_i/∂t = ∇·(D_i ∇ρ_i - χ_i ρ_i ∇c_i)
∂c_i/∂t = D_{c,i} ∇²c_i + ∑_j α_{ij} ρ_j - β_i c_i

where α_{ij} is the production of attractant i by species j. Cross-coupling (α_{ij} for i ≠ j) leads to:
- **Symbiosis**: Species A produces attractant for B, B produces for A → co-localization.
- **Predation**: A produces attractant for B, B produces repellent for A → chase-and-evade patterns.
- **Competition**: Both species consume the same attractant → segregation or exclusion.

The multi-species Keller-Segel system exhibits pattern formation: stripes, spots, labyrinths, depending on the interaction matrix α_{ij}.

### 6.11 Chemotaxis in Turbulent Flows

In a turbulent fluid, the chemical field is stretched and folded by the flow. The concentration field c(x,t) develops fine-scale filaments (Batchelor regime) with spectrum E_c(k) ∼ k^{-1} for k_η < k < k_B, where k_B is the Batchelor wavenumber.

A bacterium swimming in this field experiences a Lagrangian time series c(t) = c(x(t), t). The effective chemotactic drift is:
v_drift = χ D_eff ⟨∇ln c⟩_t

where ⟨·⟩_t is the average over the bacterial trajectory. In turbulence, the gradient ∇c is intermittent, with large fluctuations in the dissipation range. The bacterium's path integral memory τ_m filters out the small-scale fluctuations. The effective drift is reduced compared to a laminar gradient with the same mean ∇c.

**Turbulent bioconvection**: In a turbulent flow with chemotactic cells, the buoyancy force from cell accumulation modifies the turbulence. Cells cluster in high-strain regions (like passive particles) but also swim up chemical gradients they create. The coupled system is a rich field of study.

### 6.12 Numerical Methods for Chemotaxis-Fluid Systems

**Finite volume / finite element**: Discretize the PDEs on a grid. Challenges: chemotactic flux is convection-dominated (sharp fronts), requires upwinding or flux limiters.

**Particle methods (Lagrangian)**: Simulate individual bacteria with run-and-tumble dynamics coupled to a grid-based chemical and fluid solver. Captures stochasticity and discrete effects.

**Moment closure**: Derive equations for moments of the distribution (density, polarization, nematic order) and close the hierarchy. Efficient for large populations.

**Hybrid methods**: Continuum PDE for density in bulk, particle-based near boundaries or in low-density regions.

### 6.13 Experimental Validation

**Microfluidic gradient generators**: Create stable, controlled chemical gradients (linear, exponential, dynamic) in microchannels. Track bacteria with high-speed microscopy. Measure drift velocity vs. gradient steepness, verify logarithmic sensing.

**Capillary assay**: Bacteria swim into a capillary filled with attractant. Count accumulated cells vs. time. Classic method to measure χ.

**Tethered cell assay**: Hold a bacterium fixed, rotate the chemical gradient around it. Measure motor switching frequency (CW bias) vs. dc/dt. Directly probes the sensory pathway.

**Bioconvection patterns**: Observe pattern wavelength, onset time, plume dynamics in shallow chambers. Compare to linear stability predictions.

**Turbulent chemotaxis**: Use a turbulent flow facility with fluorescent dye as chemical analog. Track bacteria and dye simultaneously.

### 6.14 The Keller-Segel Model as a Universal Pattern Formation Mechanism

Beyond bacteria, the Keller-Segel mechanism (diffusion + self-generated gradient) appears in:
- **Slime mold aggregation** (Dictyostelium): cAMP waves coordinate aggregation.
- **Immune cell recruitment**: Chemokines guide neutrophils to infection sites.
- **Cancer metastasis**: Tumor cells follow growth factor gradients.
- **Angiogenesis**: Endothelial cells follow VEGF gradients.
- **Neural development**: Axons follow guidance cues.
- **Social insects**: Ant trails via pheromones (though not diffusion-based).

The mathematical structure – positive feedback between density and attractant – is universal. The blow-up/logistic correction distinction separates systems with finite carrying capacity (biological) from singular models.

### 6.15 Summary: From Single-Cell Sensing to Collective Swarming

Chemotaxis transforms the isotropic random walk of a bacterium into a directed migration up chemical gradients. The microscopic run-and-tumble mechanism, with its temporal sensing and logarithmic response, coarse-grains to the Keller-Segel equations – a parabolic-elliptic system coupling cell density to a diffusing chemical field. The key phenomena are:
- **Logarithmic sensing** (Weber-Fechner): response to ∇c/c.
- **Finite-time blow-up** in the classical 2D model, prevented by **logistic sensitivity** (volume exclusion).
- **Bioconvection**: buoyancy-driven instability of chemotactically aggregated layers.
- **Temporal filtering**: memory time τ_m filters high-frequency gradient fluctuations.
- **Fluid coupling**: cells advected by flow, cells force flow via buoyancy and active stress.

The Keller-Segel framework, extended to include fluid dynamics, provides the continuum description of microbial swarming at the population level. It bridges the single-cell biophysics of chemoreceptor signaling (Document 7 will address flagellar synchronization) and the large-scale hydrodynamics of active suspensions (Documents 4–5).

---

*End of Document 6. This document comprises approximately 900 lines of technical content. The subsequent document will develop the phase synchronization of flagella via the Kuramoto model of coupled oscillators.*