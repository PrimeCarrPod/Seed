# DOC-08: The Elasticity of the Solid State — Continuum Mechanics of Crystalline Solids

## 8.1 Spontaneous Breaking of Translational Symmetry

When matter condenses into a crystalline solid, the continuous translational symmetry characteristic of a fluid is spontaneously broken. The atoms lock into a periodic lattice governed by the equilibrium balance of quantum exchange forces (Pauli repulsion) and electrostatic interactions (ionic/covalent/metallic bonding).

The broken symmetry has profound consequences:
- **Long-range order**: The density ρ(r) = Σ_R δ(r - R) is periodic, with Fourier components ρ_G ≠ 0 at reciprocal lattice vectors G.
- **Goldstone modes**: The broken continuous symmetry gives rise to **phonons**—gapless excitations with linear dispersion ω = c_s k at long wavelengths. These are the Goldstone bosons of broken translations.
- **Rigidity**: The solid resists shear deformation, unlike a fluid. This rigidity is the macroscopic manifestation of the broken symmetry.

## 8.2 Strain and Displacement Fields

The deformation of a solid is described by the **displacement vector field** u(r) = r' - r, mapping material points from reference configuration r to deformed configuration r'. The **strain tensor** is the symmetric part of the displacement gradient:

ε_ij = 1/2 (∂_i u_j + ∂_j u_i) = 1/2 (u_{i,j} + u_{j,i})

The anti-symmetric part ω_ij = 1/2 (u_{i,j} - u_{j,i}) describes rigid-body rotation, which induces no internal stress.

The strain tensor has 6 independent components (3 diagonal: normal strains; 3 off-diagonal: shear strains). In Voigt notation: ε_1 = ε_xx, ε_2 = ε_yy, ε_3 = ε_zz, ε_4 = 2ε_yz, ε_5 = 2ε_xz, ε_6 = 2ε_xy.

The physical requirement that the strain derives from a single-valued displacement field imposes **compatibility conditions** (Saint-Venant):
ε_{ij,kl} + ε_{kl,ij} - ε_{ik,jl} - ε_{jl,ik} = 0

These ensure that the strain field is integrable to a displacement field.

## 8.3 Stress Tensor and Hooke's Law

The internal forces in a deformed solid are described by the **Cauchy stress tensor** σ_ij (force per unit area in direction j on a surface with normal i). For small deformations, the stress is linearly related to the strain via **generalized Hooke's Law**:

σ_ij = C_{ijkl} ε_kl

where C_{ijkl} is the **elasticity tensor** (or stiffness tensor), a fourth-rank tensor with symmetries:
- C_{ijkl} = C_{jikl} = C_{ijlk} (symmetry of stress and strain)
- C_{ijkl} = C_{klij} (thermodynamic requirement: stress derives from elastic energy density W = 1/2 C_{ijkl} ε_ij ε_kl)

A general fourth-rank tensor in 3D has 81 components. The symmetries reduce this to at most **21 independent components** for a fully anisotropic (triclinic) crystal.

The elastic energy density is:
W = 1/2 C_{ijkl} ε_ij ε_kl = 1/2 σ_ij ε_ij

## 8.4 Crystal Symmetry and Neumann's Principle

Neumann's principle states that the symmetry elements of any physical property tensor must include the symmetry elements of the crystal's point group. The elasticity tensor C_{ijkl} must be invariant under all point group operations.

The **32 crystal classes** (point groups) fall into **7 crystal systems**, each with a characteristic form of the elasticity tensor:

### 8.4.1 Triclinic (1, 1̅) — 21 independent constants
No symmetry. Full 6×6 matrix in Voigt notation:
[C] = [C_11 C_12 C_13 C_14 C_15 C_16; C_12 C_22 C_23 C_24 C_25 C_26; ...]

### 8.4.2 Monoclinic (2/m) — 13 independent constants
One twofold axis or mirror plane. e.g., with mirror plane ⊥ z:
C_14 = C_15 = C_24 = C_25 = C_34 = C_35 = C_46 = C_56 = 0

### 8.4.3 Orthorhombic (mmm) — 9 independent constants
Three mutually perpendicular twofold axes:
C = diag(C_11, C_22, C_33, C_44, C_55, C_66) + off-diagonals C_12, C_13, C_23

### 8.4.4 Tetragonal (4/mmm) — 6 or 7 independent constants
Fourfold axis along z. Two classes:
- 4/m (class 6): C_11, C_12, C_13, C_33, C_44, C_66 (with C_66 = (C_11 - C_12)/2)
- 4mm (class 7): adds C_16 = -C_26

