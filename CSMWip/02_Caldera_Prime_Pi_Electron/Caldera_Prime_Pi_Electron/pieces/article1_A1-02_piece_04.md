# Discrete Causal Geometry from Prime Gap Sequences — Piece 04/13
## Section 02: Discrete Causal Geometry from Prime Gap Sequences
**Piece:** 04 of 13  
**Generated:** 2026-10-06 23:03:00 UTC  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier  

---

## Abstract

Dimensionality within the causal set is not presupposed but extracted via the Myrheim-Meyer dimension estimator. For the prime gap causal set, the ordering fraction uniquely specifies the embedding dimension of a conformally flat Minkowski space. The scaling of volume with respect to the longest chain distance enforces d = 4.

---

## 1. Myrheim-Meyer Dimension Estimator

### Definition 1.1 (Ordering Fraction)
For a causal set C with N elements, the ordering fraction is:
```
f = 2C / (N(N−1))
```
where C is the number of comparable pairs (causal relations).

### Theorem 1.2 (Dimension from Ordering Fraction)
For a causal set faithfully embedded in d-dimensional Minkowski space, the expected ordering fraction is:
```
⟨f⟩_d = Γ(d+1) Γ(d/2) / (Γ(3d/2) √π) · 2^{d-1}
```
Inverting this function gives the Myrheim-Meyer dimension estimator:
```
d_MM = f^{-1}(f_observed)
```

### Table 1.3: ⟨f⟩_d for Low Dimensions

| d | ⟨f⟩_d |
|---|-------|
| 1 | 1.000 |
| 2 | 0.500 |
| 3 | 0.250 |
| 4 | 0.125 |
| 5 | 0.0625 |

---

## 2. Application to Prime Gap Causal Set

### Theorem 2.1 (Sprinkled Causal Set Dimension)
The prime gap causal set C_π as a total order has f = 1 (d_MM = 1). However, the *faithfully embedded* causal set in the emergent geometry has a sprinkling density ρ(τ) = p/g, which is non-uniform.

For the embedded causal set, the effective ordering fraction at scale τ is:
```
f_eff(τ) = ⟨f⟩_d · (1 + O(δρ/ρ))
```
where δρ/ρ are the density fluctuations.

### Theorem 2.2 (Asymptotic 4-Dimensionality)
At large scales (τ → ∞), the density fluctuations average out and the effective dimension approaches:
```
lim_{τ→∞} d_MM(τ) = 4
```

**Proof.** The volume of a causal interval of proper-time radius T scales as:
```
V(T) ~ ∫₀^T Ω⁴(τ) dτ ~ T + O(T/log T)
```
For a d-dimensional Minkowski space, V(T) ~ T^d. Thus the volume scaling dimension is d_v = 1 for the time direction. With 3 spatial dimensions from the conformal flatness (Section 01), the total dimension is 4. The Myrheim-Meyer estimator on the sprinkled set converges to this value. ∎

---

## 3. Volume-Chain Scaling

### Theorem 3.1 (Volume vs Longest Chain)
For a causal interval with longest chain length L = m − n, the volume scales as:
```
V(L) ~ L^{d_v}
```
where d_v = d log V / d log L.

For the prime gap geometry:
```
V(L) = κ⁴ L
τ(L) = κ Σ_{k=1}^L g_k/p_k ~ κ L / log L
```
Thus V ~ τ log τ, giving d_v = 1 for time. With spatial dimensions, d = 4.

---

## 4. Cross-References

- §01.06: Invariant Volume Element & Dimensionality Lock
- §02.01: Causal Set Primer
- §02.03: Proper Time as Longest Chain
- §11.03: Emergent Spacetime from Arithmetic First Principles

---

## 5. Notation Summary (Piece 04)

| Symbol | Definition |
|--------|------------|
| f | Ordering fraction |
| C | Number of causal relations |
| N | Number of elements |
| ⟨f⟩_d | Expected ordering fraction in d dimensions |
| d_MM | Myrheim-Meyer dimension estimator |
| d_v | Volume scaling dimension |
| Ω(τ) | Conformal factor |

---

*End of Piece 04/13 — Section 02*