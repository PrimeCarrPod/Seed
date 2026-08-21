# A1-32 Worldline_Renyi_Entropies.md — Piece 09
## Renyi Mutual Information and Conditional Entropies — Gap Ratio Information Geometry

The Renyi mutual information and conditional entropies quantify the information flow between worldline regions, determined by gap ratio correlations.

**Renyi mutual information.** For disjoint regions A, B:
$$I_n(A:B) = S_n(A) + S_n(B) - S_n(A \cup B)$$

For Gaussian states, $I_n(A:B)$ is determined by the cross-correlation matrix $C_{AB}$:
$$I_n(A:B) = \frac{1}{1-n} \sum_k \log \left[ 1 - \frac{\lambda_k(C_{AB})}{(\nu_k^A + 1/2)(\nu_k^B + 1/2)} \right]^n$$

**BPS sector mutual information.** For the 78 BPS states, $\rho_{\text{BPS}} = \frac{1}{78}\mathbb{I}$. Any partition gives:
$$I_n^{\text{BPS}}(A:B) = \log 78 - \log d_A - \log d_B + \log d_{AB}$$
where $d_A, d_B, d_{AB}$ are the dimensions of the BPS subspaces in A, B, A∪B. This is the log of the index intersection number (A1-24).

**Renyi conditional entropy.** $S_n(A|B) = S_n(A \cup B) - S_n(B)$. For the BPS sector:
$$S_n^{\text{BPS}}(A|B) = \log d_{AB} - \log d_B$$

**Information geometry of gap ratios.** The space of gap ratio distributions $\{C(r)\}$ has a Fisher information metric:
$$g_{ij} = \frac{1}{2} \text{Tr}\left[ \Sigma^{-1} \partial_i \Sigma \Sigma^{-1} \partial_j \Sigma \right]$$

The Renyi entropies define a family of divergences on this space:
$$D_n(\{C\} || \{C'\}) = \frac{1}{n-1} \log \frac{Z_n(\{C\})}{Z_n(\{C'\})}$$

where $Z_n = \text{Tr}(\rho^n)$.

**PrimeBookOne information flow.** The 3500 books give 3500 values of $I_n(b_1:b_2)$ for any book pair. The mutual information decays with book separation $|b_1 - b_2|$, reflecting the gap correlation length.

**Wall crossing as information phase transition.** At a wall (A1-29), $I_n(A:B)$ jumps discontinuously. In the physical chamber (RH true), $I_n(b_1:b_2)$ is a smooth function of both books and $n$.