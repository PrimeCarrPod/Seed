# Sorkin-Johnston Vacuum & Quantum Fields on Prime Poset — Piece 02/13
## Section 03: Sorkin-Johnston Vacuum & Quantum Fields on Prime Poset
**Piece:** 02 of 13  
**Generated:** 2026-10-06 23:19:00 UTC  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier  

---

## Abstract

The retarded Green's function for a massive scalar field on the discrete prime lattice is constructed via convolution from the massless kernel. We derive the explicit form and show how the prime gap sequence modifies the standard continuum expression.

---

## 1. Convolution Construction

### Definition 1.1 (Convolution on Causal Set)
For functions f, g on the causal set, the convolution is:
```
(f * g)(x,y) = Σ_{z: x≺z≺y} f(x,z) g(z,y)
```

### Theorem 1.2 (Massive Green's Function via Convolution)
The massive retarded Green's function satisfies:
```
G_ret = G_0 + m² G_0 * G_0 + m⁴ G_0 * G_0 * G_0 + ...
```
This is the Neumann series for (1 − m² G_0)^{-1} G_0.

### Theorem 1.3 (Convergence on Prime Lattice)
The series converges for all m² < mₚ² because the prime gap UV cutoff (Section 01.02) limits the proper-time sums:
```
τ_max ~ N κ ~ (mₚ/m) κ
```
The maximum number of terms in the convolution is finite.

---

## 2. Explicit Form on Prime Gap Causal Set

### Theorem 2.1 (Massless Green's Function)
For the prime gap causal set with proper time τ(n) = κ Σ_{k=1}^n g_k/p_k:
```
G_0(n,m) = (1/2π) θ(τ(n,m)) / τ(n,m)  for n ≺ m
```
where τ(n,m) = τ(m) − τ(n).

### Theorem 2.2 (Massive Green's Function)
Using the causal matrix C_{nm} = θ(m−n):
```
G_ret = (i + m² C)^{-1}
```
In the prime gap basis, this is a lower triangular matrix with entries:
```
(G_ret)_{nm} = Σ_{k=0}^∞ (i m²)^k (C^k)_{nm}
```
Since C is nilpotent (C^N = 0), the sum terminates at k = N.

---

## 3. Numerical Implementation

### Algorithm 3.1 (Green's Function Computation)
```
Input: Prime gaps g[1..N], masses m, sprinkling density ρ
Output: G_ret[n,m] for n,m = 1..N

1. Compute proper times τ[n] = κ Σ_{k=1}^n g[k]/p[k]
2. Build causal matrix C[n,m] = 1 if m > n else 0
3. For each n,m with m > n:
   G_0[n,m] = (1/2π) / (τ[m] - τ[n])
4. Compute G_ret = inverse(I + i m² C)
   (Use forward substitution since C is triangular)
5. Return G_ret
```

---

## 4. Cross-References

- §01.02: Exact UV Cutoff Derivation
- §01.03: Proper-Time Lattice
- §03.01: SJ Formalism on Discrete Partial Orders
- §12.05: Sorkin-Johnston Eigenvalue Solvers

---

## 5. Notation Summary (Piece 02)

| Symbol | Definition |
|--------|------------|
| * | Convolution on causal set |
| G_0 | Massless retarded Green's function |
| G_ret | Massive retarded Green's function |
| C | Causal matrix |
| τ(n,m) | Proper time from n to m |

---

*End of Piece 02/13 — Section 03*