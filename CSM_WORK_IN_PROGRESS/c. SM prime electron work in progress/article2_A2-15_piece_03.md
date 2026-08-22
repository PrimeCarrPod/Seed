# A2-15: Dark Matter From Missing Gaps — Piece 03

## DM Mass Spectrum from Missing Gap Values

Each missing gap d_miss corresponds to a dark matter particle with mass:

m_DM(d_miss) = m_e · (d_miss / 2) · R(d_miss)

where R(d) is the running factor from A2-07. The missing gaps are those even d that Cramér predicts with high probability but never appear as record gaps.

**Explicit Missing Gaps (from PrimeBookOne Tile188):**
- d=12: Cramér P(12) ~ 0.05 at x=10^6, but never a record gap
- d=22: Cramér P(22) ~ 0.008, not a record
- d=24: Cramér P(24) ~ 0.006, not a record
- d=26: Cramér P(26) ~ 0.005, not a record
- d=30: Cramér P(30) ~ 0.003, not a record (record is 32)
- d=32: IS a record gap (k=16)
- d=34: Cramér P(34) ~ 0.002, not a record
- ... etc.

**Mass Calculation:** For each missing gap d, compute m(d). The lightest missing gaps give the lightest DM:

m_DM(12) = 0.511 MeV × (12/2) × R(12) ≈ 0.511 × 6 × 10^4 ≈ 30 GeV
m_DM(22) = 0.511 MeV × 11 × R(22) ≈ 56 GeV
m_DM(24) = 0.511 × 12 × R(24) ≈ 61 GeV
m_DM(26) = 0.511 × 13 × R(26) ≈ 66 GeV

The running factor R(d) increases with d. For d ~ 100, m_DM ~ TeV scale. For d ~ 1000, m_DM ~ 10^5 GeV.

**DM Multi-Component Spectrum:** The missing gaps form a tower of DM particles with masses from ~10 GeV to ~M_GUT. The number density of each species is determined by the Cramér probability deficit:

n_d ∝ P_Cramér(d) - P_record(d)

**Reference:** A2-07, A2-12.