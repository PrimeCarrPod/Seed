# A3-02 Time Evolution Operator — Piece 03: Time Evolution in the Qubit Basis

## 3.1 Hamiltonian in the 8-Qubit Tensor Product

From A3-01, ℋ ≅ (ℂ²)⊗⁸ with basis |k⟩ = |b₇b₆b₅b₄b₃b₂b₁b₀⟩ where k = Σ b_i 2^i. The Hamiltonian is diagonal in the computational basis:

```
Ĥ = Σ_{b∈{0,1}⁸} E(b) |b⟩⟨b|
```

where E(b) = ℏ/(κ·k(b)) with k(b) = Σ b_i 2^i, and E(0) = ∞ for the all-zero state.

## 3.2 Qubit-Local Terms and Interactions

The Hamiltonian can be expanded in Pauli operators. For a single qubit i:

```
Ĥ_i = E_i |1⟩⟨1|_i ⊗ I_{j≠i}
```

But this is not simply a sum of single-qubit terms because E(k) = ℏ/(κ·k) is a nonlinear function of the bits. The full expansion:

```
Ĥ = Σ_{S⊆{0..7}} c_S Π_{i∈S} Z_i
```

where Z_i = |0⟩⟨0|_i - |1⟩⟨1|_i are Pauli-Z operators, and the coefficients c_S are determined by the values of E(k). This is a **k-local Hamiltonian** with k up to 8 — all qubits interact.

## 3.3 Explicit Expansion for Small Number of Qubits

For 2 qubits (k = 0,1,2,3):
```
Ĥ = c_∅ I + c_{0} Z_0 + c_{1} Z_1 + c_{01} Z_0 Z_1
```
with coefficients determined by E(0), E(1), E(2), E(3).

For the full 8 qubits, there are 2⁸ = 256 coefficients. The interaction graph is a complete hypergraph — every subset of qubits has a non-zero coupling.

## 3.4 Time Evolution as Quantum Circuit

The time evolution U(t) = exp(-iĤt/ℏ) can be implemented as a quantum circuit. Since Ĥ is diagonal in the computational basis, U(t) is also diagonal:

```
U(t) = Σ_b e^{-i E(b) t/ℏ} |b⟩⟨b|
```

This is a **diagonal unitary** — it only applies phases to computational basis states. In the quantum circuit model, this requires:
- 255 controlled-phase gates (one for each non-zero basis state)
- Or equivalently, a phase oracle that computes the function f(b) = E(b)t/ℏ

The circuit depth is O(256) for exact implementation, but can be approximated using the structure of E(k) = 1/k.

## 3.5 Approximate Time Evolution via Trotterization

Since Ĥ is not a sum of commuting local terms (it's already diagonal), Trotterization is not needed — the evolution is exactly diagonal. However, if we decompose Ĥ into the Pauli expansion:

```
Ĥ = Σ_S c_S Π_{i∈S} Z_i
```

The terms [Π_{i∈S} Z_i, Π_{j∈T} Z_j] = 0 for all S, T because all Z_i commute. Therefore the time evolution **factorizes exactly**:

```
U(t) = Π_S exp(-i c_S t Π_{i∈S} Z_i)
```

Each factor is a multi-qubit phase gate. This factorization is exact, not approximate.

## 3.6 Physical Interpretation: Qubit Phases from Gap Residues

The phase accumulated by qubit i over time t is not independent — it's entangled with other qubits through the function k(b) = Σ b_i 2^i. The phase for basis state |b⟩ is:

```
φ(b) = -t/(κ·k(b))
```

This means the "energy" of a computational basis state is determined by the integer value of its bits. This is a concrete realization of the idea that **quantum mechanics emerges from arithmetic**: the prime gap residue k determines the energy, and the binary expansion of k determines the qubit state.