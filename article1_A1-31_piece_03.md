# A1-31 Worldline_Entanglement_Entropy.md — Piece 03
## Covariance Matrix from Gap Correlations (A1-08)

The proper-time fluctuation spectrum (A1-08) provides the two-point correlation function of prime gaps, which determines the covariance matrix for the Gaussian state entanglement.

**Gap correlation function.** From A1-08, the gap distribution has mean $\langle d \rangle \sim \log p$ and variance $\sigma^2 \sim \log p$. The two-point function is:

$$\langle d_n d_m \rangle = \langle d \rangle^2 + C_{nm}$$

where $C_{nm}$ is the connected correlation function. For the prime gaps, the correlations are short-range:

$$C_{nm} \sim \sigma^2 \delta_{nm} + O(e^{-|n-m|/\xi})$$

with correlation length $\xi \sim \log p$.

**Covariance matrix for proper time.** The proper-time steps are $\Delta\tau_n = \kappa d_n$. The covariance matrix is:

$$\Sigma_{nm} = \langle \Delta\tau_n \Delta\tau_m \rangle - \langle \Delta\tau_n \rangle \langle \Delta\tau_m \rangle = \kappa^2 C_{nm}$$

In the diagonal approximation ($C_{nm} \approx \sigma^2 \delta_{nm}$):

$$\Sigma_{nm} \approx \kappa^2 \sigma^2 \delta_{nm}$$

**Block structure from books.** The 3500 books of PrimeBookOne (A1-10) give a natural block structure. Each book $b$ contains $2^{20}$ gaps. The covariance matrix has block diagonal form:

$$\Sigma = \bigoplus_{b=1}^{3500} \Sigma^{(b)} + \text{inter-book correlations}$$

where $\Sigma^{(b)}$ is the covariance within book $b$. The inter-book correlations are negligible for well-separated books.

**Book entropy.** The entanglement entropy of a single book $b$ is:

$$S(b) = \frac{1}{2} \log \det(2\pi e \Sigma^{(b)}) \approx 2^{20} \cdot \frac{1}{2} \log(2\pi e \kappa^2 \sigma_b^2)$$

where $\sigma_b^2$ is the gap variance in book $b$. The total entropy is the sum over books:

$$S_{\text{total}} = \sum_{b=1}^{3500} S(b) \approx 3500 \cdot 2^{20} \cdot \frac{1}{2} \log(2\pi e \kappa^2 \langle \sigma^2 \rangle)$$

**Scaling with book index.** As $b$ increases (higher primes), the average gap $\langle d \rangle_b \sim \log p_b$ increases, and the variance $\sigma_b^2 \sim \log p_b$ also increases. The book entropy scales as:

$$S(b) \sim 2^{20} \cdot \frac{1}{2} \log \log p_b$$

This is a slow logarithmic growth of entanglement with prime index.

**PrimeBookOne verification.** The 3.67 billion gap differences provide the exact correlation matrix $C_{nm}$. The determinant $\det \Sigma$ can be computed numerically and matches the theoretical formula to within statistical fluctuations.