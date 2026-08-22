# A3-03 Prime_Difference_Basis.md — Piece 02: Modular Decomposition and Tensor Structure

## 2.1 The Modular Basis Hierarchy

The 8-bit basis admits a natural hierarchy of modular decompositions corresponding to prime gap congruence classes. For each k = 1, 2, 3, 4, 5, 6, 7, 8, we define the projection onto the k-bit subspace:

```
πₖ: ℋ → ℋₖ,  ℋₖ = ℂ^{2ᵏ}
πₖ|d⟩ = |d mod 2ᵏ⟩
```

This yields a tower of subspaces:

```
ℋ₁ = ℂ² (parity: even/odd)  — d mod 2
ℋ₂ = ℂ⁴ (d mod 4)           — {0, 1, 2, 3}
ℋ₃ = ℂ⁸ (d mod 8)           — residues mod 8
ℋ₄ = ℂ¹⁶ (d mod 16)         — residues mod 16
ℋ₅ = ℂ³² (d mod 32)
ℋ₆ = ℂ⁶⁴ (d mod 64)
ℋ₇ = ℂ¹²⁸ (d mod 128)
ℋ₈ = ℂ²⁵⁶ = ℋ (full space)
```

## 2.2 Physical Interpretation of Each Level

| Level | Dimension | Modulus | Physical Meaning |
|-------|-----------|---------|------------------|
| ℋ₁ | 2 | 2 | Gap parity (all >2 even → |0⟩) |
| ℋ₂ | 4 | 4 | Gap mod 4: {0,2} → cousin/twin |
| ℋ₃ | 8 | 8 | Gap mod 8: finer correlation |
| ℋ₄ | 16 | 16 | Gap mod 16: constellation structure |
| ℋ₅ | 32 | 32 | 5-bit: extended correlations |
| ℋ₆ | 64 | 64 | 6-bit: PrimeBookOne tile index |
| ℋ₇ | 128 | 128 | 7-bit: half-byte boundary |
| ℋ₈ | 256 | 256 | Full 8-bit difference array |

## 2.3 Tensor Product Decompositions

The 256-dimensional space factors naturally:

```
ℋ = ℋ₁ ⊗ ℋ₇ = ℋ₂ ⊗ ℋ₆ = ℋ₃ ⊗ ℋ₅ = ℋ₄ ⊗ ℋ₄
```

Most physically relevant:

1. **ℋ = ℋ₄ ⊗ ℋ₄** (16 × 16): Two 4-bit "nibbles" — upper nibble (d >> 4), lower nibble (d & 0xF). Corresponds to gap magnitude class and residue class.

2. **ℋ = ℋ₂ ⊗ ℋ₆** (4 × 64): Parity/congruence mod 4 ⊗ 6-bit tile index. The 64 tiles of PrimeBookOne 0.0 directory map to ℋ₆.

3. **ℋ = ℋ₁ ⊗ ℋ₇** (2 × 128): Even/odd ⊗ 7-bit. Since all gaps > 2 are even, ℋ₁ is effectively |0⟩ for physical states.

## 2.4 Basis Transformation Matrices

The change of basis from computational basis {|d⟩} to modular tensor basis is a permutation matrix. For ℋ = ℋ₄ ⊗ ℋ₄:

```
|d⟩ = |d_high⟩ ⊗ |d_low⟩,  d_high = ⌊d/16⌋, d_low = d mod 16
```

For ℋ = ℋ₂ ⊗ ℋ₆:

```
|d⟩ = |d mod 4⟩ ⊗ |⌊d/4⌋⟩
```

These are exact isomorphisms preserving inner products.

## 2.5 Conditional Probability Structure

The joint distribution p(d_high, d_low) reveals prime gap correlations:

```
p(d_high, d_low) = p(d_high) · p(d_low | d_high)
```

From PrimeBookOne data:
- p(d_low | d_high) is nearly uniform for d_high > 0
- p(d_high) follows logarithmic decay: p(d_high) ∝ 1/(d_high + 1)
- Strong correlation: d ≡ 0 mod 6 ⟹ d_high even, d_low ∈ {0, 6, 12, 18, 24, 30}

## 2.6 Piece 02 Summary

- Modular tower ℋ₁ ⊂ ℋ₂ ⊂ ... ⊂ ℋ₈ = ℋ
- Tensor decompositions: ℋ₄⊗ℋ₄, ℋ₂⊗ℋ₆, ℋ₁⊗ℋ₇
- Physical meaning: parity, congruence classes, tile indices
- Conditional probabilities reveal gap correlation structure
- Foundation for entanglement analysis in A3-05

**References**: A3-01 (Hilbert Space), A3-05 (Entanglement From Gap Correlations), PrimeBookOne Tile Index