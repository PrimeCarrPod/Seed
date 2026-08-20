# Document 1: Quantum Electrodynamics of Electron Transport in Silicon
## Piece 4: Density of States Modification in Sub-3nm FinFET/GAA Channels

---

### 1.4 Density of States Modification in Sub-3nm FinFET/GAA Channels

As transistor dimensions shrink below 3nm, quantum confinement fundamentally alters the electronic density of states (DOS). In FinFETs and Gate-All-Around (GAA) nanosheet/nanowire transistors, the channel cross-section becomes comparable to the electron de Broglie wavelength, requiring a full quantum mechanical treatment.

#### 1.4.1 Quantum Confinement in Rectangular Cross-Section Nanowires

For a silicon nanowire with rectangular cross-section (width W, height H) along the transport direction x, the Schrödinger equation separates:

[-ħ²/2m_x ∂²/∂x² - ħ²/2m_y ∂²/∂y² - ħ²/2m_z ∂²/∂z² + V(y,z)] ψ(x,y,z) = E ψ(x,y,z)

With infinite potential walls at y = 0, W and z = 0, H, the transverse wavefunctions are:

φ_{n_y,n_z}(y,z) = (2/√(WH)) sin(n_yπy/W) sin(n_zπz/H)

The subband energies are:

E_{n_y,n_z}(k_x) = E_{n_y,n_z}^0 + ħ²k_x²/2m_x

with confinement energies:

E_{n_y,n_z}^0 = (ħ²π²/2) [n_y²/(m_y W²) + n_z²/(m_z H²)]

For silicon's anisotropic valleys, the effective masses in the confinement directions depend on valley orientation. For a Δ₂-valley (along z), m_z = m_l, m_y = m_t. For Δ₄-valleys (along x,y), the confinement masses are interchanged.

#### 1.4.2 Subband Structure and Valley Splitting

In a (100)-oriented silicon nanosheet (confinement along z), the six-fold valley degeneracy lifts:

- **Δ₂ valleys** (longitudinal mass along confinement): E_0 = ħ²π²/2m_l H² → higher energy
- **Δ₄ valleys** (transverse mass along confinement): E_0 = ħ²π²/2m_t H² → lower energy

The splitting ΔE = ħ²π²/2 (1/m_t - 1/m_l) / H² favors population of the four Δ₄ valleys. For H = 5nm, ΔE ≈ 45 meV, comparable to k_BT at 300K (25.85 meV), causing significant valley repopulation.

In a (110)-oriented FinFET, the valley splitting differs, with two valleys having lower confinement energy.

#### 1.4.3 Density of States for Confined Systems

The 1D density of states per unit length for each subband is:

g_{1D}(E) = (1/π) √(2m_x/ħ²) Σ_{n_y,n_z} (E - E_{n_y,n_z}^0)^{-1/2} Θ(E - E_{n_y,n_z}^0)

This diverges as (E - E₀)^{-1/2} at each subband edge (van Hove singularity), in contrast to the √E dependence of 3D bulk silicon:

g_{3D}(E) = (1/2π²) (2m_{DOS}/ħ²)^{3/2} √E

The total DOS is the sum over all occupied subbands. At room temperature, thermal broadening smears the singularities:

g_{1D}^{thermal}(E) = Σ_{n_y,n_z} ∫ g_{1D}(E') [-∂f⁰(E'-E_F)/∂E'] dE'

#### 1.4.4 Finite Potential Barriers and Wavefunction Penetration

Realistic FinFETs/GAA have finite barrier heights at Si/SiO₂ (ΔE_c ≈ 3.1 eV) or Si/high-κ interfaces. The wavefunction penetrates into the oxide, reducing confinement energy and modifying the effective cross-section.

For a finite well of depth V₀, the transcendental equation for even parity states:

k tan(kH/2) = κ

where k = √(2m*E)/ħ, κ = √(2m_{ox}*(V₀ - E))/ħ, and m_{ox}* is the oxide effective mass.

The penetration depth δ = 1/κ reduces the effective confinement dimension to H_{eff} = H + 2δ, lowering subband energies by ~10-20% compared to infinite well approximation.

#### 1.4.5 Non-Parabolicity and Band Warping Effects

At high energies (above subband edges), the parabolic approximation fails. The Kane non-parabolic dispersion:

E(1 + αE) = ħ²k²/2m*

with α ≈ 0.5 eV⁻¹ for silicon conduction band. The energy-dependent effective mass:

m*(E) = m*(1 + 2αE)

modifies the DOS. For confined systems, non-parabolicity is enhanced because confinement pushes electrons to higher kinetic energies.

