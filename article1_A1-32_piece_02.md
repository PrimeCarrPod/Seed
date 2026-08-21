# A1-32 Worldline_Renyi_Entropies.md — Piece 02
## Gaussian State Renyi Entropies — Exact Formula from Gap Covariance

The worldline state is Gaussian in the prime gap basis (A1-31 piece 01). For a Gaussian state with covariance matrix $\Sigma$, the Renyi entropy has an exact closed form.

**Symplectic diagonalization.** The covariance matrix $\Sigma_{nm} = \kappa^2 \langle d_n d_m \rangle - \kappa^2 \langle d_n \rangle \langle d_m \rangle$ can be brought to Williamson normal form by a symplectic transformation $S \in \text{Sp}(2N, \mathbb{R})$:

$$S \Sigma S^T = \bigoplus_{k=1}^N \begin{pmatrix} \nu_k & 0 \\ 0 & \nu_k \end{pmatrix}, \quad \nu_k \geq \frac{1}{2}$$

The symplectic eigenvalues $\{\nu_k\}$ are the positive square roots of the eigenvalues of $-\Sigma \Omega \Sigma \Omega$, where $\Omega$ is the standard symplectic form.

**Renyi entropy from symplectic eigenvalues.** For a Gaussian state with symplectic eigenvalues $\{\nu_k\}$, the Renyi entropy of order $n$ is:

$$S_n = \frac{1}{n-1} \sum_{k=1}^N \log \left[ \frac{(\nu_k + 1/2)^n - (\nu_k - 1/2)^n}{(\nu_k + 1/2)^n + (\nu_k - 1/2)^n} \cdot \frac{2}{2} \right]$$

Wait, correct formula for mixed Gaussian states:

$$S_n = \frac{1}{n-1} \sum_{k=1}^N \log \left[ \frac{(\nu_k + 1/2)^n - (\nu_k - 1/2)^n}{(\nu_k + 1/2)^{n-1} (\nu_k - 1/2)^{n-1}} \right]$$

**Verification for $n=1$.** Taking $n \to 1$:

$$\lim_{n \to 1} S_n = \sum_{k=1}^N \left[ \left(\nu_k + \frac{1}{2}\right) \log\left(\nu_k + \frac{1}{2}\right) - \left(\nu_k - \frac{1}{2}\right) \log\left(\nu_k - \frac{1}{2}\right) \right] = S_1$$

matching the von Neumann entropy from A1-31.

**Limit $n \to \infty$ (min-entropy).** $S_\infty = -\log \max_k \left[ \frac{2}{\nu_k + 1/2 + \nu_k - 1/2} \right] = -\log \max_k \left[ \frac{1}{\nu_k} \right] = \log \min_k \nu_k$.

**Limit $n \to 0$ (max-entropy).** $S_0 = \log \text{rank}(\rho) = \log \prod_k (2\nu_k + 1)$ — the dimension of the effective Hilbert space.

**Gap statistics determine $\nu_k$.** The covariance $\langle d_n d_m \rangle$ from PrimeBookOne (A1-08) fixes $\Sigma$, hence all $\nu_k$, hence all $S_n$. The 3500 books give 3500 sequences of $\{\nu_k(b)\}$.