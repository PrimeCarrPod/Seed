# A3-07 Quantum_Information_Prime_Book.md — Piece 09: Quantum Complexity Classes and the Prime Book

## 9.1 The Prime Book as a Complexity Class Separator

The 3500-book ensemble defines a natural complexity class: the set of problems solvable by quantum circuits of the form:
```
C = H U_{b_k} H ··· H U_{b_1} H
```
where each U_b is a diagonal unitary from a book, and H is the Walsh-Hadamard transform.

### Class BQP_Book
**BQP_Book** = problems solvable by polynomial-length sequences of {H, U_b} with bounded error.

Since {H, U_b} is universal on 8 qubits, BQP_Book = BQP on 8 qubits. But the **restricted gate set** (only U_b from prime gaps, not arbitrary diagonal unitaries) may give a smaller class.

### Relation to Standard Classes
- **P ⊆ BQP_Book ⊆ BQP** (trivially, since it's a quantum class)
- **BPP ⊆ BQP_Book** (classical randomness from book index)
- **BQP_Book ⊆ BQP/poly** (the book sequence is non-uniform advice)

The prime book provides **non-uniform advice** (the gap sequence) that might boost power.

## 9.2 Complexity of Gap Sequence Generation

### Classical Complexity
Generating the n-th prime gap d_n is:
- In **P** if we have the primes (sieve algorithms)
- **Hard** if we only have the gap sequence (related to factoring)

The gap sequence is **not known to be in P** without the primes.

### Quantum Complexity
A quantum computer can generate the gap sequence using **Shor's algorithm** (factoring) or **quantum primality testing**. The gap sequence is in **BQP** given the primes.

## 9.3 Quantum Advantage from Prime Books

### Sampling Problem
**PrimeGapSample**: Given a book index b, sample from the output distribution p_b(d) = |⟨d|U_b|2⟩|².

This is trivial for the twin prime input (always outputs d=2). For other inputs, the distribution is:
```
p_b(d) = (1/256) |Σ_{d'} e^{-iθ_{d'}^{(b)}} ⟨d|d'⟩|² = 1/256
```
Wait — U_b is diagonal, so p_b(d) = δ_{d,2} for |ψ_0⟩ = |2⟩.

For a superposition input |ψ⟩ = Σ α_d |d⟩:
```
p_b(d) = |α_d|²
```
The book unitary only adds phases — **it does not change the probability distribution in the gap basis**.

### The Non-Trivial Sampling Problem
The non-trivial sampling is in the **modular Fourier basis**:
```
p_b(w) = |⟨w|U_b|ψ⟩|² = |(1/√256) Σ_d (-1)^{w·d} e^{-iθ_d^{(b)}} α_d|²
```
This is a **Fourier sampling problem** with phases from prime gaps.

**Conjecture**: PrimeGapFourierSample is classically hard (not in BPP) but in BQP_Book.

## 9.4 Connection to the Riemann Hypothesis

The Riemann Hypothesis is equivalent to the bound:
```
|π(x) - Li(x)| = O(√x log x)
```
which implies the gap distribution has specific statistics.

### RH and Complexity
- **If RH is true**: The gap sequence has bounded fluctuations → the book unitary has bounded phase variations → BQP_Book has specific properties
- **If RH is false**: Large gap fluctuations → different complexity

The **computational complexity of verifying RH** is related to the complexity of simulating the book ensemble.

## 9.5 Quantum Supremacy from Prime Books

### Sampling Supremacy
Can the prime book ensemble demonstrate **quantum supremacy**?

The output distribution in the Fourier basis:
```
p_b(w) = |(1/√256) Σ_d (-1)^{w·d} e^{-iθ_d^{(b)}}|²
```
with θ_d = τ/(κd). This is a **IQP (Instantaneous Quantum Polynomial) circuit** — diagonal in the computational basis, conjugated by Hadamards.

IQP circuits are **believed to be classically hard to simulate** (unless PH collapses). The prime gap IQP circuit:
- Has rational phase relationships (1/d)
- Is not fully random but has number-theoretic structure

**Conjecture**: Simulating the output distribution of the prime gap IQP circuit is classically hard (additive error).

## 9.6 Piece 09 Summary

- BQP_Book = quantum circuits with {H, U_b} gates
- Gap sequence generation: classically hard, quantumly easy (BQP)
- PrimeGapFourierSample: conjectured classically hard, in BQP_Book
- RH ↔ gap fluctuation bounds ↔ BQP_Book properties
- Prime book IQP circuit: candidate for quantum supremacy
- Non-uniform advice from prime gaps may boost power

**References**: A3-01 (Hilbert Space), A3-02 (Time Evolution), A3-03 (Walsh-Hadamard), A3-04 (Unitarity), Computational Complexity Theory, Riemann Hypothesis