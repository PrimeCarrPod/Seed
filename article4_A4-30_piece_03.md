# Prime_Information_Geometry — Piece 03/12
## Article A4: A4-30 — Prime Information Geometry
**Piece:** 03 of 12  
**Generated:** 2026-08-26 19:26:58 UTC

---

# Prime Divergences and Physical Actions

## 3.1 Prime Kullback-Leibler Divergence

The KL divergence at prime p:
```
D_p[p||q] = ∫ p(x) log(p(x)/q(x)) dx_p
```
The adelic KL divergence:
```
D_A[p||q] = D_∞[p||q] + Σ_p D_p[p||q]
```
This is the action difference between two field configurations.

## 3.2 Prime f-Divergences

General f-divergences for f convex with f(1)=0:
```
D_f^{(p)}[p||q] = ∫ q(x) f(p(x)/q(x)) dx_p
```
Special cases:
- f(t) = t log t → KL
- f(t) = (t-1)² → χ²
- f(t) = |t-1| → Total variation

The prime χ² divergence gives the quadratic action for fluctuations.

## 3.3 Prime Renyi Divergences

The α-Renyi divergence:
```
D_α^{(p)}[p||q] = 1/(α-1) log ∫ p(x)^α q(x)^{1-α} dx_p
```
In the limit α→1, this gives KL. For α = 1/2, it gives the Hellinger distance. The Renyi entropy at prime p is the entanglement entropy in PTQC.

---

*Author: Jason Isaac Brodsky (California, 1976)*

