# A1-33 Worldline_Modular_Hamiltonian.md — Piece 02
## Exact Modular Hamiltonian for Gaussian Worldline States

The worldline state is Gaussian in the prime gap basis (A1-31 piece 01). The modular Hamiltonian has an explicit quadratic form.

**Covariance matrix from gap correlations.** The covariance matrix for region A (proper-time steps $n \in A$) is:
$$\Sigma_A = \kappa^2 \left( \langle d_n d_m \rangle_A - \langle d_n \rangle_A \langle d_m \rangle_A \right)_{n,m \in A}$$

From PrimeBookOne (A1-08), the two-point function $\langle d_n d_m \rangle$ is known exactly for all $n,m$. The 3500 books give 3500 correlation matrices $C(r) = \langle d_n d_{n+r} \rangle / \langle d \rangle^2 - 1$.

**Williamson diagonalization.** $\Sigma_A$ is symplectically diagonalized by $S \in \text{Sp}(2|A|, \mathbb{R})$:
$$S \Sigma_A S^T = \bigoplus_{k=1}^{|A|} \begin{pmatrix} \nu_k & 0 \\ 0 & \nu_k \end{pmatrix}, \quad \nu_k \geq \frac{1}{2}$$

The symplectic eigenvalues $\nu_k$ are the positive square roots of the eigenvalues of $-\Sigma_A \Omega \Sigma_A \Omega$, where $\Omega = \begin{pmatrix} 0 & \mathbb{I} \\ -\mathbb{I} & 0 \end{pmatrix}$ is the standard symplectic form.

**Modular Hamiltonian in diagonal basis.** In the diagonal basis, the modular Hamiltonian is:
$$K_A = \sum_{k=1}^{|A|} \epsilon_k \left( b_k^\dagger b_k + \frac{1}{2} \right)$$
where $\epsilon_k = \log\left( \frac{\nu_k + 1/2}{\nu_k - 1/2} \right)$ are the modular energies. The zero-point energy $\frac{1}{2}\sum_k \epsilon_k$ is the modular vacuum energy.

**Modular energies from gap ratios.** The $\epsilon_k$ are determined by the gap ratio spectrum. For translation-invariant gap correlations (A1-08), in the large-|A| limit, the eigenvalues follow the Szegő limit theorem:
$$\epsilon(\theta) = \log\left( \frac{\sqrt{1 + 4\kappa^2\langle d\rangle^2 f(\theta)} + 1}{\sqrt{1 + 4\kappa^2\langle d\rangle^2 f(\theta)} - 1} \right)$$
where $f(\theta) = \sum_r C(r) e^{-i r \theta}$ is the gap correlation spectral density, and $C(r)$ is the translation-invariant correlation function.

**BPS sector: zero modular energies.** For the 78 BPS states, $\nu_k = \infty$ (infinite squeezing), giving $\epsilon_k = 0$. Thus $K_{\text{BPS}} = \text{const.} = \log 78 \cdot \mathbb{I}$, consistent with $K_{\text{BPS}} = \log 78 \cdot \mathbb{I}$.

**PrimeBookOne modular spectrum.** The 3500 books give 3500 modular Hamiltonians $K_A(b)$ with spectra $\{\epsilon_k(b)\}$. In the physical chamber (RH true), the spectrum is smooth across books. The BPS zero modes are exactly 78 for all physical chamber books.