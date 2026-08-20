# Document 2: Photon Statistics and Quantum Optical Computing
## Piece 10: Quantum Error Correction Codes for Photonic Quantum Computing

---

### 2.10 Quantum Error Correction Codes for Photonic Quantum Computing

Quantum error correction (QEC) is essential for fault-tolerant photonic quantum computing. Photonic systems face unique challenges: photon loss (dominant), dephasing, and nonlinearity-induced errors. Bosonic codes encode logical qubits in the infinite-dimensional Hilbert space of harmonic oscillators (optical modes), providing hardware-efficient protection.

#### 2.10.1 Error Channels in Photonic Systems

**Photon loss (amplitude damping)**:
E(ρ) = Σ_k L_k ρ L_k^†
L_k = √(C(η,k)) a^k
C(η,k) = η^k (1-η)^{n-k} (binomial)
Dominant error: single-photon loss (k=1)

**Dephasing (phase diffusion)**:
E(ρ) = (1-p) ρ + p Z ρ Z
Z = exp(iπ a^†a) = (-1)^{a^†a} (photon number parity)
Caused by: thermal fluctuations, Kerr nonlinearity, fabrication disorder

**Thermal noise**:
E(ρ) = Σ_n p_n D(α_n) ρ D^†(α_n)
p_n = thermal distribution
Displacement noise from blackbody radiation, amplifier noise

**Non-Gaussian errors**:
TPA, FCA, Raman scattering add non-Gaussian noise
Require non-Gaussian codes or concatenation

#### 2.10.2 Cat Codes (Schrödinger Cat States)

**Logical states**:
|0_L⟩ = N_+ (|α⟩ + |-α⟩) = cat_even
|1_L⟩ = N_- (|α⟩ - |-α⟩) = cat_odd

N_± = 1/√(2(1 ± e^{-2|α|²}))

**Properties**:
- Photon number parity: even for |0_L⟩, odd for |1_L⟩
- Superposition of coherent states
- Average photon number: n̄ = |α|² tanh(|α|²)
- Separation in phase space: 2|α|

**Error detection**:
Photon loss changes parity: |α⟩ → |√η α⟩
Parity measurement detects single-photon loss
Syndrome: parity flip → loss occurred

**Correction**:
Apply displacement D(β) to restore parity
Requires real-time feedback (fast electronics)

**Loss threshold**:
η_th ≈ 0.5 for |α|² ≈ 2-4
Logical error rate: p_L ∝ (1-η)² for small loss

**Experimental status**:
Microwave cavities (3D cQED): T₁ > 1 ms, cat codes demonstrated
Optical: challenging (fast loss, no strong nonlinearity)
Proposals: dissipative cat qubits with two-photon drive

#### 2.10.3 GKP Codes (Grid States)

**Logical states**:
|0_L⟩ ∝ Σ_{s∈ℤ} |q = 2s√π⟩
|1_L⟩ ∝ Σ_{s∈ℤ} |q = (2s+1)√π⟩

Comb of position eigenstates (delta functions)
In momentum space: |p = s√π⟩

**Approximate GKP states** (finite squeezing):
|0_L⟩ ∝ Σ_s exp(-(q - 2s√π)²/2Δ²) |q⟩
Δ = width of peaks (squeezing parameter)

**Error correction**:
Small displacements in phase space corrected by measuring q, p mod √π
Syndrome: (q mod √π, p mod √π)
Correct by displacing back to nearest lattice point

**Loss tolerance**:
Photon loss = random displacement in phase space
Correctable if displacement < √π/2
Threshold: η > 0.5 (similar to cat codes)

**Experimental status**:
Trapped ions: GKP states demonstrated
Microwave cavities: GKP with squeezing ~10 dB
Optical: proposals using squeezed light + photon counting

#### 2.10.4 Binomial Codes

**Logical states**:
|0_L⟩ = Σ_{k=0}^{S-1} c_k |k(S+1)⟩
|1_L⟩ = Σ_{k=0}^{S-1} c_k |k(S+1)+1⟩

Photon numbers spaced by S+1 for |0_L⟩, offset by 1 for |1_L⟩

**Error correction**:
Photon loss moves |n⟩ → |n-1⟩
Spacing by S+1 allows correction of up to S losses
For S=1: corrects single loss
For S=2: corrects up to 2 losses

**Coefficients c_k**: chosen for optimal overlap with physical states
Binomial distribution: c_k = √(C(S-1,k)) α^{S-1-k} (1-α)^k

**Advantages**:
- Exact protection against photon loss
- Natural for Fock-state-based systems
- Compatible with photon-number-resolving detection

#### 2.10.5 Rotated-Surface Codes (Concatenated)

