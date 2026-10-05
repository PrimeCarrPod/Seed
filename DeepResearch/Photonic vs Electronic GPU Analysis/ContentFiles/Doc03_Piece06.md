# Document 3: Thermodynamics of Joule Heating and Landauer Limit
## Piece 6: Fourier's Law Breakdown at Nanoscale: Ballistic vs. Diffusive Transport

---

### 3.6 Fourier's Law Breakdown at Nanoscale: Ballistic vs. Diffusive Transport

Fourier's law (q = -k∇T) assumes diffusive transport where phonons undergo many scattering events. At nanoscale dimensions comparable to phonon mean free paths (MFPs), ballistic effects dominate, requiring a full Boltzmann Transport Equation (BTE) treatment.

#### 3.6.1 Fourier's Law and Its Assumptions

**Fourier's law**:
q(r) = -k ∇T(r)

**Derivation assumptions**:
1. Local equilibrium: T(r) well-defined
2. Diffusive regime: L ≫ Λ (system size ≫ phonon MFP)
3. Linear response: ∇T small
4. Isotropic scattering (for scalar k)
5. No memory effects (instantaneous response)

**Validity limit**: Knudsen number Kn = Λ/L ≪ 1
For Si at 300K: Λ_avg ≈ 300 nm
Fourier valid for L ≫ 300 nm (i.e., > 3 μm)

#### 3.6.2 Phonon Mean Free Path Distribution

**Cumulative thermal conductivity**:
k(Λ) = ∫_0^Λ (dk/dΛ') dΛ'

**For silicon at 300K**:
- 50% of k from Λ > 100 nm
- 25% from Λ > 300 nm
- 10% from Λ > 1 μm
- Maximum Λ ≈ 10 μm (at low T)

**MFP spectroscopy**: TDTR with variable pump spot size
Reconstructs k(Λ) from thermal penetration depth

#### 3.6.3 Ballistic Transport Regimes

**Knudsen number regimes**:
- Kn < 0.01: Diffusive (Fourier valid)
- 0.01 < Kn < 1: Quasi-ballistic
- Kn > 1: Ballistic

**Ballistic heat conduction**:
q = (1/4) C v ΔT (for 1D, two reservoirs)
where C = heat capacity per volume, v = phonon velocity

**Thermal conductance quantum**:
g_th = π² k_B² T / (3h) ≈ 0.94 nW/K at 300K
Per phonon mode (polarization)

**Ballistic limit for nanowire**:
G_th = M × g_th
M = number of phonon modes
For Si nanowire 10×10 nm: M ≈ 100
G_th ≈ 100 nW/K

#### 3.6.4 Boltzmann Transport Equation for Phonons

**Phonon BTE**:
∂f/∂t + v·∇_r f = (∂f/∂t)_{scatt}

**Scattering operator** (relaxation time approximation):
(∂f/∂t)_{scatt} = -(f - f⁰)/τ

**Steady-state, 1D**:
v_x ∂f/∂x = -(f - f⁰)/τ

Solution:
f(x, v_x) = f⁰(T(x)) + τ v_x ∂f⁰/∂T ∂T/∂x (if diffusive)
f(x, v_x) = f⁰(T(0)) + ∫_0^x (dx'/v_x) (f⁰(T(x')) - f)/τ (exact)

#### 3.6.5 Non-Diffusive Effects

**Temperature jump at boundaries**:
In ballistic regime, T(contact) ≠ T(reservoir)
ΔT_jump = q × R_K
R_K = 1/(2 v C) for ideal contact

