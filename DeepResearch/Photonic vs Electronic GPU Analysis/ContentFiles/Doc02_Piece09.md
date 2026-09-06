# Document 2: Photon Statistics and Quantum Optical Computing
## Piece 9: Decoherence Mechanisms: Raman Scattering, Free-Carrier Absorption, TPA

---

### 2.9 Decoherence Mechanisms: Raman Scattering, Free-Carrier Absorption, TPA

Decoherence in silicon photonics arises from nonlinear optical processes that couple the quantum state of light to environmental degrees of freedom (phonons, free carriers). These mechanisms fundamentally limit the performance of quantum photonic circuits and optical neural networks.

#### 2.9.1 Spontaneous Raman Scattering in Silicon

**Mechanism**: Pump photon → Stokes photon + optical phonon (15.6 THz, 64.5 meV)

Hamiltonian:
H_Raman = ħ Σ_q g_q (a^†_p a_s b^†_q + h.c.)

where b_q is phonon annihilation operator, g_q is coupling strength.

**Raman gain coefficient**:
g_R(Ω) = g_R⁰ / [1 + 4(Ω - Ω_R)²/Γ_R²]
Ω_R = 15.6 THz, Γ_R ≈ 1.5 THz (FWHM)
g_R⁰ ≈ 10-20 cm/GW (pump at 1550 nm)

**Spontaneous Raman noise**:
N_Raman = g_R P_p L_eff / A_eff × (n_th + 1)
n_th = 1/(exp(ħΩ_R/k_BT) - 1) ≈ 0.08 at 300K

For P_p = 10 mW, L = 1 cm, A_eff = 0.1 μm²:
N_Raman ≈ 10⁴ photons/s/THz (significant for single-photon apps)

**Impact on quantum states**:
- Adds thermal noise to signal/idler modes
- Reduces squeezing: Var_meas = η Var_squeezed + (1-η)/4 + N_Raman
- Degrades entanglement fidelity
- Limits CAR in FWM sources

#### 2.9.2 Two-Photon Absorption (TPA)

**Mechanism**: Simultaneous absorption of two photons
e + 2ħω → e' (across bandgap)
Threshold: 2ħω > E_g (1.12 eV for Si)
At 1550 nm (0.8 eV): 2ħω = 1.6 eV > E_g → TPA allowed

**TPA coefficient**:
β_TPA = 0.5-1 cm/GW at 1550 nm
= 5-10×10⁻¹² m/W

**TPA rate**:
dN_c/dt = (β_TPA/2ħω) ∫ I² dA
I = intensity, N_c = free-carrier density

**Quantum description**:
H_TPA = iħ (β_TPA/2ħω) (a^† a^† a a - h.c.)? 
Actually TPA is a loss mechanism, not unitary.
Described by Lindblad master equation:
dρ/dt = - (Γ_TPA/2) (a^†² a² ρ + ρ a^†² a² - 2 a² ρ a^†²)
Γ_TPA = β_TPA P² / (ħω A_eff L_eff)

**Impact on squeezing**:
TPA adds vacuum noise (loss channel)
Degrades squeezing exponentially with power
Fundamental limit for high-power operation

#### 2.9.3 Free-Carrier Absorption (FCA) and Refraction (FCR)

**FCA cross-sections** (at 1550 nm):
σ_e = 1.45×10⁻¹⁷ cm² (electrons)
σ_h = 1.35×10⁻¹⁷ cm² (holes)

**FCA loss**:
α_FCA = σ_e N_e + σ_h N_h

**FCR index change**:
Δn = - (e²λ²/8π²c²ε₀n) (N_e/m_e* + N_h/m_h*)
m_e* = 0.26 m₀, m_h* = 0.39 m₀
Δn = -8.8×10⁻²² N_e - 8.5×10⁻¹⁸ N_h (cm³)

**Carrier dynamics**:
dN/dt = G - N/τ_c
G = generation rate (TPA, FWM, doping)
τ_c = carrier lifetime

Unpinched waveguide: τ_c ≈ 1 ns (surface recombination)
Pinched p-i-n: τ_c ≈ 10-100 ps (field sweep-out)
Carrier sweep-out time: τ_sweep = W²/μV ≈ 10 ps (W=500nm, V=10V)

#### 2.9.4 Coupled Equations for Pulse Propagation

Generalized Nonlinear Schrödinger Equation (GNLSE) with TPA/FCA:

∂A/∂z + β₁ ∂A/∂t + iβ₂/2 ∂²A/∂t² - β₃/6 ∂³A/∂t³
= - (α/2 + α_FCA/2) A + iγ |A|² A - (β_TPA/2) |A|² A

Carrier density:
∂N/∂t = (β_TPA/2ħω) |A|⁴ - N/τ_c + D ∇²N

Phase shift from FCR:
φ_FCR = - (ω/c) Δn L = (ω/c) (8.8×10⁻²² N_e + 8.5×10⁻¹⁸ N_h) L

