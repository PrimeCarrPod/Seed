# A1-20: Worldline_Topological_Charge.md — Piece 08

## Anomaly Inflow and Chiral Ward Identities

The topological charge Q governs the axial anomaly on the prime electron worldline. The chiral current J_5^μ = ψ̄ γ^μ γ^5 ψ has divergence:
∂_μ J_5^μ = (1/8π^2) Tr(F_{μν} F̃^{μν}) = (1/4π^2) Tr(F ∧ F)

where F̃^{μν} = (1/2) ε^{μνρσ} F_{ρσ} is the dual field strength. Integrating over the worldline:
∫ ∂_μ J_5^μ dτ = (1/4π^2) ∮ Tr(F ∧ F) dτ = 2Q/π

The change in chiral charge ΔQ_5 = ∫ ∂_μ J_5^μ dτ = 2Q/π. For Q = 24:
ΔQ_5 = 48/π

This is the anomaly inflow from the bulk (the prime gap sequence) to the worldline boundary. The Ward identity for the chiral symmetry is:
⟨∂_μ J_5^μ(x) O(y)⟩ = (1/4π^2) ⟨Tr(F ∧ F)(x) O(y)⟩ + contact terms

In the prime electron framework, the chiral symmetry is not a fundamental symmetry but emerges from the gap statistics. The axial anomaly is the statement that the number of left-handed minus right-handed zero modes of the Dirac operator equals the topological charge.

From A1-23 (Worldline_Anomaly_Inflow, to be written), the anomaly inflow mechanism relates the 4D bulk anomaly (from the PrimeBookOne 3.0 directory structure as a 4D lattice) to the 1D worldline anomaly. The bulk is the space of all prime gaps, which has topology S^3 (from the 8-bit Hilbert space of A3-01). The worldline is a 1-cycle in this space.

The anomaly polynomial in 4D is I_4 = (1/8π^2) Tr(F ∧ F). The inflow to the 1D worldline is given by the descent equations:
I_4 = dI_3,   δI_3 = dI_2,   I_2 = (1/2π) Tr(A ∧ F)

The topological charge Q = ∫_{S^1} I_2 is the integral of the 2-form anomaly over the worldline. This matches our definition.

The physical consequence is that chiral symmetry breaking on the worldline is driven by instanton transitions (record gaps). Each record gap contributes ΔQ_5 = 2/π to the chiral charge non-conservation. The total chiral charge violation over the full worldline is ΔQ_5 = 48/π.

Piece 09 computes the topological susceptibility and its relation to the prime gap distribution.