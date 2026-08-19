# Document 8: Diffractive Optical Neural Network Mathematics
## Piece 3: Phase Mask Optimization: Wirtinger Flow and Phase Retrieval

---

### 8.3 Phase Mask Optimization: Wirtinger Flow and Phase Retrieval

Optimizing phase masks for Diffractive Optical Neural Networks (D2NNs) is fundamentally a phase retrieval problem: given a target output intensity pattern, find the phase masks that produce it. This piece covers the mathematical foundations of phase retrieval and modern optimization algorithms including Wirtinger Flow, gradient-based methods, and their application to D2NN training.

#### 8.3.1 Phase Retrieval Problem Formulation

**Forward model**:
|U_L|² = |P_L D_L ... P_1 D_1 U_0|²

where D_i = diag(e^{jφ_i}) (phase masks), P_i = propagation

**Phase retrieval**: Find {φ_i} given |U_L|² and U_0
**D2NN training**: Find {φ_i} given |U_L|² = |U_target|² and U_0 = input

**Non-convex problem**: Multiple local minima, global optimum hard to find
**Ill-posed**: Phase information lost in intensity measurement

#### 8.3.2 Classical Phase Retrieval Algorithms

**Gerchberg-Saxton (GS)**:
1. Initialize φ_i randomly
2. Forward propagate: U_L = F({φ_i}) U_0
3. Enforce target intensity: U_L' = |U_target| e^{j arg(U_L)}
4. Backward propagate: U_0' = F⁻¹({φ_i}) U_L'
5. Enforce input constraint: U_0'' = U_0 (or update φ_i)
6. Repeat until convergence

**Limitations**: Slow convergence, local minima, no guarantees

**Fienup algorithms** (Hybrid Input-Output):
- Error reduction (ER): Same as GS
- HIO: U_0' = U_0 - β U_0' (outside support)
- Better escape from local minima

**Difference map / Douglas-Rachford**:
- Projection onto constraint sets
- Provable convergence for convex sets
- Extended to non-convex via averaging

#### 8.3.3 Wirtinger Flow

**Loss function** (amplitude):
L(φ) = ½ || |U_L(φ)| - y ||²₂
where y = |U_target| (target amplitude)

**Wirtinger gradient** (for real loss, complex parameters):
∂L/∂φ* = (∂L/∂U_L) (∂U_L/∂φ*) + c.c.

**Chain rule through layers**:
∂L/∂U_k = (∂U_L/∂U_k)† ∂L/∂U_L
∂U_{k+1}/∂U_k = P_k D_k

**Adjoint method** (efficient gradient):
1. Forward: U_0 → U_1 → ... → U_L
2. Compute ∂L/∂U_L = (|U_L| - y) ⊙ (U_L/|U_L|)
3. Backward: λ_L = ∂L/∂U_L
   λ_k = P_k† D_k† λ_{k+1}
4. Gradient: ∂L/∂φ_k = 2 Im[λ_k* ⊙ (D_k U_{k-1})]

**Convergence guarantees** (for oversampled random masks):
- With m ≥ c n log n measurements
- Wirtinger Flow converges to global minimum
- Linear convergence rate

#### 8.3.4 Intensity Loss vs. Amplitude Loss

**Amplitude loss** (used in Wirtinger Flow):
L_amp = ½ Σ (|U_L| - |U_target|)²

**Intensity loss** (more common in D2NN):
L_int = ½ Σ (|U_L|² - |U_target|²)²

**Gradient difference**:
∂L_int/∂U_L = (|U_L|² - |U_target|²) U_L
∂L_amp/∂U_L = (|U_L| - |U_target|) (U_L/|U_L|)

**Intensity loss advantages**:
- No division by |U_L| (avoids singularity at zeros)
- More natural for photodetectors (measure intensity)
- Smoother gradient near zeros

**Intensity loss disadvantages**:
- Fourth-order polynomial in φ
- More local minima
- Stronger local minima

#### 8.3.5 Phase Mask Parameterization

**Continuous phase** (ideal):
φ(x,y) ∈ [0, 2π)
Optimization over ℝ^{N²}
Unconstrained: use tanh/softplus for bounds

