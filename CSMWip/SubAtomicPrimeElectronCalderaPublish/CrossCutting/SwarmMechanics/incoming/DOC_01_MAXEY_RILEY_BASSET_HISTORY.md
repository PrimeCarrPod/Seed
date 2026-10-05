# The Maxey-Riley Equation: Complete Derivation, Basset History Force, and Inertial Particle Dynamics in Non-Uniform Flow Fields

## Abstract

This document presents an exhaustive mathematical treatment of the Maxey-Riley equation, the fundamental integro-differential framework governing the motion of small, rigid spherical or near-spherical particles through non-uniform fluid fields. Derived rigorously from the Navier-Stokes equations under the assumption of small particle-to-fluid density ratio and low particle Reynolds number, the Maxey-Riley equation accounts for the complete balance of hydrodynamic forces including the undisturbed fluid force, buoyancy, Stokes drag, added mass, and the critically important Basset history force. We provide a complete derivation from first principles, analyze the mathematical structure of the Basset history integral with its singular kernel, examine asymptotic settling behavior demonstrating the transition from exponential to power-law relaxation, and discuss the profound implications for particle trajectory prediction in turbulent flows. The inclusion of the history term fundamentally alters the asymptotic settling behavior, replacing exponential relaxation to terminal velocity with a power-law decay scaling as t^(-1/2), proving that the fluid medium retains a persistent memory of the particle's passage.

---

## 1. Introduction: The Hydrodynamic Foundations of Particle Motion

The mechanics of collective motion—whether analyzing the passive descent of frozen hydrometeors through atmospheric turbulence or the highly coordinated maneuvers of biological swarms—rests upon a rigorous understanding of how individual particles interact with their fluid medium. The medium, whether air or water, acts simultaneously as a viscous resistor dissipating kinetic energy and as a dynamic communicative substrate transmitting hydrodynamic information between particles. Hydrodynamic forces dictate not only the trajectory of a single body but also the emergent, macroscopic architecture of massive aggregations.

For a small, rigid spherical particle of radius a and density ρ_p moving through a fluid of density ρ_f and kinematic viscosity ν, the equation of motion must account for the complex interplay between particle inertia and fluid forces. The classical approach begins with the Navier-Stokes equations for the fluid velocity field u(x,t):

∂u/∂t + (u·∇)u = -(1/ρ_f)∇p + ν∇²u + f_ext
∇·u = 0

where p is the pressure field and f_ext represents external body forces. The particle velocity v(t) satisfies Newton's second law:

m_p dv/dt = F_hydrodynamic + F_external

where m_p = (4/3)πa³ρ_p is the particle mass. The hydrodynamic force F_hydrodynamic arises from the fluid stress tensor integrated over the particle surface. For small particles (a ≪ L, where L is the characteristic flow length scale) at low particle Reynolds number Re_p = |v-u|a/ν ≪ 1, the flow around the particle can be linearized, leading to the Maxey-Riley equation.

---

## 2. Derivation of the Maxey-Riley Equation from Navier-Stokes

### 2.1 Governing Equations and Scaling

Consider a spherical particle of radius a centered at position x_p(t) with velocity v(t) = dx_p/dt. The fluid velocity field is u(x,t). We introduce the relative velocity w(t) = v(t) - u(x_p(t),t). The particle Reynolds number is Re_p = |w|a/ν. We assume Re_p ≪ 1, allowing linearization of the Navier-Stokes equations in the particle frame.

The fluid motion satisfies the unsteady Stokes equations in the frame moving with the particle:

ρ_f(∂u'/∂t + (v·∇)u') = -∇p' + μ∇²u'
∇·u' = 0

where u'(x,t) = u(x,t) - v(t) is the fluid velocity relative to the particle, and μ = ρ_fν is the dynamic viscosity. The boundary conditions are:

u'(x,t) = 0 at |x - x_p| = a (no-slip on particle surface)
u'(x,t) → u(x,t) - v(t) as |x - x_p| → ∞

### 2.2 Solution via Generalized Faxén Laws

The hydrodynamic force on the particle can be obtained by solving the unsteady Stokes equations with the given boundary conditions. Using the method of multipole expansions or the generalized Faxén laws, the force is expressed as a series of integrals involving the fluid velocity field and its derivatives evaluated at the particle center. The complete result, first derived by Maxey and Riley (1983), is:

F_hydrodynamic = F_fluid + F_buoyancy + F_stokes + F_added_mass + F_basset

where each term represents a distinct physical mechanism.

### 2.3 The Undisturbed Fluid Force

The force exerted by the undisturbed fluid flow on the particle volume is:

F_fluid = ρ_f V_p Du/Dt |_{x=x_p}

where V_p = (4/3)πa³ is the particle volume and D/Dt = ∂/∂t + u·∇ is the material derivative following the fluid. This term represents the force the fluid would exert on the volume occupied by the particle if the particle were absent.

