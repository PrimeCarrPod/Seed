# A2-05: Record Gaps 6, 8, 14, 18 — Data from PrimeBookOne Tiles 00-06

The tau cluster draws from record gaps #3 through #6 in the PrimeBookOne sequence (Tile00 through Tile05). From DATA_ACCESS_PrimeBookOne_Tile_Index.md:

| Record # | Gap d | Prime p | Tile | Book | BPS Charge | Cumulative Σd |
|----------|-------|---------|------|------|------------|---------------|
| 1        | 2     | 3       | 00   | 0    | 1          | 2             |
| 2        | 4     | 7       | 00   | 0    | 2          | 6             |
| 3        | 6     | 23      | 01   | 1    | 3          | 12            |
| 4        | 8     | 89      | 02   | 2    | 4          | 20            |
| 5        | 14    | 113     | 02   | 2    | 5          | 34            |
| 6        | 18    | 523     | 03   | 3    | 6          | 52            |

The muon used gaps {4, 6, 8} (records #2, #3, #4). The tau uses gaps {6, 8, 14, 18} (records #3, #4, #5, #6) — note the overlap at gaps 6 and 8, reflecting the hierarchical structure: each generation includes the previous generation's gaps plus new record gaps.

Gap densities from PrimeBookOne 0.0 directory (3500 books × 2^20 differences):
- ρ(d=6) = 1/23 = 0.04348 per prime
- ρ(d=8) = 1/89 = 0.01124 per prime
- ρ(d=14) = 1/113 = 0.00885 per prime
- ρ(d=18) = 1/523 = 0.00191 per prime

The BPS charges (from A1-28) are the record indices: Q_μ = 2,3,4; Q_τ = 3,4,5,6. The tau has four record gaps in its cluster, the muon three. This increase from 3 to 4 record gaps mirrors the generational structure.

Each record gap d_i corresponds to a worldline segment with proper-time tick Δτ_i = κ·d_i. The tau worldline visits these four segments in sequence, accumulating total proper time Δτ_τ = κ·(6+8+14+18) = 46κ. Compare: muon Δτ_μ = κ·(4+6+8) = 18κ. The ratio 46/18 = 2.555... is the bare proper-time ratio before RG dressing.