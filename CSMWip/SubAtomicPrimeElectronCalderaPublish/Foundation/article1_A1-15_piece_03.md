# A1-15: Worldline Geodesic Equation — Piece 03
## Explicit Geodesic Recurrence: Four-Velocity and Acceleration

From the Christoffel symbols derived in Piece 02, the discrete geodesic equations become a system of recurrence relations for the four-velocity components. Let v^iₙ = u^iₙ / u⁰ₙ be the spatial three-velocity. The time component of four-velocity is determined by the normalization condition g_μν u^μ u^ν = −1:

−Ω²(τₙ)(u⁰ₙ)² + Ω²(τₙ) δ_ij u^iₙ u^jₙ = −1
⇒ (u⁰ₙ)² = 1/Ω²(τₙ) + δ_ij v^iₙ v^jₙ

For the electron at rest in the comoving frame (v^iₙ = 0), u⁰ₙ = 1/Ω(τₙ). For general motion, we keep the full expression.

The spatial geodesic equation (μ = i) gives:

a^iₙ + 2 (Δ log Ωₙ / Δτₙ) u⁰ₙ u^iₙ = 0

Substituting a^iₙ = Δu^iₙ / Δτₙ and u^iₙ = v^iₙ u⁰ₙ:

Δu^iₙ / Δτₙ + 2 (Δ log Ωₙ / Δτₙ) u⁰ₙ v^iₙ u⁰ₙ = 0
Δ(v^iₙ u⁰ₙ) / Δτₙ + 2 (Δ log Ωₙ / Δτₙ) (u⁰ₙ)² v^iₙ = 0

Using the product rule for finite differences:
(Δv^iₙ) u⁰ₙ₊₁ + v^iₙ (Δu⁰ₙ) + 2 (Δ log Ωₙ) (u⁰ₙ)² v^iₙ / Δτₙ = 0

The time component geodesic equation gives the evolution of u⁰ₙ:
Δu⁰ₙ / Δτₙ + (Δ log Ωₙ / Δτₙ) (u⁰ₙ)² + (Δ log Ωₙ / Δτₙ) δ_ij u^iₙ u^jₙ = 0

For v^iₙ = 0 (comoving observer), this simplifies to:
Δu⁰ₙ / Δτₙ + (Δ log Ωₙ / Δτₙ) (u⁰ₙ)² = 0
⇒ Δ(1/u⁰ₙ) / Δτₙ = Δ log Ωₙ / Δτₙ
⇒ 1/u⁰ₙ = Ω(τₙ) + constant

With initial condition u⁰₀ = 1/Ω(τ₀), we get u⁰ₙ = 1/Ω(τₙ) exactly. This confirms the comoving frame follows the conformal factor.

For non-zero v^iₙ, the full system is:
1. Δv^iₙ = −2 v^iₙ (Δ log Ωₙ) u⁰ₙ / u⁰ₙ₊₁ − v^iₙ (Δu⁰ₙ) / u⁰ₙ₊₁
2. Δu⁰ₙ = − (Δ log Ωₙ) (u⁰ₙ)² [1 + v²ₙ] / (1 + ½ Δ log Ωₙ u⁰ₙ)

where v²ₙ = δ_ij v^iₙ v^jₙ. This is the discrete geodesic flow on the prime gap worldline.