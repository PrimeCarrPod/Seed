# Document 6: Mach-Zehnder Interferometer Mesh Theory
## Piece 10: Adjoint Method for Mesh Gradient Computation

---

### 6.10 Adjoint Method for Mesh Gradient Computation

The adjoint method provides an efficient algorithm for computing gradients of a loss function with respect to all MZI mesh parameters simultaneously. It leverages the linear optical nature of the mesh to compute gradients in O(N²) time instead of O(N³) for finite differences, making it essential for training large-scale optical neural networks.

#### 6.10.1 Adjoint Method Fundamentals

**Forward problem**: Given mesh parameters θ, compute output
|ψ_out⟩ = U(θ)|ψ_in⟩ = U_M ... U_2 U_1 |ψ_in⟩

**Loss function**: L = ||ψ_out - ψ_target||²

**Adjoint state**: |λ⟩ = ∂L/∂⟨ψ_out| = 2(ψ_out - ψ_target)

**Adjoint propagation** (backward):
|λ_k⟩ = U_{k+1}† ... U_M† |λ⟩ = U_{k+1→M}† |λ⟩

**Gradient for MZI k**:
∂L/∂θ_k = 2 Im[ ⟨λ_k| G_k |ψ_k⟩ ]
where |ψ_k⟩ = U_{1→k} |ψ_in⟩, G_k = U† ∂U/∂θ_k

#### 6.10.2 Single-Input Adjoint Algorithm

**Inputs**: θ (mesh parameters), |ψ_in⟩, |ψ_target⟩
**Outputs**: ∂L/∂θ (gradient vector)

```
# Forward pass (store intermediate states)
|ψ_0⟩ = |ψ_in⟩
for k = 1 to M:
    |ψ_k⟩ = U_k(θ_k) |ψ_{k-1}⟩
    store |ψ_k⟩

# Compute loss and adjoint
|ψ_out⟩ = |ψ_M⟩
L = ||ψ_out - ψ_target||²
|λ_M⟩ = 2(ψ_out - ψ_target)

# Backward pass
for k = M down to 1:
    |λ_{k-1}⟩ = U_k† |λ_k⟩
    ∂L/∂θ_k = 2 Im[ ⟨λ_k| G_k |ψ_k⟩ ]
```

**Complexity**: O(M N) = O(N³) for N×N mesh
**Memory**: O(M N) = O(N³) for storing |ψ_k⟩

#### 6.10.3 Batch Adjoint for Multiple Inputs

**Batch of B inputs**: |Ψ_in⟩ ∈ ℂ^{N×B}
**Target**: |Ψ_target⟩ ∈ ℂ^{N×B}
**Loss**: L = ||Ψ_out - Ψ_target||_F²

**Forward pass**:
|Ψ_0⟩ = |Ψ_in⟩
for k = 1 to M:
    |Ψ_k⟩ = U_k |Ψ_{k-1}⟩

**Adjoint matrix**:
Λ = 2(Ψ_out - Ψ_target) ∈ ℂ^{N×B}

**Backward pass**:
|Λ_M⟩ = Λ
for k = M down to 1:
    |Λ_{k-1}⟩ = U_k† |Λ_k⟩
    ∂L/∂θ_k = 2 Im[ Tr( G_k Ψ_k Λ_k† ) ]

**BLAS Level 3 operations**: Efficient on GPU

#### 6.10.4 Adjoint for Unitary Manifold

**Riemannian gradient**:
grad L = P_U(∂L/∂U*) = ½ (∂L/∂U* - U ∂L/∂U^T U*)

**Adjoint computes** ∂L/∂U = Λ Ψ_in†
**Projection**: grad L = ½ (Λ Ψ_in† - U Ψ_in Λ† U†)

**Parameter gradient**:
∂L/∂θ_k = Tr[ G_k grad L ]
= ½ Tr[ G_k (Λ Ψ_in† - U Ψ_in Λ† U†) ]

#### 6.10.5 Automatic Differentiation Integration

**PyTorch custom Function**:
```python
class MZIMeshFunction(torch.autograd.Function):
    @staticmethod
    def forward(ctx, theta, psi_in, psi_target):
        psi_out = mesh_forward(theta, psi_in)
        loss = F.mse_loss(psi_out, psi_target)
        ctx.save_for_backward(theta, psi_in, psi_out, psi_target)
        return loss
    
    @staticmethod
    def backward(ctx, grad_loss):
        theta, psi_in, psi_out, psi_target = ctx.saved_tensors
        # Adjoint method
        lambda_out = 2 * (psi_out - psi_target) * grad_loss
        grad_theta = adjoint_backward(theta, psi_in, lambda_out)
        return grad_theta, None, None
```

**JAX**:
```python
@jax.grad
def loss_fn(theta, psi_in, psi_target):
    psi_out = mesh_forward(theta, psi_in)
    return jnp.sum(jnp.abs(psi_out - psi_target)**2)
```

#### 6.10.6 Gradient Checkpointing for Large Meshes

**Problem**: Storing all |ψ_k⟩ uses O(N³) memory
**Solution**: Checkpointing (recompute intermediate states)

**Strategy**:
- Store every K-th state: |ψ_0⟩, |ψ_K⟩, |ψ_2K⟩, ...
- During backward: recompute from nearest checkpoint
- Memory: O((M/K) N + K N)
- Time overhead: ~2×

**Optimal K**: K ≈ √M (balance memory/compute)

#### 6.10.7 Vector-Jacobian Products (VJP)

**For reverse-mode AD**: Need VJP of mesh forward
v = ∂L/∂ψ_out (cotangent)
VJP: v† → ∂L/∂θ

**Mesh VJP**:
1. v† U_{k+1→M} → v_k†
2. v_k† ∂U_k/∂θ_k → ∂L/∂θ_k

**Same as adjoint method**: v = λ

#### 6.10.8 Higher-Order Derivatives

**Hessian-vector product** (for Newton methods):
H v = ∇_θ (v† ∇_θ L)

**Forward-over-reverse**:
1. Reverse: compute ∇_θ L (adjoint)
2. Forward: perturb θ, compute ∇_θ L(θ+εv)
3. H v ≈ (∇_θ L(θ+εv) - ∇_θ L(θ))/ε

**Complexity**: O(N³) per HVP

#### 6.10.9 Distributed Adjoint for Large Meshes

**Model parallelism**: Split mesh across GPUs
- Each GPU holds subset of MZIs
- Forward: pass |ψ⟩ between GPUs
- Backward: pass |λ⟩ between GPUs

**Data parallelism**: Multiple batches
- Each GPU computes gradient for its batch
- All-reduce gradients

**Pipeline parallelism**: Overlap forward/backward
- Micro-batches in pipeline
- Gradient accumulation

#### 6.10.10 Adjoint Method Validation

**Finite difference check**:
∂L/∂θ_k ≈ (L(θ+εe_k) - L(θ-εε_k)) / 2ε

**Relative error**:
|∂L_adjoint/∂θ_k - ∂L_FD/∂θ_k| / |∂L_FD/∂θ_k|

**Target**: < 10⁻⁶ for double precision
< 10⁻⁴ for single precision

**Unit tests**:
- Random unitary, random input
- Known analytic gradients (e.g., single MZI)
- Gradient w.r.t. phase shifter at bar/cross state

**Numerical stability**:
- Use double precision for accumulation
- Normalize intermediate states
- Check unitarity: ||U†U - I|| < 10⁻¹²

---

*End of Piece 10. Document 6 complete (10 pieces). Next: Glue pieces into Doc06_Final.md*