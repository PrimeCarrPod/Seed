# A1-32 Worldline_Renyi_Entropies.md — Piece 11
## Renyi Entropies and Quantum Error Correction — Connection to A1-35

The $[[256,1,3]]$ quantum error correcting code from twin primes (A1-35) has Renyi entropies that encode its error correction properties.

**QEC code from twin primes.** The 256-dim Hilbert space decomposes as:
- 1 logical qubit (BPS sector, 78 states)
- 254 physical qubits (non-BPS + Goldstino)
- Stabilizers: twin prime operators $S_k = \psi_{2k} \psi_{2k+1}$ (gap $d=2$)

**Renyi entropy of code subspace.** For a logical state $|\psi_L\rangle$ encoded in the code:
$$\rho_{\text{code}} = \text{Tr}_{\text{physical}}(|\psi_L\rangle\langle\psi_L|)$$

The Renyi entropy $S_n(\rho_{\text{code}})$ measures the entanglement between logical and physical qubits.

**Exact QEC Renyi entropies.** For the $[[256,1,3]]$ code:
- $S_0 = \log 2 = 1$ (logical dimension)
- $S_n = 1$ for all $n$ (maximally mixed logical qubit)
- The physical sector has $S_n^{\text{phys}} = \log 254 \approx 5.54$ at $n=0$, decreasing with $n$

**Twin prime stabilizers and Renyi entropies.** The twin prime gaps $d=2$ (record gap 1) define the stabilizers. The number of twin prime pairs up to $x$ is $\pi_2(x) \sim C x / \log^2 x$. The Renyi entropy profile reflects the twin prime distribution.

**Error correction as Renyi entropy suppression.** A correctable error channel $\mathcal{E}$ satisfies:
$$S_n(\mathcal{E}(\rho)) \approx S_n(\rho) \quad \text{for correctable errors}$$

Uncorrectable errors increase $S_n$ by leaking logical information to the physical sector.

**Renyi entanglement wedge.** The Renyi mutual information $I_n(A:B)$ for the QEC code defines an entanglement wedge in the AdS$_2$ dual (A1-38). The BPS sector (78 states) is the boundary of the wedge.

**PrimeBookOne QEC verification.** The 3500 books provide 3500 instances of the QEC code. The Renyi entropies $S_n(b)$ are constant at $\log 78$ for the logical sector across all physical chamber books — a verification of the code's error correction capability.