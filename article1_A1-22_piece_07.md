# A1-22: Worldline_Boundary_Conditions.md — Piece 07

## Atiyah-Patodi-Singer Boundary Conditions and η-Invariant

The Atiyah-Patodi-Singer (APS) index theorem for manifolds with boundary provides the correct framework for the prime electron worldline with boundaries at τ=0 and τ=T. The APS boundary condition for the Dirac operator D̸ = γ^μ(∂_μ + i A_μ) is:

At τ=0: P_+ ψ(0) = 0 (project onto positive eigenvalues of boundary Dirac operator)
At τ=T: P_- ψ(T) = 0 (project onto negative eigenvalues)

where P_± = (1 ± sign(D̸_boundary))/2. For the 1D worldline, the boundary Dirac operator at τ=0 is:
D̸_0 = γ^0 (∂_τ + i A_0(0)) = σ_1 (∂_τ + i A_0(0))

Its eigenvalues are λ_n = ± |∂_τ + i A_0(0)|. The APS condition selects the positive eigenvalues at τ=0 and negative at τ=T.

The index of D̸ on [0,T] with APS boundary conditions is:
Index(D̸) = ∫_0^T (1/2π) Tr(F ∧ F) dτ - (η(D̸_T) - η(D̸_0))/2

where η(D̸) = Σ sign(λ) is the η-invariant of the boundary operator.

From A1-20 Piece 07, the bulk integral gives Q = 24. The η-invariants at the boundaries are:
η(D̸_0) = η(D̸(τ=0)) = sign(A_0(0)) = sign(κ log 2) = +1
η(D̸_T) = η(D̸(τ=T)) = sign(A_0(T)) = sign(16.2 κ) = +1

So (η_T - η_0)/2 = 0, and Index = Q = 24.

The APS boundary conditions are consistent with the physical boundary conditions:
- At τ=0 (IR): The initial state has positive chirality (electron-like)
- At τ=T (UV): The final state has negative chirality (positron-like, by CPT)

This matches the pair creation/annihilation picture from A1-07: the worldline starts as an electron (τ=0) and ends as a positron (τ=T) in the backward time direction.

The spectral flow from η_0 = +1 to η_T = +1 with 24 zero crossings (at record gaps) gives the net index 24. Each record gap is a zero mode crossing where an eigenvalue of D̸ changes sign.

Piece 08 discusses the anomaly inflow at the boundaries.