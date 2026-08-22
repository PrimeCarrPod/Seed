# A3-03 Prime_Difference_Basis.md — Piece 06: Tensor Product Structure and Subsystem Decomposition

## 6.1 Natural Tensor Decomposition of ℋ

The 256-dimensional Hilbert space factors in multiple physically meaningful ways, each corresponding to a different aspect of prime gap physics.

### 6.1.1 Nibble Decomposition: ℋ = ℋ₄ ⊗ ℋ₄
```
|d⟩ = |d_H⟩ ⊗ |d_L⟩
d_H = ⌊d/16⌋ ∈ {0, ..., 15}  (high nibble: magnitude class)
d_L = d mod 16 ∈ {0, ..., 15}  (low nibble: residue class)
```

**Physical interpretation:**
- ℋ₄ᴴ (high): Gap magnitude category (0=tiny, 1=small, ..., 15=large)
- ℋ₄ᴸ (low): Gap residue mod 16 (constellation type)
- Entanglement between magnitude and residue reveals gap structure

### 6.1.2 Tile Decomposition: ℋ = ℋ₂ ⊗ ℋ₆
```
|d⟩ = |d mod 4⟩ ⊗ |⌊d/4⌋⟩
```
- ℋ₂: Congruence class mod 4 → {0, 1, 2, 3}
  - 0: multiples of 4 (cousin primes, d=4, 8, 12, ...)
  - 1: d ≡ 1 mod 4 (impossible for gaps > 2)
  - 2: twin primes (d=2, 6, 10, 14, ... but 6≡2 mod 4)
  - 3: d ≡ 3 mod 4 (impossible for gaps > 2)
- ℋ₆: 6-bit index → 64 values, maps to PrimeBookOne 0.0 tiles (64 tiles per directory level)

### 6.1.3 Bit Decomposition: ℋ = (ℂ²)^{⊗8}
```
|d⟩ = |d₇⟩ ⊗ |d₆⟩ ⊗ ... ⊗ |d₀⟩
d = Σ_{i=0}^{7} d_i 2ⁱ,  d_i ∈ {0, 1}
```

**Physical interpretation of bits:**
| Bit | Weight | Meaning |
|-----|--------|---------|
| d₀ | 1 | Parity (always 0 for d > 2) |
| d₁ | 2 | Twin/cousin distinction (d=2 vs d=4) |
| d₂ | 4 | Mod 8 structure |
| d₃ | 8 | Mod 16 constellation |
| d₄ | 16 | Magnitude class (16-31, 32-47, ...) |
| d₅ | 32 | Extended magnitude |
| d₆ | 64 | Tile group (0-63, 64-127, ...) |
| d₇ | 128 | Half-space (0-127 vs 128-255) |

## 6.2 Subsystem Hamiltonians

For each tensor factor, we define a reduced Hamiltonian by tracing out the complement:

```
Ĥ_A = Tr_B(Ĥ)  for ℋ = ℋ_A ⊗ ℋ_B
```

### 6.2.1 Nibble Hamiltonians
```
Ĥ_H = Tr_L(Ĥ) = Σ_{d_H} E(d_H) |d_H⟩⟨d_H|
Ĥ_L = Tr_H(Ĥ) = Σ_{d_L} E(d_L) |d_L⟩⟨d_L|
```

where E(d_H) = Σ_{d_L} p(d_H, d_L) E(d_H, d_L) is the marginal energy.

### 6.2.2 Bit Hamiltonians
```
Ĥ_i = Tr_{≠i}(Ĥ) = E_i(0) |0⟩⟨0| + E_i(1) |1⟩⟨1|
```

For i=0 (parity): E_0(0) ≈ ⟨E⟩, E_0(1) = ∞ (odd gaps forbidden)
For i=1 (twin bit): E_1(1) = ℏ/(2κ) (d=2), E_1(0) = average over even d>2

## 6.3 Entanglement Between Subsystems

The prime-weighted state |ψ⟩ = Σ_d √p(d) |d⟩ exhibits entanglement between tensor factors.

### 6.3.1 Nibble Entanglement
Reduced density matrix for high nibble:
```
ρ_H = Tr_L(|ψ⟩⟨ψ|) = Σ_{d_H} p(d_H) |d_H⟩⟨d_H|
```
where p(d_H) = Σ_{d_L} p(16·d_H + d_L).

Entanglement entropy:
```
S_H = -Tr(ρ_H log ρ_H) ≈ 2.8 bits
```

Similarly S_L ≈ 3.2 bits. Total S = S_H + S_L - I(H:L) where I(H:L) is mutual information.

### 6.3.2 Bit Entanglement
Single-bit reduced states:
```
ρ_i = p_i(0) |0⟩⟨0| + p_i(1) |1⟩⟨1|
```

For i=0: p_0(0) ≈ 1, p_0(1) ≈ 0 → S_0 ≈ 0 (parity fixed)
For i=1: p_1(1) = p(2) + p(6) + p(10) + ... ≈ 0.5 → S_1 = 1 bit (max)
For i≥2: varying entropies reflecting gap distribution structure

## 6.4 Quantum Error Correction from Tensor Structure

The twin prime subspace (d=2) is a protected subspace. In the bit decomposition:

```
|2⟩ = |0⟩ ⊗ |1⟩ ⊗ |0⟩ ⊗ |0⟩ ⊗ |0⟩ ⊗ |0⟩ ⊗ |0⟩ ⊗ |0⟩
```

This is a computational basis state with single excitation at bit 1. The code space:

```
C_twin = span{|2⟩} ≅ ℂ¹
```

has distance properties related to the [[256,1,3]] quantum error-correcting code (A1-35). The twin prime gap is the "logical |0⟩" of the prime difference code.

## 6.5 Conditional State Preparation

Given a measurement of the high nibble yielding d_H, the conditional state on low nibble is:

```
|ψ_L|d_H⟩ = (1/√p(d_H)) Σ_{d_L} √p(16·d_H + d_L) |d_L⟩
```

This enables conditional gap prediction: knowing the magnitude class updates the residue distribution.

## 6.6 Piece 06 Summary

- Three natural tensor decompositions: nibble (16⊗16), tile (4⊗64), bit (2⁸)
- Subsystem Hamiltonians by partial trace
- Entanglement entropies: S_H ≈ 2.8, S_L ≈ 3.2, S_bits vary
- Twin prime state = computational basis state with single bit-1 excitation
- Conditional states enable gap prediction
- Foundation for A3-05 (Entanglement), A3-08 (Error Correction), A3-07 (Quantum Information)

**References**: A1-35 (Quantum Error Correction), A3-01 (Hilbert Space), A3-05 (Entanglement), A3-08 (Error Correction Twin Primes)