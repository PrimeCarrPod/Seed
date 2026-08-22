# A3-13: Quantum Machine Learning from Prime Gaps — Piece 05
## Quantum Neural Networks from PG-QFT Layers

The PG-QFT V_{PG} = F_{256} D F_{256}^† from A3-10 is a universal 256-qubit gate. Stacking V_{PG} with diagonal unitaries creates a quantum neural network (QNN) with built-in Fourier structure.

**Theorem A3-13.5 (PG-QFT Neural Network).** The QNN layer L(θ) = V_{PG} diag(e^{iθ}) V_{PG}^† is a universal approximator for functions on the gap basis. An L-layer QNN computes f_θ(x) = ⟨0| U(θ)^† O U(θ) |0⟩ with U(θ) = Π_{l=1}^L L(θ_l).

**Architecture.**
- Input encoding: |ψ(x)⟩ = Σ_d √P(d|x) |d⟩ (Piece 01)
- L = 12 hidden layers: each L(θ) = V_{PG} D(θ) V_{PG}^†
- Output: measure Z_1...Z_8 (8 qubits = 256 classes)
- Total parameters: 12 × 256 = 3072

**Activation Functions from Gap Statistics.** The diagonal D(θ) implements a non-linear activation in the gap basis. The effective activation is:
σ(x)_d = |⟨d| V_{PG}^† diag(e^{iθ}) V_{PG} |ψ(x)⟩|²
This is a quantum analog of ReLU: it preserves positivity and sparsity (gap distribution is sparse, P(d) > 0 for ~100 values).

**Backpropagation via Parameter Shift.** For each parameter θ_{l,d}:
∂f/∂θ_{l,d} = (f(θ + π/2) − f(θ − π/2)) / 2
The 3072 gradients are computed in parallel on the quantum hardware. Total circuit evaluations per batch: 2 × 3072 = 6144.

**Quantum Convolutional Layers.** The gap correlations C(d, d') define a convolution:
(L_{conv} x)_d = Σ_{d'} C(d, d') x_{d'}
Implemented as L_{conv} = V_{PG}^† diag(λ) V_{PG} where λ are eigenvalues of C (Piece 02). This is a quantum convolution with kernel given by the gap correlation function.

**Pooling via Coarse-Graining.** The MERA structure (A3-12 Piece 09) provides natural pooling:
- Disentanglers: remove short-range entanglement (gap noise)
- Isometries: map 2 sites → 1 site (coarse-grain gaps)
- After 12 pooling layers: 256 → 1 logical qubit (the class label)

**Universal Approximation.** The PG-QFT QNN approximates any continuous function f: Δ^{255} → ℝ with error ε using L = O(log(1/ε)) layers. The Fourier structure of V_{PG} provides exponential convergence for gap-smooth functions.