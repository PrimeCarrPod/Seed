# p_adic_AdS_CFT_Bruhat_Tits_Trees_Adelic_Bulk_Reconstruction — Piece 06/13
## Article A8: A8-09 — p-adic AdS/CFT Bruhat Tits Trees Adelic Bulk Reconstruction
**Piece:** 06 of 13  
**Generated:** 2026-10-07 02:25:00 UTC  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier

---

## 6. Discrete Klein-Gordon on Tree Vertices

The matter fields on the Bruhat-Tits tree Tₚ satisfy a discrete Klein-Gordon equation. For the prime electron, the "field" is the worldline wavefunction on the tree vertices.

### 6.1 Discrete Klein-Gordon Equation

On a graph, the Klein-Gordon equation is:

(Δ + m²) ψ(v) = 0

where Δ is the graph Laplacian:

(Δψ)(v) = Σ_{w∼v} ψ(w) − (p+1) ψ(v)

and m² is the mass parameter.

For Tₚ, the Laplacian is the adjacency operator minus the degree. The eigenfunctions are the spherical functions Φ_s(v) parameterized by s ∈ ℂ:

(Δ + m²) Φ_s = 0  with  m² = s² − (p+1)²/4? Let me be precise.

The spherical functions satisfy:

Σ_{w∼v} Φ_s(w) = (p+1) Φ_s(v) + λ(s) Φ_s(v)

where λ(s) = p^{s/2} + p^{−s/2} is the eigenvalue of the adjacency operator.

The mass-shell condition is:

λ(s) = m² + p + 1

For the prime electron, the mass parameter is determined by the gap statistics.

### 6.2 Prime Gaps as Field Configurations

The prime gap sequence {dₙ} defines a sequence of field values on the tree:

ψ(vₙ) = f(dₙ)

where vₙ ∈ V(Tₚ) is the vertex at step n, and f is a function from gaps to field values.

The discrete Klein-Gordon equation for this sequence is:

Σ_{w∼vₙ} ψ(w) − (p+1) ψ(vₙ) + m² ψ(vₙ) = 0

Since the particle only moves to adjacent vertices, this relates ψ(vₙ) to ψ(vₙ₊₁) and ψ(vₙ₋₁).

### 6.3 Propagator on the Tree

The propagator (Green's function) on Tₚ is:

G(v, w; m²) = ⟨v| (Δ + m²)^{-1} |w⟩

It depends only on the distance d = d_T(v, w):

G(d; m²) = (1/(p+1)) (p^{1/2})^d · F(d, m²)

where F involves the spherical functions.

For the prime electron, the two-point function of gap operators is:

⟨O(dₙ) O(dₘ)⟩ = G(vₙ, vₘ; m²)

This connects the prime gap correlations to the bulk propagator.

### 6.4 Mass Spectrum from Tree Geometry

The mass parameter m² is determined by the scaling dimension Δ of the boundary operator:

m² = Δ(Δ − 1)  (for AdS₂)

For the p-adic case, the relation is:

m² = λ(s) − (p+1)

with λ(s) = p^{s/2} + p^{−s/2} and Δ = 1/2 + s/2.

The Riemann zeros γ give s = iγ/π, so:

m² = p^{iγ/2π} + p^{−iγ/2π} − (p+1) = 2 cos(γ log p / 2π) − (p+1)

This is the p-adic mass spectrum of the prime electron excitations.

### 6.5 Boundary-to-Bulk Propagator

The bulk field is determined by the boundary data via the boundary-to-bulk propagator:

K(z, v) = ⟨z| v⟩ = (1 + d_T(v, z))^{−Δ}

where d_T(v, z) is the distance from vertex v to boundary point z.

For the prime electron, the boundary data is the gap sequence J(z) = Σₙ dₙ δ(z − zₙ). The bulk field is:

φ(v) = ∫ K(z, v) J(z) dz = Σₙ dₙ K(zₙ, v)

This is the explicit bulk reconstruction of the worldline from the boundary gap data.

### 6.6 Discrete vs Continuous

The discrete Klein-Gordon on Tₚ is the p-adic analog of the continuous Klein-Gordon on AdS₂ (hyperbolic space). The continuous limit p → 1 (not a prime) recovers the standard equation.

For the prime electron, the discrete equation on the (p+1)-regular tree is exact — there is no continuum limit. The discreteness is fundamental, reflecting the 8-bit nature of the prime differences.

### 6.7 Connection to Section 03: SJ Vacuum on Tree

The Sorkin-Johnston vacuum from Section 03 has a p-adic analog on the Bruhat-Tits tree. The retarded Green's function on the tree is:

G_ret(v, w) = θ(τ(v) − τ(w)) G(v, w)

where τ(v) is the proper time (depth) on the tree.

The SJ state is defined by the positive spectral projection of the Pauli-Jordan commutator on the tree. This gives the p-adic analog of the Wightman function.

---