# A1-21: Worldline_Winding_Sectors.md — Piece 08

## Wall Crossing and Gap Transitions

From A1-29 (Worldline_Wall_Crossing, to be written), the transition between winding sectors is governed by wall crossing formulas. As the worldline parameter (proper time) varies, the stability of BPS states changes at walls of marginal stability. For the prime electron, the walls correspond to record gap transitions.

The wall crossing formula for the indexed partition function (protected spin character) is:
Ω(γ; z) = Σ_{k} ⟨γ, γ_k⟩ Ω(γ_k) Ω(γ - γ_k)

where γ is the charge vector, z are moduli (here the prime gap distribution), and ⟨·,·⟩ is the Dirac-Schwinger-Zwanziger symplectic product. For the prime electron, the charge vector is γ = (Q, P) where Q is the topological charge and P is the momentum along the worldline.

The walls of marginal stability occur when:
Z(γ_1; z) / Z(γ_2; z) ∈ ℝ_{>0}

where Z(γ) = ∫_γ Ω is the central charge. For the prime electron, Z(Q) = Q · m_e c^2 (A1-20 Piece 09). The wall crossing condition for a record gap transition Q → Q+1 is:
Z(Q) / Z(1) = Q ∈ ℝ_{>0}

which is always true for Q > 0. Thus every record gap is a wall crossing event where a new BPS state (instanton) becomes stable.

The Kontsevich-Soibelman wall crossing formula for the product of symplectomorphisms is:
Π_{γ: arg Z(γ) increasing} K_γ^{Ω(γ)} = identity

where K_γ = exp(Ω(γ) Li_2(X_γ)) and X_γ are cluster variables. For the prime electron, the cluster variables are the gap ratios X_k = d_k/d_{k-1}. The wall crossing product is:
Π_{k=1}^{24} K_{Q=1}^{Ω_k} = identity

with Ω_k = 1 for each record gap (each instanton is a single BPS state). This gives:
Π_{k=1}^{24} (1 - X_k) = 1

where X_k = d_k/d_{k-1} for the k-th record gap. This is a non-trivial identity on the prime gap sequence.

Piece 09 analyzes the sector decomposition in the 8-bit Hilbert space.