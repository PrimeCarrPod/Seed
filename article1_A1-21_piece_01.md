# A1-21: Worldline_Winding_Sectors.md — Piece 01

## Introduction: Winding Sector Decomposition of the Prime Electron Worldline

The prime electron worldline decomposes into distinct topological sectors labeled by the winding number Q ∈ ℤ, established in A1-20 (Worldline_Topological_Charge). Each sector corresponds to a homotopy class of maps from the worldline circle S^1 (proper time τ ∈ [0, T] with periodic boundary conditions) to the gauge group SU(2)_L × U(1)_Y. The path integral from A1-18 sums over all sectors:

Z = Σ_{Q=-∞}^∞ Z_Q,   Z_Q = ∫_{Q-sector} D[x] exp(i S[x]/ℏ)

For the prime electron, the gauge connection A_μ(τ) is derived from the Berry connection of prime gap eigenstates (A1-20, Piece 02). The winding number is the degree of the map:
g: S^1 → U(1) ⊂ SU(2),   g(τ) = exp(i θ(τ) σ_3/2)

where θ(τ) = (κ/2) ∫_0^τ dτ' d(τ') ∂_τ' log d(τ') is the phase accumulated along the worldline. The integer Q counts how many times θ(τ) winds around 2π as τ goes from 0 to T.

From A1-20, the topological charge Q = 24 for the full PrimeBookOne directory 3.0 worldline (3.67×10^9 gaps, 3500 books). The winding sectors are not equally populated. The 3500 books (worldline segments of 2^20 gaps each) contain record gaps that generate instanton transitions (A1-19). Each record gap contributes ΔQ = 1. The 24 record gaps in directory 3.0 are distributed across 24 distinct books, giving 24 books with Q = 1 and 3476 books with Q = 0.

This piece introduces the winding sector formalism. Piece 02 derives the sector decomposition from the prime gap sequence structure.