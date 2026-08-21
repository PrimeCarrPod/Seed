# A1-40 Worldline_PrimeBookOne.md — Piece 08
## Information Preservation Matrix — 3500×3500

The information preservation matrices from A1-39 track the Page curve, Hayden-Preskill decoding, and unitarity at all scales.

**Page time matrix.** The Page time for each book:
$$\mathcal{T}_b^{\text{Page}} = \frac{1}{2\pi} \log \dim \mathcal{H}_{\text{heavy}}(b) \sim \frac{1}{2\pi} \sum_{d>16} m_{b,d}$$
This is a 3500-vector stored in PrimeBookOne.

**Information recovery matrix.** The information recovered by book $b$ from reference $b'$:
$$\mathcal{I}_{bb'} = 1 - \frac{S(\rho_b || \rho_{b'})}{S_{\max}(b)}$$
where $S_{\max}(b)$ is the maximum entropy for book $b$. $\mathcal{I}_{bb'} = 1$ means perfect recovery; 0 means total loss.

**Hayden-Preskill decoding fidelity.** The decoding fidelity for information thrown into heavy sector of $b'$ and recovered from light sector of $b$:
$$\mathcal{F}_{\text{HP}}(b, b') = \exp\left(-S(\rho_{\text{light}}^{(b)} || \rho_{\text{heavy}}^{(b')})\right)$$
For $b$ after Page time of $b'$, $\mathcal{F}_{\text{HP}} \to 1$. For $b$ before Page time, $\mathcal{F}_{\text{HP}} \approx 0$.

**BPS information preservation.** The BPS information preservation matrix is identically 1:
$$\mathcal{P}_{bb'} = 1 \quad \forall b, b' \in \text{BPS}$$
This encodes the exact preservation of BPS information (A1-39).

**Wall crossing indicator.** The wall crossing matrix (A1-29):
$$\mathcal{W}_{bb'} = \begin{cases} 1 & \text{if books } b, b' \text{ are on opposite sides of a wall} \\ 0 & \text{otherwise} \end{cases}$$
In the physical chamber (RH holds), $\mathcal{W}_{bb'} = 0$ for all $b, b'$. This is the data verification of RH.

**Page curve trajectories.** For each book $b$, the Page curve $S_b(t)$ is stored as a time series. The peak time $t_P(b)$, peak entropy $S_{\max}(b)$, and final entropy $S_{\text{final}}(b) = 0$ are recorded.

**Unitarity verification.** The unitarity matrix:
$$\mathcal{U}_{bb'} = \delta_{bb'} - \mathcal{W}_{bb'}$$
In physical chamber, $\mathcal{U} = \mathbb{I}$ — perfectly unitary.

(End of file - 33 lines)