# A1-20: Worldline_Topological_Charge.md — Piece 11

## Boundary Conditions: UV/IR Matching and the Vacuum Angle

From A1-22 (Worldline_Boundary_Conditions, to be written), the worldline has UV (τ → 0, directory 3.0) and IR (τ → T, directory 0.0) boundaries. The topological charge Q is sensitive to the boundary conditions on the gauge connection A_μ.

At the UV boundary (directory 3.0, highest energies, smallest proper time intervals), the prime gaps are large (d_n ~ 10^2-10^3). The connection A_μ ~ κ d_n ∂_n log d_n is large but the proper time interval Δτ = κ d_n is also large. The UV boundary condition is:
A_μ(τ=0) = 0 (pure gauge)

This corresponds to the asymptotic freedom of the prime electron: at very short proper times (high energies), the gauge coupling vanishes. The UV fixed point is Gaussian.

At the IR boundary (directory 0.0, lowest energies, largest proper time intervals), the prime gaps are small (d_n = 2, 4, 6...). The connection approaches:
A_μ(τ=T) = (κ/2) d_n v_μ ∂_n log d_n → constant

The IR boundary condition is determined by the vacuum angle θ. The effective action includes the topological term:
S_θ = i θ Q = i θ (1/2π) ∮ Tr(F ∧ F)

For the prime electron, θ is not a free parameter but is determined by the prime phase structure. From A1-02, the winding number of the prime gap phase φ_n = 2π p_n/p_{n+1} is:
W = (1/2π) Σ_n Δφ_n = (1/2π) Σ_n 2π (p_{n+1}/p_{n+2} - p_n/p_{n+1}) = 1

in the limit N → ∞ (telescoping sum). The vacuum angle is:
θ = 2π W = 2π ≡ 0 (mod 2π)

Therefore θ = 0 for the prime electron, meaning no explicit CP violation from the topological term. This is consistent with the observed smallness of the electron EDM (A9-02).

The UV/IR matching condition requires that the topological charge computed in the UV (directory 3.0, Q = 24) equals the charge computed in the IR (directory 0.0, Q = 0) plus the instanton contributions at intermediate scales. The instanton contributions are precisely the record gaps, which interpolate between UV and IR.

The matching formula is:
Q_UV = Q_IR + Σ_{instantons} q_inst

where q_inst = 1 for each record gap. With 24 record gaps in 3.0, Q_UV = 24, Q_IR = 0, matching holds.

Piece 12 provides the synthesis and connections to other articles.