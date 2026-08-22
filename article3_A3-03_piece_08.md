# A3-03 Prime_Difference_Basis.md — Piece 08: The Prime Difference Basis and Symmetry Groups

## 8.1 Symmetry Groups Acting on the Basis

The prime difference basis {|d⟩} carries representations of several symmetry groups arising from the arithmetic structure of prime gaps.

### 8.1.1 Cyclic Group ℤ₂₅₆
The most basic symmetry is translation modulo 256:
```
T_a |d⟩ = |d + a mod 256⟩,  a ∈ ℤ₂₅₆
```
This is the regular representation of ℤ₂₅₆. The Fourier basis {|k⟩} diagonalizes this action:
```
T_a |k⟩ = e^{2πi k a / 256} |k⟩
```

### 8.1.2 Affine Group AGL(1, 256)
Gaps transform under affine transformations d ↦ a·d + b (mod 256) for a ∈ (ℤ/256ℤ)×, b ∈ ℤ/256ℤ. This group has order φ(256)·256 = 128·256 = 32,768.

The physically relevant subgroup preserves the gap structure (even gaps only):
```
a ∈ {1, 3, 5, ..., 255} (odd multipliers)
b ∈ {0, 2, 4, ..., 254} (even shifts)
```

### 8.1.3 Modular Group Actions
For each divisor m of 256, the reduction mod m gives a homomorphism:
```
π_m: ℤ₂₅₆ → ℤ_m
```
The kernel is mℤ₂₅₆ ≅ ℤ_{256/m}. The prime gap distribution is approximately invariant under:
- π_2: parity (all gaps even → trivial)
- π_4: twin/cousin classification
- π_6: sexy prime structure (not a divisor of 256, but physically fundamental)
- π_8, π_16, π_32: finer constellation structure

## 8.2 The Twin Prime Symmetry

The twin prime gap d=2 has a special symmetry: it is the unique gap with p(d) = 0.5. The stabilizer subgroup of |2⟩ in ℤ₂₅₆ is:
```
Stab(2) = {a ∈ ℤ₂₅₆ : a·2 ≡ 2 mod 256} = {1, 129}
```
of order 2. This ℤ₂ symmetry corresponds to the forward/backward time symmetry of the electron worldline (A1-07).

## 8.3 Record Gap Symmetry

The set of record gaps R = {2, 4, 6, 8, 10, 14, 18, 20, 22, 26, ...} is not invariant under any nontrivial translation. However, it has approximate scaling symmetry:
```
d ∈ R  ⇒  λ·d ≈ d' ∈ R  for λ ≈ 1.5, 2.0, 2.5, ...
```
This reflects the logarithmic spacing of record gaps: log d_k ~ k.

## 8.4 Galois Symmetry of the Basis

The 256th cyclotomic field ℚ(ζ₂₅₆) has Galois group (ℤ/256ℤ)× ≅ ℤ₂ × ℤ₆₄. The action on the Fourier basis:
```
σ_a |k⟩ = |a·k mod 256⟩,  a ∈ (ℤ/256ℤ)×
```
This Galois symmetry permutes the momentum modes. The prime gap power spectrum |⟨k|ψ⟩|² is invariant under the subgroup fixing the physically relevant modes (k = 0, 42, 43, 64, 128, ...).

## 8.5 SU(2) Subgroups from Bitwise Structure

The bitwise decomposition ℋ = (ℂ²)^{⊗8} carries a natural SU(2) action on each qubit:
```
U_i(θ, φ, ψ) ∈ SU(2) acting on bit i
```
The total SU(2)^{⊗8} acts on the full space. The physically relevant subgroup is the diagonal SU(2) acting identically on all bits:
```
U(θ, φ, ψ)^{⊗8} = exp(-i θ Σ_i σ_i·n / 2)
```
This generates collective rotations of the gap bit-string. The twin prime state |2⟩ = |01000000⟩ is a Dicke state with one excitation.

## 8.6 Clifford Group and Stabilizer Formalism

The 8-bit space supports the 8-qubit Clifford group C₈ (normalizer of the Pauli group P₈ in U(256)). The twin prime state |2⟩ is a stabilizer state:
```
Stab(|2⟩) = ⟨Z₁, Z₂, ..., Z₇, -X₁⟩
```
where X_i, Z_i are Pauli operators on qubit i. The negative sign on X₁ reflects the excitation at bit 1.

The record gap states form a set of stabilizer states with specific syndromes. This connects to the quantum error correction in A1-35 and A3-08.

## 8.7 Conformal Symmetry and the Riemann Zeros

From A1-04, the Riemann zeros γₙ correspond to worldline resonance frequencies. The mapping d ↔ γ gives a conformal symmetry on the basis:

The 8-bit basis can be embedded in the Virasoro algebra representation with central charge c = 1 (free boson). The basis states |d⟩ correspond to vertex operators:
```
V_d(z) = :exp(i √(4π/d) φ(z)):
```
where φ is the free boson field. The conformal dimensions are h_d = d/2.

The modular invariant partition function on the torus:
```
Z(τ) = Tr(q^{L₀ - c/24}) = Σ_d q^{d/2} / η(τ)
```
where q = e^{2πi τ}. This reproduces the gap generating function.

## 8.8 Piece 08 Summary

- ℤ₂₅₆ translation symmetry (Fourier diagonal)
- AGL(1,256) affine symmetry (reduced to physical subgroup)
- Modular group actions for m | 256
- Twin prime ℤ₂ stabilizer (time reversal)
- Record gap approximate scaling symmetry
- Galois group (ℤ/256ℤ)× on Fourier modes
- SU(2)^{⊗8} from bitwise structure
- Clifford group: twin prime = stabilizer state
- Conformal embedding: c=1 CFT, vertex operators V_d

**References**: A1-04 (Riemann Zeros), A1-07 (Pair Creation), A1-35 (QEC), A3-04 (Unitarity), A3-09 (Bell Inequalities)