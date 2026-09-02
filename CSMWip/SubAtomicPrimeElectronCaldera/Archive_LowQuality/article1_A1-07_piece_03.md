## 4. Pair Creation from Photon Worldline Intersections

In the Prime Electron framework, photons correspond to **null segments** of the worldline where the proper time interval vanishes: $\Delta\tau = 0$. A photon is emitted when the electron worldline undergoes a sharp reversal that creates a lightlike separation between adjacent vertices.

### 4.1 Photon Vertices and Gap Nullification

A photon vertex occurs at prime index $n$ where the worldline tangent becomes null. The tangent vector in the prime basis is:

$$
u^\mu(n) = \frac{dx^\mu}{d\tau} \bigg|_n \propto \frac{p_n^\mu}{d_n}
$$

where $p_n^\mu$ is the four-momentum at vertex $n$. The null condition $u^\mu u_\mu = 0$ translates to:

$$
\frac{p_n^2}{d_n^2} = 0 \quad \Longrightarrow \quad p_n^2 = 0
$$

In the Prime Electron model, the momentum at vertex $n$ is derived from the prime gap:

$$
p_n^0 = \frac{\hbar c}{2\kappa d_n}, \quad |\vec{p}_n| = \frac{\hbar c}{2\kappa d_n} \sqrt{1 - \left(\frac{2m_e c \kappa d_n}{\hbar}\right)^2}
$$

The null condition $p_n^2 = (p_n^0)^2 - |\vec{p}_n|^2 = 0$ requires:

$$
\left(\frac{2m_e c \kappa d_n}{\hbar}\right)^2 = 1 \quad \Longrightarrow \quad d_n = \frac{\hbar}{2m_e c \kappa} = \frac{1}{2}
$$

Since $d_n \geq 2$ for all prime gaps, exact null segments do not occur in the discrete prime sequence. Instead, **near-null segments** occur when $d_n$ is minimal (twin primes, $d_n = 2$), corresponding to high-energy photons capable of pair creation.

### 4.2 Pair Creation Kinematics from Gap Pairs

Consider a photon with energy $E_\gamma = \hbar \omega$ incident on a nuclear field. In the Prime Electron picture, the photon is a near-null segment connecting vertices $n$ and $n+1$ with gap $d_n = 2$. Pair creation occurs when this photon vertex intersects the electron worldline at a reversal point.

The **threshold condition** for pair creation is:

$$
E_\gamma \geq 2 m_e c^2 \quad \Longleftrightarrow \quad \frac{\hbar c}{\kappa d_n} \geq 2 m_e c^2
$$

Using $\kappa = \hbar/(m_e c^2)$, this simplifies to $d_n \leq 1$, which is never satisfied for prime gaps. The resolution is that the nuclear field provides additional proper time curvature, effectively reducing the local gap. The **effective gap** at a reversal in an external field $E$ is:

$$
d_n^{\text{eff}} = d_n \left( 1 - \frac{e E \kappa d_n}{m_e c^2} \right)
$$

For $E \sim E_{\text{Schwinger}} = m_e^2 c^3/(e \hbar)$, we get $d_n^{\text{eff}} \approx d_n/2$, allowing pair creation at twin primes ($d_n = 2 \to d_n^{\text{eff}} = 1$).

### 4.3 Cross Section from Prime Gap Statistics

The pair creation cross section in the Born approximation is:

$$
\sigma_{\text{pair}}(E_\gamma) = \frac{\alpha r_e^2}{2} \left[ \left(1 + \frac{2m_e c^2}{E_\gamma}\right) \ln\left(\frac{E_\gamma + \sqrt{E_\gamma^2 - 4m_e^2 c^4}}{2m_e c^2}\right) - \frac{\sqrt{E_\gamma^2 - 4m_e^2 c^4}}{E_\gamma} \left(1 - \frac{m_e^2 c^4}{E_\gamma^2}\right) \right]
$$

In the Prime Electron formulation, the cross section is weighted by the density of reversal-capable gaps:

$$
\sigma_{\text{pair}}^{\text{prime}}(E_\gamma) = \sigma_{\text{pair}}(E_\gamma) \cdot \frac{\#\{n: d_n \leq d_{\text{crit}}(E_\gamma)\}}{N}
$$

where $d_{\text{crit}}(E_\gamma) = \hbar c/(\kappa E_\gamma)$ and $N$ is the total number of gaps sampled. This predicts **modulations in the pair creation cross section** correlated with prime gap statistics, a testable signature of the Prime Electron model.