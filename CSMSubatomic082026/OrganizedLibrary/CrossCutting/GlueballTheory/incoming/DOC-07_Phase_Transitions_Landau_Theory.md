# DOC-07: Phase Transitions and Landau Theory — The Mathematical Theory of Continuous Symmetry Breaking

## 7.1 Classification of Phase Transitions

Phase transitions are qualitative changes in the macroscopic state of matter as thermodynamic parameters (temperature T, pressure P, magnetic field H, chemical potential μ) vary. The Ehrenfest classification (modernized) distinguishes:

### 7.1.1 First-Order Transitions
- Discontinuity in first derivatives of the Gibbs free energy G(T, P, ...).
- Entropy S = -∂G/∂T and volume V = ∂G/∂P jump.
- **Latent heat**: L = T ΔS ≠ 0.
- Coexistence of phases with distinct densities/order parameters.
- Phase boundary in P-T plane governed by the **Clausius-Clapeyron equation**:
  dP/dT = ΔS/ΔV = L/(T ΔV)
- Examples: boiling, freezing, sublimation, solid-solid structural transitions.

### 7.1.2 Continuous (Second-Order) Transitions
- First derivatives (S, V) continuous; second derivatives (C_P = T∂S/∂T, κ_T = -1/V ∂V/∂P, χ = ∂M/∂H) diverge or show discontinuities.
- **No latent heat**: L = 0.
- Order parameter η grows continuously from zero at T_c.
- Diverging correlation length ξ → ∞ as T → T_c.
- Critical exponents: C ~ |t|^{-α}, ξ ~ |t|^{-ν}, M ~ |t|^β, χ ~ |t|^{-γ} (t = (T-T_c)/T_c).
- Examples: ferromagnetic transition, superfluid transition, superconducting transition, liquid-gas critical point.

### 7.1.3 Higher-Order / Infinite-Order
- Third-order (Ehrenfest): discontinuity in third derivatives.
- Infinite-order (Kosterlitz-Thouless): essential singularity, no local order parameter, topological transition.

## 7.2 Landau Theory: Phenomenological Theory of Continuous Transitions

Lev Landau (1937) formulated a general theory of continuous phase transitions based on **symmetry** and **analyticity**. The central concept is the **order parameter** η—a macroscopic variable that is zero in the disordered (high-symmetry) phase and non-zero in the ordered (low-symmetry) phase.

Examples:
- Ferromagnet: magnetization M (vector, breaks rotational symmetry).
- Superfluid: condensate wavefunction ψ (complex scalar, breaks U(1) phase symmetry).
- Superconductor: Cooper pair condensate ψ (complex scalar, breaks U(1) gauge symmetry).
- Nematic liquid crystal: traceless symmetric tensor Q_ij (breaks rotational symmetry).
- Crystalline solid: density wave Fourier components ρ_G (breaks translational symmetry).

## 7.3 Landau Free Energy Expansion

Near T_c, η is small. The free energy density f(η, T) is expanded as a Taylor series in η, constrained by the symmetries of the Hamiltonian (not the symmetry of the state). For a system with inversion symmetry (η → -η), odd powers vanish:

f(η, T) = f_0(T) + a(T) η^2 + b(T) η^4 + c(T) η^6 + ...

where a(T) = a_0 (T - T_c) + O((T-T_c)^2), b(T) > 0 for stability (or b < 0 with c > 0 for first-order).

### 7.3.1 Minimization and Phase Diagram
∂f/∂η = 2aη + 4bη^3 + 6cη^5 = 0

Solutions:
- η = 0 (disordered phase): stable for a > 0 (T > T_c).
- η^2 = -a/2b (ordered phase): exists and is stable for a < 0 (T < T_c), provided b > 0.

At T = T_c, the coefficient a(T) changes sign. The minimum at η = 0 changes from stable to unstable, and two new degenerate minima appear at ±η_0. The system **spontaneously chooses** one, breaking the symmetry.

