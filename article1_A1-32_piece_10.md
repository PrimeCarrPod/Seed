# A1-32 Worldline_Renyi_Entropies.md — Piece 10
## Renyi Entropies and Relative Entropy — Connection to A1-34

The Renyi entropies are the building blocks of the relative entropy $S(\rho||\sigma)$ (A1-34), which measures the distinguishability of two worldline states.

**Relative entropy as limit of Renyi.** The quantum relative entropy is:
$$S(\rho||\sigma) = \text{Tr}(\rho \log \rho) - \text{Tr}(\rho \log \sigma)$$

It can be obtained from the Renyi divergences:
$$D_n(\rho||\sigma) = \frac{1}{n-1} \log \text{Tr}\left( \rho^n \sigma^{1-n} \right)$$

$$\lim_{n \to 1} D_n(\rho||\sigma) = S(\rho||\sigma)$$

**Sandwiched Renyi divergence.** The sandwiched version is more natural for modular flow:
$$\tilde{D}_n(\rho||\sigma) = \frac{1}{n-1} \log \text{Tr}\left[ \left( \sigma^{\frac{1-n}{2n}} \rho \sigma^{\frac{1-n}{2n}} \right)^n \right]$$

For commuting $\rho, \sigma$ (classical gap distributions), $D_n = \tilde{D}_n$.

**Gap ratio relative entropy.** For two books $b$ and $b'$ with gap correlations $C(r)$ and $C'(r)$:
$$S(\rho_b || \rho_{b'}) = \frac{1}{2} \text{Tr}\left[ \Sigma_b^{-1} \Sigma_{b'} - \mathbb{I} - \log(\Sigma_b^{-1} \Sigma_{b'}) \right]$$

This is the KL divergence between the Gaussian gap distributions.

**Renyi divergence from gap ratios.** The Renyi divergence is:
$$D_n(\rho_b || \rho_{b'}) = \frac{1}{n-1} \sum_k \log \left[ \frac{(\nu_k^b + 1/2)^n (\nu_k^{b'} - 1/2)^{1-n} - (\nu_k^b - 1/2)^n (\nu_k^{b'} + 1/2)^{1-n}}{(\nu_k^b + 1/2) (\nu_k^{b'} - 1/2) - (\nu_k^b - 1/2) (\nu_k^{b'} + 1/2)} \right]$$

**Physical chamber: zero relative entropy.** For books in the physical chamber (no wall crossing), the BPS sector is identical: $\rho_b^{\text{BPS}} = \rho_{b'}^{\text{BPS}} = \frac{1}{78}\mathbb{I}_{78}$. Thus:
$$S(\rho_b^{\text{BPS}} || \rho_{b'}^{\text{BPS}}) = 0$$

The non-BPS sector has small differences due to thermal weights. The total relative entropy is small and smooth.

**Wall crossing: infinite relative entropy.** At a wall, the BPS count changes: $N_{\text{BPS}}^- \neq N_{\text{BPS}}^+$. The supports of $\rho_-$ and $\rho_+$ differ, giving:
$$S(\rho_- || \rho_+) = \infty$$

**PrimeBookOne relative entropy scan.** The 3500 books can be pairwise compared. The physical chamber shows $S(\rho_b || \rho_{b'}) \approx 0$ for all pairs, while walls would show sharp spikes.