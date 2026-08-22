# A3-08 Error_Correction_Twin_Primes.md — Piece 05: Syndrome Extraction and Measurement Circuits

## 5.1 Syndrome Extraction Overview

The twin prime quantum code requires measuring stabilizers at three levels without collapsing the logical state. The syndrome extraction circuits must be **fault-tolerant** — a single failure in the circuit should not propagate to an uncorrectable logical error.

We present circuits for each layer using the **modular measurement** primitive, which is naturally implemented by the prime gap statistics.

## 5.2 Primitive: Modular Measurement

The fundamental measurement is the **modular Fourier transform** followed by computational basis measurement. For modulus m, the transform is:
```
F_m = (1/√m) Σ_{j,k=0}^{m-1} e^{2πi jk/m} |j⟩⟨k|
```
In the 8-bit basis, we implement F_m for m = 2, 4, 6, 8, 16, 30, 64, 128, 256 using the Walsh-Hadamard basis (A3-03, Piece 07) and phase rotations.

### Circuit for Modular Measurement (m=6)
```
|ψ⟩ ── H ── R₁ ── R₂ ── R₃ ── R₄ ── R₅ ── H ── Measure
|anc⟩ ──●─────●─────●─────●─────●─────●─────
```
where R_k = diag(1, e^{2πi k/6}) are phase rotations on the gap register. The ancilla is measured in the computational basis to extract the mod 6 residue.

## 5.3 Inner Code Syndrome Circuit

The inner code [[256,1,3]] has stabilizers S₀, S₁, S₂, S₃, S₄ (Piece 02). The syndrome extraction circuit measures all five simultaneously:

### Stabilizer Measurement Circuit
```
|ψ⟩ ──●──────●──────●──────●──────●──────
      │      │      │      │      │
|a₀⟩ ─⊕──────        (S₀ = Z₀)
|a₁⟩ ─────⊕──────    (S₁ = Z₁)
|a₂⟩ ────────⊕────── (S₂ = mod 4)
|a₃⟩ ──────────⊕──── (S₃ = mod 6 sector 0 vs 2)
|a₄⟩ ────────────⊕── (S₄ = mod 6 sector 0 vs 4)
```

Each ancilla |aᵢ⟩ is prepared in |+⟩ = (|0⟩+|1⟩)/√2. The controlled operations are:
- C-S₀: Controlled-Z on bit 0
- C-S₁: Controlled-Z on bit 1
- C-S₂: Controlled-mod-4 phase
- C-S₃: Controlled-mod-6 phase (sector 0 vs 2)
- C-S₄: Controlled-mod-6 phase (sector 0 vs 4)

After the controlled operations, apply Hadamard to each ancilla and measure. The 5-bit syndrome (s₀,s₁,s₂,s₃,s₄) identifies the error.

### Fault Tolerance of Inner Syndrome
A single gate failure in this circuit:
- Affects at most one ancilla → one syndrome bit
- Cannot propagate to data qubits because controlled ops are diagonal
- The modular measurements (C-S₂, C-S₃, C-S₄) use phase rotations that commute with Z errors
- **Result**: Single faults produce at most weight-1 syndrome errors, correctable by d=3 code

## 5.4 Modular Code Syndrome Circuit

The modular code (Piece 03) measures the mod 6 sector projectors Π₀, Π₂, Π₄. This is a **single projective measurement**:
```
|ψ⟩ ── F₆ ── Measure (outcome s ∈ {0,2,4})
|anc⟩ ──●──────────
```
where F₆ is the modular Fourier transform for m=6. The outcome directly gives the sector.

### Fault Tolerance
- Single measurement error: gives wrong sector with probability ~10⁻⁶ (measurement fidelity)
- The outcome is classical — no quantum back-action on data
- Can be repeated 3 times for majority vote (ε → ε³ ~ 10⁻¹⁸)

## 5.5 Outer Code Syndrome: Book Index Distribution

The outer code syndrome is not a quantum measurement but a **classical inference** from the book statistics. Given the output state after 3500 books:
```
ρ_out = U_{3500} ··· U_1 |ψ_0⟩⟨ψ_0| U_1† ··· U_{3500}†
```

