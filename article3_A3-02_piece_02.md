# A3-02 Time Evolution Operator — Piece 02: Spectral Properties and Quasi-Periodicity

## 2.1 Spectrum of the Hamiltonian

The Hamiltonian Ĥ = Σ_{k=1}^{255} (ℏ/(κ·k)) |k⟩⟨k| has eigenvalues:

```
E_k = ℏ/(κ·k)  for k = 1, 2, ..., 255
E_0 = ∞  (or UV cutoff Λ_UV)
```

The spectrum is purely discrete with 255 finite eigenvalues. The eigenvalue spacing:

```
ΔE_{k,k+1} = E_k - E_{k+1} = ℏ/κ (1/k - 1/(k+1)) = ℏ/(κ·k·(k+1))
```

For small k (low energy), spacing is large. For large k (high energy), spacing decreases as ~1/k².

## 2.2 Frequencies and Incommensurability

The time evolution frequencies are:

```
ω_k = E_k/ℏ = 1/(κ·k)  for k = 1, ..., 255
```

These frequencies are **incommensurate** — no nontrivial integer relation Σ n_k ω_k = 0 exists because {1/k} are rationally independent. This means:

1. **No exact period**: U(t) ≠ I for any finite t > 0
2. **Quasi-periodic motion**: The state explores a dense subset of the torus T²⁵⁵
3. **Ergodicity**: Time averages = ensemble averages for almost all initial states

The frequency ratios ω_k/ω_j = j/k are rational, but the set {ω_k} as a whole is incommensurate (no single base frequency).

## 2.3 Quasi-Periodicity and Almost Periodic Functions

Each matrix element U_{kk'}(t) = δ_{kk'} e^{-iω_k t} is an almost periodic function (Bohr). The full operator U(t) is an almost periodic operator-valued function. The mean motion is:

```
M[U(t)] = lim_{T→∞} (1/T) ∫_0^T U(t) dt = |0⟩⟨0|
```

since all oscillatory terms average to zero. The only non-oscillating component is the frozen |0⟩ state.

## 2.4 Recurrence Time

The Poincaré recurrence time for a finite-dimensional quantum system is bounded by:

```
T_rec ~ 2π / gcd({ω_k})
```

But since gcd({1/k}) = 0 (no common divisor), the recurrence time is effectively infinite. More precisely, for any ε > 0, there exists T such that ||U(T) - I|| < ε, with:

```
T_ε ~ exp(C · 256 / ε)
```

This is exponentially large in the dimension, making recurrence physically irrelevant.

## 2.5 Connection to Number Theory

The frequencies ω_k = 1/(κ·k) are intimately connected to the harmonic series and the Riemann zeta function:

```
Σ_{k=1}^∞ ω_k = (1/κ) Σ_{k=1}^∞ 1/k  (diverges)
Σ_{k=1}^∞ ω_k^s = (1/κ^s) ζ(s)
```

The truncated sums for k ≤ 255 approximate the zeta function values. The energy levels E_k = ℏω_k are the "prime gap energy spectrum" — a number-theoretic spectrum with deep connections to analytic number theory.