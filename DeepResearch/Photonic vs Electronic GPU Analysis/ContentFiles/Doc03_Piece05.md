# Document 3: Thermodynamics of Joule Heating and Landauer Limit
## Piece 5: Thermal Conductivity Tensor for Anisotropic Silicon-on-Insulator

---

### 3.5 Thermal Conductivity Tensor for Anisotropic Silicon-on-Insulator

Silicon-on-Insulator (SOI) substrates and FinFET/GAA structures exhibit strong thermal anisotropy due to layered geometry, crystal orientation, and interface effects. Understanding the full thermal conductivity tensor is essential for accurate thermal modeling of nanoscale devices.

#### 3.5.1 Bulk Silicon Thermal Conductivity

**Crystal structure**: Diamond cubic (Fd3̄m)
**Thermal conductivity at 300K**: k ≈ 150 W/mK (isotropic in bulk)
**Phonon mean free path (MFP)**: Λ ≈ 300 nm (average)
**MFP distribution**: Broad, from nm to μm
- 50% of heat carried by phonons with Λ > 100 nm
- 10% by Λ > 1 μm

**Temperature dependence**:
- Low T: k ∝ T³ (boundary scattering)
- Peak: ~30 K, k ≈ 1000 W/mK
- High T: k ∝ 1/T (Umklapp scattering)
- 300K: 150 W/mK
- 500K: 70 W/mK

#### 3.5.2 Thermal Conductivity Tensor in Strained/Anisotropic Silicon

Under strain or in non-cubic environments, thermal conductivity becomes a tensor:

k_{ij} = (1/V) Σ_{q,s} ħω_{q,s} v_{q,s,i} v_{q,s,j} τ_{q,s} (∂n_B/∂T)

where v_{q,s} = ∇_q ω_{q,s} is group velocity, τ_{q,s} is relaxation time.

**Uniaxial strain along [001]**:
- Longitudinal acoustic (LA) phonons: velocity increases along strain
- Transverse acoustic (TA) phonons: split into TA1, TA2
- Result: k_∥ > k_⊥ (anisotropy ~10-20% for 1% strain)

**Biaxial strain (SOI, SiGe)**:
- In-plane compression (Si on SiGe): k_∥ reduced, k_⊥ increased
- Shear strain: off-diagonal components k_{xy} ≠ 0

#### 3.5.3 SOI Thermal Conductivity: Size Effects

**SOI structure**: Si device layer / Buried oxide (BOX) / Si handle

**Device layer thickness t_Si**:
- If t_Si < Λ_phonon: boundary scattering reduces k
- Fuchs-Sondheimer model for thin films:
  k_eff/k_bulk = 1 - (3/8)(Λ/t_Si) + ... (for diffuse walls)
- For t_Si = 10 nm: k_eff ≈ 20-30 W/mK (vs 150 bulk)

**BOX layer (SiO₂)**:
- k_SiO₂ ≈ 1.4 W/mK (amorphous)
- Thermal boundary resistance (TBR) at Si/SiO₂:
  R_K ≈ 10⁻⁸ - 10⁻⁷ m²K/W
- Temperature drop across BOX: ΔT = Q × (t_BOX/k_SiO₂ + R_K)

#### 3.5.4 FinFET Thermal Conductivity Tensor

**Fin geometry**: Vertical fin (height H, width W) on BOX

**Effective conductivity** (vertical heat flow):
1/k_eff,⊥ = 1/k_Si + (t_BOX/k_SiO₂ + R_K)/H

**Lateral conductivity** (along fin):
- Width W < Λ → boundary scattering
- k_eff,∥ = k_Si × f(W/Λ)
- For W = 10 nm: k_eff,∥ ≈ 50 W/mK

**Tensor in fin coordinates**:
k_{ij} = diag(k_∥, k_∥, k_⊥) in (x,y,z) where z is vertical

**Corner effects**: Rounded corners create local hot spots
- Field crowding → higher power density
- Reduced cross-section for heat flow

#### 3.5.5 GAA Nanosheet Thermal Transport

**Stacked nanosheets** (GAA):
- Multiple Si channels separated by SiGe/SiO₂
- Heat must flow vertically through stack
- Inter-layer thermal resistance critical

