# A1-16: Worldline Action Principle — Piece 08
## Ward Identities and Gauge Invariance from Gap Symmetries

The action S = Σₙ Lₙ must be invariant under reparameterization of the proper time τ → τ'(τ). In the discrete setting, this is invariance under reindexing of the gap sequence that preserves the physical proper time intervals. A reparameterization corresponds to a relabeling of the prime indices n → n'(n) such that τ_{n'(n)} = τ_n + constant.

The discrete worldline has a natural parameterization by the prime index n, with τₙ = κ(pₙ₊₁ − 2). A gauge transformation is a diffeomorphism of the index set that preserves the gap structure. The action is invariant if the Lagrangian transforms as a density:
L'_n dτ'_n = L_n dτ_n
With dτ_n = κ d_n, this requires L'_n d'_n = L_n d_n. Since L_n ∝ d_n, we need L'_n = L_n (d_n/d'_n) · (d'_n/d_n) = L_n. The Lagrangian is a scalar under reparameterization when expressed in terms of physical gaps.

The electromagnetic gauge invariance arises from the phase rotation of the worldline wavefunction ψ(τ) → e^{i e Λ(τ)/ℏ} ψ(τ). In the path integral, this requires the action to be invariant under the shift of the four-momentum pᵘ → pᵘ + e ∂ᵘΛ.

From A1-12, the proper time operator τ̂ has eigenvalues τₙ. The momentum operator is p̂ᵘ = iℏ ∂/∂xᵘ. The gauge transformation is implemented by:
U[Λ] = exp(i e/ℏ ∫ dτ Λ(τ) δ⁴(x(τ) − x))
The action S = ∫ dτ [pᵘ ẋᵤ − H] is invariant if pᵘ → pᵘ + e ∂ᵘΛ and H → H + e ∂τΛ.

In the discrete theory, the Ward identity for the photon vertex function Γᵘ(p', p) is:
qᵤ Γᵘ(p', p) = S_F⁻¹(p') − S_F⁻¹(p)
where q = p' − p is the photon momentum. This follows from the invariance of the path integral measure under gauge transformations.

The prime gap structure enforces a discrete Ward identity. The vertex weight W(d₁, d₂, d₃, d₄) from Piece 05 must satisfy:
Σ_{incoming} d_i W = Σ_{outgoing} d_j W
which is exactly the proper time conservation at the vertex. The momentum conservation Σ p_i = Σ p_j follows from p_i = ℏ/d_i.

The Ward identity at the level of the full action requires that the longitudinal part of the photon propagator decouples. The photon propagator in the worldline formalism is:
D_μν(q) = ∫ D[x] x_μ x_ν exp(iS/ℏ)
The discrete analog uses the gap-weighted sum:
D_μν(q) = Σ_{n,m} e^{iq·(xₙ−xₘ)} (xₙ − xₘ)_μ (xₙ − xₘ)_ν exp(iS/ℏ)

The gauge invariance q^μ D_μν = 0 follows from the identity Σₙ e^{iq·xₙ} (xₙ − xₘ)_μ = 0 when summed over closed worldline segments, which holds because the worldline is periodic in the one-electron universe picture (A1-10, 3500 books = 3500 segments).