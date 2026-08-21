# A1-36 Worldline_Decoupling_Limits.md — Piece 03
## Heavy Sector Effective Theory — IR Gaps (d > 16)

The heavy sector contains all gaps $d > 16$, including the record gaps that define the 78 BPS states. This is the IR regime with topological protection.

**Heavy Hamiltonian.** The heavy sector Hamiltonian is:
$$H_{\text{heavy}} = \frac{\hbar}{\kappa} \sum_{d \in D_{\text{heavy}}} \frac{1}{d} P_d, \quad D_{\text{heavy}} = \{18, 20, 22, \dots, d_{\text{max}}\}$$
where $d_{\text{max}} = 354$ (largest record gap in PrimeBookOne range).

**Record gaps and BPS states.** The record gap sequence (A005250) gives the BPS gap values:
$$d_{\text{record}} \in \{1, 2, 4, 6, 8, 14, 18, 20, 22, 34, 36, 44, 52, 72, 86, 96, 112, 114, 118, \dots\}$$
The 78 BPS states correspond to the first 78 record gaps. All but the first 6 have $d > 16$, so BPS $\subset$ heavy sector.

**Heavy sector density matrix.** The thermal state is:
$$\rho_{\text{heavy}} = \frac{e^{-\beta H_{\text{heavy}}}}{Z_{\text{heavy}}}, \quad Z_{\text{heavy}} = \prod_{d \in D_{\text{heavy}}} \left(1 + e^{-\beta\hbar/(\kappa d)}\right)^{m_d}$$
where $m_d = 1$ for record gaps (unique), $m_d \sim \pi(x)/\log x$ for non-record gaps.

**BPS sector decoupling.** The BPS density matrix is $\rho_{\text{BPS}} = \frac{1}{78}\mathbb{I}_{78}$ (A1-34). Its entropy is $S_{\text{BPS}} = \log 78$. The relative entropy within BPS is zero:
$$S(\rho_{\text{BPS}}||\sigma_{\text{BPS}}) = 0$$
This is preserved under RG because the BPS sector has no light modes to integrate out.

**IR correlation functions.** Heavy-heavy correlations are dominated by the sparsest gaps:
$$\langle d_n d_{n+r} \rangle_{\text{heavy}} \sim \frac{1}{m_{d_{\text{record}}}} \to 0 \text{ as } r \to \infty$$
The heavy sector has long-range correlations only within the BPS block.

**Heavy sector entropy.** The von Neumann entropy:
$$S_{\text{heavy}} = \log 78 + \sum_{d \in D_{\text{heavy}} \setminus \text{BPS}} m_d \left[ \frac{\beta\hbar}{\kappa d} \frac{e^{-\beta\hbar/(\kappa d)}}{1+e^{-\beta\hbar/(\kappa d)}} + \log\left(1+e^{-\beta\hbar/(\kappa d)}\right) \right]$$
The $\log 78$ term is the topological BPS contribution.

**Effective heavy action.** Integrating out light modes gives:
$$S_{\text{eff,heavy}}[d_n] = S_{\text{BPS}} + \sum_{d>16} \frac{m_d}{2} \log\left(\frac{\Lambda}{d}\right) + \text{interactions}$$
The BPS term is RG invariant.

(End of file - 35 lines)