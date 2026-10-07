# Sorkin-Johnston Vacuum & Quantum Fields on Prime Poset — Piece 10/13
## Section 03: Sorkin-Johnston Vacuum & Quantum Fields on Prime Poset
**Piece:** 10 of 13  
**Generated:** 2026-10-06 23:27:00 UTC  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier  

---

## Abstract

We provide the numerical implementation of the SJ eigenvalue solver for large causal sets, including algorithms for computing the Pauli-Jordan matrix and its positive spectral projection.

---

## 1. Eigenvalue Problem

### Algorithm 1.1 (Pauli-Jordan Matrix Construction)
```
Input: Prime gaps g[1..N], mass m
Output: iΔ matrix (N×N)

1. Compute proper times τ[n] = κ Σ_{k=1}^n g[k]/p[k]
2. Build causal matrix C[n,m] = 1 if m > n else 0
3. Build massless G_0[n,m] = (1/2π) / (τ[m] - τ[n]) for m > n
4. Compute G_ret = (I + i m² C) \ G_0  (forward substitution)
5. Compute iΔ = G_ret - G_ret^T
6. Return iΔ
```

### Algorithm 1.2 (Positive Spectral Projection)
```
Input: iΔ matrix (N×N)
Output: Wightman matrix W (N×N), positive eigenvalues/eigenvectors

1. Compute eigendecomposition: iΔ = V Λ V^T
   (Use Lanczos algorithm for large N)
2. Identify positive eigenvalues: Λ_+ = diag(max(λ_i, 0))
3. Compute W = V Λ_+ V^T
4. Return W, Λ_+, V_+
```

---

## 2. Complexity

### Theorem 2.1 (Computational Complexity)
- iΔ construction: O(N²) time, O(N²) space
- Eigendecomposition: O(N³) dense, O(N²) sparse (Lanczos)
- Wightman computation: O(N²) time, O(N²) space

### Theorem 2.2 (Sparsity)
The matrix iΔ is dense, but the causal matrix C is tridiagonal (for total order). The convolution makes G_0 dense.

---

## 3. Cross-References

- §03.01: SJ Formalism on Discrete Partial Orders
- §03.02: Retarded Green's Function via Convolution
- §12.05: Sorkin-Johnston Eigenvalue Solvers
- §12.04: Benincasa-Dowker Action Numerical Evaluation

---

## 4. Notation Summary (Piece 10)

| Symbol | Definition |
|--------|------------|
| iΔ | Pauli-Jordan matrix |
| V | Eigenvector matrix |
| Λ | Eigenvalue matrix |
| W | Wightman matrix |

---

*End of Piece 10/13 — Section 03*