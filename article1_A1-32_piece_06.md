# A1-32 Worldline_Renyi_Entropies.md — Piece 06
## Renyi Entropies from Gap Ratios — Exact PrimeBookOne Computation

The Renyi entropies are computable directly from the gap ratio statistics in PrimeBookOne without diagonalizing the full covariance matrix.

**Gap ratio distribution.** The key statistic is the two-point gap correlation:

$$C(n,m) = \frac{\langle d_n d_m \rangle}{\langle d \rangle^2} - 1$$

From PrimeBookOne, $C(n,m)$ is known for all $n,m$ up to the book size. The covariance matrix is $\Sigma_{nm} = \kappa^2 \langle d \rangle^2 C(n,m)$.

**Renyi entropy from eigenvalues of C.** The symplectic eigenvalues $\nu_k$ of $\Sigma$ are related to the eigenvalues $\lambda_k$ of the correlation matrix $C$ by $\nu_k = \frac{1}{2} \sqrt{1 + 4 \kappa^2 \langle d \rangle^2 \lambda_k}$ (for Gaussian states).

**Efficient computation via gap ratios.** For a contiguous region of $L$ proper-time steps, the Renyi entropy can be computed from the eigenvalues of the $L \times L$ correlation submatrix. For large $L$, the eigenvalues follow the Szegő limit theorem:

$$\lambda_k \sim f\left(\frac{k}{L}\right), \quad f(\theta) = \sum_{r=-\infty}^\infty C(r) e^{-i r \theta}$$

where $C(r) = \langle d_n d_{n+r} \rangle / \langle d \rangle^2 - 1$ is the translation-invariant gap correlation.

**Renyi entropy integral formula.** In the large-$L$ limit:

$$\frac{S_n}{L} \to \int_0^1 \frac{1}{1-n} \log \left[ \left(\frac{\sqrt{1+4\kappa^2\langle d\rangle^2 f(\theta)}+1}{2}\right)^n - \left(\frac{\sqrt{1+4\kappa^2\langle d\rangle^2 f(\theta)}-1}{2}\right)^n \right] d\theta$$

**PrimeBookOne provides exact $C(r)$.** The 3.67 billion gaps give $C(r)$ for all $r$ up to $\sim 10^6$. The integral can be evaluated numerically to arbitrary precision.

**Special case: $n=2$ (collision entropy).** $S_2 = -\log \text{Tr}(\rho^2)$. For Gaussian states:

$$S_2 = -\sum_k \log \left[ 1 - \frac{1}{2(\nu_k + 1/2)^2} \right]$$

This is directly computable from the gap correlation spectrum $f(\theta)$.

**Verification against A1-31.** At $n=1$, the integral formula reproduces the von Neumann entropy from A1-31 piece 02. The PrimeBookOne data yields $S_1(b) \approx \log 78 \approx 4.36$ for all physical chamber books, with fluctuations $\ll 1$.