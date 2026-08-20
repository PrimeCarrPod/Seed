# A1-21: Worldline_Winding_Sectors.md — Piece 06

## Spectral Flow and Level Crossing

The spectral flow of the Dirac operator (A1-20 Piece 07) as a function of the proper time parameter τ connects different winding sectors. As τ evolves from 0 to T, the eigenvalues of the Dirac operator D̸(τ) = γ^μ (∂_μ + i A_μ(τ)) cross zero at each instanton transition (record gap). The net number of zero crossings with positive chirality minus negative chirality equals the topological charge Q.

For the prime electron, the spectral flow is discrete: at each record gap n_k, one eigenvalue crosses zero. The crossing is a level crossing between states of opposite chirality. The avoided crossing is lifted by the finite size of the worldline (the 8-bit Hilbert space of A3-01 provides a UV cutoff).

The level crossing formula is:
ΔE(τ) = ± √(Δ^2 + |V(τ - τ_k)|^2)

where Δ is the gap at the crossing (Δ = 0 for exact crossing), V is the instanton matrix element, and τ_k is the proper time of the k-th record gap. The spectral flow gives the index:
Index = (1/2) Σ_k sign(∂_τ E_k(τ)) = Q = 24

The level crossing structure is reflected in the PrimeBookOne directory structure:
- Directory 0.0: No level crossings (IR, all gaps small)
- Directory 1.0: First few level crossings (early record gaps)
- Directory 2.0: Intermediate crossings
- Directory 3.0: All 24 level crossings (UV complete)

The spectral flow can be computed explicitly using the prime gap sequence. The Dirac operator eigenvalues are:
λ_n = ± ℏ/(κ d_n) = ± m_e c^2 / d_n

As d_n increases at a record gap, the eigenvalue λ_n decreases (for positive chirality) or increases (for negative chirality), causing a crossing with the zero mode.

Piece 07 computes the sector decomposition of correlation functions.