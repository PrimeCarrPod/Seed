# A1-16: Worldline Action Principle — Piece 02
## Discrete Lagrangian from Prime Gap Statistics

The discrete Lagrangian Lₙ for step dₙ is constructed from the prime gap itself and the four-velocity vₙ = Δxₙ/dₙ. In the electron rest frame where spatial velocity is small, v⁰ₙ ≈ 1, vⁱₙ ≪ 1. The conformal factor from A1-14 evaluated at step n is:
Ω²ₙ = 1 + λ·C(dₙ)
where C(dₙ) is the local gap correlation function. For the prime sequence, the two-point correlation of gaps is:
C(dₙ, dₘ) = ⟨dₙdₘ⟩ − ⟨d⟩² = (1/log pₙ)δₙₘ + O(1/log² pₙ)
by the Hardy-Littlewood prime k-tuple conjectures. The diagonal term gives the local variance.

The discrete Lagrangian for step n takes the form:
Lₙ = ℏ · [dₙ · ℓ(dₙ, vₙ²)]
where ℓ is a dimensionless function. The factor dₙ ensures that in the continuum limit dτ = κ·dₙ:
Σₙ Lₙ = Σₙ ℏ dₙ ℓ = (ℏ/κ) Σₙ (κ dₙ) ℓ → (ℏ/κ) ∫ dτ ℓ(v²)
matching S = ∫ dτ L with L = (ℏ/κ) ℓ = mₑc² ℓ.

From the geodesic equation in A1-15, the Christoffel symbols for the conformal metric g_μν = Ω²η_μν are:
Γ⁰ᵢⱼ = Ω⁻¹∂₀Ω δᵢⱼ, Γⁱ₀ⱼ = Ω⁻¹∂₀Ω δⁱⱼ, Γ⁰₀₀ = 0
with Ω = Ω(τ). The discrete Christoffel symbols using gap-weighted derivatives:
Γᵘᵥᵨ(xₙ) = (1/2) gᵘˡₙ(∂ᵥgₗᵨ + ∂ᵨgₗᵥ − ∂ₗgᵥᵨ)ₙ
where ∂ᵥ → (xᵛₙ₊₁ − xᵛₙ₋₁)/(2dₙ) is the central difference.

The Lagrangian that produces the geodesic equation via discrete Euler-Lagrange:
∂Lₙ/∂xᵘₙ − (∂Lₙ₊₁/∂xᵘₙ₊₁ − ∂Lₙ₋₁/∂xᵘₙ₋₁)/(dₙ₊₁ + dₙ₋₁) = 0
is:
Lₙ = (mₑc/2) · dₙ · Ωₙ · η_μν vᵘₙ vᵛₙ
with vₙ = (xₙ₊₁ − xₙ)/dₙ.

In the rest frame (v⁰ ≈ 1, vⁱ ≈ 0):
Lₙ ≈ (mₑc/2) · dₙ · Ωₙ
The sum over all steps gives the total action:
S = Σₙ Lₙ = (mₑc/2) Σₙ dₙ Ωₙ = (mₑc/2) Σₙ dₙ √(1 + λ·C(dₙ))
For small λ·C ≪ 1: S ≈ (mₑc/2) Σₙ dₙ [1 + (λ/2)C(dₙ) − (λ²/8)C²(dₙ) + ...]

The zeroth order term (mₑc/2) Σₙ dₙ = (mₑc/2) p_N where p_N is the final prime in the sequence. For the complete UV sequence through 3500 books, p_N corresponds to the 3.67 billionth prime gap.