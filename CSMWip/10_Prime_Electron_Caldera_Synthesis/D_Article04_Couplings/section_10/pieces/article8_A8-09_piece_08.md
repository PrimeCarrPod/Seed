# p_adic_AdS_CFT_Bruhat_Tits_Trees_Adelic_Bulk_Reconstruction — Piece 08/13
## Article A8: A8-09 — p-adic AdS/CFT Bruhat Tits Trees Adelic Bulk Reconstruction
**Piece:** 08 of 13  
**Generated:** 2026-10-07 02:35:00 UTC  
**Author:** Jason Isaac Brodsky (California 1976) — Conducier

---

## 8. Bulk Path Integral = Boundary p-adic CFT Correlators

The p-adic AdS/CFT correspondence states that the bulk path integral on the Bruhat-Tits tree Tₚ with boundary conditions is equal to the correlation functions of the p-adic CFT on the boundary ℙ¹(ℚₚ).

### 8.1 Bulk Action on the Tree

The bulk action for a scalar field φ on Tₚ is:

S[φ] = ½ Σ_{(v,w)∈E} (φ(v) − φ(w))² + ½ m² Σ_{v∈V} φ(v)²

where E is the set of edges. This is the discretized Klein-Gordon action.

In terms of the Laplacian:

S[φ] = ½ ⟨φ, (Δ + m²) φ⟩

### 8.2 Path Integral and Generating Functional

The bulk path integral with boundary source J on ℙ¹(ℚₚ) is:

Z[J] = ∫_{φ|∂=J} 𝒟φ e^{-S[φ]}

This is a Gaussian integral (for free field), giving:

Z[J] = exp(−½ ⟨J, K J⟩)

where K is the boundary-to-boundary propagator (the inverse of the Dirichlet-to-Neumann map).

### 8.3 Boundary CFT Correlators

The p-adic CFT correlation functions are:

⟨O(z₁) ... O(zₙ)⟩ = δⁿZ[J]/δJ(z₁)...δJ(zₙ) |_{J=0}

For the free field, the two-point function is:

⟨O(z) O(z')⟩ = K(z, z') = |z − z'|ₚ^{−2Δ}

where Δ is the scaling dimension.

The higher-point functions factorize (Gaussian), but interactions give non-trivial correlators.

### 8.4 Prime Electron: Boundary Source from Gaps

For the prime electron, the boundary source is:

J(z) = Σₙ dₙ δ(z − [dₙ : 1])

The bulk path integral with this source computes the amplitude for the worldline configuration:

Z = ∫ 𝒟φ e^{-S[φ] + Σₙ dₙ φ(vₙ)}

where vₙ is the bulk vertex corresponding to the boundary point [dₙ : 1].

### 8.5 Bulk Reconstruction Formula

The bulk field is reconstructed from the boundary data:

φ(v) = ∫ K(z, v) J(z) dz = Σₙ dₙ K([dₙ : 1], v)

where K(z, v) is the boundary-to-bulk propagator.

This is the **bulk reconstruction formula** — the worldline in the bulk is determined by the boundary gap sequence.

### 8.6 Correlation Functions of Gap Operators

The gap operators O_d(z) = Σₙ δ(z − [dₙ : 1]) have correlation functions:

⟨O_{d₁}(z₁) ... O_{dₙ}(zₙ)⟩ = Σ_{n₁,...,nₙ} ∏ K(z_{n_i}, z_{n_j}) · (arithmetic factors)

The arithmetic factors come from the prime gap correlations (Hardy-Littlewood conjectures).

### 8.7 Witten Diagram on the Tree

The p-adic analog of Witten diagrams are tree graphs embedded in Tₚ. The vertices of the Witten diagram correspond to interaction points in the bulk, and the edges are bulk propagators.

For the prime electron, the "interactions" are the self-intersections of the worldline. The Witten diagrams compute the correlation functions of the gap operators.

### 8.8 Connection to Section 07: SFF from Bulk

The spectral form factor from Section 07 is the p-adic bulk path integral for the partition function with two boundaries (double-trumpet on Tₚ). The ramp comes from the connected bulk geometry, and the plateau from the disconnected geometries.

The adelic product of p-adic bulk path integrals gives the full SFF:

K(τ) = ∫ 𝒟φ_adele e^{-S_adele[φ_adele] + ...}

where φ_adele = (φ_∞, φ_2, φ_3, ...) and S_adele = S_∞ + Σ_p S_p.

---