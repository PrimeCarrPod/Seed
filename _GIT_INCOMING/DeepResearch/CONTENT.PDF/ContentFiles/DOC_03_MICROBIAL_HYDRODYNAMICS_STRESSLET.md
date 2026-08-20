# Stokes Flow Regime Microbial Hydrodynamics: Pushers, Pullers, and the Stresslet Tensor Formalism

## Abstract

This document presents an exhaustive mathematical treatment of microbial hydrodynamics in the Stokes flow regime, where viscous forces completely dominate inertial forces (Re ≪ 1). Microscopic biological entities—bacteria, microalgae, spermatozoa—operate in this regime, requiring continuous expenditure of internal chemical energy to break time-reversal symmetry and generate propulsion. We provide a complete derivation of the stresslet tensor formalism for force-free, torque-free swimmers, analyze the fundamental distinction between pushers (negative stresslet, posterior flagella) and pullers (positive stresslet, anterior flagella), examine the mechanical coupling of opposite-type microswimmers in dense suspensions, and derive the active stress tensor and its effect on fluid viscosity. The Smoluchowski equation for orientational probability is derived, and the phenomena of active superfluidity and active turbulence are examined in detail.

---

## 1. Introduction: Life at Low Reynolds Number

The microbial world operates entirely within the Stokes flow regime, characterized by exceedingly low Reynolds numbers (Re = ρUL/μ ~ 10⁻⁴ to 10⁻²). At these scales, viscous forces completely overpower inertial forces: the Navier-Stokes equations reduce to the Stokes equations, where the nonlinear advective term (u·∇)u is negligible. This has profound consequences for locomotion.

