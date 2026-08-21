# A1-29 Worldline_Wall_Crossing.md — Piece 06
## BPS Degeneracies Across Walls — Ω(γ) Jump Formulas

The BPS degeneracies $\Omega(\gamma)$ (the number of BPS states with charge $\gamma$) change according to the KS wall crossing formula when crossing a wall of marginal stability. For the prime electron, the degeneracies are simple in the physical chamber but become non-trivial in other chambers.

**Physical chamber degeneracies.** In the physical chamber (actual prime gaps from PrimeBookOne), the BPS spectrum consists of 78 singlets:

$$\Omega_{\text{phys}}(\gamma_k) = 1 \quad \text{for } k = 1,\dots,78, \quad \Omega_{\text{phys}}(\gamma) = 0 \text{ otherwise}$$

All 78 BPS states are isolated singlets — no bound states of multiple record gaps exist in the physical chamber.

**Degeneracies in the UV chamber.** In the UV chamber (large gap limit, $d \gg 16$), the dual gaps $1/d_n$ are small. The BPS spectrum reorganizes: the 71 states with $d > 16$ remain singlets, but the 7 states with $d < 16$ can form bound states. The degeneracies become:

$$\Omega_{\text{UV}}(\gamma_k) = \begin{cases} 1 & k = 1,\dots,71 \\ \binom{7}{m} & \text{for bound states of the 7 small-gap BPS} \end{cases}$$

Actually, since the duality is an outer automorphism, the UV chamber BPS spectrum is isomorphic to the IR chamber spectrum. The 7 small-gap BPS states in the UV chamber correspond to the 7 large-gap BPS states in the IR chamber.

**Jump formula at a simple wall.** Consider a wall where two BPS states $\gamma_1$ and $\gamma_2$ become marginally stable. The KS formula gives the jump in degeneracies:

$$\Omega'(\gamma) = \Omega(\gamma) + \sum_{n \geq 1} \frac{(-1)^{n-1}}{n} \sum_{\substack{\gamma_1+\dots+\gamma_n = \gamma \\ \arg Z_{\gamma_1} = \dots = \arg Z_{\gamma_n}}} \Omega(\gamma_1) \cdots \Omega(\gamma_n) \langle \gamma_1, \dots, \gamma_n \rangle$$

For a simple wall with $\langle \gamma_1, \gamma_2 \rangle = 1$, this reduces to:

$$\Omega'(\gamma_1 + \gamma_2) = \Omega(\gamma_1)\Omega(\gamma_2)$$

So a bound state of charge $\gamma_1 + \gamma_2$ appears with degeneracy 1. The constituents $\gamma_1$ and $\gamma_2$ may become unstable (their degeneracies can change).

**Application to record gap walls.** Each record gap $d_{\text{rec}}^{(k)}$ corresponds to a wall where the $k$-th BPS state appears. The wall crossing formula for the $k$-th wall (adding the $k$-th record gap) is:

$$\Omega_k(\gamma) = \Omega_{k-1}(\gamma) + \delta_{\gamma, \gamma_k} + \sum_{i<k} \langle \gamma_i, \gamma_k \rangle \Omega_{k-1}(\gamma_i) \delta_{\gamma, \gamma_i + \gamma_k} + \dots$$

The first term $\delta_{\gamma, \gamma_k}$ adds the new singlet BPS state. The second term creates bound states with previous BPS states, weighted by the intersection pairing.

**Total BPS count invariance.** Despite the jumps in individual $\Omega(\gamma)$, the total number of BPS states (weighted by $(-1)^F$) is invariant:

$$\sum_\gamma (-1)^F \Omega(\gamma) = 78 = \Delta$$

This is the Witten index (A1-28 piece 10). The KS formula is designed to preserve this invariant.

**Numerical check from PrimeBookOne.** The 78 record gaps give 78 wall crossing events. The cumulative BPS spectrum after all 78 walls matches the physical chamber spectrum exactly. The intersection pairings $\langle \gamma_i, \gamma_j \rangle$ computed from the worldline self-intersection data (A1-11) satisfy all the dilogarithm identities required by the KS formula.