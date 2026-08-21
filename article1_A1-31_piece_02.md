# A1-31 Worldline_Entanglement_Entropy.md — Piece 02
## BPS Sector Entanglement Entropy S = log 78

The BPS sector of the prime electron worldline consists of 78 singlet states $|\text{BPS}_k\rangle$ (A1-28). The entanglement entropy of this sector is a topological invariant.

**BPS density matrix.** In the physical chamber, the 78 BPS states are degenerate at energy $E = 39$ (A1-28). The microcanonical density matrix is:

$$\rho_{\text{BPS}} = \frac{1}{78} \sum_{k=1}^{78} |\text{BPS}_k\rangle\langle \text{BPS}_k|$$

This assumes equal probability for each BPS state, which is the maximum entropy distribution consistent with the energy constraint.

**Entanglement entropy.** The von Neumann entropy is:

$$S_{\text{BPS}} = -\text{Tr}(\rho_{\text{BPS}} \log \rho_{\text{BPS}}) = \log 78 \approx 4.3567$$

**Chiral split contribution.** The 256-dim Hilbert space splits as $\mathcal{H} = \mathcal{H}_+ \oplus \mathcal{H}_-$ with $128|128$ (A1-25, A1-28). The 78 BPS states split by chirality: 71 in $\mathcal{H}_+$, 7 in $\mathcal{H}_-$. The chiral entanglement entropies are:

$$S_+ = \log 71 \approx 4.263, \quad S_- = \log 7 \approx 1.946$$

The total BPS entropy is $S_{\text{BPS}} = S_+ + S_- = \log 71 + \log 7 = \log 497 \neq \log 78$? Wait — the chiral split is not a tensor product. The correct decomposition is:

$$S_{\text{BPS}} = \log(\dim \mathcal{H}_{\text{BPS}}) = \log 78$$

where $\mathcal{H}_{\text{BPS}} \subset \mathcal{H}$ is the 78-dim BPS subspace. The chirality is a grading, not a tensor factor.

**BPS entanglement with environment.** The BPS sector is entangled with the non-BPS sector through the supercharge $Q$ (A1-26). The full density matrix at finite temperature is:

$$\rho = \frac{e^{-\beta H}}{Z(\beta)}$$

The BPS reduced density matrix is $\rho_{\text{BPS}} = \text{Tr}_{\text{non-BPS}}(\rho)$. At $\beta \to \infty$, $\rho_{\text{BPS}} \to \frac{1}{78}\mathbb{1}_{78}$ and $S_{\text{BPS}} \to \log 78$.

**Topological nature of S_BPS.** The BPS entanglement entropy is a topological invariant because:
1. It depends only on the number of BPS states (78)
2. The number 78 is the Witten index $\Delta = 78$ (A1-24, A1-28)
3. $\Delta$ is invariant under all continuous deformations (A1-30)

Thus $S_{\text{BPS}} = \log 78$ is constant in the physical chamber and cannot change without a phase transition (wall crossing, A1-29).