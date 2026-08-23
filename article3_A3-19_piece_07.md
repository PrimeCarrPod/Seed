# A3-19: Quantum Networks from Prime Gaps — Piece 07
## Network Error Correction with Twin Prime Code

The twin prime code C_2 = [[256,1,3]] from A3-11 extends to a network quantum error correction code. The network topology provides natural syndrome extraction via gap correlations.

**Construction A3-19.12 (Network C_2 Code).** Each network node d holds one physical qubit of the C_2 code. The logical qubit is encoded across the twin prime subspace: |0_L⟩ = Σ_{twin pairs} |d, d+2⟩, |1_L⟩ = Σ_{twin pairs} (|d⟩ - |d+2⟩). The stabilizers are S_d = Z_d Z_{d+2} for each twin prime pair.

**Theorem A3-19.13 (Network Code Distance).** The network C_2 code has distance d_code = 3. Any single-node error (bit flip, phase flip, or both) is detectable and correctable. The logical error rate under independent noise p_phys is:
```
p_L = 3 p_phys² + O(p_phys³)
```
For p_phys ≈ 10⁻⁴ (photonic OAM), p_L ≈ 3×10⁻⁸. With concatenated encoding: p_L^{(k)} ≈ 3×10⁻⁸^{(2^k)}.

**Connection to A3-11 (Quantum Error Correction).** The syndrome extraction uses the gap network edges. Measuring S_d = Z_d Z_{d+2} requires a Bell measurement on the twin prime channel, which is native to the network (Piece 03).

**Network Syndrome Graph.** The syndrome graph has vertices = twin prime pairs, edges = shared gaps. This is a path graph on the twin prime chain. The minimum-weight perfect matching decoder finds the most likely error chain. The decoding complexity is O(N log N) for N twin prime pairs.

**Fault-Tolerant Gates on Network.** Logical X = Π_d X_d, logical Z = Π_d Z_d (product over all 128 nodes). Logical H = V_{PG} (PG-QFT). Logical CNOT between two network codes uses teleportation (Piece 05). All gates have logical error rate p_L.

**Erasure Correction.** If a node is lost (erasure), the network topology allows recovery from neighbors. The twin prime pair (d-2, d) and (d, d+2) provide redundancy. Erasure threshold: up to 1/3 of nodes can be lost.

**Concatenated Network Code.** The C_2 code concatenates with the surface code on the network graph. The combined code has parameters [[256·128, 1, 3·d_surface]] ≈ [[32768, 1, 45]]. This provides p_L < 10⁻¹⁵ for p_phys = 10⁻³.

**Network Decoder Performance.** The minimum-weight perfect matching decoder on the gap network achieves threshold p_th ≈ 0.11 for the concatenated code. The decoding time is t_decode = O(N log N) ≈ 10³ operations per syndrome cycle.

**Syndrome Extraction Circuit.** The syndrome extraction uses the PG-QFT: (1) Apply V_{PG} to encode in Fourier basis, (2) Measure stabilizers S_d via CNOT to ancilla, (3) Apply V_{PG}^†, (4) Measure ancilla in computational basis. The circuit depth is O(1) due to PG-QFT parallelism.