### 2.4 Buoyancy Force

The buoyancy force arises from the pressure gradient in the fluid:

F_buoyancy = -ρ_f V_p g

where g is the gravitational acceleration. In a non-uniform flow, this generalizes to -ρ_f V_p Du/Dt in the absence of gravity, but we keep them separate for clarity.

### 2.5 Stokes Drag Force

The quasi-steady Stokes drag on a sphere moving with relative velocity w through a viscous fluid is:

F_stokes = 6πμa w = 6πμa (v - u)

This is the classical result for steady motion at Re_p ≪ 1. In the Maxey-Riley equation, this appears as the instantaneous drag proportional to the relative velocity.

### 2.6 Added Mass Force

When a particle accelerates relative to the fluid, it must accelerate some of the surrounding fluid with it. For a sphere, the added mass is half the displaced fluid mass:

F_added_mass = (1/2)ρ_f V_p (Du/Dt - dv/dt) = (1/2)ρ_f V_p (Du/Dt - dw/dt - Du/Dt) = -(1/2)ρ_f V_p dw/dt

The added mass coefficient C_m = 1/2 for a sphere. This term is proportional to the relative acceleration.

### 2.7 The Basset History Force

The most mathematically complex and physically profound term is the Basset history force, which accounts for the temporal delay in the development of the viscous boundary layer around an accelerating particle. This force represents the fluid's memory of the particle's past kinematic states. The complete Maxey-Riley equation, combining all terms, is:

(ρ_p + ½ρ_f)V_p dv/dt = ρ_f V_p Du/Dt + (ρ_p - ρ_f)V_p g + 6πμa(u - v) + 6πμa²√(ν/π) ∫₀ᵗ (d/dτ)[u(x_p(τ),τ) - v(τ)] / √(t-τ) dτ

The last term is the Basset history force, written here in its standard form. The integral kernel (t-τ)^(-1/2) is singular at the upper limit, reflecting the singular nature of the boundary layer development at the current time.

---

## 3. The Basset History Force: Mathematical Structure and Physical Significance

### 3.1 Convolution Integral Formulation

The Basset history force is expressed as a convolution integral:

F_basset(t) = 6πμa²√(ν/π) ∫₀ᵗ (dw/dτ) / √(t-τ) dτ

where w(τ) = v(τ) - u(x_p(τ),τ) is the relative velocity history. This is a convolution of the relative acceleration with the kernel K(t) = (πνt)^(-1/2). The singularity at τ = t is integrable but poses significant numerical challenges.

### 3.2 Physical Origin: Boundary Layer Development

The physical origin of the history force lies in the unsteady development of the viscous boundary layer around the particle. When a particle accelerates, the boundary layer does not adjust instantaneously; rather, vorticity diffuses outward from the particle surface over a characteristic time scale t_v = a²/ν. During this diffusion process, the velocity profile in the boundary layer retains memory of the particle's past acceleration history. The (t-τ)^(-1/2) kernel arises directly from the solution of the one-dimensional diffusion equation for vorticity in the boundary layer.

### 3.3 Dimensionless Form and the Stokes Number

Introducing dimensionless variables:
- Time: t* = t / τ_p where τ_p = (2/9)(ρ_p/ρ_f)(a²/ν) is the particle momentum response time
- Velocity: v* = v / U, u* = u / U where U is a characteristic flow velocity
- Length: x* = x / L

The dimensionless Maxey-Riley equation becomes:

(1 + ½(ρ_f/ρ_p)) dv*/dt* = (ρ_f/ρ_p) Du*/Dt* + (1 - ρ_f/ρ_p)g* + (v* - u*)/St + (1/St)√(St/π) ∫₀ᵗ* (d/dτ*)(u* - v*)/√(t*-τ*) dτ*

where St = τ_p / τ_f is the Stokes number, the ratio of the particle momentum response time τ_p to the characteristic fluid time scale τ_f = L/U. The Stokes number is the key dimensionless parameter governing particle behavior:
- St ≪ 1: Particles follow fluid streamlines faithfully (tracer limit)
- St ~ 1: Particles partially respond to fluid accelerations
- St ≫ 1: Particles maintain inertia, crossing fluid streamlines

### 3.4 Memory Effects and Non-Markovian Dynamics

The history integral makes the Maxey-Riley equation non-Markovian: the particle's current acceleration depends on its entire past velocity history. This is in stark contrast to the Markovian approximation where the history force is neglected, yielding an ordinary differential equation. The non-Markovian nature has profound consequences for:
- Long-time asymptotic behavior
- Statistical properties in turbulent flows
- Particle clustering and preferential concentration
- Numerical simulation methodologies

---

