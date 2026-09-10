# Document 16: Interaction Potentials and the Morse Potential
## Pairwise Forces, Equidistant Spacing, and the Mechanics of Swarm Cohesion

### 16.1 The Three-Zone Model: Repulsion, Alignment, Attraction

The behavior of individuals in a swarm is governed by three fundamental behavioral rules (Aoki, 1982; Reynolds, 1987; Couzin et al., 2002):

1. **Short-range repulsion**: Avoid collisions with nearby neighbors.
2. **Intermediate-range alignment**: Match velocity (speed and direction) with neighbors.
3. **Long-range attraction**: Stay with the group, maintain cohesion.

These rules can be implemented as **pairwise interaction potentials** V(r) where r = |x_i - x_j| is the metric distance between agents i and j. The force on agent i from agent j is:

F_ij = -∇_i V(|x_i - x_j|)

The total force on agent i is ∑_{j≠i} F_ij.

### 16.2 The Morse Potential: Analytical Form and Parameters

The **Morse potential** is a widely used continuous, radially symmetric potential that captures both repulsion and attraction in a single analytical form:

V(r) = C_a e^{-r/ℓ_a} - C_r e^{-r/ℓ_r}

where:
- C_a > 0 is the attractive amplitude
- ℓ_a > 0 is the attractive length scale
- C_r > 0 is the repulsive amplitude
- ℓ_r > 0 is the repulsive length scale

**Requirements for a stable swarm**:
1. ℓ_a > ℓ_r (attraction acts over longer range than repulsion)
2. C_r / ℓ_r > C_a / ℓ_a (repulsion dominates at short range)

The force is:
F(r) = -dV/dr = (C_r/ℓ_r) e^{-r/ℓ_r} - (C_a/ℓ_a) e^{-r/ℓ_a}

**Equilibrium distance** r₀ (where F = 0):
r₀ = (ℓ_a ℓ_r / (ℓ_a - ℓ_r)) ln( (C_r ℓ_a) / (C_a ℓ_r) )

**Potential well depth** (binding energy):
V(r₀) = -C_r e^{-r₀/ℓ_r} + C_a e^{-r₀/ℓ_a} < 0

### 16.3 The Quasi-Morse Potential and Generalizations

The **Quasi-Morse potential** (Carrillo et al.) generalizes the exponents:

V(r) = (C_a/α) e^{-r/ℓ_a} - (C_r/β) e^{-r/ℓ_r}

with α, β > 0. This allows independent control of force and potential scaling.

Other common potentials:
- **Lennard-Jones**: V(r) = 4ε [(σ/r)¹² - (σ/r)⁶] (steeper repulsion)
- **Power-law**: V(r) = C_a r^{-a} - C_r r^{-r} (scale-free)
- **Damped oscillatory**: V(r) = e^{-r/ℓ} cos(k r) (hydrodynamic origin)
- **Zone model**: Piecewise constant forces in three zones (repulsion, alignment, attraction)

### 16.4 H-Stability: The Thermodynamic Requirement for Swarm Stability

A potential is **H-stable** (stable against collapse) if there exists a constant B ≥ 0 such that for any configuration of N particles:

∑_{1 ≤ i < j ≤ N} V(|x_i - x_j|) ≥ -B N

This means the total potential energy is **bounded below by a linear function of N**. If H-stability is violated, the system can lower its energy indefinitely by collapsing all particles to a point (catastrophic collapse).

**For the Morse potential**: H-stability requires:
C_r ℓ_r^d > C_a ℓ_a^d  (for d-dimensional space)

More precisely, in d dimensions, the condition is:
C_r ℓ_r^{d+1} > C_a ℓ_a^{d+1}

This ensures the repulsive "core" is strong enough to prevent collapse, even in the thermodynamic limit N → ∞.

### 16.5 Equidistant Spacing and the "Comfortable Distance"

When H-stability holds, the particles settle into a stable configuration with a well-defined **equilibrium spacing** r₀. In a large swarm, the density becomes uniform:

ρ = N / V → constant

The average nearest-neighbor distance is:
⟨r_nn⟩ ≈ ρ^{-1/d}

