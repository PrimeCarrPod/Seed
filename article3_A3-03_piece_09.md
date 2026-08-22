# A3-03 Prime_Difference_Basis.md — Piece 09: Basis Transformations and Change of Basis Matrices

## 9.1 Complete Set of Basis Transformations

The prime difference basis {|d⟩} is related to other physically relevant bases by unitary transformations. We catalog the complete set.

### 9.1.1 Computational Basis → Fourier Basis
```
F_{dk} = (1/√256) e^{2πi d k / 256},  d,k ∈ {0,...,255}
```
Properties: F⁴ = I, F† = F³, det(F) = i^{128} = 1. This is the DFT matrix.

### 9.1.2 Computational Basis → Walsh-Hadamard Basis
```
H_{dw} = (1/√256) (-1)^{w·d},  w,d ∈ {0,1}⁸
```
where w·d = Σ_i w_i d_i (mod 2). H = H† = H⁻¹, H² = I. This is the 8-qubit Hadamard transform.

### 9.1.3 Computational Basis → Modular Tensor Basis
For ℋ = ℋ₄ ⊗ ℋ₄:
```
U_{(d_H,d_L), d} = δ_{d_H, ⌊d/16⌋} δ_{d_L, d mod 16}
```
For ℋ = ℋ₂ ⊗ ℋ₆:
```
U_{(d₂,d₆), d} = δ_{d₂, d mod 4} δ_{d₆, ⌊d/4⌋}
```
These are permutation matrices (exact, no phases).

### 9.1.4 Computational Basis → Bit Basis
```
U_{(d₇...d₀), d} = δ_{d, Σ_i d_i 2ⁱ}
```
Also a permutation matrix (bit-reversal permutation for standard ordering).

## 9.2 Transformation Between Fourier and Walsh-Hadamard

The two most important spectral bases are related by:
```
H = F · D · F
```
where D is a diagonal matrix with entries D_{kk} = i^{wt(k)} (wt = Hamming weight). More precisely, the relationship involves the Gauss sum:
```
G(a) = Σ_{x=0}^{255} e^{2πi a x² / 256}
```

## 9.3 Prime-Weighted Basis Transformations

The prime-weighted basis {|d⟩_p = √p(d) |d⟩} is not orthonormal. The transformation from standard to prime-weighted is:
```
W_{dd'} = √p(d) δ_{dd'}
```
This is a positive diagonal matrix. The Gram matrix is:
```
G = W² = diag(p(0), p(1), ..., p(255))
```

The orthonormalized prime-weighted basis (Löwdin orthogonalization):
```
|d⟩_p^orth = G^{-1/4} |d⟩_p = p(d)^{1/4} |d⟩
```
with inner product ⟨d|d'⟩_p^orth = δ_{dd'}.

## 9.4 Conditional Basis for Subsystems

For the nibble decomposition ℋ = ℋ_H ⊗ ℋ_L, the conditional basis on ℋ_L given high nibble d_H:

```
|d_L⟩_{d_H} = (1/√p(d_H)) Σ_{d_L} √p(16·d_H + d_L) |d_H, d_L⟩
```

The transformation matrix from standard basis to conditional basis:
```
V_{(d_H,d_L), (d'_H,d'_L)} = δ_{d_H,d'_H} · √(p(16·d_H + d_L) / p(d_H))
```

This is block-diagonal with 16 blocks of size 16×16.

## 9.5 Correlation Matrix Diagonalization

From Piece 04, the correlation operator C = Σ λ_α |v_α⟩⟨v_α|. The transformation to the eigenbasis:
```
U_{dα} = ⟨d|v_α⟩
```
where |v_α⟩ are the eigenvectors of C. This is the Principal Component Analysis (PCA) transformation. The first 10 components capture >95% of correlation variance.

## 9.6 Tile-to-Basis Transformation

From Piece 07, each tile T defines a conditional distribution p_T(d). The transformation from tile-index basis to gap basis:
```
T_{dT} = √p_T(d)  (not unitary, rectangular 256×64)
```
The Moore-Penrose pseudoinverse gives the optimal reconstruction:
```
T⁺_{Td} = p_T(d) / Σ_{d'} p_T(d')²
```

## 9.7 Summary of Transformation Matrices

| Transformation | Matrix | Type | Size | Application |
|----------------|--------|------|------|-------------|
| Comp → Fourier | F | Unitary | 256×256 | Periodicity analysis |
| Comp → Walsh-Hadamard | H | Unitary, Hermitian | 256×256 | Bitwise correlations |
| Comp → Nibble Tensor | U_nib | Permutation | 256×256 | Subsystem decomposition |
| Comp → Tile Tensor | U_tile | Permutation | 256×256 | PrimeBookOne mapping |
| Comp → Bit Tensor | U_bit | Permutation | 256×256 | Qubit decomposition |
| Comp → Prime-Weighted | W | Diagonal | 256×256 | Physical state prep |
| Comp → Correlation Eigenbasis | U_pca | Orthogonal | 256×256 | Dimensional reduction |
| Tile → Gap | T | Rectangular | 256×64 | Tile statistics |

All unitary transformations preserve the inner product and can be implemented as quantum circuits on 8 qubits.

## 9.8 Circuit Complexity

- F (QFT): O(8²) = 64 gates (Hadamard + controlled phases)
- H (Hadamard): 8 gates (parallel H on all qubits)
- U_nib, U_tile, U_bit: 0 gates (relabeling)
- W: 8 single-qubit rotations (diagonal)
- U_pca: O(256²) classically, not efficient quantumly

## 9.9 Piece 09 Summary

- 8 key basis transformations catalogued
- Fourier (F) and Walsh-Hadamard (H) for spectral analysis
- Tensor decompositions via permutation matrices
- Prime-weighted basis for physical states
- PCA basis for correlation analysis
- Tile-to-gap rectangular transformation
- All unitary transforms efficient on 8 qubits

**References**: A3-01 (Hilbert Space), A3-04 (Unitarity), A3-05 (Entanglement), A3-10 (Quantum Computing), PrimeBookOne Tile Index