# A2-02 Twin_Prime_Electron_Mass.md — Piece 11
## Twin Prime Code Indices in PrimeBookOne (A1-35, A1-40)

The twin prime QEC code indices are explicitly computable from PrimeBookOne.

**Twin prime code [[256,1,3]].** From A1-35: the UV sector (d<16) has 256 gap sectors. The twin primes (d=2) form a [[256,1,3]] code:
- n = 256 physical qubits (gap sectors d=2,4,6,8,10,12,14 with multiplicities)
- k = 1 logical qubit (the electron)
- d = 3 code distance

**Code indices from gap data.** The code parameters are:
- Stabilizer generators: twin prime gap operators
- Logical X: superposition of all d=2 gaps
- Logical Z: phase from gap sequence
- Distance 3: minimum gap difference to distinguish logical states

**PrimeBookOne code data.** Each book b gives the twin prime code at scale μ_b:
- n_b = number of gap sectors with d<16 in book b
- k_b = 1 (always one electron)
- d_b = min gap difference at that scale

As b increases, n_b grows (more gaps in the UV sector), d_b may change.

**Code capacity.** The quantum capacity of the twin prime code is:
Q = 1 - H(3/256) ≈ 0.97
The electron worldline is protected with 97% fidelity against UV noise.

**Index theorem for code.** From A1-24: the index Σ sign(dₙ) = 78. The twin prime code index is:
Ind(code) = dim ker D - dim ker D† = 1
The single logical qubit is the index-1 mode.

**Decoding map = HKLL.** The Petz decoding map (A1-35) for the twin prime code is the HKLL bulk reconstruction map (A1-38). The electron worldline is reconstructed from the twin prime boundary operators.

**Article 2 connection.** The electron mass mₑ = 0.511 MeV is the energy of the logical qubit of the twin prime code. The code Hamiltonian gives the mass spectrum.

(End of file - 35 lines)