**Non-local heat flux**:
q(x) = -∫ K(x,x') ∇T(x') dx'
Kernel K(x,x') has range ~Λ

**Hydrodynamic phonon transport**:
When normal (N) scattering ≫ Umklapp (U) scattering
Phonons flow like viscous fluid
Poiseuille flow in channels
Second sound: thermal waves

**Second sound**:
∂²T/∂t² + (τ_U⁻¹) ∂T/∂t = (v²/3) ∇²T
Wave-like heat propagation
Observed in graphite, Si at low T

#### 3.6.6 Modified Fourier Laws

**Cattaneo-Vernotte (hyperbolic heat equation)**:
τ ∂q/∂t + q = -k ∇T
Finite propagation speed: v_th = √(k/ρC_p τ)

**Guyer-Krumhansl equation** (hydrodynamic):
τ ∂q/∂t + q = -k ∇T + ℓ² (∇²q + 2∇∇·q)
ℓ = v τ_N (hydrodynamic length)

**Non-local Fourier law**:
q(r) = -∫ k(r,r') ∇T(r') dr'
k(r,r') from BTE solution

#### 3.6.7 Thermal Transport in Nanostructures

**Nanowires (D < 100 nm)**:
- Boundary scattering dominates
- k_eff = k_bulk / (1 + Λ_eff/D)
- Fuchs-Sondheimer: p = specularity parameter
- k_eff/k_bulk = 1 - (1-p)Λ/D (for D ≪ Λ)

**Thin films (t < 100 nm)**:
- Cross-plane: k_⊥ reduced by boundary scattering
- In-plane: k_∥ reduced if t < Λ
- Interface scattering with substrate

**Superlattices**:
- Coherent phonon transport (wave effects)
- Miniband formation
- Thermal conductivity minimum at period ~ Λ

**Interfaces**:
- Thermal boundary conductance (TBC)
- Acoustic mismatch (AMM) vs diffuse mismatch (DMM)
- Phonon transmission: T(ω) = 4Z₁Z₂/(Z₁+Z₂)² (AMM)

#### 3.6.8 Ballistic Effects in Modern Transistors

**Self-heating in FinFET (H ≈ 30-50 nm)**:
- Fin height < Λ → quasi-ballistic vertical transport
- Temperature drop across BOX is non-diffusive
- Phonons from channel ballistically cross BOX

**GAA nanosheets (t_Si ≈ 5 nm)**:
- Extreme confinement
- Phonon subbands formed
- Cross-plane transport highly ballistic
- Interface resistance dominates

**Hot spots in 3D ICs**:
- Local power density > 1 kW/mm²
- Thermal gradients over < 100 nm
- Fourier's law underpredicts peak temperature

**Thermal simulation correction**:
Effective k_eff(T, L) = k_bulk × f(Kn)
f(Kn) from BTE or MC calibration

#### 3.6.9 Experimental Probes of Ballistic Transport

**Ultrafast TDTR**:
- Sub-ps time resolution
- Sees ballistic phonon arrival
- Coherent phonons observed

**Transient grating**:
- Interference pattern creates thermal grating
- Decay rate gives thermal diffusivity
- Ballistic: non-exponential decay

**Phonon imaging**:
- Ultrafast electron microscopy
- Directly images phonon wavepackets
- Sees ballistic propagation

**Nanoscale thermometry**:
- SThM, nano-TR, NV centers in diamond
- Map temperature at < 10 nm resolution
- Reveals non-diffusive profiles

#### 3.6.10 Implications for Thermal Design

**Design rules for nanoscale thermal management**:
1. Don't use bulk k for L < 1 μm
2. Include interface resistances explicitly
3. Use BTE/MC for critical hot spots
4. Engineer phonon MFPs via:
   - Isotopic purification (increases Λ)
   - Alloying (decreases Λ)
   - Nanostructuring (tailors Λ distribution)
5. Consider hydrodynamic effects at low T

**Thermal circuit models**:
- RC networks with ballistic resistances
- Foster/Cauer networks from BTE
- Compact models for SPICE

**Future**: Phonon engineering for thermal control
- Phononic crystals for thermal cloaking
- Thermal diodes/rectifiers
- Active thermal management with phonon drag

---

*End of Piece 6. Next: Piece 7 - Entropy Production Rate in Steady-State Electronic Computation*