**Effective vertical conductivity**:
1/k_eff,⊥ = Σ_i (t_i/k_i) + Σ_{interfaces} R_K,i

For 3 nanosheets (5 nm Si, 5 nm SiO₂):
k_eff,⊥ ≈ 5-10 W/mK (dominated by interfaces)

**Lateral conductivity**: Similar to FinFET, but sheets thinner
k_eff,∥ ≈ 20-40 W/mK for 5 nm sheets

#### 3.5.6 Thermal Boundary Resistance (Kapitza Resistance)

**Acoustic mismatch model (AMM)**:
R_K = 1/(4 Σ_α ∫ v_α ρ_α c_α dΩ)
Assumes perfect interface, phonon transmission by impedance match

**Diffuse mismatch model (DMM)**:
R_K = 1/(Σ_α ∫ v_α ρ_α c_α T_{α→β} dΩ)
T_{α→β} = (Σ_β v_β ρ_β c_β)/(Σ_γ v_γ ρ_γ c_γ)

**Si/SiO₂ interface**:
- AMM: R_K ≈ 5×10⁻⁹ m²K/W
- DMM: R_K ≈ 2×10⁻⁸ m²K/W
- Experimental: R_K ≈ 1-5×10⁻⁸ m²K/W

**Interface engineering**:
- Adhesion layers (Ti, Cr): reduce R_K
- Surface roughness: increases diffuse scattering
- Nitridation: SiON interface, lower R_K

#### 3.5.7 Anisotropic Heat Equation

**General heat equation**:
ρ C_p ∂T/∂t = ∇·(k̿·∇T) + Q

where k̿ is thermal conductivity tensor.

**For FinFET (z vertical, x along fin, y across fin)**:
ρC_p ∂T/∂t = ∂/∂x(k_∥ ∂T/∂x) + ∂/∂y(k_∥ ∂T/∂y) + ∂/∂z(k_⊥ ∂T/∂z) + Q

**Principal axes**: Aligned with crystal axes for bulk, with geometry for nanostructures.

#### 3.5.8 Thermal Simulation Methods

**Finite Element Method (FEM)**:
- COMSOL, ANSYS, Sentaurus Thermal
- Full tensor k̿ input
- Coupled electro-thermal: NEGF/MC → Q(r) → FEM → T(r) → update Q

**Compact thermal models**:
- RC thermal networks (Foster/Cauer ladders)
- Extracted from FEM or measurement
- Used in circuit simulators (SPICE)

**Phonon Monte Carlo**:
- Full phonon BTE with dispersion
- Captures non-diffusive effects
- Computationally expensive but accurate

#### 3.5.9 Experimental Measurement Techniques

**Time-domain thermoreflectance (TDTR)**:
- Pump-probe with < 1 ps resolution
- Measures k_⊥, R_K of thin films
- Depth resolution ~10 nm

**Frequency-domain thermoreflectance (FDTR)**:
- Modulated pump, lock-in detection
- Better for low-k materials
- Measures thermal effusivity √(kρC_p)

**Raman thermometry**:
- Spatial resolution ~500 nm
- Temperature from Stokes/anti-Stokes
- Can map 2D temperature profile

**Scanning thermal microscopy (SThM)**:
- AFM tip with thermocouple
- Resolution ~50 nm
- Measures surface temperature

#### 3.5.10 Impact on Device Performance

**Self-heating in SOI**:
ΔT_max = (P × t_Si)/(2 k_eff,⊥) + P × R_K
For P = 1 mW/μm, t_Si = 10 nm: ΔT ≈ 50 K

**Mobility degradation**:
μ ∝ T^{-α} (α ≈ 1.5-2.5)
ΔT = 50K → μ reduced by 20-30%

**Threshold voltage shift**:
ΔV_th = -α_T ΔT (α_T ≈ 1-2 mV/K)
ΔT = 50K → ΔV_th ≈ -50 to -100 mV

**Reliability**:
- Electromigration: MTTF ∝ exp(E_a/kT)
- ΔT = 50K → 10× reduction in MTTF
- TDDB: accelerated by temperature
- Thermal cycling: fatigue at interfaces

---

*End of Piece 5. Next: Piece 6 - Fourier's Law Breakdown at Nanoscale: Ballistic vs. Diffusive Transport*