# Document 2: Photon Statistics and Quantum Optical Computing
## Piece 7: Entanglement Generation via Four-Wave Mixing in Silicon Waveguides

---

### 2.7 Entanglement Generation via Four-Wave Mixing in Silicon Waveguides

Four-wave mixing (FWM) in silicon waveguides is a primary mechanism for generating photon pairs and entangled states on-chip. The third-order nonlinearity χ⁽³⁾ of silicon enables spontaneous FWM (SFWM) for quantum light generation, but is accompanied by two-photon absorption (TPA) and free-carrier effects that limit performance.

#### 2.7.1 FWM Hamiltonian in Silicon Waveguides

The third-order nonlinear polarization:

P⁽³⁾(ω) = ε₀ χ⁽³⁾ E(ω₁) E(ω₂) E(ω₃)

For degenerate FWM with two pump photons at ω_p:
ω_s + ω_i = 2ω_p (energy conservation)

The interaction Hamiltonian in the waveguide:

H_int = (ε₀/4) ∫ χ⁽³⁾ Ê⁺ Ê⁺ Ê⁻ Ê⁻ d³r

In modal basis with strong classical pump (α_p):
H_FWM = iħγ (a^†_s a^†_i a_p a_p - h.c.)

where γ = (ω n₂)/c A_eff is the nonlinear parameter.

For silicon at 1550 nm:
n₂ ≈ 4.5×10⁻¹⁸ m²/W
A_eff ≈ 0.1-0.3 μm² (strip waveguide)
γ ≈ 200-500 W⁻¹m⁻¹

#### 2.7.2 Phase Matching Condition

Wavevector conservation:
2β(ω_p) = β(ω_s) + β(ω_i) + Δβ

where Δβ includes nonlinear phase shift:
Δβ = 2γ P_p - γ (P_s + P_i)

For spontaneous FWM (P_s, P_i ≈ 0):
Δβ = 2γ P_p

Dispersion relation expansion around ω_p:
β(ω) ≈ β_p + β₁(ω-ω_p) + ½β₂(ω-ω_p)² + ⅙β₃(ω-ω_p)³

Phase mismatch for symmetric signal/idler (ω_s,i = ω_p ± Ω):
Δβ(Ω) = β₂ Ω² + β₄ Ω⁴/12 + ... - 2γ P_p

Zero-dispersion wavelength (ZDW): β₂ = 0
In silicon strip waveguides: ZDW ≈ 1300-1500 nm (geometry dependent)

#### 2.7.3 Spontaneous FWM: Photon Pair Generation

With strong pump, the Heisenberg equations for signal/idler:

da_s/dz = iγ a_p² a^†_i e^{iΔβ z}
da^†_i/dz = -iγ a_p^*² a_s e^{-iΔβ z}

Solution for undepleted pump (a_p constant):
a_s(L) = a_s(0) cosh(gL) + i a^†_i(0) sinh(gL) e^{iΔβ L}

where g = √((γ P_p)² - (Δβ/2)²) is the gain coefficient.

For vacuum input (spontaneous):
⟨a^†_s a_s⟩ = sinh²(gL)
⟨a^†_i a_i⟩ = sinh²(gL)

Two-mode squeezed vacuum state:
|ψ⟩ = √(1-λ²) Σ_{n=0}^∞ λⁿ |n⟩_s |n⟩_i

with λ = tanh(gL) e^{iΔβ L/2}

Pair generation rate:
R = (γ P_p)² L² / (1 + (Δβ L/2)²)  (low gain)
R = (1/4) e^{2gL} / τ_p  (high gain, pulsed pump)

#### 2.7.4 Two-Photon Absorption (TPA) in Silicon

TPA coefficient at 1550 nm: β_TPA ≈ 0.5 cm/GW = 5×10⁻¹² m/W

TPA generates electron-hole pairs:
dN_c/dt = (β_TPA/2ħω) ∫ |E|⁴ dA

Free-carrier density N_c = N_e = N_h (assuming no doping)

Free-carrier absorption (FCA):
α_FCA = σ_e N_e + σ_h N_h
σ_e = 1.45×10⁻¹⁷ cm², σ_h = 1.35×10⁻¹⁷ cm² (at 1550 nm)

Free-carrier refraction (FCR):
Δn_FCR = - (e²λ²/8π²c²ε₀n) (N_e/m_e + N_h/m_h)
= -8.8×10⁻²² N_e - 8.5×10⁻¹⁸ N_h (cm³)

These effects:
1. Reduce pump power along waveguide
2. Add loss for signal/idler
3. Cause nonlinear phase shift (Δβ_FCR)
4. Limit maximum pair generation rate

#### 2.7.5 Mitigation Strategies for TPA/FCA

1. **Reverse-biased p-i-n diodes** (carrier sweep-out):
   Apply reverse voltage V_R > 5V across waveguide
   Depletion region sweeps carriers in ~10-100 ps
   Reduces τ_c from ~1 ns to < 100 ps
   FCA reduced by 10-100×

2. **Pulsed pumping with low duty cycle**:
   Peak power high, average power low
   Allows carriers to recombine between pulses
   Duty cycle < τ_c / T_rep

