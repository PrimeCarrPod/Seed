# A1-16: Worldline Action Principle — Piece 03
## Action Principle: Discrete Variational Formulation

The discrete action principle states that the physical worldline γ(τₙ) = xₙ extremizes the action S = Σₙ Lₙ(dₙ, xₙ, xₙ₊₁) with respect to variations δxₙ vanishing at endpoints. For Lagrangian Lₙ = (mₑc/2) dₙ Ωₙ η_μν vᵘₙ vᵛₙ, the variation yields:
δS = Σₙ [∂Lₙ/∂xᵘₙ δxᵘₙ + ∂Lₙ/∂xᵘₙ₊₁ δxᵘₙ₊₁]
= Σₙ [∂Lₙ/∂xᵘₙ − ∂Lₙ₋₁/∂xᵘₙ] δxᵘₙ = 0
giving the discrete Euler-Lagrange equation:
∂Lₙ/∂xᵘₙ = ∂Lₙ₋₁/∂xᵘₙ

Computing the derivative:
∂Lₙ/∂xᵘₙ = (mₑc/2) dₙ [∂Ωₙ/∂xᵘₙ η_αβ vᵅₙ vᵝₙ + 2Ωₙ η_αβ (∂vᵅₙ/∂xᵘₙ) vᵝₙ]
With vᵅₙ = (xᵅₙ₊₁ − xᵅₙ)/dₙ, we have ∂vᵅₙ/∂xᵘₙ = −δᵅᵘ/dₙ and ∂vᵅₙ/∂xᵘₙ₊₁ = δᵅᵘ/dₙ.
Also ∂Ωₙ/∂xᵘₙ = (dΩ/dτ)ₙ (∂τₙ/∂x⁰ₙ) δ⁰ᵘ = (Ω'ₙ/κ) δ⁰ᵘ since τₙ = κ(pₙ₊₁ − 2) and x⁰ₙ = cτₙ.

Substituting and simplifying in the rest frame (v⁰ = 1, vⁱ = 0):
∂Lₙ/∂x⁰ₙ = (mₑc/2) dₙ [Ω'ₙ/κ + 2Ωₙ(−1/dₙ)]
= (mₑc/2κ) dₙ Ω'ₙ − mₑc Ωₙ
∂Lₙ₋₁/∂x⁰ₙ = (mₑc/2) dₙ₋₁ [Ω'ₙ₋₁/κ + 2Ωₙ₋₁(1/dₙ₋₁)]
= (mₑc/2κ) dₙ₋₁ Ω'ₙ₋₁ + mₑc Ωₙ₋₁

Equating: (mₑc/2κ)(dₙ Ω'ₙ − dₙ₋₁ Ω'ₙ₋₁) = mₑc(Ωₙ + Ωₙ₋₁)
Dividing by mₑc and multiplying by 2κ:
dₙ Ω'ₙ − dₙ₋₁ Ω'ₙ₋₁ = 2κ(Ωₙ + Ωₙ₋₁)

This is the discrete evolution equation for Ωₙ = √(1 + λ C(dₙ)). Since Ω depends on dₙ only (not directly on xₙ), the left side is a discrete derivative of dₙ Ω'ₙ. The right side is the symmetric average of Ω.

For the full four-dimensional variation including spatial components, the Euler-Lagrange equation reproduces the geodesic equation from A1-15:
(xᵘₙ₊₁ − 2xᵘₙ + xᵘₙ₋₁)/dₙ² + Γᵘᵥᵨₙ (xᵛₙ₊₁ − xᵛₙ)(xᵨₙ₊₁ − xᵨₙ)/dₙ² = 0
where Γᵘᵥᵨₙ are computed from the discrete metric g_μνₙ = Ω²ₙ η_μν.