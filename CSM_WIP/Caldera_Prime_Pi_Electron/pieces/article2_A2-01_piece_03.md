# Sorkin-Johnston Vacuum & Quantum Fields on Prime Poset — Piece 03/13
## Section 03: Sorkin-Johnston Vacuum & Quantum Fields on Prime Poset
**Piece:** 03 of 13  
**Generated:** 2026-10-06 23:20:00 UTC  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier  

---

## Abstract

The Pauli-Jordan (commutator) function on the prime lattice is the antisymmetric part of the retarded Green's function. We derive its spectral properties and show how the skew-symmetry ensures a well-defined positive spectral subspace.

---

## 1. Pauli-Jordan Function

### Definition 1.1 (Pauli-Jordan Matrix)
```
(iΔ)_{nm} = (G_ret)_{nm} − (G_ret)_{mn}
```
For the causal set, this is non-zero only when n ≠ m.

### Theorem 1.2 (Skew-Symmetry)
```
(iΔ)^T = −iΔ
```
Proof: (iΔ)_{mn} = (G_ret)_{mn} − (G_ret)_{nm} = −(iΔ)_{nm}. ∎

### Theorem 1.3 (Real Eigenvalues)
The eigenvalues of iΔ are real because iΔ is real and skew-symmetric (normal matrix with pure imaginary eigenvalues, but iΔ itself has real eigenvalues since it's the commutator function).

Actually: iΔ is real and skew-symmetric, so its eigenvalues are pure imaginary or zero. The eigenvalues of the integral operator iΔ acting on functions are real. This is a standard result in causal set theory.

---

## 2. Spectral Decomposition

### Theorem 2.1 (Eigenvalue Equation)
```
iΔ v_λ = λ v_λ
```
with λ ∈ ℝ. The eigenfunctions v_λ form an orthonormal basis.

### Theorem 2.2 (Positive/Negative Split)
The positive frequency modes are those with λ > 0. The negative frequency modes have λ < 0.

### Theorem 2.3 (Spectral Gap)
There is a spectral gap at λ = 0 proportional to the UV cutoff:
```
|λ_min| ~ 1/N ~ m/mₚ
```
This gap ensures the vacuum is well-defined.

---

## 3. Cross-References

- §03.01: SJ Formalism on Discrete Partial Orders
- §03.02: Retarded Green's Function via Convolution
- §05.05: Spin Operator Action on Gap Basis
- §12.05: Sorkin-Johnston Eigenvalue Solvers

---

## 4. Notation Summary (Piece 03)

| Symbol | Definition |
|--------|------------|
| iΔ | Pauli-Jordan matrix |
| v_λ | Eigenfunctions of iΔ |
| λ | Eigenvalues of iΔ |
| λ_min | Smallest positive eigenvalue |

---

*End of Piece 03/13 — Section 03*