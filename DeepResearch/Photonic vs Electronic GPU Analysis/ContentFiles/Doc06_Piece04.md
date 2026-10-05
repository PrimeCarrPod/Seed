# Document 6: Mach-Zehnder Interferometer Mesh Theory
## Piece 4: Gradient Descent on Unitary Manifold: Wirtinger Calculus

---

### 6.4 Gradient Descent on Unitary Manifold: Wirtinger Calculus

Training MZI meshes for optical neural networks requires optimizing over the unitary manifold U(N) or SU(N). Standard Euclidean gradient descent fails to preserve unitarity. Wirtinger calculus provides the correct framework for computing gradients of real-valued loss functions with respect to complex unitary parameters.

#### 6.4.1 Wirtinger Calculus Fundamentals

**Complex derivative**: For f: ℂ → ℂ, holomorphic if ∂f/∂z* = 0
**Wirtinger derivatives**:
∂/∂z = ½(∂/∂x - j∂/∂y)
∂/∂z* = ½(∂/∂x + j∂/∂y)

**For real-valued function** L: ℂⁿ → ℝ:
∇_z L = 2 ∂L/∂z* (conjugate gradient)
∇_z* L = 2 ∂L/∂z

**Chain rule**: If w = g(z), then ∂L/∂z = (∂L/∂w)(∂w/∂z) + (∂L/∂w*)(∂w*/∂z)

#### 6.4.2 Unitary Manifold Geometry

**Manifold**: U(N) = {U ∈ ℂ^{N×N} : U†U = I}
**Tangent space** at U: T_U U(N) = {U A : A† = -A} (skew-Hermitian)
**Dimension**: N² real dimensions (N²-1 for SU(N))

**Riemannian metric**: ⟨X, Y⟩ = Re[Tr(X† Y)]
**Geodesic**: U(t) = U(0) exp(t A) for A† = -A

**Projection to tangent space**:
P_U(X) = ½ (X - U X† U) for X ∈ ℂ^{N×N}

#### 6.4.3 Gradient on Unitary Manifold

**Loss function**: L(U) where U = U(θ) is mesh unitary
**Euclidean gradient**: G = ∂L/∂U* ∈ ℂ^{N×N}

**Riemannian gradient** (projected):
grad L = P_U(G) = ½ (G - U G† U)

**Verification**: grad L is skew-Hermitian in U† basis:
U† (grad L) + (grad L)† U = 0

**Update rule** (Riemannian gradient descent):
U_{k+1} = U_k exp(-η grad L)
= U_k exp(-½η (G_k - U_k G_k† U_k))

**Retraction** (first-order approximation):
U_{k+1} = (I + ½η (G_k - U_k G_k† U_k)) U_k
Followed by polar decomposition for exact unitarity

#### 6.4.4 Gradient w.r.t. Mesh Parameters

**Mesh parameterization**: U = U(θ) where θ = [θ₁, ..., θ_M] (M = N(N-1)/2)

**Chain rule**:
∂L/∂θ_k = Tr[ (∂L/∂U)† ∂U/∂θ_k ] + c.c.
= 2 Re[ Tr( (∂L/∂U)† ∂U/∂θ_k ) ]

**Generator for MZI(k)**:
∂U/∂θ_k = U G_k
where G_k = U† ∂U/∂θ_k is skew-Hermitian (local generator)

**Gradient**:
∂L/∂θ_k = 2 Im[ Tr( G_k† U† ∂L/∂U ) ]
= 2 Im[ ⟨ψ_out| G_k |ψ_in⟩ ] (for single input-output)

#### 6.4.5 Adjoint Method for Efficient Gradient

**Single input-output pair**:
Input: |ψ_in⟩, Target: |ψ_target⟩
Output: |ψ_out⟩ = U|ψ_in⟩
Loss: L = ||ψ_out - ψ_target||²

**Adjoint variable**:
|λ⟩ = ∂L/∂⟨ψ_out| = 2 (ψ_out - ψ_target)

**Gradient**:
∂L/∂θ_k = 2 Im[ ⟨λ| G_k |ψ_out⟩ ]

