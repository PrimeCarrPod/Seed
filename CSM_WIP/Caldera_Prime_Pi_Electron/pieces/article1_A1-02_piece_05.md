# Discrete Causal Geometry from Prime Gap Sequences — Piece 05/13
## Section 02: Discrete Causal Geometry from Prime Gap Sequences
**Piece:** 05 of 13  
**Generated:** 2026-10-06 23:04:00 UTC  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier  

---

## Abstract

The dynamics of the causal set are governed by the Benincasa-Dowker action, the discrete analogue of the continuum Einstein-Hilbert action. For a causal set embedded in 4-dimensional spacetime, the action is computed by summing over occurrences of n-element intervals. The non-local nature of the prime gap sequence ensures suppression of pathological non-manifold configurations.

---

## 1. Benincasa-Dowker Action

### Definition 1.1 (BD Action in 4D)
For a causal set C faithfully embedded in 4D spacetime, the Benincasa-Dowker action is:
```
S_BD(C) = N − 9 N₂ + 16 N₃ − 8 N₄
```
where N_k is the number of k-element intervals (order intervals with k elements).

### Theorem 1.2 (Continuum Limit)
In the continuum limit (N → ∞, ρ → ∞ with N/ρ fixed), the BD action converges to the Einstein-Hilbert action:
```
S_BD → (1/16πG) ∫ d⁴x √|g| R
```
where R is the Ricci scalar.

### Theorem 1.3 (Prime Gap BD Action)
For the prime gap causal set up to index N, the interval counts are:
- N = N (number of elements)
- N₂ = N(N−1)/2 (number of 2-element intervals = links)
- N₃ = Σ_{n<m} (m−n−1) = N(N−1)(N−2)/6 (number of 3-element intervals)
- N₄ = N(N−1)(N−2)(N−3)/24 (number of 4-element intervals)

Substituting into S_BD:
```
S_BD = N − 9·N(N−1)/2 + 16·N(N−1)(N−2)/6 − 8·N(N−1)(N−2)(N−3)/24
```
This simplifies to a polynomial in N. The continuum limit requires the sprinkling density ρ = N/V, giving the correct Einstein-Hilbert action.

---

## 2. Non-Locality and Pathological Order Suppression

### Definition 2.1 (Link Matrix)
The link matrix L is the adjacency matrix of the Hasse diagram:
```
L_{nm} = 1 if m covers n (m = n+1), else 0
```

### Definition 2.2 (Kleitman-Rothschild Orders)
A Kleitman-Rothschild (KR) order is a causally structured poset with three layers:
- Bottom layer: N/4 elements
- Middle layer: N/2 elements (all connected to bottom and top)
- Top layer: N/4 elements
It has arbitrarily large spatial extent but only 3 temporal layers.

### Theorem 2.3 (KR Suppression by Prime Gaps)
The prime gap causal set's interval distribution forces destructive interference in the path sum for KR orders.

**Proof Sketch.** The prime gap sequence has long-range correlations (Riemann zeros). The interval counts N_k for the prime gap causal set differ from the KR order's interval counts. The BD action for KR orders is:
```
S_BD(KR) = N − 9(N²/8) + 16(0) − 8(0) = N − (9/8)N²
```
which is large and negative for large N. The prime gap causal set has N_k ~ N^k/k!, giving:
```
S_BD(π) ~ N(1 − 9/2 + 16/6 − 8/24) = 0
```
The path integral weight e^{i S_BD} suppresses KR orders relative to manifold-like orders. ∎

---

## 3. Emergence of Smooth Lorentzian Geometry

### Theorem 3.1 (Manifoldlikeness)
The prime gap causal set is manifoldlike: it admits a faithful embedding into a Lorentzian manifold (the conformally flat geometry from Section 01).

### Corollary 3.2 (Macroscopic Smoothness)
At scales ≫ ℓₚ, the discrete fluctuations average out and the geometry is described by the smooth metric gᵤᵥ = Ω² ηᵤᵥ.

---

## 4. Cross-References

- §01.01: Axiomatic System
- §01.05: Metric Tensor Components
- §02.01: Causal Set Primer
- §02.04: Myrheim-Meyer Dimension Estimator
- §11.05: Quantum Gravity as Discrete Causal Geometry

---

## 5. Notation Summary (Piece 05)

| Symbol | Definition |
|--------|------------|
| S_BD | Benincasa-Dowker action |
| N_k | Number of k-element intervals |
| L_{nm} | Link matrix |
| KR | Kleitman-Rothschild order |
| R | Ricci scalar |

---

*End of Piece 05/13 — Section 02*