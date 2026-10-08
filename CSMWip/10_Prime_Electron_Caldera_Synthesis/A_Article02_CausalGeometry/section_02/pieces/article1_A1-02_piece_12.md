# Discrete Causal Geometry from Prime Gap Sequences — Piece 12/13
## Section 02: Discrete Causal Geometry from Prime Gap Sequences
**Piece:** 12 of 13  
**Generated:** 2026-10-06 23:13:00 UTC  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier  

---

## Abstract

We provide the complete causal set algorithms and their complexity bounds for the prime gap causal set.

---

## 1. Algorithm Summary

### Table 1.1: Core Algorithms and Complexity

| Algorithm | Input Size | Time Complexity | Space Complexity | Notes |
|-----------|------------|-----------------|------------------|-------|
| Prime Generation (Sieve) | N | O(N log log N) | O(N) | For N < 10⁸ |
| Prime Generation (Meissel-Lehmer) | N | O(N^{2/3}) | O(N^{2/3}) | For N > 10⁸ |
| Gap Computation | N | O(N) | O(N) | g[n] = p[n+1]−p[n] |
| Proper Time | N | O(N) | O(N) | τ[n] = Σ g[k]/p[k] |
| Causal Matrix | N | O(N²) | O(N²) | Total order: implicit |
| Sprinkled Relations | N | O(N log N) | O(N) | Using spatial index |
| Interval Counts N_k | N | O(N) | O(1) | Combinatorial formulas |
| BD Action | N | O(1) | O(1) | From N_k |
| MM Dimension | N | O(N) | O(1) | From relation count |
| Non-local Kernel | N | O(N²) | O(N²) | Zero sum approximation |

---

## 2. Detailed Algorithm: Sprinkled Causal Relations

### Algorithm 2.1 (Sprinkled Relations in 4D)
```
Input: Embedded coordinates x^μ(n) for n = 1..N, density ρ
Output: Causal relation count C

1. Build KD-tree or ball tree of spatial coordinates
2. For each element n:
   a. Find all m with τ_m > τ_n
   b. Check if spatial distance |x⃗_m − x⃗_n| < τ_m − τ_n
   c. Count such m
3. Sum counts to get C
4. Return C
```

Complexity: O(N log N) with spatial index, O(N²) naive.

---

## 3. Complexity Bounds for Large N

### Theorem 3.1 (Scaling Limits)
For N → ∞ (N ~ 10¹⁴⁰ at Planck scale):
- Prime generation: Use analytic π(x) approximation
- Causal matrix: Implicit (total order) — O(1) storage
- BD action: Analytic formula — O(1)
- Dimension: Asymptotic value 4 — O(1)

The only O(N) operations are gap computation and proper time, which are embarrassingly parallel.

---

## 4. Parallelization

### Theorem 4.1 (Parallel Speedup)
All O(N) algorithms (gaps, proper time, sprinkling) achieve linear speedup with P processors:
```
T(P) = T(1) / P + O(log P)
```
No communication needed between processors for gap/proper time. Sprinkling requires spatial domain decomposition.

---

## 5. Cross-References

- §01.12: Computational Primitives
- §02.10: Computational Protocol
- §12.03: Causal Set Sprinkling & Dimension Estimation Code
- §12.04: Benincasa-Dowker Action Numerical Evaluation

---

## 6. Notation Summary (Piece 12)

| Symbol | Definition |
|--------|------------|
| N | Number of elements |
| P | Number of processors |
| T(P) | Time with P processors |
| O(·) | Big-O complexity |

---

*End of Piece 12/13 — Section 02*