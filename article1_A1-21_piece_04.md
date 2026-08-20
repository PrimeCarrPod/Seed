# A1-21: Worldline_Winding_Sectors.md — Piece 04

## θ-Vacuum Structure and Vacuum Angle

Although the prime electron has θ = 0 (A1-20 Piece 11), it is instructive to consider the general θ-vacuum structure. The θ-vacuum is a superposition of winding sectors:
|θ⟩ = Σ_{Q=-∞}^∞ e^{i θ Q} |Q⟩

The physical vacuum is |θ=0⟩ = Σ_Q |Q⟩. The energy of the θ-vacuum is:
E(θ) = -ℏ log ⟨θ| e^{-i H T/ℏ} |θ⟩ / T

For the prime electron Hamiltonian H = ℏ/κ Σ_n d_n^{-1} (A1-17), the energy density is:
ε(θ) = E(θ)/T = ε_0 - (ℏ/T) log [ Σ_Q e^{i θ Q} Z_Q / Z_0 ]

With Z_Q = Z_0 e^{-Q S_inst} for Q ≥ 0 (and Z_{-Q} = Z_Q by CP symmetry):
Σ_Q e^{i θ Q} Z_Q = Z_0 [ 1 + 2 Σ_{Q=1}^∞ e^{-Q S_inst} cos(Q θ) ]
= Z_0 [ 1 + 2 e^{-S_inst} cos θ + 2 e^{-2 S_inst} cos 2θ + ... ]

For S_inst ≈ 0.29 (first instanton), the series converges rapidly. The vacuum energy is:
ε(θ) = ε_0 - (ℏ/T) log[ 1 + 2 e^{-S_inst} cos θ + O(e^{-2 S_inst}) ]

The θ-dependence is small because the instanton action is small (unlike QCD where S_inst ~ 8π^2/g^2 ≫ 1). The prime electron has weak topological fluctuations.

The vacuum angle θ is not a free parameter but is determined by the prime phase winding (A1-20 Piece 11):
θ = 2π W = 2π lim_{N→∞} (1/2π) Σ_{n=1}^N Δφ_n = 2π

which is equivalent to θ = 0 mod 2π. The physical vacuum is uniquely |θ=0⟩.

Piece 05 analyzes the sector wavefunctions and overlap.