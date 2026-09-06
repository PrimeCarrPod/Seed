# Document 2: Photon Statistics and Quantum Optical Computing
## Piece 8: Quantum Fisher Information for Optical Neural Network Weight Precision

---

### 2.8 Quantum Fisher Information for Optical Neural Network Weight Precision

Optical Neural Networks (ONNs) implement matrix-vector multiplications using programmable photonic circuits. The precision of weight encoding is fundamentally limited by quantum noise. The Quantum Fisher Information (QFI) provides the ultimate bound on weight estimation precision, determining the maximum achievable inference accuracy.

#### 2.8.1 Weight Encoding in Photonic Circuits

In MZI-based ONNs, weights are encoded as phase shifts:
w_ij = cos(θ_ij) or sin(θ_ij)

In MRR-based ONNs, weights are encoded as resonance tuning:
w_ij = κ² / ((Δω)² + (κ/2)²)

In diffractive ONNs, weights are encoded as phase mask values:
w(x,y) = exp(iφ(x,y))

The weight parameter φ (or θ, Δω) is the quantity to be estimated/controlled.

#### 2.8.2 Quantum Model of Weight Estimation

Consider a single weight w encoded in a phase shifter. The input-output relation:

|ψ_out⟩ = U(w) |ψ_in⟩

where U(w) = exp(-i w G) with G = a^†a/2 (for phase shifter).

The probe state |ψ_in⟩ is sent through the circuit, and output is measured to estimate w.

QFI for weight w:
F_Q(w) = 4 Var_ψ(G) = 4(⟨G²⟩ - ⟨G⟩²)

For phase shifter with generator G = N/2:
F_Q = Var(N) = n̄ for coherent state
F_Q = n̄ e^{2r} + 2 sinh²r for squeezed
F_Q = n² for Fock state |n⟩

#### 2.8.3 Weight Precision in MZI Mesh

An N×N MZI mesh has N(N-1)/2 phase shifters (Clements decomposition).

For each phase shifter θ_k, the QFI:
F_Q(θ_k) = 4 Var(J_z,k)

Total QFI matrix for all weights:
[F_Q]_{kl} = 4 Cov(J_z,k, J_z,l)

For independent coherent state inputs to each MZI:
F_Q is diagonal with entries n̄_k

The Cramér-Rao bound for weight covariance:
Cov(θ_est) ≥ F_Q^{-1}

For uniform input power P per MZI, measurement time τ:
n̄ = P τ / (hν)
Δθ ≥ 1/√n̄ (per weight)

#### 2.8.4 Scaling with Network Size

For an N×N mesh with total optical power P_total:
Power per MZI: P_total / N (if fan-in limited)
Time per layer: τ
Total measurement time: N τ (sequential layers)

Weight precision per MZI:
Δθ ≥ 1/√(P_total τ / (N hν)) = √(N hν / P_total τ)

Total network precision (all weights):
Tr(Cov) ≥ Σ 1/F_Q,k = N(N-1)/2 × 1/n̄

For N=64, P_total=1 mW, τ=1 ms, λ=1550 nm:
n̄ per MZI ≈ 10¹¹/64 ≈ 1.6×10⁹
Δθ ≥ 2.5×10⁻⁵ rad (excellent)

But for fJ/MAC energy budget:
E_per_MAC = 1 fJ = 10⁻¹⁵ J
N_ph = E/(hν) ≈ 8000
Δθ ≥ 1/√8000 ≈ 0.011 rad (marginal for 8-bit)

#### 2.8.5 Quantum-Enhanced Weight Estimation

**Squeezed light injection**:
Inject squeezed vacuum into unused ports
F_Q = n̄ e^{2r} for amplitude squeezing
10 dB squeezing (r=1.15): 3.16× improvement

**Entangled probe states**:
Two-mode squeezed vacuum between MZIs
F_Q = 4 n̄(n̄+1) → Heisenberg scaling

**Adaptive measurement**:
Update measurement basis based on previous outcomes
Achieves QCRB with fewer measurements

**Bayesian weight estimation**:
Incorporate prior knowledge (weight distribution from training)
Van Trees inequality: better at small n̄

#### 2.8.6 Weight Noise Propagation Through Network

Weight errors Δθ propagate through the network:

Output error: Δy = J Δθ
where J is Jacobian of network output w.r.t. weights.

For linear network y = W x:
Cov(y) = (x^T ⊗ I) Cov(W) (x ⊗ I)

For coherent state inputs (Cov(W) = I/n̄):
Var(y_i) = ||x||² / n̄

Relative error: Δy/y ≈ 1/√(n̄ SNR_x)

For ReLU-like activation (|y|² detection):
Additional shot noise from detection

#### 2.8.7 Training with Quantum Noise Awareness

**Quantization-aware training (QAT)**:
Simulate quantum noise during training
Add Gaussian noise to weights: θ → θ + N(0, Δθ²)
Straight-through estimator for gradient

**Noise-injected training**:
Forward pass: sample from output distribution
Backward pass: reparameterization gradient

**Robust training objective**:
Minimize worst-case loss over noise distribution
Min_θ E_Δ[L(θ+Δ)] + λ Var_Δ[L(θ+Δ)]

**Hardware-aware neural architecture search (HW-NAS)**:
Search architectures robust to quantum noise
Include QFI in reward function

#### 2.8.8 Weight Precision Requirements for Inference

**Classification accuracy vs. weight precision**:
- 32-bit float: baseline accuracy
- 8-bit int: <1% drop (typical)
- 4-bit int: 1-5% drop
- 2-bit: >10% drop (usually unacceptable)

**Analog optical weights**:
Continuous but noisy
Effective bits: b_eff = log₂(1/Δθ)
For Δθ = 0.01 rad: b_eff ≈ 6.6 bits
For Δθ = 0.001 rad: b_eff ≈ 10 bits

**Error correction in ONNs**:
Redundant encoding: multiple MZIs per weight
Majority voting at output
Digital correction layer after optical layer

#### 2.8.9 QFI for Different ONN Architectures

**MZI Mesh (Unitary)**:
Weights: cos(θ), sin(θ)
F_Q per parameter: n̄ (coherent)
Total parameters: N(N-1)/2

**MRR Weight Bank**:
Weights: Lorentzian lineshape
F_Q for resonance tuning: n̄ (κ/Δω)²
High Q (small κ) → high sensitivity but narrow range

**Diffractive ONN (D2NN)**:
Weights: phase mask pixels
F_Q per pixel: n̄_pixel
Total pixels: 10⁴-10⁶
Very low power per pixel!

**Coherent Ising Machine**:
Weights: coupling J_ij
F_Q for J_ij: n̄
Measurement: homodyne or photon counting

#### 2.8.10 Quantum-Enhanced ONN: Future Directions

**On-chip squeezed light sources**:
Integrated OPOs or FWM sources
Requires low-loss waveguides (SiN, Hydex)
Hybrid integration with silicon photonics

**Quantum error correction for ONNs**:
Bosonic codes (cat, GKP) for weight storage
Logical weights encoded in error-corrected states
Overhead: 10-100× physical resources

**Variational quantum ONNs**:
Parameterized quantum circuits for weights
Quantum backpropagation via parameter-shift rule
Hybrid quantum-classical training

**Quantum advantage in ONNs**:
Provable advantage for specific tasks?
Boson sampling subroutines?
Quantum kernel methods with photonic feature maps?

---

*End of Piece 8. Next: Piece 9 - Decoherence Mechanisms: Raman Scattering, Free-Carrier Absorption, TPA*