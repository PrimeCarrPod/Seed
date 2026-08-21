# A1-31 Worldline_Entanglement_Entropy.md — Piece 06
## Renyi Entropies S_n from Gap Ratios (A1-32)

The Renyi entropies $S_n = \frac{1}{1-n} \log \text{Tr}(\rho^n)$ provide a one-parameter family of entanglement measures. For the prime electron worldline, the Renyi entropies are determined by the prime gap ratios.

**Renyi entropy definition.** For the reduced density matrix $\rho_A$ of subsystem A:

$$S_n(A) = \frac{1}{1-n} \log \text{Tr}(\rho_A^n)$$

For a Gaussian state (piece 04), the Renyi entropies are:

$$S_n = \sum_k \frac{1}{1-n} \log\left[ \left(\nu_k + \frac{1}{2}\right)^n - \left(\nu_k - \frac{1}{2}\right)^n \right]$$

where $\nu_k$ are the symplectic eigenvalues.

**Gap ratios as Renyi parameters.** The gap ratios $r_n = d_{n+1}/d_n$ (A1-30 piece 05) control the Renyi parameter $n$. Specifically, the ratio of consecutive Renyi entropies is:

$$\frac{S_n}{S_{n+1}} \sim \langle r_n \rangle$$

where $\langle r_n \rangle$ is the average gap ratio. This identifies the gap ratios as the natural "temperature" parameters for the Renyi flow.

**Renyi flow = RG flow.** The parameter $n$ in $S_n$ plays the role of inverse temperature in the replica trick. The Renyi flow $n \mapsto n'$ corresponds to the RG flow on the moduli space (A1-30 piece 04). The fixed points are:
- $n \to 1$: von Neumann entropy (physical point)
- $n \to \infty$: min-entropy (largest gap)
- $n \to 0$: max-entropy (Hartley entropy)

**Renyi entropies of BPS sector.** For the BPS sector with $\rho_{\text{BPS}} = \frac{1}{78}\mathbb{1}_{78}$:

$$S_n^{\text{BPS}} = \frac{1}{1-n} \log\left( 78 \cdot \left(\frac{1}{78}\right)^n \right) = \log 78 \quad \text{for all } n$$

The BPS Renyi entropies are independent of $n$ because the BPS density matrix is maximally mixed. This is a signature of topological protection.

**Renyi entropies of full system.** For the full system with thermal weights $p_i = e^{-\beta E_i}/Z$:

$$S_n = \frac{1}{1-n} \log\left( \sum_i p_i^n \right)$$

The non-BPS states have $E > 39$, so their contribution is suppressed at low temperature. As $n$ varies, different energy levels dominate.

**Gap ratio statistics.** The PrimeBookOne data provides the distribution of gap ratios $r_n = d_{n+1}/d_n$. The distribution has:
- Mean $\langle r \rangle \approx 1.5$
- Variance $\text{Var}(r) \approx 0.3$
- Tail $P(r > x) \sim e^{-x}$ for large $x$

These statistics determine the Renyi spectrum $S_n$.

**Connection to A1-32.** The Renyi entropies are the subject of A1-32. They provide a finer probe of the entanglement structure than the von Neumann entropy alone.