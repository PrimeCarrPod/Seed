# A1-36 Worldline_Decoupling_Limits.md — Piece 09
## Effective Action and Running Couplings

The Wilsonian effective action for the prime electron worldline captures the running of couplings under gap scale RG flow.

**Worldline effective action.** The bare action (A1-16) is $S = \sum_n d_n L(d_n)$. The effective action at scale $\mu$ is:
$$S_{\text{eff}}[\mu] = \sum_{d < \mu} \frac{m_d}{2} \log\left(\frac{d}{\mu}\right) + \sum_{d > \mu} \frac{m_d}{2} \log\left(\frac{\mu}{d}\right) + S_{\text{int}}[\mu]$$
where $S_{\text{int}}[\mu]$ contains interactions between gaps at scale $\mu$.

**Running of $\kappa$.** The constant $\kappa$ in $\Delta\tau_n = \kappa d_n$ (A1-01) runs with $\mu$:
$$\kappa(\mu) = \kappa_0 \left(1 - \frac{\beta_0}{\kappa_0} \log\frac{\mu}{\mu_0}\right)^{-1}$$
where $\beta_0 = \frac{1}{2\pi} \sum_{d<16} m_d$ is the light gap contribution. At $\mu = 16$, $\kappa(16) = \kappa_0$.

**Running of $\hbar$.** The effective $\hbar$ runs to keep the Compton scale fixed (A1-09):
$$\hbar(\mu) = \hbar_0 \left(\frac{\mu}{\mu_0}\right)^{\gamma_\hbar}, \quad \gamma_\hbar = \frac{1}{2\pi} \sum_{d>16} \frac{m_d}{d}$$
At $\mu = 16$, $\hbar(16) = \hbar_0$ by matching.

**Running of temperature.** The effective inverse temperature $\beta(\mu)$ runs as:
$$\beta(\mu) = \beta_0 \left(\frac{\mu}{\mu_0}\right)^{z}, \quad z = \frac{\sum m_d/d^2}{\sum m_d/d}$$
where $z$ is the dynamical exponent. At $\mu=16$, $z=1$ (Lorentz invariant point).

**Effective potential.** The gap distribution generates an effective potential for the gap field $d(x)$:
$$V_{\text{eff}}[d] = \frac{1}{2} \int dx \left[ (\partial d)^2 + \frac{m^2(\mu)}{2} d^2 + \frac{\lambda(\mu)}{4!} d^4 \right]$$
with $m^2(\mu) \sim \mu^2$, $\lambda(\mu) \sim 1/\log(\mu)$.

**Central charge flow.** The central charge $c(\mu)$ of the worldline CFT (A1-27) flows as:
$$c(\mu) = c_{\text{UV}} - \frac{3}{\pi} \int_{\mu_0}^\mu \beta(d) \frac{\partial c}{\partial d} \frac{dd}{d}$$
At $\mu=16$, $c(16) = 78$ (the BPS count, A1-24). The UV value $c_{\text{UV}} \sim \sum_{d<16} m_d$ is large.

**Anomaly matching.** The anomaly inflow (A1-23) matches across $d=16$: the UV anomaly $\mathcal{A}_{\text{UV}}$ equals the IR anomaly $\mathcal{A}_{\text{IR}}$ because the BPS sector carries the anomaly.

**PrimeBookOne coupling data.** The 3500 books give the running couplings $\kappa(b)$, $\hbar(b)$, $\beta(b)$ as functions of book index. The data shows scaling collapse at $b \sim b_{16}$ (book where $d=16$ appears).

(End of file - 32 lines)