# Discrete Causal Geometry from Prime Gap Sequences — Piece 10/13
## Section 02: Discrete Causal Geometry from Prime Gap Sequences
**Piece:** 10 of 13  
**Generated:** 2026-10-06 23:11:00 UTC  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier  

---

## Abstract

We provide the computational protocol for constructing the causal set from π(x) intervals, including algorithms for sprinkling, dimension estimation, and action evaluation.

---

## 1. Algorithm: Causal Set from Prime Gaps

### Algorithm 1.1 (Prime Gap Causal Set Construction)
```
Input: N (number of elements)
Output: Causal set C_π, embedding coordinates, BD action

1. Generate primes p[1..N+1] using Meissel-Lehmer or sieve
2. Compute gaps g[n] = p[n+1] - p[n] for n = 1..N
3. Compute proper times τ[n] = κ Σ_{k=1}^n g[k]/p[k]
4. Build causal matrix C_{nm} = 1 if n < m else 0
5. Build link matrix L_{nm} = 1 if m = n+1 else 0
6. Compute interval counts N_k for k = 2,3,4
7. Compute BD action S_BD = N − 9N₂ + 16N₃ − 8N₄
8. Return C_π, τ, S_BD
```

### Complexity
- Prime generation: O(N log log N) with sieve, O(N^{2/3}) with Meissel-Lehmer
- Causal matrix: O(N²) storage, O(N²) time
- Interval counts: O(N) using combinatorial formulas
- BD action: O(1)

---

## 2. Algorithm: Myrheim-Meyer Dimension Estimation

### Algorithm 2.1 (MM Dimension Estimator)
```
Input: Causal set C with N elements, causal matrix C_{nm}
Output: d_MM

1. Count causal relations: C = Σ_{n<m} C_{nm}
2. Compute ordering fraction: f = 2C / (N(N−1))
3. Invert f → d using lookup table or root-finding on:
   f(d) = Γ(d+1) Γ(d/2) / (Γ(3d/2) √π) · 2^{d-1}
4. Return d_MM
```

For the prime gap causal set (total order), C = N(N−1)/2, f = 1, d_MM = 1.
For the *sprinkled* version, use the embedded coordinates and count relations in the geometry.

---

## 3. Algorithm: Benincasa-Dowker Action Evaluation

### Algorithm 3.1 (BD Action for Embedded Causal Set)
```
Input: Embedded causal set with coordinates x^μ(n), sprinkling density ρ
Output: S_BD

1. For each element n, find its future light cone neighbors
2. Count intervals of size k = 2,3,4:
   N₂ = number of links (n,m) with m ∈ I(n)
   N₃ = number of 3-element chains
   N₄ = number of 4-element chains
3. S_BD = N − 9N₂ + 16N₃ − 8N₄
4. Return S_BD
```

For faithful embedding, the counts are:
```
N_k = ρ^k V_k + O(ρ^{k−1/2})
```
where V_k are the continuum interval volumes.

---

## 4. Cross-References

- §01.12: Computational Primitives
- §02.04: Myrheim-Meyer Dimension Estimator
- §02.05: Benincasa-Dowker Action
- §12.03: Causal Set Sprinkling & Dimension Estimation Code

---

## 5. Notation Summary (Piece 10)

| Symbol | Definition |
|--------|------------|
| C_{nm} | Causal matrix |
| L_{nm} | Link matrix |
| S_BD | Benincasa-Dowker action |
| d_MM | Myrheim-Meyer dimension |
| ρ | Sprinkling density |

---

*End of Piece 10/13 — Section 02*