Band warping (anisotropy of constant-energy surfaces) becomes significant in subbands derived from Δ₄ valleys, where the longitudinal mass axis lies in the transport plane.

#### 1.4.6 Many-Body Effects: Exchange-Correlation and Screening

In highly confined, high-density channels (n_s > 10¹³ cm⁻² in inversion layers), many-body effects modify the DOS:

1. **Exchange-correlation hole**: Reduces available states near E_F. The local density approximation (LDA) gives exchange-correlation potential:

V_{xc}(n) = - (3/4π)^{1/3} (q²/ε_s) (3π²n)^{1/3} [1 + 0.054 ln(r_s) + ...]

where r_s = (3/4πn)^{1/3}/a₀ is the Wigner-Seitz radius.

2. **Dynamic screening**: The dielectric function ε(q,ω) in 1D/2D systems differs from 3D Lindhard formula. In 2D electron gas:

ε_{2D}(q,0) = 1 + q_s/q with q_s = 2m*q²/ħ²

In 1D, screening is weaker, enhancing electron-electron interactions.

3. **Depolarization shift**: In GAA structures, the gate screens Coulomb interaction, modifying the plasmon dispersion and DOS.

#### 1.4.7 Valley-Orbit Coupling in Ultrasmall Cross-Sections

For cross-sections below ~3nm, the valley-orbit coupling mixes different valleys at the interface. The interface potential breaks translational symmetry, coupling Δ₂ and Δ₄ valleys via umklapp processes with wavevector G = 2π/a.

The valley-orbit Hamiltonian matrix elements:

⟨Δ₂| V_{interface} |Δ₄⟩ ≈ (V₀/a) e^{-κz} sin(G·r)

This lifts remaining degeneracies and modifies the effective mass tensor. Experimental measurements of valley splitting in Si/SiGe quantum wells show splitting up to ~1 meV, consistent with theory.

#### 1.4.8 Strain Engineering of Subband Structure

Strain from lattice-mismatched SiGe channels or stressors modifies the band structure:

- **Tensile strain**: Lowers Δ₄ valleys relative to Δ₂, enhances electron mobility
- **Compressive strain**: Splits heavy-hole/light-hole valence bands, enhances hole mobility

For GAA nanosheets with Si₁₋ₓGeₓ channels (x ~ 0.2-0.3), the strain is biaxial in the plane, shifting valley energies by:

ΔE_{Δ₄} = - (Ξ_u + Ξ_d/3) ε_{||} ≈ -5.5ε_{||} eV
ΔE_{Δ₂} = - (Ξ_u - 2Ξ_d/3) ε_{||} ≈ -1.5ε_{||} eV

where Ξ_u ≈ 9.5 eV, Ξ_d ≈ 1.5 eV are uniaxial/dilatational deformation potentials, and ε_{||} is in-plane strain.

#### 1.4.9 Statistical Variability in Atomic-Scale Dimensions

At sub-3nm dimensions, atomic-scale roughness and discrete dopant fluctuations cause device-to-device variability in DOS:

- **Line edge roughness (LER)**: Correlated fluctuations in W, H with RMS ~0.3-0.5nm
- **Random discrete dopants**: Number fluctuations in channel volume
- **Metal gate granularity**: Work function variation from grain orientation

These cause threshold voltage variation σ_{Vth} ∝ 1/√(WHL) and mobility fluctuation. Statistical compact models use correlated random variables for W, H, L, Vth, μ.

#### 1.4.10 Computational Approaches for Confined DOS

Practical calculation of confined DOS for device simulation employs:

1. **Schrödinger-Poisson self-consistent solver**: Iteratively solves 1D/2D Schrödinger and Poisson equations. Standard in TCAD (Sentaurus, Silvaco).

2. **Mode-space NEGF**: Projects Hamiltonian onto confined modes. Efficient for ballistic/quasi-ballistic transport.

3. **Effective mass approximation with k·p correction**: Uses bulk k·p bandstructure to parameterize confinement masses.

4. **Tight-binding / DFT for ultimate scaling**: Atomistic methods for <2nm cross-sections where effective mass theory breaks down.

The mode-space NEGF approach expresses the retarded Green's function:

G^R(E) = [E I - H_{eff} - Σ^R_S - Σ^R_D]^{-1}

where H_{eff} is the mode-space Hamiltonian, Σ^R_{S/D} are source/drain contact self-energies. The local DOS:

D(E, x) = - (1/π) Im Tr[G^R(E, x, x)]

---

*End of Piece 4. Next: Piece 5 - Fermi-Dirac Statistics and Pauli Blocking in Degenerate Channels*