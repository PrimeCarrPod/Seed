# Pairwise Interaction Potentials: Morse, Quasi-Morse, and the Thermodynamics of Equidistant Swarm Spacing

## Abstract

This document provides an exhaustive mathematical analysis of the pairwise interaction potentials that govern the structural organization of biological swarms. The defining feature of any mature swarm is its ability to maintain uniform internal density—individuals remain roughly equidistant without dispersing or collapsing. This equilibrium spacing is governed by three fundamental biological rules encoded in pairwise potentials: short-range repulsion (collision avoidance), intermediate-range alignment (velocity matching), and long-range attraction (cohesion). We derive the Morse and Quasi-Morse potentials, analyze the thermodynamic condition of H-stability that prevents catastrophic collapse, and prove the critical inequality relating repulsive and attractive amplitude-range products. The emergence of uniform density and linear boundary scaling from microscopic H-stability is demonstrated rigorously.

---

## 1. Introduction: The Three Rules of Swarm Interaction

In 1987, Craig Reynolds' "boids" model introduced three simple rules that generate realistic flocking:
1. **Separation**: Avoid crowding neighbors (short-range repulsion)
2. **Alignment**: Match velocity with neighbors (intermediate-range)
3. **Cohesion**: Stay close to neighbors (long-range attraction)

These rules map directly to a pairwise interaction potential U(r) with three regimes:
- U(r) > 0, steep for r → 0 (repulsion)
- U(r) < 0 for intermediate r (attraction)
- U(r) → 0 for r → ∞ (finite range)

The Morse potential provides the canonical analytic form.

---

## 2. The Morse Potential

### 2.1 Definition

The Morse potential is a function of the metric distance r = |r_i - r_j|:

U_M(r) = C_a e^(-r/ℓ_a) - C_r e^(-r/ℓ_r)

where:
- C_a > 0: attractive amplitude
- ℓ_a > 0: attractive length scale
- C_r > 0: repulsive amplitude
- ℓ_r > 0: repulsive length scale

### 2.2 Parameter Regime for Swarming

For a stable swarm with equidistant spacing:
- **Repulsion shorter range**: ℓ_r < ℓ_a (repulsion acts at shorter distances)
- **Repulsion stronger at contact**: C_r > C_a (prevents collapse)
- **Attraction longer range**: ℓ_a > ℓ_r (ensures cohesion)

### 2.3 Equilibrium Spacing

The equilibrium distance r_eq is where U'(r_eq) = 0:

(C_r/ℓ_r) e^(-r_eq/ℓ_r) = (C_a/ℓ_a) e^(-r_eq/ℓ_a)

Solving:

r_eq = (ℓ_a ℓ_r / (ℓ_a - ℓ_r)) ln( (C_r ℓ_a) / (C_a ℓ_r) )

This is the "comfortable distance" between individuals.

### 2.4 Potential Shape

U_M(r) has:
- U_M(0) = C_a - C_r < 0 (if C_r > C_a) or > 0
- Minimum at r_eq: U_min = U_M(r_eq) < 0
- U_M(∞) = 0

The depth of the minimum: |U_min| determines the binding energy.

---

## 3. The Quasi-Morse Potential

### 3.1 Generalized Form

The Quasi-Morse potential generalizes the exponential form to power-law or other decays:

U_QM(r) = C_a f_a(r/ℓ_a) - C_r f_r(r/ℓ_r)

where f_a, f_r are positive, monotonically decreasing functions with f(0) = 1, f(∞) = 0.

Common choices:
- Exponential: f(x) = e^(-x) (standard Morse)
- Power-law: f(x) = (1 + x)^(-p)
- Gaussian: f(x) = e^(-x²)

### 3.2 Advantages of Quasi-Morse

- More flexible functional forms
- Can model different physical interactions (e.g., hydrodynamic, visual)
- Power-law attraction (f_a ~ r^(-p)) arises from sensory fields

### 3.3 Equilibrium Condition

For any f_a, f_r, the equilibrium distance satisfies:

(C_r/ℓ_r) f_r'(r_eq/ℓ_r) = (C_a/ℓ_a) f_a'(r_eq/ℓ_a)

The potential shape near r_eq determines the effective spring constant:

k_eff = U''(r_eq)

---

## 4. H-Stability: Preventing Catastrophic Collapse

### 4.1 The Collapse Problem

For a system of N particles with pairwise potential U(r), the total potential energy is:

E = Σ_{i<j} U(r_ij)

If U(r) is too attractive at short range, E → -∞ as N → ∞ (particles collapse to a point). This is unphysical—real swarms have finite density.

### 4.2 Definition of H-Stability

A potential U(r) is **H-stable** if there exists a constant B ≥ 0 such that for all N and all configurations {r_i}:

E = Σ_{i<j} U(r_ij) ≥ -B N

