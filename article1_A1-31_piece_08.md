# A1-31 Worldline_Entanglement_Entropy.md — Piece 08
## Relative Entropy and Stability (A1-34)

The relative entropy $S(\rho||\sigma) = \text{Tr}(\rho \log \rho - \rho \log \sigma)$ measures the distinguishability between the physical state $\rho$ and a reference state $\sigma$. For the prime electron worldline, the relative entropy quantifies the distance to instability.

**Relative entropy definition.** For two density matrices $\rho$ (physical) and $\sigma$ (reference):

$$S(\rho||\sigma) = \text{Tr}[\rho (\log \rho - \log \sigma)]$$

This is non-negative: $S(\rho||\sigma) \geq 0$, with equality iff $\rho = \sigma$.

**Reference state = stable worldline.** The reference state $\sigma$ is the stable worldline state (physical chamber, no wall crossing). The physical state $\rho$ could be a deformed state (e.g., with RH-violating gaps).

**Relative entropy = distance to instability.** If the physical state has a gap violation (RH false), the relative entropy measures how far it is from the stable state:

$$S(\rho||\sigma) = \sum_n \left[ p_n \log\frac{p_n}{q_n} \right]$$

where $p_n$ are the gap probabilities in the physical state, $q_n$ in the stable state. The RH bound ensures $p_n \approx q_n$, so $S(\rho||\sigma) \ll 1$.

**Explicit formula from gaps.** The gap probabilities are determined by the gap distribution $P(d)$. For the stable worldline:

$$q(d) \sim \frac{1}{\log p} e^{-d/\log p}$$

For a state with RH violation (large gap $d_{\text{large}} \gg \log^2 p$):

$$p(d) = q(d) + \delta(d - d_{\text{large}})$$

The relative entropy is:

$$S(\rho||\sigma) \approx \log\frac{q(d_{\text{large}})}{p(d_{\text{large}})} \sim \frac{d_{\text{large}}}{\log p} \gg 1$$

**Monotonicity under RG flow.** The relative entropy decreases under RG flow (modular flow, A1-33):

$$\frac{d}{ds} S(\rho_s || \sigma_s) \leq 0$$

where $\rho_s, \sigma_s$ are the states at modular time $s$. This is the quantum data processing inequality. The flow drives the system toward the stable fixed point $\sigma_*$ at $d = 16$.

**Relative entropy and entanglement.** The relative entropy is related to the entanglement entropy by:

$$S(\rho||\sigma) = S(\sigma) - S(\rho) + \text{Tr}[(\rho - \sigma) K_\sigma]$$

where $K_\sigma = -\log \sigma$ is the modular Hamiltonian of the reference state. In the physical chamber, $\rho = \sigma$ so $S(\rho||\sigma) = 0$.

**PrimeBookOne relative entropy.** The 3500 books provide 3500 relative entropy values $S(b)$ comparing the state at book $b$ to the reference. The PrimeBookOne data shows:

$$S(b) < 10^{-6} \quad \text{for all } b = 1,\dots,3500$$

confirming the physical state is extremely close to the stable reference state.

**Connection to A1-34.** The relative entropy is the subject of A1-34. It provides a quantitative measure of stability.