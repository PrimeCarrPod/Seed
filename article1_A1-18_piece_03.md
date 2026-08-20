# A1-18: Worldline Path Integral — Piece 03
## Worldline Self-Intersections and Vertex Insertions

From A1-11, the worldline self-intersection condition γ(τ_n) = γ(τ_m) for n ≠ m generates vertex interaction points. In the path integral, these correspond to vertex insertions where the worldline crosses itself.

The interaction action from A1-16 Piece 05 is:
S_int = Σ_{n<m} V_{nm} δ⁴(x_n - x_m)
where V_{nm} = ℏ W(d_n, d_m) is the vertex weight.

In the path integral, this becomes a sum over intersection histories:
Z = Z_0 ⟨exp(i S_int/ℏ)⟩_0
= Z_0 Σ_{k=0}^∞ (i/ℏ)^k/k! ⟨(Σ_{n<m} V_{nm} δ⁴(x_n - x_m))^k⟩_0

Each term corresponds to k self-intersection vertices. The vertex weight W(d_n, d_m) depends on the prime gaps at the intersection points. For twin primes (d=2), W = e² (electromagnetic coupling). For larger gaps, W is suppressed.

The vertex insertion at (n, m) enforces x_n = x_m in the path integral. This is implemented by adding a delta function constraint or by introducing an auxiliary field.

The proper time at the vertex is τ_vertex = (τ_n + τ_m)/2 = κ(p_{n+1} + p_{m+1} - 4)/2. The photon propagator connecting the two segments is:
D_μν(τ_n - τ_m) = ∫ d⁴k/(2π)⁴ (-i g_μν/k²) e^{-i k·(x_n - x_m)}

In the discrete theory, this becomes a sum over momentum modes with gap-dependent phases:
D_μν(n, m) = Σ_k (-i g_μν/k²) exp(-i k·(x_n - x_m)) exp(-k² d_n d_m/2)

The sum over all self-intersections generates the full QED perturbative series. The running coupling α(μ) emerges from the gap statistics at scale μ ~ 1/d_n.

The one-loop self-energy correction to the propagator is:
Σ(p) = e² ∫ D[x] x·x exp(i S/ℏ) / ∫ D[x] exp(i S/ℏ)
In the discrete theory, this is a sum over gap-weighted loops:
Σ(p) = e² Σ_{n,m} (x_n - x_m)² exp(i S_cl/ℏ) / Z

The cancellation of UV divergences in QED corresponds to the boundedness of the prime gap sum Σ 1/d_n² (which converges since Σ 1/n² log² n converges).