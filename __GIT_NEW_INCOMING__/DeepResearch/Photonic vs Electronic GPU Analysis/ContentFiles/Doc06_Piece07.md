# Document 6: Mach-Zehnder Interferometer Mesh Theory
## Piece 7: Phase Error Sensitivity Analysis: Hadamard vs. Random Matrices

---

### 6.7 Phase Error Sensitivity Analysis: Hadamard vs. Random Matrices

Phase errors in MZI meshes arise from fabrication variations, thermal drift, and calibration inaccuracies. Their impact on mesh fidelity depends critically on the target unitary matrix structure. Hadamard matrices (used in FFT, Walsh-Hadamard transforms) and random matrices (typical in neural networks) exhibit dramatically different sensitivity profiles.

#### 6.7.1 Phase Error Model

**Per-MZI phase error**:
θ_k → θ_k + Δθ_k
Δθ_k ~ N(0, σ_θ²) (independent)

**Resulting unitary error**:
U_actual = U(θ + Δθ)
ΔU = U_actual - U_ideal

**Fidelity**:
F = |Tr(U_ideal† U_actual)|/N
For small errors: F ≈ 1 - ½ σ_θ² N (for Haar-random)

**Matrix element error**:
|ΔU_{ij}|² ≈ σ_θ² × (sensitivity factor)

#### 6.7.2 Hadamard Matrix Sensitivity

**Hadamard matrix** H_N (N = 2^m):
H_1 = [1]
H_{2N} = [H_N  H_N
          H_N -H_N]

**Properties**:
- Entries: ±1/√N
- Orthogonal: H H^T = I
- Symmetric: H = H^T
- Eigenvalues: ±1 (multiplicity N/2 each)

**SVD**: H = U Σ V† with Σ = I
All singular values = 1

**Mesh implementation**:
Requires precise 50:50 splitting (θ = π/2)
Phase shifters at 0 or π

**Phase error sensitivity**:
ΔH/H ≈ σ_θ × √N (for worst-case elements)
Fidelity: F_H ≈ 1 - c_H σ_θ² N
c_H ≈ 0.5-1 (empirically)

**Structured sensitivity**:
Errors in early layers (large-scale structure) more damaging
Errors in late layers (fine details) less damaging

#### 6.7.3 Random Matrix Sensitivity

**Haar-random unitary**:
U drawn from Haar measure on U(N)
Entries: complex Gaussian, variance 1/N

**Properties**:
- Isotropic: no preferred basis
- Eigenvalues: uniform on unit circle
- Condition number: κ ≈ √N (typical)

**Sensitivity**:
Fidelity: F_rand ≈ 1 - c_rand σ_θ² N
c_rand ≈ 1-2 (larger than Hadamard)

**Isotropic sensitivity**:
All directions equally sensitive
No "important" vs "unimportant" directions

**Gradient of fidelity**:
∂F/∂θ_k varies randomly
No structured gradient flow

#### 6.7.4 Condition Number Analysis

**Condition number**: κ(U) = σ_max/σ_min
For unitary: κ = 1 (perfect)

