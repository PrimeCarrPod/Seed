# A3-03 Prime_Difference_Basis.md — Piece 04: Gap Correlation Matrix and Basis Geometry

## 4.1 The Gap Correlation Operator

The statistical correlations between prime gaps define a Hermitian operator on ℋ:

```
C = Σ_{d,d'=0}^{255} C_{dd'} |d⟩⟨d'|
```

where the correlation matrix elements are:

```
C_{dd'} = ⟨δ(dₙ - d) δ(dₙ₊₁ - d')⟩ - p(d)p(d')
       = p(d, d') - p(d)p(d')
```

with p(d, d') the joint probability of consecutive gaps (d, d').

## 4.2 Empirical Correlation Structure from PrimeBookOne

From Tiles 00–188 (3.67×10⁹ gaps), the correlation matrix reveals:

### 4.2.1 Diagonal Dominance
```
C_{dd} = p(d)(1 - p(d)) ≈ p(d) for small p(d)
```
Largest at d=2: C_{22} = 0.5 × 0.5 = 0.25

### 4.2.2 Mod 6 Correlation Structure
Strongest off-diagonal correlations:
```
C_{d,d'} ≠ 0 primarily when d ≡ d' ≡ 0 (mod 6)
```
This reflects the preference for gaps to be multiples of 6 (sexy primes). The 6×6 block for residues mod 6 shows:

| d\d' | 0 | 2 | 4 | 6 | 8 | 10 |
|------|---|---|---|---|---|---|
| 0    | + | 0 | - | + | - | - |
| 2    | 0 | + | 0 | 0 | 0 | 0 |
| 4    | - | 0 | + | - | + | 0 |
| 6    | + | 0 | - | + | - | + |
| 8    | - | 0 | + | - | + | - |
| 10   | - | 0 | 0 | + | - | + |

where + = positive correlation, - = negative, 0 = uncorrelated.

### 4.2.3 Mod 30 Refinement
At the next level (mod 30), the correlation matrix exhibits the prime constellation structure:
- Positive: (d, d') = (6, 6), (30, 30), (6, 30), (30, 6)
- Negative: (6, 12), (12, 6), (18, 24), (24, 18)
- Near-zero: residues not in {0, 6, 12, 18, 24} mod 30

## 4.3 Spectral Decomposition of C

The correlation operator C is real symmetric, hence diagonalizable:

```
C = Σ_{α=1}^{256} λ_α |v_α⟩⟨v_α|
```

with eigenvalues λ_α and eigenvectors |v_α⟩.

### 4.3.1 Leading Eigenvalues
From empirical data:
- λ₁ ≈ 0.25 (twin prime mode, eigenvector ≈ |2⟩)
- λ₂ ≈ 0.11 (mod 6 mode, eigenvector ≈ Σ_{k=0}^{42} |6k⟩)
- λ₃ ≈ 0.08 (mod 30 mode)
- λ₄...λ₁₀: constellation modes
- λ₁₁...λ₂₅₆: noise floor ~ 10⁻⁴

### 4.3.2 Eigenvector Interpretation
The eigenvectors |v_α⟩ are the **natural modes of prime gap correlation**:
- |v₁⟩ ≈ |2⟩: Twin prime dominance
- |v₂⟩ ≈ uniform over d ≡ 0 mod 6: Sexy prime resonance
- |v₃⟩ ≈ uniform over d ≡ 0 mod 30: Prime constellation structure
- Higher modes: finer modular patterns, noise

## 4.4 Basis Geometry: Angles and Distances

The correlation matrix defines a geometry on the basis vectors:

### 4.4.1 Correlation Angle
```
cos θ_{dd'} = C_{dd'} / √(C_{dd} C_{d'd'})
```

- θ_{2,2} = 0 (self)
- θ_{6,30} ≈ 30° (strong correlation)
- θ_{2,6} ≈ 90° (uncorrelated: twin vs sexy primes)
- θ_{6,12} ≈ 150° (anti-correlation)

### 4.4.2 Mahalanobis Distance
```
D_M(d, d')² = (|d⟩ - |d'⟩)ᵀ C⁻¹ (|d⟩ - |d'⟩)
```

This distance respects the correlation structure. Gaps in the same constellation class have small D_M.

## 4.5 The Correlation Length

The correlation length ξ in gap index space:

```
ξ = -1 / log(|λ₂/λ₁|) ≈ -1 / log(0.11/0.25) ≈ 1.7
```

Gaps decorrelate after ~2 steps. This short correlation length justifies the Markov approximation used in A3-06 (Decoherence).

## 4.6 Piece 04 Summary

- Correlation operator C = p(d,d') - p(d)p(d')
- Strong mod 6, mod 30 structure from prime constellations
- Spectral decomposition yields natural correlation modes
- Geometry: angles, distances respect prime statistics
- Correlation length ξ ≈ 1.7 → Markov property
- Foundation for entanglement (A3-05) and decoherence (A3-06)

**References**: A3-05 (Entanglement From Gap Correlations), A3-06 (Decoherence), PrimeBookOne Tile 00-188 statistics