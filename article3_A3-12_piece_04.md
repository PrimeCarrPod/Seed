# A3-12: Quantum Simulation from Prime Gaps — Piece 04
## Digital Quantum Simulation with PG-QFT

Digital quantum simulation uses the PG-QFT and Trotterization to simulate arbitrary Hamiltonians on the prime gap Hilbert space. The PG-QFT provides a native basis for diagonalizing translation-invariant Hamiltonians.

**Algorithm A3-12.7 (Digital Simulation via PG-QFT).** To simulate H = H_0 + H_1 where H_0 is diagonal in the gap basis (H_0 = Σ_d E(d)|d⟩⟨d|) and H_1 is diagonal in the PG-QFT basis (H_1 = V_{PG}^† D_1 V_{PG}):
1. Prepare initial state |ψ(0)⟩
2. For m = 1 to M steps:
   a. Apply e^{-iH_0 Δt} = diag(e^{-iE(d)Δt}) in gap basis
   b. Apply V_{PG}
   c. Apply e^{-iH_1 Δt} = diag(e^{-iλ_k Δt}) in PG-QFT basis
   d. Apply V_{PG}^†
3. Measure observables

**Theorem A3-12.8 (Trotter Error from Gap Statistics).** The first-order Trotter error per step is:
```
ε_Trotter = (Δt²/2) ||[H_0, H_1]|| = (Δt²/2) Σ_d |E(d)| |∂_d λ_d|
```
where λ_d are the PG-QFT eigenvalues. For the prime gap Hamiltonian, E(d) = ℏ/κd and ∂_d λ_d is the derivative of the characteristic function. The commutator norm is:
```
||[H_0, H_1]|| = (ℏ/κ) Σ_d (1/d) |Σ_{d'} P(d') (2πi d'/256) e^{2πi d d'/256}|
```
This evaluates to ||[H_0, H_1]|| ≈ 0.15 ℏ/κ from the 3.67B gap data.

**Simulation of Arbitrary Hamiltonians.** Any Hamiltonian H on ℋ = ℂ²⁵⁶ can be decomposed as H = Σ_α c_α H_α where H_α are Pauli strings. The PG-QFT diagonalizes the subset of H_α that are translation-invariant (cyclic permutations of gap indices). For non-translation-invariant terms, we use the full 256×256 unitary synthesis via the Cartan decomposition, requiring O(256²) = 65K gates.

**Connection to A3-10 (Period Finding).** The period finding algorithm from A3-10 Piece 03 is the quantum phase estimation algorithm applied to the shift operator S. The energy measurement is the phase estimation on H_hop. The simulation algorithm is the inverse: given H, apply the phase estimation unitary to measure its spectrum.

**Digital Simulation of Fermi-Hubbard (Piece 02).** The Fermi-Hubbard Hamiltonian H_FH = Σ_d μ_d n_d + Σ_d J_d (c_d^† c_{d+2} + h.c.) is simulated by:
- H_0 = Σ_d μ_d n_d (diagonal in gap basis)
- H_1 = Σ_d J_d (c_d^† c_{d+2} + h.c.) (diagonal in PG-QFT basis)
The Trotter step requires 2 PG-QFTs and 2 diagonal phase gates. For Δt = 0.01 ℏ/κ and total time t = 10 ℏ/κ, M = 1000 steps, total depth = 1000 × (2×128 + 2×72) = 400K gates. With error correction (A3-11), logical depth = 400K / 256 ≈ 1560 logical gates.

**Resource Estimate.** For simulating the 128-site Fermi-Hubbard model (256 qubits with Jordan-Wigner) for time t = 100 ℏ/κ with error ε = 10⁻³:
- Physical qubits: 256 (data) + 255 (ancilla for QEC) = 511
- T-gates per step: 256 (diagonal phases)
- Total T-gates: 10⁴ × 256 = 2.56M
- Magic states needed: 2.56M × 10 (distillation overhead) = 25.6M
- Available from PrimeBookOne: 3.67B gaps × 0.035 = 128M magic states (sufficient)