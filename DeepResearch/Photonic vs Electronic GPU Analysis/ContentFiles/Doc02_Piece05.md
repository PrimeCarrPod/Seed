# Document 2: Photon Statistics and Quantum Optical Computing
## Piece 5: Hong-Ou-Mandel Interference and Photon Indistinguishability

---

### 2.5 Hong-Ou-Mandel Interference and Photon Indistinguishability

Hong-Ou-Mandel (HOM) interference is a quintessential quantum phenomenon where two identical photons incident on a 50:50 beam splitter always exit together, never separately. This effect is central to linear optical quantum computing, quantum metrology, and characterization of single-photon sources.

#### 2.5.1 Beam Splitter Transformation

A lossless 50:50 beam splitter relates input modes a, b to output modes c, d:

c = (a + i b)/√2
d = (i a + b)/√2

or equivalently:
[c; d] = (1/√2) [1, i; i, 1] [a; b]

The transformation preserves commutation relations and is unitary.

#### 2.5.2 Two-Photon Input State

For two identical photons, one in each input port:

|ψ_in⟩ = a^† b^† |0⟩_a |0⟩_b = |1⟩_a |1⟩_b

Applying the beam splitter transformation:

a^† = (c^† - i d^†)/√2
b^† = (-i c^† + d^†)/√2

|ψ_out⟩ = (1/2) (c^† - i d^†)(-i c^† + d^†) |0⟩
       = (1/2) [-i c^†² + c^† d^† - d^† c^† + i d^†²] |0⟩
       = (1/2) [-i (c^†² - d^†²)] |0⟩  (since [c^†, d^†] = 0)

= -i/√2 (|2⟩_c |0⟩_d + |0⟩_c |2⟩_d) / √2
= -i/√2 (|2,0⟩ + |0,2⟩)

The |1,1⟩ term cancels exactly! This is perfect destructive interference.

#### 2.5.3 HOM Dip: Coincidence Probability

The probability of coincidence detection (one photon in each output):

P_c = |⟨1,1|ψ_out⟩|² = 0

With temporal delay τ between photons:

|ψ_in(τ)⟩ = ∫ dt₁ dt₂ φ(t₁) φ(t₂-τ) a^†(t₁) b^†(t₂) |0⟩

For Gaussian wavepackets: φ(t) = (2πσ²)^{-1/4} e^{-t²/4σ²}

The coincidence probability:

P_c(τ) = (1/2) [1 - |∫ φ*(t) φ(t-τ) dt|²]
       = (1/2) [1 - exp(-τ²/4σ²)]

HOM dip visibility:
V = 1 - P_c(0)/P_c(∞) = 1

For distinguishable photons (τ ≫ σ): P_c = 1/2 (classical)
For identical photons (τ = 0): P_c = 0 (quantum)

#### 2.5.4 Photon Indistinguishability and Wavepacket Overlap

For non-identical photons with wavepackets φ₁(t), φ₂(t):

P_c(0) = (1/2) [1 - |⟨φ₁|φ₂⟩|²]

where ⟨φ₁|φ₂⟩ = ∫ φ₁*(t) φ₂(t) dt is the wavepacket overlap.

The indistinguishability:
I = |⟨φ₁|φ₂⟩|² = 1 - 2 P_c(0)

For pure states: I = 1 (perfect), P_c = 0
For mixed states: I < 1, P_c > 0

Sources of distinguishability:
- Temporal delay
- Spectral mismatch
- Spatial mode mismatch
- Polarization mismatch
- Spectral diffusion (random frequency jumps)
- Pure dephasing (homogeneous broadening)

#### 2.5.5 Spectral and Temporal Indistinguishability

For photons with spectral amplitudes ψ₁(ω), ψ₂(ω):

I = |∫ ψ₁*(ω) ψ₂(ω) dω|²

For Lorentzian spectra (homogeneous broadening):
ψ(ω) ∝ 1/(ω - ω₀ + iΓ/2)
Overlap with detuning Δ: I = Γ²/(Γ² + Δ²)

