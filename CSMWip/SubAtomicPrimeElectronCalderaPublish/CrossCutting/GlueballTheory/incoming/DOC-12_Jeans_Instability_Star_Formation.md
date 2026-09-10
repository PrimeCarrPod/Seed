# DOC-12: The Jeans Instability and Star Formation — Gravitational Collapse of Self-Gravitating Fluids

## 12.1 The Problem of Self-Gravitating Fluids

At the largest scales of the universe, the equations of fluid dynamics must be coupled to the force of gravity. The formation of stars, the clustering of galaxies, and the large-scale architecture of the cosmos depend entirely on the behavior of **self-gravitating fluids**. Unlike laboratory fluids where gravity is an external body force, in astrophysics the fluid generates its own gravitational field through its mass density.

Consider an immense, homogeneous cloud of interstellar gas in hydrostatic equilibrium. The thermal pressure of the gas pushes outward, attempting to expand the cloud, while the mutual gravitational attraction of all the constituent particles pulls inward. The dynamic stability of this delicate balance is governed by the **Jeans instability**.

## 12.2 Linear Perturbation Analysis

We consider a uniform, static, infinite medium with constant density ρ₀, pressure p₀, zero velocity, and gravitational potential φ₀ satisfying Poisson's equation:
∇²φ₀ = 4πGρ₀

We introduce small perturbations:
ρ = ρ₀ + ρ₁,  p = p₀ + p₁,  u = u₁,  φ = φ₀ + φ₁
with |ρ₁| ≪ ρ₀, etc.

The linearized fluid equations (Euler, continuity, Poisson) are:

### 12.2.1 Continuity
∂ρ₁/∂t + ρ₀∇·u₁ = 0

### 12.2.2 Euler (Momentum)
ρ₀∂u₁/∂t = -∇p₁ - ρ₀∇φ₁

### 12.2.3 Poisson
∇²φ₁ = 4πGρ₁

### 12.2.4 Equation of State
For adiabatic perturbations: p₁ = c_s² ρ₁, where c_s² = (∂p/∂ρ)_s = γp₀/ρ₀ is the adiabatic sound speed squared.

## 12.3 The Dispersion Relation

Assuming plane-wave perturbations ∝ exp(i k·x - iωt), the linearized equations yield the **Jeans dispersion relation**:

ω² = c_s² k² - 4πGρ₀

This single equation dictates the structural fate of the universe.

## 12.4 Stability Criteria and the Jeans Scale

### 12.4.1 Short Wavelengths (k ≫ k_J)
If the perturbation's wavenumber is large (wavelength λ = 2π/k is short), the c_s²k² term dominates. Then ω² > 0, ω is real, and perturbations propagate as **stable acoustic waves** (sound waves). The thermal pressure gradient provides sufficient restoring force to resist gravitational collapse.

### 12.4.2 Long Wavelengths (k < k_J)
For spatial perturbations larger than a critical scale, the wavenumber drops below the **Jeans wavenumber**:

k_J = √(4πGρ₀ / c_s²)

The corresponding **Jeans length** is:
λ_J = 2π/k_J = c_s √(π / Gρ₀)

When k < k_J, ω² < 0, so ω is purely imaginary. The wave solutions transition from stable oscillation to **exponential growth**. The growth rate is:
γ = √(4πGρ₀ - c_s²k²) ≈ √(4πGρ₀) for k ≪ k_J

The region of fluid is now **gravitationally unstable**. The free-fall time of the collapse is:
t_ff = √(3π / 32Gρ₀) ≈ 1/√(Gρ₀)

This is shorter than the sound-crossing time t_sound = λ/c_s, meaning internal pressure waves cannot travel fast enough to communicate resistance to the implosion.

## 12.5 The Jeans Mass

The physical threshold defines a critical mass—the **Jeans Mass**—above which an interstellar gas cloud will inevitably undergo catastrophic gravitational collapse:

M_J = (4π/3) ρ₀ (λ_J/2)³ = (π/6) c_s³ / (G^{3/2} ρ₀^{1/2})

For typical molecular cloud conditions (T ~ 10 K, n ~ 10⁴ cm⁻³):
c_s ≈ 0.2 km/s, ρ₀ ≈ 2×10⁻²⁰ kg/m³
λ_J ≈ 0.3 pc, M_J ≈ 1-10 M_☉

This is remarkably close to the typical mass of stars!

## 12.6 The Jeans Swindle and Its Resolution

The original Jeans analysis assumed an infinite, static, uniform background—which is inconsistent because a self-gravitating infinite medium has no static equilibrium (it would collapse globally). This is the "Jeans swindle." Modern treatments resolve this by:
1. **Expanding background**: Jeans analysis in an expanding universe (cosmological perturbation theory).
2. **Finite cloud**: Consider a finite cloud with boundary conditions.
3. **Global collapse**: The instability is local; a sufficiently large region collapses while the global medium may expand or be supported.

## 12.7 Cosmological Jeans Analysis

In an expanding Friedmann-Robertson-Walker universe with scale factor a(t), density ρ₀(t) ∝ a⁻³, the perturbation equations become:
δ̈ + 2Hδ̇ - 4πGρ₀δ = (c_s²/a²) k² δ

