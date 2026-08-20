# A1-18: Worldline Path Integral — Piece 09
## Continuum Limit and Effective Field Theory

The continuum limit of the discrete path integral is obtained by coarse-graining over many steps. For a block of M steps with average gap ⟨d⟩, the effective proper time is:
Δτ_eff = κ M ⟨d⟩

The effective action for the block is:
S_eff = Σ_{blocks} (m_e c/2) Δτ_eff ⟨Ω⟩ η_μν ẋ^u ẋ^v
where ⟨Ω⟩ = √(1 + λ ⟨C⟩) is the average conformal factor.

The coarse-grained path integral is:
Z_eff = ∫ D[x] exp(i S_eff/ℏ)
with the measure D[x] = Π_blocks d⁴x_block.

The running of the conformal factor with scale is:
⟨Ω⟩(μ) = 1 + λ/(2 log μ) + O(1/log² μ)
where μ = 1/Δτ_eff is the energy scale.

This logarithmic running matches the QED running of the electron wavefunction renormalization Z₂(μ). The effective coupling is:
α_eff(μ) = α₀ ⟨Ω⟩(μ)⁻² = α₀ (1 - λ/log μ + ...)

The beta function is:
β(α) = dα/d log μ = -α λ + O(α²)
Matching to the QED β-function β(α) = 2α²/3π gives λ = 2α/3π.

The continuum path integral with the running coupling is the standard QED path integral. The discrete prime gap path integral provides the UV completion of QED with a physical cutoff at the Planck scale (or the maximum prime gap).

The effective field theory for the Prime Electron is QED with a specific UV completion determined by the prime gap sequence. The prime gaps provide the fundamental discretization that regulates all UV divergences.

The higher-order corrections in the effective action are suppressed by powers of 1/log μ. The leading corrections come from the gap correlation function C(d_n, d_m) at non-zero separation.