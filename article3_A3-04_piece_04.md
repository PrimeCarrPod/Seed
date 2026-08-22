# A3-04 Unitarity_From_Prime_Distribution.md — Piece 04: Time Evolution Unitarity and the Hamiltonian Spectrum

## 4.1 The Time Evolution Operator

From A3-02, the time evolution operator is:
```
U(t) = exp(-iĤt/ℏ) = Σ_{d=1}^{255} e^{-iE_d t/ℏ} |d⟩⟨d|
```
with E_d = ℏ/(κd) for d ≥ 1, E_0 = 0.

This operator is **manifestly unitary** for all real t because:
- E_d are real (d positive integers)
- U(t) is diagonal with phases of unit modulus
- U†(t)U(t) = Σ e^{iE_d t/ℏ} e^{-iE_d t/ℏ} |d⟩⟨d| = I

## 4.2 Reality of the Hamiltonian Spectrum

The reality of E_d = ℏ/(κd) follows from:
1. **Prime gaps are positive integers**: d_n = p_{n+1} - p_n ≥ 2 for n ≥ 2
2. **κ = 193.6 MeV⁻¹** is real (from A2-02 electron mass fit)
3. **ℏ** is real

There are no complex energies, no dissipative terms, no non-Hermitian parts. The Hamiltonian is purely Hermitian:
```
Ĥ = Ĥ† = (ℏ/κ) Σ_{d=1}^{255} d⁻¹ |d⟩⟨d|
```

## 4.3 Spectral Properties and Unitarity

### 4.3.1 Spectrum
The energy spectrum is:
```
Spec(Ĥ) = {0, ℏ/(κ·2), ℏ/(κ·4), ℏ/(κ·6), ..., ℏ/(κ·254)}
```
with degeneracies from multiple gaps mapping to same d mod 256.

### 4.3.2 Gap Between Ground State and Continuum
The electron ground state (d=2) has energy E_2 = ℏ/(2κ) = 0.511 MeV. The first excited state (d=4) has E_4 = E_2/2 = 0.2555 MeV. The gap ΔE = E_2 - E_4 = 0.2555 MeV.

This gap protects unitarity: no decay channels exist below the muon threshold.

### 4.3.3 Density of States
The density of energy states:
```
ρ(E) = Σ_d δ(E - E_d) ≈ (ℏ/κ) E⁻² for E ≪ ℏ/κ
```
This 1/E² divergence at low E is integrable: ∫_0^{E_max} E⁻² dE converges at the upper limit. The total number of states is 256, finite.

## 4.4 Time Evolution of the Prime State

The prime state |Ψ_prime⟩ = Σ √p(d) |d⟩ evolves as:
```
|Ψ(t)⟩ = U(t)|Ψ_prime⟩ = Σ_d √p(d) e^{-iE_d t/ℏ} |d⟩
```

The survival amplitude:
```
A(t) = ⟨Ψ_prime|Ψ(t)⟩ = Σ_d p(d) e^{-iE_d t/ℏ}
```

The survival probability:
```
P(t) = |A(t)|² = Σ_{d,d'} √p(d)p(d') e^{-i(E_d - E_{d'})t/ℏ}
```

For large t, P(t) → Σ_d p(d)² = purity ≈ 0.064 (A3-03, Piece 10). The decay from 1 to 0.064 is the **quantum Poincaré recurrence** in the finite 256-dimensional space.

## 4.5 Unitarity at the UV Boundary (Directory 3.0)

At the UV completion (PrimeBookOne directory 3.0, d_max = 1476, 11 bits), the Hamiltonian extends to:
```
Ĥ_UV = (ℏ/κ) Σ_{d=1}^{1476} d⁻¹ |d⟩⟨d|
```

The 8-bit theory is the IR effective theory obtained by projecting out d > 255:
```
Ĥ_IR = P_{≤255} Ĥ_UV P_{≤255}
```
where P_{≤255} = Σ_{d=0}^{255} |d⟩⟨d|.

This projection preserves unitarity **if and only if** the high-energy states (d > 255) are decoupled. From A1-36 (Decoupling Limits), heavy gaps d > 255 decouple as EFT with suppression factor (256/d)². The error in unitarity is O((256/1476)²) ≈ 0.03.

## 4.6 The Unitarity Bound on Couplings

From the Hamiltonian spectrum, we can derive unitarity bounds on effective couplings. For a coupling g between modes d and d':
```
|g_{dd'}|² ≤ (E_d - E_{d'})² / (4π)
```
from partial wave unitarity. In the prime gap context, the "couplings" are the correlation matrix elements C_{dd'}, and this bound is satisfied because C_{dd'} ≤ √(C_{dd}C_{d'd'}) by Cauchy-Schwarz.

## 4.7 Piece 04 Summary

- U(t) = diag(e^{-iE_d t/ℏ}) manifestly unitary
- E_d = ℏ/(κd) real because d ∈ ℕ, κ ∈ ℝ
- Spectrum: discrete, finite (256 states), 1/E² density
- Electron ground state protected by gap to first excitation
- Poincaré recurrence in finite space: P(t) → purity ≈ 0.064
- UV completion at 11 bits: unitarity error O(0.03) from projection
- Unitarity bounds on couplings satisfied by Cauchy-Schwarz

**References**: A3-02 (Time Evolution), A3-03 (Piece 05 observables, Piece 11 continuum), A2-01 (Gap To Energy), A1-36 (Decoupling Limits)