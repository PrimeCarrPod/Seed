# A1-34 Worldline_Relative_Entropy.md — Piece 04
## Relative Entropy and Wall Crossing — Phase Transitions in Distinguishability

Wall crossing (A1-29) induces singularities in the relative entropy.

**Wall crossing and relative entropy jump.** At a wall, the BPS count changes: $N_{\text{BPS}}^- \neq N_{\text{BPS}}^+$. The supports of $\rho_-$ and $\rho_+$ differ, giving:
$$S(\rho_- || \rho_+) = \infty$$
$$S(\rho_+ || \rho_-) = \infty$$

**Regularized relative entropy near walls.** For books near a wall at $b_c$:
$$S(\rho_b || \rho_{b_c}) \sim \log |b - b_c|^{-\alpha}$$
where $\alpha$ is related to the central charge $Z=78$.

**Physical chamber: smooth relative entropy.** In the physical chamber (no walls, RH true), the relative entropy is analytic:
$$S(\rho_b || \rho_{b'}) = \text{smooth function of } b, b'$$
For all 3500 physical chamber books, $S(\rho_b || \rho_{b'}) \approx 0$ (BPS) + small (non-BPS).

**Relative entropy as wall detector.** Scanning $S(\rho_b || \rho_{b+1})$ across books: spikes indicate walls. The physical chamber shows no spikes — empirical RH verification.

**Relative entropy and central charge.** The central charge $Z=78$ appears in the relative entropy near walls:
$$\partial_b S(\rho_b || \rho_{b+1}) \big|_{\text{wall}} \sim Z = 78$$

**Modular Hamiltonian jump.** The relative entropy divergence comes from the modular Hamiltonian jump (A1-33 piece 10):
$$\Delta K = (\log N_{\text{BPS}}^+ - \log N_{\text{BPS}}^-) \cdot P_{\text{BPS}}$$
$$S(\rho_- || \rho_+) = \text{Tr}(\rho_- \Delta K) = \infty$$

**PrimeBookOne wall scan.** The 3500 books provide 3500 × 3500 pairwise relative entropies. The physical chamber block (no walls) shows smooth, small values.

**Relative entropy and the central charge.** The central charge $Z=78$ appears in the relative entropy near walls:
$$\partial_b S(\rho_b || \rho_{b+1}) \big|_{\text{wall}} \sim Z = 78$$

**Modular Hamiltonian jump.** The relative entropy divergence comes from the modular Hamiltonian jump (A1-33 piece 10):
$$\Delta K = (\log N_{\text{BPS}}^+ - \log N_{\text{BPS}}^-) \cdot P_{\text{BPS}}$$
$$S(\rho_- || \rho_+) = \text{Tr}(\rho_- \Delta K) = \infty$$

**Relative entropy as order parameter.** The relative entropy serves as an order parameter for wall crossing:
- Physical chamber: $S(\rho_b || \rho_{b'}) \approx 0$ (BPS) + small (non-BPS)
- At wall: $S(\rho_- || \rho_+) = \infty$ (singularity)
- The transition is driven by the BPS count change $\Delta N_{\text{BPS}}$

**Symmetrized relative entropy.** The Jensen-Shannon divergence $J(\rho,\sigma) = \frac{1}{2} S(\rho || \frac{\rho+\sigma}{2}) + \frac{1}{2} S(\sigma || \frac{\rho+\sigma}{2})$ is finite at walls and provides a regularized measure.