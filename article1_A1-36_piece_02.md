# A1-36 Worldline_Decoupling_Limits.md — Piece 02
## Light Sector Effective Theory — UV Gaps (d < 16)

The light sector contains the seven small even gaps $d \in \{2, 4, 6, 8, 10, 12, 14\}$. This is the UV regime with high gap multiplicities.

**Light Hamiltonian.** From A1-17, the light sector Hamiltonian is:
$$H_{\text{light}} = \frac{\hbar}{\kappa} \sum_{d \in D_{\text{light}}} \frac{1}{d} P_d, \quad D_{\text{light}} = \{2,4,6,8,10,12,14\}$$
where $P_d = \sum_{n: d_n=d} |n\rangle\langle n|$ is the projector onto gap $d$.

**Gap multiplicities.** For $x \sim 10^{10}$ (PrimeBookOne range), the multiplicities are:
- $m_2 \sim 10^8$ (twin primes, A1-35)
- $m_4 \sim 10^8$ (cousin primes)
- $m_6 \sim 10^8$ (sexy primes)
- $m_8, m_{10}, m_{12}, m_{14}$: decreasing but still $\sim 10^7$

**Light sector density matrix.** The thermal state at inverse temperature $\beta$ is:
$$\rho_{\text{light}} = \frac{e^{-\beta H_{\text{light}}}}{Z_{\text{light}}}, \quad Z_{\text{light}} = \prod_{d \in D_{\text{light}}} \left(1 + e^{-\beta\hbar/(\kappa d)}\right)^{m_d}$$

**Correlation functions.** The light-light gap correlation is:
$$\langle d_n d_{n+r} \rangle_{\text{light}} = \frac{1}{Z_{\text{light}}} \text{Tr}\left(e^{-\beta H_{\text{light}}} d_n d_{n+r}\right)$$
For $r=1$, this gives the gap ratio distribution $P(d_{n+1}/d_n)$ for small gaps.

**UV divergences and regularization.** The sum $\sum_{d<16} m_d/d$ diverges logarithmically with the UV cutoff (max prime in book). This is regulated by the finite PrimeBookOne range.

**Light sector entropy.** The von Neumann entropy (A1-31) for the light sector:
$$S_{\text{light}} = \sum_{d \in D_{\text{light}}} m_d \left[ \frac{\beta\hbar}{\kappa d} \frac{e^{-\beta\hbar/(\kappa d)}}{1+e^{-\beta\hbar/(\kappa d)}} + \log\left(1+e^{-\beta\hbar/(\kappa d)}\right) \right]$$
This dominates the total entropy for high temperatures (UV).

**Effective light action.** Integrating out heavy modes gives the Wilsonian effective action for light gaps:
$$S_{\text{eff,light}}[d_n] = \sum_{d<16} \frac{m_d}{2} \log\left(\frac{d}{\Lambda}\right) + \text{interactions}$$
where $\Lambda = 16$ is the RG cutoff.

(End of file - 35 lines)