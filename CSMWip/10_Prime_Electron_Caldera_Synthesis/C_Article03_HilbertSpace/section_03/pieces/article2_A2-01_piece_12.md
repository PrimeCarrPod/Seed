# Sorkin-Johnston Vacuum & Quantum Fields on Prime Poset — Piece 12/13
## Section 03: Sorkin-Johnston Vacuum & Quantum Fields on Prime Poset
**Piece:** 12 of 13  
**Generated:** 2026-10-06 23:29:00 UTC  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier  

---

## Abstract

We provide the computational protocols for the SJ formalism on the prime poset, including eigenvalue solvers and Green's function computation.

---

## 1. Eigenvalue Solvers

### Algorithm 1.1 (Lanczos for iΔ)
```
Input: Matrix-vector multiply function for iΔ, dimension N, target eigenvalues k
Output: k largest positive eigenvalues and eigenvectors

1. Initialize random vector v_1, β_0 = 0
2. For j = 1 to k:
   a. w = iΔ(v_j) − β_{j-1} v_{j-1}
   b. α_j = v_j^T w
   c. w = w − α_j v_j
   d. β_j = ||w||
   e. v_{j+1} = w / β_j
3. Form tridiagonal matrix T_k with α_j on diagonal, β_j on off-diagonal
4. Compute eigendecomposition of T_k
5. Return approximate eigenvalues/eigenvectors
```

### Algorithm 1.2 (Stochastic Trace Estimation)
```
Input: Function to compute iΔ(v), number of samples M
Output: Tr log(iΔ) estimate

1. sum = 0
2. For m = 1 to M:
   a. Generate random vector z_m with ±1 entries
   b. Compute w_m = log(iΔ)(z_m) using Lanczos
   c. sum += z_m^T w_m
3. Return sum / M
```

---

## 2. Cross-References

- §03.10: Numerical Implementation
- §12.05: Sorkin-Johnston Eigenvalue Solvers
- §12.06: Graph Invariant Computation

---

## 3. Notation Summary (Piece 12)

| Symbol | Definition |
|--------|------------|
| k | Number of target eigenvalues |
| α_j, β_j | Lanczos coefficients |
| M | Number of stochastic samples |

---

*End of Piece 12/13 — Section 03*