# A3-02 Time Evolution Operator — Piece 01: Overview and Hamiltonian Construction

## Abstract

The time evolution operator U(t) = exp(-iĤt/ℏ) governs the quantum dynamics of the prime electron in the 256-dimensional Hilbert space ℋ = ℂ²⁵⁶. The Hamiltonian Ĥ is diagonal in the prime gap residue basis {|k⟩} with eigenvalues E(k) = ℏ/(κ·k) for k > 0 (and E(0) = ∞). This follows from the energy-gap relation of Article 2 (A2-01) and the proper time quantization of Article 1 (A1-01). The time evolution operator is therefore:

```
U(t) = Σ_{k=1}^{255} exp(-i t / (κ·k)) |k⟩⟨k| + |0⟩⟨0|
```

where the |0⟩ state is frozen (infinite energy gap). The evolution is quasi-periodic with incommensurate frequencies ω_k = 1/(κ·k), reflecting the arithmetic structure of prime gaps.

## 1.1 From Proper Time to Quantum Time Evolution

Article 1 (A1-01) established the discrete proper time steps:

```
Δτ_n = κ·d_n
```

Article 2 (A2-01) gave the energy-gap relation:

```
E(d) = ℏ / (κ·d)
```

In the 256-dimensional space (A3-01), the gap residue k = d mod 256 labels basis states |k⟩. The Hamiltonian is:

```
Ĥ = Σ_{k=1}^{255} E(k) |k⟩⟨k| + E(0) |0⟩⟨0|
```

with E(k) = ℏ/(κ·k). The time evolution operator follows from the Schrödinger equation:

```
iℏ ∂_t |ψ(t)⟩ = Ĥ |ψ(t)⟩
```

with solution |ψ(t)⟩ = U(t) |ψ(0)⟩.

## 1.2 Structure of the Time Evolution Operator

The operator U(t) is diagonal in the residue basis:

```
U(t) = Σ_{k=0}^{255} e^{-i E(k) t / ℏ} |k⟩⟨k|
     = Σ_{k=1}^{255} e^{-i t / (κ·k)} |k⟩⟨k| + |0⟩⟨0|
```

Key properties:
- **Unitarity**: U†(t)U(t) = I (trivial for diagonal unitary)
- **Quasi-periodicity**: No exact period since {1/(κ·k)} are incommensurate
- **Recurrence**: Poincaré recurrence time ~ exp(256) (effectively infinite)
- **Energy conservation**: ⟨ψ|Ĥ|ψ⟩ constant in time

## 1.3 Article 3 Context

This is File 2 of 40 in Article 3. It builds on:
- A3-01: 256-dimensional Hilbert space ℋ = ℂ²⁵⁶
- A1-01: Proper time quantization Δτ_n = κ·d_n
- A2-01: Energy-gap relation E = ℏ/(κ·d)

And sets up:
- A3-03: Prime difference basis and modular Hamiltonian
- A3-04: Unitarity from prime distribution
- A3-05: Entanglement from gap correlations in time evolution