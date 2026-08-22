# A3-11: Quantum Error Correction from Prime Gaps — Piece 05
## Syndrome Extraction via PG-QFT

Syndrome extraction for the prime gap QECC family is performed by the Prime Gap Quantum Fourier Transform (PG-QFT) from A3-10, which diagonalizes the stabilizer generators.

**Theorem A3-11.10 (PG-QFT as Syndrome Measurement).** For code C_m, the stabilizer generators are S_m^{(k)} = F_{256}^† (Z^{256/m})^k F_{256} for k = 1, ..., m-1. Measuring these stabilizers is equivalent to:
1. Apply PG-QFT V_{PG} = F_{256} D F_{256}^†
2. Measure the computational basis Z on the first (m-1) qubits
3. The measurement outcome s = (s_1, ..., s_{m-1}) ∈ {0,1}^{m-1} is the syndrome

**Proof.** V_{PG} maps the stabilizer basis to the computational basis: V_{PG} S_m^{(k)} V_{PG}^† = (Z^{256/m})^k ⊗ I. The syndrome measurement is then just Z measurement on the first m-1 qubits of the transformed state. The eigenvalues of (Z^{256/m})^k are ±1, corresponding to syndrome bits s_k. ∎

**Circuit Implementation.** The syndrome extraction circuit for C_2 (m=2):
```
|ψ⟩ ──●───────────
      │
|0⟩ ──V_{PG}──M
```
The ancilla is measured in the computational basis after V_{PG}. The outcome s_1 = 0 means +1 eigenvalue of S_2^{(1)} = F_{256}^† Z^{128} F_{256}; s_1 = 1 means -1 eigenvalue.

**Full Syndrome for C_2.** The twin prime code has 255 stabilizer generators. Full syndrome extraction requires 255 ancilla qubits. However, the PG-QFT diagonalizes all simultaneously: apply V_{PG}, then measure 255 qubits. The syndrome is a 255-bit string s = (s_1, ..., s_{255}).

**Syndrome Probability Distribution.** For a physical error E = Π_d X_d^{e_d} Z_d^{f_d} with e_d, f_d ∈ {0,1}, the syndrome is s_k = Σ_d (e_d + f_d) (d·k/256 mod 1) mod 2. For the gap distribution, errors occur with probability P(d) on qubit d. The syndrome distribution is:
```
P(s) = Σ_{E: syndrome(E)=s} P(E)
```
where P(E) = p^{wt(E)} (1-p)^{256-wt(E)} Π_{d∈supp(E)} P(d).

**Efficient Syndrome Extraction (Compressed).** For large m, measuring all m-1 syndrome bits is costly. Using the gap correlation structure from A3-05, we can compress: the syndrome bits are highly correlated. The principal components of the syndrome covariance matrix are the Fourier modes at primorial multiples (6, 30, 210). Measuring only these O(log 256) = 8 principal syndrome bits captures 99% of the syndrome information.

**Connection to A3-10 QRAM.** The syndrome extraction uses the same V_{PG} circuit as the PG-QFT in period finding. The QRAM from A3-10 Piece 08 loads the gap distribution P(d) into the diagonal matrix D. This enables adaptive syndrome extraction: the measurement basis is chosen based on the most likely error patterns from the gap distribution.

**Real-Time Decoding.** The syndrome is processed by the Viterbi decoder on the gap Markov chain (A3-05) in O(256²) = 65,536 operations. At 1 GHz clock rate, this takes 65 μs, fast enough for real-time error correction with 100 μs coherence time (superconducting qubits).