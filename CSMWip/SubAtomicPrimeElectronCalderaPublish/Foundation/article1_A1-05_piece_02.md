# ARTICLE 1: Prime Electron Worldline Topology — A1-05 (Piece 02)

## 1.3 Explicit Formula Connection

From the explicit formula for ψ(x):

ψ(x) - x = -Σ_ρ x^ρ/ρ - ln(2π) - (1/2)ln(1-x^{-2})

The proper-time fluctuation:

Δτ(x) = κ · Δψ(x) = -κ · Σ_ρ x^ρ/ρ + c.c. + O(1)

Substituting ρ = β + iγ:

Δτ(x) = -κ · Σ_γ [x^{β+iγ}/(β+iγ) + x^{β-iγ}/(β-iγ)]
      = -2κ · Σ_γ x^β [β cos(γ ln x) + γ sin(γ ln x)] / (β^2+γ^2)

## 1.4 RH Implies Stability

If RH holds: all β = 1/2. Then:

|Δτ(x)| ≤ 2κ · Σ_γ x^{1/2} √(β^2+γ^2) / (β^2+γ^2)
        = 2κ x^{1/2} Σ_γ 1/√(1/4+γ^2)
        ~ 2κ x^{1/2} ln x

This is O(x^{1/2+ε}) — bounded fluctuations. Worldline stable.

---

### 2. RH VIOLATION IMPLIES INSTABILITY

## 2.1 Off-Critical-Line Zero

Suppose ∃ ρ = θ + iγ with θ > 1/2 (RH false).
Then the fluctuation contains a term:

Δτ_θ(x) ~ -2κ x^θ [θ cos(γ ln x) + γ sin(γ ln x)] / (θ^2+γ^2)

For large x, this dominates the β = 1/2 terms because x^θ ≫ x^{1/2}.

## 2.2 Exponential Deviation

The worldline deviation grows as x^θ. For θ > 1/2:
- At x = 10^6: x^θ / x^{1/2} = 10^{6(θ-1/2)}
- If θ = 0.6: factor 10^{0.6} = 4
- If θ = 0.75: factor 10^{1.5} = 31.6
- If θ = 0.9: factor 10^{2.4} = 251

The electron worldline would spiral out of control.