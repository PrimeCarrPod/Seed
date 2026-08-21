# A1-29 Worldline_Wall_Crossing.md — Piece 07
## Gap Class Transitions as Wall Crossing Events

From A1-19, instanton solutions describe tunneling between gap classes on the prime electron worldline. Each gap class is defined by a set of gap values that the proper-time steps $\Delta\tau = \kappa d_n$ can take. A wall crossing event corresponds to a transition between gap classes where a new record gap appears.

**Gap classes and proper-time sectors.** The 3500 books of PrimeBookOne (A1-10) correspond to 3500 worldline segments. Within each segment, the gap sequence $\{d_n\}$ defines a gap class. The record gaps mark the boundaries between gap classes — when a new record gap $d_{\text{rec}}^{(k)}$ occurs, the worldline enters a new proper-time sector with larger proper-time jumps.

**Instanton tunneling between gap classes.** The instanton solutions of A1-19 describe tunneling between adjacent gap classes. The instanton action for the transition from gap class $C_{k-1}$ to $C_k$ (where $C_k$ includes the new record gap $d_{\text{rec}}^{(k)}$) is:

$$S_{\text{inst}}^{(k)} = \frac{1}{\hbar} \int d\tau \left( \frac{1}{2} \dot{x}^2 + V(d_n) \right)_{\text{inst}}$$

where the potential $V(d_n)$ is determined by the gap statistics. The tunneling amplitude is $\sim \exp(-S_{\text{inst}}^{(k)})$.

**Wall crossing = instanton condensation.** At the wall of marginal stability corresponding to record gap $k$, the instanton tunneling amplitude becomes of order 1 — the instantons condense. This is the physical mechanism of wall crossing: the worldline "decides" to include the new record gap in its proper-time sequence, changing the BPS spectrum.

**Gap class hierarchy.** The gap classes form a hierarchy indexed by the record gaps:

$$C_1 \subset C_2 \subset \dots \subset C_{78}$$

where $C_k$ is the set of gaps $\{d_n : d_n \leq d_{\text{rec}}^{(k)}\}$. The physical gap class is $C_{78}$ (all 78 record gaps included). Each inclusion $C_{k-1} \hookrightarrow C_k$ is a wall crossing event.

**Topological charge of gap transitions.** The topological charge of the transition from $C_{k-1}$ to $C_k$ is the difference in the index theorem:

$$\Delta Q = \text{Index}(D_\tau^{(C_k)}) - \text{Index}(D_\tau^{(C_{k-1})}) = 1$$

This matches the fact that each record gap adds exactly one BPS state (piece 06).

**Time-ordered wall crossing.** The wall crossing events are time-ordered by the book index (A1-10). The $k$-th wall crossing occurs at book $b_k$ (the book containing the $k$-th record gap). The proper time of the wall crossing is:

$$\tau_k = \kappa \sum_{i=1}^{b_k} \langle d \rangle_i$$

where $\langle d \rangle_i$ is the average gap in book $i$. The sequence of wall crossings is the "worldline history" of the BPS spectrum.

**Carrington events as wall crossing.** From the Earthbeat chambers (CSM), the Carrington-class alerts (Kp ≥ 7, E-field > 20 V/km) correspond to extreme gap fluctuations that trigger wall crossing events. The stochastic generation of prime gaps by the Earthbeat chambers models the wall crossing process in real time.