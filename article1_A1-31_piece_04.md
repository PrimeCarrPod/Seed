# A1-31 Worldline_Entanglement_Entropy.md — Piece 04
## Gaussian State Entanglement Formula

The worldline state constructed from prime gaps is approximately Gaussian because the gap fluctuations are sums of many independent contributions (Central Limit Theorem). The exact entanglement formula for Gaussian states gives the entanglement entropy in terms of the covariance matrix.

**Gaussian state from prime gaps.** The proper-time steps $\Delta\tau_n = \kappa d_n$ have distribution:

$$P(\{\Delta\tau_n\}) \sim \exp\left( -\frac{1}{2} \sum_{nm} \Delta\tau_n \Sigma^{-1}_{nm} \Delta\tau_m \right)$$

This is a Gaussian state in the continuous variable Hilbert space of the worldline. The covariance matrix $\Sigma$ is determined by the gap correlations (piece 03).

**Entanglement entropy for Gaussian states.** For a Gaussian state with covariance matrix $\Sigma$, the entanglement entropy of a subsystem $A$ (a subset of indices) is:

$$S(A) = \sum_{k \in A} \left[ \left(\nu_k + \frac{1}{2}\right) \log\left(\nu_k + \frac{1}{2}\right) - \left(\nu_k - \frac{1}{2}\right) \log\left(\nu_k - \frac{1}{2}\right) \right]$$

where $\nu_k$ are the symplectic eigenvalues of the reduced covariance matrix $\Sigma_A$. For a single mode, this reduces to:

$$S(\nu) = \left(\nu + \frac{1}{2}\right) \log\left(\nu + \frac{1}{2}\right) - \left(\nu - \frac{1}{2}\right) \log\left(\nu - \frac{1}{2}\right)$$

**Application to prime gaps.** For the prime gap Gaussian state, the symplectic eigenvalues are $\nu_k = \frac{1}{2} \coth(\beta \omega_k/2)$ where $\omega_k$ are the normal mode frequencies. The frequencies are determined by the gap correlation spectrum.

**High-temperature limit.** For $\beta \omega_k \ll 1$ (high temperature or small gaps), $\nu_k \approx 1/(\beta \omega_k)$ and:

$$S \approx \sum_k \left[ \log(\beta \omega_k) + 1 \right]$$

**Low-temperature limit.** For $\beta \omega_k \gg 1$ (low temperature or large gaps), $\nu_k \approx 1/2 + e^{-\beta \omega_k}$ and:

$$S \approx \sum_k e^{-\beta \omega_k} (\beta \omega_k + 1)$$

The BPS sector corresponds to the zero modes $\omega_k = 0$, giving $\nu = \infty$ and $S = \log 78$ (the degeneracy of zero modes).

**Symplectic spectrum from PrimeBookOne.** The 3.67 billion gap differences provide the exact normal mode frequencies $\omega_k$ through the Fourier transform of the correlation function. The symplectic eigenvalues are then computed from $\omega_k$ and the temperature $\beta^{-1}$.

**Continuum limit.** In the continuum limit (book size $2^{20} \to \infty$), the sum over modes becomes an integral:

$$S = \int_0^\Lambda \frac{d\omega}{2\pi} \rho(\omega) \left[ \left(\nu(\omega) + \frac{1}{2}\right) \log\left(\nu(\omega) + \frac{1}{2}\right) - \left(\nu(\omega) - \frac{1}{2}\right) \log\left(\nu(\omega) - \frac{1}{2}\right) \right]$$

where $\rho(\omega)$ is the density of states, which is related to the prime gap distribution.