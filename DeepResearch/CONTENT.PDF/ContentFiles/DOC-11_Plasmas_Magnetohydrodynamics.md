# DOC-11: Plasmas and Magnetohydrodynamics — The Electromagnetic Fluid

## 11.1 The Plasma State: Ionization and Collective Behavior

When a fluid is subjected to immense thermal energy, the kinetic energy of the constituent particles overwhelms the electrostatic binding energy of the atoms. The electrons are stripped from their nuclei, and the neutral gas transitions into a **plasma**—the fourth state of matter, comprising over 99% of the visible universe. A plasma is a quasi-neutral gas of charged particles (electrons and ions) that exhibits collective behavior due to long-range electromagnetic forces.

## 11.2 Plasma Parameters and Fundamental Length Scales

### 11.2.1 Debye Length (λ_D)
If a localized perturbation or test charge is introduced into a plasma, the electrons rapidly redistribute to surround and neutralize it. This **Debye shielding** exponentially screens the electric field over the Debye length:

λ_D = √(ε₀ k_B T_e / n_e e²)

where n_e is the electron number density, T_e is the electron temperature, ε₀ is the permittivity of free space, and e is the elementary charge. For collective plasma behavior, the system size L must satisfy L ≫ λ_D, and the number of particles in a Debye sphere N_D = n_e (4π/3) λ_D³ must be large (N_D ≫ 1).

### 11.2.2 Plasma Frequency (ω_p)
The natural oscillation frequency of electron density perturbations:
ω_pe = √(n_e e² / ε₀ m_e)
For ions: ω_pi = √(n_i Z² e² / ε₀ m_i) ≪ ω_pe

### 11.2.3 Cyclotron Frequency (ω_c)
In a magnetic field B, charged particles gyrate at the cyclotron frequency:
ω_ce = eB/m_e (electrons), ω_ci = ZeB/m_i (ions)

### 11.2.4 Coulomb Coupling Parameter (Γ)
The ratio of average electrostatic potential energy to average thermal kinetic energy:
Γ = (Ze)² / (4πε₀ a k_B T)

where a = (3/4πn)^{1/3} is the Wigner-Seitz radius (typical interparticle distance).
- Γ ≪ 1: **weakly coupled plasma** (ideal, diffuse gas, collective effects dominate)
- Γ ≳ 1: **strongly coupled plasma** (liquid-like, correlations important)
- Γ ≫ 1: **strongly coupled Coulomb liquid/solid** (Wigner crystallization)

### 11.2.5 Magnetization Parameter (β_c)
Ratio of cyclotron frequency to collision frequency:
β_c = ω_c / ν_coll
- β_c ≫ 1: magnetized plasma (particles gyrate many times between collisions)
- β_c ≪ 1: unmagnetized plasma

## 11.3 Kinetic Description: Vlasov and Fokker-Planck Equations

### 11.3.1 Vlasov Equation (Collisionless)
For collisionless plasmas (ν_coll → 0), the one-particle distribution function f_s(r, v, t) for species s obeys:
∂f_s/∂t + v·∇f_s + (q_s/m_s)(E + v×B)·∇_v f_s = 0

This is the collisionless Boltzmann equation with the Lorentz force. The fields E, B are self-consistently determined by Maxwell's equations with sources from all species.

