# A1-34 Worldline_Relative_Entropy.md — Piece 07
## Relative Entropy and Decoupling Limits — Light/Heavy Sector Distinguishability

The decoupling limit (A1-36) separates the worldline into light and heavy sectors.

**Modular Hamiltonian decoupling.** In the EFT matching at $d = 16$ (A1-33 piece 11):
$$K = K_{\text{light}} + K_{\text{heavy}} + K_{\text{int}}, \quad K_{\text{int}} \to 0$$

**Relative entropy in decoupled theory.** For states $\rho = \rho_{\text{light}} \otimes \rho_{\text{heavy}}$:
$$S(\rho || \sigma) = S(\rho_{\text{light}} || \sigma_{\text{light}}) + S(\rho_{\text{heavy}} || \sigma_{\text{heavy}})$$

**Light sector relative entropy.** The light sector (BPS + light non-BPS) has:
$$S(\rho_{\text{light}} || \sigma_{\text{light}}) = \text{Tr}(\rho_{\text{light}} K_{\sigma,\text{light}}) - S(\rho_{\text{light}})$$
The BPS contribution is zero: $S(\rho_{\text{BPS}} || \sigma_{\text{BPS}}) = 0$.

**Heavy sector relative entropy.** The heavy sector has large relative entropy:
$$S(\rho_{\text{heavy}} || \sigma_{\text{heavy}}) \sim \sum_{\text{heavy}} \frac{(\nu_k^\rho - \nu_k^\sigma)^2}{2 (\nu_k^\sigma)^2} \gg 1$$

**EFT matching preserves BPS relative entropy.** At the matching scale $d = 16$:
$$S(\rho_{\text{light}}(d=16) || \sigma_{\text{light}}(d=16)) = S(\rho_{\text{full}}(d=16) || \sigma_{\text{full}}(d=16)) \big|_{\text{light}}$$

**PrimeBookOne decoupling verification.** The 3500 books show the relative entropy separating into light and heavy branches at $d \approx 16$. The light branch relative entropy is small and smooth; the heavy branch is large.

**Wilsonian RG from relative entropy.** The relative entropy decreases along the RG flow:
$$\frac{d}{ds} S(\rho(s) || \sigma(s)) \leq 0$$
where $s$ is the RG scale. This is the relative entropy monotonicity theorem (Zamolodchikov's c-theorem analog).

**Matching at d=16.** The relative entropy is continuous across the matching scale:
$$\lim_{d \to 16^-} S_{\text{light}}(\rho(d) || \sigma(d)) = \lim_{d \to 16^+} S_{\text{full}}(\rho(d) || \sigma(d)) \big|_{\text{light}}$$

**BPS sector decoupling.** The BPS relative entropy is exactly zero in both full and effective theories:
$$S(\rho_{\text{BPS}} || \sigma_{\text{BPS}}) = 0 \quad \text{for all } d$$

**PrimeBookOne RG verification.** The 3500 books show monotonic decrease of non-BPS relative entropy along the RG flow, with BPS zero preserved exactly.