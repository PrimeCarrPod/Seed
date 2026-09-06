# Document 6: Mach-Zehnder Interferometer Mesh Theory
## Piece 5: Singular Value Decomposition via Optical Mesh Calibration

---

### 6.5 Singular Value Decomposition via Optical Mesh Calibration

Singular Value Decomposition (SVD) is a fundamental matrix factorization W = U Σ V† that enables arbitrary linear transformations in optical neural networks. The MZI mesh naturally implements unitary matrices U and V†, while singular values Σ require variable-splitting-ratio MZIs or attenuators. This piece covers the theory, calibration methods, and practical implementation of SVD in MZI meshes.

#### 6.5.1 SVD for Linear Optical Transformations

**General complex matrix**: W ∈ ℂ^{M×N}
**SVD**: W = U Σ V†
- U ∈ ℂ^{M×M}: unitary (left singular vectors)
- V ∈ ℂ^{N×N}: unitary (right singular vectors)
- Σ ∈ ℝ^{M×N}: diagonal, Σ_{ii} = σ_i ≥ 0 (singular values)

**Optical implementation**:
1. V† mesh (N×N): applies V† to input
2. Σ stage: applies singular values (attenuation/amplification)
3. U mesh (M×M): applies U to output

**For square M=N**: Direct U, V† meshes
**For rectangular M≠N**: Pad with identity or use rectangular mesh

#### 6.5.2 Singular Value Implementation

**Option 1: Variable-splitting-ratio MZI**
MZI with θ = 2 arctan(√σ)
Transmission: T = cos²(θ/2) = 1/(1+σ)
For σ ≤ 1: direct implementation
For σ > 1: need amplification (not passive)

**Option 2: Attenuators + fixed MZI**
Fixed 50:50 MZI + variable attenuator on one arm
σ = 10^{-α/10} (α = attenuation in dB)
Range: 0 to ∞ (with amplifiers)

**Option 3: Singular value mesh (SVD-specific)**
Dedicated mesh architecture for Σ
- Diagonal MZIs with θ_i = 2 arctan(σ_i)
- Interspersed with phase shifters for sign

**Option 4: SVD via mesh calibration (preferred)**
Calibrate full mesh to implement W directly
No explicit SVD decomposition needed

#### 6.5.3 Mesh Calibration for Arbitrary Matrix

**Problem**: Given target matrix W, find mesh parameters θ
**Approach**: Optimization on unitary manifold

**Loss function**:
L(θ) = ||U(θ) - W||_F² (if W is unitary)
L(θ) = ||U(θ) Σ(θ) V†(θ) - W||_F² (general)

**Optimization**:
- Gradient descent on manifold (Wirtinger calculus)
- Levenberg-Marquardt for faster convergence
- Multiple random restarts (avoid local minima)

**Initial guess**:
- SVD of W → initial θ for U, V
- Random for Σ stage

#### 6.5.4 Phase Retrieval and Self-Calibration

**Blind calibration**: No access to target matrix, only input-output measurements

**Input-output pairs**:
K known inputs: |ψ_k⟩, k=1..K
Measured outputs: |φ_k⟩ = U|ψ_k⟩ + noise

**Phase retrieval problem**: Recover U from |⟨i|U|ψ_k⟩|²
**Algorithms**:
- Gerchberg-Saxton (alternating projections)
- Wirtinger Flow (gradient descent on amplitude loss)
- PhaseLift (semidefinite programming)

**With phase reference**:
Known reference state → full field reconstruction
Holographic calibration

#### 6.5.5 In-Situ Mesh Characterization

**Transfer matrix measurement**:
Send basis states |i⟩, measure all outputs
T_{ji} = ⟨j|U|i⟩

**Requirements**:
- N coherent inputs (or N sequential)
- N×N photodetectors (or single detector + scanning)
- Phase-sensitive detection (coherent receiver)

**With phase shifters only**:
Characterize MZI by MZI
Set all but one MZI to bar/cross
Measure 2×2 transfer matrix

**Coherent detection**:
Interferometer with local oscillator
Measure complex field E_out = E_sig + E_LO
Phase retrieval from interferogram

#### 6.5.6 Calibration Algorithms

**1. Gradient-based (backprop)**:
- Initialize θ from SVD
- Forward: compute U(θ)
- Loss: ||U - W||²
- Backward: adjoint method
- Update: Riemannian gradient descent

**2. Analytic (Reck/Clements)**:
- Direct SVD → angles
- Fast but sensitive to fabrication errors
- No compensation for non-idealities

**3. Layer-wise (progressive)**:
- Train first layer (closest to input)
- Freeze, train second layer
- ...
- Avoids barren plateaus

**4. Black-box optimization**:
- Bayesian optimization
- Evolutionary algorithms
- For highly non-convex landscapes

#### 6.5.7 Robustness to Fabrication Errors

**Error model**:
Actual U_actual = U_ideal + ΔU
ΔU from: phase errors, loss, crosstalk, amplitude errors

**Calibration compensation**:
- Measure U_actual (or subset)
- Find θ' such that U(θ') ≈ W
- U(θ') U_actual† ≈ W U_ideal†

**Digital pre-distortion**:
Electronic pre-compensation
x_electronic = W⁺ x_optical

**Tolerance analysis**:
Monte Carlo: σ_θ = 0.02 rad
Fidelity after calibration: > 99% for N ≤ 64

#### 6.5.8 SVD for Non-Square Matrices

**M > N (tall)**:
W = U Σ V†
U: M×M, Σ: M×N, V: N×N
Implement: V† (N×N) → Σ (N×N, padded) → U (M×M)
Zero-pad inputs to M modes

**M < N (wide)**:
W = U Σ V†
U: M×M, Σ: M×N, V: N×N
Implement: V† (N×N) → Σ (M×M, with zeros) → U (M×M)
Truncate outputs to M modes

**Economy SVD**:
U: M×N, Σ: N×N, V: N×N (M > N)
U has orthonormal columns, not square unitary
Implementation: Embed in N×N unitary with ancillas

#### 6.5.9 Online Calibration and Drift Compensation

**Drift sources**:
- Thermal: Δθ(t) = α ΔT(t)
- Aging: slow parameter drift
- Carrier lifetime changes

**Online calibration**:
1. Periodic test patterns (during idle)
2. Monitor output power/error
3. Update θ via gradient step

**Adaptive control**:
θ(t+1) = θ(t) - η ∇L(t)
Kalman filter for drift tracking

**Redundancy**:
Extra MZIs for fault tolerance
Reconfigure around failed components

#### 6.5.10 SVD for Quantum State Preparation

**Quantum state** |ψ⟩ ∈ ℂ^{2ⁿ} (n qubits)
**Amplitude encoding**: |ψ⟩ = Σ α_i |i⟩

**SVD for state preparation**:
α = U Σ V†
Apply V† → Σ → U to |0⟩^⊗n

**Quantum circuit depth**:
O(2ⁿ) for arbitrary state
Mesh provides optimal O(2ⁿ) depth

**Variational quantum eigensolver (VQE)**:
Mesh parameters as variational parameters
Measure ⟨H⟩, optimize θ

---

*End of Piece 5. Next: Piece 6 - Insertion Loss Accumulation: N×N Mesh Scaling Laws*