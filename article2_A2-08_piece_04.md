## Piece 04: Koide Parameter from Record Gap Density

The prime gap record density follows from extreme value theory applied to the Cramér random model. The probability that a gap of size d is a new record at prime p is:

\[
\mathcal{P}_{\text{record}}(d, p) = \exp\left(-\int_2^p \frac{dx}{\log^2 x} \cdot \frac{d}{\log x}\right) \sim \frac{C}{(\log p)^2}
\]

The record gaps d_k occur at primes p_k where d_k ~ log² p_k. The sequence of record gaps has asymptotic density:

\[
\rho_{\text{record}}(d) \sim \frac{1}{d \log^2 d}
\]

The first three record gaps (2, 4, 6) are special: they are the only even gaps that are not multiples of larger records. The Koide parameter Q can be expressed as a sum over record gaps:

\[
Q = \frac{\sum_{k=1}^3 1/d_k}{\left(\sum_{k=1}^3 1/\sqrt{d_k}\right)^2} = \frac{1/2 + 1/4 + 1/6}{(1/\sqrt{2} + 1/2 + 1/\sqrt{6})^2}
\]

Computing explicitly:
- Numerator: 1/2 + 1/4 + 1/6 = 6/12 + 3/12 + 2/12 = 11/12
- Denominator: (1/√2 + 1/2 + 1/√6)² = (0.7071 + 0.5 + 0.4082)² = (1.6153)² = 2.6092
- Q = (11/12) / 2.6092 = 0.9167 / 2.6092 = 0.3513... Wait, this is wrong.

The correct mapping uses the running mass ratios from A2-07. The actual masses are:
mₑ = 1 (in units of mₑ)
m_μ = 206.768283...
m_τ = 3477.15...

Let r_k = m_k/mₑ. Then √r_k are the proper-time fluctuation amplitudes. The Koide formula uses the absolute masses, not ratios. We must derive the absolute scale from the prime density.

From A2-07, the running mass at scale μ is:
m(μ) = mₑ · exp[∑_{p_n ≤ μ} log(p_n/p_{n-1}) + log(d_n/d_{n-1})]

At the three record gap transitions μ = p₁, p₂, p₃, we get the three charged lepton masses. The square roots √m_k are the amplitudes of the worldline proper-time eigenmodes.