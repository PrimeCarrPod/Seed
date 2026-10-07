# Discrete Causal Geometry from Prime Gap Sequences — Piece 03/13
## Section 02: Discrete Causal Geometry from Prime Gap Sequences
**Piece:** 03 of 13  
**Generated:** 2026-10-06 23:02:00 UTC  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier  

---

## Abstract

Proper time between causally related elements is estimated by the length of the longest causal chain (geodesic) connecting them. This provides a direct kinematic map from the index spacing of prime numbers to Lorentzian proper time.

---

## 1. Longest Chain as Proper Time

### Definition 1.1 (Causal Chain)
A chain from n to m in C_π is a sequence n = n₀ ≺ n₁ ≺ ... ≺ n_k = m. Its length is k.

### Theorem 1.2 (Longest Chain = Index Difference)
In the prime gap causal set (total order), the longest chain from n to m is unique and has length:
```
L_max(n,m) = m − n
```

### Theorem 1.3 (Physical Proper Time)
The physical proper time uses gap-weighted steps:
```
τ(n,m) = κ Σ_{k=n+1}^m g_k/p_k
```
This is the sum of proper-time increments along the unique chain.

### Theorem 1.4 (Lorentzian Signature)
The causal set interval I(n,m) = {k : n ≺ k ≺ m} has a Lorentzian structure when embedded:
- Timelike separation: τ(n,m) > 0 (n ≺ m)
- Lightlike separation: τ(n,m) = 0 (n = m)
- Spacelike separation: not defined in total order (requires spatial embedding)

The spatial embedding (Section 01) provides the spatial distance:
```
|x(n) − x(m)| = Ω(τ) · |n − m| · κ  (in conformal coordinates)
```

---

## 2. Geodesic Equation on Causal Set

### Definition 2.1 (Discrete Geodesic)
A geodesic between n and m is a chain that maximizes the proper time:
```
γ_geodesic = argmax_{chains n→m} Σ g_k/p_k
```

### Theorem 2.2 (Unique Geodesic in Total Order)
In the total order, the unique geodesic is the direct chain n → n+1 → ... → m. Its proper time is the sum of all increments.

### Corollary 2.3 (No Geodesic Deviation)
Since the causal set is a total order, there are no alternative chains, hence no geodesic deviation. The spatial embedding introduces deviation through the conformal factor.

---

## 3. Cross-References

- §01.03: Proper-Time Lattice from Prime Gap Sequence
- §01.05: Metric Tensor Components
- §02.01: Causal Set Primer
- §03.06: Benincasa-Dowker Action

---

## 4. Notation Summary (Piece 03)

| Symbol | Definition |
|--------|------------|
| L_max(n,m) | Length of longest chain |
| τ(n,m) | Physical proper time |
| γ_geodesic | Discrete geodesic chain |

---

*End of Piece 03/13 — Section 02*