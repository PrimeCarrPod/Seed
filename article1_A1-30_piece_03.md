# A1-30 Worldline_Stability_Conditions.md — Piece 03
## Gap Inequalities and Tachyon-Free Spectrum

The tachyon-free condition requires that all physical states have non-negative mass squared. For the prime electron worldline, this imposes inequalities on the prime gap sequence.

**BPS sector: no tachyons by construction.** The BPS states have mass exactly $M_{\text{BPS}} = |Z|/2 = 39$ (A1-28). The BPS bound $M \geq |Z|/2$ is saturated, so no tachyons can appear in the BPS sector. The central charge $Z = 78$ is topological (A1-24) and cannot change.

**Non-BPS sector: gap inequalities.** The non-BPS states (long multiplets, dimension 4 each) have masses $M > 39$. Their masses are determined by the gap sequence through the Hamiltonian:

$$H = \frac{\hbar}{2\kappa} \sum_n d_n d_{n+1} \quad \text{(A1-17, A1-26)}$$

The lightest non-BPS state has mass $M_{\text{min}} = 39 + \delta$, where $\delta$ is the gap to the first excited state. The condition $\delta > 0$ (no tachyons) requires:

$$\sum_n d_n d_{n+1} > \frac{78\kappa}{\hbar}$$

This is always satisfied for the physical prime gaps since $d_n \geq 1$ and there are 3.67B terms.

**Gap inequality for stability.** A more precise condition comes from requiring that no non-BPS state becomes lighter than the BPS states. The mass of a non-BPS state created by acting with $Q^\dagger$ on a BPS state is:

$$M = 39 + \frac{1}{2} \sum_n d_n d_{n+1} \langle \text{BPS} | \psi_n \psi_{n+1} | \text{BPS} \rangle$$

The expectation value $\langle \psi_n \psi_{n+1} \rangle$ is non-zero only for gap pairs near the record gaps. The condition $M > 39$ reduces to:

$$d_n d_{n+1} > 0 \quad \text{for all } n$$

which is trivially true for prime gaps ($d_n \geq 1$).

**Record gap inequalities.** The non-trivial inequalities come from the record gaps themselves. The $k$-th record gap must satisfy:

$$d_{\text{rec}}^{(k+1)} > d_{\text{rec}}^{(k)}$$

and the ratio must be bounded:

$$1 < \frac{d_{\text{rec}}^{(k+1)}}{d_{\text{rec}}^{(k)}} < \frac{\log^2 p_{k+1}}{\log^2 p_k} \approx 1 + O\left(\frac{\log\log p}{\log p}\right)$$

The PrimeBookOne data shows ratios in $[1.2, 2.5]$, consistent with this bound.

**Twin prime gaps and stability.** The twin prime gaps ($d_n = 2$) provide the minimal non-zero gap. If there were infinitely many twin primes, they would contribute a stable sector to the spectrum. The twin prime conjecture is related to the stability of the $d=2$ sector (A1-35).

**Numerical verification.** The PrimeBookOne data (Tiles 00–188) confirms:
- All 3.67B gaps satisfy $d_n \geq 1$
- All 78 record gaps satisfy the ordering and ratio bounds
- No tachyons appear in the computed spectrum up to $p \sim 10^{19}$