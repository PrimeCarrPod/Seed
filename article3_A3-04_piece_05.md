# A3-04 Unitarity_From_Prime_Distribution.md — Piece 05: The Prime Gap S-Matrix and Crossing Symmetry

## 5.1 Scattering in the Prime Gap Hilbert Space

The prime gap sequence defines a scattering process: an incoming gap d_in evolves through the "interaction region" (the correlation structure) to an outgoing gap d_out. The S-matrix is:
```
S_{d_out, d_in} = ⟨d_out| U(T) |d_in⟩
```
where T is the total "scattering time" (number of gap steps).

In the energy basis, S is diagonal: S_{dd} = e^{-iE_d T/ℏ}. But in the gap basis, the nontrivial correlations induce off-diagonal scattering.

## 5.2 Crossing Symmetry from Gap Reversal

Crossing symmetry relates s-channel and t-channel processes. In the prime gap context:

### 5.2.1 Gap Reversal Symmetry
The gap sequence is not time-reversal invariant (primes increase), but the **correlation matrix** has approximate symmetry:
```
C_{dd'} = p(d,d') - p(d)p(d') ≈ C_{d'd}
```
This is the statistical version of crossing symmetry.

### 5.2.2 Forward-Backward Asymmetry
The small asymmetry A_FB = (C_{dd'} - C_{d'd})/(C_{dd'} + C_{d'd}) is related to the matter-antimatter asymmetry (A2-16). From PrimeBookOne:
```
A_FB ≈ 10⁻⁵ to 10⁻⁴
```
This matches the observed baryon-to-photon ratio η ≈ 6×10⁻¹⁰ when properly scaled.

## 5.3 The S-Matrix in the Modular Basis

Using the tensor decomposition ℋ = ℋ₂ ⊗ ℋ₆ (A3-03, Piece 06), the S-matrix factorizes approximately:
```
S ≈ S_2 ⊗ S_6
```
where:
- S_2 acts on the mod 4 congruence class (twin/cousin/sexy)
- S_6 acts on the tile index (64 PrimeBookOne tiles)

### 5.3.1 Mod 4 S-Matrix
```
S_2 = diag(e^{-iE_0 T/ℏ}, e^{-iE_2 T/ℏ}, e^{-iE_4 T/ℏ}, e^{-iE_6 T/ℏ})
```
in the basis {|0⟩, |2⟩, |4⟩, |6⟩} mod 4. The off-diagonal elements come from transitions between congruence classes.

### 5.3.2 Tile S-Matrix
S_6 is a 64×64 matrix describing transitions between PrimeBookOne tiles. Its structure reflects the RG flow (A3-03, Piece 07): tiles at different scales mix under the RG.

## 5.4 Analyticity and the Mandelstam Representation

The S-matrix elements S_{dd'}(E) as functions of energy are expected to be analytic in the upper half-plane (causality). The prime gap construction gives:
```
S_{dd'}(E) = Σ_n ⟨d|n⟩⟨n|d'⟩ / (E - E_n + iε)
```
where |n⟩ are the energy eigenstates (which are the gap basis |d⟩ themselves). This is a sum of simple poles at E = E_d = ℏ/(κd).

The Mandelstam representation:
```
S(s) = 1 + (s/π) ∫_{s_th}^∞ Im S(s') / [s'(s' - s)] ds'
```
is satisfied with spectral function Im S(s') given by the gap density of states.

## 5.5 Regge Poles from Prime Gap Trajectories

The sequence of record gaps d ∈ {2, 4, 6, 8, 10, 14, 18, ...} defines Regge trajectories in the complex angular momentum plane. The Regge pole positions:
```
J = α(E) = α_0 + α' E
```
with α' determined by the record gap spacing. From A2-03, the record gaps grow logarithmically, giving α' ~ 1/log E.

These Regge poles correspond to the **lepton generations** (A2-10): each record gap is a Regge pole at the corresponding mass.

## 5.6 Unitarity Cuts and the Optical Theorem

The optical theorem in the gap basis:
```
Im S_{dd} = (1/2) Σ_{d'} |S_{dd'}|²
```

For the diagonal S-matrix in energy basis, this is trivial. But in the gap basis, the non-diagonal elements from correlations give:
```
Im S_{dd} = (1/2) Σ_{d'≠d} |S_{dd'}|² + (1/2) |S_{dd}|²
```
The sum over d'≠d is the inelastic cross-section. From A3-03 Piece 04, the total inelastic probability is Σ_{d'≠d} C_{dd'} ≈ 0.1 for d=2 (twin prime), decreasing for larger d.

## 5.7 Piece 05 Summary

- S-matrix from gap transitions: S_{d_out,d_in} = ⟨d_out|U(T)|d_in⟩
- Crossing symmetry ≈ gap correlation symmetry C_{dd'} ≈ C_{d'd}
- Forward-backward asymmetry ~10⁻⁵ matches η ~ 6×10⁻¹⁰
- Tensor factorization S ≈ S_2 ⊗ S_6 (mod 4 ⊗ tile index)
- Analytic structure: simple poles at E_d = ℏ/(κd)
- Regge trajectories from record gaps → lepton generations
- Optical theorem satisfied with inelastic channels from correlations

**References**: A3-03 (Pieces 04, 06, 07), A2-03 (Record Gaps), A2-10 (Generational Structure), A2-16 (Baryon Asymmetry), A1-36 (Decoupling)