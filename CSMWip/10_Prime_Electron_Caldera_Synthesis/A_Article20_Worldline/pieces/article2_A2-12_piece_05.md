# Mathematical_Compendium_Computational_Protocols — Piece 05/13
## Article A2: A2-12 — Appendix: Mathematical Compendium & Computational Protocols
**Piece:** 05 of 13  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier  
**Generated:** 2026-10-08 02:19:00 UTC

---

## PIECE 05: SORKIN-JOHNSTON EIGENVALUE SOLVERS FOR LARGE POSETS

### 5.1 The SJ Vacuum as Numerical Linear Algebra

Section 3 established that the Sorkin-Johnston vacuum state on a causal set (C, ≺) is defined by the positive spectral subspace of the Pauli-Jordan operator Δ = iG_ret - iG_adv. The retarded Green's function G_ret is the inverse of the discrete d'Alembertian □_C on the causal set. Computing the SJ vacuum requires solving large sparse linear systems and eigenvalue problems.

### 5.2 Discrete d'Alembertian on Causal Set

For a scalar field φ on a causal set, the discrete d'Alembertian is:

(□_C φ)(x) = (4/√ρ) [ φ(x) - Σ_{y≺x} w₁(x,y)φ(y) + Σ_{y≺x} w₂(x,y)φ(y) - Σ_{y≺x} w₃(x,y)φ(y) ]

where the weights w_k depend on the causal interval volumes. For the prime causal set (chain), this simplifies dramatically.

**Algorithm DISCRETE_DALAMBERTIAN(chain, ρ):**
```
1. N ← length(chain)
2. □ ← sparse N×N matrix
3. For x = 0 to N-1:
4.     □[x,x] ← 4/√ρ
5.     For k = 1 to 3:
6.         If x-k ≥ 0:
7.             w ← weight_k(k, ρ)  // Precomputed from interval volumes
8.             □[x, x-k] ← -w * 4/√ρ * (-1)^k
9. Return □
```

For the chain, □ is banded (4 diagonals). But for the coarse-grained 4D sprinkling, □ is sparse but not banded.

### 5.3 Retarded Green's Function: Sparse Linear Solve

G_ret = □_C⁻¹ (with retarded boundary conditions: G_ret(x,y) = 0 unless y ≺ x).

Since □ is lower-triangular (causal), the inverse is computed by forward substitution:

**Algorithm RETARDED_GREEN(□):**
```
1. N ← □.shape[0]
2. G ← sparse N×N matrix (lower triangular)
3. For x = 0 to N-1:
4.     // Solve □[:,x] * G[:,x] = e_x
5.     G[x,x] ← 1 / □[x,x]
6.     For y = x+1 to N-1:
7.         sum ← 0
8.         For k = max(0, y-3) to y-1:  // Bandwidth 3
9.             sum ← sum + □[y,k] * G[k,x]
10.        G[y,x] ← -sum / □[y,y]
11. Return G
```

**Complexity:** O(N) for banded matrix (chain), O(N²) for general sprinkling

### 5.4 Pauli-Jordan Operator and Eigenvalue Problem

Δ = i(G_ret - G_adv) = i(G_ret - G_retᵀ) since G_adv = G_retᵀ.

For the chain, Δ is skew-symmetric and tridiagonal. Eigenvalues give the mode frequencies.

**Algorithm PAULI_JORDAN(G_ret):**
```
1. Δ ← i * (G_ret - G_ret.T)
2. Return Δ
```

**Algorithm SJ_VACUUM_STATES(Δ, n_modes):**
```
1. // Find smallest n_modes positive eigenvalues
2. eigvals, eigvecs ← EIGS(Δ, k=n_modes, which='SM', sigma=0)
   // Use ARPACK via scipy.sparse.linalg.eigs
3. // Filter positive eigenvalues
4. pos_mask ← eigvals > 1e-12
5. ω ← eigvals[pos_mask]
6. modes ← eigvecs[:, pos_mask]
7. Return ω, modes
```

### 5.5 Two-Point Wightman Function

The Wightman function is the projection onto positive eigenspace:

W(x,y) = Σ_{ωₙ>0} φₙ(x) φₙ(y)

**Algorithm WIGHTMAN_FUNCTION(Δ, n_modes):**
```
1. ω, modes ← SJ_VACUUM_STATES(Δ, n_modes)
2. W ← modes @ modes.T  // Outer product sum
3. Return W
```

### 5.6 Large-Scale Solvers: Lanczos and Krylov Methods

For N > 10⁵, full eigendecomposition is impossible. Use Lanczos on the positive subspace:

**Algorithm LANCZOS_SJ(Δ, n_modes, max_iter):**
```
1. // Lanczos on Δ restricted to positive eigenspace
2. // Use shift-invert mode with σ = 0 to find smallest positive eigenvalues
3. eigvals, eigvecs ← sp.linalg.eigsh(Δ, k=n_modes, which='SA', 
                                       maxiter=max_iter, tol=1e-10)
4. Return eigvals, eigvecs
```

