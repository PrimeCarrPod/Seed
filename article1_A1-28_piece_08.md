# A1-28 Worldline_BPS_States.md — Piece 08
## BPS States and Pair Creation — e⁻/e⁺ from Chirality

From A1-07, the prime electron worldline describes a single electron propagating both forward and backward in proper time. Forward-time propagation corresponds to the electron $e^-$; backward-time propagation corresponds to the positron $e^+$. The supercharge $Q$ (A1-26) implements the chirality flip that exchanges these two branches:

$$Q |e^-\rangle \propto |e^+\rangle, \quad Q^\dagger |e^+\rangle \propto |e^-\rangle$$

**BPS states as Majorana-like states.** The BPS states satisfy $Q|\text{BPS}\rangle = Q^\dagger|\text{BPS}\rangle = 0$ (piece 05). This means they are invariant under the electron/positron exchange — they are their own antiparticles in the worldline sense. This is the precise realization of Wheeler's one-electron universe: the 78 BPS states are the 78 "strands" of the single worldline that are topologically protected and do not annihilate.

**Chirality and charge conjugation.** The charge conjugation operator $C$ acts on the Hilbert space as (A1-26 piece 03):

$$C \psi_n C^{-1} = \psi_n^\dagger, \quad C Q C^{-1} = Q^\dagger$$

The BPS states have definite charge conjugation eigenvalue:

$$C |\text{BPS}_k\rangle = \eta_k |\text{BPS}_k\rangle, \quad \eta_k = \pm 1$$

The 71 positive-chirality BPS states have $\eta = +1$ (even under $e^- \leftrightarrow e^+$), while the 7 negative-chirality BPS states have $\eta = -1$ (odd). This matches the chirality assignment from piece 03.

**Pair creation amplitude.** The amplitude for creating an $e^-e^+$ pair from the vacuum is given by the supercharge matrix element:

$$\mathcal{A}_{\text{pair}} = \langle e^+ e^- | Q | 0 \rangle$$

From A1-07 piece 08, this amplitude is proportional to $\sqrt{d_n d_{n+1}}$ for the gap pair at the vertex. The BPS states are the zero modes of this process — they are the configurations where pair creation is topologically forbidden (or rather, the created pair immediately recombines into the BPS state).

**Vertex interaction from A1-06.** The interaction vertices are at prime positions $p_n$ (A1-06). The BPS states are localized at the 78 record gap vertices — the most "extreme" interaction points where the proper-time jump is maximal. The pair creation rate at a record gap vertex is:

$$\Gamma_k \sim \exp\left( - \frac{d_{\text{rec}}^{(k)}}{d_*} \right)$$

For $d_{\text{rec}} \gg d_* = 16$, the rate is exponentially suppressed. The 71 BPS states with $d > 16$ are thus extremely stable against pair creation/annihilation — they are the long-lived "electron strands" in the one-electron universe.

**Connection to anomaly inflow (A1-23).** The anomaly coefficient $\mathcal{A} = 78$ counts the net chirality of zero modes at the worldline boundary. The 78 BPS states are precisely these zero modes, with the chirality asymmetry $71 - (-7) = 78$ matching the anomaly. Pair creation at the boundary is forbidden for the BPS states — they are the protected edge modes of the worldline topological insulator.