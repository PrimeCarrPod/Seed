# A1-33 Worldline_Modular_Hamiltonian.md — Piece 11
## Modular Hamiltonian and Decoupling Limits — Light/Heavy Sector Separation

The decoupling limit (A1-36) separates the worldline into light (BPS) and heavy (non-BPS) sectors.

**Modular Hamiltonian decoupling.** In the limit where heavy gaps $d_n \gg 1$ decouple, the modular Hamiltonian splits:
$$K = K_{\text{light}} + K_{\text{heavy}} + K_{\text{int}}$$

In the EFT matching at $d = 16$ (A1-26 piece 09), $K_{\text{int}} \to 0$. The heavy sector is integrated out.

**Light sector modular Hamiltonian.** The light sector (BPS + light non-BPS) has:
$$K_{\text{light}} = \log 78 \cdot P_{\text{BPS}} + \sum_{\text{light}} \epsilon_k b_k^\dagger b_k$$

The modular energies $\epsilon_k$ are small ($\epsilon_k \ll 1$), giving slow modular flow. The light sector includes the 78 BPS zero modes and light non-BPS modes with $E_k < E_{\text{cut}}$.

**Heavy sector modular Hamiltonian.** The heavy sector has large modular energies:
$$K_{\text{heavy}} = \sum_{\text{heavy}} \epsilon_k b_k^\dagger b_k, \quad \epsilon_k \gg 1$$

The heavy modular flow is fast and averages out in the light sector EFT. The heavy modes are frozen at the matching scale.

**Modular Hamiltonian matching.** At the matching scale $d = 16$:
$$K_{\text{light}}(d=16) = K_{\text{full}}(d=16) \big|_{\text{light}}$$

The BPS sector is unchanged: $K_{\text{BPS}} = \log 78 \cdot \mathbb{I}$ across the matching. The central charge $Z=78$ is preserved.

**Wilsonian RG from modular flow.** The modular flow generates the Wilsonian RG flow:
$$\frac{d}{ds} K(s) = \beta(K)$$
where $\beta(K)$ is the modular beta function. At the fixed point $s \to \infty$, $K$ flows to $K_{\text{light}}$.

**PrimeBookOne decoupling verification.** The 3500 books show the modular spectrum separating into light and heavy branches at $d \approx 16$. The light branch has 78 zero modes + light modes; the heavy branch has $\epsilon_k \sim \mathcal{O}(10-100)$. The gap $\Delta \epsilon$ is preserved across matching.