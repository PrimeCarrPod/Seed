# A1-16: Worldline Action Principle — Piece 01
## Introduction: Action from Prime Gap Sequence

The action principle for the Prime Electron worldline must emerge entirely from the prime gap sequence dₙ = pₙ₊₁ − pₙ, with no free parameters. From A1-01 we established the proper time quantization Δτₙ = κ·dₙ where κ = ℏ/(mₑc²) ≈ 1.288×10⁻²¹ s. From A1-14 the emergent metric is g_μν = Ω²(τ)η_μν with conformal factor Ω²(τ) = 1 + λ·C(τ), where C(τ) encodes gap statistics. From A1-15 the geodesic equation takes the discrete form (xᵘₙ₊₁ − 2xᵘₙ + xᵘₙ₋₁)/dₙ² = Γᵘᵥᵨ(xₙ)·(xᵛₙ₊₁ − xᵛₙ)(xᵨₙ₊₁ − xᵨₙ)/dₙ².

The action S for a discrete worldline with variable step sizes dₙ must reduce to the standard relativistic action in the continuum limit:
S = −mₑc ∫ dτ √(−g_μνẋ^μẋ^ν) = −mₑc ∫ dτ Ω(τ)

For our discrete worldline with steps dₙ at proper times τₙ = κ(pₙ₊₁ − 2), the action becomes a sum over prime indices:
S = Σₙ Lₙ(dₙ, xₙ, xₙ₊₁)

where the Lagrangian Lₙ must satisfy:
1. Dimensional consistency: [Lₙ] = action = ℏ
2. Prime gap dependence: Lₙ = L(dₙ, Δxₙ/dₙ) where Δxₙ = xₙ₊₁ − xₙ
3. Continuum limit: Σₙ Lₙ → ∫ dτ L(ẋ) as dₙ → ⟨d⟩
4. Gauge invariance: Reparameterization τ → τ'(τ) leaves S invariant
5. Worldline self-intersection consistency: S accounts for γ(τₙ) = γ(τₘ) events from A1-11

The fundamental insight: each prime gap dₙ contributes a "quantum of action" ℏ·f(dₙ) where f is determined by the prime number theorem statistics. The total action is the sum over 3.67 billion gaps in the UV-complete directory 3.0 (3500 books × 2²⁰ steps).

From the PrimeBookOne data structure, each tile in directory 0.0 (189 tiles × 500 gaps) samples the IR regime, while directory 3.0 provides the complete UV sequence. The action must be computable from any directory level and converge as directory index increases.