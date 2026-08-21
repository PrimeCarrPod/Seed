# A1-34 Worldline_Relative_Entropy.md — Piece 03
## Relative Entropy as Renyi Limit — Connection to A1-32

The relative entropy is the $n \to 1$ limit of the Renyi divergences (A1-32).

**Renyi divergence definition.** For two states $\rho, \sigma$:
$$D_n(\rho||\sigma) = \frac{1}{n-1} \log \text{Tr}\left( \rho^n \sigma^{1-n} \right)$$
This is the sandwiched Renyi divergence.

**Limit to relative entropy.** 
$$\lim_{n \to 1} D_n(\rho||\sigma) = S(\rho||\sigma)$$

**Derivative at n=1.** The derivative gives the relative entropy variance:
$$\left. \frac{\partial}{\partial n} D_n(\rho||\sigma) \right|_{n=1} = \frac{1}{2} \text{Var}_\rho(\log \rho - \log \sigma)$$

**Renyi divergence for Gaussian states.** For Gaussian states with covariance matrices $\Sigma_\rho, \Sigma_\sigma$:
$$D_n(\rho||\sigma) = \frac{1}{n-1} \sum_k \log \left[ \frac{(\nu_k^\rho + 1/2)^n (\nu_k^\sigma - 1/2)^{1-n} - (\nu_k^\rho - 1/2)^n (\nu_k^\sigma + 1/2)^{1-n}}{(\nu_k^\rho + 1/2) (\nu_k^\sigma - 1/2) - (\nu_k^\rho - 1/2) (\nu_k^\sigma + 1/2)} \right]$$

**BPS sector: all Renyi divergences zero.** For $\rho^{\text{BPS}} = \sigma^{\text{BPS}} = \frac{1}{78}\mathbb{I}$:
$$D_n^{\text{BPS}}(\rho||\sigma) = 0 \quad \text{for all } n$$

**Renyi divergence and modular Hamiltonian.** The Renyi divergence is the modular free energy difference:
$$D_n(\rho||\sigma) = \frac{1}{n-1} \log \text{Tr}\left( e^{-(n-1)K_\sigma} \rho^n \right)^{1/n}$$

**PrimeBookOne Renyi divergence profiles.** The 3500 books give 3500 Renyi divergence profiles $D_n(b||b')$. In the physical chamber, all $D_n$ are small and smooth.

**Derivative of Renyi divergence at n=1.** The derivative gives the relative entropy variance:
$$\left. \frac{\partial}{\partial n} D_n(\rho||\sigma) \right|_{n=1} = \frac{1}{2} \text{Var}_\rho(\log \rho - \log \sigma) = \frac{1}{2} \left( \langle K_\sigma^2 \rangle_\rho - \langle K_\sigma \rangle_\rho^2 \right)$$
This is the modular specific heat (A1-33 piece 07) in the state $\rho$.

**Renyi divergence and the 256-dim Hilbert space.** For the full 256-dim space with 78 BPS + 176 non-BPS + 2 Goldstino:
$$D_n(\rho||\sigma) = \frac{1}{n-1} \log \left[ 78 \left(\frac{1}{78}\right)^n + \sum_{\text{non-BPS}} p_k^n q_k^{1-n} + 2 p_G^n q_G^{1-n} \right]$$
where $p_k, q_k$ are eigenvalues of $\rho, \sigma$.

**BPS sector: exact Renyi algebra.** The BPS Renyi divergences are identically zero for all $n$, reflecting the exact degeneracy of the 78 BPS states.