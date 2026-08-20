# ARTICLE 1: Prime Electron Worldline Topology — A1-03 (Piece 04)

## 4. 8-BIT ARRAY AS SPINOR HILBERT SPACE

### 4.1 256 States = 2 × 128

The readme: "8 Bit Array Required" → 2^8 = 256 states.

This decomposes as: 256 = 2 (spinor components) × 128 (phase states)

The spinor space: ℋ = ℂ^2 ⊗ ℂ^{128}

### 4.2 Pauli Matrices in Prime Basis

In the prime gap basis |d⟩, d ∈ {0,...,255}:

σ_z = Σ_d (-1)^d |d⟩⟨d|

σ_x = Σ_d |d⊕1⟩⟨d|

σ_y = -i Σ_d (-1)^d |d⊕1⟩⟨d|

where ⊕ is XOR (addition mod 256).

### 4.3 Spin Operator from Gap Sequence

The spin operator S = (ℏ/2) σ acts on the gap sequence.

Expectation value in state |d⟩:

⟨d|S_z|d⟩ = (ℏ/2) (-1)^d

Even gaps (d=2,4,6...): spin up (+ℏ/2)
Odd gaps (d=1,3,5...): spin down (-ℏ/2)

In directory 0.0, most gaps are even → predominantly spin-up states.