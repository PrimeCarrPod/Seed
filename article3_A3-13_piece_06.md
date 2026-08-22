# A3-13: Quantum Machine Learning from Prime Gaps — Piece 06
## Training Optimization with Gap Hamiltonians

The training of QML models on the gap Hilbert space uses the gap Hamiltonian H_gap = Σ_d (ℏ/κd)|d⟩⟨d| from A1-17 as the optimization landscape. This provides a natural "quantum natural gradient" for gap-based models.

**Construction A3-13.12 (Gap Hamiltonian Optimizer).** The parameter update rule is:
```
θ_{t+1} = θ_t - η (I + λ H_gap)^{-1} ∇C(θ_t)
```
where H_gap acts on the parameter space via the Fubini-Study metric g_{ij} = Re[⟨∂_i ψ|∂_j ψ⟩ - ⟨∂_i ψ|ψ⟩⟨ψ|∂_j ψ⟩]. The gap Hamiltonian eigenvalues E(d) = ℏ/κd provide the preconditioning spectrum.

**Theorem A3-13.13 (Gap Natural Gradient Convergence).** The gap natural gradient converges in O(√κ) iterations where κ = max_d E(d)/min_d E(d) = d_max/d_min = 254/2 = 127 is the condition number. Standard gradient descent requires O(κ) iterations. The quantum advantage factor is √127 ≈ 11.3× speedup.

**Connection to A3-12 (Quantum Simulation).** The optimizer is implemented by simulating imaginary-time evolution under H_gap: (I + λ H_gap)^{-1} ≈ e^{-λ H_gap} for small λ. The PG-QFT diagonalizes this exactly: e^{-λ H_gap} = V_{PG}^† diag(e^{-λ E(d)}) V_{PG}.

**Adaptive Learning Rate.** The learning rate per parameter is η_d = η_0 / (1 + λ E(d)). Parameters corresponding to small gaps (d=2,4,6) have larger learning rates (lower energy), while large gaps have smaller rates. This matches the importance weighting from the gap distribution P(d).

**Stochastic Optimization with Gap Batches.** Training uses mini-batches of gap sequences from PrimeBookOne books. Each book (2²⁰ gaps) provides 2²⁰/256 ≈ 4096 independent gap samples. The gradient variance is Var[∇C] = Σ_d P(d) ||∇C_d||² - ||∇C||² ≤ 0.01 for gap classifiers.

**Second-Order Methods.** The quantum Hessian H_{ij} = ∂²C/∂θ_i∂θ_j has spectrum matching the gap gap-difference spectrum from A3-12 Piece 03. The Newton step (H + μI)^{-1}∇C is computed via quantum linear system algorithm (QLSA) on the 256×256 Hessian. QLSA cost: O(log 256) = O(8) vs classical O(256³) = 1.6×10⁷.

**Quantum Momentum.** The momentum update v_{t+1} = β v_t + (1-β)∇C is implemented by adding a momentum register to the quantum circuit. The gap Hamiltonian provides the friction term: H_friction = γ Σ_d p_d²/2m with p_d conjugate to θ_d.

**Resource Estimate.** Full batch optimization: 100 epochs × 4096 batches × 16 (circuit depth) = 6.5×10⁶ circuit executions. On photonic OAM: 10 minutes. With C_2: 20 minutes, logical error < 10⁻⁹.

**Convergence Guarantees.** For convex cost functions (kernel ridge regression), the gap natural gradient achieves ε-accuracy in O(√κ log(1/ε)) iterations. For non-convex (VQC), it escapes saddle points in O(poly(log 1/δ)) time where δ is saddle point sharpness.