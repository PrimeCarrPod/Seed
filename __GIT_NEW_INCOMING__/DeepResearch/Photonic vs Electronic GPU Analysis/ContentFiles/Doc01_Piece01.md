# Document 1: Quantum Electrodynamics of Electron Transport in Silicon
## Piece 1: Hamiltonian Formulation of Electron-Phonon Interaction in Silicon Lattice

---

### 1.1 Hamiltonian Formulation of Electron-Phonon Interaction in Silicon Lattice

The fundamental description of electron transport in crystalline silicon begins with the total Hamiltonian of the coupled electron-phonon system. In second quantization formalism, the Hamiltonian decomposes into three distinct contributions:

**H = Hₑ + Hₚ + Hₑₚ**

where Hₑ describes the electronic subsystem, Hₚ the phonon bath, and Hₑₚ their interaction.

#### 1.1.1 Electronic Hamiltonian in Crystal Momentum Representation

For electrons in a periodic potential V(r) = V(r + R) where R = n₁a₁ + n₂a₂ + n₃a₃ are Bravais lattice vectors, Bloch's theorem guarantees eigenstates of the form:

ψ_{nk}(r) = e^{ik·r} u_{nk}(r)

with u_{nk}(r) sharing the lattice periodicity. The electronic Hamiltonian in the basis of Bloch states becomes diagonal in crystal momentum k:

Hₑ = Σ_{n,k} ε_n(k) c^†_{nk} c_{nk}

where ε_n(k) is the band dispersion relation for band index n, and c^†_{nk}, c_{nk} are creation/annihilation operators satisfying fermionic anticommutation relations {c_{nk}, c^†_{n'k'}} = δ_{nn'}δ_{kk'}.

For silicon's diamond structure (space group Fd3̄m), the first Brillouin zone is a truncated octahedron. The conduction band minimum occurs at six equivalent Δ-valleys along the ⟨100⟩ directions at k = ±0.85(2π/a)ẑ (and cyclic permutations), where a = 5.431 Å is the lattice constant at 300K. The valence band maximum resides at the Γ-point (k=0) with heavy-hole, light-hole, and split-off bands degenerate at Γ.

#### 1.1.2 Phonon Hamiltonian and Quantized Lattice Vibrations

The lattice dynamics are described by quantizing the normal modes of the crystal. For a basis of p atoms per primitive cell, there are 3p phonon branches: 3 acoustic and 3(p-1) optical. Silicon has two atoms per primitive cell (p=2), yielding three acoustic (TA, LA) and three optical (TO, LO) branches.

The phonon Hamiltonian in terms of creation/annihilation operators b^†_{qν}, b_{qν} for phonon wavevector q and branch index ν is:

Hₚ = Σ_{qν} ħω_{qν} (b^†_{qν} b_{qν} + ½)

where ω_{qν} is the phonon dispersion relation. The zero-point energy ½ħω_{qν} contributes to the lattice ground state energy but does not affect transport.

The phonon displacement operator for atom at position R_l in the l-th unit cell is:

u_{lκ} = Σ_{qν} √(ħ/2M_κω_{qν}) ε_{κν}(q) [b_{qν} e^{iq·R_l} + b^†_{qν} e^{-iq·R_l}]

where M_κ is the mass of atom κ in the basis, and ε_{κν}(q) is the polarization vector normalized such that Σ_κ |ε_{κν}(q)|² = 1.

#### 1.1.3 Electron-Phonon Interaction Hamiltonian

The electron-phonon coupling arises from the dependence of the crystal potential on atomic positions. Expanding the potential to first order in displacements:

V(r; {R_l + u_l}) ≈ V(r; {R_l}) + Σ_{lκ} u_{lκ} · ∇_{R_{lκ}} V(r; {R_l})

The interaction Hamiltonian in second quantization becomes:

Hₑₚ = Σ_{nk,n'k'} Σ_{qν} M_{nk,n'k'}^{qν} c^†_{n'k'} c_{nk} (b_{qν} + b^†_{-qν})

with matrix element:

M_{nk,n'k'}^{qν} = ⟨n'k'| δV_{qν} |nk⟩

where δV_{qν} = Σ_{lκ} √(ħ/2M_κω_{qν}) ε_{κν}(q) e^{iq·R_l} ∇_{R_{lκ}} V is the Fourier component of the potential perturbation.

For silicon, the dominant scattering mechanisms are:

1. **Acoustic phonon scattering (deformation potential)**: Long-wavelength acoustic phonons modulate the band edges via the deformation potential Ξ. The matrix element scales as |M|² ∝ q for q → 0.

2. **Optical phonon scattering**: Zone-boundary optical phonons (particularly the 63 meV LO/TO phonons at the X-point) cause large-momentum intervalley transitions between the six Δ-valleys.

3. **Polar optical phonon scattering**: While silicon is non-polar (no Fröhlich interaction), in compound semiconductors like GaAs this dominates at room temperature.

#### 1.1.4 Fermi's Golden Rule Scattering Rates

The transition rate from initial state |i⟩ = |nk⟩ to final state |f⟩ = |n'k'⟩ with phonon emission/absorption is given by Fermi's Golden Rule:

W_{i→f} = (2π/ħ) |M_{if}|² δ(E_f - E_i ∓ ħω_{qν})

where the ∓ corresponds to emission (−) and absorption (+). The phonon occupation follows Bose-Einstein statistics:

n_{qν} = 1/[exp(ħω_{qν}/k_BT) - 1]

At room temperature (k_BT ≈ 25.85 meV), the 63 meV optical phonons have n ≈ 0.08, making emission dominant over absorption. Acoustic phonons with ħω ≪ k_BT have n ≈ k_BT/ħω ≫ 1, making emission and absorption nearly equal.

The total scattering rate out of state |nk⟩ is:

1/τ_{nk} = Σ_{n'k'} W_{nk→n'k'}

For intravalley acoustic scattering in the deformation potential approximation:

1/τ_{ac}(E) = (2π/ħ) (Ξ² k_BT / ρ v_s²) g(E)

where Ξ ≈ 9 eV is the acoustic deformation potential for silicon, ρ = 2330 kg/m³ is the mass density, v_s ≈ 9000 m/s is the sound velocity, and g(E) is the density of states.

For intervalley optical phonon scattering between equivalent valleys:

1/τ_{iv}(E) = (2π/ħ) (D_{iv}² / ρ ω_{op}) g(E ± ħω_{op}) [n_{op} + ½ ∓ ½]

where D_{iv} ≈ 3×10⁸ eV/cm is the intervalley deformation potential and ħω_{op} ≈ 63 meV.