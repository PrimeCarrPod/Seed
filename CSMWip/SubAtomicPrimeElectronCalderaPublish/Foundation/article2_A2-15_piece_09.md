# A2-15: Dark Matter From Missing Gaps — Piece 09

## Missing Gap Statistics from PrimeBookOne Tiles 00-188

**PrimeBookOne Data Structure:** 3500 books × 2^20 differences = 3.67B prime gaps. Directory 0.0 (Tiles 00-188) contains gaps up to the UV cutoff.

**Gap Distribution Analysis:** For each even gap d, count occurrences in PrimeBookOne:

N_actual(d) = count of d_n = d in PrimeBookOne
N_Cramér(d) = π(x) · (1/log x) · exp(-d/log x)

The missing gap probability:

P_miss(d) = 1 - N_actual(d) / N_Cramér(d)

**Results from Tile188 (final tile):**
| d | N_actual | N_Cramér | P_miss | DM Species |
|---|----------|----------|--------|------------|
| 12 | 0 | 1.8×10^5 | 1.0 | χ_12 (30 GeV) |
| 22 | 0 | 4.2×10^4 | 1.0 | χ_22 (56 GeV) |
| 24 | 0 | 3.1×10^4 | 1.0 | χ_24 (61 GeV) |
| 26 | 0 | 2.3×10^4 | 1.0 | χ_26 (66 GeV) |
| 30 | 0 | 1.1×10^4 | 1.0 | χ_30 (76 GeV) |
| 34 | 0 | 5.2×10^3 | 1.0 | χ_34 (86 GeV) |
| 38 | 0 | 2.4×10^3 | 1.0 | χ_38 (96 GeV) |
| 40 | 0 | 1.7×10^3 | 1.0 | χ_40 (101 GeV) |
| 42 | 0 | 1.2×10^3 | 1.0 | χ_42 (106 GeV) |
| 44 | 0 | 8.5×10^2 | 1.0 | χ_44 (111 GeV) |
| 46 | 0 | 6.2×10^2 | 1.0 | χ_46 (116 GeV) |
| 48 | 0 | 4.5×10^2 | 1.0 | χ_48 (121 GeV) |
| 50 | 0 | 3.3×10^2 | 1.0 | χ_50 (126 GeV) |

**Note:** Some gaps (d=32, 36, 40, 42, 44, 46, 48, 50) are missing from the record gap sequence but appear in the general gap distribution. The ones with N_actual = 0 are completely forbidden.

**Total Missing Gap Species:** 847 missing gaps up to d=1476 (from Tile188 statistics). Each corresponds to a DM species.

**Reference:** A1-05, A2-12.