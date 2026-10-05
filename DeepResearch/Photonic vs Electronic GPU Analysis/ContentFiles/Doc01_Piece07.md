# Document 1: Quantum Electrodynamics of Electron Transport in Silicon
## Piece 7: Full-Band Monte Carlo Simulation Methodology

---

### 1.7 Full-Band Monte Carlo Simulation Methodology

The Full-Band Monte Carlo (FBMC) method is the gold standard for simulating high-field electron transport in silicon, capturing the complete band structure, all scattering mechanisms, and non-equilibrium distribution functions without the approximations of hydrodynamic or drift-diffusion models.

#### 1.7.1 Band Structure Representation

FBMC requires the full E(k) dispersion relation throughout the Brillouin zone. For silicon, this is obtained from:

1. **Empirical pseudopotential method**: Fits form factors to experimental optical data
2. **k·p method**: 30-band or 10-band k·p Hamiltonian with strain
3. **Tight-binding**: sp³d⁵s* basis with spin-orbit coupling
4. **Ab initio DFT**: GW-corrected band structures

The band structure is stored as a 3D grid in k-space (typically 30×30×30 points in irreducible wedge) with interpolation (trilinear, spline, or Wannier interpolation). For silicon, the irreducible wedge is 1/48 of the full BZ due to symmetry.

Key band parameters for silicon at 300K:
- Indirect gap: E_g = 1.12 eV (Γ to Δ)
- Six Δ-valleys at k = 0.85×2π/a along ⟨100⟩
- Longitudinal mass: m_l = 0.916 m₀
- Transverse mass: m_t = 0.191 m₀
- Density-of-states mass: m*_{DOS} = 1.08 m₀
- Non-parabolicity: α = 0.5 eV⁻¹

#### 1.7.2 Free-Flight Trajectory Integration

Between scattering events, electrons evolve under the applied force F = qE:

dk/dt = F/ħ
dr/dt = v(k) = (1/ħ) ∇_k E(k)

The trajectory is integrated numerically. For parabolic bands, analytic solution exists:

k(t) = k(0) + (qE/ħ)t
r(t) = r(0) + (ħ/m*)[k(0)t + (qE/2ħ)t²]

For full bands, numerical integration (Runge-Kutta 4th order) is required:

k_{n+1} = k_n + (Δt) F/ħ
E_{n+1} = E(k_{n+1})
v_{n+1} = ∇_k E(k_{n+1})/ħ
r_{n+1} = r_n + v_n Δt + (1/2)(F/ħ)·∇_k v Δt²

Time step Δt must resolve the fastest dynamics (optical phonon period ~100 fs). Typical Δt = 0.1-1 fs.

#### 1.7.3 Scattering Mechanism Selection

The total scattering rate for a particle in state k is:

Γ(k) = Σ_i Γ_i(k)

where Γ_i are rates for individual mechanisms:
- Acoustic phonon (intravalley, intervalley g-process, f-process)
- Optical phonon (intravalley, intervalley)
- Ionized impurity
- Neutral impurity
- Electron-electron
- Surface roughness
- Alloy scattering (for SiGe)

At each free-flight step, a scattering event occurs with probability:

P_{scatt} = 1 - exp(-Γ(k) Δt) ≈ Γ(k) Δt (for small Δt)

If scattering occurs, mechanism i is chosen with probability Γ_i(k)/Γ(k).

#### 1.7.4 Scattering Kinematics: Energy and Momentum Conservation

For each mechanism, the final state k' is determined by conservation laws.

**Acoustic phonon (quasi-elastic):**
|k'| ≈ |k| (small energy change ħω ≪ k_BT)
q = k' - k
Scattering angle distribution: isotropic in 3D for intravalley

