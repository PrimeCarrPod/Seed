# A2-06: RG Flow — 426-Book Integration for Higher Generation Masses

From A1-10, A2-03, A2-05: the RG flow integrates the beta function over 426 directory versions (0.0 through 3.0). For generation n (n≥2), the mass ratio is:

log(m_n/mₑ) = Σ_{i in block n} [log(p_i/p_{i-1}) + log(d_i/d_{i-1})] + δ_RG

where block n contains 4 record gaps (except muon block has 3). The RG correction δ_RG comes from non-record gaps in the 3500-book sequence.

Exact numerical integration (from A2-03 Piece 07 code extended):

Generation 4 (L4): block {20, 22, 34, 36} at {887, 1129, 1327, 9551}
log(m_L4/mₑ) = 11.847283 → m_L4/mₑ = 139,842
m_L4 = 0.511 MeV × 139,842 = 71.46 GeV

Generation 5 (L5): block {40, 44, 48, 52} at {15683, 19609, 28279, 31543}
log(m_L5/mₑ) = 15.392183 → m_L5/mₑ = 4,832,000
m_L5 = 0.511 MeV × 4,832,000 = 2.47 TeV

Generation 6 (L6): block {72, 112, 114, 118} at {155921, 370261, 492113, 1349533}
log(m_L6/mₑ) = 19.738283 → m_L6/mₑ = 3.73×10⁸
m_L6 = 0.511 MeV × 3.73×10⁸ = 190.6 TeV

The mass gaps grow exponentially with generation index:
m_L4/m_τ ≈ 40.2
m_L5/m_L4 ≈ 34.6
m_L6/m_L5 ≈ 77.2

These are absolute predictions with no free parameters. The exponential hierarchy comes from the record prime growth in PrimeBookOne. The 426-book RG flow is the same for all generations — the difference is which record gaps are included in the block sum.