### 7.3.2 Critical Behavior from Landau Theory
- Order parameter: η = √(-a/2b) ~ √(T_c - T) → β = 1/2.
- Susceptibility: χ = (∂²f/∂η²)^{-1} = 1/(2a) ~ 1/|T - T_c| → γ = 1.
- Specific heat: C = -T ∂²f/∂T². Jump at T_c: ΔC = a_0^2 T_c / (2b) → α = 0 (discontinuity).
- Correlation length: from gradient term f_grad = 1/2 κ (∇η)^2. ξ = √(κ/2|a|) ~ |T - T_c|^{-1/2} → ν = 1/2.

These **mean-field exponents** (β=1/2, γ=1, α=0, ν=1/2, δ=3, η=0) are exact for d > 4 (upper critical dimension) but are modified by fluctuations for d < 4.

## 7.4 Gradient Terms and Spatial Variations

For inhomogeneous systems, the Landau-Ginzburg free energy functional includes gradient terms:
F[η(r)] = ∫ d^d r [f(η) + 1/2 κ (∇η)^2 + ...]

The gradient term penalizes spatial variations, setting a length scale ξ = √(κ/2|a|). The **Ginzburg criterion** determines when fluctuations invalidate mean-field theory:
Gi ~ (k_B T_c)^2 / (κ^d ξ_0^{4-d}) ~ 1

For d > 4, Gi ≪ 1 (mean-field valid). For d = 3, Gi ~ 1 (fluctuations important). For d = 2, no long-range order at finite T for continuous symmetries (Mermin-Wagner theorem).

## 7.5 Symmetry and the Order Parameter Space

The symmetry group of the Hamiltonian is G. The ordered phase has symmetry H ⊂ G (the stabilizer subgroup of η). The **order parameter space** (space of possible values of η) is the coset space G/H. Its topology determines the possible topological defects:

| Transition | G | H | G/H | Defects |
|------------|---|---|-----|---------|
| Ferromagnet | O(3) | O(2) | S² | Point defects (hedgehogs), domain walls |
| Superfluid | U(1) | {1} | S¹ | Vortices (quantized circulation) |
| Nematic | O(3)/Z₂ | D_∞ | RP² | Disclinations (½, 1 strength) |
| Superconductor | U(1) | {1} | S¹ | Vortices (flux quantized h/2e) |
| Crystal | E(3) | Space group | E(3)/G_crystal | Dislocations, grain boundaries |

## 7.6 Topological Defects and the Kibble-Zurek Mechanism

When a system is cooled through T_c, the order parameter forms independently in causally disconnected regions. The **Kibble-Zurek mechanism** predicts the density of topological defects:
n_def ~ ξ̂^{-d}, where ξ̂ ~ τ_Q^{ν/(1+zν)}

Here τ_Q is the quench time, z is the dynamic critical exponent. This applies to cosmological phase transitions (cosmic strings, domain walls), superfluid helium, superconductors, and liquid crystals.

## 7.7 First-Order Transitions in Landau Theory

If b(T) < 0, the η^4 term is destabilizing, and the η^6 term (c > 0) is needed for stability. The free energy:
f = aη^2 - |b|η^4 + cη^6

For a > 0, η = 0 is the global minimum. As a decreases, a second minimum appears at η ≠ 0. At a = a* = 3b²/16c > 0, the two minima are degenerate. The system jumps discontinuously from η = 0 to η = η*, with latent heat. This is a **weakly first-order transition** (driven by the sign of b). The transition temperature T* > T_c (where a=0), showing supercooling/superheating.

## 7.8 Tricritical Points

When b = 0, the transition changes from second-order to first-order. The point where b = 0 and a = 0 is a **tricritical point**. The critical exponents change:
β_t = 1/4, γ_t = 1, ν_t = 1/2 (mean-field tricritical exponents).
The tricritical point is a multicritical point where three phases meet (disordered, ordered, and another ordered phase).

## 7.9 Renormalization Group and Universality Classes

Landau theory is a mean-field theory. The RG provides the systematic correction:
1. Identify relevant operators at the Gaussian fixed point.
2. Calculate β-functions for couplings (a, b, c, κ).
3. Find non-trivial fixed points (Wilson-Fisher fixed point for d < 4).
4. Compute critical exponents as series in ε = 4 - d.

