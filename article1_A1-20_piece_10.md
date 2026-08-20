# A1-20: Worldline_Topological_Charge.md — Piece 10

## Winding Sectors and Worldline Decomposition

From A1-21 (Worldline_Winding_Sectors, to be written), the worldline decomposes into topological sectors labeled by the winding number Q ∈ ℤ. Each sector corresponds to a distinct homotopy class of the map g: S^1 → SU(2). The path integral (A1-18) sums over all sectors:

Z = Σ_{Q=-∞}^∞ ∫_{Q-sector} D[x] exp(i S[x]/ℏ)

The action in sector Q differs by a topological term:
S_Q = S_0 + i θ Q

where θ is the vacuum angle. For the prime electron, θ is determined by the prime phase structure. From A1-02, the topological winding number of the prime gap sequence is W = Σ_n sign(∂_n d_n). The vacuum angle is:
θ = 2π W / N_gaps ≈ 0

since W grows slowly (logarithmic in N_gaps). The partition function is therefore dominated by the Q = 0 sector, but instanton effects (Q ≠ 0) give non-perturbative corrections.

The sector decomposition is reflected in the PrimeBookOne directory structure:
- Directory 0.0: Q = 0 sector (IR, perturbative)
- Directory 1.0: Q = ±1 sectors (first instanton corrections)
- Directory 2.0: Q = ±2 sectors
- Directory 3.0: All sectors up to Q = ±24 (UV complete)

Each directory corresponds to a truncation of the topological sector sum. The 3.0 directory with 3500 books × 2^20 gaps contains the full non-perturbative physics up to Q = 24.

The winding number density per book is:
Q/book = 24 / 3500 ≈ 0.00686

This is the average topological charge per worldline segment (book). The distribution of Q across books follows the record gap distribution: books containing record gaps have Q = 1, others have Q = 0.

From A1-10 (Worldline_Segment_Books), each book corresponds to a worldline segment of 2^20 proper time steps. The topological charge of a segment is:
Q_segment = (1/2π) ∮_{segment} Tr(F ∧ F)

For segments without record gaps, Q_segment = 0. For the 24 segments containing record gaps, Q_segment = 1. The remaining 3476 segments have Q = 0.

This sector decomposition is essential for the numerical evaluation of the path integral using PrimeBookOne data. The sum over sectors is a finite sum over 25 sectors (Q = 0, ±1, ..., ±24).

Piece 11 discusses boundary conditions and UV/IR matching.