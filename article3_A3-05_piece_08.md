# A3-05 Entanglement_From_Gap_Correlations.md — Piece 08: Entanglement Dynamics and Decoherence from Gap Randomness

## 8.1 Time Evolution of Entanglement

From A3-02, the time evolution operator is U(t) = diag(e^{-iE_d t/ℏ}) in the gap basis. In the bitwise tensor basis, this becomes:
```
U(t) = Σ_d e^{-iE_d t/ℏ} |d⟩⟨d|
```

Since |d⟩ are basis states in the computational (bitwise) basis, U(t) is **diagonal in the computational basis**. Therefore, the populations p(d) = μ₈(d) are constants of motion, and the **entanglement spectrum (Schmidt coefficients) is time-independent** for the free evolution.

However, the **entanglement between specific tensor factors** oscillates due to phase evolution. The off-diagonal elements of the density matrix in the tensor basis:
```
ρ_{b,b'}(t) = √(p(b)p(b')) e^{-i(E_b - E_{b'})t/ℏ}
```
where b, b' are 8-bit strings. The entanglement entropy S(ρ_L) is invariant, but the **entanglement Hamiltonian** K(t) = -log ρ_L(t) acquires time-dependent off-diagonal terms.

## 8.2 Decoherence from Gap Randomness

When we consider an **open system** — the electron worldline interacting with the "environment" of unobserved gaps — decoherence emerges. The full state includes the gap sequence history:

```
|Ψ_full⟩ = Σ_{d_1,d_2,...,d_N} √p(d_1,...,d_N) |d_1⟩ ⊗ |d_2⟩ ⊗ ... ⊗ |d_N⟩
```

Tracing out all but the current gap d_n gives the reduced state ρ_n. The **decoherence rate** is determined by the gap correlation decay.

### Correlation Decay and Decoherence Time

The gap autocorrelation function:
```
C(τ) = ⟨d_n d_{n+τ}⟩ - ⟨d⟩²
```

From PrimeBookOne data, C(τ) decays as a power law:
```
C(τ) ~ τ^{-α},  α ≈ 0.7
```
for τ up to ~10⁴, then crosses over to exponential decay from finite-size effects.

The decoherence time for a superposition of gaps d and d':
```
T_φ(d,d') ~ 1 / |E_d - E_{d'}| · (C(0)/C(τ))
```
For nearby gaps (|d-d'| small), T_φ is long. For widely separated gaps, T_φ is short.

## 8.3 Decoherence-Free Subspaces

The twin prime sector (d=2) is a **decoherence-free subspace (DFS)** because:
1. E_2 is non-degenerate (d=2 is unique mod 256)
2. No transitions to other gaps (modular selection rules)
3. C(τ) for d=2 is constant (perfectly correlated with itself)

More generally, any **gap class that is isolated in correlation space** forms a DFS. The modular classes mod 6 (S₀, S₂, S₄) are approximate DFSs because inter-class correlations are weak (A3-04, Piece 08).

## 8.4 Master Equation for the Reduced State

The reduced state ρ(t) for a single gap (tracing out past/future gaps) obeys:
```
∂_t ρ = -i[H, ρ] + ℒ(ρ)
```
where ℒ is the Lindblad dissipator from gap correlations:
```
ℒ(ρ) = Σ_{d≠d'} γ_{dd'} (L_{dd'} ρ L_{dd'}† - ½{L_{dd'}† L_{dd'}, ρ})
```
with jump operators L_{dd'} = |d⟩⟨d'| and rates γ_{dd'} proportional to C(d,d').

The Lindblad operators are **diagonal in the gap basis**, so they cause pure dephasing (no population transfer). This is **phase damping** with rate:
```
γ_d = Σ_{d'≠d} γ_{dd'}
```

## 8.5 Entanglement Sudden Death and Revival

Under the dephasing master equation, entanglement between two gaps (e.g., d_n and d_{n+1}) exhibits **entanglement sudden death (ESD)** at finite time, followed by **revival** at Poincaré recurrence times.

For the two-gap state ρ_{12}(t), the concurrence C(t) evolves as:
```
C(t) = max{0, C(0) - Γt}  (for short times)
```
where Γ is the dephasing rate. ESD occurs at t_ESD = C(0)/Γ.

Revival occurs at t_rev = 2πℏ / gcd({E_d - E_{d'}}) — the Poincaré recurrence time for the finite Hilbert space.

## 8.6 Connection to A3-06 Decoherence From Gap Randomness

A3-06 will develop the full decoherence theory. Key points:
- Dephasing rate from gap correlation matrix
- DFSs from modular structure (mod 6, mod 30)
- ESD and revival timescales
- Connection to worldline proper time fluctuations (A1-08)
- Experimental signature: decoherence of electron wavepackets

## 8.7 Piece 08 Summary

- Free evolution: entanglement spectrum invariant, only phases evolve
- Open system: decoherence from tracing out gap history
- Dephasing master equation with Lindblad operators from gap correlations
- Twin prime sector = exact DFS (decoherence-free)
- Modular classes = approximate DFSs
- Entanglement sudden death and Poincaré revival
- Foundation for A3-06: full decoherence theory

**References**: A3-02 (Time Evolution), A3-03 (Tensor Structure), A3-04 (Piece 08: Modular Structure), A1-08 (Proper Time Fluctuation Spectrum), A3-06 (Decoherence From Gap Randomness - future)