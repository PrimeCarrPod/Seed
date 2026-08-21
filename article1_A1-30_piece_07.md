# A1-30 Worldline_Stability_Conditions.md — Piece 07
## Entanglement Entropy and Stability (A1-31)

The entanglement entropy of the prime electron worldline provides a quantum information measure of stability. The entanglement entropy $S = -\text{Tr}(\rho \log \rho)$ of the BPS sector (A1-31) is smooth in the physical chamber and has phase transitions at walls of marginal stability (A1-29).

**BPS sector density matrix.** The BPS states $|\text{BPS}_k\rangle$ for $k = 1,\dots,78$ form a 78-dimensional subspace of the 256-dim Hilbert space. The reduced density matrix for the BPS sector is:

$$\rho_{\text{BPS}} = \frac{1}{78} \sum_{k=1}^{78} |\text{BPS}_k\rangle\langle \text{BPS}_k|$$

assuming equal probability for each BPS state (microcanonical ensemble at energy $E = 39$).

**Entanglement entropy of BPS sector.** The entanglement entropy between the BPS sector and the rest of the Hilbert space is:

$$S_{\text{BPS}} = -\text{Tr}(\rho_{\text{BPS}} \log \rho_{\text{BPS}}) = \log 78 \approx 4.36$$

This is the logarithm of the Witten index $\Delta = 78$. The entropy is constant in the physical chamber because the BPS spectrum is fixed (78 singlets).

**Phase transitions at walls.** When a wall of marginal stability is crossed (A1-29), the BPS degeneracies $\Omega(\gamma)$ change. The entanglement entropy jumps by:

$$\Delta S = \log \Omega'(\gamma) - \log \Omega(\gamma)$$

For a simple wall where a new BPS state appears ($\Omega: 0 \to 1$), the jump is $\Delta S = \log 1 - \log 0 = \infty$ (a true phase transition). For walls where bound states form, the jump is finite.

**Smoothness in physical chamber = RH.** In the physical chamber, no walls are crossed, so the entanglement entropy is constant: $S = \log 78$. If RH is violated, a wall would be crossed in the physical chamber, causing a discontinuity in $S$. Thus:

$$\text{RH} \Leftrightarrow S(\tau) \text{ is smooth for all } \tau$$

**Entanglement entropy from gap fluctuations.** The entanglement entropy can also be computed from the gap fluctuation spectrum (A1-08). The proper-time fluctuations $\Delta\tau = \kappa d_n$ define a Gaussian state with covariance matrix $\Sigma_{nm} = \kappa^2 \langle d_n d_m \rangle$. The entanglement entropy is:

$$S = \frac{1}{2} \log \det(2\pi e \Sigma)$$

The prime gap correlations (A1-08) determine $\Sigma$. The RH bound $d_n = O(\log^2 p_n)$ ensures that $\Sigma$ is well-behaved and $S$ is finite.

**Connection to modular Hamiltonian (A1-33).** The modular Hamiltonian $K = -\log \rho$ generates the modular flow. The entanglement entropy is the expectation value of $K$:

$$S = \langle K \rangle = \text{Tr}(\rho K)$$

The stability of $S$ is equivalent to the stability of the modular flow, which is the RG flow (piece 04).