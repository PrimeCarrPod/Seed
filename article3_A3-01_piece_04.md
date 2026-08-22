# A3-01 Hilbert Space Dimension 256 — Piece 04: Tensor Product Structure and Entanglement

## 4.1 8-Qubit Tensor Factorization

As established in Piece 02, ℋ ≅ (ℂ²)⊗⁸. The explicit factorization maps each residue k ∈ [0, 255] to its 8-bit binary representation:

```
k = b₇·2⁷ + b₆·2⁶ + b₅·2⁵ + b₄·2⁴ + b₃·2³ + b₂·2² + b₁·2¹ + b₀·2⁰
```

with b_i ∈ {0, 1}. The basis state decomposes as:

```
|k⟩ = |b₇⟩₇ ⊗ |b₆⟩₆ ⊗ |b₅⟩₅ ⊗ |b₄⟩₄ ⊗ |b₃⟩₃ ⊗ |b₂⟩₂ ⊗ |b₁⟩₁ ⊗ |b₀⟩₀
```

where the subscript denotes the qubit index (0 = least significant bit, 7 = most significant bit). This factorization is unique and canonical — it follows directly from the 8-bit encoding of PrimeBookOne.

## 4.2 Physical Meaning of Each Qubit

Each qubit corresponds to a power-of-2 component of the prime gap:

- **Qubit 0 (2⁰ = 1)**: Parity bit. Always 0 for prime gaps > 2 (all gaps even except d_1=1). |0⟩₀ is the dominant state. |1⟩₀ occurs only for the first gap d_1 = 1 (2 → 3). This qubit is effectively frozen in the ground state for all physical gaps.

- **Qubit 1 (2¹ = 2)**: Twin prime bit. |1⟩₁ indicates gap ≡ 2 (mod 4), i.e., twin prime gaps (d = 2, 6, 10, 14, ... but actually d ≡ 2 mod 4 means d = 2, 6, 10, 14... wait: 2 mod 4 = 2, 6, 10, 14, 18...). Actually: d ≡ 2 (mod 4) means the gap is 2 times an odd number. Twin primes have d = 2 ≡ 2 (mod 4). This qubit is |1⟩ for all gaps of form 2(2m+1).

- **Qubit 2 (2² = 4)**: Cousin prime bit. |1⟩₂ indicates gap ≡ 4 (mod 8). Cousin primes have d = 4 ≡ 4 (mod 8).

- **Qubit 3 (2³ = 8)**: Sexy prime bit (d = 6 ≡ 6 mod 8, so this is more subtle). Actually d = 6 = 2 + 4, so bits 1 and 2 are both 1. The qubit 3 (value 8) activates for gaps ≥ 8.

- **Qubit 4 (2⁴ = 16)**: Activates for gaps ≥ 16.

- **Qubit 5 (2⁵ = 32)**: Activates for gaps ≥ 32.

- **Qubit 6 (2⁶ = 64)**: Activates for gaps ≥ 64.

- **Qubit 7 (2⁷ = 128)**: Activates for gaps ≥ 128.

The qubit activation threshold at 2^i corresponds to the energy scale where gaps of that size become populated. This yields a natural *hierarchy of qubit activation* by energy scale.

## 4.3 Entanglement from Gap Correlations

The prime gap sequence exhibits correlations (Hardy-Littlewood). These correlations induce entanglement between qubits in the tensor product state. Consider the joint state of two consecutive gaps:

```
|Ψ⟩ = Σ_{k,k'} P(k, k') |k⟩ ⊗ |k'⟩
```

where P(k, k') is the joint probability of residues k and k' for consecutive gaps. The reduced density matrix for qubit i is:

```
ρ_i = Tr_{j≠i}(|Ψ⟩⟨Ψ|)
```

The entanglement entropy S_i = -Tr(ρ_i log ρ_i) measures how much qubit i is entangled with the rest. For the prime gap sequence, we expect:

- Qubit 0: Near zero entanglement (frozen)
- Qubit 1: High entanglement (twin prime correlations)
- Qubit 2: Moderate entanglement (cousin prime correlations)
- Qubits 3-7: Increasingly classical (higher gaps are rarer, more Poisson-like)

This entanglement structure mirrors the prime gap correlation structure derived in Article 1 (A1-08, A1-31, A1-32).

## 4.4 Tensor Product and the One-Electron Universe

In the one-electron universe picture (Article 1, A1-07), the single electron worldline traverses all prime gaps. The 8-qubit register at each proper time step τ_n encodes the *internal state* of the electron at that step. The tensor product across time steps gives the full worldline state:

```
|Worldline⟩ = ⊗_n |ψ(τ_n)⟩  ∈  ⊗_n ℋ_n
```

where ℋ_n ≅ ℂ²⁵⁶ is the 256-dimensional space at step n. The entanglement *between* time steps is governed by the time evolution operator (A3-02) and the gap correlation structure (A3-05).

The 8-qubit factorization at a single time step provides a microscopic description of the electron's "internal clock" — the 8 bits track which power-of-2 components are present in the current proper time tick. This is the quantum analog of the classical proper time quantization of A1-01.

## 4.5 Measurement and the Born Rule from Gap Frequencies

The probability of measuring the electron in residue class k is:

```
P(k) = |⟨k|ψ⟩|² = lim_{N→∞} (1/N) Σ_{n=1}^N δ_{d_n mod 256, k}
```

This is the *Born rule derived from prime gap frequencies*. The quantum state |ψ⟩ is the asymptotic frequency vector of the prime gap residues. The Born rule is not postulated — it is the law of large numbers for the prime gap sequence.

This connects to the frequentist interpretation of quantum mechanics and provides a concrete realization of the "primitive ontology" program: the prime gap sequence *is* the ontology, and quantum probabilities are its asymptotic frequencies.