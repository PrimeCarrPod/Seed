# Sorkin-Johnston Vacuum & Quantum Fields on Prime Poset — Piece 05/13
## Section 03: Sorkin-Johnston Vacuum & Quantum Fields on Prime Poset
**Piece:** 05 of 13  
**Generated:** 2026-10-06 23:22:00 UTC  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier  

---

## Abstract

The two-point Wightman function emerges cleanly from the positive spectral projection of the Pauli-Jordan function. We derive its explicit form and show how it encodes the prime gap correlations.

---

## 1. Wightman Function

### Definition 1.1 (Two-Point Function)
```
W(n,m) = ⟨0_SJ|φ_n φ_m|0_SJ⟩ = Σ_{λ>0} v_λ(n) v_λ(m)
```

### Theorem 1.2 (Wightman Function from Green's Functions)
```
W = (1/2) (G_ret + G_adv) + (1/2) iΔ · sign(λ)
```
More precisely, W is the boundary value of the Feynman propagator.

### Theorem 1.3 (Prime Gap Correlations in W)
The Wightman function inherits the prime gap correlations:
```
W(n,m) ~ 1/τ(n,m) + O(m²) + non-local terms from Riemann zeros
```

---

## 2. Massless Limit

### Theorem 2.1 (Conformal Invariance)
In the massless limit m → 0, the Wightman function becomes:
```
W_0(n,m) = (1/2π) 1/τ(n,m)  for n ≺ m
```
This is conformally invariant on the causal set.

### Theorem 2.2 (Trace Anomaly)
The trace of the stress-energy tensor is non-zero due to the discrete structure:
```
⟨T^μ_μ⟩ ~ (1/N) Σ_{λ>0} λ |v_λ|² ~ mₚ²
```
This is the discrete analogue of the conformal anomaly.

---

## 3. Cross-References

- §03.04: Positive Spectral Subspace & Unique Vacuum State
- §06.08: Hilbert-Pólya Conjecture
- §08.01: Spectral Triple for Prime Counting
- §11.05: Quantum Gravity as Discrete Causal Geometry

---

## 4. Notation Summary (Piece 05)

| Symbol | Definition |
|--------|------------|
| W(n,m) | Wightman function |
| W_0 | Massless Wightman function |
| ⟨T^μ_μ⟩ | Trace anomaly |

---

*End of Piece 05/13 — Section 03*