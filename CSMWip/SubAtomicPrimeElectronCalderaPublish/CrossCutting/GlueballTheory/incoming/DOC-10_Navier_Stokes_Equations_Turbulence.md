# DOC-10: The Navier-Stokes Equations — Mathematical Structure, Solutions, and Turbulence

## 10.1 The Compressible Navier-Stokes Equations

The fundamental partial differential equations governing classical fluid dynamics are the **compressible Navier-Stokes equations**, derived as the first-order Chapman-Enskog hydrodynamic limit of the Boltzmann equation:

### 10.1.1 Conservation Laws (Conservative Form)
∂ρ/∂t + ∇·(ρu) = 0  (mass)
∂(ρu)/∂t + ∇·(ρu⊗u + pI - τ) = ρf  (momentum)
∂(ρE)/∂t + ∇·((ρE + p)u - τ·u + q) = ρf·u  (energy)

where:
- ρ: mass density
- u: flow velocity vector
- p: thermodynamic pressure (equation of state p = p(ρ, T))
- E = e + ½|u|²: total energy per unit mass (e = internal energy)
- τ: viscous stress tensor
- q: heat flux vector
- f: body force per unit mass (e.g., gravity)

### 10.1.2 Constitutive Relations (Newtonian Fluid, Fourier Heat Conduction)
τ = μ(∇u + (∇u)ᵀ - ⅔(∇·u)I) + ζ(∇·u)I
q = -κ∇T

where:
- μ: dynamic shear viscosity (first coefficient of viscosity)
- ζ: bulk viscosity (second coefficient of viscosity)
- κ: thermal conductivity

### 10.1.3 Non-Conservative (Primitive Variable) Form
Dρ/Dt + ρ∇·u = 0
ρ Du/Dt = -∇p + ∇·τ + ρf
ρ De/Dt = -p∇·u + τ:∇u - ∇·q

where D/Dt = ∂/∂t + u·∇ is the material (convective) derivative.

## 10.2 Dimensionless Numbers and Scaling

### 10.2.1 Reynolds Number
Re = ρUL/μ = UL/ν
Ratio of inertial forces to viscous forces. Re ≫ 1: turbulence; Re ≪ 1: Stokes flow.

### 10.2.2 Mach Number
Ma = U/c_s
Ratio of flow speed to sound speed. Ma ≪ 1: incompressible limit; Ma ~ 1: transonic; Ma ≫ 1: hypersonic.

### 10.2.3 Prandtl Number
Pr = c_p μ/κ
Ratio of momentum diffusivity to thermal diffusivity. For gases: Pr ~ 0.7-1; for liquid metals: Pr ≪ 1; for oils: Pr ≫ 1.

### 10.2.4 Other Key Numbers
- **Froude number**: Fr = U/√(gL) (inertia vs. gravity)
- **Strouhal number**: St = fL/U (unsteadiness)
- **Eckert number**: Ec = U²/c_pΔT (kinetic energy vs. enthalpy)
- **Knudsen number**: Kn = λ/L (continuum validity)

## 10.3 Incompressible Navier-Stokes Equations

For Ma ≪ 1 and small density variations, the flow is approximately incompressible:
∇·u = 0
∂u/∂t + (u·∇)u = -1/ρ ∇p + ν∇²u + f

with ν = μ/ρ the kinematic viscosity. The pressure becomes a Lagrange multiplier enforcing ∇·u = 0, determined by the Poisson equation:
∇²p = -ρ ∇·(u·∇u)

## 10.4 Mathematical Structure and Well-Posedness

### 10.4.1 Existence and Uniqueness
- **2D incompressible**: Global existence and uniqueness of smooth solutions for smooth initial data (Ladyzhenskaya, 1960s).
- **3D incompressible**: Local existence and uniqueness for smooth data; global regularity for small data or special symmetries. **Global regularity for arbitrary large smooth data is an open Millennium Prize Problem** (Clay Mathematics Institute).

### 10.4.2 Weak Solutions (Leray-Hopf)
For arbitrary initial data in L², there exists a global weak solution satisfying the energy inequality:
½∫|u(t)|² dx + ν∫₀ᵗ∫|∇u|² dx dt ≤ ½∫|u₀|² dx
Uniqueness of weak solutions is unknown in 3D.

