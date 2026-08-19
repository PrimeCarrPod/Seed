# Document 2: Photon Statistics and Quantum Optical Computing
## Piece 4: Squeezed Vacuum States for Quantum-Enhanced Sensing

---

### 2.4 Squeezed Vacuum States for Quantum-Enhanced Sensing

Squeezed states are minimum-uncertainty states with reduced quantum noise in one quadrature at the expense of increased noise in the conjugate quadrature. They are essential for quantum-enhanced metrology, gravitational wave detection, and quantum computing with continuous variables.

#### 2.4.1 Squeezing Operator and Squeezed Vacuum

The single-mode squeezing operator:

S(ξ) = exp(½(ξ* a² - ξ a^†²))

where ξ = r e^{iφ} is the complex squeezing parameter (r = squeezing magnitude, φ = squeezing angle).

Action on vacuum:
|ξ⟩ = S(ξ)|0⟩ = (1/√cosh r) Σ_{n=0}^∞ [√((2n)!)/(2^n n!)] (e^{iφ} tanh r)^n |2n⟩

Only even photon numbers are populated.

#### 2.4.2 Quadrature Variances

Define rotated quadratures:

X_θ = (a e^{-iθ} + a^† e^{iθ})/2

For squeezed vacuum |ξ⟩ with ξ = r e^{iφ}:

Var(X_θ) = (1/4)[cosh(2r) - sinh(2r) cos(2θ - φ)]

Minimum variance at θ = φ/2:
Var_min = (1/4) e^{-2r}

Maximum variance at θ = φ/2 + π/2:
Var_max = (1/4) e^{+2r}

Product: Var_min × Var_max = 1/16 (saturates uncertainty principle)

Squeezing level in dB:
S_dB = -10 log₁₀(e^{-2r}) = 8.686 r

For 10 dB squeezing: r ≈ 1.15, Var_min ≈ 0.01/4

#### 2.4.3 Squeezed Coherent States

Displaced squeezed state:
|α, ξ⟩ = D(α) S(ξ) |0⟩

Mean field: ⟨a⟩ = α
Quadrature variances unchanged from squeezed vacuum.

Photon number statistics:
⟨N⟩ = |α|² + sinh²r
Var(N) = |α|²(e^{2r} cos²θ + e^{-2r} sin²θ) + 2 sinh²r cosh²r

For θ = 0 (amplitude squeezing):
Var(N) = |α|² e^{-2r} + 2 sinh²r cosh²r
Can be sub-Poissonian: Var(N) < ⟨N⟩

For θ = π/2 (phase squeezing):
Var(N) = |α|² e^{+2r} + 2 sinh²r cosh²r
Super-Poissonian

#### 2.4.4 Generation of Squeezed States

**Optical Parametric Amplification (OPA)**:
Pump at ω_p → signal ω_s + idler ω_i
Below threshold: squeezed vacuum
Above threshold: optical parametric oscillator (OPO)

Hamiltonian: H = iħχ (a_s^† a_i^† a_p - a_s a_i a_p^†)
With strong pump: a_p → α_p (classical)
H_eff = iħg (a_s^† a_i^† - a_s a_i)
Solution: Two-mode squeezing

**Four-Wave Mixing (FWM) in Silicon**:
Silicon waveguides: χ⁽³⁾ nonlinearity
Pump at ω_p → Stokes ω_s + anti-Stokes ω_as
Phase matching: 2β_p = β_s + β_as
Broadband squeezing (100+ nm bandwidth)
Limited by TPA and FCA at high power

**Josephson Parametric Amplifier (JPA)**:
Superconducting circuit, microwave frequencies
Quantum-limited amplification
Squeezing > 20 dB demonstrated

**Kerr nonlinearity in microresonators**:
Continuous-wave pump in high-Q resonator
Microcomb generation with squeezing
Integrated on silicon photonics platform

#### 2.4.5 Squeezing in Silicon Photonics

Silicon-specific challenges:

1. **Two-Photon Absorption (TPA)**:
   β_TPA ≈ 0.5 cm/GW at 1550 nm
   Generates free carriers → FCA, FCR
   Limits maximum pump power

2. **Free-Carrier Effects**:
   Carrier lifetime τ_c ≈ 1 ns (unpinched)
   Pinched diodes: τ_c ≈ 10-100 ps
   FCA adds loss: α_FCA = 1.45×10⁻¹⁷ N_e + 1.35×10⁻¹⁷ N_h (cm⁻¹)
   FCR changes phase: Δn = -8.8×10⁻²² N_e - 8.5×10⁻¹⁸ N_h

