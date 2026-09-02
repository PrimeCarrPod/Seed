# ARTICLE 1: Prime Electron Worldline Topology — A1-03 (Piece 06)

## 6. SPIN-STATISTICS FROM GAP PARITY

### 6.1 Fermionic Nature

The electron is a fermion: obeys Pauli exclusion, wavefunction antisymmetric under exchange.

### 6.2 Gap Parity and Statistics

Prime gaps have parity: even (2, 4, 6, ...) and odd (1, 3, 5, ...).

- Even gaps: symmetric under exchange → bosonic character
- Odd gaps: antisymmetric under exchange → fermionic character

The readme starts with "Begin with 5" — the first prime gap after d_1=1 is d_2=2 (even).

But the factor of 2 in recurrence makes all generated gaps even:

d_{k+1} = d_k + 2·a_k → if d_k even, d_{k+1} even.

So the algorithm generates only even gaps — but true prime gaps include odd ones (d=1).

### 6.3 Resolution: Spinor Components

The 8-bit array has 256 states. The two spinor components correspond to:

- Component 1 (even d): particle (electron)
- Component 2 (odd d): antiparticle (positron) — or spin down

The antisymmetry comes from the spinor structure: ψ_α → -ψ_α under 2π rotation.

The exchange of two electrons picks up a minus sign from the spinor wavefunction.