## 4. Asymptotic Settling Behavior: Exponential vs Power-Law Relaxation

### 4.1 Classical Exponential Relaxation (Without History Force)

Neglecting the Basset history force, the equation for a particle settling under gravity in a quiescent fluid (u = 0) reduces to:

(ρ_p + ½ρ_f)V_p dv/dt = (ρ_p - ρ_f)V_p g - 6πμa v

This is a first-order linear ODE with solution:

v(t) = v_∞(1 - e^(-t/τ_relax)) + v(0)e^(-t/τ_relax)

where v_∞ = (ρ_p - ρ_f)V_p g / (6πμa) is the terminal velocity and τ_relax = (ρ_p + ½ρ_f)V_p / (6πμa) is the relaxation time. The approach to terminal velocity is exponential.

### 4.2 Power-Law Relaxation (With History Force)

Including the Basset history force, the settling equation becomes:

(ρ_p + ½ρ_f)V_p dv/dt = (ρ_p - ρ_f)V_p g - 6πμa v - 6πμa²√(ν/π) ∫₀ᵗ (dv/dτ)/√(t-τ) dτ

Taking the Laplace transform, with L{v(t)} = Ṽ(s), the history integral transforms as:

L{∫₀ᵗ (dv/dτ)/√(t-τ) dτ} = √(π/s) [sṼ(s) - v(0)]

The transformed equation is:

(ρ_p + ½ρ_f)V_p [sṼ(s) - v(0)] = (ρ_p - ρ_f)V_p g/s - 6πμa Ṽ(s) - 6πμa²√(ν/π) √(π/s) [sṼ(s) - v(0)]

Solving for Ṽ(s) and analyzing the small-s behavior (corresponding to large t), we find:

Ṽ(s) ~ v_∞/s - C s^(-3/2) + ...

where C is a constant. The inverse Laplace transform of s^(-3/2) is 2√(t/π). Therefore, the long-time behavior is:

v(t) = v_∞ - (C/√π) t^(-1/2) + O(t^(-1))

The approach to terminal velocity follows a power-law decay ~ t^(-1/2), fundamentally slower than exponential decay. This means the particle "remembers" its initial conditions for much longer times, and the fluid medium retains a persistent memory of the particle's passage.

### 4.3 Implications for Particle Trajectories in Turbulence

In turbulent flows, the power-law memory kernel has several critical consequences:
1. **Enhanced particle clustering**: Particles with history force exhibit stronger preferential concentration in strain-dominated regions
2. **Modified collision statistics**: The altered settling velocity distribution affects collision kernels for cloud droplets and aerosols
3. **Non-local temporal correlations**: Particle velocity at time t depends on fluid velocity at all previous times with algebraic weight
4. **Subdiffusive behavior**: At long times, particle dispersion can exhibit subdiffusive scaling due to the long memory

---

## 5. Numerical Methods for the Basset History Force

### 5.1 Direct Quadrature and Singularity Treatment

The singular kernel (t-τ)^(-1/2) requires careful numerical treatment. Direct quadrature with adaptive time-stepping can resolve the singularity, but the computational cost grows as O(N²) where N is the number of time steps, making long-time simulations prohibitively expensive.

### 5.2 Windowing and Approximation Methods

Several approximation strategies exist:
- **Windowing**: Truncate the integral at t - T_window, assuming the kernel weight beyond T_window is negligible
- **Exponential sum approximation**: Approximate t^(-1/2) as a sum of exponentials Σ c_i e^(-λ_i t), converting the convolution to a set of ODEs
- **Fractional derivative formulation**: Recognize the history integral as a half-derivative (Caputo or Riemann-Liouville), enabling spectral methods

### 5.3 Second-Order Accurate Methods

van Hinsberg et al. (2011) developed a second-order accurate method based on piecewise quadratic interpolation of the relative acceleration, achieving O(N log N) complexity using fast convolution algorithms. The key insight is to approximate the acceleration history on each subinterval with a quadratic polynomial, for which the convolution with t^(-1/2) can be evaluated analytically.

---

## 6. The Maxey-Riley Equation in General Non-Uniform Flows

### 6.1 Faxén Corrections for Finite-Size Effects

For particles of finite size relative to flow gradients, Faxén corrections account for the spatial variation of the fluid velocity across the particle volume:

F_fluid = ρ_f V_p [Du/Dt + (a²/10)∇²(Du/Dt) + ...]

These higher-order terms become important when a ~ L or when flow gradients are large.

### 6.2 Lift Forces in Shear Flows

In non-uniform flows with velocity gradients, additional lift forces arise:
- **Saffman lift**: For particles in a simple shear flow, F_lift ∝ μa²√(ν/|γ̇|) γ̇ × ω where γ̇ is the shear rate
- **Magnus lift**: For rotating particles, F_magnus ∝ ρ_f a³ ω × (v - u)

