# A1-33 Worldline_Modular_Hamiltonian.md — Piece 09
## Modular Hamiltonian and Quantum Error Correction — Twin Prime Stabilizers

The $[[256,1,3]]$ QEC code (A1-35) has a modular Hamiltonian that encodes its error correction properties.

**QEC code from twin primes.** The 256-dim Hilbert space decomposes as (A1-35):
- 1 logical qubit (BPS sector, 78 states)
- 254 physical qubits (non-BPS + Goldstino)
- Stabilizers: $S_k = \psi_{2k}\psi_{2k+1}$ for twin prime gaps $d=2$

**Modular Hamiltonian of the code.** For a logical state $|\psi_L\rangle$:
$$\rho_{\text{code}} = |\psi_L\rangle\langle\psi_L|$$
$$K_{\text{code}} = -\log \rho_{\text{code}} = 0 \quad \text{(pure state)}$$

For the maximally mixed logical qubit (BPS sector):
$$\rho_{\text{logical}} = \frac{1}{78} \mathbb{I}_{78}$$
$$K_{\text{logical}} = \log 78 \cdot \mathbb{I}_{78}$$

**Stabilizers as modular symmetries.** The twin prime stabilizers $S_k$ commute with $K$:
$$[K, S_k] = 0$$
This means the stabilizers are symmetries of the modular flow — they generate gauge transformations in the entanglement wedge. The stabilizer group is the center of the modular algebra.

**Error correction as modular energy gap.** Correctable errors have $\Delta \epsilon < \text{gap}$, where the gap is the modular energy difference between logical and physical sectors. The modular Hamiltonian gap is:
$$\Delta \epsilon = \min_{\text{physical}} \epsilon_k - \max_{\text{logical}} \epsilon_k = \min_{\text{non-BPS}} \beta E_k - 0 > 0$$

**Modular flow preserves logical information.** The modular flow $\alpha_s$ acts trivially on the logical sector (zero modular energy) and mixes only the physical sector. Logical information is preserved under modular evolution.

**Entanglement wedge and QEC.** The entanglement wedge of the logical sector is the BPS sector. The modular Hamiltonian gap $\Delta \epsilon$ is the code distance in modular energy units. The 78 BPS states are the protected logical subspace.

**PrimeBookOne QEC modular verification.** The 3500 books provide 3500 modular Hamiltonians with the correct gap structure. The modular energy gap is positive and constant in the physical chamber. The twin prime gaps $d=2$ provide the stabilizer structure.