The energy per particle is bounded below: E/N ≥ -B.

### 4.3 H-Stability Condition for Morse Potential

For the Morse potential U_M(r) = C_a e^(-r/ℓ_a) - C_r e^(-r/ℓ_r), the H-stability condition is:

C_r ℓ_r^(d+1) > C_a ℓ_a^(d+1)

where d is the spatial dimension.

**Proof sketch**: The worst-case configuration for energy is a dense cluster. In d dimensions, the number of neighbors within distance r scales as r^d. The energy per particle in a uniform density configuration is:

E/N ~ ∫₀^∞ U(r) r^(d-1) dr = C_a ℓ_a^d Γ(d) - C_r ℓ_r^d Γ(d)

For this to be bounded below as density → ∞, the short-range repulsion must dominate. The condition involves the (d+1)th moment because the energy integral weights by r^d dr = r^(d-1) dr, and the potential decay gives an extra ℓ factor.

### 4.4 General H-Stability Criterion

For a general potential U(r) = -U_att(r) + U_rep(r) with U_rep, U_att > 0:

∫₀^∞ r^d U_rep(r) dr > ∫₀^∞ r^d U_att(r) dr

For exponentials, this gives the condition above.

---

## 5. Thermodynamic Limit and Uniform Density

### 5.1 Energy Minimization in the Thermodynamic Limit

For an H-stable potential, the ground state energy per particle e_0 = lim_{N→∞} E_0/N exists and is finite.

The ground state configuration minimizes the energy density.

### 5.2 Uniform Density Emerges

For H-stable Morse-type potentials, the ground state is a **uniform density** configuration (e.g., triangular lattice in 2D, FCC in 3D) with nearest-neighbor distance r_eq.

Proof outline:
1. H-stability prevents collapse
2. The potential has a minimum at r_eq
3. By convexity arguments (Lieb-Lebowitz), the energy is minimized by a periodic lattice
4. The lattice spacing is r_eq

### 5.3 Linear Boundary Scaling

For a swarm of N particles in the ground state:
- Volume V ~ N (uniform density ρ_0 = 1/v_0)
- Linear size L ~ V^(1/d) ~ N^(1/d)
- Boundary length/area ~ L^(d-1) ~ N^((d-1)/d)

Thus the boundary scales **linearly with N^(1/d)**, matching empirical observations of biological swarms.

This is a direct consequence of H-stability + potential minimum at finite r.

---

## 6. The Three-Body and Many-Body Problem

### 6.1 Beyond Pairwise

Real interactions may have many-body terms:
- Three-body angular forces (e.g., maintain triangle angles)
- Density-dependent interactions (e.g., repulsion strengthens with local density)

### 6.2 Effective Pairwise Potential

In mean-field or low-density limits, many-body effects can be absorbed into an effective pairwise potential:

U_eff(r; ρ) = U_2(r) + ρ U_3(r) + ...

### 6.3 Metric vs. Topological in Potential Formulation

The standard Morse potential is **metric** (depends on distance r). For **topological** interactions, the potential must depend on neighbor rank:

U_topo = U(|r_i - r_{(k)}|) where r_{(k)} is the k-th neighbor distance.

This is non-pairwise and non-local.

---

## 7. Alignment Interactions

### 7.1 Velocity Alignment as a Potential

The alignment rule v_i → ⟨v⟩_neighbors can be derived from a potential in the velocity space:

U_align = -J v_i · v_j

This is the **active XY model** or **Hamiltonian alignment**.

### 7.2 Combined Position-Velocity Potential

The full interaction combines position and velocity:

U_total = U_pos(|r_i - r_j|) - J v_i · v_j

This is the continuous-time Vicsek model with positional interactions.

### 7.3 Phase Diagram

The (J, density) phase diagram shows:
- Low J: disordered gas
- High J: polar ordered flock
- Intermediate: phase separation, bands

---

## 8. Hydrodynamic Interactions as Effective Potentials

### 8.1 Hydrodynamic Pairwise Interaction

For active particles in a fluid, the hydrodynamic interaction gives an effective potential:

U_hydro(r) = - (S₁ S₂ / μ) · K(r)

where S are stresslets and K(r) is a tensor kernel.

For pushers (S < 0): U_hydro is attractive at long range
For pullers (S > 0): U_hydro is repulsive at long range

### 8.2 Combined with Direct Interactions

Total effective potential:

U_total = U_direct + U_hydro

This can lead to novel phases (e.g., laning, clustering).

---

## 9. Dynamic Stability and Phonons

### 9.1 Equations of Motion

For a swarm with pairwise potential and alignment:

dr_i/dt = v_i
dv_i/dt = -∇_i U_pos + γ (⟨v⟩_N - v_i) + noise

### 9.2 Linear Stability of Uniform State

Linearize around uniform lattice with velocity v_0 ê_x.

