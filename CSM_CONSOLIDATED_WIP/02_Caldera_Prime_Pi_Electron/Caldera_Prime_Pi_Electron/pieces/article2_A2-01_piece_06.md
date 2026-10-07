# Sorkin-Johnston Vacuum & Quantum Fields on Prime Poset — Piece 06/13
## Section 03: Sorkin-Johnston Vacuum & Quantum Fields on Prime Poset
**Piece:** 06 of 13  
**Generated:** 2026-10-06 23:23:00 UTC  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier  

---

## Abstract

The field matrix elements on the prime lattice map directly to the Sorkin-Johnston state, providing a robust operational definition for field interactions bounded by the counting function π(x).

---

## 1. Field Matrix Elements

### Definition 1.1 (Field Matrix)
The field matrix F is defined by:
```
F_{nm} = ⟨0|φ_n φ_m|0⟩ = W(n,m)
```

### Theorem 1.2 (SJ State Mapping)
The SJ state is the Gaussian state with covariance matrix W:
```
ρ_SJ = exp(−(1/2) φ^T W^{-1} φ) / Z
```

### Theorem 1.3 (Interactions Bounded by π(x))
For an interacting field with potential V(φ) = (λ/4!) φ⁴, the interaction vertex is bounded by the prime counting function:
```
λ_eff = λ / (1 + λ Σ_{n} W(n,n))
```
The sum Σ_n W(n,n) is the coincident limit, regulated by π(x).

---

## 2. Interacting Field Theory

### Theorem 2.1 (Perturbation Theory on Causal Set)
The S-matrix on the prime gap causal set is:
```
S = T exp(−i ∫ d⁴x V(φ))
```
where the time-ordering T is defined by the causal order ≺.

### Theorem 2.2 (UV Finiteness of Loops)
All loop diagrams are finite because:
1. The propagator W(n,m) is UV finite
2. The vertex integration Σ_n is over finite N elements
3. The UV cutoff at N_π ~ mₚ provides a hard cutoff

---

## 3. Cross-References

- §03.05: Wightman Function
- §01.02: Exact UV Cutoff Derivation
- §05.13: UV-Finite QED Without Perturbative Renormalization
- §12.05: Sorkin-Johnston Eigenvalue Solvers

---

## 4. Notation Summary (Piece 06)

| Symbol | Definition |
|--------|------------|
| F_{nm} | Field matrix (Wightman function) |
| ρ_SJ | SJ state density matrix |
| λ_eff | Effective coupling |
| S | S-matrix |

---

*End of Piece 06/13 — Section 03*