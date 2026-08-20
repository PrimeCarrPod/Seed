# A1-16: Worldline Action Principle — Piece 05
## Self-Interaction Action: Worldline Intersections from A1-11

From A1-11, the worldline self-intersection condition γ(τₙ) = γ(τₘ) for n ≠ m generates vertex interaction points. The prime gaps determine these intersections through the recurrence structure of the sequence dₙ = pₙ₊₁ − pₙ. Type I intersections (adjacent gaps dₙ = dₙ₊₁) occur at twin primes (d=2). Type II (gap dₙ = dₘ with |n−m| > 1) correspond to equal gaps at different scales. Type III (recurrence of gap patterns) encode the causal structure.

The self-interaction action must add a term to S that encodes these intersections:
S = S₀ + S_int
where S₀ = Σₙ Lₙ is the free action from Piece 02, and S_int accounts for γ(τₙ) = γ(τₘ).

For each intersection pair (n, m) with n < m, we add:
S_int = Σ_{n<m} V_{nm} δ_{xₙ, xₘ}
where δ_{xₙ, xₘ} enforces the coincidence and V_{nm} is the interaction vertex weight. In the path integral, this becomes a sum over intersection histories.

From A1-07, forward-time segments (e⁻) and backward-time segments (e⁺) meet at vertices. The action for a vertex where segments n₁, n₂ (incoming) meet n₃, n₄ (outgoing) is:
S_vertex = ℏ · W(d_{n₁}, d_{n₂}, d_{n₃}, d_{n₄})
where W is the vertex weight function determined by gap conservation.

Gap conservation at a vertex: d_{n₁} + d_{n₂} = d_{n₃} + d_{n₄} (proper time conservation).
Momentum conservation: p_{n₁} + p_{n₂} = p_{n₃} + p_{n₄} where pₙ = ℏ/dₙ is the proper energy (from A1-12).

The vertex weight from the PrimeBookOne tile structure: each tile in directory 0.0 contains 500 consecutive gaps. Intersections within a tile have weight W_tile ∼ 1. Intersections across tiles (books) have weight suppressed by the book separation.

The total interaction action summed over all 3500 books:
S_int = ℏ Σ_{books b=1}^{3500} Σ_{vertices in b} W_b(vertex)
For the UV-complete directory 3.0, the sum converges to the QED vertex function.

The running coupling α(μ) emerges from the gap statistics at scale μ ∼ 1/dₙ. At the electron mass scale (twin primes, d=2), α ≈ 1/137. At the muon scale (first record gap d=4), α increases. This matches the QED β-function β(α) = 2α²/3π derived in A1-04 from Riemann zero resonances.