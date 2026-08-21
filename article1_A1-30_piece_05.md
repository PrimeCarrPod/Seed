# A1-30 Worldline_Stability_Conditions.md — Piece 05
## Relevant Operators and Gap Scaling

The stability of the worldline under RG flow is determined by the spectrum of relevant operators. For the prime electron, the relevant operators are associated with gap fluctuations that grow under RG flow.

**Gap operators.** The primary operators in the worldline CFT are the gap operators $\mathcal{O}_n = d_n d_{n+1}$ (from the Hamiltonian A1-17). Their scaling dimensions $\Delta_n$ determine whether they are relevant ($\Delta < 2$), marginal ($\Delta = 2$), or irrelevant ($\Delta > 2$).

**Scaling dimensions from prime statistics.** The two-point function of gap operators is:

$$\langle \mathcal{O}_n(\tau) \mathcal{O}_m(0) \rangle \sim \frac{\delta_{nm}}{|\tau|^{2\Delta_n}}$$

From the prime gap statistics (A1-08), the gap distribution has variance $\sigma^2 \sim \log p$. The scaling dimension is:

$$\Delta_n = 2 - \frac{1}{\log p_n} + O\left(\frac{1}{\log^2 p_n}\right)$$

Thus the gap operators are *slightly relevant* — they grow under RG flow toward the IR. This is the mechanism that drives the flow to the self-dual point $d = 16$.

**Most relevant operator.** The most relevant operator is associated with the smallest gaps (twin primes $d = 2$). For $d = 2$, the scaling dimension is:

$$\Delta_{\text{twin}} = 2 - \frac{1}{\log 3} \approx 1.91$$

This is the most relevant operator in the theory. It corresponds to the twin prime sector (A1-35).

**Relevant operators and stability.** If there were operators with $\Delta < 1$ (strongly relevant), they would destabilize the fixed point and cause a phase transition. The prime gap statistics ensure that all operators have $\Delta > 1$, so the fixed point is stable. The condition $\Delta_n > 1$ is equivalent to:

$$\log p_n > 1 \quad \text{for all } n$$

which is true for all primes $p_n \geq 2$.

**Gap ratio operators.** The operators $\mathcal{R}_n = d_{n+1}/d_n$ (gap ratios) have scaling dimensions:

$$\Delta(\mathcal{R}_n) = \frac{2}{\log p_n} + O\left(\frac{1}{\log^2 p_n}\right)$$

These are *irrelevant* operators ($\Delta > 2$), meaning gap ratios flow to constants under RG. This is why the record gap ratios approach a limiting distribution (Cramér's conjecture).

**Stability against perturbations.** Adding a perturbation $\delta S = \int d\tau \sum_n g_n \mathcal{O}_n$ to the worldline action (A1-16) changes the gap sequence. The theory is stable against such perturbations iff the couplings $g_n$ are small. The physical prime gaps correspond to a specific choice of $g_n$ that satisfies the RH bound.

**Connection to A1-36 (Decoupling Limits).** The irrelevant operators (gap ratios) decouple in the IR limit $d \to 16$, leaving only the marginal operator (the average gap). The relevant operators (gap values) determine the flow trajectory. The decoupling of heavy gaps (large $d$) is the EFT limit (A1-36).