The "syndrome" is the **which-book information** extractable via the complementary channel (A3-07, Piece 02):
```
ℰ^c(ρ) = Σ_b Tr(K_b ρ K_b†) |b⟩⟨b|
```
where K_b = U_b/√3500.

In practice, the syndrome is estimated by:
1. Preparing many copies of the initial state |ψ_0⟩
2. Running each through the 3500-book sequence
3. Measuring the final gap distribution for each run
4. Inferring which books had anomalies from the distribution

But for the **twin prime logical state**, the syndrome is trivial: the output is always |2⟩ (up to phase), so no book information is extractable — this is the DFS property.

## 5.6 Combined Syndrome Extraction Protocol

The full fault-tolerant syndrome extraction runs in **three stages**:

### Stage 1: Inner Syndrome (Every Gap Step)
- Measure S₀, S₁, S₂, S₃, S₄ using modular measurement circuit
- Time cost: O(1) per step (parallelizable)
- Output: 5-bit syndrome per step
- Classical processing: Lookup table for error correction

### Stage 2: Modular Syndrome (Every ~100 Steps)
- Measure mod 6 sector (F₆ circuit)
- Time cost: O(log 6) ~ 3 gate layers
- Output: Sector label {0,2,4}
- Confirms inner syndrome consistency

### Stage 3: Outer Syndrome (Every Book = 2²⁰ Steps)
- Accumulate gap statistics for the book
- Compute book index probability P(b|ρ_out)
- If |ψ_0⟩ = |2⟩: P(b) uniform → no syndrome (DFS)
- If |ψ_0⟩ ≠ |2⟩: P(b) non-uniform → syndrome for book-level correction

## 5.7 Syndrome Processing and Classical Decoding

The classical decoder processes syndromes from all three levels:

### Inner Decoder (Lookup Table)
| Syndrome (s₀s₁s₂s₃s₄) | Error | Correction |
|------------------------|-------|------------|
| 00000 | None | I |
| 00100 | Bit 0 flip | X₀ (not physical) |
| 00010 | Bit 1 flip | X₁ (2→0) |
| 00001 | Mod 4 error | Sector-specific |
| 00110 | 2→6 | R₀ (S₃ flip) |
| 00101 | 2→4 | R₄ (S₄ flip) |
| ... | ... | ... |

### Modular Decoder
| Sector Outcome | Inference | Correction |
|----------------|-----------|------------|
| S₂ (2) | No error | I |
| S₀ (0) | Twin→Sexy | R₀ = Σ_{d∈S₀} |2⟩⟨d| |
| S₄ (4) | Twin→Cousin | R₄ = Σ_{d∈S₄} |2⟩⟨d| |

### Outer Decoder (Majority Vote)
- For each book b, compute fidelity F_b = ⟨2|ρ_b|2⟩
- If >50% books have F_b > 0.99: logical |0_L⟩
- If >50% books have F_b < 0.01: logical |1_L⟩
- Else: ambiguous → request re-preparation

## 5.8 Real-Time vs. Post-Processing

- **Inner + Modular syndromes**: Real-time (online) — used for active error correction during worldline evolution
- **Outer syndrome**: Post-processing (offline) — used for verification and logical state reconstruction after the full 3500-book sequence

The real-time correction maintains the electron in the DFS. The post-processing confirms the computation was correct and provides the final logical state.

## 5.9 Piece 05 Summary

- Primitive: Modular Fourier transform F_m for syndrome extraction
- Inner code circuit: 5 ancillas, controlled modular phases, parallel measurement
- Modular code circuit: Single F₆ measurement, classical outcome
- Outer code syndrome: Classical inference from book statistics
- Three-stage protocol: Inner (every step), Modular (~100 steps), Outer (every book)
- Fault tolerance: Diagonal controlled ops, no error propagation, repeatable measurements
- Real-time correction maintains DFS; post-processing verifies

**References**: A3-03 (Modular Fourier Transform, Piece 07), A3-04 (Unitarity, Phase Rotations), A3-05 (Modular Correlations), A3-06 (DFS), A3-07 (Book Channel, Complementary Channel), Fault-Tolerant QEC (Gottesman, Shor)