**Quantized phase** (fabrication):
K-level phase: φ ∈ {0, 2π/K, ..., 2π(K-1)/K}

**Straight-through estimator (STE)**:
Forward: φ_q = round(Kφ/2π) × 2π/K
Backward: ∂φ_q/∂φ = 1 (identity)

**Gumbel-Softmax relaxation**:
Soft quantization during training
φ_q = Σ_k π_k φ_k
π_k = softmax((log α_k + g_k)/τ)
τ → 0 during training

**Binarization (K=2)**:
Forward: sign(φ) or threshold
Backward: STE or sigmoid gradient
Most hardware-friendly but limited expressivity

#### 8.3.6 Gradient-Based D2NN Training

**End-to-end training** (all layers simultaneously):
- Initialize φ_i from random or pre-trained
- Forward: U_out = F({φ_i}) U_in
- Loss: L = L_int(|U_out|², |U_target|²) + R(φ)
- Backward: ∂L/∂φ via adjoint
- Update: φ ← φ - η ∂L/∂φ

**Regularization**:
R(φ) = λ₁ TV(φ) + λ₂ ||φ||² + λ₃ ||∇φ||²
TV: total variation (promotes smoothness)
L₂: weight decay

**Learning rate scheduling**:
- Cosine annealing
- Warm restart
- Adaptive (Adam, RMSprop)

**Layer-wise training** (for deep D2NNs):
1. Train layer 1 (freeze others)
2. Freeze layer 1, train layer 2
...
L. Fine-tune all layers
Avoids vanishing gradients

#### 8.3.7 Physics-Informed Initialization

**Random initialization**: Slow convergence, poor local minima

**Phase-only hologram methods**:
1. **Fourier hologram**: φ = arg(ℱ⁻¹[|U_target|])
2. **Fresnel hologram**: φ = arg(ASM⁻¹[|U_target|])
3. **Iterative Fourier transform**: GS algorithm for initial guess

**Layer-wise physics-based init**:
- Layer 1: Fourier transform of target
- Layer 2: Residual correction
- ...

**Transfer learning**:
Pre-train on similar tasks
Fine-tune for specific task

#### 8.3.8 Multi-Objective and Constrained Optimization

**Constraints**:
- Phase range: φ ∈ [0, 2π)
- Quantization: φ ∈ {0, 2π/K, ...}
- Fabrication: minimum feature size
- Power: Σ |∇φ|² < budget

**Constrained optimization**:
- Projection: φ ← P_C(φ - η∇L)
- Penalty: L_total = L + λ ||P_C(φ) - φ||²
- Augmented Lagrangian

**Multi-objective**:
- Accuracy vs. efficiency
- Robustness vs. performance
- Pareto front exploration

#### 8.3.9 Stochastic and Global Optimization

**Simulated annealing**:
T(t) = T_0 / log(1+t)
Escapes local minima
Slow but global

**Genetic algorithms**:
Population of phase masks
Crossover, mutation, selection
Parallel evaluation

**Bayesian optimization**:
Gaussian process surrogate
Expected improvement acquisition
Good for expensive evaluations

**Evolutionary strategies** (CMA-ES):
Covariance matrix adaptation
Derivative-free
Robust to noise

#### 8.3.10 Training Convergence and Diagnostics

**Convergence metrics**:
- Loss curve: L(t)
- Gradient norm: ||∇L||
- Output fidelity: F = |⟨U_out|U_target⟩|²

**Failure modes**:
- **Stagnation**: Gradient too small (barren plateau)
- **Oscillation**: Learning rate too high
- **Collapse**: All phases → constant
- **Speckle**: High-frequency artifacts

**Diagnostics**:
- Gradient norm per layer
- Fourier spectrum of φ_i
- Output spectrum vs target
- Gradient alignment: cos(θ) = gᵀg_true/|g||g_true|

**Remedies**:
- Layer-wise training
- Better initialization
- Regularization (TV, smoothness)
- Curriculum learning (easy → hard)

---

*End of Piece 3. Next: Piece 4 - Multi-Layer Diffractive Network as Deep Linear Operator*