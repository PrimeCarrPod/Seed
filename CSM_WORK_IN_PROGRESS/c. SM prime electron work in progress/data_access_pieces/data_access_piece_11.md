# DATA ACCESS: PrimeBookOne Tile Index — Piece 11

## 10. USAGE IN 360-FILE RESEARCH PROGRAM

### 10.1 Data Flow for Each Article

```
1. Identify required tile ranges (from Article-Tile mapping)
2. Download tiles via raw URLs (batch with rate limiting)
3. Extract and parse uint8 arrays
4. Concatenate into continuous gap sequence
5. Apply physics mapping (κ, τ_n, U(τ), observables)
6. Generate article-specific outputs (tables, plots, derivations)
7. Cite exact tile ranges in each article section
```

### 10.2 Citation Format

In each of the 360 files, cite data as:

> **Data Source:** PrimeBookOne, `primebookone/{dir}/Tile{XX}.zip` through `Tile{YY}.zip`, gaps #{start}–#{end}, accessed 2026-08-20.

Example:
> **Data Source:** PrimeBookOne, `primebookone/0.0/Tile00.zip`–`Tile188.zip`, gaps #1–#94,500 (electron IR regime), accessed 2026-08-20.

### 10.3 Reproducibility Requirements

- All 360 files must specify exact tile ranges used
- Version pin: PrimeBookOne commit hash (when available)
- Parsing code versioned with each article
- Raw data not stored locally — fetched on demand