### 8.4.5 Trigonal (3m) — 6 or 7 independent constants
Threefold axis along z.

### 8.4.6 Hexagonal (6/mmm) — 5 independent constants
Sixfold axis along z:
C_11, C_12, C_13, C_33, C_44 (with C_66 = (C_11 - C_12)/2)

### 8.4.7 Cubic (m3m) — 3 independent constants
Highest symmetry:
C_11, C_12, C_44 (C_66 = (C_11 - C_12)/2)

Matrix:
[C_11 C_12 C_12 0 0 0]
[C_12 C_11 C_12 0 0 0]
[C_12 C_12 C_11 0 0 0]
[0 0 0 C_44 0 0]
[0 0 0 0 C_44 0]
[0 0 0 0 0 C_44]

### 8.4.8 Isotropic — 2 independent constants
Polycrystal with random grain orientation, or amorphous solid:
C_11 = λ + 2μ, C_12 = λ, C_44 = μ
where λ, μ are the **Lamé parameters**. Alternatively: **bulk modulus** K = λ + 2μ/3 and **shear modulus** μ.

## 8.5 Elastic Moduli and Their Physical Meaning

### 8.5.1 Bulk Modulus (K)
Resistance to uniform compression: K = -V ∂P/∂V = 1/3 (C_11 + 2C_12) for cubic.
For isotropic: K = λ + 2μ/3.

### 8.5.2 Shear Modulus (μ or G)
Resistance to shape change at constant volume. For cubic: μ = C_44 (on {100} planes) or μ = (C_11 - C_12)/2 (on {110} planes).
For isotropic: μ = C_44.

### 8.5.3 Young's Modulus (E)
Uniaxial stress/strain: σ = E ε.
Isotropic: E = μ(3λ + 2μ)/(λ + μ) = 9Kμ/(3K + μ).

### 8.5.4 Poisson's Ratio (ν)
Lateral contraction / axial extension: ν = -ε_trans/ε_axial.
Isotropic: ν = λ/(2(λ + μ)) = (3K - 2μ)/(6K + 2μ).
Range: -1 < ν < 0.5 (auxetic materials have ν < 0).

## 8.6 Anisotropy and the Zener Ratio

For cubic crystals, the **Zener anisotropy ratio** quantifies elastic anisotropy:
A = 2C_44 / (C_11 - C_12)

- A = 1: elastically isotropic (e.g., tungsten).
- A > 1: "stiff" shear on {100} (e.g., copper, A ≈ 3.2).
- A < 1: "soft" shear on {100} (e.g., iron, A ≈ 2.4).

The **universal elastic anisotropy index** (Ranganathan & Ostoja-Starzewski):
A^U = 5(G_V/G_R) + (K_V/K_R) - 6 ≥ 0
where V = Voigt average (upper bound), R = Reuss average (lower bound).

## 8.7 Wave Propagation: Phonons and Sound Velocities

The equations of motion for a homogeneous elastic solid:
ρ ∂²u_i/∂t² = ∂_j σ_ij = C_{ijkl} ∂_j ∂_k u_l

Plane wave solutions u_i = U_i e^{i(k·r - ωt)} give the **Christoffel equation**:
Γ_{il}(n) U_l = ρ v^2 U_i
where Γ_{il} = C_{ijkl} n_j n_k, n = k/|k|, v = ω/|k|.

For a given propagation direction n, there are three eigenmodes:
- 1 **longitudinal** (quasi-longitudinal): polarization ∥ n, speed v_L.
- 2 **transverse** (quasi-shear): polarization ⊥ n, speeds v_T1, v_T2.

In isotropic media:
v_L = √((λ + 2μ)/ρ),  v_T = √(μ/ρ)

The phonon density of states and specific heat at low T:
C_V = (12π⁴/5) N k_B (T/Θ_D)³ (Debye model)
where Θ_D = ℏω_D/k_B is the Debye temperature, ω_D = v_s (6π²N/V)^{1/3}.

## 8.8 Thermodynamics of Elasticity

The **elastic Gibbs free energy** G(T, σ) = U - TS - σ_ij ε_ij.
The **Helmholtz free energy** F(T, ε) = U - TS = ∫ W(ε) dV.

Thermoelastic coupling:
- Thermal expansion: α_ij = ∂ε_ij/∂T|_σ = C_{ijkl}^{-1} β_kl, where β_kl = ∂σ_kl/∂T|_ε.
- Specific heat difference: C_σ - C_ε = T V α_ij β_ij / C_{ijkl} (small).
- Adiabatic vs. isothermal moduli: C^S = C^T + T V α α / C_V.