**Efficient computation**:
1. Forward: |ψ_out⟩ = U|ψ_in⟩ (store intermediate states)
2. Backward: |λ⟩ from output
3. For each k: compute ⟨λ| G_k |ψ_k⟩

**Complexity**: O(M N) per gradient (M = N(N-1)/2)

#### 6.4.6 Batch Gradient for Multiple Inputs

**Batch of B inputs**: |Ψ_in⟩ = [|ψ₁⟩, ..., |ψ_B⟩] ∈ ℂ^{N×B}
Target: |Ψ_target⟩
Output: |Ψ_out⟩ = U|Ψ_in⟩

**Loss**: L = ||Ψ_out - Ψ_target||_F²

**Adjoint matrix**: Λ = 2 (Ψ_out - Ψ_target) ∈ ℂ^{N×B}

**Gradient**:
∂L/∂θ_k = 2 Im[ Tr( G_k Ψ_out Λ† ) ]
= 2 Im[ Tr( G_k Ψ_k Λ† ) ] (where Ψ_k = U_k ... U_1 Ψ_in)

**Matrix form**: Efficient using BLAS Level 3 operations

#### 6.4.7 Natural Gradient and Fisher Information

**Fisher information metric** on U(N):
F = E[ ∇L ∇L† ]

**Natural gradient**:
∇_nat L = F⁻¹ ∇L

**For unitary manifold**: Natural gradient = Riemannian gradient
(Fisher metric = Riemannian metric for uniform distribution)

**Advantage**: Invariant to parameterization
**Disadvantage**: Requires F⁻¹ (O(N⁶) for full)

**Approximate natural gradient**:
K-FAC (Kronecker-Factored Approximate Curvature)
Block-diagonal F

#### 6.4.8 Optimization Algorithms on Manifold

**Riemannian SGD**:
θ_{k+1} = Retr_{θ_k}(-η grad L)
Retraction: exponential map or Cayley transform

**Riemannian Adam**:
m_k = β₁ m_{k-1} + (1-β₁) grad_k
v_k = β₂ v_{k-1} + (1-β₂) grad_k²
θ_{k+1} = Retr_{θ_k}(-η m_k / √(v_k + ε))

**Riemannian L-BFGS**:
Store (s_k, y_k) in tangent space
s_k = Retr_{θ_k}⁻¹(θ_{k+1}) (vector transport)
y_k = grad_{k+1} - grad_k

#### 6.4.8 Constrained Optimization (Fixed Phases)

**Sometimes**: Fix some phases (e.g., input/output phases)
**Constrained manifold**: Submanifold of U(N)
**Projected gradient**: Project grad onto allowed subspace

**Phase constraints** (e.g., θ_k ∈ [0, 2π]):
- Use modulo 2π after update
- Or use barrier functions: -log(sin(θ/2))

#### 6.4.9 Automatic Differentiation Frameworks

**PyTorch**:
- Custom autograd Function for mesh
- Forward: matrix multiplications
- Backward: adjoint method

**JAX**:
- jax.grad with complex numbers
- jax.jit for compilation
- Built-in manifold optimization (jaxopt)

**TensorFlow**:
- tf.complex128
- Custom gradient with @tf.custom_gradient

**Photonic-specific frameworks**:
- SimuQ (quantum)
- Photontorch (classical)
- MZI mesh layers

#### 6.4.10 Barren Plateaus and Mitigation

**Barren plateau**: Gradient variance exponentially small in N
Var(∂L/∂θ) ∝ 1/2^N for random unitaries

**Causes**:
- Deep circuits (many MZIs)
- Global loss (e.g., fidelity to target)
- Expressibility (Haar-random unitaries)

**Mitigation**:
1. **Local loss functions**: Layer-wise, not global
2. **Parameter initialization**: Identity + small noise
3. **Layer-wise training**: Train one layer at a time
4. **Entanglement-breaking layers**: Reduce expressibility
5. **Classical pre-training**: Initialize near target

**Gradient variance scaling** (empirical):
Reck: Var ∝ 1/N
Clements: Var ∝ 1/√N
Layer-wise: Var constant

---

*End of Piece 4. Next: Piece 5 - Singular Value Decomposition via Optical Mesh Calibration*