Universality classes for d=3:
- **Ising** (Z₂ symmetry): liquid-gas, uniaxial magnet, binary alloy.
- **XY** (U(1) symmetry): superfluid ⁴He, superconductor, planar magnet.
- **Heisenberg** (O(3) symmetry): isotropic ferromagnet, antiferromagnet.
- **Chiral** (SU(2)_L × SU(2)_R): QCD chiral transition.

Exponents (3D, from RG/Monte Carlo/conformal bootstrap):
| Class | α | β | γ | ν | η |
|-------|---|---|---|---|---|
| Ising | 0.11 | 0.326 | 1.237 | 0.630 | 0.036 |
| XY | -0.015 | 0.348 | 1.318 | 0.672 | 0.038 |
| Heisenberg | -0.12 | 0.366 | 1.396 | 0.711 | 0.038 |

## 7.10 Scaling and Scaling Relations

Near T_c, the singular part of the free energy obeys **homogeneous scaling**:
f_s(t, h) = |t|^{2-α} f_±(h/|t|^Δ)

where h is the field conjugate to η, and Δ = βδ = β + γ is the gap exponent. This implies the **scaling relations**:
- Rushbrooke: α + 2β + γ = 2
- Widom: γ = β(δ - 1)
- Fisher: γ = ν(2 - η)
- Josephson: dν = 2 - α (hyperscaling, valid for d < 4)

These relations are exact consequences of the scaling hypothesis and are satisfied by experimental and RG values.

## 7.11 Finite-Size Scaling

For a system of finite size L, the correlation length is bounded by L. Finite-size scaling theory gives:
χ(L, t) = L^{γ/ν} χ̃(t L^{1/ν})
C(L, t) = L^{α/ν} C̃(t L^{1/ν})

This allows extrapolation of numerical data to the thermodynamic limit and determines critical parameters from simulation.

## 7.12 Phase Transitions in the QCD Phase Diagram

The QCD phase diagram in the T-μ_B plane illustrates the full range of transition types:
- **Crossover** at μ_B = 0 (T_c ≈ 155 MeV): no true singularity, rapid change in ⟨ψ̄ψ⟩ and Polyakov loop. Analytic continuation of Z.
- **First-order line** at large μ_B: chiral symmetry breaking and deconfinement transitions coincide or separate.
- **Critical point** (T_crit, μ_crit): endpoint of the first-order line. Ising universality class (Z₂ symmetry of chiral condensate). Search at RHIC, FAIR, NICA.
- **Color superconducting transitions** at very high μ_B: CFL, 2SC phases. Order parameters are diquark condensates. Symmetry breaking patterns: SU(3)_c × SU(3)_L × SU(3)_R × U(1)_B → SU(3)_{c+L+R} (CFL).

## 7.13 Kosterlitz-Thouless Transition: Topological Order in 2D

In 2D XY model (U(1) symmetry), there is no long-range order at finite T (Mermin-Wagner). However, there is a **topological phase transition** at T_KT driven by vortex-antivortex unbinding:
- T < T_KT: bound vortex pairs, algebraic correlations ⟨ψ(r)ψ*(0)⟩ ~ r^{-η(T)}, η(T) = T/(2πJ).
- T > T_KT: free vortices, exponential decay.
- Universal jump in superfluid stiffness: J(T_KT^-) = 2T_KT/π.

This infinite-order transition has no local order parameter but a topological one (vortex density). It appears in 2D superfluids, superconducting films, and the melting of 2D crystals (dislocation unbinding).

## 7.14 Summary

Landau theory provides the universal language of phase transitions: symmetry breaking, order parameters, free energy expansions, and the classification of transitions by the analytic structure of the free energy. While mean-field theory gives qualitative correctness, the renormalization group reveals the quantitative critical behavior, organizing diverse systems into universality classes determined by symmetry and dimensionality. The Ginzburg-Landau functional is the bridge to the kinetic and hydrodynamic descriptions that follow.

---

*This document completes the equilibrium statistical mechanics foundation. The next document (DOC-08) explores the elasticity of the solid state—the mechanical response of matter that has spontaneously broken translational symmetry, governed by the stiffness tensor and crystal symmetry.*