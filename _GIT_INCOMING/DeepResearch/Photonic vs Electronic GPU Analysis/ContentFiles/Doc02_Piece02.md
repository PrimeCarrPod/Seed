# Document 2: Photon Statistics and Quantum Optical Computing
## Piece 2: Coherent State Representation and Glauber-Sudarshan P-Function

---

### 2.2 Coherent State Representation and Glauber-Sudarshan P-Function

Coherent states are the quantum states most closely resembling classical electromagnetic waves. They are eigenstates of the annihilation operator and form an overcomplete basis for the Hilbert space. The Glauber-Sudarshan P-representation provides a powerful quasi-probability distribution for quantum states.

#### 2.2.1 Coherent States: Definition and Properties

A coherent state |α⟩ is defined as the eigenstate of the annihilation operator:

a |α⟩ = α |α⟩

where α ∈ ℂ is a complex amplitude. In the Fock basis:

|α⟩ = e^{-|α|²/2} Σ_{n=0}^∞ (αⁿ/√n!) |n⟩

Key properties:
1. **Poissonian photon statistics**: P(n) = e^{-|α|²} |α|^{2n}/n!
2. **Minimum uncertainty**: ΔX₁ ΔX₂ = 1/4 (saturates Heisenberg)
3. **Displaced vacuum**: |α⟩ = D(α) |0⟩ where D(α) = exp(α a^† - α* a)
4. **Overcompleteness**: ∫ |α⟩⟨α| d²α/π = I
5. **Temporal evolution**: |α⟩ → |α e^{-iωt}⟩ (remains coherent)

The complex amplitude α relates to classical field amplitude:
α = √(n̄) e^{iθ}
where n̄ = ⟨N⟩ = |α|² is mean photon number, θ is phase.

#### 2.2.2 Quadrature Operators and Phase Space

The quadrature operators (dimensionless):

X₁ = (a + a^†)/2 = (1/2) cos(θ) amplitude quadrature
X₂ = (a - a^†)/(2i) = (1/2) sin(θ) phase quadrature

Commutation: [X₁, X₂] = i/2

For coherent state |α⟩:
⟨X₁⟩ = Re(α)/2, ⟨X₂⟩ = Im(α)/2
Var(X₁) = Var(X₂) = 1/4

The Wigner function is a Gaussian in phase space:
W(X₁, X₂) = (2/π) exp[-2(X₁ - Re(α)/2)² - 2(X₂ - Im(α)/2)²]

#### 2.2.3 Glauber-Sudarshan P-Representation

Any density operator ρ can be written as:

ρ = ∫ P(α) |α⟩⟨α| d²α

where P(α) is the P-function (quasi-probability distribution). For classical states, P(α) is a true probability distribution (non-negative). For non-classical states, P(α) can be negative or singular.

Examples:
- **Coherent state**: P(α) = δ²(α - α₀)
- **Thermal state**: P(α) = (1/π n̄) exp(-|α|²/n̄)
- **Fock state |n⟩**: P(α) = (1/π n!) ∂^{2n}/∂α^n ∂α*^n δ²(α) (highly singular)
- **Squeezed state**: P(α) involves derivatives of delta function

The P-function is useful for normally-ordered expectation values:
⟨a^†ᵐ aⁿ⟩ = ∫ α*ᵐ αⁿ P(α) d²α

#### 2.2.4 Wigner Function and Husimi Q-Function

Alternative quasi-probability distributions:

**Wigner function** (symmetric ordering):
W(α) = (2/π) Tr[ρ D(α) (-1)^{a^†a} D^†(α)]

Properties:
- Real, normalized: ∫ W(α) d²α = 1
- Marginals give quadrature probabilities
- Can be negative (non-classicality witness)

**Husimi Q-function** (anti-normal ordering):
Q(α) = ⟨α|ρ|α⟩/π

Properties:
- Always non-negative: Q(α) ≥ 0
- Smoothed version of Wigner: Q = W * (2/π) e^{-2|α|²}
- Q(α) = 0 for Fock states at α=0

**P-function** (normal ordering):
P(α) = ⟨-α|ρ|α⟩/π (formally)

Relationship: Q = P * (2/π) e^{-2|α|²} = W * (2/π) e^{-2|α|²}

#### 2.2.5 Photon Number Statistics: Mandel Q-Parameter

The Mandel Q-parameter quantifies deviation from Poissonian statistics:

