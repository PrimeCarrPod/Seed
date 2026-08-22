# A2-14: Proton Decay From Gap Stability — Piece 02

## Worldline Topology and Baryon Number

The worldline γ carries baryon number B through its embedding in SU(3)_C. From A1-06 (Vertex Interaction Points): the worldline's interaction vertices are at primes p_n. The baryon number current is:

J_B^μ = (1/3) Σ_{quarks} \bar{q} γ^μ q

**Topological Conservation:** On the worldline, baryon number is the winding number in the SU(3)_C fiber:

B = (1/24π^2) ∫ dτ ε^{ijk} Tr[(U^† ∂_τ U) T_i T_j T_k]

where U(τ) ∈ SU(3)_C is the color holonomy along the worldline. This is a topological invariant — it cannot change under continuous deformations of the worldline.

**UV Boundary Breaking:** At the UV boundary (directory 3.0, record gap 426), the worldline terminates. The boundary condition allows B violation because the topological charge can "leak" out of the worldline endpoint. This is the analog of instanton-mediated B violation in the SM, but here it is a boundary effect of the single worldline.

From A1-22 (Worldline Boundary Conditions): The UV boundary at directory 3.0 imposes:
- Ψ(τ_UV) = 0 (worldline ends)
- ∂_τ Ψ(τ_UV) ≠ 0 (non-zero derivative = B violation source)

The B-violating operator has coefficient ∼ exp(-S_inst) where S_inst is the worldline instanton action from A1-19.

**Key Result:** Proton decay is not a perturbative effect — it is a non-perturbative worldline boundary effect. The rate is exponentially suppressed by the instanton action, which is determined by the final record gap d_{426}.

**Reference:** A1-06, A1-19, A1-22, A2-12.