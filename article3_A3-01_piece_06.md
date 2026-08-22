# A3-01 Hilbert Space Dimension 256 — Piece 06: Symmetry Structure and Group Actions

## 6.1 The Symmetry Group of the 256-Dimensional Space

The Hilbert space ℋ = ℂ²⁵⁶ carries natural group actions arising from the arithmetic structure of prime gaps modulo 256. The full symmetry group is:

```
G = (ℤ/256ℤ) ⋊ (ℤ/256ℤ)ˣ
```

the affine group of the ring ℤ/256ℤ. This group acts on basis states as:

```
|k⟩ ↦ |a·k + b mod 256⟩
```

for a ∈ (ℤ/256ℤ)ˣ (units modulo 256, i.e., odd numbers 1, 3, 5, ..., 255) and b ∈ ℤ/256ℤ. The group order is:

```
|G| = φ(256) · 256 = 128 · 256 = 32,768
```

## 6.2 Physical Subgroups

Not all of G is a physical symmetry. The prime gap distribution breaks most of G. The unbroken physical symmetries are:

1. **Translation by even numbers**: b ∈ 2ℤ/256ℤ. Since all gaps > 2 are even, the distribution is invariant under k ↦ k + 2b (mod 256) for the even subspace.

2. **Multiplication by units ≡ 1 (mod 4)**: a ∈ {1, 5, 9, ..., 253}. These preserve the 2-adic valuation structure.

3. **Complex conjugation**: |k⟩ ↦ |-k mod 256⟩. Corresponds to time reversal on the worldline (A1-07).

The unbroken subgroup has order:

```
|G_phys| = 64 · 128 = 8,192
```

## 6.3 Representation Theory and Particle Multiplets

The physical states transform under representations of G_phys. The charged leptons (from record gaps d = 2, 4, 6) form a 3-dimensional representation:

```
e⁻ : |2⟩
μ⁻ : |4⟩
τ⁻ : |6⟩
```

These are the lowest-weight states of the representation. The BSM leptons (d = 8, 10, 14, 18, 20, 22, ...) fill out higher states in the same representation.

The neutrinos correspond to gap asymmetry states (A2-09), which live in the *dual* representation space.

## 6.4 Connection to Gauge Symmetries (Article 6)

The group G_phys contains subgroups isomorphic to the Standard Model gauge groups:

- U(1)_em: phase rotations on each qubit (8 copies)
- SU(2)_L: acts on qubits 1-2 (twin/cousin prime subspace)
- SU(3)_c: acts on qubits 3-5 (color subspace from 8 = 2³)

This is not a coincidence — the gauge symmetries *emerge* from the arithmetic symmetries of the prime gap residues. Article 6 (A6-01 through A6-40) will derive the full gauge boson spectrum from these symmetries.

## 6.5 Anomalies and the Index Theorem (A1-24)

The anomaly inflow mechanism of Article 1 (A1-23) relates to the index of the Dirac operator on the 256-dimensional space. The index is:

```
Index = Σ_{k=0}^{255} sign(d_k) = (number of odd residues) - (number of even residues with sign) = 128 - 128 = 0
```

for the full space. However, the physical subspace has nonzero index, matching the chiral fermion content of the Standard Model. This is the prime gap realization of the Atiyah-Singer index theorem.