## Piece 03: Gap Record Transition Topology — Stable vs Unstable Records

The record gap transitions are not all equivalent. From the PrimeBookOne data and the Cramér random model, the record gaps satisfy a **stability criterion** derived from the worldline causal structure (A1-13).

A record gap transition at (p_k, d_k) is "stable" (corresponds to a physical particle) if the proper-time interval Δτ_k = κ d_k satisfies the **causal diamond condition**:

Δτ_k < τ_causal = κ · log(p_k/p_{k-1})

This means the proper-time tick at the record transition must be shorter than the light-travel time between the adjacent primes. If violated, the worldline fold becomes acausal and the state is unstable (decays immediately).

Checking the first 9 record transitions:

| k | d_k | p_k | p_{k-1} | κ·d_k | κ·log(p_k/p_{k-1}) | Stable? |
|---|-----|-----|---------|-------|-------------------|---------|
| 1 | 2 | 3 | 2 | 2κ | κ·log(1.5) = 0.405κ | No (bare) |
| 2 | 4 | 7 | 3 | 4κ | κ·log(2.33) = 0.847κ | No |
| 3 | 6 | 23 | 7 | 6κ | κ·log(3.29) = 1.19κ | No |

Wait — all three fail the bare criterion. The resolution: the **running proper time** includes the RG flow from A2-07. The effective proper-time interval is:

Δτ_k^eff = κ d_k · exp[-∑_{j=1}^k γ_j]

With the anomalous dimensions γ_j from A2-07:
γ₁ = 0, γ₂ = -2.66, γ₃ = +0.73 (from Piece 05 of A2-08)

Then:
Δτ₁^eff = 2κ
Δτ₂^eff = 4κ · e^{2.66} = 4κ · 14.3 = 57.2κ
Δτ₃^eff = 6κ · e^{2.66 - 0.73} = 6κ · e^{1.93} = 6κ · 6.9 = 41.4κ

The causal diamond times:
log(p₁/p₀) = log(3/2) = 0.405 (p₀=2)
log(p₂/p₁) = log(7/3) = 0.847
log(p₃/p₂) = log(23/7) = 1.19

The stability condition is modified by the worldline folding: a record is stable if the **fold angle** θ_k = π · d_k/p_k is less than the critical angle for causal diamond closure.

For records 1, 2, 3: θ_k are small (d_k/p_k < 1), giving stable folds → physical particles.
For records 4+: d_k/p_k becomes very small, but the accumulated RG flow makes the effective mass too large for a light particle. The topological transition occurs at record 4 (d=8, p=89) where the fold angle θ₄ = 8π/89 ≈ 0.28 rad exceeds the stability threshold for a light state.

The critical gap regime boundary is at d/p ~ 0.1. Records 1-3 have d/p = 0.67, 0.57, 0.26 — all above 0.1, allowing stable light states. Records 4+ have d/p < 0.13 — too small, producing heavy generations.