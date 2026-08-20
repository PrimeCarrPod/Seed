# A1-23: Worldline_Anomaly_Inflow.md — Piece 04

## Bulk-Boundary Correspondence: Anomaly Inflow from Prime Gap Hilbert Space

The anomaly inflow mechanism requires a bulk theory whose boundary is the prime electron worldline. The bulk is the fiber bundle E → W where the base W is the worldline (proper time τ ∈ [0, τ_max]) and the fiber at each τ_n is the 256-dimensional Hilbert space H_n (A3-01).

The bulk action is the Chern-Simons theory on the 3D space (τ, x, y) where x, y parameterize the fiber:

S_bulk = (k/4π) ∫_{W×F} Tr(A ∧ dA + (2/3)A ∧ A ∧ A)

where A is the connection on the U(256) bundle over the bulk, and k is the level. The fiber F is the space of gap states, which is 256-dimensional (8-bit from A3-01). The connection A decomposes as:

A = A_μ(τ) dx^μ + A_i(τ, φ) dφ^i

where φ^i (i = 1,..., 255) are coordinates on the fiber (SU(256)/U(1)^255 flag manifold).

The boundary variation of S_bulk under a gauge transformation δA = dλ + [A, λ] is:

δS_bulk = (k/4π) ∫_{∂(W×F)} Tr(λ F) = (k/4π) ∫_W Tr(λ F_∥) + (k/4π) ∫_{∂W×F} Tr(λ F_⊥)

The first term is the anomaly on the worldline boundary. The second term vanishes if the fiber has no boundary (compact). The worldline anomaly is:

A_worldline = (k/4π) ∫_W Tr(λ F_∥) dτ

For the U(1) subgroup (electromagnetic), Tr(F) = F^{U(1)}. Matching with Piece 03:

k/(4π) = κ/(12π)  ⇒  k = κ/3

But κ = ℏ/(m_e c²) is the Compton time, not an integer. The resolution is that the level k is the topological index from Piece 02:

k = Index(D) = Σ_n sign(d_n - ⟨d⟩_local)

which is an integer. The anomaly coefficient is then:

A_worldline = (Index(D)/4π) ∫_W F^{U(1)} = Index(D) × A_U(1)

where A_U(1) is the U(1) anomaly from Piece 03.

The inflow mechanism: the bulk Chern-Simons current J^μ = (k/4π) ε^{μνρ} Tr(F_{νρ}) flows from the bulk to the boundary. At the worldline, this current is:

J^τ|_boundary = (k/2π) F^{U(1)}_{01} = Index(D) × (1/2π) F^{U(1)}_{01}

This exactly cancels the worldline anomaly from the fermion zero modes.

For the prime electron, the bulk is not a physical space but the space of prime gap configurations. The "flow" is the spectral flow of the Dirac operator as gaps change. The level k = number of record gaps ~ log(N) ≈ 21 for N = 3.67×10⁹.

Piece 05 computes the anomaly cancellation explicitly for each book segment.