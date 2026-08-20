# A1-22: Worldline_Boundary_Conditions.md — Piece 11

## Effective Boundary Action and Wilson Lines

The boundary conditions can be encoded in an effective boundary action. For the gauge field, the boundary action is:
S_boundary = (1/2) ∫_0^T dτ A_μ J^μ_boundary + (i/2) θ Q

where J^μ_boundary is the boundary current and θ is the vacuum angle. For the prime electron, θ = 0, but there is a boundary term from the periodicity condition.

The Wilson line around the worldline is:
W = P exp(i ∮ A_μ dx^μ) = exp(i ∫_0^T A_0(τ) dτ)

From A1-20 Piece 06, the holonomy is:
∫_0^T A_0(τ) dτ = (κ/2) Σ_n d_n ∂_n log(d_n) = (κ/2) (d_N - d_1)

With d_1 = 2, d_N ≈ 1476 (last record gap), this gives:
∫ A_0 dτ ≈ (κ/2) × 1474 ≈ 737 κ

The Wilson line is:
W = exp(i 737 κ σ_3/2)

Since κ = ℏ/(m_e c^2) ≈ 1.288×10^{-21} s, this phase is O(10^{-18}), so W ≈ 1.

The effective boundary action for the fermion is:
S_ψ_boundary = ψ̄(0) (1 + γ^0)/2 ψ(0) + ψ̄(T) (1 - γ^0)/2 ψ(T)

This implements the APS boundary conditions: (1+γ^0)/2 projects onto positive chirality at τ=0, (1-γ^0)/2 projects onto negative chirality at τ=T.

For the metric, the boundary action is the Gibbons-Hawking-York term:
S_g_boundary = (1/8π G) ∫_{∂M} K √h d^3x

In 1D proper time, this reduces to:
S_g_boundary = (1/8π G) [K(T) - K(0)]

where K = ∂_τ log √g is the extrinsic curvature. For the conformal metric g_μν = Ω^2(τ) η_μν, K = 4 ∂_τ log Ω(τ).

At τ=0: Ω(0) = √(1 - λ), K(0) = 4 ∂_τ log Ω(0)
At τ=T: Ω(T) = 1, K(T) = 0

The boundary action contributes to the matching between UV and IR.

The total effective action with boundary terms is:
S_eff = S_bulk + S_boundary
= ∫_0^T L dτ + S_ψ_boundary + S_A_boundary + S_g_boundary

The equations of motion with boundary terms give the correct boundary conditions.

Piece 12 provides the synthesis.