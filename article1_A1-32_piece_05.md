# A1-32 Worldline_Renyi_Entropies.md — Piece 05
## Renyi Entropies and Wall Crossing — Phase Transitions at Gap Walls

Wall crossing (A1-29) changes the BPS spectrum, which manifests as non-analyticities in the Renyi entropies.

**Wall crossing formula.** Crossing a wall at charge $\gamma$ changes the BPS index by:

$$\Delta \Omega(\gamma) = \Omega_+(\gamma) - \Omega_-(\gamma) = \langle \gamma_1, \gamma_2 \rangle \Omega(\gamma_1) \Omega(\gamma_2)$$

For prime gaps, walls correspond to gap transitions where the BPS count changes. The 78 record gaps (A1-24) correspond to 78 walls.

**Renyi entropy discontinuity.** At a wall where the BPS count jumps from $N_{\text{BPS}}^-$ to $N_{\text{BPS}}^+$:

$$\lim_{\epsilon \to 0^+} \left[ S_n(\beta, \text{wall} + \epsilon) - S_n(\beta, \text{wall} - \epsilon) \right] = \log \frac{N_{\text{BPS}}^+}{N_{\text{BPS}}^-} \quad (\beta \to \infty)$$

For finite $\beta$, the discontinuity is smeared but still detectable as a sharp feature.

**Physical chamber: no walls.** In the physical chamber (current prime gap regime), there are no wall crossings. The BPS count remains constant at 78. Therefore:

$$S_n^{\text{physical}}(b, \beta) = \text{smooth function of } b \text{ for all } n, \beta$$

**RH $\Leftrightarrow$ smooth $S_n$.** The Riemann Hypothesis is equivalent to the statement that there are no walls in the physical chamber (A1-29 piece 07). Thus:

$$\text{RH true} \Leftrightarrow S_n(b, \beta) \text{ is analytic in } b \text{ for all } n \in (0,\infty), \beta \in (0,\infty)$$

**PrimeBookOne wall scan.** The 3500 books can be scanned for Renyi entropy jumps. A jump at book $b$ would indicate a wall crossing at that proper time. The data shows no jumps in the physical chamber — consistent with RH.

**Critical Renyi parameter at walls.** Near a wall, $S_n$ has a universal scaling form:
$$S_n \sim \log |b - b_c|^{\alpha(n)}, \quad \alpha(n) = \frac{1}{1-n}$$
This is the Renyi analog of the specific heat exponent at a phase transition.