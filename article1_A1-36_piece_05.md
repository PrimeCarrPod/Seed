# A1-36 Worldline_Decoupling_Limits.md — Piece 05
## RG Flow Equations — Beta Functions for Gap Scales

The RG flow of gap scales is governed by beta functions derived from the gap distribution statistics. The flow describes how effective gap values change with the RG scale $\mu$.

**Gap beta function.** Define the running gap $d(\mu)$ as the typical gap at RG scale $\mu$. The beta function is:
$$\beta(d) = \mu \frac{d d}{d\mu}$$
From the gap distribution $\pi_d(x) \sim \frac{C_d x}{\log^2 x}$ (Hardy-Littlewood), we derive:
$$\beta(d) = -d + \frac{d^2}{\log(1/d)} \frac{d}{dd} \log C_d + \mathcal{O}(d^3)$$
where $C_d$ are the Hardy-Littlewood constants.

**Fixed points.** The beta function has fixed points where $\beta(d^*) = 0$:
- UV fixed point: $d^* = 0$ (infinitesimal gaps, not physical for primes)
- IR fixed point: $d^* = \infty$ (infinite gaps, not physical)
- **Self-dual fixed point**: $d^* = 16$ where $\beta(16) = 0$ by gap inversion symmetry

**Flow near $d=16$.** Linearizing near the self-dual point:
$$\beta(d) \approx \beta'(16)(d-16), \quad \beta'(16) < 0$$
This means $d=16$ is an attractive fixed point for the duality-transformed variable. Flows from UV ($d<16$) and IR ($d>16$) both approach $d=16$ under duality.

**Running of $\kappa$.** The constant $\kappa$ in $H = \frac{\hbar}{\kappa}\sum d_n^{-1}$ runs with scale. From the Compton scale condition (A1-09):
$$\kappa(\mu) = \kappa_0 \left(1 + \frac{\beta_\kappa}{\kappa_0} \log\frac{\mu}{\mu_0}\right)$$
where $\beta_\kappa$ is determined by the gap distribution moments.

**Running of $\hbar$.** The effective $\hbar$ also runs:
$$\hbar(\mu) = \hbar_0 \exp\left(-\int_{\mu_0}^\mu \frac{\beta_\hbar(\mu')}{\hbar(\mu')} \frac{d\mu'}{\mu'}\right)$$
with $\beta_\hbar$ from the gap spectral dimension.

**Gap dimension.** The spectral dimension $d_s$ of the worldline (A1-14) runs with scale:
$$d_s(\mu) = 2 - \frac{2}{\log(\mu/\mu_0)} + \mathcal{O}(\log^{-2})$$
At $\mu \sim 16$, $d_s \approx 2$ (the topological dimension of the worldline).

**Flow of multiplicities.** The gap multiplicities $m_d(\mu)$ satisfy:
$$\mu \frac{d m_d}{d\mu} = -\gamma_d m_d, \quad \gamma_d = \frac{d}{\log(1/d)}$$
Small gaps have large anomalous dimensions (UV dominant); large gaps have small $\gamma_d$ (IR stable).

**PrimeBookOne flow data.** The 3500 books give discrete RG scales $\mu_b = p_b$. The flow of observables across books maps out the RG trajectory.

(End of file - 35 lines)