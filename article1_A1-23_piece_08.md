# A1-23: Worldline_Anomaly_Inflow.md — Piece 08

## Anomaly Inflow Current: Bulk-to-Boundary Flow in Prime Gap Space

The anomaly inflow current is the mechanism by which the bulk Chern-Simons theory cancels the boundary anomaly. In the prime electron framework, the bulk is the fiber bundle of 256-dimensional Hilbert spaces over the worldline, and the current is the spectral flow of the Dirac operator as a function of proper time.

The bulk Chern-Simons action (Piece 04) is:

S_CS = (k/4π) ∫_{W×F} Tr(A ∧ dA + (2/3)A ∧ A ∧ A)

with level k = Index(D) = number of record gaps ≈ 22.

The equation of motion from varying A is:

dA + A ∧ A = 0  ⇒  F = 0 in the bulk

However, with a boundary, the solution has F ≠ 0 near the boundary. The boundary condition is the Callan-Harvey condition:

A_⊥|_{boundary} = 0  (normal component vanishes)
ψ_L|_{boundary} = 0  (chiral fermion boundary condition)

The anomaly inflow current is the Noether current associated with the gauge symmetry. For the U(1) subgroup:

J^μ = (k/2π) ε^{μνρ} ∂_ν A_ρ = (k/2π) ε^{μνρ} F_{νρ}

In the bulk coordinates (τ, φ¹, φ²) where φ are fiber coordinates:

J^τ = (k/2π) (∂_1 A_2 - ∂_2 A_1) = (k/2π) F_{12}

This is the radial current flowing from the bulk to the boundary. In the prime gap framework, the fiber coordinates φ correspond to the 255 angles parameterizing the U(256)/U(1)^255 flag manifold of gap states.

The current at the boundary (worldline) is:

J^τ|_boundary = (k/2π) F_{12}|_boundary

Using the explicit connection from Piece 02 of A1-20, the fiber components are:

A_i = i ⟨ψ| ∂_i |ψ⟩  (Berry connection on the fiber)

where |ψ(τ, φ)⟩ are the instantaneous eigenstates of the gap-dependent Hamiltonian. The field strength is:

F_{12} = ∂_1 A_2 - ∂_2 A_1 = i ⟨∂_1 ψ|∂_2 ψ⟩ - i ⟨∂_2 ψ|∂_1 ψ⟩ = 2 Im ⟨∂_1 ψ|∂_2 ψ⟩

This is the Berry curvature on the fiber. The total inflow current integrated over the fiber is:

J^τ|_boundary = (k/2π) ∫_F F_{12} d²φ = k × (Chern number of fiber bundle)

The fiber bundle over the worldline has Chern number = 1 (from the non-trivial topology of the gap space). Therefore:

J^τ|_boundary = k = Index(D)

This is the total anomaly inflow: 22 units of chiral charge flow from the bulk to the boundary, exactly canceling the 22 zero modes from the instantons.

The local current at gap n is:

J_n = (1/2π) F_{01}(τ_n) = (1/2π) (κ d_n ∂_n^2 log(d_n) + O(κ²))

Summing over all gaps:

Σ_n J_n = (κ/2π) Σ_n d_n ∂_n^2 log(d_n) = Index(D) = 22

Piece 09 computes the anomaly in the 8-bit Hilbert space context (A3).