**Nonlinear phase noise**:
Δφ_FCR fluctuations from carrier number statistics
Var(Δφ) ∝ (Δn)² L² Var(N)
Var(N) = N (Poisson statistics)

#### 2.9.5 Decoherence of Quantum States

**Single-photon loss (TPA/FCA)**:
|ψ⟩ = α|0⟩ + β|1⟩ → after loss η: α|0⟩ + β√η|1⟩ + β√(1-η)|vac⟩
Fidelity: F = |α|² + |β|² η

**Squeezed state degradation**:
Input squeezing r, transmission η:
Output: effective squeezing r_eff = arctanh(η tanh r)
Measured variance: Var = (1-η)/4 + η e^{-2r}/4

**Entanglement degradation**:
Two-mode squeezed vacuum with loss η₁, η₂:
Logarithmic negativity: E_N = max[0, -log₂(1 - η₁η₂λ²/(1-λ²))]
Sudden death at η₁η₂ < λ²/(1+λ²)

**Phase diffusion (FCR)**:
Random phase kicks Δφ_FCR from carrier fluctuations
Coherence decay: ⟨a^†(t) a(0)⟩ = exp(-t/T₂)
T₂⁻¹ = (dφ/dN)² S_N(0)
S_N(0) = 2N τ_c (carrier noise spectrum)

#### 2.9.6 Temperature Dependence

**Raman scattering**:
n_th = 1/(exp(ħΩ_R/k_BT) - 1)
At 4K: n_th ≈ 10⁻⁸ (negligible)
At 300K: n_th ≈ 0.08
Anti-Stokes/Stokes ratio: n_th/(n_th+1) ≈ 0.07 at 300K

**TPA/FCA**:
β_TPA: weak T dependence (bandgap change)
τ_c: decreases with T (Auger recombination ∝ T³/²)
FCA cross-section: weak T dependence

**Free-carrier lifetime**:
τ_c⁻¹ = τ_rad⁻¹ + τ_Auger⁻¹ + τ_SRH⁻¹ + τ_surf⁻¹
At 300K: τ_Auger dominates for N > 10¹⁷ cm⁻³
At 4K: τ_SRH (defects) dominates

#### 2.9.7 Material Engineering for Reduced Decoherence

**Silicon Nitride (Si₃N₄)**:
- Bandgap: 5 eV → no TPA at 1550 nm
- No FCA (no free carriers generated)
- Raman gain: g_R ≈ 0.7 cm/GW (lower)
- Kerr nonlinearity: n₂ ≈ 2.4×10⁻¹⁹ m²/W (10× lower)
- Q > 10⁶ demonstrated
- Best for quantum photonics

**Hybrid Silicon/SiN**:
- Si for active devices (modulators, detectors)
- SiN for quantum circuits (sources, routing)
- Adiabatic tapers for low-loss coupling

**III-V on Silicon**:
- InGaAsP quantum wells for gain
- No TPA in active region (bandgap engineered)
- Electrically pumped
- Heterogeneous integration challenges

**Diamond/SiC platforms**:
- Wide bandgap (5.5 eV / 3.2 eV)
- Color centers for single-photon emission
- No TPA/FCA at telecom
- Hard to integrate with CMOS

#### 2.9.8 Experimental Decoherence Characterization

**Squeezing measurement**:
Homodyne detection of Var(X_θ)
Measure r_meas vs. P_pump
Extract TPA/FCA parameters

**Photon pair CAR**:
CAR = R_coinc / (R_singles_s × R_singles_i × τ_c)
Degradation with pump power reveals TPA/FCA

**Quantum process tomography**:
Characterize channel χ-matrix
Extract Kraus operators for TPA/FCA

**Hong-Ou-Mandel visibility**:
V = 1 - 2 P_c(0)
Degradation with power → decoherence rate

#### 2.9.9 Mitigation Strategies in Circuit Design

1. **Low-power operation**: Stay below TPA threshold
2. **Pulsed operation**: Low duty cycle, high peak power
3. **Reverse-biased p-i-n**: Sweep carriers in <100 ps
4. **Dispersion engineering**: Phase match away from TPA resonance
5. **Quantum error correction**: Encode in decoherence-free subspaces
6. **Material choice**: SiN for passive quantum circuits

#### 2.9.10 Fundamental Limits and Trade-offs

**Nonlinear figure of merit**:
FOM = n₂ / (β_TPA λ) = (4.5×10⁻¹⁸) / (5×10⁻¹² × 1.55×10⁻⁶) ≈ 0.58
For SiN: n₂ ≈ 2.4×10⁻¹⁹, β_TPA ≈ 0 → FOM → ∞

**Quantum noise limit**:
Minimum added noise for phase-insensitive amplifier: 1/2 photon
FWM with TPA: adds > 1/2 photon
Quantum-limited parametric amplifier requires no TPA

**Energy-per-bit limit**:
E_bit > ħω (quantum limit)
With TPA/FCA: E_bit > 100 ħω (practical)

---

*End of Piece 9. Next: Piece 10 - Quantum Error Correction Codes for Photonic Quantum Computing*