# p_adic_AdS_CFT_Bruhat_Tits_Trees_Adelic_Bulk_Reconstruction — Piece 02/13
## Article A8: A8-09 — p-adic AdS/CFT Bruhat Tits Trees Adelic Bulk Reconstruction
**Piece:** 02 of 13  
**Generated:** 2026-10-07 02:05:00 UTC  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier

---

## 2. Bruhat-Tits Tree Tₚ: (p+1)-Regular Graph as Coset Space

The Bruhat-Tits tree Tₚ is the fundamental geometric object in p-adic AdS/CFT. It is a (p+1)-regular infinite tree whose vertices correspond to homothety classes of lattices in ℚₚ².

### 2.1 Construction as Coset Space

Tₚ = GL₂(ℚₚ) / (GL₂(ℤₚ) · ℚₚ^×)

The group GL₂(ℚₚ) acts transitively on the vertices. The stabilizer of a vertex is the maximal compact subgroup GL₂(ℤₚ) times the center ℚₚ^×.

**Vertices**: v ∈ V(Tₚ) ↔ [Λ] where Λ ⊂ ℚₚ² is a ℤₚ-lattice, up to scaling by ℚₚ^×.

**Edges**: Two vertices [Λ₁], [Λ₂] are adjacent iff Λ₁ ⊂ Λ₂ and [Λ₂ : Λ₁] = p (or vice versa).

This gives a (p+1)-regular tree: each vertex has exactly p+1 neighbors.

### 2.2 Boundary at Infinity

The boundary ∂Tₚ is the set of infinite paths from a fixed root vertex. It is homeomorphic to the projective line:

∂Tₚ ≅ ℙ¹(ℚₚ) = ℚₚ ∪ {∞}

The action of GL₂(ℚₚ) on Tₚ extends to the boundary as Möbius transformations:

γ · z = (az + b)/(cz + d),  γ = [[a, b], [c, d]] ∈ GL₂(ℚₚ)

### 2.3 Distance and Ultrametric

The graph distance d_T(v₁, v₂) on the tree induces an ultrametric on the boundary:

d_∂(z₁, z₂) = p^{−d_T(v₁, v₂)}

where v₁, v₂ are vertices on the paths representing z₁, z₂. This is exactly the p-adic metric on ℙ¹(ℚₚ).

### 2.4 Laplacian on the Tree

The Laplacian on Tₚ is the adjacency matrix minus the degree:

(Δf)(v) = Σ_{w∼v} f(w) − (p+1) f(v)

The spectrum of Δ on ℓ²(V(Tₚ)) is continuous:
Spec(Δ) = [−2√p, 2√p] with multiplicity, plus a point spectrum at ±(p+1).

The eigenfunctions are spherical functions (analog of plane waves on ℍ²).

### 2.5 Prime Electron on the Tree

For the prime electron, the Bruhat-Tits tree Tₚ is the bulk geometry for the p-adic branch. The prime gaps dₙ define a "particle" propagating on this tree.

The position of the particle at step n is a vertex vₙ ∈ V(Tₚ). The transition from vₙ to vₙ₊₁ is determined by the p-adic valuation of the gap:

vₚ(dₙ) = k  ↔  the particle moves k steps toward the boundary

If p ∤ dₙ (vₚ = 0), the particle stays at the same "depth" in the tree (horizontal move).
If p | dₙ, the particle moves toward the boundary (radial move).

### 2.6 Tree Depth and Proper Time

The depth of a vertex v in Tₚ is its distance from a chosen root vertex v₀. The depth corresponds to the p-adic valuation:

depth(v) = −log_p |z|ₚ for z ∈ ℚₚ

The proper time along the worldline is related to the depth:

τₚ(n) = κₚ · depth(vₙ)

where κₚ is the p-adic conversion factor.

The total proper time is the sum over all primes (adelic):

τ(n) = Σₚ τₚ(n) + τ_∞(n)

where τ_∞ is the real proper time from Section 01.

### 2.7 Coset Space and Symmetry

The coset space structure GL₂(ℚₚ)/GL₂(ℤₚ) gives the tree its symmetry group. The prime electron worldline on Tₚ inherits this symmetry.

The p-adic analog of the Lorentz group is GL₂(ℚₚ). The isometries of Tₚ are exactly this group (mod center).

For the full adelic theory, the symmetry group is the product:

G_adele = GL₂(ℝ) × ∏_p GL₂(ℚₚ)

This is the adelic Lorentz group, which acts on the adelic bulk.

---