**Preconditioning:** Use diagonal of □ as preconditioner for shift-invert.

### 5.7 Massless Limit and Conformal Invariance

Section 3, Piece 7 showed conformal invariance in the massless limit. Numerically:

**Algorithm CONFORMAL_CHECK(Δ_chain, scales):**
```
1. For each scale factor λ:
2.     Δ_scaled ← SCALE_CAUSAL_SET(Δ_chain, λ)
3.     ω, modes ← LANCZOS_SJ(Δ_scaled, n_modes=100)
4.     // Check scaling: ωₙ(λ) = λ⁻¹ ωₙ(1)
5.     ratios ← ω_scaled / ω_original
6.     Print(λ, mean(ratios), std(ratios))
```

### 5.8 Stress-Energy Tensor on Causal Set

The stress-energy tensor is computed from the Wightman function:

⟨T_μν(x)⟩ = lim_{y→x} [∇_μ∇_ν' - ½g_μν g^αβ ∇_α∇_β'] W(x,y) + ...

On the causal set, this becomes finite differences of W.

**Algorithm STRESS_ENERGY(W, causal_set):**
```
1. T ← zeros(N, 4, 4)  // 4D components
2. For x in range(N):
3.     // Finite difference approximation
4.     For each direction μ:
5.         x_plus ← NEIGHBOR(causal_set, x, μ, +1)
6.         x_minus ← NEIGHBOR(causal_set, x, μ, -1)
7.         if x_plus and x_minus:
8.             d2W ← (W[x_plus, x_plus] - 2*W[x,x] + W[x_minus, x_minus]) / ε²
9.             T[x, μ, μ] ← d2W
10. Return T
```

### 5.9 Effective Action and Quantum-Corrected Einstein Equations

The effective action is Γ = S_BD + ½ Tr log(□_C + m²) + ...

**Algorithm EFFECTIVE_ACTION(□, m²):**
```
1. // Compute log determinant via Lanczos
2. eigvals ← LANCZOS_EIGVALS(□ + m²*I, n=1000)
3. log_det ← Σ log(eigvals)
4. Γ ← S_BD + 0.5 * log_det
5. Return Γ
```

### 5.10 Complete SJ Solver Pipeline

```python
import scipy.sparse as sp
import scipy.sparse.linalg as sla
import numpy as np

class SJSolver:
    def __init__(self, causal_set, rho):
        self.C = causal_set
        self.rho = rho
        self.N = len(causal_set)
    
    def build_dalembertian(self):
        """Build discrete d'Alembertian matrix."""
        N = self.N
        sqrt_rho = np.sqrt(self.rho)
        data = []
        rows = []
        cols = []
        
        for x in range(N):
            # Diagonal
            data.append(4/sqrt_rho)
            rows.append(x)
            cols.append(x)
            
            # Off-diagonals (chain: only previous 3 elements)
            for k in range(1, 4):
                if x - k >= 0:
                    w = self.weight(k)
                    sign = -1 if k % 2 == 1 else 1
                    data.append(sign * w * 4/sqrt_rho)
                    rows.append(x)
                    cols.append(x - k)
        
        return sp.csr_matrix((data, (rows, cols)), shape=(N, N))
    
    def weight(self, k):
        """Weights for chain: derived from interval volumes."""
        # For chain, interval volumes are just proper time differences
        # w_k = V_k / V_{k-1} * binomial factors
        return 1.0 / k  # Simplified
    
    def retarded_green(self, box):
        """Forward substitution for lower-triangular box."""
        N = box.shape[0]
        G = sp.lil_matrix((N, N))
        for x in range(N):
            G[x, x] = 1.0 / box[x, x]
            for y in range(x+1, min(x+4, N)):  # Bandwidth 3
                s = sum(box[y, k] * G[k, x] for k in range(max(0, y-3), y))
                G[y, x] = -s / box[y, y]
        return G.tocsr()
    
    def pauli_jordan(self, G_ret):
        return 1j * (G_ret - G_ret.T)
    
    def sj_modes(self, Delta, n_modes=100):
        """Find smallest positive eigenvalues of Delta."""
        # Shift-invert for smallest positive
        eigvals, eigvecs = sla.eigsh(Delta, k=n_modes, which='SA', 
                                      sigma=1e-12, maxiter=5000)
        pos = eigvals > 1e-10
        return eigvals[pos], eigvecs[:, pos]
    
    def wightman(self, eigvals, eigvecs):
        return eigvecs @ eigvecs.T
    
    def solve(self, n_modes=100):
        box = self.build_dalembertian()
        G = self.retarded_green(box)
        Delta = self.pauli_jordan(G)
        eigvals, eigvecs = self.sj_modes(Delta, n_modes)
        W = self.wightman(eigvals, eigvecs)
        return eigvals, eigvecs, W

# Usage
# causal_set = PrimeCausalSet(10000)
# solver = SJSolver(causal_set, rho=1.55e21)
# eigvals, eigvecs, W = solver.solve(200)
```

---

*End of Piece 05 — Sorkin-Johnston Eigenvalue Solvers*