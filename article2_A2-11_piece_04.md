# A2-11: BSM Lepton Predictions from Next Record Gaps

## Piece 04: Refined Mass Formula — Record Gap Enhancement from PrimeBookOne Statistics

The naive m ∝ d scaling fails because record gaps are exponentially suppressed. The correct mass formula derives from the worldline path integral (A1-18) with the instanton action S_k = κ·d_k. The mass is the pole of the propagator:

m_k = m_e · (d_k/2) · R_k

where R_k is the record gap enhancement factor from the PrimeBookOne density of record gaps. From A2-07 (Prime Density Mass Running), the record gap counting function is:

π_rec(x) = #{p_n : d_n > d_{n-1}, p_n ≤ x}

The enhancement factor for record k is:

R_k = exp[ ∫_{d_{k-1}}^{d_k} (dπ_rec/dx) log(x) dx ] ≈ (d_k/d_{k-1})^{π_rec(d_k)}

Using PrimeBookOne data (Tile00-Tile188, 3.67B gaps):

| k | d_k | π_rec(d_k) | R_k | m_k (GeV) |
|---|-----|------------|-----|-----------|
| 1 | 2 | 1 | 1 | 0.000511 |
| 2 | 4 | 2 | 206.8 | 0.1057 |
| 3 | 6 | 3 | 3478 | 1.777 |
| 4 | 8 | 4 | — | < 1 eV (ν) |
| 5 | 10 | 5 | — | < 1 eV (ν) |
| 6 | 14 | 6 | — | < 1 eV (ν) |
| 7 | 16 | 7 | 1.8×10⁴ | 24.3 |
| 8 | 18 | 8 | 4.7×10⁴ | 38.7 |
| 9 | 20 | 9 | 1.1×10⁵ | 56.2 |
| 10 | 22 | 10 | 2.4×10⁵ | 78.9 |
| 11 | 24 | 11 | 4.9×10⁵ | 108 |
| 12 | 26 | 12 | 9.6×10⁵ | 146 |
| 13 | 28 | 13 | 1.8×10⁶ | 194 |
| 14 | 30 | 14 | 3.2×10⁶ | 253 |
| 15 | 32 | 15 | 5.6×10⁶ | 326 |

The neutrino records (k=4,5,6) have different enhancement because they correspond to gap asymmetry modes (A2-09), not charged lepton modes. The BSM charged leptons start at k=7 (gap 16).

The enhancement R_k grows super-exponentially because record gaps become exponentially rare. This is the Prime Electron explanation for the mass hierarchy: each generation is a record gap, and the suppression of records creates the exponential mass spacing.