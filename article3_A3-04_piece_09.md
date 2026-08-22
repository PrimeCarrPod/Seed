# A3-04 Unitarity_From_Prime_Distribution.md — Piece 09: Unitarity in the Walsh-Hadamard Basis and Bitwise Structure

## 9.1 The Walsh-Hadamard Basis Revisited

From A3-03 (Piece 03), the Walsh-Hadamard basis on the 8-bit space is:
```
|w⟩_H = (1/√256) Σ_{d=0}^{255} (-1)^{w·d} |d⟩
```
where w ∈ {0,1}⁸, w·d = Σ_i w_i d_i (mod 2). This basis diagonalizes the bitwise XOR convolution.

The Hadamard transform matrix H_{dw} = (1/√256) (-1)^{w·d} satisfies H = H† = H⁻¹.

## 9.2 Prime Gap Distribution in the Walsh Basis

The prime state in the Walsh basis:
```
|Ψ_prime⟩ = Σ_w c_w |w⟩_H,  c_w = (1/√256) Σ_d √p(d) (-1)^{w·d}
```

The Walsh coefficients c_w are the **bitwise Fourier transform** of √p(d).

### 9.2.1 Key Walsh Coefficients
- w = 0 (00000000): c_0 = (1/√256) Σ √p(d) ≈ 0.248 (total amplitude)
- w = e_1 (00000010): c_{e_1} = (1/√256) Σ √p(d) (-1)^{d_1} — twin prime bit
- w = e_2 (00000100): c_{e_2} — mod 4 bit
- w = (00000110): c — mod 6 combination

The magnitude |c_w|² gives the "bitwise power spectrum."

## 9.3 Unitarity in the Walsh Basis

### 9.3.1 Diagonal Evolution
The time evolution operator U(t) = diag(e^{-iE_d t/ℏ}) in the computational basis becomes:
```
U_H(t) = H U(t) H†
```
in the Walsh basis. Since H is unitary, U_H(t) is unitary.

### 9.3.2 Walsh Representation of the Hamiltonian
The Hamiltonian in the Walsh basis:
```
Ĥ_H = H Ĥ H†
```
Since Ĥ is diagonal in the computational basis, Ĥ_H is a full matrix but remains Hermitian: Ĥ_H† = Ĥ_H.

### 9.3.3 Bitwise Conservation Laws
For each bit i, the Pauli-Z operator Z_i = |0⟩⟨0|_i - |1⟩⟨1|_i acts on the i-th qubit. The total bitwise magnetization:
```
M_i = ⟨Ψ| Z_i |Ψ⟩
```
is conserved under U(t) if [Z_i, Ĥ] = 0. But Ĥ is diagonal in the computational basis, which is the Z-basis, so [Z_i, Ĥ] = 0 exactly!

**All bitwise Z-operators are conserved charges.** This means the bitwise structure is preserved by time evolution.

## 9.4 The Twin Prime Bit and Unitarity

The second bit (d_1, weight 2) distinguishes twin primes (d_1=1 for d=2, 6, 10, 14, 18, 22, 26, 30, ...) from others.

The projector onto the twin prime bit subspace:
```
P_{twin-bit} = |1⟩⟨1|_1 ⊗ I_{2..8}
```
commutes with Ĥ. The twin prime state |2⟩ = |01000000⟩ has d_1=1 and all other bits 0.

The conservation of the twin prime bit means: **the twin prime sector is a superselection sector** — no unitary evolution can take a state with d_1=1 to one with d_1=0. This is the quantum version of the fact that prime gaps are always even (except d=2).

## 9.5 Bitwise Entanglement and Unitarity

From A3-03 (Piece 06), the bitwise entanglement entropy for bit i:
```
S_i = -p_i(0) log p_i(0) - p_i(1) log p_i(1)
```
where p_i(0), p_i(1) are the marginal probabilities for bit i.

The total bitwise entanglement:
```
S_bit = Σ_{i=0}^7 S_i
```
For a product state, S_bit = S_total. For the prime state, S_bit > S_total due to classical correlations between bits.

The unitarity of U(t) preserves the **quantum mutual information** between bits:
```
I(i:j) = S_i + S_j - S_{ij}
```
which measures the total (classical + quantum) correlations.

## 9.6 The Clifford Group and Unitary Designs

The 8-qubit Clifford group C₈ acts transitively on the set of stabilizer states. The twin prime state |2⟩ = |01000000⟩ is a stabilizer state with stabilizer:
```
Stab(|2⟩) = ⟨Z_0, Z_2, Z_3, Z_4, Z_5, Z_6, Z_7, -X_1⟩
```

The prime gap distribution p(d) defines a probability distribution on the 256 stabilizer states (computational basis). The **second moment** of this distribution:
```
M_2 = Σ_d p(d)² ≈ 0.064
```
is the purity. For a unitary 2-design, M_2 = 2/(256+1) ≈ 0.0078. The prime distribution is far from a 2-design (it's highly structured), which is why it encodes specific physics.

## 9.7 Piece 09 Summary

- Walsh-Hadamard basis: bitwise Fourier transform of gap distribution
- Walsh coefficients c_w = H_{dw} √p(d) — bitwise power spectrum
- U(t) unitary in Walsh basis: U_H = H U H†
- Hamiltonian Hermitian in Walsh basis: Ĥ_H = H Ĥ H†
- All bitwise Z-operators conserved: [Z_i, Ĥ] = 0
- Twin prime bit (d_1) is a superselection sector
- Bitwise entanglement S_i varies; mutual information I(i:j) preserved
- Stabilizer formalism: twin prime = stabilizer state, far from unitary 2-design

**References**: A3-03 (Pieces 03, 06, 08, 09), A1-35 (QEC), A3-08 (Error Correction)