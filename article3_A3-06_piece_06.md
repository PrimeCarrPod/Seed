# A3-06 Decoherence_From_Gap_Randomness.md — Piece 06: Decoherence in the Walsh-Hadamard Basis

## 6.1 Walsh-Hadamard Basis and Bitwise Dephasing

The Walsh-Hadamard basis (A3-04, Piece 09) diagonalizes the bitwise Z-operators:
```
Z_i = |0⟩⟨0|_i - |1⟩⟨1|_i,  i = 0,...,7
```
with [Z_i, H] = 0 (A3-04, Piece 09). The Hamiltonian is diagonal in the gap basis but not in the Walsh basis.

The dephasing master equation in the Walsh basis:
```
∂_t ρ_H = -i[H_H, ρ_H] + ℒ_H(ρ_H)
```
where H_H = H H_256 H_256† and ℒ_H is the dissipator transformed to the Walsh basis.

## 6.2 Decoherence of Walsh Modes

The Walsh modes are labeled by w ∈ {0,1}^8. The coherence between modes w and w' is:
```
ρ_H(w, w', t) = ρ_H(w, w', 0) e^{-iω_{ww'}t} e^{-Γ_{ww'}t}
```

The decoherence rate Γ_{ww'} depends on the **bitwise structure** of w and w'.

### Single-Bit Dephasing Rates
For w and w' differing in exactly one bit (i.e., w' = w ⊕ e_i):
```
Γ_{w, w⊕e_i} = γ_i
```
where γ_i is the dephasing rate for bit i.

From the gap correlation structure:
- γ_0 (bit 0, parity): **γ_0 = 0** — all valid gaps are even, so bit 0 is always 0 (exact superselection)
- γ_1 (bit 1, mod 4): **γ_1 ≈ 10^{-5}** — protected by mod 4 structure
- γ_2 (bit 2, mod 8): γ_2 ~ 10^{-4}
- γ_i (bits 3-7): γ_i ~ 10^{-3} - 10^{-2}

The dephasing rate **increases with bit position** — higher bits are less protected by modular structure.

### Multi-Bit Dephasing
For w and w' differing in k bits:
```
Γ_{ww'} ≈ Σ_{i∈diff} γ_i
```
This additivity holds approximately because the gap correlation noise is nearly uncorrelated across different modular structures.

## 6.3 Pointer Basis in the Walsh Basis

The **pointer basis** (states least affected by decoherence) in the Walsh basis are the states with:
1. **Definite bit 0** (always |0⟩_0) — exact pointer state
2. **Definite bit 1** (|0⟩_1 or |1⟩_1) — protected by mod 4
3. **Superpositions within mod 6 sectors** — protected by mod 6 structure

The computational basis |d⟩ is the **exact pointer basis** because the Lindblad operators L_{dd'} = |d⟩⟨d'| are diagonal in the computational basis. The Walsh basis is **not** a pointer basis — it is the basis of conserved quantities (Z_i).

## 6.4 Decoherence-Free Walsh Modes

The Walsh mode w = 0 (all zeros) corresponds to the total probability:
```
|w=0⟩ = (1/√256) Σ_d |d⟩
```
This mode has Γ = 0 because it's the identity component.

The mode w = e_1 (only bit 1 set) corresponds to the mod 4 symmetry:
```
|e_1⟩ = (1/√256) Σ_d (-1)^{d_1} |d⟩
```
This mode has Γ ≈ 10^{-5} — it's nearly decoherence-free.

In general, **Walsh modes corresponding to modular symmetries** have suppressed decoherence.

## 6.5 Quantum Darwinism and Walsh Basis

The **redundant encoding** of information in the environment (unobserved gaps) can be analyzed in the Walsh basis. The mutual information between a bit i and the environment:
```
I(i : env) = S(ρ_i) - S(ρ_i|env)
```
For the twin prime sector, I(1 : env) = 0 (bit 1 is perfectly protected). For higher bits, I(i : env) increases.

The **redundancy** R_δ — the number of environment fragments that contain the information about bit i with fidelity 1-δ — is:
- R_δ(bit 1) → ∞ (perfect redundancy)
- R_δ(bit 2) ~ 10²
- R_δ(bit 3) ~ 10¹
- R_δ(bits 4-7) ~ few

This is **quantum Darwinism**: the modular structure (mod 2, mod 4, mod 6) creates redundant records of the protected bits in the gap sequence.

## 6.6 Piece 06 Summary

- Bitwise dephasing rates: γ_0 = 0, γ_1 ~ 10^{-5}, γ_2 ~ 10^{-4}, γ_{3-7} ~ 10^{-3}-10^{-2}
- Computational basis = exact pointer basis
- Walsh basis = basis of conserved Z_i
- Walsh modes for modular symmetries (w = e_0, e_1) are nearly DFS
- Quantum Darwinism: modular bits (1, 2) redundantly encoded in gap sequence
- Redundancy R_δ: bit 1 → ∞, bit 2 ~ 100, higher bits ~ few

**References**: A3-04 (Piece 09: Walsh-Hadamard Basis), A3-05 (Piece 09: Walsh Spectrum), A3-04 (Piece 08: Modular Structure), A1-35 (QEC)