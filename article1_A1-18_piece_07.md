# A1-18: Worldline Path Integral — Piece 07
## Gauge Field Coupling and QED Vertex

The coupling to the electromagnetic field is introduced via the minimal coupling prescription in the action:
S = S_0 + e Σ_n A_μ(x_n) Δx^μ_n
where A_μ is the photon field.

In the path integral, this becomes:
Z[A] = ∫ D[x] exp(i/ℏ (S_0 + e Σ_n A_μ(x_n) Δx^μ_n))

The photon field is integrated over with its own action:
S_photon = -1/(4e²) Σ_n d_n F_{μν}(x_n) F^{μν}(x_n)
where F_{μν} = ∂_μ A_ν - ∂_ν A_μ (discrete derivative).

The full QED path integral is:
Z = ∫ D[A] D[x] exp(i/ℏ (S_0 + S_int + S_photon))
where S_int = e Σ_n A_μ(x_n) Δx^μ_n + S_self_int from Piece 03.

The QED vertex function is obtained by differentiating with respect to A_μ:
Γ^μ(p', p) = δ/δA_μ Z[A] |_{A=0}

In the discrete worldline formalism, the vertex function is:
Γ^μ(n, m) = e ⟨x^μ_n exp(i S/ℏ)⟩
This is a sum over paths with a vertex insertion at step n.

The Ward identity q_μ Γ^μ = S_F⁻¹(p') - S_F⁻¹(p) follows from the gauge invariance of the path integral measure (A1-16 Piece 08).

The electron self-energy is:
Σ(p) = e² ∫ D[x] D[A] A·A exp(i S/ℏ)
In the discrete theory, this is a sum over photon exchanges between worldline steps:
Σ(p) = e² Σ_{n,m} D_μν(n, m) ⟨x^μ_n x^ν_m exp(i S_0/ℏ)⟩

The photon propagator in the Feynman gauge is:
D_μν(n, m) = -i g_μν Σ_k (1/k²) exp(-i k·(x_n - x_m))
The sum over k is over momentum modes compatible with the proper time steps.

The vacuum polarization is:
Π_{μν}(q) = -e² Σ_n ⟨x_μ_n x_ν_n exp(i q·x_n) exp(i S_0/ℏ)⟩

The running coupling β(α) = 2α²/3π is recovered from the gap statistics as shown in A1-04.