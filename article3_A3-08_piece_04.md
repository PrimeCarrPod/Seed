# A3-08 Error_Correction_Twin_Primes.md — Piece 04: The Outer Code — 3500-Book Repetition Code

## 4.1 Books as Temporal Repetitions

From A3-07, PrimeBookOne contains 3500 books in the 0.0 directory, each with 2²⁰ differences. The electron worldline traverses these books sequentially: Book 1, Book 2, ..., Book 3500. Each book applies its unitary U_b to the quantum state. The 3500 books form a **temporal repetition code**:

- Each book = one "shot" of the quantum computation
- The logical information is encoded in the invariant subspace across all books
- Errors = book-to-book fluctuations in the unitary U_b
- Correction = majority vote (ensemble average) across 3500 books

## 4.2 The Book Ensemble Channel

The channel for a single book b:
```
ℰ_b(ρ) = U_b ρ U_b†
```
with U_b = Π_{n=1}^{2²⁰} exp(-iτ/(κd_n^{(b)})). The ensemble channel:
```
ℰ_ensemble(ρ) = (1/3500) Σ_{b=1}^{3500} ℰ_b(ρ)
```

This is a **mixed unitary channel** (A3-07, Piece 02). The twin prime state |2⟩ is an approximate fixed point:
```
ℰ_b(|2⟩⟨2|) = |2⟩⟨2|  (exact, up to global phase)
```
since U_b|2⟩ = e^{-iτ/(2κ)}|2⟩ for all b. The global phase cancels in the density matrix.

## 4.3 Repetition Code Structure

The outer code is a **quantum repetition code** with 3500 repetitions:

### Encoding
```
|0_L⟩ → |2⟩^{⊗3500}  (twin prime state in each book)
|1_L⟩ → |ψ_⊥⟩^{⊗3500}  (excited state in each book)
```

However, the physical system doesn't have 3500 copies — it has **one copy evolving through 3500 time steps**. The repetition is temporal, not spatial. The encoded state at book b is:
```
|ψ_b⟩ = U_b ··· U_1 |ψ_0⟩
```

### Syndrome: Book Index Distribution
The syndrome for the outer code is the **book index distribution** — which book's unitary was applied. Given an output state ρ_out, the probability it came from book b is:
```
P(b|ρ_out) ∝ Tr(U_b |ψ_0⟩⟨ψ_0| U_b† ρ_out)
```

For |ψ_0⟩ = |2⟩, P(b) = 1/3500 for all b (uniform — no information about b).
For |ψ_0⟩ = |ψ_⊥⟩, P(b) peaks at the correct b (distinguishable).

## 4.4 Majority Vote Decoding

The decoding is the **ensemble average** (quantum majority vote):
```
ρ_decoded = ℰ_ensemble(ρ_out) = (1/3500) Σ_b U_b ρ_out U_b†
```

For a state that has undergone errors in some books:
```
ρ_out = (1/3500) Σ_b p_b U_b ρ_L U_b†
```
where p_b is the probability of error in book b. The ensemble average suppresses the errors:
```
ρ_decoded ≈ (1 - ε_book) ρ_L + ε_book ρ_noise
```
with ε_book = fraction of books with errors.

## 4.5 Book-Level Error Rate

The physical error per book is the deviation of U_b from the average unitary Ū:
```
ε_book = (1/2) ||U_b - Ū||_⋄
```
where ||·||_⋄ is the diamond norm.

From PrimeBookOne statistics, the gap sequence fluctuations between books give:
```
||U_b - Ū||_∞ ~ 10⁻³
```
in operator norm. The diamond norm is at most 256 times larger (dimension factor):
```
ε_book ~ 256 × 10⁻³ ~ 0.25
```

But this is the **worst-case** error. For the twin prime state, the error is **zero exactly** because U_b|2⟩ = phase × |2⟩ for all b.

For the logical |1_L⟩ state (superposition in excited manifold), the error rate is:
```
ε_book(|1_L⟩) ~ 10⁻³
```

