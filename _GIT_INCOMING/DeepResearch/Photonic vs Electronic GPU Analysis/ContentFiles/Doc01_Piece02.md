# Document 1: Quantum Electrodynamics of Electron Transport in Silicon
## Piece 2: Boltzmann Transport Equation Under High-Field Conditions

---

### 1.2 Boltzmann Transport Equation Under High-Field Conditions

The Boltzmann Transport Equation (BTE) provides the semiclassical framework for describing non-equilibrium electron distributions under applied fields. For a spatially homogeneous system under a uniform electric field F, the BTE reads:

∂f_{nk}/∂t + (q/ħ) F · ∇_k f_{nk} = (∂f_{nk}/∂t)_{coll}

where f_{nk}(r,k,t) is the single-particle distribution function giving the occupation probability of state |nk⟩, q = −e is the electron charge, and the collision term accounts for scattering processes.

#### 1.2.1 Collision Integral with Full Scattering Physics

The collision integral incorporates all scattering mechanisms derived from the Hamiltonian in Piece 1:

(∂f_{nk}/∂t)_{coll} = Σ_{n'k'} [W_{n'k'→nk} f_{n'k'} (1 - f_{nk}) - W_{nk→n'k'} f_{nk} (1 - f_{n'k'})]

The factors (1 - f) enforce Pauli exclusion principle, preventing scattering into occupied states. This is crucial for degenerate electron gases where the Fermi level lies within the conduction band.

For elastic scattering (acoustic phonons at high T, impurity scattering), energy is conserved: E_{nk} = E_{n'k'}. For inelastic scattering (optical phonons), energy changes by ±ħω.

#### 1.2.2 Relaxation Time Approximation and Its Limitations

The relaxation time approximation (RTA) linearizes the collision operator around equilibrium:

(∂f/∂t)_{coll} ≈ - (f_{nk} - f⁰_{nk}) / τ_{nk}

where f⁰_{nk} = 1/[exp((E_{nk} - E_F)/k_BT) + 1] is the Fermi-Dirac distribution. While analytically tractable, RTA fails under high fields because:
- It assumes a single relaxation time, ignoring energy-dependent scattering
- It cannot capture velocity overshoot and non-local effects
- It violates conservation laws (particle number, momentum, energy) unless modified

#### 1.2.3 Moment Expansion Method

A more rigorous approach expands the distribution function in spherical harmonics in k-space:

f_{nk}(k) = f⁰_{nk}(E) + Σ_{l=1}^∞ Σ_{m=-l}^l f_{lm}(E) Y_{lm}(θ_k, φ_k)

For isotropic bands and low fields, only the l=1 term (proportional to cosθ) survives, giving the drift-diffusion approximation. Under high fields in silicon's anisotropic valleys, higher moments become significant.

The moment equations are obtained by multiplying the BTE by powers of velocity and integrating over k-space:

Zeroth moment (particle conservation): ∂n/∂t + ∇·J = 0
First moment (momentum balance): m* ∂v_d/∂t = qF - m* v_d/τ_m - ∇P
Second moment (energy balance): ∂(n⟨E⟩)/∂t + ∇·Q = qJ·F - n⟨E - E⁰⟩/τ_E

where n is carrier density, J = nqv_d is current density, v_d is drift velocity, τ_m is momentum relaxation time, P is pressure tensor, Q is energy flux, and τ_E is energy relaxation time.

#### 1.2.4 Hydrodynamic Model for Sub-Micron Devices

The hydrodynamic model closes the moment hierarchy by assuming a displaced Maxwellian (or Fermi-Dirac) distribution:

f_{nk} ≈ f⁰(E - m* v_d·v - δE)

where δE accounts for carrier heating. This yields six coupled equations for n, v_d (3 components), T_e (electron temperature), and pressure.

For silicon's anisotropic conduction band, the effective mass tensor in each Δ-valley is:

m*_{ij} = m_l ẑ_i ẑ_j + m_t (δ_{ij} - ẑ_i ẑ_j)

with longitudinal mass m_l = 0.916 m₀ and transverse mass m_t = 0.191 m₀ (m₀ = free electron mass). The conductivity effective mass for valley along ẑ is:

m*_cond = 3m_l m_t / (m_l + 2m_t) ≈ 0.26 m₀

The density of states effective mass (for 6 valleys) is:

m*_DOS = 6^{2/3} (m_l m_t²)^{1/3} ≈ 1.08 m₀

#### 1.2.5 High-Field Transport: Velocity Saturation and Overshoot

At low fields, drift velocity follows Ohm's law: v_d = μF with mobility μ = qτ_m/m*. As field increases, optical phonon emission becomes frequent, causing velocity saturation.

The saturation velocity in silicon is v_sat ≈ 1×10⁷ cm/s, reached at F ≈ 10⁴ V/cm. Beyond this, hot electrons accumulate in satellite valleys (L, X) with heavier mass, causing negative differential mobility (NDM) in some III-V materials (e.g., GaAs Gunn effect), but silicon shows monotonic saturation.

In sub-50nm channels, **velocity overshoot** occurs: electrons traverse the channel faster than the energy relaxation time τ_E ≈ 0.1-1 ps, reaching velocities 2-3× v_sat. This is a non-local effect requiring full BTE solution or Monte Carlo simulation.

#### 1.2.6 Discretization Methods for BTE Solution

Numerical solution of the BTE in device simulators employs:

1. **Spherical harmonics expansion (SHE)**: Expands f in Legendre polynomials. Efficient for near-equilibrium but requires many terms for high fields.

2. **Discrete ordinates method (DOM)**: Discretizes k-space on a spherical grid. Accurate but computationally expensive in 3D k-space.

3. **Deterministic solvers**: Direct discretization of k-space with adaptive meshing. Used in commercial tools (Sentaurus, Silvaco).

4. **Monte Carlo (MC) method**: Stochastic particle tracking with probabilistic scattering. The gold standard for high-field physics but computationally intensive.

The Monte Carlo algorithm:
- Initialize ensemble of particles with positions and wavevectors sampled from f⁰
- Free-flight: k(t+Δt) = k(t) + (qF/ħ)Δt, r(t+Δt) = r(t) + v(k)Δt
- Select scattering mechanism based on total rate Γ = Σ Γ_i
- Choose specific mechanism i with probability Γ_i/Γ
- Update k according to scattering kinematics (energy/momentum conservation)
- Repeat until steady state; ensemble average gives f_{nk}

#### 1.2.7 Quantum Corrections to Semiclassical BTE

At sub-10nm scales, quantum effects require corrections:
- **Density gradient (DG) model**: Adds Bohm potential Q = -ħ²/2m* ∇²√n/√n to energy balance
- **Quantum moment equations**: Wigner function formalism replaces f(r,k)
- **Non-equilibrium Green's functions (NEGF)**: Full quantum transport, computationally prohibitive for large devices

The Wigner function f_W(r,k) = ∫ f(r + s/2, r - s/2) e^{-ik·s} ds satisfies the Wigner-BTE:

∂f_W/∂t + v·∇_r f_W + (q/ħ) F·∇_k f_W = (∂f_W/∂t)_{coll} + Q_quantum

where Q_quantum involves the Moyal bracket capturing coherence and tunneling.

---

*End of Piece 2. Next: Piece 3 - Quantum Mechanical Scattering Matrix for Electron-Impurity Interactions*