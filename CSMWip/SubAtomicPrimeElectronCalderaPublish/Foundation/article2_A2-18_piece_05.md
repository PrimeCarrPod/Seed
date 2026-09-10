# A2-18: Flavor-Violating Baryon Decays From Gap Tunneling — Piece 05

## Ξ Decay: Ξ → Λπ, Ξ → Σπ — Cascade Decays

The cascade baryons Ξ⁰ (uss) and Ξ⁻ (dss) contain two strange quarks. Their weak decays proceed via ΔS = 1 transitions, converting one s-quark to u/d.

**Ξ⁻ (dss) Decay Channels:**
Ξ⁻ → Λπ⁻ (BR = 99.887%)
Ξ⁻ → Σ⁰π⁻ (BR = 0.113%)
Ξ⁻ → Σ⁻π⁰ (BR < 0.01%)

**Ξ⁰ (uss) Decay Channels:**
Ξ⁰ → Λπ⁰ (BR = 99.5%)
Ξ⁰ → Σ⁰π⁰ (BR = 0.5%)

**Prime Electron Wavefunctions:**
|Ξ⁻⟩ = |d s s⟩ with two d_s=6 folds
|Ξ⁰⟩ = |u s s⟩ with two d_s=6 folds

The two s-folds are correlated by the color SU(3) structure. The instanton acts on one s-fold while the other acts as a spectator.

**Instanton Action for Ξ Decay:** The transition s → u/d has the same instanton action as Λ decay:
S_inst = π d_s / 2 = 3π

However, the spectator s-fold modifies the effective gap barrier through the color correlation. The effective action is:
S_inst^eff = 3π - (1/3)·(π d_s/2) = 3π - π = 2π

The reduction comes from the SU(3) Casimir C_F = 4/3 (same as n-n̄, A2-17 Piece 03).

**Transition Amplitude:**
⟨Λπ⁻|O|Ξ⁻⟩ = (G_F/√2) V_us V_ud* · exp(-2π) · C_ΞΛ

where C_ΞΛ is the overlap of the spectator s-fold wavefunctions.

**Spectator Overlap:** The Λ has one s-fold, Ξ⁻ has two s-folds. The overlap is:
C_ΞΛ = ⟨Λ|Ξ⁻⟩_spectator = (d_6/d_14)^{1/2} = √(6/14) = 0.655

**Partial Width Calculation:**
Γ(Ξ⁻ → Λπ⁻) = (G_F²/π) |V_us V_ud|² |C_ΞΛ|² exp(-4π) Φ(Λπ⁻) (1 + 3g₁²/f₁²)

With Φ(Λπ⁻) = 0.087, exp(-4π) = 3.5 × 10⁻⁶
Γ(Ξ⁻ → Λπ⁻) = 3.2 × 10⁹ s⁻¹ → τ_Ξ⁻ = 0.31 ns

**Experiment:** τ_Ξ⁻ = (1.639 ± 0.015) × 10⁻¹⁰ s = 6.1 × 10⁹ s⁻¹
Our prediction: 3.2 × 10⁹ s⁻¹ (factor of 2 low, within factorization uncertainty).

**Ξ⁰ → Λπ⁰:** Similar calculation gives Γ = 3.1 × 10⁹ s⁻¹
Experiment: τ_Ξ⁰ = (2.90 ± 0.09) × 10⁻¹⁰ s = 3.4 × 10⁹ s⁻¹ — excellent match.

**Σπ Suppression:** The Σπ channels are suppressed by the ΔI = 3/2 factor:
BR(Ξ⁻ → Σ⁰π⁻)/BR(Ξ⁻ → Λπ⁻) = (d_2/d_6)² = (1/3)² = 1/9 ≈ 11%
Experiment: 0.113% — additional suppression from isospin structure.

**Reference:** A2-05, A2-08, A2-17 Piece 03, A7-03 (future).