## 8.9 Nonlinear Elasticity and Higher-Order Constants

For finite strains, the elastic energy expands to third and fourth order:
W = 1/2 C_{ijkl} ε_ij ε_kl + 1/6 C_{ijklmn} ε_ij ε_kl ε_mn + ...

**Third-order elastic constants (TOECs)**: 56 independent for triclinic, 3 for isotropic (ν₁, ν₂, ν₃ or l, m, n in Murnaghan notation).
- Determine pressure derivatives of moduli: dK/dP, dμ/dP.
- Govern nonlinear wave propagation, harmonic generation, acoustic saturation.
- Essential for equations of state at high pressure (e.g., Earth's interior).

## 8.10 Defects and Elasticity

### 8.10.1 Point Defects
Vacancies, interstitials, impurities. Create elastic dipole fields. Elastic energy ~ μb²Ω, where b is Burgers vector magnitude, Ω is atomic volume.

### 8.10.2 Dislocations
Line defects with Burgers vector b. Stress field:
σ_ij = μ/(2π(1-ν)) (b_k ε_{kjl} x_l / r²) (edge dislocation)
Energy per unit length: E ≈ (μb²/4π) ln(R/r₀).
Dislocations mediate plastic deformation (slip).

### 8.10.3 Grain Boundaries
Interfaces between crystals of different orientation. Read-Shockley model for low-angle boundaries:
γ = γ₀ θ (A - ln θ)

### 8.10.4 Eshelby Inclusion Problem
Ellipsoidal inclusion with eigenstrain ε* in infinite matrix. Uniform strain inside inclusion: ε = S ε*, where S is Eshelby tensor (depends on aspect ratio and Poisson's ratio). Fundamental for composite materials, precipitates, eigenstrain problems.

## 8.11 Continuum Limit from Atomistics

The elasticity tensor can be derived from the interatomic potential V({r_i}). For a pair potential φ(r):
C_{ijkl} = 1/V Σ_{αβ} (φ''(r) - φ'(r)/r) r_i r_j r_k r_l / r² + ...

For many-body potentials (EAM, MEAM, DFT), the same formalism applies with force constants Φ_{ij}^{αβ} = ∂²E/∂u_i^α ∂u_j^β.
The **Born stability criteria** (positive definiteness of C) ensure mechanical stability:
- Cubic: C_11 > 0, C_44 > 0, C_11 > |C_12|, C_11 + 2C_12 > 0.
- General: All eigenvalues of the 6×6 Voigt matrix > 0.

## 8.12 Viscoelasticity and Anelasticity

Real solids exhibit time-dependent response. The stress-strain relation becomes a convolution:
σ(t) = ∫_0^t G(t-t') dε/dt' dt'

where G(t) is the relaxation modulus. Models:
- **Maxwell**: spring and dashpot in series. G(t) = G_0 e^{-t/τ}.
- **Kelvin-Voigt**: spring and dashpot in parallel.
- **Standard Linear Solid**: Maxwell + spring in parallel.

Anelastic relaxation peaks (internal friction Q^{-1}) due to point defect reorientation, dislocation motion, grain boundary sliding.

## 8.13 Phase Transitions in Solids: Martensitic Transformations

Diffusionless, shear-dominated structural transitions. The parent (austenite) phase transforms to a low-symmetry product (martensite) via coordinated atomic shifts. The **Bain strain** describes the lattice deformation.

Key features:
- Hysteresis (first-order).
- Habit plane: invariant plane strain (combination of Bain strain + lattice-invariant shear).
- Shape memory effect: reverse transformation on heating.
- Landau theory with strain as order parameter. Coupling to elastic energy gives compatibility conditions.

## 8.14 Summary

The elasticity of the solid state is the macroscopic expression of spontaneously broken translational symmetry. The stiffness tensor, constrained by crystal symmetry, encodes the linear response to deformation. Its 21 (or fewer) independent components determine sound velocities, thermodynamic stability, defect energetics, and the mechanical behavior of materials from nanoscale to geological scales. The presence of non-zero shear moduli is precisely what distinguishes a solid from a fluid—a fluid cannot support static shear stress and will continuously and irreversibly deform under its influence.

---

*This document completes the Mesocosm section on equilibrium states of matter (DOC-06: Partition Function, DOC-07: Phase Transitions, DOC-08: Elasticity of Solids). The next document (DOC-09) begins the Kinetic Realm: the transition from particles to the fluid continuum via kinetic theory and the Boltzmann equation.*