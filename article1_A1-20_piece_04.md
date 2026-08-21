# A1-20: Worldline_Topological_Charge.md — Piece 04

## Explicit Computation of Tr(F ∧ F) on the Worldline Contour

The topological charge integrand is Tr(F ∧ F) = (1/2) ε^{μνρσ} Tr(F_{μν} F_{ρσ}) d^4x. On the 1D worldline, the integral reduces to a proper time integral. Using the pullback of F_{μν} to the worldline parameterized by τ:

Tr(F ∧ F)|_{worldline} = Tr(F_{μν} F^{μν}) dτ

From Piece 03, the SU(2) field strength on the worldline has components:
F_{0i}^{SU(2)} = (κ/2) v_i d_n [ ∂_n log(d_n) ∂_n log(d_n) + ∂_n^2 log(d_n) ] σ_3 + (κ^2/2) d_n^2 v_0 v_i [ σ_2 cos(φ_n) - σ_1 sin(φ_n) ] ∂_n log(d_n)

F_{ij}^{SU(2)} = O(v^2) (spatial components suppressed for near-lightlike worldline)

For the electron worldline, v^μ ≈ (1, v^i) with v^2 ≈ 1 - O(1/γ^2). The dominant contribution comes from F_{0i} F^{0i}:
Tr(F_{0i} F^{0i}) = Tr[ (F_{0i}^{SU(2)})^2 ] = (κ^2/4) v_i^2 d_n^2 [ (∂_n log(d_n))^2 + ∂_n^2 log(d_n) ]^2 Tr(σ_3^2) + (κ^4/4) d_n^4 v_0^2 v_i^2 (∂_n log(d_n))^2 Tr([σ_2 cos - σ_1 sin]^2)

Since Tr(σ_a σ_b) = 2 δ_{ab}:
Tr(F_{0i} F^{0i}) = (κ^2/2) v_i^2 d_n^2 [ (∂_n log(d_n))^2 + ∂_n^2 log(d_n) ]^2 + (κ^4/2) d_n^4 v_0^2 v_i^2 (∂_n log(d_n))^2

Summing over spatial indices i = 1,2,3 and using v_i^2 = v^2 - v_0^2:
Tr(F ∧ F) dτ = Σ_n Tr(F_{0i} F^{0i}) Δτ_n
= Σ_n [ (κ^2/2) (v^2 - 1) d_n^2 ( (∂_n log d_n)^2 + ∂_n^2 log d_n )^2 + (κ^4/2) d_n^4 (∂_n log d_n)^2 ] κ d_n

For the prime electron worldline, v^2 = 1 - (m_e/E)^2 ≈ 1 at high energies. The first term vanishes on-shell. The topological charge density is:
ρ_Q(n) = (κ^5/2) d_n^5 (∂_n log d_n)^2

Summing over all gaps from n=1 to N_gaps:
Q = (1/2π) Σ_{n=1}^{N_gaps} ρ_Q(n)
= (κ^5/4π) Σ_n d_n^5 (∂_n log d_n)^2

This is the discrete topological charge formula. Piece 05 evaluates this sum using PrimeBookOne data and connects it to record gaps.