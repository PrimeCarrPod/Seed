# A1-31 Worldline_Entanglement_Entropy.md — Piece 05
## Entanglement Phase Transitions at Walls (A1-29)

The entanglement entropy of the worldline undergoes phase transitions at walls of marginal stability (A1-29). These transitions correspond to changes in the BPS spectrum.

**Entanglement entropy as function of moduli.** The entanglement entropy $S(u)$ depends on the moduli $u \in \mathcal{M}$ (gap ratios). In the physical chamber, $S(u) = \log 78$ (constant). As moduli flow toward a wall, $S(u)$ develops a singularity.

**Wall crossing and entropy jump.** At a wall where a BPS state appears ($\Omega: 0 \to 1$), the entanglement entropy jumps by:

$$\Delta S = \log 1 - \log 0 = +\infty$$

This is a true phase transition (logarithmic divergence). For walls where bound states form ($\Omega: 1 \to 2$), the jump is finite:

$$\Delta S = \log 2 - \log 1 = \log 2 \approx 0.693$$

**Entanglement entropy across walls.** The KS wall crossing formula (A1-29) gives the exact change in BPS degeneracies $\Omega(\gamma)$. The entanglement entropy after wall crossing is:

$$S' = \log\left( \sum_\gamma \Omega'(\gamma) \right) = \log\left( \sum_\gamma \Omega(\gamma) + \Delta\Omega \right)$$

where $\Delta\Omega$ is the KS jump. For the 78 record gaps, each wall crossing adds one BPS state, so after $k$ walls:

$$S_k = \log(78 + k)$$

In the physical chamber ($k=0$), $S = \log 78$. After all 78 walls (UV chamber), $S = \log 156$.

**Critical behavior near walls.** Near a wall at $u = u_c$, the entanglement entropy has a logarithmic singularity:

$$S(u) \sim -\log|u - u_c|$$

This is the hallmark of a continuous quantum phase transition. The critical exponent is universal and determined by the KS formula.

**Multiple wall crossings.** When multiple walls are crossed simultaneously (e.g., at the self-dual point $d = 16$, A1-29 piece 05), the entanglement entropy has a higher-order singularity. The monodromy $\mathbb{M}_{16}$ (A1-29 piece 08) acts on the entropy as:

$$S \mapsto S + \log|\det \mathbb{M}_{16}| = S + \log 1 = S$$

The entropy is invariant under the full monodromy, as expected for a topological quantity.

**Physical chamber = no phase transitions.** In the physical chamber (actual prime gaps), no walls are crossed. The entanglement entropy is a smooth function of the proper time $\tau$:

$$S(\tau) = \log 78 = \text{constant}$$

This smoothness is equivalent to the Riemann Hypothesis (A1-30). If RH is violated, a wall would appear in the physical chamber, causing a phase transition in $S(\tau)$.

**Entanglement entropy from PrimeBookOne books.** The 3500 books provide a natural time slicing. The entanglement entropy between book $1..b$ and book $b+1..3500$ is:

$$S(b) = \log 78 + \delta S(b)$$

where $\delta S(b)$ are small fluctuations from gap correlations. The PrimeBookOne data shows $\delta S(b) \ll 1$ for all $b$, confirming the absence of phase transitions.