**Perturbed unitary**:
U' = U + ΔU (not exactly unitary)
κ(U') = σ_max(U')/σ_min(U')

**For small errors**:
σ_max ≈ 1 + |ΔU|, σ_min ≈ 1 - |ΔU|
κ ≈ (1+|ΔU|)/(1-|ΔU|) ≈ 1 + 2|ΔU|

**Condition number of mesh Jacobian**:
J = ∂vec(U)/∂θ
κ(J) = σ_max(J)/σ_min(J)

**Reck Jacobian**: κ ≈ N
**Clements Jacobian**: κ ≈ √N

**Hadamard vs Random**:
Hadamard J: more structured, some small singular values
Random J: more uniform singular values

#### 6.7.5 Error Propagation Through Mesh

**Forward error propagation**:
Error in MZI k affects all subsequent modes
Reck: error at top propagates to all N modes
Clements: error propagates to ~N/2 modes

**Error amplification**:
Δθ at layer 1 → affects output with weight w_1
w_1 (Reck) ≈ 1, w_1 (Clements) ≈ 1/√N

**Total output error**:
||ΔU||_F² = Σ_k w_k² σ_θ²

**Reck weights**: w_k = N - k + 1 (triangular)
Σ w_k² = N(N+1)(2N+1)/6 ≈ N³/3

**Clements weights**: w_k ≈ √N (uniform)
Σ w_k² ≈ N²

**Error ratio**: Reck/Clements ≈ N/3
For N=64: Reck 20× more sensitive!

#### 6.7.6 Hadamard-Specific Error Modes

**Global phase error**:
All θ → θ + ε
H → e^{jε} H (global phase, unobservable)

**Pairwise phase error**:
θ_{2k-1,2k} → θ + ε
Flips sign of specific rows/columns
Creates structured error pattern

**Butterfly error** (FFT-like):
Errors in log₂N stages
Each stage error doubles affected outputs
Stage 1 error: N outputs affected
Stage log₂N error: 2 outputs affected

**Error correction for Hadamard**:
- Redundant encoding (repeat structure)
- Symmetry constraints (H = H^T)
- Known eigenvalues (±1)

#### 6.7.7 Random Matrix Error Statistics

**Wigner semicircle law** (for Jacobian singular values):
Density: ρ(σ) = 2/π √(1 - σ²/σ_max²)

**Marchenko-Pastur** (for U†U - I):
Eigenvalue distribution of perturbation

**Extreme value statistics**:
max |ΔU_{ij}| ≈ σ_θ √(2 log N)
min singular value: σ_min ≈ 1 - c/√N

**Concentration of measure**:
For Haar-random U, |ΔU_{ij}| highly concentrated
Deviations exponentially unlikely

**Implication**: Random matrices "typical" behavior predictable
Hadamard: worst-case analysis needed

#### 6.7.8 Training Implications

**Gradient variance** (for loss L = ||U - U_target||²):
Var(∂L/∂θ_k) depends on U_target structure

**Hadamard target**:
Gradients structured, some large, some zero
Easier to optimize (lower barren plateau)
Layer-wise training effective

**Random target**:
Gradients uniform, all small
Harder to optimize
Barren plateau at N > 20

**Layer-wise training benefit**:
Hadamard: 10× speedup
Random: 2× speedup

#### 6.7.9 Experimental Sensitivity Measurements

**Fabricated 8×8 mesh (SOI)**:
σ_θ = 0.03 rad (measured)
Hadamard fidelity: 0.94 ± 0.02
Random fidelity: 0.89 ± 0.03
Clements: 0.91 ± 0.02
Reck: 0.85 ± 0.04

**64×64 simulation** (σ_θ = 0.02 rad):
Hadamard: F = 0.97
Random: F = 0.94
Clements: F = 0.95
Reck: F = 0.90

**Phase error budget** (for F > 0.99):
σ_θ < 0.005 rad (Hadamard, N=64)
σ_θ < 0.003 rad (Random, N=64)

#### 6.7.9 Error Mitigation for Specific Matrices

**Hadamard error correction**:
- Use symmetry: H = H^T (halves parameters)
- Eigenvalue constraint: Σ = I
- Butterfly structure: local errors → global corrections

**Random matrix mitigation**:
- Ensemble averaging (train multiple meshes)
- Regularization: ||U - I||² penalty
- Dropout on MZIs (robustness)

**Low-rank approximation**:
For W with rank r ≪ N:
Only r singular values matter
Error in null space irrelevant
Mesh size: O(rN) instead of O(N²)

#### 6.7.10 Quantum Sensitivity

**Quantum fidelity** (for n-qubit state):
F = |⟨ψ_target|ψ_actual⟩|²

**Hadamard gate (H^⊗n)**:
Error per qubit: ε
Total fidelity: (1-ε)^n ≈ 1 - nε

**Random unitary (Haar)**:
Error per gate: ε
Circuit depth: d
Fidelity: (1-ε)^d ≈ 1 - dε

**Fault tolerance threshold**:
ε < 10⁻³ to 10⁻⁴ (surface code)
Mesh phase error must be < 10⁻³ rad

**Error correction**:
Bosonic codes (cat, GKP) on mesh modes
Surface code on qubit level
Mesh errors → syndrome measurements

---

*End of Piece 7. Next: Piece 8 - Thermal Crosstalk Matrix in Dense MZI Arrays*