3. **Hydrogenated amorphous silicon (a-Si:H)**:
   Larger bandgap (1.7 eV) → no TPA at 1550 nm
   Lower n₂ (≈ 2×10⁻¹⁸ m²/W)
   Trade-off: lower nonlinearity

4. **Silicon Nitride (SiN) waveguides**:
   No TPA at 1550 nm (bandgap 5 eV)
   n₂ ≈ 2.4×10⁻¹⁹ m²/W (10× lower than Si)
   Q > 10⁶ resonators enhance interaction
   Demonstrated: >10 dB squeezing, high-purity photons

5. **Hybrid III-V on Silicon**:
   InGaAsP/InP for gain, Si for routing
   Electrically pumped, no TPA in active region

#### 2.7.6 Spectral Properties and Purity

**Joint Spectral Amplitude (JSA)**:
Φ(ω_s, ω_i) = α(ω_s+ω_i) φ(ω_s, ω_i)

where α(ω) = pump envelope, φ(ω_s, ω_i) = phase matching function.

**Heralded photon purity**:
P = Tr(ρ_h²) = ∫ |Φ(ω_s, ω_i)|⁴ dω_s dω_i / (∫ |Φ|² dω_s dω_i)²

For factorable JSA (Φ(ω_s, ω_i) = f(ω_s)g(ω_i)): P = 1
For correlated JSA: P < 1

**Engineering factorable JSA**:
- Pump bandwidth matching phase matching bandwidth
- Dispersion engineering: β₃ = 0 at pump
- Chirped pump pulses
- Gaussian pump + Gaussian phase matching → factorable

#### 2.7.7 Entanglement Types from FWM

**Energy-Time Entanglement**:
Pump pulse shorter than coherence time
|ψ⟩ = ∫ dω Φ(ω) |ω⟩_s |2ω_p - ω⟩_i
Measured via Franson interferometer

**Polarization Entanglement**:
Two orthogonally polarized pumps (or one pump + polarization diversity)
Type-II phase matching
|ψ⟩ = (|H⟩_s |V⟩_i + |V⟩_s |H⟩_i)/√2

**Path Entanglement**:
Two parallel waveguides with coupling
|ψ⟩ = (|1⟩_a |0⟩_b + |0⟩_a |1⟩_b)/√2
For N00N states: |ψ⟩ = (|N⟩_a |0⟩_b + |0⟩_a |N⟩_b)/√2

**Frequency-Bin Entanglement**:
Multiple frequency modes from microcomb
|ψ⟩ = Σ_k c_k |ω_k⟩_s |ω_{-k}⟩_i
High-dimensional entanglement (qudits)

#### 2.7.8 Experimental Performance in Silicon

**Pair generation rates**:
- CW pump: ~10⁶ pairs/s/mW² (low gain)
- Pulsed (100 MHz, 100 fs): ~10⁷ pairs/s/mW (peak)
- With p-i-n: 10× higher peak power possible

**Coincidence-to-accidental ratio (CAR)**:
CAR = R_coinc / (R_s R_i τ_c)
Typical: 10-100 (CW), 100-1000 (pulsed, low power)
Limited by: Raman noise, dark counts, multi-pair emission

**Heralded single-photon purity**:
- Silicon strip waveguide: P ≈ 0.7-0.85 (correlated JSA)
- Dispersion-engineered: P ≈ 0.9-0.95
- SiN microrings: P > 0.99

**Indistinguishability (HOM visibility)**:
V ≈ 0.9-0.95 (silicon)
V > 0.98 (SiN, quantum dots)

#### 2.7.9 FWM in Microring Resonators

High-Q resonators enhance FWM:
Field enhancement ∝ Q
Effective interaction length ∝ Q
Pair rate ∝ Q² (for same pump power)

Resonance condition: mλ = n_eff L
Signal/idler on adjacent resonances:
ω_s = ω_p + D₁ + D₂/2 + ...
ω_i = ω_p - D₁ + D₂/2 - ...

where D₁ = FSR, D₂ = GVD.

**Microcomb generation**:
Above threshold: parametric oscillation
Kerr comb with coherent frequency spacing
Quantum frequency combs: entangled frequency bins

**Quantum frequency combs**:
Demonstrated: 10+ entangled frequency pairs
High-dimensional entanglement
Compatible with standard telecom components

#### 2.7.10 Applications in Quantum Computing and Networks

**Cluster state generation**:
Type-I fusion of FWM photon pairs
Scalable in frequency/time domain
Time-bin encoding with pulsed pumps

**Quantum teleportation**:
Entangled pair from FWM + Bell measurement
On-chip teleportation demonstrated

**Quantum key distribution (QKD)**:
Entanglement-based QKD (E91 protocol)
Device-independent QKD with loophole-free Bell test
MDI-QKD with FWM sources

**Boson sampling**:
FWM sources for multi-photon input
Frequency-bin encoding for mode scaling
Gaussian boson sampling with squeezed states

**Distributed quantum computing**:
Entanglement distribution between chips
Heralded entanglement for quantum repeaters

---

*End of Piece 7. Next: Piece 8 - Quantum Fisher Information for Optical Neural Network Weight Precision*