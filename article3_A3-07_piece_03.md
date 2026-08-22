# A3-07 Quantum_Information_Prime_Book.md — Piece 03: Quantum Error Correction from Prime Book Structure

## 3.1 Book-Level Error Correction

The 3500-book ensemble provides a natural **quantum error correcting code** at the book level. Each book is a "shot" of the quantum computation, and the ensemble average corrects for the random fluctuations in individual books.

### Repetition Code Structure
The channel ℰ = (1/B) Σ_b U_b ρ U_b† is a **quantum repetition code**:
- Logical state: ρ_L
- Physical states: U_b ρ_L U_b† (one per book)
- Decoding: Average over books (majority vote in quantum sense)

The logical information is encoded in the **invariant subspace** of the channel — states that are unchanged by the ensemble average.

## 3.2 Invariant Subspace and Logical Qubits

The invariant subspace consists of states ρ such that U_b ρ U_b† = ρ for all b (up to phase). Since U_b = diag(e^{-iθ_d^{(b)}}), the invariant states are:
- **Diagonal states** in the gap basis: ρ = Σ_d p(d) |d⟩⟨d|
- **Coherences within degenerate energy sectors**: if θ_d^{(b)} = θ_{d'}^{(b)} for all b

The energy E_d = ℏ/(κd) gives phases θ_d = τ/(κd). For the phases to be equal for all books, we need d = d' (no degeneracy in 1/d). Thus **only diagonal states are exactly invariant**.

### Approximate Invariance: Modular Sectors
However, the **modular structure** (A3-04, A3-06) gives approximate degeneracies:
- Mod 6 sectors: d ≡ 0, 2, 4 (mod 6) have similar 1/d values
- Within a sector, the phase variation is small: Δθ ~ τ/(κd²) Δd

The logical qubits are encoded in the **modular sector coherences**:
```
|0_L⟩ = (1/√N_0) Σ_{d∈S_0} |d⟩  (sexy prime sector)
|1_L⟩ = (1/√N_2) Σ_{d∈S_2} |d⟩  (twin/cousin sector)
|2_L⟩ = (1/√N_4) Σ_{d∈S_4} |d⟩  (cousin sector)
```

These are **decoherence-free subspaces** for the book-averaged channel (A3-06, Piece 03).

## 3.3 Syndrome Measurement from Book Statistics

The syndrome for error correction is the **book index distribution**. Given an output state ρ_out, the probability it came from book b is:
```
P(b|ρ_out) ∝ Tr(U_b ρ_in U_b† ρ_out)
```

For the twin prime input |2⟩⟨2|, P(b|ρ_out) is uniform (all books give the same output up to phase). For other inputs, P(b|ρ_out) reveals the error syndrome.

### Modular Syndrome
The modular classes give a natural syndrome measurement:
- Measure d mod 6: outcome s ∈ {0, 2, 4}
- This projects onto sector S_s
- The sector is preserved by the channel (approximate DFS)

## 3.4 Code Distance and Threshold

### Code Distance
The code distance d is the minimum weight of an error that maps one logical state to another. For the sector encoding:
- Logical |0_L⟩, |1_L⟩, |2_L⟩ have support on disjoint gap sets
- A single gap transition (d → d') can change sector if d and d' are in different mod 6 classes
- But the transition probability is suppressed by modular selection rules (A3-06)

The effective code distance is **infinite against single-gap errors** within the same modular sector, and **large against inter-sector errors** due to selection rules.

### Threshold
The error threshold is the maximum physical error rate per book that can be corrected. The physical "error" is the variation between books:
```
ε = max_b ||U_b - Ū|| ~ 10^{-3}
```
where Ū is the average unitary. The threshold for the repetition code is ε_th ~ 0.5. The actual ε ~ 10^{-3} is **far below threshold**.

## 3.5 Connection to A1-35 Worldline QEC

A1-35 established the worldline as a [[256,1,3]] code. The book-level code is the **macroscopic version**:
- A1-35: microscopic, per-gap error correction
- A3-07: macroscopic, per-book error correction
- Both use the twin prime / modular structure
- The book code corrects the residual errors after A1-35

## 3.6 Piece 03 Summary

- 3500 books = quantum repetition code
- Logical qubits encoded in modular sectors (S₀, S₂, S₄)
- Syndrome = book index distribution / modular measurement
- Code distance: infinite against intra-sector errors
- Threshold: ε ~ 10^{-3} ≪ ε_th ~ 0.5
- Macroscopic version of A1-35 worldline QEC

**References**: A1-35 (Worldline QEC), A3-06 (DFS, Modular Structure), A3-04 (Modular Symmetries), A3-05 (Entanglement Sectors)