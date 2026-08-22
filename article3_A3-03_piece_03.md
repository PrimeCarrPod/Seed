# A3-03 Prime_Difference_Basis.md — Piece 03: The Prime Difference Basis Vectors

## 3.1 Explicit Basis Vector Construction

Each basis vector |d⟩ ∈ ℋ corresponds to a specific residue class modulo 256. We construct them explicitly as standard basis vectors in ℂ²⁵⁶:

```
|d⟩ = (0, ..., 0, 1, 0, ..., 0)ᵀ  with 1 at position d (0-indexed)
```

For d = 0, 1, ..., 255. The inner product is the standard Hermitian inner product:

```
⟨d|d'⟩ = δ_{d,d'}
```

## 3.2 Prime-Weighted Basis

The physical states are not uniformly distributed. We define the **prime-weighted basis**:

```
|d⟩_p = √p(d) |d⟩
```

where p(d) is the empirical probability from PrimeBookOne. These satisfy:

```
_p⟨d|d'⟩_p = p(d) δ_{d,d'}
```

The completeness relation becomes:

```
Σ_d |d⟩_p _p⟨d| = Σ_d p(d) |d⟩⟨d| = ρ_diag
```

where ρ_diag is the diagonal density matrix of the gap distribution.

## 3.3 Fourier Basis on ℤ₂₅₆

The discrete Fourier transform on the cyclic group ℤ₂₅₆ provides the momentum basis:

```
|k⟩ = (1/√256) Σ_{d=0}^{255} e^{2πi k d / 256} |d⟩
```

for k = 0, 1, ..., 255. The inverse transform:

```
|d⟩ = (1/√256) Σ_{k=0}^{255} e^{-2πi k d / 256} |k⟩
```

This is the unitary matrix F_{dk} = (1/√256) e^{2πi k d / 256}.

## 3.4 Physical Meaning of Fourier Modes

|k⟩ corresponds to periodicity in the gap sequence with wavelength 256/k:

- **k = 0**: Uniform mode — total gap count (DC component)
- **k = 128**: Alternating mode — period 2 (even/odd, captures d=2 dominance)
- **k = 64**: Period 4 — cousin/twin prime oscillation
- **k = 42, 43**: Period ~6 — sexy prime resonance (strongest peak)
- **k = 8, 9**: Period 32 — PrimeBookOne tile periodicity
- **k = 255**: Highest frequency — noise floor

The power spectrum |⟨k|ψ⟩|² for the gap distribution state |ψ⟩ = Σ_d √p(d) |d⟩ reveals the dominant periodicities in prime gaps.

## 3.5 Walsh-Hadamard Basis (Bitwise Fourier)

For the 8-bit structure, the Walsh-Hadamard basis is more natural:

```
|w⟩_H = (1/√256) Σ_{d=0}^{255} (-1)^{w·d} |d⟩
```

where w·d = Σ_{i=0}^{7} w_i d_i (mod 2) is the bitwise dot product, w, d ∈ {0,1}⁸.

This basis diagonalizes the bitwise XOR convolution relevant for gap correlations. The 256 Walsh functions correspond to the characters of the group (ℤ₂)⁸.

## 3.6 Basis for the Twin Prime Subspace

The twin prime gap d=2 has special status (p(2) = 0.5). We define the projector onto the twin prime subspace:

```
P_twin = |2⟩⟨2|
```

And the orthogonal complement:

```
P_rest = I - P_twin = Σ_{d≠2} |d⟩⟨d|
```

The electron ground state (A1-03, A2-02) lives in the twin prime subspace.

## 3.7 Record Gap Projectors

From A2-03, record gaps are d ∈ {2, 4, 6, 8, 10, 14, 18, 20, 22, 26, 28, 30, ...}. We define:

```
P_record = Σ_{d ∈ record gaps} |d⟩⟨d|
P_nonrecord = I - P_record
```

These projectors separate the mass-generating sector (record gaps) from the excitation continuum.

## 3.8 Piece 03 Summary

- Standard basis {|d⟩}, prime-weighted basis {|d⟩_p}
- Fourier basis {|k⟩} for periodicity analysis
- Walsh-Hadamard basis {|w⟩_H} for bitwise structure
- Projectors: P_twin, P_record for physical sectors
- All bases related by unitary transformations

**References**: A2-02 (Twin Prime Electron Mass), A2-03 (Record Gaps), A3-04 (Unitarity), A3-09 (Bell Inequalities)