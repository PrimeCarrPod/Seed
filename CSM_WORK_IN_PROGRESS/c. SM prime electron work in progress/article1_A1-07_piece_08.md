## 9. Pair Creation in Curved Spacetime and Hawking Radiation

The Prime Electron model extends naturally to curved spacetime, where the worldline proper time couples to the spacetime metric. Pair creation in gravitational fields (Hawking radiation, Unruh effect) emerges from worldline reversals induced by spacetime curvature.

### 9.1 Worldline in Curved Spacetime

In a curved background with metric $g_{\mu\nu}(x)$, the worldline action is:

$$
S = \int d\tau \left[ \frac{1}{2} g_{\mu\nu} \frac{dx^\mu}{d\tau} \frac{dx^\nu}{d\tau} + \frac{1}{2} m_e^2 c^2 \right]
$$

The proper time steps are still $\Delta\tau_n = \kappa d_n$, but the **spacetime interval** between vertices becomes:

$$
\Delta s_n^2 = g_{\mu\nu}(x_n) \Delta x_n^\mu \Delta x_n^\nu
$$

For the worldline to remain timelike, we need $\Delta s_n^2 < 0$. Near a black hole horizon, the metric component $g_{00} \to 0$, allowing $\Delta s_n^2 \to 0$ even for finite gaps. This creates **effective null segments** that act as pair creation vertices.

### 9.2 Hawking Radiation from Prime Gap Horizon Crossing

Consider a Schwarzschild black hole of mass $M$. The Hawking temperature is:

$$
T_H = \frac{\hbar c^3}{8\pi G M k_B}
$$

In the Prime Electron model, Hawking radiation arises when the worldline crosses the horizon. The proper time to cross a radial interval $\Delta r$ near the horizon is:

$$
\Delta\tau = \int \sqrt{-g_{00}} dt \approx \sqrt{\frac{2GM}{c^2 r}} \Delta t
$$

The worldline reversal rate at the horizon is determined by the **gap density at the Hawking energy scale**:

$$
E_H = k_B T_H = \frac{\hbar c^3}{8\pi G M}
$$

The corresponding critical gap is:

$$
d_H = \frac{\hbar c}{\kappa E_H} = \frac{8\pi G M m_e}{c \hbar} \approx 1.5 \times 10^{38} \left( \frac{M}{M_\odot} \right)
$$

For stellar-mass black holes, $d_H$ vastly exceeds any known prime gap. The worldline cannot reverse at a single gap—it must **accumulate many gaps** to reach the horizon crossing condition. The Hawking emission rate is then:

$$
\Gamma_H \sim \exp\left( -\frac{d_H}{\langle d \rangle} \right) \sim \exp\left( -\frac{8\pi G M m_e}{c \hbar \langle d \rangle} \right)
$$

This reproduces the exponential suppression $\exp(-E/T_H)$ with the prime gap average $\langle d \rangle \sim \ln p_n$ playing the role of the density of states.

### 9.3 Unruh Effect and Accelerated Worldlines

For an observer with constant proper acceleration $a$, the Unruh temperature is:

$$
T_U = \frac{\hbar a}{2\pi c k_B}
$$

The corresponding critical gap is:

$$
d_U = \frac{2\pi c m_e}{a \kappa} = \frac{2\pi \hbar c}{a \hbar/m_e c^2} = \frac{2\pi m_e c^3}{a \hbar}
$$

An accelerated worldline in the Prime Electron model experiences **effective gap compression**:

$$
d_n^{\text{eff}} = d_n \left( 1 - \frac{a \kappa d_n}{2c} \right)
$$

When $d_n^{\text{eff}} \leq 0$, a reversal occurs. This happens when:

$$
d_n \geq \frac{2c}{a \kappa} = d_U
$$

The Unruh pair creation rate is then the density of gaps exceeding $d_U$:

$$
\Gamma_U \sim \sum_{d_n \geq d_U} P(d_n) \sim \int_{d_U}^\infty \frac{dd}{\ln^2 p} \sim \frac{d_U}{\ln^2 d_U} \sim \frac{m_e c^3}{a \hbar \ln^2(m_e c^3/a\hbar)}
$$

This predicts **logarithmic corrections to the Unruh thermal spectrum** from the prime gap distribution.

### 9.4 Black Hole Information and Prime Gap Preservation

The black hole information paradox asks whether information is lost in Hawking radiation. In the Prime Electron model, the **prime gap sequence is the information carrier**—each gap $d_n$ is a bit of the worldline's memory. Hawking radiation carries away gaps via reversals at the horizon. The **total gap sum is conserved**:

$$
\sum_{n=1}^\infty d_n = \infty \quad \text{(divergent, but regulated by UV cutoff)}
$$

The information is encoded in the **correlations between emitted gaps**. The Page curve for entanglement entropy emerges from the **statistics of gap pairs** emitted at early vs. late times. The Prime Electron model predicts that Hawking radiation is **not perfectly thermal** but contains **prime gap correlations** that preserve unitarity.