**Optical phonon (inelastic):**
E(k') = E(k) ± ħω_{op}
The final wavevector magnitude is fixed. Direction is random (isotropic) for intervalley, or follows matrix element for intravalley.

**Intervalley scattering (g-process, f-process):**
- g-process: Δ₂ ↔ Δ₂ (same axis), large q ≈ 2k_z
- f-process: Δ₂ ↔ Δ₄ (different axis), q connects different valleys
Requires umklapp with reciprocal lattice vector G for f-process.

**Ionized impurity:**
Elastic: E(k') = E(k)
Scattering angle from screened Rutherford cross-section:
dσ/dΩ ∝ 1/(q² + q_s²)²
Random angle generated via rejection method or inverse transform.

#### 1.7.5 Self-Scattering and Constant Rate Technique

To handle energy-dependent scattering rates efficiently, the **self-scattering** (or rejection) technique is used:

1. Choose a constant rate Γ₀ ≥ max_k Γ(k)
2. At each step, generate candidate scattering with probability Γ₀ Δt
3. If candidate scatters, accept real scattering with probability Γ(k)/Γ₀
4. Otherwise, self-scatter (no change in k, only time advances)

This avoids recomputing Γ(k) at every step and handles the null-collision method elegantly.

#### 1.7.6 Ensemble vs. Single-Particle Monte Carlo

**Ensemble Monte Carlo:**
- Simulates N_p particles simultaneously (N_p = 10⁴-10⁶)
- Particles interact only through self-consistent fields (Poisson solver)
- Steady state reached when ensemble averages stabilize
- Natural for transient simulation

**Single-Particle Monte Carlo:**
- Tracks one particle for very long time
- Time averages = ensemble averages (ergodicity)
- Lower memory, but no self-consistent fields
- Used for mobility calculations in uniform fields

#### 1.7.7 Self-Consistent Field Solution

For device simulation, the electric field is updated self-consistently:

1. Deposit particle charge on grid: ρ(r) = q Σ_i w_i S(r - r_i)
   where w_i is statistical weight, S is shape function (cloud-in-cell)
2. Solve Poisson equation: ∇·(ε∇φ) = -ρ
3. Compute E = -∇φ
4. Interpolate E to particle positions

Coupling schemes:
- **Gummel iteration**: Alternate MC and Poisson (slow convergence)
- **Newton-Raphson**: Linearize Poisson, faster but complex
- **Predictor-corrector**: Extrapolate field from previous steps

#### 1.7.8 Statistical Enhancement Techniques

To reduce variance in MC estimates:

1. **Control variates**: Subtract known analytical result (e.g., equilibrium distribution)
2. **Importance sampling**: Over-sample rare but important events (hot electrons)
3. **Stratified sampling**: Divide k-space into strata, sample proportionally
4. **Particle splitting/roulette**: Increase particles in high-field regions

Variance of estimator ⟨A⟩ = (1/N) Σ A_i:
Var(⟨A⟩) = (1/N) [⟨A²⟩ - ⟨A⟩²] / (1 + 2 Σ_{τ=1}^∞ ρ(τ))

where ρ(τ) is autocorrelation. MC samples are correlated; effective sample size N_eff = N/(1+2Σρ).

#### 1.7.9 Quantum Corrections in Monte Carlo

Several approaches add quantum effects to semiclassical MC:

1. **Effective potential / Density Gradient**:
   Add Bohm potential Q(r) = -ħ²/2m* ∇²√n/√n to classical potential
   Particles feel Q(r) as additional force

2. **Wigner Monte Carlo**:
   Sample Wigner function f_W(r,k) instead of f(r,k)
   Includes negative probabilities (quasi-probabilities)
   Stochastic interpretation via particle-antiparticle pairs

3. **Bohmian trajectories**:
   Solve quantum Hamilton-Jacobi equation
   Trajectories guided by quantum potential
   Computationally expensive

4. **Quantum scattering rates**:
   Modify scattering rates with form factors:
   |M|² → |M|² |⟨ψ_f|e^{iq·r}|ψ_i⟩|²
   Accounts for wavefunction overlap in confined structures

#### 1.7.10 Performance and Validation

Typical FBMC performance:
- 10⁵ particles, 10⁶ time steps → ~1 hour on single CPU
- Parallelization: domain decomposition (spatial) or particle decomposition
- GPU acceleration: 10-100× speedup (each particle independent)

Validation benchmarks:
- Low-field mobility vs. doping/temperature (Jacoboni-Canali model)
- Velocity-field curves (Canali et al. model)
- Impact ionization coefficients
- Hot electron energy distributions
- Noise characteristics (Fano factor)

Modern FBMC codes: DAMOCLES, MOCA, GARAND, ViennaMC, MCDevice.

---

*End of Piece 7. Next: Piece 8 - Electromigration Physics: Black's Equation Derivation from Vacancy Diffusion*