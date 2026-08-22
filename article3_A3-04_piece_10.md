# A3-04 Unitarity_From_Prime_Distribution.md — Piece 10: The Optical Theorem and Cutkosky Rules from Prime Gaps

## 10.1 The Optical Theorem in the Prime Gap Framework

The optical theorem is a direct consequence of S-matrix unitarity: S†S = I. In the prime gap context, the S-matrix is the transition matrix for gap sequences, and the optical theorem relates the forward scattering amplitude to the total cross-section.

### 10.1.1 Forward Scattering Amplitude
For an incoming gap d, the forward amplitude is:
```
f(d → d) = S_{dd} - 1 = e^{-iE_d T/ℏ} - 1
```
in the diagonal (energy) basis. In the gap basis, the forward amplitude includes contributions from all paths that start and end at d.

### 10.1.2 Total Cross-Section
The total cross-section for gap d is:
```
σ_tot(d) = Σ_{d'≠d} |S_{dd'}|²
```
The optical theorem states:
```
Im f(d → d) = (1/2) σ_tot(d)
```

### 10.1.3 Verification from Prime Statistics
From the correlation matrix C_{dd'} = p(d,d') - p(d)p(d') (A3-03, Piece 04):
```
σ_tot(d) = Σ_{d'≠d} C_{dd'} / p(d) + O(1/N)
Im f(d → d) = (1/2) Σ_{d'≠d} C_{dd'} / p(d) + O(1/N)
```
The equality holds because C is Hermitian (C = C†), which follows from p(d,d') = p(d',d) (detailed balance).

## 10.2 Cutkosky Rules and Prime Gap Discontinuities

The Cutkosky cutting rules compute the discontinuity of S-matrix elements across branch cuts. In the prime gap theory, the S-matrix has poles at E = E_d = ℏ/(κd). The discontinuity across the real axis:
```
Disc S(E) = S(E + iε) - S(E - iε) = 2πi Σ_d |d⟩⟨d| δ(E - E_d)
```

### 10.2.1 Cutting the Gap Sequence
A "cut" through the gap sequence corresponds to separating the sequence into two parts at some step n:
```
... d_{n-1}, d_n | d_{n+1}, d_{n+2} ...
```
The cut propagators are the gap basis projectors |d⟩⟨d|. The sum over all intermediate gaps d_n gives the discontinuity.

### 10.2.2 Prime Gap Spectral Function
The spectral function ρ(E) = Σ_d δ(E - E_d) |d⟩⟨d| is exactly the density of states. The Cutkosky rules give:
```
Im S(E) = π ρ(E)
```
which is the optical theorem in spectral form.

## 10.3 Dispersion Relations for Prime Gap Amplitudes

The S-matrix elements as functions of energy satisfy dispersion relations. For the forward amplitude f(d → d; E):
```
Re f(E) = (1/π) P ∫_0^∞ Im f(E') / (E' - E) dE'
```
where P denotes principal value.

### 10.3.1 Prime Gap Dispersion Integral
Using Im f(E) = (π/2) ρ(E) from the optical theorem:
```
Re f(E) = (1/2) P ∫_0^∞ ρ(E') / (E' - E) dE'
```
The integral is dominated by the poles at E_d = ℏ/(κd). This gives the real part of the forward amplitude in terms of the gap density of states.

### 10.3.2 Subtraction Constants and the Electron Mass
The dispersion integral requires a subtraction constant, which is fixed by the electron mass (d=2):
```
f(E=0) = -1 = (1/2) ∫_0^∞ ρ(E') / E' dE' + f_sub
```
The subtraction constant f_sub is related to the electron mass E_2 = ℏ/(2κ). This is the **Ward identity** for the prime gap theory.

## 10.4 Unitarity Bounds on Partial Waves

Expanding the S-matrix in partial waves (angular momentum basis on the 8-bit space):
```
S_{dd'} = Σ_J (2J+1) a_J(E) P_J(cos θ_{dd'})
```
where θ_{dd'} is the correlation angle (A3-03, Piece 04).

### 10.4.1 Partial Wave Unitarity
The unitarity bound on partial wave amplitudes:
```
|a_J(E)| ≤ 1
```
For the prime gap S-matrix, the partial wave expansion corresponds to expanding the correlation matrix C_{dd'} in the eigenbasis of the Laplacian on the 8-bit hypercube.

### 10.4.2 Saturation at the Twin Prime Pole
The J=0 partial wave (s-wave) is dominated by the twin prime pole at E_2. The amplitude:
```
a_0(E) ≈ (E - E_2)^{-1}
```
saturates the unitarity bound at the pole: |a_0(E_2)| → ∞ (resonance). This is the **electron as a unitarity-saturating resonance**.

## 10.5 Froissart Bound and the Prime Gap Theory

The Froissart bound states that the total cross-section grows at most as log² E at high energy:
```
σ_tot(E) ≤ C log² E
```

In the prime gap theory, the "high energy" limit corresponds to small gaps (E ∝ 1/d). The total cross-section for gap d:
```
σ_tot(d) = Σ_{d'≠d} C_{dd'} / p(d)
```
For small d (large E), the correlation matrix elements C_{dd'} are small (correlation length ξ ≈ 1.7 means decorrelation after ~2 steps). The total cross-section is bounded by a constant, well below the Froissart bound.

At low energy (large d), the gaps are sparse and the cross-section vanishes. The Froissart bound is trivially satisfied.

## 10.6 The Optical Theorem for Inelastic Channels

From A3-03 (Piece 07) and A2-15/20, the missing gaps (d=12, 18, 24, ...) act as inelastic channels. The generalized optical theorem:
```
Im S_{dd} = (1/2) Σ_{d'} |S_{dd'}|² + (1/2) Σ_{α} |S_{dα}|²
```
where α labels inelastic channels (missing gaps, BSM states).

The inelastic cross-section:
```
σ_inel(d) = Σ_α |S_{dα}|²
```
is precisely the probability of transitioning to a missing gap. From PrimeBookOne, this is:
```
σ_inel(d) ≈ Σ_{missing d'} p(d' | d) / p(d)
```
which is small (~10⁻³) for physical gaps but grows near the UV boundary.

## 10.7 Piece 10 Summary

- Optical theorem: Im f(d→d) = (1/2) Σ_{d'≠d} |S_{dd'}|²
- Verified from Hermitian correlation matrix C = C†
- Cutkosky rules: cuts through gap sequence give spectral function ρ(E)
- Dispersion relations: Re f(E) = (1/π) P ∫ Im f(E')/(E'-E) dE'
- Subtraction constant fixed by electron mass (Ward identity)
- Partial wave unitarity |a_J| ≤ 1; J=0 saturates at twin prime pole
- Froissart bound trivially satisfied (constant cross-section)
- Inelastic channels from missing gaps → generalized optical theorem

**References**: A3-03 (Piece 04 correlation matrix), A3-03 (Piece 11 continuum), A2-01 (Gap To Energy), A2-15 (Dark Matter), A2-20 (Sterile Neutrinos), A1-36 (Decoupling)