In Stokes flow, the equations are linear, instantaneous, and time-reversible. A swimmer executing a sequence of shape changes and then reversing them exactly returns to its starting position (Purcell's Scallop Theorem). Therefore, sustained motion requires the continuous expenditure of internal chemical energy to break time-reversal symmetry, creating localized active stresses within the fluid medium. This fundamental constraint shapes every aspect of microbial swimming, from flagellar waveforms to collective behavior.

The hydrodynamics of microswimmers is elegantly captured by the multipole expansion of the flow field they generate. Because a self-propelled microbe is force-free and torque-free (no external forces or torques), the leading-order disturbance flow is not a Stokeslet (force monopole) or rotlet (torque monopole), but a force dipole—mathematically described by a symmetric, traceless second-rank tensor known as the stresslet.

---

## 2. Stokes Equations and Green's Functions

### 2.1 Stokes Equations

For an incompressible fluid at Re ≪ 1, the governing equations are:

-∇p + μ∇²u = -f
∇·u = 0

where f(x) is the force density exerted by the swimmer on the fluid. The linearity of these equations allows solution via Green's functions.

### 2.2 Fundamental Solutions

The fundamental solution for a point force F at the origin (Stokeslet) is:

u_i(x) = (1/8πμ) (δ_ij/r + x_i x_j/r³) F_j

where r = |x|. The pressure field is:

p(x) = (1/4π) (x·F)/r³

The stresslet (force dipole) is the gradient of the Stokeslet:

u_i(x) = (1/8πμ) S_jk ∂_k (δ_ij/r + x_i x_j/r³) = (1/8πμ) S_jk (∂_k (x_i x_j/r³) + ∂_k (δ_ij/r))

After simplification, the stresslet flow field is:

u(x) = (1/8πμ) [S·x/r³ - 3(S:x x)x/r⁵]

where S is the symmetric traceless stresslet tensor (S_ij = S_ji, S_ii = 0).

### 2.3 Multipole Expansion

For a swimmer of size L, the far-field flow (r ≫ L) can be expanded as:

u(x) = u_Stokeslet + u_Stresslet + u_Source_dipole + u_Quadrupole + ...

Since the swimmer is force-free and torque-free:
- Total force F = 0 → No Stokeslet
- Total torque T = 0 → No Rotlet
- The leading term is the Stresslet (force dipole)
- Higher terms: Source dipole (if swimmer changes volume), Quadrupole, etc.

---

## 3. The Stresslet Tensor: Complete Derivation

### 3.1 Definition from Surface Forces

Consider a swimmer with surface ∂Ω. The force density on the fluid is f(x) = σ·n, where σ is the stress tensor and n is the outward normal. The stresslet tensor is defined as:

S = ∫_{∂Ω} [x f + f x - (2/3)(x·f)I] dS

This is the symmetric traceless part of the first moment of the force distribution. The antisymmetric part would give the torque (rotlet), which is zero for a torque-free swimmer.

### 3.2 Stresslet Strength and Sign

For an axisymmetric swimmer swimming along its symmetry axis ê, the stresslet tensor takes the form:

S = S (ê ê - ⅓I)

where S is the stresslet strength (a scalar). The sign of S distinguishes pushers from pullers:

- **Pushers (S < 0)**: Thrust generated posterior to center of drag (e.g., E. coli)
- **Pullers (S > 0)**: Thrust generated anterior to center of drag (e.g., Chlamydomonas)

### 3.3 Pushers: Escherichia coli

E. coli propels itself by rotating a bundle of helical flagella at the rear of its cell body. The flagellar bundle rotates counterclockwise (viewed from behind), pushing fluid backward along the cell axis and drawing fluid inward radially.

The flow field of a pusher:
- Fluid pushed outward along ê (extensional flow on axis)
- Fluid drawn inward perpendicular to ê (compressional flow in equatorial plane)
- Stresslet strength S < 0

The stresslet magnitude for E. coli: S ≈ -3πμUL, where U is swimming speed and L is cell length.

### 3.4 Pullers: Chlamydomonas reinhardtii

Chlamydomonas uses two anterior flagella in a coordinated breaststroke motion. The flagella pull the cell forward, drawing fluid inward along the axis and expelling it radially.

The flow field of a puller:
- Fluid drawn inward along ê (compressional flow on axis)
- Fluid expelled outward perpendicular to ê (extensional flow in equatorial plane)
- Stresslet strength S > 0

The stresslet magnitude for Chlamydomonas: S ≈ +4πμUL.

### 3.5 Neutral Swimmers

Some microorganisms (e.g., certain ciliates) generate no net stresslet (S = 0) because thrust and drag are collocated. Their leading-order flow field is a source dipole or quadrupole.

---

## 4. Active Stress Tensor in Suspensions

### 4.1 Ensemble Average

For a suspension of N swimmers in volume V, the active stress tensor is the ensemble average of individual stresslets:

Σ^a = (1/V) Σ_{α=1}^N S^α = n ⟨S⟩

where n = N/V is the number density and ⟨S⟩ is the orientation-averaged stresslet tensor.

For an isotropic suspension, ⟨S⟩ = 0. For an aligned suspension, ⟨S⟩ ≠ 0.

### 4.2 Orientation Distribution

Let P(ê,t) be the probability density of orientation ê on the unit sphere (∫ P dê = 1). Then:

⟨S⟩ = ∫ S(ê) P(ê) dê

For uniaxial swimmers with stresslet S(ê) = S(ê ê - ⅓I):

⟨S⟩ = S (⟨ê ê⟩ - ⅓I)

where ⟨ê ê⟩ = ∫ ê ê P(ê) dê is the second-moment orientation tensor.

### 4.3 Active Stress in the Fluid Equations

The total stress in the fluid is:

σ = -pI + 2μE + Σ^a

where E = ½(∇u + ∇uᵀ) is the rate-of-strain tensor. The fluid momentum equation becomes:

-∇p + μ∇²u + ∇·Σ^a = 0

The active stress acts as a body force ∇·Σ^a, driving fluid motion even in the absence of boundaries or external forces.

---

## 5. Mechanical Coupling of Pushers and Pullers

### 5.1 Pairwise Hydrodynamic Interaction

Two swimmers at positions x₁, x₂ with orientations ê₁, ê₂ interact through the fluid. The velocity of swimmer 1 due to swimmer 2 is:

u₁ = (1/8πμ) [S₂·(x₁-x₂)/r³ - 3(S₂:(x₁-x₂)(x₁-x₂))(x₁-x₂)/r⁵] + O(r⁻⁴)

where r = |x₁-x₂|. This is the stresslet-induced velocity.

The rotational velocity (angular velocity) of swimmer 1 is:

ω₁ = (1/8πμ) ∇×u₂ |_{x₁} = (1/8πμ) ε_{ijk} ∂_j u_{2k} |_{x₁}

For stresslet S₂ = S₂(ê₂ê₂ - ⅓I):

ω₁ ∝ S₂/r³ [ê₂ × (x₁-x₂)/r] (1 - 3cos²θ₂)

where θ₂ is the angle between ê₂ and the separation vector.

### 5.2 Pusher-Pusher Interactions

Two parallel pushers (ê₁ = ê₂ = ê) side by side:
- Each draws fluid inward radially
- They attract each other laterally
- They align parallel (stable)

Two pushers in line (one behind the other):
- The leader pushes fluid back onto the follower
- The follower experiences increased drag
- They repel each other axially

### 5.3 Puller-Puller Interactions

Two parallel pullers side by side:
- Each expels fluid radially
- They repel each other laterally
- They tend to anti-align

Two pullers in line:
- The leader pulls fluid forward
- The follower is pulled along
- They attract axially

### 5.4 Pusher-Puller Interactions

A pusher and a puller side by side:
- The pusher draws fluid in, the puller expels it
- They experience a net lateral force depending on relative orientation
- Complex dynamics: can form bound pairs or chase each other

A pusher behind a puller (aligned):
- The puller draws fluid toward itself
- The pusher pushes fluid toward the puller
- They attract strongly, forming a "tractor" configuration

---

## 6. Active Superfluidity and Active Turbulence

### 6.1 Effective Viscosity

The effective viscosity of a suspension is defined by the relation between the average stress and the average rate of strain:

⟨σ⟩ = -⟨p⟩I + 2μ_eff ⟨E⟩

For a dilute suspension of pushers in a shear flow, the stresslet orientation is biased by the flow. Solving the Smoluchowski equation for P(ê) in shear flow (see Section 7), the active stress contribution to viscosity is:

μ_eff = μ(1 + (5/2)φ + nS/μ · f(Pe))

where φ is volume fraction, Pe = γ̇/D_r is the Péclet number (ratio of shear rate to rotational diffusivity), and f(Pe) is a function that is negative for pushers and positive for pullers.

For pushers (S < 0), f(Pe) < 0 → μ_eff < μ (viscosity reduction)
For pullers (S > 0), f(Pe) > 0 → μ_eff > μ (viscosity enhancement)

### 6.2 Active Superfluidity

In dense pusher suspensions, the viscosity reduction can be so strong that μ_eff → 0 or even becomes negative. This is termed "active superfluidity." The fluid offers no resistance to shear, and any small perturbation grows, leading to large-scale chaotic flows.

The condition for active superfluidity is:

n|S|/μ > (5/2)φ + 1

At this point, the active stress overwhelms the passive viscous stress.

### 6.3 Active Turbulence

When μ_eff becomes negative, the fluid is linearly unstable. The instability manifests as:
- Large-scale vortical structures (spontaneous flow)
- Chaotic, disordered velocity fields
- Energy spectrum E(k) ~ k^(-α) with α ≠ 5/3 (different from inertial turbulence)
- Characteristic length scale ℓ ~ √(μ/n|S|) (active length scale)

This "active turbulence" is distinct from inertial turbulence: it occurs at Re ≪ 1, is driven by active stresses, and exhibits different scaling laws.

---

## 7. Smoluchowski Equation for Orientational Probability

### 7.1 Derivation

The orientation of a single swimmer evolves according to:

dê/dt = Ω·ê + λ(E·ê - (ê·E·ê)ê) + ξ_r(t)

where Ω = ½(∇u - ∇uᵀ) is the vorticity tensor, E = ½(∇u + ∇uᵀ) is the strain rate tensor, λ is the shape parameter, and ξ_r is rotational Brownian noise with ⟨ξ_r(t)ξ_r(t')⟩ = 2D_r δ(t-t').

The probability density P(ê,t) satisfies the Fokker-Planck (Smoluchowski) equation:

∂P/∂t + ∇_ê·(Ṗ P) = D_r ∇_ê²P

where ∇_ê is the surface gradient on the unit sphere, and Ṗ is the deterministic orientation rate.

### 7.2 Steady State in Shear Flow

For simple shear flow u = (γ̇ y, 0, 0), the steady-state orientation distribution for a pusher is concentrated in the flow-gradient plane, with a preference for alignment with the flow direction. For a puller, the distribution is similar but with different alignment angles.

The second-moment tensor ⟨ê ê⟩ can be computed perturbatively for small Pe or numerically for large Pe.

### 7.3 Concentration and Orientation Coupling

In dense suspensions, the fluid velocity u depends on the active stress Σ^a, which depends on P(ê). This creates a coupled system:

∂P/∂t + ∇_ê·(Ṗ[P] P) = D_r ∇_ê²P
-∇p + μ∇²u + ∇·Σ^a[P] = 0
∇·u = 0

This is the basis for continuum models of active suspensions (Saintillan & Shelley, 2008).

---

## 8. Dense Suspension Dynamics: Continuum Theory

### 8.1 Conservation Equations

The swimmer concentration c(x,t) satisfies:

∂c/∂t + ∇·(c u + c U_s ⟨ê⟩ - D_t ∇c) = 0

where U_s is the swimming speed, ⟨ê⟩ = ∫ ê P dê is the mean orientation, and D_t is translational diffusivity.

The orientation tensor Q = ⟨ê ê⟩ - ⅓I satisfies:

∂Q/∂t + u·∇Q = Ω·Q - Q·Ω + λ(E·Q + Q·E - ⅔ tr(E·Q)I) - 6D_r Q + ...

### 8.2 Linear Stability Analysis

Linearizing about the isotropic state (c = c₀, Q = 0, u = 0) gives the dispersion relation:

ω(k) = -D_t k² ± √( (nS/μ) c₀ k² - (6D_r)² )

For pushers (S < 0), the term under the square root becomes negative for k < k_c, leading to instability. The critical wavenumber is:

k_c = √(6D_r μ / n|S|c₀)

### 8.3 Nonlinear Saturation and Patterns

The instability saturates nonlinearly, forming:
- Density bands (high/low concentration)
- Vortical structures
- Traveling waves
- Defect turbulence (disclinations in orientation field)

These patterns are observed experimentally in bacterial suspensions.

---

## 9. Flagellar Hydrodynamics and the Resistive Force Theory

### 9.1 Slender Body Theory for Flagella

A flagellum is a slender filament (length L, radius a, L/a ~ 100). The force per unit length f(s) along the flagellum is related to the velocity u(s) by resistive force theory (RFT):

f_∥ = -ξ_∥ u_∥
f_⊥ = -ξ_⊥ u_⊥

where ξ_∥ = 2πμ/ln(L/a), ξ_⊥ = 4πμ/ln(L/a) (ξ_⊥ ≈ 2ξ_∥).

### 9.2 Helical Flagellum Propulsion

For a helical flagellum with radius R, pitch λ, rotating at frequency ω:

U = ωR² / (ξ_⊥λ/2π + ξ_∥R²/λ) × (some geometric factor)

The thrust force F = 6πμaU (for cell body) balances the flagellar thrust.

### 9.3 Flagellar Bundling

E. coli has multiple flagella that form a bundle. The hydrodynamic interaction between flagella in a bundle is cooperative: they synchronize and rotate as a single effective helix. The bundling transition occurs when the rotation rate exceeds a critical value.

---

## 10. Experimental Validation

### 10.1 Particle Tracking Microrheology

Tracer particles in active suspensions exhibit enhanced diffusion:

D_eff = D_0 + D_active

where D_active ~ nS²/μ² for pushers.

### 10.2 Flow Visualization

PIV measurements of E. coli suspensions show:
- Large-scale vortices (active turbulence)
- Velocity correlation length ~ 50-100 μm
- Energy injection at the scale of the swimmer

### 10.3 Rheometry

Bulk rheology measurements confirm:
- Viscosity reduction for pushers (up to 10× at high concentration)
- Viscosity enhancement for pullers
- Shear-thinning behavior

---

## 11. Summary and Conclusions

The hydrodynamics of microorganisms in the Stokes regime is governed by the stresslet tensor, the leading-order flow singularity of a force-free, torque-free swimmer. Key results:

1. **Stresslet formalism**: The symmetric traceless tensor S = S(ê ê - ⅓I) completely characterizes the far-field flow of a microswimmer.

2. **Pusher/Puller dichotomy**: 
   - Pushers (E. coli, S < 0): thrust posterior, extensional on axis
   - Pullers (Chlamydomonas, S > 0): thrust anterior, compressional on axis

3. **Mechanical coupling**: Hydrodynamic interactions between swimmers depend on stresslet sign and relative orientation, leading to complex collective dynamics.

4. **Active stress**: Σ^a = n⟨S⟩ modifies the fluid momentum equation, driving spontaneous flows.

5. **Active superfluidity**: Pusher suspensions exhibit viscosity reduction, potentially leading to negative effective viscosity and active turbulence.

6. **Smoluchowski equation**: The orientation distribution P(ê) evolves under flow, Brownian rotation, and active torques, coupling to concentration and fluid velocity.

7. **Continuum instability**: Dense pusher suspensions are linearly unstable, forming patterns (bands, vortices, turbulence) at scales much larger than individual swimmers.

These principles form the hydrodynamic foundation for understanding microbial swarming, bioconvection, and the collective behavior of active matter at microscopic scales.

---

## References

1. Rheology of Active Fluids - David Saintillan.
2. KINETIC MODELS FOR BIOLOGICALLY ACTIVE SUSPENSIONS - David Saintillan.
3. Theory of active suspensions - math.nyu.edu.
4. Swimmer types of optimum surface-driven active particles - JFM.
5. Mechanical Coupling of Puller and Pusher Active Microswimmers Influences Motility - PMC.
6. Mechanical Coupling of Puller and Pusher Active Microswimmers Influences Motility - ACS Publications.
7. An effective and efficient model of the near-field hydrodynamic interactions for active suspensions of bacteria - PNAS.
8. Active Stokesian dynamics - Soft Matter Group.

---

*End of Document 3: Stokes Flow Regime Microbial Hydrodynamics: Pushers, Pullers, and the Stresslet Tensor Formalism*