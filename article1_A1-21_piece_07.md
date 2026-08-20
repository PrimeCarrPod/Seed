# A1-21: Worldline_Winding_Sectors.md — Piece 07

## Correlation Functions in Winding Sectors

The two-point correlation function of the electron field ψ(τ) in sector Q is:
G_Q(τ, τ') = ⟨Q| T ψ(τ) ψ̄(τ') |Q⟩

In the path integral representation:
G_Q(τ, τ') = (1/Z_Q) ∫_{Q-sector} D[ψ, ψ̄] ψ(τ) ψ̄(τ') exp(i S/ℏ)

The full correlation function is the sum over sectors:
G(τ, τ') = Σ_Q (Z_Q/Z) G_Q(τ, τ')

For the prime electron, the electron field is the worldline coordinate x^μ(τ). The correlation function is:
G_Q(τ, τ') = ⟨x^μ(τ) x^ν(τ')⟩_Q

In the perturbative sector (Q = 0), this is the free propagator:
G_0(τ, τ') = (ℏ/m_e c) |τ - τ'| η^{μν} (in proper time gauge)

In sectors with Q ≠ 0, the instanton modifies the propagator. For a single instanton at τ = τ_k (record gap), the correction is:
ΔG_1(τ, τ') = G_0(τ, τ_k) V_k G_0(τ_k, τ')

where V_k is the instanton vertex. Summing over all instantons:
G(τ, τ') = G_0(τ, τ') + Σ_k G_0(τ, τ_k) V_k G_0(τ_k, τ') + Σ_{k≠l} G_0(τ, τ_k) V_k G_0(τ_k, τ_l) V_l G_0(τ_l, τ') + ...

This is the instanton expansion of the propagator. The vertex V_k is related to the gap change at the record gap:
V_k = (m_e c/ℏ) (d_{rec} - d_{prev}) / d_{prev} = (m_e c/ℏ) (d_k/d_{k-1} - 1)

For the first record gaps: V_1 = (m_e c/ℏ)(4/2 - 1) = m_e c/ℏ, V_2 = (m_e c/ℏ)(6/4 - 1) = 0.5 m_e c/ℏ, V_3 = (m_e c/ℏ)(8/6 - 1) = 0.33 m_e c/ℏ, etc.

The sector decomposition of the Fourier transform (energy-momentum space) is:
G_Q(p) = (1/T) ∫ dτ dτ' e^{i p·(τ-τ')} G_Q(τ, τ')

For Q = 0: G_0(p) = (ℏ/m_e c) / p^2 (free propagator)
For Q ≠ 0: G_Q(p) has poles at p^2 = -M_Q^2 where M_Q = Q · m_e c^2 / κ is the BPS mass (A1-20 Piece 09).

Piece 08 discusses the wall crossing formula for sector transitions.