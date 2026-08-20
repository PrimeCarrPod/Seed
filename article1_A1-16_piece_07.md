# A1-16: Worldline Action Principle — Piece 07
## Continuum Limit and Effective Action

The discrete action S = Σₙ Lₙ must reproduce the standard relativistic action in the continuum limit where the average gap ⟨d⟩ → 0 while keeping proper time step Δτ = κ⟨d⟩ fixed. However, in our framework, the gaps are physical (prime gaps) and cannot be scaled to zero. The continuum limit is instead an averaging limit: we consider coarse-grained proper time intervals containing many gaps, and define an effective action.

Define the coarse-grained proper time τ = κ p where p is the prime index (not the prime value). For a block of M consecutive gaps from n to n+M−1, the effective proper time is:
Δτ_eff = κ Σ_{k=n}^{n+M−1} d_k = κ (p_{n+M} − p_n)

The effective Lagrangian for this block is:
L_eff = (1/M) Σ_{k=n}^{n+M−1} L_k = (mₑc/2M) Σ_{k=n}^{n+M−1} d_k Ω_k η_μν vᵘ_k vᵛ_k

For M large enough that gap statistics are self-averaging, we replace d_k → ⟨d⟩ = log p_n, Ω_k → ⟨Ω⟩ = √(1 + λ ⟨C⟩), and v_k → v(τ). Then:
L_eff ≈ (mₑc/2) ⟨d⟩ ⟨Ω⟩ η_μν vᵘ vᵛ M = (mₑc/2) Δτ_eff ⟨Ω⟩ η_μν vᵘ vᵛ
Thus the effective action over the block is:
S_eff = Σ_blocks L_eff ≈ (mₑc/2) ∫ dτ ⟨Ω(τ)⟩ η_μν ẋᵘ ẋᵛ

The average conformal factor ⟨Ω⟩ depends on the scale (prime index p). From A1-14, the metric is g_μν = Ω²η_μν with Ω² = 1 + λ C(τ). The coarse-grained correlation function is:
⟨C⟩_M = (1/M) Σ_{k=n}^{n+M−1} C(d_k) ≈ (1/log p) + O(1/log² p)
by the prime number theorem. Thus ⟨Ω⟩ ≈ 1 + λ/(2 log p).

The running of the conformal factor with scale is:
d⟨Ω⟩/d log p = −λ/(2 log² p) + ...
This logarithmic running matches the QED running of the electron wavefunction renormalization Z₂.

The effective action in the continuum limit is:
S_eff = ∫ dτ [−mₑc √(−g_μν ẋᵘ ẋᵛ) + L_int]
where g_μν = ⟨Ω⟩² η_μν is the emergent metric, and L_int encodes the self-interaction vertices from Piece 05.

The beta function for the effective coupling α_eff = α₀ ⟨Ω⟩⁻² is:
β(α) = dα/d log p = −2α d⟨Ω⟩/d log p = αλ/log² p
At the electron scale (twin primes, p ∼ 3), this gives the correct QED β-function when λ is fixed by matching to α ≈ 1/137.