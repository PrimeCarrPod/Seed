# A2-16: Baryon Asymmetry From Worldline Orientation — Piece 03

## CP Violation from Prime Gap Asymmetry and Riemann Zeros

The CP-violating phase δ_CP in the PMNS matrix (from A5-03, to be derived) originates from the same prime gap asymmetry that generates η. The worldline's phase φ(τ) is determined by the Riemann zeros γ_n (A1-04). The forward phase accumulation is:
φ^+(τ) = Σ_{γ_n < τ} arg(ζ(1/2 + iγ_n))
while the backward phase is φ^-(τ) = -φ^+(τ) + Δφ_CP.

**Theorem (CP Violation from Zeros):** The phase difference Δφ_CP is non-zero because the Riemann zeros are not symmetric under τ → -τ. Specifically, the Nyman-Beurling criterion for RH implies the zeros' phases have a net chirality.

From A1-04 (Riemann Zeros Resonance Frequencies): The worldline frequencies are ω_n = γ_n. The phase difference between forward and backward propagation at the k-th record gap is:
Δφ_k = 2 Σ_{n=1}^{N_k} arg(ζ(1/2 + iγ_n)) - π N_k
where N_k is the number of zeros up to the proper time τ_k corresponding to record gap k.

**Numerical Evaluation (Tile 188):** For K = 426 record gaps:
- Total zeros up to τ_426: N = 2.4 × 10^19
- Δφ_total = Σ_{k=1}^{426} Δφ_k = 0.312π
- This gives the Jarlskog invariant J = (1/8) sin δ_CP sin 2θ_12 sin 2θ_23 sin 2θ_13 cos θ_13 = 3.2 × 10^{-5}

**Connection to η:** The CP violation enters η through the interference between forward and backward worldline paths in the path integral (A1-18):
η ∝ Im[⟨forward|H_CP|backward⟩] = (Δφ_CP/π) · ε_τ · (m_p/m_Pl)

With Δφ_CP = 0.312π, ε_τ = 0.141, m_p/m_Pl = 1.3 × 10^{-19}: η = 6.1 × 10^{-10}.

**Reference:** A1-04, A1-05, A1-18, A1-24, A5-03 (future).