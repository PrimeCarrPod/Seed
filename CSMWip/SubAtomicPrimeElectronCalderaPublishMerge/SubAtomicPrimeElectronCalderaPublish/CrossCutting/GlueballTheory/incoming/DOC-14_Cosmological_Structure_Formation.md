# DOC-14: Cosmological Structure Formation — From Primordial Fluctuations to the Cosmic Web

## 14.1 The Cosmological Context

The universe on large scales is described by the ΛCDM model: a flat, expanding FLRW spacetime dominated by dark energy (Λ, ~69%), cold dark matter (CDM, ~26%), and baryons (~5%), with radiation negligible today. The seeds of all structure are **primordial fluctuations** generated during inflation—quantum fluctuations stretched to cosmological scales, becoming classical density perturbations with a nearly scale-invariant spectrum.

## 14.2 Linear Perturbation Theory in an Expanding Universe

### 14.2.1 Perturbed FLRW Metric
In Newtonian gauge (longitudinal gauge):
ds² = -(1+2Ψ)dt² + a²(t)(1-2Φ)δ_ij dx^i dx^j

For a perfect fluid with no anisotropic stress, Φ = Ψ. The metric perturbation Φ is the relativistic generalization of the Newtonian gravitational potential.

### 14.2.2 Density Contrast and Peculiar Velocity
δ = δρ/ρ (density contrast)
v = a dx/dt (peculiar velocity, deviation from Hubble flow)

### 14.2.3 Linearized Equations (Sub-horizon, k ≫ aH)
For each species α (CDM, baryons, photons, neutrinos):
- Continuity: δ̇_α + (1/a)∇·v_α = 0 (δ_α ≪ 1)
- Euler: v̇_α + H v_α = -(1/a)∇Φ - (1/aρ_α)∇p_α
- Poisson: ∇²Φ = 4πG a² Σ_α ρ_α δ_α

For CDM (p=0): δ̇_c + (1/a)∇·v_c = 0, v̇_c + H v_c = -(1/a)∇Φ
For baryons (p_b ≠ 0): coupled to photons before recombination.

### 14.2.4 Growth Equation for Matter Perturbations
Combining continuity and Euler for pressureless matter (CDM + baryons after recombination):
δ̈_m + 2H δ̇_m - 4πG ρ_m δ_m = 0

