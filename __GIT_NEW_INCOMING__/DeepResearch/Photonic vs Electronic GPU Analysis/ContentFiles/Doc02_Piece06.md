# Document 2: Photon Statistics and Quantum Optical Computing
## Piece 6: Quantum Cramér-Rao Bound for Phase Estimation in MZIs

---

### 2.6 Quantum Cramér-Rao Bound for Phase Estimation in MZIs

The Quantum Cramér-Rao Bound (QCRB) sets the fundamental limit on the precision of parameter estimation using quantum systems. For phase estimation in Mach-Zehnder Interferometers (MZIs), it determines the ultimate sensitivity achievable with a given quantum state of light.

#### 2.6.1 Classical Cramér-Rao Bound

For a parameter φ estimated from measurement outcomes x with probability distribution p(x|φ):

Var(φ_est) ≥ 1 / [ν F(φ)]

where ν is the number of independent measurements, and F(φ) is the classical Fisher Information (CFI):

F(φ) = ∫ (∂_φ p(x|φ))² / p(x|φ) dx

For phase estimation with photon counting at MZI output:
p(n|φ) = |⟨n|ψ_out(φ)⟩|²

#### 2.6.2 Quantum Fisher Information

The Quantum Fisher Information (QFI) maximizes CFI over all possible measurements:

F_Q(φ) = max_{POVM} F(φ) = Tr[ρ_φ L_φ²]

where L_φ is the Symmetric Logarithmic Derivative (SLD) defined by:
∂_φ ρ_φ = ½ (ρ_φ L_φ + L_φ ρ_φ)

For pure states |ψ(φ)⟩ = U(φ)|ψ⟩ with U(φ) = exp(-iφ G):

F_Q = 4(⟨G²⟩ - ⟨G⟩²) = 4 Var(G)

The QCRB: Var(φ_est) ≥ 1 / (ν F_Q)

#### 2.6.3 Phase Estimation in MZI

The MZI implements the unitary:
U(φ) = exp(-iφ J_z)

where J_z = (a^†_1 a_1 - a^†_2 a_2)/2 is the photon number difference operator.

The generator is G = J_z, so F_Q = 4 Var(J_z).

Input states and their QFI:

1. **Coherent + Vacuum**: |α⟩|0⟩
   J_z = (a^†a)/2, ⟨J_z⟩ = n̄/2, Var(J_z) = n̄/4
   F_Q = n̄ → Δφ = 1/√n̄ (SQL)

2. **Coherent + Squeezed Vacuum**: |α⟩|ξ⟩
   Optimal squeezing angle: F_Q = n̄ e^{2r} + 2 sinh²r
   For large n̄: F_Q ≈ n̄ e^{2r} → Δφ = e^{-r}/√n̄

3. **Twin Fock**: |n/2, n/2⟩
   J_z = 0, Var(J_z) = 0? No, input is fixed photon number.
   Actually: F_Q = n(n+2)/2 ≈ n²/2 → Δφ = √2/n

4. **NOON State**: (|n,0⟩ + |0,n⟩)/√2
   F_Q = n² → Δφ = 1/n (Heisenberg limit)

5. **Two-Mode Squeezed Vacuum (TMSV)**:
   |ψ⟩ = √(1-λ²) Σ λⁿ |n,n⟩
   F_Q = 4 n̄(n̄+1) → Δφ = 1/√(n̄(n̄+1))

#### 2.6.4 Optimal Measurement for Phase Estimation

The QCRB is asymptotically achievable with the optimal POVM. For MZI:

**Canonical phase measurement**: Projects onto phase eigenstates
|φ⟩ = (1/√(2π)) Σ_n e^{inφ} |n⟩
Hard to implement physically.

**Adaptive homodyne measurement**:
Local oscillator phase adjusted based on previous outcomes
Achieves QCRB asymptotically for Gaussian states.

**Parity measurement**:
P = (-1)^{a^†_2 a_2} (parity of output mode 2)
⟨P⟩ = cos(n φ) for NOON state
Sensitive to small φ: d⟨P⟩/dφ ≈ n

**Photon number difference measurement**:
D = a^†_1 a_1 - a^†_2 a_2
For TMSV: ⟨D⟩ = 0, Var(D) = 2 n̄(n̄+1)
Signal-to-noise: Δφ = √Var(D)/|d⟨D⟩/dφ|

#### 2.6.5 Phase Estimation with Losses

Losses severely degrade quantum-enhanced phase sensitivity.

**Loss model**: Each arm has transmission η < 1
Mode transformation: a → √η a + √(1-η) v
where v is vacuum noise mode.

For NOON state with loss:
F_Q ≈ η^n n² (exponential degradation!)
For n=10, η=0.9: F_Q ≈ 0.9¹⁰ × 100 ≈ 35 (vs 100 without loss)