For Gaussian spectra (inhomogeneous broadening):
ψ(ω) ∝ exp(-(ω-ω₀)²/4σ²)
Overlap with detuning Δ: I = exp(-Δ²/8σ²)

Time-bandwidth product:
Δν · τ_c ≈ 0.44 (transform-limited Gaussian)
For Fourier-transform limited pulses, temporal and spectral indistinguishability are equivalent.

#### 2.5.6 Multi-Photon HOM Interference

For N photons in an M×M interferometer:

Generalized HOM effect: boson sampling
Output probabilities related to matrix permanents
#P-hard to compute classically

For N=3 photons in tritter (3×3):
Input: |1,1,1⟩
Output: Complex interference pattern

For N photons in N×N Fourier transform interferometer:
All photons bunch into same output with probability 1/N!

#### 2.5.7 HOM with Imperfect Beam Splitters

For beam splitter with reflectivity R ≠ 0.5:

c = √R a + i√(1-R) b
d = i√(1-R) a + √R b

Coincidence for identical photons:
P_c = 2R(1-R) (minimum at R=0.5: P_c = 0.5)
Wait - for R=0.5: P_c = 2(0.5)(0.5) = 0.5? No!

Correct: P_c = (1-2R(1-R))²? Let's recalculate:

|ψ_out⟩ = [√R c^† + i√(1-R) d^†] [i√(1-R) c^† + √R d^†] |0⟩
= [i√R(1-R) c^†² + (R - (1-R)) c^† d^† + i√R(1-R) d^†²] |0⟩
= [i√R(1-R) c^†² + (2R-1) c^† d^† + i√R(1-R) d^†²] |0⟩

P_c = |2R-1|²

For R=0.5: P_c = 0 (perfect HOM)
For R=0 or 1: P_c = 1 (no interference)

For small deviation δ = R - 0.5:
P_c ≈ 4δ²

#### 2.5.8 HOM in Silicon Photonics

**Integrated beam splitters**:
- MMI couplers: 2×2 MMI with 50:50 splitting
- Directional couplers: κL = π/4 for 50:50
- Phase errors: δφ in MMI causes imbalance

**HOM visibility in silicon**:
- Best reported: V > 0.98 (SiN)
- Silicon: V ≈ 0.9-0.95 (limited by TPA, FCA, fabrication)
- Quantum dot sources on Si: V ≈ 0.8-0.9

**Applications in silicon photonics**:
- Characterization of single-photon sources
- Linear optical quantum gates (CNOT via HOM)
- Boson sampling with integrated circuits
- Quantum key distribution (MDI-QKD)

#### 2.5.9 HOM for Quantum State Characterization

**Density matrix reconstruction**:
HOM with varying delay + phase gives two-photon density matrix
ρ = ∫ dτ P_c(τ) |τ⟩⟨τ|

**Entanglement witness**:
Two-photon entangled state |ψ⟩ = (|H⟩|V⟩ + |V⟩|H⟩)/√2
HOM with polarizers measures entanglement fidelity

**Gaussian state characterization**:
HOM of squeezed states reveals covariance matrix
Two-mode squeezing measured via HOM-like interference

**Non-Gaussianity test**:
HOM of Fock states vs. coherent states
Distinguishes quantum from classical light

#### 2.5.10 HOM in Quantum Computing Architectures

**Linear Optical Quantum Computing (LOQC)**:
KNL protocol: HOM + feedforward + single-photon sources
CNOT gate success probability: 1/9 (with 2 ancilla photons)
Improved: 2/27 (with 3 ancilla), near-deterministic with fusion

**Fusion gates for cluster states**:
Type-I fusion: HOM measurement on two cluster state photons
Success probability: 1/2
Type-II fusion: Polarizing beam splitter + HOM
Success probability: 1/2

**Boson Sampling**:
N identical photons in M×M interferometer
Output distribution ∝ |Perm(U_S)|²
Quantum advantage: N=50, M=100

**Quantum Repeaters**:
HOM Bell-state measurement for entanglement swapping
Success probability: 1/2 (with linear optics)
Deterministic with quantum memories

---

*End of Piece 5. Next: Piece 6 - Quantum Cramér-Rao Bound for Phase Estimation in MZIs*