In a flat ΛCDM universe, the growing mode solution is:
δ_m(a) ∝ D(a) (growth factor)
D(a) = 5Ω_m/2 H(a) ∫_0^a da' / [a'³ H(a')³]

The **growth rate** f = d ln D / d ln a ≈ Ω_m(a)^γ, with γ ≈ 0.55.

## 14.3 The Primordial Power Spectrum

Inflation predicts a nearly scale-invariant spectrum of curvature perturbations:
P_ℛ(k) = A_s (k/k_*)^{n_s - 1}

where:
- A_s ≈ 2.1 × 10⁻⁹ (amplitude)
- n_s ≈ 0.965 (scalar spectral index)
- k_* = 0.05 Mpc⁻¹ (pivot scale)

The density power spectrum today is:
P_δ(k, z) = T²(k) P_ℛ(k) D²(z)

where T(k) is the **transfer function** encoding the evolution through radiation-matter equality, Silk damping, baryon acoustic oscillations (BAO), and free-streaming of neutrinos.

## 14.4 Key Physical Scales

### 14.4.1 Horizon Scale at Matter-Radiation Equality
k_eq ≈ 0.01 Ω_m h² Mpc⁻¹
Modes entering horizon during radiation era are suppressed (logarithmic growth only). Modes entering during matter era grow as δ ∝ a.

### 14.4.2 Silk Damping Scale
Photon diffusion before recombination damps baryon perturbations:
k_Silk ≈ 0.1 Mpc⁻¹ (comoving)
Sets the small-scale cutoff for baryons.

### 14.4.3 Free-Streaming Scale (Neutrinos/Warm Dark Matter)
Particles with thermal velocity v_th stream out of overdense regions:
k_fs ≈ 0.1-10 Mpc⁻¹ (depending on particle mass)
Suppresses power on small scales.

### 14.4.4 Baryon Acoustic Oscillations (BAO)
Sound waves in the photon-baryon fluid before recombination imprint a characteristic scale:
r_s = ∫_0^{t_rec} c_s dt / a ≈ 150 Mpc (comoving)
Visible as peaks in P(k) and correlation function ξ(r).

## 14.5 Nonlinear Evolution: Spherical Collapse

When δ ~ 1, linear theory breaks down. The **spherical collapse model** describes the nonlinear evolution of an isolated top-hat overdensity in an Einstein-de Sitter (EdS) universe:

### 14.5.1 Parametric Solution
R(θ) = A(1 - cos θ)
t(θ) = B(θ - sin θ)
where A, B determined by initial overdensity.

### 14.5.2 Key Epochs
- **Turnaround**: δ_lin ≈ 1.06, maximum expansion
- **Collapse**: δ_lin = δ_c ≈ 1.686 (in EdS)
- **Virialization**: At half the turnaround radius, the system virializes (2K + W = 0).

The critical linear overdensity for collapse is δ_c ≈ 1.686 (weakly dependent on cosmology). In ΛCDM, δ_c(z) varies slightly with redshift.

## 14.6 The Halo Mass Function

The **Press-Schechter** formalism (1974) and its extensions (Sheth-Tormen, Tinker et al.) predict the number density of dark matter halos per unit mass:

dn/dM = f(σ) (ρ_m/M) |d ln σ/d ln M|

where σ²(M) = ∫ d³k/(2π)³ P(k) |W(kR)|² is the variance of the linear density field smoothed on scale R = (3M/4πρ_m)^{1/3}, and f(σ) is the multiplicity function.

For Sheth-Tormen:
f(σ) = A √(2a/π) (1 + (σ²/aδ_c²)^p) (δ_c/σ) exp(-aδ_c²/2σ²)

with a ≈ 0.707, p ≈ 0.3, A ≈ 0.322.

## 14.7 Halo Structure: Density Profiles

### 14.7.1 Navarro-Frenk-White (NFW) Profile
ρ(r) = ρ_s / [(r/r_s)(1 + r/r_s)²]
Characteristic scale radius r_s, concentration c = r_vir/r_s.
c(M, z) ≈ 5-15 (decreasing with mass, increasing with redshift).

### 14.7.2 Einasto Profile
ρ(r) = ρ_{-2} exp[-(2/α)((r/r_{-2})^α - 1)]
Better fit to simulations, especially for high-mass halos.

### 14.7.3 Core vs. Cusp
CDM predicts central cusp ρ ∝ r⁻¹. Observations of dwarf galaxies suggest cores (constant density). Solutions: baryonic feedback, self-interacting dark matter, warm dark matter.

## 14.8 The Cosmic Web

On large scales, the density field organizes into a **cosmic web** of:
- **Voids**: Large underdense regions (δ < -0.8), ~80% of volume
- **Walls/Sheets**: Flattened structures
- **Filaments**: Elongated structures connecting clusters
- **Clusters**: High-density nodes (δ > 100), intersection of filaments

Classification via the **tidal tensor** T_ij = ∂_i ∂_j Φ / 4πGρ̄ or the **velocity shear tensor** Σ_ij = ½(∂_i v_j + ∂_j v_i). Eigenvalues λ₁ ≥ λ₂ ≥ λ₃:
- λ₃ > 0: cluster (collapse in 3 directions)
- λ₂ > 0 > λ₃: filament (collapse in 2)
- λ₁ > 0 > λ₂, λ₃: wall (collapse in 1)
- All λ < 0: void

## 14.9 Galaxy Formation: From Halos to Galaxies

### 14.9.1 Baryonic Physics
Gas falls into dark matter potential wells, shocks to virial temperature, cools radiatively, and forms stars. Key processes:
- **Cooling**: Atomic line cooling (T > 10⁴ K), molecular cooling (H₂), metal-line cooling, dust cooling.
- **Star formation**: Convert cold gas to stars (Kennicutt-Schmidt law: Σ_SFR ∝ Σ_gas^N).
- **Feedback**: Supernovae, AGN, stellar winds, radiation pressure. Regulates SFR, drives outflows.
- **Reionization**: UV photons from early stars reionize universe at z ~ 6-10, suppresses small halos (photoheating).

### 14.9.2 Semi-Analytic Models (SAMs)
Couple halo merger trees to baryonic recipes. Parameters calibrated to observations (luminosity functions, stellar mass functions, clustering).

### 14.9.3 Hydrodynamic Simulations
Full gas dynamics + gravity + subgrid physics (EAGLE, Illustris/TNG, SIMBA, FIRE). Resolve ISM, star formation, feedback. ~100 Mpc boxes, ~kpc resolution.

## 14.10 Large-Scale Structure Observables

### 14.10.1 Two-Point Correlation Function
ξ(r) = ⟨δ(x)δ(x+r)⟩
Power spectrum: P(k) = ∫ d³r e^{-ik·r} ξ(r)
Baryon acoustic oscillations visible at r ≈ 150 Mpc.

### 14.10.2 Redshift-Space Distortions (RSD)
Peculiar velocities distort clustering in redshift space:
P_s(k, μ) = (1 + β μ²)² P_r(k)
where β = f/b (f = growth rate, b = galaxy bias).
Measures fσ₈, tests gravity.

### 14.10.3 Weak Gravitational Lensing
Foreground matter deflects background galaxy shapes.
Shear correlation functions: ξ_±(θ) = ⟨γ_t γ_t⟩, ⟨γ_× γ_×⟩
Convergence power spectrum: P_κ(ℓ) = (9H₀⁴Ω_m²/4c⁴) ∫ dz W²(z) P_δ(ℓ/χ, z)
Measures matter distribution directly, insensitive to bias.

### 14.10.4 Galaxy Clustering and BAO
Baryon acoustic oscillations provide a standard ruler. Angular diameter distance D_A(z) and Hubble parameter H(z) from BAO peak position.

### 14.10.5 Cluster Abundance
Number density of clusters as function of mass and redshift:
dN/dM dz ∝ dn/dM dV/dz
Sensitive to σ₈, Ω_m, dark energy equation of state w.

## 14.11 The Tension in Cosmology

### 14.11.1 Hubble Tension
H₀ from CMB (Planck): 67.4 ± 0.5 km/s/Mpc
H₀ from distance ladder (SH0ES): 73.0 ± 1.0 km/s/Mpc
> 5σ discrepancy. Possible resolutions: early dark energy, modified gravity, systematic errors.

### 14.11.2 S₈ Tension
S₈ = σ₈ √(Ω_m/0.3)
CMB: S₈ ≈ 0.83
Weak lensing (KiDS, DES, HSC): S₈ ≈ 0.76
~2-3σ discrepancy. Possible: baryonic feedback, neutrino mass, modified gravity.

## 14.12 Future Probes

- **Euclid/Roman**: Wide-field imaging + spectroscopy, lensing + clustering + RSD.
- **LSST (Rubin)**: Deep, wide, fast time-domain survey.
- **DESI**: Spectroscopic survey of 30M galaxies, BAO + RSD.
- **CMB-S4**: Next-gen CMB polarization, lensing, primordial B-modes.
- **21cm intensity mapping**: HI mapping at high z (HERA, SKA, CHIME).
- **Gravitational waves**: Standard sirens for H₀, tests of GR.

## 14.13 Summary

Cosmological structure formation is the story of how tiny primordial fluctuations (δ ~ 10⁻⁵) grow via gravitational instability into the vast cosmic web of galaxies, clusters, and voids we observe today. The linear theory is exquisitely understood and tested by CMB and large-scale structure. The nonlinear regime is explored through N-body simulations, halo models, and hydrodynamic simulations. The remaining tensions (H₀, S₈) may point to new physics beyond ΛCDM, or to astrophysical systematics. The next decade of surveys will decisively test the standard model of cosmology.

---

*This document completes the cosmological structure formation section (DOC-14). The next document (DOC-15) explores the synthesis of the entire micro-to-macro chain: Unified Theories and Effective Descriptions—how the different scales connect through renormalization group flow, effective field theories, and the emergence of complexity.*