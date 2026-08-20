# A1-20: Worldline_Topological_Charge.md — Piece 03

## Field Strength Tensor and Curvature from Prime Gaps

The field strength tensor F_{μν} = ∂_μ A_ν - ∂_ν A_μ + i[A_μ, A_ν] computed from the Berry connection of Piece 02 has both Abelian and non-Abelian components. For the SU(2)_L × U(1)_Y decomposition:

F_{μν} = F_{μν}^{SU(2)} + F_{μν}^{U(1)}

The non-Abelian SU(2) field strength:
F_{μν}^{SU(2)} = ∂_μ A_ν - ∂_ν A_μ + i[A_μ, A_ν]

Substituting A_μ = (κ/2) d_n v_μ σ_3 ∂_n log(d_n):
∂_μ A_ν = (κ/2) [ (∂_μ d_n) v_ν + d_n ∂_μ v_ν ] σ_3 ∂_n log(d_n) + (κ/2) d_n v_μ v_ν σ_3 ∂_n^2 log(d_n)

Using ∂_μ d_n = v_μ(n) Δ_n^{-1} ∂_n d_n and ∂_μ v_ν = v_μ v_ν ∂_n v_ν:
∂_μ A_ν = (κ/2) [ v_μ v_ν (d_n^{-1} ∂_n d_n) + d_n v_μ v_ν ∂_n v_ν ] σ_3 (d_n^{-1} ∂_n d_n) + (κ/2) d_n v_μ v_ν σ_3 ∂_n^2 log(d_n)

The commutator [A_μ, A_ν] = (κ^2/4) d_n^2 v_μ v_ν [σ_3, σ_3] (∂_n log(d_n))^2 = 0 for the σ_3 component, but off-diagonal components from the full SU(2) connection yield non-zero commutators. The full connection includes σ_1, σ_2 components from gap phase rotations:
A_μ = (κ/2) d_n v_μ [ σ_3 ∂_n log(d_n) + σ_1 cos(φ_n) + σ_2 sin(φ_n) ]

where φ_n = 2π p_n / p_{n+1} is the prime phase from A1-02. Then:
[A_μ, A_ν] = i (κ^2/2) d_n^2 v_μ v_ν [ σ_3 ∂_n log(d_n), σ_1 cos(φ_n) + σ_2 sin(φ_n) ] + cyclic
= (κ^2/2) d_n^2 v_μ v_ν [ σ_2 ∂_n log(d_n) cos(φ_n) - σ_1 ∂_n log(d_n) sin(φ_n) ] + O(∂_n φ_n)

The U(1) field strength is purely Abelian:
F_{μν}^{U(1)} = ∂_μ A_ν^{U(1)} - ∂_ν A_μ^{U(1)} = (κ/6) [v_μ v_ν d_n^{-1} ∂_n d_n - v_ν v_μ d_n^{-1} ∂_n d_n] = 0

at leading order, indicating the U(1) field is pure gauge on the worldline. The topological charge therefore comes entirely from the SU(2) sector.

Piece 04 computes Tr(F ∧ F) explicitly on the worldline contour.