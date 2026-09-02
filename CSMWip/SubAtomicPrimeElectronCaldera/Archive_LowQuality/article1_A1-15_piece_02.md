# A1-15: Worldline Geodesic Equation — Piece 02
## Discrete Geodesic Equation: Difference Form from Prime Gaps

The standard geodesic equation in continuum GR is:

d²x^μ/dτ² + Γ^μ_αβ (dx^α/dτ)(dx^β/dτ) = 0

In the Prime Electron framework, proper time is discrete: τₙ = n·κ·dₙ (with appropriate indexing). The four-velocity becomes a finite difference:

u^μₙ ≡ Δx^μₙ / Δτₙ = (x^μₙ₊₁ − x^μₙ) / (κ·dₙ)

The acceleration is the second difference:

a^μₙ ≡ Δu^μₙ / Δτₙ = (u^μₙ₊₁ − u^μₙ) / (κ·dₙ)

Substituting the metric from A1-14, g_μν(τ) = Ω²(τ)η_μν with Ω²(τₙ) = 1 + λ·Cₙ, where Cₙ is the gap correlation at step n. The Christoffel symbols for a conformally flat metric are:

Γ^μ_αβ = δ^μ_α ∂_β log Ω + δ^μ_β ∂_α log Ω − η_αβ η^μγ ∂_γ log Ω

In discrete form, the derivative ∂_μ log Ω becomes a finite difference along the worldline. Since the metric only varies with proper time (homogeneous in space by construction), we have:

∂_τ log Ω → Δ log Ωₙ / Δτₙ = [log Ω(τₙ₊₁) − log Ω(τₙ)] / (κ·dₙ)

The spatial derivatives vanish: ∂_i log Ω = 0. Therefore the non-zero Christoffel symbols are:

Γ^0_00 = Δ log Ωₙ / Δτₙ
Γ^0_ij = η_ij Δ log Ωₙ / Δτₙ
Γ^i_0j = δ^i_j Δ log Ωₙ / Δτₙ
Γ^i_j0 = δ^i_j Δ log Ωₙ / Δτₙ

All other components vanish. The geodesic equation components become:

**Time component (μ = 0):**
a⁰ₙ + Γ⁰_00 (u⁰ₙ)² + Γ⁰_ij u^iₙ u^jₙ = 0

**Spatial components (μ = i):**
a^iₙ + 2 Γ^i_0j u⁰ₙ u^jₙ = 0

This is the discrete geodesic equation driven entirely by prime gap fluctuations through Ω(τₙ).