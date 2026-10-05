# A1-15: Worldline Geodesic Equation — Piece 07
## Geodesic Action Principle: Discrete Variational Formulation

The geodesic equation derives from extremizing the proper time functional:

S[x] = ∫ dτ = ∫ √(−g_μν dx^μ dx^ν)

In the discrete Prime Electron framework, this becomes a sum over proper-time steps:

S[{x^μₙ}] = ∑ₙ √(−g_μν(τₙ) Δx^μₙ Δx^νₙ)

With g_μν(τₙ) = Ω²(τₙ)η_μν and Δx^μₙ = x^μₙ₊₁ − x^μₙ:

S = ∑ₙ Ω(τₙ) √(−η_μν Δx^μₙ Δx^νₙ) = ∑ₙ Ωₙ √((Δx⁰ₙ)² − δ_ij Δx^iₙ Δx^jₙ)

Using Δτₙ = κ dₙ and the discrete proper time interval:
Δτₙ = Ωₙ √((Δx⁰ₙ)² − δ_ij Δx^iₙ Δx^jₙ)

The action is simply the total proper time: S = ∑ₙ Δτₙ = τ_N − τ_0. But we must vary x^μₙ subject to fixed endpoints x^μ₀ and x^μ_N.

Vary the action with respect to x^μₖ for 0 < k < N:

δS = ∑ₙ Ωₙ [−η_μν Δx^μₙ Δx^νₙ]^{-1/2} (−η_μν) (δ_{n,k−1} − δ_{n,k}) Δx^νₙ δx^μₖ

= Ωₖ [−η_μν Δx^μₖ Δx^νₖ]^{-1/2} η_μν Δx^νₖ δx^μₖ
− Ωₖ₋₁ [−η_μν Δx^μₖ₋₁ Δx^νₖ₋₁]^{-1/2} η_μν Δx^νₖ₋₁ δx^μₖ

= (Ωₖ/Δτₖ) η_μν Δx^νₖ δx^μₖ − (Ωₖ₋₁/Δτₖ₋₁) η_μν Δx^νₖ₋₁ δx^μₖ

= u^νₖ η_μν δx^μₖ − u^νₖ₋₁ η_μν δx^μₖ

Setting δS = 0 for arbitrary δx^μₖ gives:
u_μₖ = u_μₖ₋₁

This is the discrete conservation of four-momentum along the geodesic! In the presence of the conformal factor, we must include the variation of Ωₙ:

Ωₙ = Ω(τₙ) = Ω(κ ∑_{j=1}^n d_j)

But d_j are fixed (prime gaps), so Ωₙ depends on the path only through the proper time parameterization. However, since we parameterize by the fixed gap sequence, Ωₙ is fixed for a given n. The variation is purely in x^μₙ.

The discrete Euler-Lagrange equation is:
(Ωₖ/Δτₖ) Δx^μₖ = (Ωₖ₋₁/Δτₖ₋₁) Δx^μₖ₋₁

Using Δτₙ = κ dₙ and defining the canonical momentum:
p^μₙ ≡ (Ωₙ/κ dₙ) Δx^μₙ

The geodesic equation is simply p^μₙ = p^μₙ₋₁ — momentum conservation in the discrete conformal geometry.

This is a profound simplification: the Prime Electron geodesic is a straight line in the conformally rescaled coordinates X^μₙ = ∑_{k=1}^n (Ωₖ/κ dₖ) Δx^μₖ. The prime gap fluctuations appear only as a position-dependent rescaling of the step sizes.