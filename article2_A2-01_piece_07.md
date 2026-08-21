# A2-01 Gap_To_Energy_Mapping.md — Piece 07
## Prime Density π(x) → Mass Renormalization Group Running

The prime number theorem π(x) ~ x/log x governs the RG running of masses from gap statistics.

**Gap distribution and π(x).** The number of gaps ≤ d is related to π(x). The average gap at x is log x. The gap density ρ(d) ~ 1/d² (A1-08, A1-40).

**RG scale from prime index.** The RG scale μ is identified with the prime index: μ_n = p_n. The gap at scale μ is d_n = p_{n+1} - p_n ~ log μ.

**Mass running.** The effective mass at scale μ is:
m(μ) = mₑ · (κ/κ(μ)) = mₑ · (Σ_{d≤d_max} 1/d) / (Σ_{d≤d_max(μ)} 1/d)
where d_max(μ) is the maximum gap at scale μ.

**Running from π(x).** The cumulative gap sum:
Σ_{p≤μ} (p_{n+1}-p_n)⁻¹ ≈ ∫₂^μ dx/(x log² x) ~ 1/log μ
Thus m(μ) ~ mₑ · log μ / log μₑ

**Connection to QFT running.** In QFT, mass runs as m(μ) = m(μ₀) · (α(μ)/α(μ₀))^{γ_m}. The prime gap running gives a logarithmic behavior similar to QCD or QED.

**PrimeBookOne RG data.** Each book b gives μ_b = p_b. The mass at that scale is computed from the gaps in that book. The 3500 books give the full running trajectory.

**Fixed point at d=16.** The self-dual scale d=16 (A1-36) is a fixed point of the mass running. At μ ~ p where average gap = 16, the mass stops running. This is the Planck scale in the emergent gravity picture (A1-37).

(End of file - 35 lines)