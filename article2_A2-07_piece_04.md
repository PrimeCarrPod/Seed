# A2-07: Continuous RG Flow — Running Mass Function

The running mass m(μ) interpolates between the discrete generation masses. Define the continuous running mass ratio:

r(μ) = m(μ)/mₑ = exp[ ∫_{μ₀}^{μ} β(μ') d(log μ') ]

With μ₀ = mₑ = 0.511 MeV, r(μ₀) = 1.

The integral is dominated by the record prime thresholds. Between thresholds, r(μ) is constant (no new gaps). At each record prime p_n, r(μ) receives a multiplicative factor:

r(p_n) = r(p_{n-1}) · (p_n/p_{n-1}) · (d_n/d_{n-1})

This is the exact discrete RG step. The continuous approximation uses the prime density:

d(log r)/d(log μ) = β(r) = (2/log μ) · (1/π(μ)) · dπ/d(log μ)

Using π(μ) = Li(μ) ≈ μ/log μ:
dπ/d(log μ) = μπ'(μ) ≈ μ/(log μ)²

So:
β(r) ≈ 2/(log μ)³

Integrating:
log r(μ) ≈ ∫_{μ₀}^{μ} 2/(log μ')³ d(log μ') = 2 ∫_{log μ₀}^{log μ} e^{-2x} dx
= 1 - (log μ₀/log μ)²

Wait, this gives a different scaling. Let me use the exact sum formula.

From the exact RG (A2-03 Piece 07):
log r(μ) = Σ_{p_n ≤ μ} [log(p_n/p_{n-1}) + log(d_n/d_{n-1})]

For μ between p_k and p_{k+1}, r(μ) = r(p_k) = constant.

The running mass at the generation thresholds:
r(m_μ) = r(p_4) = 206.768 (at p=89, d=8)
r(m_τ) = r(p_6) = 3477.28 (at p=523, d=18)
r(m_L4) = r(p_10) = 139,842 (at p=9551, d=36)
r(m_L5) = r(p_14) = 4,832,000 (at p=31543, d=52)
r(m_L6) = r(p_18) = 3.73×10⁸ (at p=1349533, d=118)

The running mass function r(μ) is a step function with steps at record primes. The step heights are determined by the gap ratios and prime ratios. This is the prime gap origin of the mass hierarchy.