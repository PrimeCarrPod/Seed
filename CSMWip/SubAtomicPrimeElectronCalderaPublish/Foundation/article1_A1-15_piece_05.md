# A1-15: Worldline Geodesic Equation — Piece 05
## Continuum Limit: Recovering the Smooth Geodesic Equation

The discrete geodesic equation must reproduce the continuum GR geodesic equation in the limit where prime gap fluctuations average out. Consider the scaling limit where we coarse-grain over many prime gaps. Define a smoothed proper time:

τ = κ ∑_{k=1}^n d_k ≈ κ n ⟨d⟩ = κ n log n

For large n, the average gap ⟨d⟩ ~ log n by the Prime Number Theorem. The conformal factor Ω(τ) varies slowly when averaged over scales ≫ ⟨d⟩. Let us define a smoothed conformal factor:

Ω̄(τ) = ⟨Ω(τ')⟩_{τ' ∈ [τ−Δτ, τ+Δτ]}

with Δτ chosen such that 1 ≪ Δτ/κ ≪ τ. In this limit, the finite differences become derivatives:

Δ log Ωₙ / Δτₙ → d log Ω̄/dτ
Δ² log Ωₙ / (Δτₙ)² → d² log Ω̄/dτ²

The discrete spatial geodesic equation:
Δv^iₙ = −2 v^iₙ (Δ log Ωₙ) u⁰ₙ / u⁰ₙ₊₁ − v^iₙ (Δu⁰ₙ) / u⁰ₙ₊₁

becomes in the continuum:
dv^i/dτ = −2 v^i (d log Ω̄/dτ) − v^i (d log u⁰/dτ)

Using u⁰ = 1/Ω̄ for comoving frame, d log u⁰/dτ = −d log Ω̄/dτ. Thus:
dv^i/dτ = −v^i (d log Ω̄/dτ)

This integrates to v^i(τ) ∝ 1/Ω̄(τ), the standard result for conformal time in FLRW cosmology.

For the time component, the normalization g_μν u^μ u^ν = −1 gives:
u⁰ = √(1 + v²)/Ω̄

The full continuum geodesic equation is recovered:
d²x^μ/dτ² + Γ^μ_αβ (dx^α/dτ)(dx^β/dτ) = 0

with Γ^μ_αβ computed from g_μν = Ω̄²(τ)η_μν.

**Prime gap corrections:** The discrete equation contains corrections of order (Δτ/τ) ~ 1/log n that vanish in the continuum limit but are significant at the Compton scale (n ~ 10²⁰, A1-09). These corrections are the quantum gravitational imprints of the prime gap structure.

The continuum Riemann tensor from the smoothed metric is:
R^i_0j0 = −δ^i_j (d² log Ω̄/dτ²) / Ω̄²

This matches the discrete expression in Piece 04 when Δ² log Ωₙ/(Δτₙ)² → d² log Ω̄/dτ².

**Verification:** The beta function for the conformal factor (A1-14 Piece 06) gives the RG flow of Ω̄(μ). At scale μ, Ω̄(μ) = 1 + λ C(μ). The geodesic equation at scale μ uses Ω̄(μ), providing a scale-dependent geodesic flow consistent with the RG-improved metric.