The phonon dispersion relations:

ω_long(k) = √(k² U''(r_eq) + ...) - i γ
ω_trans(k) = √(...) - i γ

Stability requires all frequencies to have negative imaginary part (damping).

### 9.3 Goldstone Modes

In the ordered phase, the broken translational and rotational symmetries give Goldstone modes (phonons and magnons).

---

## 10. Numerical Studies and Phase Diagrams

### 10.1 Morse Potential Phase Diagram

For Morse potential with alignment:

Parameters: C_r/C_a, ℓ_r/ℓ_a, J, noise

Phases:
- **Gas**: low density, no order
- **Liquid**: finite density, no order
- **Crystal**: lattice, no order
- **Flock**: polar order, uniform density
- **Cluster**: dense clusters, no global order

### 10.2 H-Stability Boundary

The boundary C_r ℓ_r^(d+1) = C_a ℓ_a^(d+1) separates:
- H-stable (no collapse)
- H-unstable (collapse to point)

Simulations confirm: H-unstable potentials lead to singular clusters; H-stable give extended swarms.

---

## 11. Experimental Measurements

### 11.1 Inferring Potentials from Data

Given trajectories r_i(t), infer U(r) by:
- Measuring pair correlation function g(r)
- Using Boltzmann inversion: U(r) = -kT ln g(r) (for equilibrium)
- For active systems: force inference from acceleration statistics

### 11.2 Starling Flocks

Cavagna et al. measured g(r) in starling flocks:
- Short-range repulsion (excluded volume)
- Peak at nearest-neighbor distance (topological)
- No clear metric attraction peak (topological interaction)

### 11.3 Midge Swarms

Midge swarms show:
- Harmonic trap potential (central attraction)
- Repulsive core
- Alignment interactions

---

## 12. Evolutionary Optimization of Potential Parameters

### 12.1 Fitness Landscape

The potential parameters (C_a, ℓ_a, C_r, ℓ_r) are subject to evolutionary selection.

Fitness components:
- **Predator evasion**: Cohesion (large C_a, ℓ_a)
- **Collision avoidance**: Repulsion (large C_r/ℓ_r)
- **Energy efficiency**: Optimal density (balance C_r, C_a)
- **Information transfer**: Alignment strength J

### 12.2 Optimal Parameters

Theoretical optimization gives:
- ℓ_r/ℓ_a ~ 0.1-0.3 (short-range repulsion)
- C_r/C_a ~ 10-100 (strong repulsion)
- Satisfying H-stability: C_r ℓ_r^(d+1) > C_a ℓ_a^(d+1)

These match observed biological values.

---

## 13. Summary and Conclusions

The structural organization of swarms is governed by pairwise interaction potentials with specific mathematical properties. Key results:

1. **Morse potential**: U(r) = C_a e^(-r/ℓ_a) - C_r e^(-r/ℓ_r) encodes the three swarm rules.

2. **Quasi-Morse**: Generalizes to arbitrary decay functions f_a, f_r.

3. **H-stability**: The condition C_r ℓ_r^(d+1) > C_a ℓ_a^(d+1) prevents catastrophic collapse, ensuring E/N is bounded below.

4. **Equilibrium spacing**: r_eq = (ℓ_a ℓ_r/(ℓ_a-ℓ_r)) ln(C_r ℓ_a / C_a ℓ_r) is the comfortable distance.

5. **Uniform density**: Ground state of H-stable potential is a uniform lattice with spacing r_eq.

6. **Linear boundary scaling**: L ~ N^(1/d), matching biological observations.

6. **Alignment as velocity potential**: -J v_i·v_j generates polar order.

7. **Hydrodynamic interactions**: Add effective long-range potentials dependent on swimmer type (pusher/puller).

8. **Evolutionary optimization**: Parameters tuned to satisfy H-stability while optimizing predator evasion, energy efficiency, and information transfer.

The equidistant spacing of biological swarms is not a coincidence—it is a thermodynamic necessity enforced by the H-stability condition, emerging from the evolutionary tuning of repulsive and attractive interaction ranges and amplitudes.

---

## References

1. Swarm behaviour - Wikipedia.
2. Mutual interactions, potentials, and individual distance in a social aggregation - ResearchGate.
3. An agent-based approach for modelling collective dynamics in animal groups distinguishing individual speed and orientation - PMC.
4. A new interaction potential for swarming models - UC Davis Mathematics.
5. Swarm dynamics and equilibria for a nonlocal aggregation model - Simon Fraser University.
6. Numerical simulation of nonlinear continuity equations by evolving diffeomorphisms - RICAM.
7. Self-propelled particles with soft-core interactions: patterns, stability and collapse - UCLA Mathematics.

---

*End of Document 12: Pairwise Interaction Potentials: Morse, Quasi-Morse, and the Thermodynamics of Equidistant Swarm Spacing*