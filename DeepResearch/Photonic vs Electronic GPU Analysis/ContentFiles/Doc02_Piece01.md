# Document 2: Photon Statistics and Quantum Optical Computing
## Piece 1: Second Quantization of Electromagnetic Field in Dielectric Waveguides

---

### 2.1 Second Quantization of Electromagnetic Field in Dielectric Waveguides

The quantum description of light in photonic integrated circuits requires second quantization of the electromagnetic field in the presence of dielectric media. This forms the foundation for understanding photon statistics, quantum noise, and quantum information processing in silicon photonics.

#### 2.1.1 Classical Field Quantization in Homogeneous Media

In free space, the vector potential A(r,t) is expanded in plane wave modes:

A(r,t) = Σ_{k,λ} √(ħ/2ε₀ω_k V) [a_{k,λ} ε_{k,λ} e^{i(k·r - ω_k t)} + h.c.]

where λ = 1,2 are polarization indices, ε_{k,λ} are polarization vectors, and a_{k,λ} are annihilation operators.

In a homogeneous dielectric with permittivity ε(ω) and permeability μ(ω), the mode expansion becomes:

A(r,t) = Σ_{k,λ} √(ħ/2ε₀ε_r ω_k V) [a_{k,λ} ε_{k,λ} e^{i(k·r - ω_k t)} + h.c.]

The Hamiltonian is H = Σ_{k,λ} ħω_k (a^†_{k,λ} a_{k,λ} + ½).

#### 2.1.2 Quantization in Inhomogeneous Dielectric Media

For waveguides with spatially varying ε(r), the mode expansion uses the classical normal modes:

A(r,t) = Σ_m √(ħ/2ω_m) [a_m E_m(r) e^{-iω_m t} + h.c.]

where E_m(r) are the classical mode profiles satisfying the vector Helmholtz equation:

∇ × (1/μ ∇ × E_m) - ω_m² ε(r) E_m = 0

with appropriate boundary conditions. The mode orthogonality condition:

∫ ε(r) E_m*(r) · E_n(r) d³r = δ_{mn}

ensures canonical commutation relations [a_m, a^†_n] = δ_{mn}.

#### 2.1.3 Silicon Waveguide Modes: Quasi-TE and Quasi-TM

In silicon-on-insulator (SOI) waveguides (core n_Si = 3.48, cladding n_SiO₂ = 1.44), the modes are hybrid but classified as:

- **Quasi-TE**: Dominant E_x (horizontal), H_y, H_z
- **Quasi-TM**: Dominant E_y (vertical), H_x, H_z

For a strip waveguide (width W, height H), the mode profiles are computed numerically (FEM, FDTD, mode solvers). The effective index n_eff = β/k₀ determines confinement.

Single-mode condition for 500×220 nm SOI waveguide at 1550 nm:
- TE₀: n_eff ≈ 2.4
- TM₀: n_eff ≈ 1.8
- TE₁, TM₁: cut off

#### 2.1.4 Quantization of Guided Modes

The guided mode expansion:

A(r,t) = Σ_{m,guided} √(ħ/2ω_m) [a_m E_m(x,y) e^{i(β_m z - ω_m t)} + h.c.]

plus radiation modes (continuum) and substrate modes.

The photon number operator for mode m:

N_m = a^†_m a_m

with eigenvalues n = 0, 1, 2, ...

The energy in mode m: E_m = ħω_m (N_m + ½).

#### 2.1.5 Field Operators at Specific Positions

The electric field operator at position r:

Ê(r) = i Σ_m √(ħω_m/2) [a_m E_m(r) - a^†_m E*_m(r)]

The magnetic field operator:

Ĥ(r) = Σ_m √(ħ/2ω_m) [a_m ∇ × E_m(r) + a^†_m ∇ × E*_m(r)]

These operators satisfy equal-time commutation relations:

[Ê_i(r), Ĥ_j(r')] = iħ ε_{ijk} ∂_k δ(r - r') / ε(r)

#### 2.1.6 Quantum Fluctuations and Vacuum Noise

Even in vacuum state |0⟩, fields have zero-point fluctuations:

⟨0|Ê²|0⟩ = (1/2) Σ_m ħω_m |E_m(r)|²

This vacuum noise is the fundamental limit for:
- Phase sensitivity in interferometers
- Amplifier noise figure
- Spontaneous emission rate (Purcell effect)

For a waveguide mode with power P, the photon flux:

Φ = P / ħω

The shot noise spectral density (photons/s/Hz):

S_Φ = Φ (coherent state)
S_Φ = Φ + 2Φ² (thermal state)

#### 2.1.7 Nonlinear Quantization: χ⁽²⁾ and χ⁽³⁾ Interactions

In nonlinear media, the Hamiltonian includes interaction terms:

H_int = - (ε₀/2) ∫ χ⁽³⁾ Ê⁴ d³r (for χ⁽³⁾ media like Si)

In silicon (centrosymmetric), χ⁽²⁾ = 0 in bulk, but surfaces/interfaces have χ⁽²⁾.

The third-order nonlinearity in modal basis:

H_int = ħ Σ_{ijkl} γ_{ijkl} a^†_i a^†_j a_k a_l

where γ_{ijkl} = (ω/4) ∫ χ⁽³⁾ E*_i · E*_j · E_k · E_l dA / (n_eff,i n_eff,j n_eff,k n_eff,l)

This describes:
- Four-wave mixing (FWM): i+j → k+l
- Self-phase modulation (SPM): i=j=k=l
- Cross-phase modulation (XPM): i=k, j=l

#### 2.1.8 Two-Photon Absorption (TPA) in Silicon

TPA is a loss mechanism where two photons are simultaneously absorbed:

H_TPA = iħ (β_TPA/2) Σ_{ijkl} a^†_i a^†_j a_k a_l

with β_TPA = 0.5-1 cm/GW at 1550 nm for silicon.

TPA generates free carriers (electrons/holes) which cause:
- Free-carrier absorption (FCA): α_FCA = σ_e N_e + σ_h N_h
- Free-carrier refraction (FCR): Δn = - (e²λ²/8π²c²ε₀n) (N_e/m_e + N_h/m_h)

These effects limit high-power operation in silicon photonics.

#### 2.1.9 Raman Scattering in Silicon Waveguides

Spontaneous Raman scattering is a quantum process where a pump photon creates a Stokes photon and a phonon:

H_Raman = ħ Σ_{q} g_q (a^†_p a_s b^†_q + a^†_p a_a b_q)

where a_p, a_s, a_a are pump, Stokes, anti-Stokes operators, and b_q is phonon operator.

The Raman gain in silicon:
g_R ≈ 10-20 cm/GW (pump at 1550 nm, Stokes shift 15.6 THz)

This enables silicon Raman lasers and amplifiers.

#### 2.1.10 Quantum Input-Output Theory for Waveguides

The input-output formalism (Gardiner-Collett) relates internal cavity modes to external waveguide fields:

da/dt = -i[H, a] - (κ/2) a + √κ a_in(t)
a_out(t) = a_in(t) + √κ a(t)

where κ is the coupling rate, a_in/out are input/output field operators.

This formalism is essential for:
- Cavity QED in photonic crystals
- Quantum networks with waveguide-coupled emitters
- Measurement and feedback control

---

*End of Piece 1. Next: Piece 2 - Coherent State Representation and Glauber-Sudarshan P-Function*