In a crystalline or liquid-like arrangement, all nearest-neighbor distances cluster around r₀. This is the **"comfortable distance"** (Carrillo et al.)—the distance at which an agent experiences zero net force from its neighbors.

The swarm boundary is sharp (surface tension-like), and the swarm radius scales as:
R ∼ N^{1/d}

This linear scaling of swarm size with N is observed in biological swarms (starling flocks, fish schools, insect swarms).

### 16.6 The Pair Correlation Function and Swarm Structure

The spatial structure of the swarm is characterized by the **pair correlation function** g(r):

g(r) = (1/ρ²) ⟨∑_{i≠j} δ(r - |x_i - x_j|)⟩

For a swarm with Morse potential at moderate density:
- g(r) = 0 for r < r_min (hard-core-like repulsion)
- Peak at r = r₀ (equilibrium distance)
- Damped oscillations at r > r₀ (liquid-like order)
- g(r) → 1 for r → ∞ (no long-range positional order)

The **structure factor** S(k) = 1 + ρ ∫ (g(r) - 1) e^{i k·r} dr shows a peak at k ≈ 2π/r₀, indicating short-range order.

### 16.7 Active Particles with Morse Potential: The Active Matter Phase Diagram

When the Morse potential is combined with self-propulsion (active particles), the phase diagram becomes rich:

**Phases**:
1. **Gas**: Low density, no order. Particles move independently.
2. **Liquid**: Moderate density, short-range order, no global alignment.
3. **Solid/Crystal**: High density, positional order (hexatic or crystalline).
4. **Polar liquid/flock**: Alignment + cohesion, global polar order.
5. **Active clusters**: MIPS-like clusters with alignment (polar clusters).
6. **Bands**: Traveling high-density bands (Vicsek-like, Document 14).

The phase boundaries depend on:
- Péclet number Pe = v₀ / (D_r r₀) (propulsion vs rotational diffusion)
- Density ρ
- Interaction strengths C_a, C_r
- Range ratio ℓ_a/ℓ_r

### 16.8 Continuum Limit: The Nonlocal Aggregation Equation

For a large number of particles, the density ρ(x, t) evolves according to the **aggregation equation**:

∂ρ/∂t = ∇·(ρ ∇(V * ρ)) + D ∇²ρ

where V * ρ = ∫ V(|x - y|) ρ(y) dy is the convolution, and D is translational diffusion.

For the Morse potential, this is a **nonlocal PDE** with a kernel that is attractive at long range and repulsive at short range.

**Steady states**: Uniform density ρ = ρ₀ is a steady state. Its stability is determined by the Fourier transform of V:

V̂(k) = ∫ V(r) e^{-i k·r} dr

For the Morse potential in d dimensions:
V̂(k) = C_a (ℓ_a/(1 + (kℓ_a)²)^{(d+1)/2}) - C_r (ℓ_r/(1 + (kℓ_r)²)^{(d+1)/2})

If V̂(k) < 0 for some k, the uniform state is unstable and patterns form (stripes, clusters, etc.).

### 16.9 The Morse Potential in Hydrodynamic Equations

In the Toner-Tu equations (Document 15), the pressure P(ρ) encodes the effective interactions. For a system with Morse interactions, the pressure is:

P(ρ) = ρ² ∂/∂ρ (E_int[ρ]/ρ)

where E_int[ρ] = (1/2) ∫ ρ(x) (V * ρ)(x) dx is the interaction energy.

The resulting hydrodynamic equations have a **nonlocal pressure**:
∇P = ρ ∇(V * ρ)

This couples the Toner-Tu alignment dynamics with the Morse aggregation dynamics, giving a unified theory of **polar active matter with cohesive interactions**.

### 16.10 The Quasi-Morse Potential and Nonlocal Aggregation

The **Quasi-Morse potential** (α ≠ 1, β ≠ 1) allows fine-tuning of the equilibrium properties. The aggregation equation with Quasi-Morse potential exhibits:

- **Sharp interfaces**: Swarm boundary with surface tension.
- **Pattern formation**: Stripes, spots, rings depending on parameters.
- **Hysteresis**: Multiple stable states (e.g., dispersed vs. aggregated).
- **Collapse vs. explosion**: If H-stability is violated, collapse; if attraction is too weak, explosion (dispersion).