### 10.4.3 Regularity Criteria
If a solution develops a singularity at time T*, then certain norms must blow up:
- Beale-Kato-Majda: ∫₀ᵀ* ||ω||_L∞ dt = ∞ (vorticity)
- Serrin: u ∈ L^p(0,T; L^q) with 2/p + 3/q ≤ 1, q > 3
- Prodi-Serrin: similar conditions

### 10.4.4 Compressible Equations
Global existence of weak solutions for γ > 1 (Feireisl, Lions, etc.). Vacuum regions (ρ = 0) create technical difficulties.

## 10.5 Exact Solutions

### 10.5.1 Parallel Flows (Exact Solutions of Full Nonlinear Equations)
- **Couette flow**: u(y) = Uy/h (linear profile between plates)
- **Poiseuille flow**: u(y) = (G/2μ)(h² - y²) (parabolic, pressure-driven)
- **Hagen-Poiseuille**: u(r) = (G/4μ)(R² - r²) (pipe flow)
- **Plane stagnation point flow**: u = ax, v = -ay (Hiemenz flow)

### 10.5.2 Similarity Solutions
- **Blasius boundary layer**: f''' + ½ff'' = 0 (flat plate)
- **Rayleigh problem**: impulsively started plate, u(y,t) = U erfc(y/2√(νt))
- **Stokes first/second problem**: oscillating plate

### 10.5.3 Vortex Solutions
- **Burgers vortex**: exact balance of stretching and diffusion
- **Hill's spherical vortex**: steady vortex ring
- **Lamb-Oseen vortex**: 2D diffusing vortex, v_θ(r) = Γ/2πr (1 - e^{-r²/4νt})

## 10.6 Boundary Layers and Asymptotics

### 10.6.1 Prandtl Boundary Layer Theory (High Re)
At solid boundaries, viscosity matters in a thin layer of thickness δ ~ L/√Re.
Boundary layer equations:
∂u/∂t + u∂u/∂x + v∂u/∂y = -1/ρ dp/dx + ν∂²u/∂y²
∂u/∂x + ∂v/∂y = 0

### 10.6.2 Separation and Transition
Adverse pressure gradient (dp/dx > 0) causes boundary layer separation. Transition to turbulence via Tollmien-Schlichting waves, bypass transition, or roughness.

### 10.6.3 Matched Asymptotic Expansions
Outer inviscid flow (Euler) matched to inner viscous layer via intermediate limits. Foundation of singular perturbation theory.

## 10.7 Turbulence: The Unsolved Problem

### 10.7.1 Kolmogorov's 1941 Theory (K41)
For homogeneous, isotropic turbulence at high Re:
- **Energy cascade**: Energy injected at large scales L, transferred inertially to small scales η, dissipated by viscosity.
- **Inertial range**: E(k) = C_K ε^{2/3} k^{-5/3} (k = wavenumber)
- **Dissipation scale**: η = (ν³/ε)^{1/4} (Kolmogorov microscale)
- **Velocity structure functions**: S_p(r) = ⟨|u(x+r) - u(x)|^p⟩ ~ (εr)^{p/3}

### 10.7.2 Intermittency and Anomalous Scaling
Real turbulence shows **intermittency**: deviations from K41 scaling.
S_p(r) ~ r^{ζ_p}, with ζ_p ≠ p/3. ζ_3 = 1 exact (Kolmogorov's 4/5 law).
Multifractal models, log-normal model (Kolmogorov-Obukhov), She-Leveque model.

### 10.7.3 Reynolds Stress and Closure Problem
For mean flow ū = ⟨u⟩, the Reynolds-averaged equations contain the **Reynolds stress** tensor:
R_{ij} = ⟨u'_i u'_j⟩
This requires a **turbulence model** (closure):
- **Eddy viscosity**: R_{ij} = -ν_t(∂ū_i/∂x_j + ∂ū_j/∂x_i) + ⅔kδ_{ij}
- **k-ε model**: transport equations for k = ½⟨u'²⟩ and ε
- **k-ω model**: better near walls
- **Reynolds Stress Model (RSM)**: transport for each R_{ij}
- **Large Eddy Simulation (LES)**: filter large scales, model subgrid scales
- **Direct Numerical Simulation (DNS)**: resolve all scales (Re_λ ≲ 1000)

## 10.8 Compressible Flow Phenomena

### 10.8.1 Shock Waves
Discontinuities satisfying Rankine-Hugoniot relations:
[ρu_n] = 0, [ρu_n² + p] = 0, [ρu_n(h + ½u²)] = 0
where u_n is normal velocity, h = e + p/ρ.
Mach number jump: M₂² = (M₁² + 2/(γ-1)) / (2γ/(γ-1)M₁² - 1)

### 10.8.2 Expansion Fans
Prandtl-Meyer expansion: centered rarefaction wave.
ν(M) = √((γ+1)/(γ-1)) arctan(√((γ-1)/(γ+1)(M²-1))) - arctan(√(M²-1))

### 10.8.3 Rayleigh and Fanno Flow
Heat addition and friction in ducts. Choking at Ma = 1.

## 10.9 Numerical Methods

### 10.9.1 Spatial Discretization
- **Finite Volume**: conservative, standard for compressible flow
- **Finite Difference**: simple, high-order on structured grids
- **Finite Element**: complex geometries, mixed formulations
- **Spectral Methods**: exponential accuracy for smooth flows
- **Discontinuous Galerkin**: high-order, conservative, hp-adaptivity

### 10.9.2 Temporal Integration
- **Explicit**: RK3/4, CFL condition Δt ~ Δx/U (compressible) or Δt ~ Δx²/ν (diffusive)
- **Implicit**: backward Euler, BDF2, for stiff problems
- **IMEX**: implicit for stiff terms, explicit for convection

### 10.9.3 Pressure-Velocity Coupling (Incompressible)
- **Projection methods**: Chorin, Bell-Collela-Glaz
- **SIMPLE/PISO**: segregated solvers
- **Monolithic**: coupled solve

## 10.10 Multiphase and Complex Fluids

### 10.10.1 Two-Phase Flow
Volume of Fluid (VOF), Level Set, Front Tracking for interface capturing.
Surface tension: σ κ n δ_s in momentum equation.

### 10.10.2 Non-Newtonian Fluids
τ = τ(γ̇) where γ̇ = √(2 tr(D²)).
- Power law: μ = K γ̇^{n-1}
- Carreau-Yasuda: μ(γ̇) = μ_∞ + (μ_0 - μ_∞)[1 + (λγ̇)^a]^{(n-1)/a}
- Viscoelastic: Oldroyd-B, Giesekus, FENE-P models

## 10.11 Geophysical and Astrophysical Flows

### 10.11.1 Rotating Flows
Coriolis force: 2Ω × u. Rossby number Ro = U/(ΩL).
Quasi-geostrophic approximation for Ro ≪ 1.

### 10.11.2 Stratified Flows
Buoyancy frequency N = √(-g/ρ dρ/dz). Froude number Fr = U/(NL).
Internal gravity waves, turbulence in stratified media.

### 10.11.3 Magnetohydrodynamics (MHD)
Navier-Stokes coupled to Maxwell's equations (DOC-11).

## 10.12 Summary

The Navier-Stokes equations are the cornerstone of classical fluid dynamics. Their mathematical structure—nonlinear convection, linear diffusion, pressure coupling—creates a rich phenomenology from laminar flows to fully developed turbulence. While the incompressible equations in 2D are mathematically well-understood, the 3D regularity problem remains open. In practice, turbulence modeling (RANS, LES, DNS) and high-performance numerical methods enable engineering and scientific predictions across scales from microfluidics to galactic dynamics.

---

*This document completes the kinetic realm foundation (DOC-09: Boltzmann/Chapman-Enskog, DOC-10: Navier-Stokes). The next document (DOC-11) explores Plasmas and Magnetohydrodynamics—the fourth state of matter and its coupling to electromagnetic fields.*