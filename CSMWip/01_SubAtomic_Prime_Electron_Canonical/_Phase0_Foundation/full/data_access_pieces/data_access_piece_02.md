# DATA ACCESS: PrimeBookOne Tile Index — Piece 02

## 1.3 Tile Naming Convention

Tiles named: `Tile{XX}.zip` where XX = 00, 01, 02, ..., 188 (189 tiles per directory).

Each zip contains exactly 500 prime gaps encoded as 8-bit unsigned integers (0-255).

File size per tile: 500 bytes (raw) + zip overhead.

### 1.4 Directory 0.0 — Electron Ground State (IR QED)

**Tile range:** Tile00.zip through Tile188.zip (189 tiles)  
**Total differences:** 189 × 500 = 94,500 prime gaps  
**Physics scale:** Electron, IR QED, fine structure regime  
**Prime index range:** Approximately p_1 through p_94501  
**Gap values:** Dominated by small gaps (2, 4, 6, 8) — twin primes abundant

### 1.5 Remote Access URLs

Base URL: `https://github.com/PrimeBookOne/PrimeBookOne.github.io/raw/main/primebookone/`

Tile URL pattern: `{base}{dir}/Tile{XX}.zip`

Examples:
- `https://github.com/PrimeBookOne/PrimeBookOne.github.io/raw/main/primebookone/0.0/Tile00.zip`
- `https://github.com/PrimeBookOne/PrimeBookOne.github.io/raw/main/primebookone/0.0/Tile188.zip`
- `https://github.com/PrimeBookOne/PrimeBookOne.github.io/raw/main/primebookone/3.0/Tile00.zip`