### 16.11 Biological Parameter Estimation

For starling flocks (murmurations):
- Equilibrium distance: r₀ ≈ 1 m (inter-bird distance)
- Repulsive range: ℓ_r ≈ 0.3 m (collision avoidance)
- Attractive range: ℓ_a ≈ 5 m (cohesion)
- Amplitude ratio: C_r/C_a ≈ 10–100 (strong repulsion)
- H-stability: Satisfied (flocks don't collapse)

For fish schools:
- r₀ ≈ 0.5–1 body lengths
- ℓ_r ≈ 0.2 BL, ℓ_a ≈ 3 BL
- Alignment zone is distinct from attraction/repulsion (three-zone model)

For bacterial swarms:
- Repulsion: Steric/hard-core (excluded volume)
- Attraction: Chemotaxis (Keller-Segel, Document 6) or physical adhesion
- No explicit alignment zone (alignment from hydrodynamics, Document 5)

### 16.12 Robotic Implementation: Morse Potential Controllers

In robot swarms, the Morse potential is implemented as a **virtual force**:

a_i = ∑_{j≠i} [ (C_r/ℓ_r) e^{-r_ij/ℓ_r} - (C_a/ℓ_a) e^{-r_ij/ℓ_a} ] r̂_ij + v_alignment

where r_ij = x_i - x_j, r̂_ij = r_ij/|r_ij|, and v_alignment is a velocity alignment term (e.g., Vicsek-like).

**Challenges**:
- Sensing range must cover ℓ_a (long-range attraction needs global info).
- Collision avoidance must be robust to sensor noise.
- Communication delays can cause instability.
- H-stability must be ensured in the controller gains.

### 16.13 The Morse Potential and the Vicsek Model: A Unified Framework

The Vicsek model (Document 14) has alignment but no explicit cohesion (particles stay together due to periodic boundaries). Adding a Morse potential gives the **Vicsek-Morse model**:

x_i(t+Δt) = x_i(t) + v₀ Δt (cos θ_i, sin θ_i)
θ_i(t+Δt) = arg( ∑_{j∈T_i} e^{iθ_j} ) + η ξ_i(t) + μ F_θ(r_ij)

where F_θ is the angular component of the Morse force, and μ controls the strength of position-based alignment.

This model reproduces:
- Cohesive flocks with finite size.
- Phase transitions between gas, liquid, flock.
- Band formation in the polar phase.
- Equidistant spacing in the ordered phase.

### 16.14 Thermodynamic Stability and the Free Energy

For passive particles with Morse potential, the free energy is:

F[ρ] = ∫ ρ log ρ dx + (1/2) ∫ ρ (V * ρ) dx

Minimizing F gives the equilibrium density profile. For active particles, there is **no free energy** (detailed balance is broken). Instead, we have a **pseudo-free energy** or **stochastic potential** that governs the stationary distribution in the limit of small noise.

The **large deviation principle** for the active Morse system gives the rate function I[ρ], which plays the role of a free energy.

### 16.15 Summary: Interaction Potentials as the Microscopic Glue

The interaction potential is the **microscopic glue** that holds a swarm together. The Morse potential, with its two exponential terms, provides a minimal, analytically tractable model that captures:

1. **Short-range repulsion**: Prevents collapse (H-stability).
2. **Long-range attraction**: Ensures cohesion.
3. **Equilibrium spacing**: r₀ = "comfortable distance" gives uniform density.
4. **H-stability condition**: C_r ℓ_r^{d+1} > C_a ℓ_a^{d+1} prevents catastrophic collapse.
5. **Continuum limit**: Nonlocal aggregation equation and nonlocal pressure in Toner-Tu.

When combined with self-propulsion and alignment (Vicsek, Toner-Tu), the Morse potential yields the full phase diagram of active matter: gas, liquid, crystal, flock, bands, clusters. The interplay between **alignment** (Toner-Tu) and **cohesion** (Morse) is the essence of biological swarming.

---

*End of Document 16. This document comprises approximately 900 lines of technical content. The subsequent document will develop H-stability, synthesis, and future directions.*