where δ = ρ₁/ρ₀ is the density contrast, H = ȧ/a is the Hubble parameter.
The Jeans wavenumber becomes time-dependent:
k_J(t) = a √(4πGρ₀ / c_s²) ∝ a^{-1/2}

- **Radiation era**: c_s² = c²/3, λ_J ~ horizon scale. No sub-horizon growth.
- **Matter era**: c_s² → 0 after recombination. k_J → ∞. All sub-horizon modes grow.
- **Dark matter**: Collisionless, c_eff = 0, no Jeans length. Structure forms hierarchically.

## 12.8 Nonlinear Collapse and Star Formation

Linear theory breaks down when δ ~ 1. The subsequent nonlinear collapse involves:

### 12.8.1 Free-Fall Collapse
Homologous collapse of a uniform sphere:
ρ(t) = ρ₀ / (1 - t/t_ff)²
Central density diverges at t = t_ff.

### 12.8.2 Larson-Penston Solution
Self-similar collapse with inflow velocity profile:
u(r) = -c_s (r/r_core)
Core density ∝ t⁻², envelope ρ ∝ r⁻².

### 12.8.3 Inside-Out Collapse (Shu 1977)
For an isothermal sphere with ρ ∝ r⁻², collapse proceeds from inside out:
- Expansion wave propagates outward at sound speed.
- Inside the expansion wave: free-fall.
- Outside: static initial condition.
- Accretion rate: Ṁ = 0.975 c_s³/G (independent of initial conditions).

### 12.8.4 Fragmentation
As the cloud collapses, density increases, Jeans mass decreases. The cloud can fragment into multiple cores, forming a **stellar cluster** or **binary/multiple systems**. Fragmentation depends on:
- Equation of state (isothermal vs. adiabatic)
- Cooling efficiency (metallicity, dust)
- Magnetic fields (support, angular momentum transport)
- Turbulence (creates density enhancements)

## 12.9 The Role of Magnetic Fields

Magnetic fields provide additional support against collapse (magnetic pressure + tension). The **magnetic critical mass** (Mouschovias & Spitzer):
M_Φ = c_Φ Φ / √G
where Φ = ∫ B·dA is the magnetic flux, c_Φ ≈ 0.13-0.2.

The **mass-to-flux ratio** λ = (M/Φ) / (M/Φ)_crit determines collapse:
- λ < 1: subcritical, magnetic support prevents collapse
- λ > 1: supercritical, collapse proceeds

**Ambipolar diffusion** allows neutrals to slip past ions, enabling collapse in subcritical cores on timescales longer than free-fall.

## 12.10 Turbulence and the Modern Picture of Star Formation

Molecular clouds are observed to be supersonically turbulent (Mach numbers 5-20). Turbulence:
- Creates dense filaments and cores (density PDF is lognormal)
- Provides support on large scales (effective pressure)
- Drives fragmentation (turbulent cascade to small scales)
- Regulates star formation rate (SFR ~ 1% per free-fall time)

The **virial parameter** α_vir = 5σ²R/GM determines if a cloud is bound (α_vir ≲ 2) or unbound.

## 12.11 The Initial Mass Function (IMF)

The distribution of stellar masses at birth:
dN/dM ∝ M^{-α}
- Salpeter (1955): α = 2.35 for M > 1 M_☉
- Kroupa/Chabrier: lognormal peak at ~0.2 M_☉, power-law tail
- Peak mass set by Jeans mass at typical cloud densities/temperatures
- Low-mass cutoff: opacity limit for fragmentation (~0.01 M_☉)
- High-mass limit: radiation pressure, feedback, accretion physics

## 12.12 Protostellar Evolution

Collapse → First hydrostatic core (FHSC) → Second collapse (H₂ dissociation) → Protostar → Pre-main-sequence (Hayashi, Henyey tracks) → Main sequence.
Key phases:
- **Class 0**: Deeply embedded, strong outflow, T_bol < 70 K
- **Class I**: Protostar + disk + envelope, T_bol 70-650 K
- **Class II**: Classical T Tauri, disk-dominated, T_bol 650-2800 K
- **Class III**: Weak-line T Tauri, disk dissipated

## 12.13 Feedback and Self-Regulation

Massive stars inject energy via:
- **Radiation pressure**: UV photons ionize H II regions
- **Stellar winds**: Mechanical energy
- **Supernovae**: 10⁵¹ erg, metal enrichment
- **Jets/Outflows**: Angular momentum removal, cloud disruption

This feedback limits star formation efficiency (~1-10% per cloud) and drives galactic outflows.

## 12.14 Summary

The Jeans instability is the fundamental mechanism by which gravity overcomes pressure in a self-gravitating fluid. The Jeans length and mass set the characteristic scales for structure formation. In the expanding universe, this instability—seeded by primordial fluctuations from inflation—grows hierarchically, forming the cosmic web of galaxies, clusters, and filaments. Within galaxies, molecular clouds collapse and fragment, governed by the interplay of gravity, turbulence, magnetic fields, and feedback, producing the stars that populate the universe.

---

*This document completes the self-gravitating fluid section (DOC-12). The next document (DOC-13) explores Relativistic Spacetime and the Stress-Energy Tensor—the coupling of fluid dynamics to the continuous geometry of spacetime via General Relativity.*