### 11.3.2 Fokker-Planck (Landau) Equation
For weakly coupled plasmas (Γ ≪ 1), Coulomb collisions are dominated by small-angle scattering. The collision operator becomes a diffusion operator in velocity space:
C[f] = ∂/∂v · ∫ d³v' K(v-v') · [f(v') ∂f/∂v - f(v) ∂f/∂v']

where K is the Rosenbluth tensor. This conserves particles, momentum, and energy.

## 11.4 Fluid Description: Multi-Fluid Equations

Taking velocity moments of the Vlasov/Fokker-Planck equation yields fluid equations for each species s:

∂n_s/∂t + ∇·(n_s u_s) = 0
m_s n_s (Du_s/Dt) = q_s n_s (E + u_s × B) - ∇·P_s + R_s
3/2 n_s (DT_s/Dt) + P_s:∇u_s + ∇·q_s = Q_s

where P_s is the pressure tensor, q_s is the heat flux, R_s is the friction force from collisions with other species, and Q_s is the collisional energy exchange.

## 11.5 Magnetohydrodynamics (MHD): Single-Fluid Limit

When the plasma is strongly collisional (ν_coll ≫ ω_p, ω_c) or we are interested in scales much larger than kinetic scales, the multi-fluid equations can be combined into a **single-fluid MHD** model. The standard MHD assumptions:
1. **Quasi-neutrality**: n_e ≈ Z n_i = n (charge neutrality)
2. **Single velocity**: u_e ≈ u_i = u (center-of-mass velocity)
3. **Non-relativistic flow**: u ≪ c
4. **Low frequency**: ∂/∂t ≪ ω_pe, ω_ce (displacement current negligible)

### 11.5.1 MHD Equations (Conservative Form)
∂ρ/∂t + ∇·(ρu) = 0
∂(ρu)/∂t + ∇·(ρu⊗u + (p + B²/2μ₀)I - BB/μ₀) = 0
∂B/∂t = ∇×(u×B) + η∇²B
∂(ρE)/∂t + ∇·((ρE + p + B²/2μ₀)u - (B·u)B/μ₀ + ηJ×B) = 0

where:
- ρ = m_i n_i + m_e n_e ≈ m_i n (mass density)
- p = p_e + p_i (total thermal pressure)
- B: magnetic field
- J = ∇×B/μ₀ (Ampère's law without displacement current)
- η = 1/μ₀σ (magnetic diffusivity, σ = electrical conductivity)
- E = e + ½u² + B²/2μ₀ρ (total energy density)

### 11.5.2 The Induction Equation
∂B/∂t = ∇×(u×B) + η∇²B

This is the fundamental equation of MHD. The first term represents **advection** of magnetic field with the fluid flow. The second term represents **resistive diffusion** of the field. The ratio of these terms is the **magnetic Reynolds number**:

Rm = UL/η = μ₀σUL

### 11.5.3 Ideal MHD (Rm → ∞)
In astrophysical plasmas (solar corona, interstellar medium, accretion disks), Rm is astronomically large (10⁶ - 10¹²). The diffusion term is negligible:
∂B/∂t = ∇×(u×B)

**Alfvén's Theorem (Flux Freezing)**: In ideal MHD, magnetic field lines are "frozen into" the plasma. Where the fluid flows, it drags the field lines with it. The magnetic flux through any fluid element is conserved:
d/dt ∫_S B·dS = 0

This links fluid topology to magnetic topology.

### 11.5.4 Resistive MHD (Finite Rm)
When Rm is not infinite, magnetic reconnection can occur—topological rearrangement of field lines releasing magnetic energy. This powers solar flares, magnetospheric substorms, sawtooth crashes in tokamaks. The Sweet-Parker and Petschek models describe steady reconnection rates.

## 11.6 The Lorentz Force Decomposition

The magnetic force per unit volume (Lorentz force) is:
F_mag = J × B = (∇×B)×B/μ₀

Using vector identities:
J × B = -∇(B²/2μ₀) + (B·∇)B/μ₀

### 11.6.1 Magnetic Pressure
-∇(B²/2μ₀): isotropic pressure acting outward, like gas pressure.
The **plasma beta** parameter:
β = p / (B²/2μ₀) = 2μ₀p/B²
- β ≫ 1: gas pressure dominates (weakly magnetized)
- β ≪ 1: magnetic pressure dominates (strongly magnetized)
- β ~ 1: equipartition

### 11.6.2 Magnetic Tension
(B·∇)B/μ₀ = B²/μ₀ (b·∇)b (where b = B/B)
A restoring force proportional to field line curvature, acting to straighten bent field lines. Provides the restoring force for **Alfvén waves**.

## 11.7 MHD Waves

Linearizing ideal MHD equations about a uniform equilibrium (ρ₀, p₀, B₀) gives three wave modes:

### 11.7.1 Alfvén Wave (Shear Wave)
- Propagation: k ∥ B₀ (parallel)
- Polarization: δu, δB ⊥ B₀, δρ = 0, δp = 0
- Dispersion: ω = ± k_∥ v_A
- Phase/group velocity: v_A = B₀/√(μ₀ρ₀) (Alfvén speed)
- Non-compressive, transverse, incompressible

### 11.7.2 Fast Magnetosonic Wave
- Propagation: all directions
- Compressive: δρ ≠ 0, δp ≠ 0
- Phase velocity: v_fast² = ½(c_s² + v_A² + √((c_s² + v_A²)² - 4c_s² v_A² cos²θ))
- Fastest MHD wave, isotropic in low-β

### 11.7.3 Slow Magnetosonic Wave
- Propagation: all directions
- Compressive
- Phase velocity: v_slow² = ½(c_s² + v_A² - √((c_s² + v_A²)² - 4c_s² v_A² cos²θ))
- Slowest, highly anisotropic (vanishes for k ∥ B in low-β)

where c_s = √(γp/ρ) is the sound speed, θ is angle between k and B₀.

## 11.8 MHD Equilibria and Stability

### 11.8.1 Static Equilibrium (∇p = J × B)
Force balance between pressure gradient and Lorentz force. Examples:
- **Z-pinch**: J_z, B_θ, p(r)
- **θ-pinch**: J_θ, B_z, p(r)
- **Tokamak**: Toroidal + poloidal fields, Grad-Shafranov equation

### 11.8.2 Energy Principle (Bernstein et al.)
Stability determined by sign of δW (potential energy change):
δW = ½ ∫ [ρ|δu|² + (δB²/μ₀) + γp|∇·ξ|² + ...] dV > 0 → stable

### 11.8.3 Key Instabilities
- **Rayleigh-Taylor**: heavy fluid over light in gravity (or effective gravity from curvature)
- **Kelvin-Helmholtz**: velocity shear
- **Sausage (m=0) / Kink (m=1)**: current-driven, in pinches
- **Ballooning**: pressure-driven, localized on bad-curvature field lines
- **Tearing mode**: resistive, magnetic reconnection at rational surfaces

## 11.9 Extended MHD Models

### 11.9.1 Hall MHD
Includes the Hall term in Ohm's law:
E + u×B = ηJ + (J×B)/(ne) - ∇p_e/(ne)
Hall term (J×B/ne) decouples ion and electron motion at scales below ion skin depth d_i = c/ω_pi. Important for magnetic reconnection, whistler waves.

### 11.9.2 Two-Fluid MHD
Separate ion and electron fluids. Retains all terms in generalized Ohm's law. Captures kinetic effects at ion/electron scales.

### 11.9.3 Gyrokinetics
Averages over gyromotion, retains finite Larmor radius effects. Standard for tokamak turbulence simulations.

### 11.9.4 Relativistic MHD
For flows with u ~ c or magnetic energy ≫ rest mass energy (pulsar winds, GRB jets, AGN). Energy-momentum tensor:
T^{μν} = (ρh + B²) u^μ u^ν + (p + B²/2) g^{μν} - B^μ B^ν

where h = 1 + ε + p/ρ is specific enthalpy.

## 11.10 Astrophysical and Laboratory Applications

### 11.10.1 Solar and Stellar Physics
- Solar corona: β ≪ 1, Alfvén waves, coronal heating, flares, CMEs
- Stellar interiors: dynamo action (α-Ω dynamo), magnetic fields
- Accretion disks: MRI (magnetorotational instability) drives angular momentum transport

### 11.10.2 Interstellar and Intergalactic Medium
- ISM phases: molecular (T~10K), cold neutral (100K), warm neutral (8000K), warm ionized (8000K), hot ionized (10⁶K)
- Cosmic rays: MHD waves scatter CRs, self-confinement
- Galaxy clusters: ICM plasma, thermal conduction suppressed by B

### 11.10.3 Fusion Plasmas (Tokamaks, Stellarators)
- Confined plasma: n ~ 10²⁰ m⁻³, T ~ 10 keV, B ~ 5 T
- MHD stability limits (Troyon beta limit, Troyon et al.)
- ELMs (Edge Localized Modes), disruptions
- ITER, SPARC, stellarator optimization

### 11.10.4 Space Physics
- Earth's magnetosphere: bow shock, magnetopause, tail, radiation belts
- Solar wind: Parker spiral, turbulence, intermittency
- Planetary magnetospheres (Jupiter, Saturn, Ganymede)

## 11.11 Summary

Plasma physics extends fluid dynamics to electrically conducting fluids, merging the Navier-Stokes equations with Maxwell's equations. The resulting Magnetohydrodynamics (MHD) framework reveals new physics: magnetic pressure and tension, Alfvén waves, flux freezing, magnetic reconnection, and a host of MHD instabilities. The dimensionless parameters (β, Rm, Γ, β_c) organize the vast range of plasma behaviors, from laboratory fusion devices to the interstellar medium. MHD is the language of cosmic plasma dynamics.

---

*This document completes the plasma physics section (DOC-11). The next document (DOC-12) explores the Jeans Instability and Star Formation—how self-gravitating fluids collapse to form the first cosmic structures.*