3. **Raman Scattering**:
   Competes with FWM
   Raman gain g_R ≈ 10 cm/GW
   Stokes shift 15.6 THz

4. **Phase Matching**:
   Waveguide dispersion engineering
   2β_p(ω_p) = β_s(ω_s) + β_i(ω_i)
   Quasi-phase matching not available in Si (no χ⁽²⁾)

Best demonstrated squeezing in Si waveguides: ~3-5 dB
In SiN waveguides (no TPA): >10 dB
Hybrid Si/SiN or III-V on Si: >15 dB

#### 2.4.6 Squeezing for Interferometric Sensing

Mach-Zehnder interferometer with squeezed vacuum injection:

Standard input: |α⟩_a |0⟩_b (coherent + vacuum)
Squeezed input: |α⟩_a |ξ⟩_b (coherent + squeezed vacuum)

Phase sensitivity:
Coherent + vacuum: Δφ = 1/√n̄ (SQL)
Coherent + squeezed: Δφ = √(e^{-2r} cos²θ + e^{2r} sin²θ)/√n̄

Optimal squeezing angle: θ = 0 (amplitude squeezing)
Δφ_min = e^{-r}/√n̄ = e^{-r} Δφ_SQL

For 10 dB squeezing (r=1.15): Δφ improved by 3.16×
Gravitational wave detectors (LIGO): 10-15 dB squeezing planned

#### 2.4.7 Quantum Fisher Information for Phase Estimation

For a pure state |ψ(φ)⟩ = U(φ)|ψ⟩ with U(φ) = exp(-iφ G):

Quantum Fisher Information:
F_Q = 4(⟨G²⟩ - ⟨G⟩²) = 4 Var(G)

For interferometer: G = (a^†_a a_a - a^†_b a_b)/2 = J_z

**Coherent state**: F_Q = n̄ → Δφ ≥ 1/√n̄
**Squeezed vacuum**: F_Q = 4 sinh²r cosh²r = n̄(n̄+2) → Δφ ≥ 1/√(n̄(n̄+2))
**Fock state |n⟩**: F_Q = n² → Δφ ≥ 1/n (Heisenberg limit)
**NOON state**: F_Q = n² → Δφ ≥ 1/n
**Two-mode squeezed vacuum**: F_Q = 4 n̄(n̄+1) → Δφ ≥ 1/√(n̄(n̄+1))

#### 2.4.8 Squeezing in Microring Resonators

Microring resonators enhance nonlinear interactions:

Quality factor Q = ω/κ ≈ 10⁵-10⁶
Field enhancement: |E|² ∝ Q²
Effective nonlinearity: γ_eff = γ Q² / V_eff

Squeezing in microrings:
- Pump at resonance
- Signal/idler at adjacent resonances
- Phase matching via dispersion engineering
- Bandwidth limited by cavity linewidth κ

Demonstrated: 3-5 dB in Si rings, >10 dB in SiN rings

#### 2.4.9 Squeezed States for Quantum Computing

**Continuous-Variable (CV) Quantum Computing**:
Qubits encoded in infinite-dimensional Hilbert space
Gaussian operations: displacement, squeezing, rotation, beam splitters
Non-Gaussian operation needed for universality (cubic phase gate)

**Cluster states for measurement-based QC**:
CV cluster states from squeezed light + beam splitters
Large-scale entangled states for one-way quantum computing
Scalable in frequency/time domains (multiplexing)

**Gaussian Boson Sampling (GBS)**:
Sample from distribution of squeezed states through interferometer
Quantum advantage demonstrated with 50-100 modes
Photon-number-resolving detection required

**Error-corrected CVQC**:
GKP states (grid states) correct displacement errors
Cat codes correct photon loss
Concatenated codes for fault tolerance

#### 2.4.10 Squeezing Degradation and Detection

**Detection: Balanced Homodyne**
Local oscillator (LO) at same frequency
Phase θ scanned to measure Var(X_θ)
Requires mode matching > 99%, LO power >> signal

**Squeezing degradation sources**:
- Optical loss: η < 1 → Var_meas = η Var_squeezed + (1-η)/4
  10 dB squeezing with 50% loss → 3 dB measured
- Phase noise: Δφ_LO mixes quadratures
- Electronic noise: Johnson-Nyquist, amplifier noise
- TPA/FCA in silicon: adds thermal noise

**Verification of genuine squeezing**:
- Measure Var(X_θ) < 1/4 for some θ
- Check uncertainty product Var(X)Var(P) ≥ 1/16
- Tomography: reconstruct Wigner function, check negativity

---

*End of Piece 4. Next: Piece 5 - Hong-Ou-Mandel Interference and Photon Indistinguishability*