These forces can significantly alter particle trajectories in wall-bounded flows and vortical structures.

### 6.3 Extension to Non-Spherical Particles

For non-spherical particles (e.g., snowflakes modeled as thin disks), the Maxey-Riley equation generalizes to a tensor form where drag, added mass, and history force become orientation-dependent tensors. The orientation dynamics couple to the translational motion through hydrodynamic torques, leading to the rich kinematic regimes (stable, zigzag, tumbling) observed in anisotropic particle settling.

---

## 7. Connection to Collective Behavior: From Single Particle to Swarm

### 7.1 Wake-Mediated Interactions

The Basset history force demonstrates that a particle's passage leaves a persistent hydrodynamic signature in the fluid. Subsequent particles following in the same path experience modified forces due to the altered velocity field. This wake-mediated interaction is a fundamental mechanism for passive particle clustering.

### 7.2 Preferential Sweeping and Loitering

In turbulent flows, particles with St ~ 1 exhibit preferential sweeping (concentration in downward-moving fluid regions) and loitering (trapping in upward-moving regions). The history force modifies the statistics of these phenomena by altering the particle response time and introducing memory effects that enhance or suppress clustering depending on the turbulence time scales.

### 7.3 Dimensionless Parameter for Swarm Behavior

The behavior of a swarm of falling particles is governed by the ratio of gravitational settling velocity to turbulent diffusion velocity. When this parameter drops below a critical threshold, horizontal relative motion completely dominates vertical descent, fundamentally reorganizing the swarm structure.

---

## 8. Summary and Conclusions

The Maxey-Riley equation represents the complete first-principles description of inertial particle motion in non-uniform flows at low Reynolds number. Its key features are:

1. **Complete force balance**: Undisturbed fluid force, buoyancy, Stokes drag, added mass, and Basset history force
2. **Non-Markovian dynamics**: The history integral introduces long-term memory, making the system fundamentally non-Markovian
3. **Power-law relaxation**: The asymptotic approach to terminal velocity follows t^(-1/2) rather than exponential decay
4. **Singular kernel**: The (t-τ)^(-1/2) singularity requires specialized numerical methods
5. **Stokes number control**: The dimensionless Stokes number St governs the transition from tracer-like to inertia-dominated behavior
6. **Collective implications**: Persistent hydrodynamic memory mediates inter-particle interactions, enabling passive clustering analogous to biological aggregation

The rigorous inclusion of the Basset history force is not a minor correction; it qualitatively changes the long-time dynamics, the statistical properties in turbulence, and the collective behavior of particle swarms. Any comprehensive theory of fluid-mediated collective motion—from passive hydrometeor settling to active biological swarming—must be built upon this foundational framework.

---

## References

1. Maxey, M. R., & Riley, J. J. (1983). Equation of motion for a small rigid sphere in a nonuniform flow. Physics of Fluids, 26(4), 883-889.
2. Accurate solution method for the Maxey–Riley equation, and the effects of Basset history. ResearchGate.
3. Maxey-Riley-global-existence.pdf - George Haller.
4. On the role of the history force for inertial particles in turbulence - arXiv:1501.04770.
5. The Basset–Boussinesq history force: its neglect, validity, and recent numerical developments. Frontiers in Physics.
6. An efficient, second order method for the approximation of the Basset history force. Journal of Computational Physics.
7. Thin disks falling in air. ResearchGate.
8. Modal analysis reveals imprint of snowflake shape on wake flow structures. DORA 4RI.
9. Three dimensional wakes of freely falling planar polygons. ResearchGate.
10. Turbulence effect on disk settling dynamics. ResearchGate.
11. The p.d.f.s of the snow particle vertical velocity. ResearchGate.

---

## Appendix A: Laplace Transform Derivation of Power-Law Asymptotics

The Laplace transform of the history integral:

L{∫₀ᵗ f(τ)(t-τ)^(-1/2) dτ} = L{f(t)} · L{t^(-1/2)} = F(s) · √(π/s)

For f(t) = dv/dt, F(s) = sṼ(s) - v(0), giving the result used in Section 4.2.

---

## Appendix B: Dimensionless Parameter Definitions

| Parameter | Definition | Physical Meaning |
|-----------|------------|------------------|
| St = τ_p/τ_f | (2/9)(ρ_p/ρ_f)(a²/ν)/(L/U) | Particle inertia vs fluid time scale |
| Re_p = |w|a/ν | Particle Reynolds number |
| Fr = U/√(gL) | Froude number | Inertia vs gravity |
| β = ρ_f/ρ_p | Density ratio | Fluid vs particle inertia |

---

*End of Document 1: The Maxey-Riley Equation: Complete Derivation, Basset History Force, and Inertial Particle Dynamics in Non-Uniform Flow Fields*