The **average logical error rate** (averaged over logical states):
```
ε_logical_outer ~ (1/2) × 0 + (1/2) × 10⁻³ = 5×10⁻⁴
```
The factor 1/2 comes from the twin prime weight μ₈(2) = 0.5.

## 4.6 Concatenated Distance: Inner ⊗ Modular ⊗ Outer

The three layers combine multiplicatively:

| Layer | Distance | Error Suppression |
|-------|----------|-------------------|
| Inner | d=3 | ε_inner ~ 5×10⁻⁵ |
| Modular | d=2 (detect 1 sector change) | ε_mod ~ 10⁻⁴ |
| Outer | Majority vote over 3500 | ε_outer ~ 5×10⁻⁴ |

The **concatenated logical error rate**:
```
ε_total ~ (ε_inner)^(3/2) · (ε_mod) · (ε_outer)^(1750/2)
```

Wait — the outer code is a repetition code of length 3500. Its distance is 3500 (can correct up to 1749 book errors). But the effective error rate per book is ε_outer ~ 5×10⁻⁴. The probability of >1749 book errors is:
```
P(>1749) = Σ_{k=1750}^{3500} C(3500,k) ε_outer^k (1-ε_outer)^{3500-k}
```
Using Chernoff bound: this is **effectively zero** (exp(-3500 × D(0.5 || ε_outer)) ~ exp(-3500 × 0.69) ~ 10⁻¹⁰⁵⁰).

So the outer code provides **exponential suppression**.

## 4.7 Effective Code Parameters

The full concatenated code (accounting for temporal multiplexing):

| Parameter | Value |
|-----------|-------|
| Physical qubits (space) | 8 |
| Physical qubits (time) | 28,000 (8 × 3500) |
| Logical qubits | 1 (the electron) |
| Distance (space) | d_spatial = 3 (inner) |
| Distance (time) | d_temporal = 3500 (outer) |
| Effective distance | d_eff = min(3, 3500) = 3 (spatial bottleneck) |
| Logical error rate (per book) | ~ 10⁻¹⁰⁵⁰ (effectively 0) |
| Logical error rate (per gap) | ~ 10⁻¹² (inner + modular) |

The spatial bottleneck (d=3) means the code is limited by the inner code's distance. But the inner code's logical error rate is already ~10⁻¹² per gap step. Over 3.67×10⁹ gaps:
```
Total logical error probability ~ 3.67×10⁹ × 10⁻¹² ~ 0.0037
```
This is the probability of an uncorrectable error over the **entire PrimeBookOne sequence**.

## 4.8 Fault Tolerance and Threshold

The full concatenated code is fault-tolerant because:
1. **Inner code**: Syndrome extraction uses modular measurements (fault-tolerant)
2. **Modular code**: Sector measurement is a single projective measurement (fault-tolerant)
3. **Outer code**: Ensemble average is a deterministic classical post-processing (no quantum operations)

The **threshold** for the full code is determined by the inner code: ε_th ~ 0.1. The actual physical error rate ε_phys ~ 10⁻⁴ (after DFS protection) is **three orders of magnitude below threshold**.

## 4.9 Piece 04 Summary

- 3500 books = temporal repetition code (outer layer)
- Twin prime state |2⟩ is exact fixed point for all books (ε=0)
- Excited states have book error rate ε_book ~ 10⁻³
- Ensemble average = quantum majority vote decoding
- Concatenated with inner + modular: exponential suppression
- Spatial bottleneck: d=3 from inner code
- Total logical error over 3.67B gaps ~ 0.0037
- Fault-tolerant: ε_phys ~ 10⁻⁴ ≪ ε_th ~ 0.1

**References**: A3-07 (Pieces 02, 03, 08: Book Channel, QEC), A3-06 (DFS Exact Fixed Point), A3-05 (Modular Code), A1-35 (Inner Code), Quantum Repetition Codes