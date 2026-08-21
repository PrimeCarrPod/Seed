# A1-34 Worldline_Relative_Entropy.md — Piece 05
## Relative Entropy and Quantum Error Correction — Distinguishability of Codewords

The $[[256,1,3]]$ QEC code (A1-35) has relative entropy that encodes error detection.

**QEC code from twin primes.** The 256-dim Hilbert space decomposes as (A1-35):
- 1 logical qubit (BPS sector, 78 states)
- 254 physical qubits (non-BPS + Goldstino)
- Stabilizers: $S_k = \psi_{2k}\psi_{2k+1}$ for twin prime gaps $d=2$

**Relative entropy between codewords.** For two logical states $|\psi_L\rangle, |\phi_L\rangle$:
$$\rho_L = \text{Tr}_{\text{phys}}(|\psi_L\rangle\langle\psi_L|), \quad \sigma_L = \text{Tr}_{\text{phys}}(|\phi_L\rangle\langle\phi_L|)$$
$$S(\rho_L || \sigma_L) = \text{Tr}(\rho_L \log \rho_L) - \text{Tr}(\rho_L \log \sigma_L)$$

**Error detection via relative entropy.** An error channel $\mathcal{E}$ maps $\rho \to \mathcal{E}(\rho)$. The error is detectable if:
$$S(\mathcal{E}(\rho) || \rho) \approx 0 \quad \text{for correctable errors}$$
Uncorrectable errors give $S(\mathcal{E}(\rho) || \rho) > \text{threshold}$.

**Modular gap and error threshold.** The relative entropy threshold is set by the modular energy gap (A1-33 piece 09):
$$\Delta \epsilon = \min_{\text{physical}} \epsilon_k - \max_{\text{logical}} \epsilon_k$$
$$S(\mathcal{E}(\rho) || \rho) \gtrsim \Delta \epsilon \quad \text{for uncorrectable errors}$$

**BPS sector: perfect protection.** For logical states in the BPS sector, $S(\rho^{\text{BPS}} || \sigma^{\text{BPS}}) = 0$ since $\rho^{\text{BPS}} = \sigma^{\text{BPS}} = \frac{1}{78}\mathbb{I}$.

**Twin prime stabilizers and relative entropy.** The twin prime gaps $d=2$ provide stabilizers that make $S(\mathcal{E}(\rho) || \rho) = 0$ for stabilizer-preserving errors.

**PrimeBookOne QEC verification.** The 3500 books provide 3500 QEC instances. The relative entropy between correctable error outputs and original states is zero; uncorrectable errors show relative entropy $\gtrsim \Delta \epsilon$.

**Logical vs physical relative entropy.** For the logical sector (BPS, 78 states):
$$S(\rho_L || \sigma_L) = 0$$
For the physical sector (non-BPS + Goldstino, 178 states):
$$S(\rho_P || \sigma_P) = \sum_{k=1}^{178} \left[ \frac{\nu_k^\rho}{\nu_k^\sigma} - 1 - \log\left( \frac{\nu_k^\rho}{\nu_k^\sigma} \right) \right]$$

**Error syndrome and relative entropy.** An error syndrome measurement projects the state onto a syndrome subspace. The relative entropy before and after syndrome measurement quantifies the information gained:
$$I_{\text{syndrome}} = S(\rho || \sigma) - S(\Pi_{\text{synd}} \rho \Pi_{\text{synd}} || \Pi_{\text{synd}} \sigma \Pi_{\text{synd}})$$

**Twin prime stabilizers and exact protection.** The twin prime gaps $d=2$ provide stabilizers $S_k = \psi_{2k}\psi_{2k+1}$. Errors that commute with all stabilizers have $S(\mathcal{E}(\rho) || \rho) = 0$.