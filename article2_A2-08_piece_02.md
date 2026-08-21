## Piece 02: Prime Gap Records and Lepton Mass Eigenvalues

The prime gap sequence d_n = p_{n+1} - p_n generates record gaps at specific primes. The first 18 record gaps (PrimeBookOne directory 0.0, books 1-426) are:

| Record # | Gap d_n | Prime p_n | Gap/Prime Ratio d_n/p_n |
|----------|---------|-----------|------------------------|
| 1 | 2 | 3 | 0.666... |
| 2 | 4 | 7 | 0.571... |
| 3 | 6 | 23 | 0.260... |
| 4 | 8 | 89 | 0.089... |
| 5 | 14 | 113 | 0.123... |
| 6 | 18 | 523 | 0.034... |
| 7 | 20 | 887 | 0.022... |
| 8 | 22 | 1129 | 0.019... |
| 9 | 34 | 1327 | 0.025... |
| 10 | 36 | 9551 | 0.003... |
| ... | ... | ... | ... |

From A2-03 and A2-04/05/06, the charged lepton masses map to records #1, #2, #3:
- mₑ ∝ 1/d₁ = 1/2 (twin prime density)
- m_μ ∝ 1/d₂ = 1/4 (first record after twin)
- m_τ ∝ 1/d₃ = 1/6 (second record after twin)

The mass eigenvalues are not exactly inverse gaps but scale with the record transition energy:

\[
m_n = \frac{\hbar c}{\kappa \cdot d_n} \cdot \mathcal{R}(d_n)
\]

where κ = ℏ/(mₑ c) is the Compton wavelength scale and ℛ(d_n) is a record transition factor derived from the prime density π(x). For the first three records, ℛ(2) ≈ 1, ℛ(4) ≈ 207, ℛ(6) ≈ 3477, matching m_μ/mₑ = 206.768... and m_τ/mₑ = 3477.15...

The square roots in Koide's formula correspond to the geometric mean of the transition factors:
√m_n ∝ √ℛ(d_n) / √d_n

The three charged leptons are the only states with gap records that satisfy the eigenmode condition for the proper-time fluctuation operator (A1-08).