**Inner code**: Bosonic code (cat, GKP, binomial)
**Outer code**: Qubit surface code

Concatenation:
Physical modes → Logical bosonic qubits → Surface code qubits

Error rates:
Physical loss: p_phys ≈ 1-η
Bosonic logical: p_bosonic ≈ (1-η)^{S+1}
Surface code threshold: p_bosonic < 1%

For η = 0.99 (1% loss):
p_bosonic ≈ 10⁻⁴ (S=1)
Surface code overhead: ~1000 physical per logical

**Total overhead**:
1 logical qubit ≈ 1000 bosonic modes
Each bosonic mode: 1 optical cavity/waveguide
Total: ~1000 cavities per logical qubit

#### 2.10.6 Dissipative Engineering of QEC

**Autonomous QEC**: Engineered dissipation stabilizes codespace
No measurement/feedback needed

**Two-photon drive for cat qubits**:
H = iħκ (a^†² - a²)/2
Steady states: |±α⟩ with α = √(κ/κ₁)
Photon loss corrected by two-photon pumping

**Kerr-cat qubits**:
H = -K a^†² a² + ε (a^†² + a²)
Bistability in phase space
Self-correcting against loss

**Experimental**: Superconducting circuits (microwave)
Optical: requires strong χ⁽³⁾ or χ⁽²⁾ nonlinearity

#### 2.10.7 Fault-Tolerant Gates for Bosonic Codes

**Clifford gates (preserve codespace)**:
- Displacement D(α): logical X, Z
- Rotation R(π/2): logical Hadamard
- Beam splitter: logical CNOT (between modes)

**Non-Clifford gates (require magic states)**:
- Cubic phase gate: V(γ) = exp(iγ q³)
- T-gate: requires magic state injection

**Magic state distillation**:
Prepare |T⟩ = T|+⟩
Distill using Clifford operations
Inject into computation via gate teleportation

**Photonic implementation**:
- Gaussian operations (displacement, rotation, BS): easy
- Non-Gaussian (cubic phase): hard
- Requires strong χ⁽³⁾ or measurement-induced nonlinearity

#### 2.10.8 Measurement-Based Quantum Computing (MBQC) with Photons

**Cluster states**: Large entangled states for one-way QC
Gaussian cluster states from squeezed light + beam splitters

**Generation**:
N squeezed vacuum modes → N×N interferometer → CV cluster state
Scalable in frequency/time domain (multiplexing)

**Computation**:
Measure quadratures in specific bases
Feedforward displacements based on outcomes
Universal with non-Gaussian measurements

**Error correction in MBQC**:
- 3D cluster states (Raussendorf-Harrington-Goyal)
- Topological protection
- Threshold: ~1% loss, ~1% squeezing degradation

**Photonic advantage**: Natural for cluster state generation
Deterministic with quantum memories

#### 2.10.9 Resource Estimates for Photonic FTQC

**Target**: Logical error rate < 10⁻¹⁵ (for Shor's algorithm)

**Physical parameters** (state-of-the-art):
- Loss per component: 0.1% (waveguide), 1% (coupler), 0.5% (detector)
- Squeezing: 10-15 dB
- Detector efficiency: 95-99% (SNSPD)
- Feedforward latency: < 100 ns

**Overhead for surface code + bosonic inner code**:
- Logical qubits needed: ~2000 (for 2048-bit RSA)
- Physical modes: ~2×10⁶
- Components: ~10⁷ (waveguides, couplers, detectors)
- Chip area: ~10 cm² (with dense integration)

**Timeline**:
- NISQ (2020s): 50-100 modes, no QEC
- Early FTQC (2030s): 1000 modes, bosonic codes
- Large-scale FTQC (2040s): 10⁶ modes, concatenated codes

#### 2.10.10 Hybrid Approaches: Discrete + Continuous Variable

**Dual-rail encoding**: |0⟩ = |1,0⟩, |1⟩ = |0,1⟩
Photon loss = bit-flip error
Parity check: |1,0⟩ + |0,1⟩ → detect loss

**Photon-number-resolving (PNR) detection**:
Essential for bosonic QEC
Transition-edge sensors (TES): η > 95%, PNR up to 10
SNSPDs with time-bin: multiplexed PNR

**Quantum repeaters for networking**:
Entanglement distillation + QEC
Bosonic codes for memory
Photonic links between nodes

**Conclusion**: Photonic QEC is theoretically well-developed but experimentally challenging. Near-term: bosonic codes in microwave. Long-term: hybrid discrete/CV codes with integrated photonics.

---

*End of Piece 10. Document 2 complete (10 pieces). Next: Glue pieces into Doc02_Final.md*