Q = (⟨N²⟩ - ⟨N⟩²)/⟨N⟩ - 1 = (Var(N) - ⟨N⟩)/⟨N⟩

- Q = 0: Poissonian (coherent state)
- Q > 0: Super-Poissonian (thermal, bunched)
- Q < 0: Sub-Poissonian (antibunched, non-classical)

For thermal state: Q = n̄
For Fock state |n⟩: Q = -1 + 1/n
For squeezed vacuum: Q = -1/2 + sinh²(r) (can be sub-Poissonian)

#### 2.2.6 Second-Order Coherence: g⁽²⁾(τ)

The normalized intensity correlation function:

g⁽²⁾(τ) = ⟨a^†(t) a^†(t+τ) a(t+τ) a(t)⟩ / ⟨a^† a⟩²

At zero delay:
g⁽²⁾(0) = ⟨a^† a^† a a⟩ / ⟨a^† a⟩² = (⟨N²⟩ - ⟨N⟩) / ⟨N⟩² = 1 + Q/⟨N⟩

- g⁽²⁾(0) = 1: Coherent state (random)
- g⁽²⁾(0) > 1: Bunching (thermal: g⁽²⁾(0) = 2)
- g⁽²⁾(0) < 1: Antibunching (non-classical, single-photon: g⁽²⁾(0) = 0)

For chaotic light: g⁽²⁾(τ) = 1 + |g⁽¹⁾(τ)|²
where g⁽¹⁾(τ) = ⟨a^†(t) a(t+τ)⟩ / ⟨a^† a⟩ is first-order coherence.

#### 2.2.7 Hong-Ou-Mandel Interference

Two identical photons incident on a 50:50 beam splitter exhibit perfect bunching:

|1⟩_a |1⟩_b → (i/√2) (|2⟩_c |0⟩_d + |0⟩_c |2⟩_d)

The coincidence probability at zero delay:
P_c(0) = 0 (perfect destructive interference)

With temporal distinguishability Δτ:
P_c(Δτ) = (1/2) [1 - exp(-(Δτ/τ_c)²)] for Gaussian wavepackets

The HOM dip visibility:
V = 1 - P_c(0)/P_c(∞)

Measures photon indistinguishability. For ideal single photons: V = 1.

#### 2.2.8 Photon Statistics in Silicon Photonics

In silicon waveguides, photon statistics are modified by:

1. **TPA-induced noise**: TPA generates correlated photon pairs (FWM)
   Creates twin beams with g⁽²⁾(0) < 1 (sub-Poissonian)

2. **Free-carrier noise**: Random carrier generation adds phase noise
   Increases g⁽²⁾(τ) at long delays

3. **Raman scattering**: Spontaneous Raman adds thermal-like noise
   g⁽²⁾(0) ≈ 2 for spontaneous Stokes

4. **Laser noise**: RIN (relative intensity noise) transfers to photons
   Coherent state → excess classical noise

5. **Quantum dot emitters**: Single-photon sources with g⁽²⁾(0) < 0.5
   Key for quantum computing on silicon photonics

#### 2.2.9 Measurement of Photon Statistics

**Hanbury Brown-Twiss (HBT) setup**:
- 50:50 beam splitter
- Two single-photon detectors (SPADs, SNSPDs)
- Time-correlated single-photon counting (TCSPC)
- Measures g⁽²⁾(τ)

**Homodyne detection**:
- Local oscillator (LO) at same frequency
- Balanced photodiodes
- Measures quadrature distributions
- Reconstructs Wigner function via tomography

**Photon-number-resolving detectors (PNRDs)**:
- Transition-edge sensors (TES)
- Superconducting nanowires (SNSPDs) with photon-number resolution
- Direct P(n) measurement

#### 2.2.10 Applications in Optical Computing

Coherent states and their statistics are crucial for:
- **CV-QKD**: Continuous-variable quantum key distribution using coherent states
- **Boson sampling**: Sub-Poissonian sources for quantum advantage
- **Gaussian boson sampling**: Squeezed states for near-term quantum computing
- **Error correction**: Cat codes (superpositions of coherent states) for bosonic QEC
- **Neuromorphic photonics**: Photon statistics affect ONN inference noise

---

*End of Piece 2. Next: Piece 3 - Photon Number Statistics: Poissonian, Sub-Poissonian, Super-Poissonian*