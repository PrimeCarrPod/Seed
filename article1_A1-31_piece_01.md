# A1-31 Worldline_Entanglement_Entropy.md — Piece 01
## Introduction — Entanglement from Prime Gaps

The entanglement entropy of the prime electron worldline quantifies the quantum correlations between proper-time segments. The 3500 books of PrimeBookOne (A1-10) correspond to 3500 worldline segments, each with its own gap sequence. The entanglement between these segments is determined by the prime gap correlations (A1-08).

**Entanglement entropy definition.** For a bipartition of the worldline into regions A and B, the entanglement entropy is:

$$S(A) = -\text{Tr}(\rho_A \log \rho_A)$$

where $\rho_A = \text{Tr}_B(|\Psi\rangle\langle\Psi|)$ is the reduced density matrix of region A. The full state $|\Psi\rangle$ is the worldline wavefunction constructed from the prime gap sequence.

**BPS sector entanglement.** The 78 BPS states (A1-28) form a protected subspace with entanglement entropy:

$$S_{\text{BPS}} = \log 78 \approx 4.36$$

This is the logarithm of the Witten index $\Delta = 78$ (A1-28 piece 10). The BPS entanglement is constant in the physical chamber (no wall crossing, A1-29).

**Full Hilbert space entanglement.** The full 256-dim Hilbert space includes 78 BPS states + 176 non-BPS states (44 long multiplets) + 2 Goldstino states. The full entanglement entropy depends on the thermal weights of the non-BPS states:

$$S_{\text{full}} = -\sum_i p_i \log p_i, \quad p_i = \frac{e^{-\beta E_i}}{Z(\beta)}$$

At low temperature ($\beta \to \infty$), only BPS states contribute: $S_{\text{full}} \to \log 78$. At high temperature, all 256 states contribute: $S_{\text{full}} \to \log 256 = 8 \log 2 \approx 5.55$.

**Prime gap correlations as covariance.** The proper-time steps $\Delta\tau_n = \kappa d_n$ have correlations $\langle d_n d_m \rangle$ from A1-08. These define a Gaussian state with covariance matrix:

$$\Sigma_{nm} = \kappa^2 \langle d_n d_m \rangle - \kappa^2 \langle d_n \rangle \langle d_m \rangle$$

The entanglement entropy of a Gaussian state is:

$$S = \frac{1}{2} \log \det(2\pi e \Sigma_A)$$

where $\Sigma_A$ is the restriction of $\Sigma$ to region A.

**PrimeBookOne as entanglement data.** The 3.67 billion gap differences in PrimeBookOne provide the exact correlation functions $\langle d_n d_m \rangle$ for all scales. The 3500 books give 3500 entanglement entropy values $S(b)$ for partitions at book boundaries.