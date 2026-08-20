# DATA ACCESS: PrimeBookOne Tile Index — Piece 05

## 4. FULL SCALE STATISTICS

### 4.1 Per-Directory Summary

| Dir | Tiles | Gaps | Physics | Prime Index Range |
|-----|-------|------|---------|-------------------|
| 0.0 | 189 | 94,500 | Electron IR | p_1 – p_94,501 |
| 0.1 | 189 | 94,500 | Muon threshold | p_94,501 – p_189,001 |
| 1.0 | 189 | 94,500 | Tau threshold | p_189,001 – p_283,501 |
| 2.0 | 189 | 94,500 | Electroweak | p_283,501 – p_378,001 |
| 2.1 | 189 | 94,500 | Higgs | p_378,001 – p_472,501 |
| 3.0 | 189 | 94,500 | UV/GUT | p_472,501 – p_567,001 |
| **Total** | **1,134** | **567,000** | **Published (6 dirs)** | **p_1 – p_567,001** |

### 4.2 Full PrimeBookOne Corpus (3500 Books)

Published total: **3,670,016,000** differences (3500 books × 2^20)

Books per directory: ~583 books (3500/6)

Gaps per book: 1,048,576 = 2^20

Tiles per book: 1,048,576 / 500 = 2097.15 → 2098 tiles (last partial)

### 4.3 Book Structure

Each book = 1,048,576 consecutive gaps = one worldline segment.

Book n covers gaps: d_{(n-1)·2^20 + 1} through d_{n·2^20}

Book 1: Electron ground state (directory 0.0 tiles)  
Book 583: End of directory 0.0  
Book 584: Start of directory 0.1 (muon threshold)  
...  
Book 3500: UV completion (directory 3.0)