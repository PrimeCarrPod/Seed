# A1-16: Worldline Action Principle — Piece 04
## Hamiltonian Formulation: Proper Time as Evolution Parameter

From the discrete Lagrangian Lₙ = (mₑc/2) dₙ Ωₙ η_μν vᵘₙ vᵛₙ, the canonical momentum conjugate to xᵘₙ is:
pᵘₙ = ∂Lₙ/∂vᵘₙ = mₑc dₙ Ωₙ vᵘₙ
In the continuum limit dτ = κ dₙ, pᵘ = mₑc Ω(τ) uᵘ where uᵘ = dxᵘ/dτ is the four-velocity. The canonical Hamiltonian is:
Hₙ = pᵘₙ vᵘₙ − Lₙ = mₑc dₙ Ωₙ η_μν vᵘₙ vᵛₙ − (mₑc/2) dₙ Ωₙ η_μν vᵘₙ vᵛₙ = (mₑc/2) dₙ Ωₙ η_μν vᵘₙ vᵛₙ = Lₙ
For the relativistic particle, η_μν vᵘ vᵛ = −c² (metric signature +−−−), so:
Hₙ = −(mₑc³/2) dₙ Ωₙ
The total Hamiltonian is the sum over all steps:
H = Σₙ Hₙ = −(mₑc³/2) Σₙ dₙ √(1 + λ C(dₙ))

Since proper time τ is the evolution parameter (not a dynamical variable), the Hamiltonian is constrained. The mass-shell condition in the conformal metric:
g_μν p^μ p^ν = −mₑ²c² Ω⁻²
becomes discrete:
η_μν pᵘₙ pᵛₙ = −mₑ²c² dₙ² Ωₙ⁻²

The action in Hamiltonian form:
S = Σₙ [pᵘₙ Δxᵘₙ − Hₙ] = Σₙ [pᵘₙ (xᵘₙ₊₁ − xᵘₙ) − Hₙ]
This is the discrete phase space path integral weight exp(iS/ℏ).

From A1-12, the proper time operator τ̂ has eigenvalues τₙ = κ(pₙ₊₁ − 2). The Hamiltonian operator generating evolution in τ is:
Ĥ = ℏ/κ Σₙ dₙ⁻¹ |n⟩⟨n|
where |n⟩ are proper time eigenstates. The classical Hamiltonian Hₙ = −(mₑc³/2) dₙ Ωₙ corresponds to the expectation value ⟨n|Ĥ|n⟩ in the semiclassical limit.

The Hamilton's equations in discrete form:
Δxᵘₙ = ∂Hₙ/∂pᵘₙ = dₙ Ωₙ ηᵘᵛ pᵛₙ/(mₑc) = dₙ vᵘₙ (consistent)
Δpᵘₙ = −∂Hₙ/∂xᵘₙ = −∂Lₙ/∂xᵘₙ
which reproduces the geodesic equation with proper time as the affine parameter.