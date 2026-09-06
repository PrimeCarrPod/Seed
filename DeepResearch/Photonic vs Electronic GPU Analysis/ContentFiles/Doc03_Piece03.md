# Document 3: Thermodynamics of Joule Heating and Landauer Limit
## Piece 3: Non-Equilibrium Green's Function (NEGF) for Heat Dissipation

---

### 3.3 Non-Equilibrium Green's Function (NEGF) for Heat Dissipation

The Non-Equilibrium Green's Function (NEGF) formalism provides a rigorous quantum mechanical framework for computing electron and heat transport in nanoscale devices. It naturally incorporates quantum effects, contacts, and electron-phonon interactions, making it the gold standard for simulating Joule heating in modern transistors.

#### 3.3.1 NEGF Formalism Overview

The central quantities are the Green's functions:
- **Retarded**: G^R(E) = [E I - H - Σ^R(E)]^{-1}
- **Advanced**: G^A(E) = [G^R(E)]^†
- **Lesser**: G^<(E) = G^R(E) Σ^<(E) G^A(E)
- **Greater**: G^>(E) = G^R(E) Σ^>(E) G^A(E)

where H is the device Hamiltonian, Σ^R = Σ^R_S + Σ^R_D + Σ^R_scatt are contact and scattering self-energies.

#### 3.3.2 Contact Self-Energies

For semi-infinite leads (source S, drain D):
Σ^R_{S/D}(E) = τ_{S/D} g^R_{S/D}(E) τ^†_{S/D}

where τ is coupling matrix, g^R is surface Green's function of lead.

Contact broadening:
Γ_{S/D}(E) = i[Σ^R_{S/D} - Σ^A_{S/D}]

Contact lesser self-energy (equilibrium leads):
Σ^<_{S/D}(E) = i f_{S/D}(E) Γ_{S/D}(E)
f_{S/D}(E) = 1/[exp((E - μ_{S/D})/k_BT) + 1]

#### 3.3.3 Electron-Phonon Self-Energy

**Self-Consistent Born Approximation (SCBA)**:
Σ^<_{e-ph}(E) = Σ_q |M_q|² D^<(ħω_q) G^<(E - ħω_q)
Σ^>_{e-ph}(E) = Σ_q |M_q|² D^>(ħω_q) G^>(E - ħω_q)

where M_q is e-ph matrix element, D is phonon Green's function.

**Phonon self-energies** (for phonon transport):
Π^<_{ph}(ω) = -i Σ_k |M_q|² G^<(E_k) G^>(E_k + ħω)
Π^>_{ph}(ω) = -i Σ_q |M_q|² G^>(E_k) G^<(E_k + ħω)

#### 3.3.4 Current and Heat Current

**Particle current** from lead α:
I_α = (q/ħ) ∫ (dE/2π) Tr[Γ_α(E) (G^<(E) + f_α(E)(G^R - G^A))]

**Energy current** from lead α:
J_α = (1/ħ) ∫ (dE/2π) E Tr[Γ_α(E) (G^<(E) + f_α(E)(G^R - G^A))]

**Heat current** (energy minus chemical work):
Q_α = J_α - μ_α I_α/q

Total heat dissipation in device:
Q_tot = Σ_α Q_α = Power input - Power output

#### 3.3.5 Local Heat Generation

**Energy density** at position r:
U(r) = ∫ (dE/2π) E A(r,r;E) f(E)

where A = i(G^R - G^A) is spectral function.

**Heat generation rate** per volume:
Q(r) = (1/ħ) ∫ (dE/2π) E Tr[Σ^<_scatt(E) A(E) - Σ^<_scatt(E) G^<(E)]

For e-ph scattering, this is the local Joule heating:
Q_{e-ph}(r) = Σ_q ħω_q |M_q|² [n_q G^< + (n_q+1) G^>] ...

#### 3.3.6 Phonon Transport and Thermal Conductivity

**Phonon NEGF**: Similar formalism for phonons
H_ph = Σ_q ħω_q b^†_q b_q + anharmonic terms

Phonon self-energies:
- Harmonic: contact broadening Γ_ph
- Anharmonic (3-phonon): Π^R_3ph, Π^<_3ph
- Isotope scattering: Π_iso
- Boundary scattering: diffuse/specular

**Thermal conductance**:
κ_ph = (1/AΔT) ∫ (dω/2π) ħω T_ph(ω) [n_L(ω) - n_R(ω)]

where T_ph(ω) = Tr[Γ_ph,L G^R_ph Γ_ph,R G^A_ph]

#### 3.3.7 Coupled Electron-Phonon Thermal Transport

**Self-consistent electro-thermal simulation**:
1. Solve electron NEGF for given T(r)
2. Compute Q(r) from electron distribution
3. Solve phonon NEGF (or Fourier) for T(r) with Q(r) as source
4. Iterate until convergence

**Hot phonon effect**:
Optical phonons emitted by hot electrons don't equilibrate instantly
Non-equilibrium phonon distribution: n_q ≠ n_B(ω_q, T_L)
Reduces effective cooling, increases electron temperature

#### 3.3.8 Joule Heating in Nanoscale MOSFETs

**Self-heating in FinFET/GAA**:
- Buried oxide (BOX) in SOI/FinFET: thermal bottleneck
- Thermal resistance R_th ∝ 1/(k_SiO₂ t_BOX)
- ΔT ≈ 50-100K at 1 mA/μm

**Ballistic limit**:
If L < λ_e (mean free path):
- Electrons traverse without scattering
- Joule heating occurs in contacts, not channel
- Q_channel → 0, Q_contacts = I V_D

**Quasi-ballistic**:
NEGF captures transition from diffusive to ballistic
Phonon emission concentrated near drain (high field)

#### 3.3.9 Thermal Noise and Fluctuations

**Johnson-Nyquist noise**:
S_I(ω) = 4k_BT Re[Y(ω)] (fluctuation-dissipation)

**NEGF for noise**:
Current noise spectral density:
S_{αβ}(ω) = (q²/ħ) ∫ dE Tr[Γ_α G^R Γ_β G^A] × (f_α(1-f_β) + f_β(1-f_α))
+ correlation terms from scattering

**Thermal fluctuation effects**:
- Temperature fluctuations δT cause mobility fluctuations
- Impact on variability: σ_Vth ∝ √(k_BT²/C_th)

#### 3.3.10 NEGF for Photonic Systems

**Photonic NEGF** (for optical thermal transport):
- Photon Green's functions in waveguides
- Coupling to phonons (optomechanics)
- Radiative heat transfer between nanostructures

**Near-field radiative transfer**:
- Evanescent waves tunnel across gap
- Heat flux ∝ 1/d² (vs 1/d⁰ far-field)
- Enhanced by surface phonon polaritons (SiC, SiO₂)

**Applications**:
- Thermal management in 3D ICs
- Thermophotovoltaics
- Optical refrigeration

---

*End of Piece 3. Next: Piece 4 - Phonon Bottleneck in Hot Carrier Relaxation*