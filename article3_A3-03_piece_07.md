# A3-03 Prime_Difference_Basis.md — Piece 07: PrimeBookOne Tile Mapping to Basis States

## 7.1 PrimeBookOne Directory Structure

PrimeBookOne organizes 3.67 billion prime differences into a hierarchical directory structure:

```
PrimeBookOne/
├── 0.0/          # 189 tiles × 500 differences = 94,500 differences (base)
├── 1.0/          # 3,500 books × 2²⁰ differences = 3.67 billion (full)
├── 2.0/          # Extended precision
├── 3.0/          # UV completion (d_max = 1476)
```

Each tile in 0.0 contains 500 consecutive prime gaps. 189 tiles cover gaps up to d=1476.

## 7.2 Tile-to-Basis Mapping

The 64-tile subset of 0.0 (tiles 00–63) maps naturally to the ℋ₆ factor in ℋ = ℋ₂ ⊗ ℋ₆:

```
Tile T ∈ {0, 1, ..., 63}  ↔  |T⟩ ∈ ℋ₆
```

Each tile contains 500 gaps. The gap-to-basis mapping within a tile:

```
Gap index g ∈ {0, ..., 499} within Tile T
Global index n = 500·T + g
Gap dₙ → basis state |dₙ mod 256⟩
```

The conditional distribution within tile T:

```
p_T(d) = (1/500) Σ_{g=0}^{499} δ(d_{500T+g} mod 256, d)
```

## 7.3 Tile Statistics and Basis Population

### 7.3.1 Tile Population Variance
From PrimeBookOne 0.0 data:
- Early tiles (T=0–10): Dominated by small gaps (d=2, 4, 6, 8, 10, 12, 14)
- Middle tiles (T=10–50): Gaps distributed up to ~100
- Late tiles (T=50–63): Gaps up to 256, sparse population

### 7.3.2 Basis State Coverage per Tile
Each tile covers a subset of the 256 basis states. The union over all 64 tiles covers 100% of states with d ≤ 256. The intersection (states present in all tiles) is {2, 4, 6, 8, 10, 12, 14} — the small gap core.

### 7.3.3 Tile Entropy
Shannon entropy of tile T distribution:
```
H(T) = -Σ_d p_T(d) log₂ p_T(d)
```
- H(0) ≈ 2.1 bits (concentrated on small gaps)
- H(32) ≈ 5.8 bits (broad distribution)
- H(63) ≈ 4.2 bits (sparse large gaps)

## 7.4 Directory Version Flow as RG Flow

The directory versions 0.0 → 1.0 → 2.0 → 3.0 correspond to renormalization group flow in the basis:

### 7.4.1 Version 0.0 → 1.0: Coarse-Graining
1.0 contains 3,500 books = 3,500 × 2²⁰ differences. Each 0.0 tile expands to ~18,500 books.
The basis states get reweighted:
```
p^{(1.0)}(d) = Σ_T w_T p_T(d)
```
where w_T are book weights. This is a block-spin transformation on the gap sequence.

### 7.4.2 Version 1.0 → 2.0: Precision Extension
2.0 extends gap precision beyond 8 bits (to 16+ bits), embedding ℋ₂₅₆ → ℋ₆₅₅₃₆.

### 7.4.3 Version 2.0 → 3.0: UV Completion
3.0 includes all gaps up to d_max = 1476 (11 bits), completing the Hilbert space to ℋ₂⁰⁴⁸ = ℂ²⁰⁴⁸. The 8-bit space ℋ₂₅₆ is the IR effective theory.

## 7.5 Tile Correlations and Basis Entanglement

Adjacent tiles exhibit gap correlations:
```
C_{T,T+1}(d, d') = p_{T,T+1}(d, d') - p_T(d) p_{T+1}(d')
```

This induces entanglement between tile subsystems in the full state. The tile-to-tile correlation matrix has the same mod 6 structure as the gap correlation matrix (Piece 04).

## 7.6 Basis State Book-Keeping

Each of the 3,500 books in 1.0 corresponds to a worldline segment (A1-10). The book-to-basis mapping:

```
Book B ∈ {1, ..., 3500} → density matrix ρ_B on ℋ₂₅₆
ρ_B = (1/N_B) Σ_{n ∈ Book B} |dₙ mod 256⟩⟨dₙ mod 256|
```

The 3,500 density matrices {ρ_B} sample the space of quantum states on ℋ₂₅₆, providing a "quantum tomography" of the prime difference distribution.

## 7.7 Piece 07 Summary

- 64 tiles of 0.0 map to ℋ₆ factor (64 basis states)
- Each tile: 500 gaps → conditional distribution p_T(d) on 256 basis states
- Tile entropy varies: 2.1–5.8 bits
- Directory versions = RG flow on basis populations
- 3,500 books → 3,500 density matrices sampling ℋ₂₅₆ state space
- Tile correlations → inter-tile entanglement

**References**: A1-10 (Worldline Segment Books), A2-08 (Koide Formula), A3-04 (Unitarity), A3-07 (Quantum Information Prime Book), PrimeBookOne Tile Index