For squeezed vacuum with loss:
F_Q = η n̄ e^{2r} / (1 + (1-η)n̄ e^{2r})? 
Actually: F_Q = 4η Var(J_z) + η(1-η)n̄

For coherent + squeezed:
F_Q = η n̄ e^{2r} + 2η(1-η) sinh²r + 2η² sinh²r cosh²r

Loss tolerance: Squeezed states > NOON states > Twin Fock > Coherent

#### 2.6.6 MZI in Silicon Photonics: Practical Limits

**Phase shifter noise**:
Thermo-optic phase shifters: Johnson-Nyquist noise
Δφ_thermal = √(k_B T / (C_th τ)) × (dn/dT) × (L/λ)
C_th = heat capacity, τ = measurement time

For silicon MZI: dn/dT = 1.86×10⁻⁴ K⁻¹
L = 100 μm, C_th ≈ 10⁻¹² J/K, τ = 1 ms
Δφ_thermal ≈ 10⁻⁴ rad

**Shot noise limit**:
N_photons = P τ / (hν)
At 1 mW, 1550 nm, τ = 1 ms: N ≈ 8×10¹²
Δφ_SQL = 1/√N ≈ 3.5×10⁻⁷ rad

**Laser noise (RIN)**:
Relative intensity noise: RIN ≈ -150 dB/Hz (good DFB laser)
Δφ_RIN ≈ RIN × √(τ × BW)

**Fabrication disorder**:
Phase errors from width variations Δw:
Δφ_fab ≈ (dβ/dw) Δw L
For SOI: dβ/dw ≈ 0.1 rad/(μm·nm)
Δw = 1 nm, L = 100 μm: Δφ_fab ≈ 0.01 rad

**Thermal crosstalk**:
Adjacent phase shifters heat each other
Δφ_xtalk ≈ 0.01-0.1 rad (depending on spacing)

#### 2.6.7 Quantum-Enhanced MZI Mesh for ONNs

In Optical Neural Networks, MZI meshes implement matrix-vector multiplication:

U(θ) = Π_k exp(-iθ_k J_z,k)

Weight precision limited by phase estimation precision:
Δw_ij ≈ Δθ ∝ Δφ

For 8-bit precision (1/256 ≈ 0.004):
Need Δφ < 0.004 rad

With coherent light (1 mW, 1 ms): Δφ ≈ 3.5×10⁻⁷ rad (sufficient)
But with 1 fJ/MAC: N ≈ 8000, Δφ ≈ 0.011 rad (marginal)

With 10 dB squeezing: Δφ ≈ 0.0035 rad (meets 8-bit)

**Quantum-enhanced ONN**: Inject squeezed vacuum into unused ports
Requires on-chip squeezing generation or hybrid integration

#### 2.6.8 Multi-Parameter Estimation

For estimating multiple phases φ = (φ₁, ..., φ_m):

Covariance matrix bound: Cov(φ_est) ≥ F_Q^{-1}

where F_Q is the QFI matrix:
[F_Q]_{ij} = Tr[ρ {L_i, L_j}/2]

For commuting generators [G_i, G_j] = 0:
Simultaneous estimation at QCRB possible.

For non-commuting generators:
Trade-off between precisions (Hausladen-Wootters bound)
Optimal measurements may be incompatible.

In MZI mesh: phases θ_k control different MZIs
Generators J_z,k commute (different modes)
Multi-parameter QCRB achievable.

#### 2.6.9 Bayesian Phase Estimation

For small number of measurements (ν small), asymptotic CRB not valid.

Bayesian Cramér-Rao Bound (van Trees inequality):
Var(φ_est) ≥ 1 / [ν F_Q + I_prior]

where I_prior = ∫ (∂_φ ln p(φ))² p(φ) dφ is prior Fisher information.

For flat prior: standard CRB.
For informative prior: better scaling at small ν.

Adaptive Bayesian phase estimation:
1. Start with prior p(φ)
2. Choose measurement to maximize expected information gain
3. Update posterior: p(φ|x) ∝ p(x|φ) p(φ)
4. Repeat

Achieves Heisenberg scaling 1/n for NOON states even at small ν.

#### 2.6.10 Applications in Photonic Quantum Computing

**Variational Quantum Eigensolver (VQE)**:
Measure expectation values ⟨ψ|H|ψ⟩ via phase estimation
QCRB determines measurement shots needed

**Quantum Phase Estimation (QPE) Algorithm**:
Estimate eigenvalues of unitary U
Precision Δφ = 1/2^m with m ancilla qubits
Heisenberg-limited: uses inverse QFT

**Quantum Metrology for Calibration**:
Calibrate MZI mesh phases using quantum light
Self-calibration without external reference

**Error Mitigation**:
Quantum noise characterization via QCRB
Zero-noise extrapolation using noise scaling

---

*End of Piece 6. Next: Piece 7 - Entanglement Generation via Four-Wave Mixing in Silicon Waveguides*