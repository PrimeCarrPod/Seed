## 3. Topological Classification of Worldline Reversals

Not every gap transition corresponds to a physical pair event. The prime gap sequence contains topological invariants that distinguish genuine worldline reversals from mere fluctuations. We classify reversals by the **winding number** accumulated around the reversal point.

### 3.1 Instanton Charge at Reversal Points

Consider a reversal at index $n$ where $\sigma_{n-1} = +1$ and $\sigma_n = -1$ (electron $\to$ positron transition, pair creation). The **instanton charge** (topological charge) of this reversal is:

$$
Q_{\text{inst}}(n) = \frac{1}{2} \left( \sigma_{n-1} - \sigma_n \right) = \begin{cases} +1 & \text{pair creation } (e^- e^+ \text{ from } \gamma) \\ -1 & \text{pair annihilation } (e^- e^+ \to \gamma\gamma) \end{cases}
$$

This matches the physical interpretation: pair creation introduces a net topological charge of $+1$ (one electron worldline becomes two apparent worldlines), while annihilation removes it ($-1$).

### 3.2 Gap Signature of Reversals

A worldline reversal requires the worldline to "turn around" in proper time. In the prime gap language, this corresponds to a **local extremum** in the cumulative proper time function, or equivalently, a sign change in the second difference:

$$
\Delta^2 \tau_n = \kappa (d_{n+1} - 2d_n + d_{n-1}) = \kappa \Delta^2 d_n
$$

A reversal occurs at $n$ where $\Delta^2 d_n$ changes sign and $|\Delta^2 d_n|$ exceeds a threshold related to the Compton scale. We define the **reversal indicator**:

$$
R_n = \text{sign}(\Delta^2 d_n) \cdot \Theta\left( |\Delta^2 d_n| - \frac{d_n}{\alpha} \right)
$$

where $\alpha \approx 1/137$ is the fine structure constant and $\Theta$ is the Heaviside step function. The threshold $d_n/\alpha$ ensures only significant proper-time curvatures count as physical pair events, filtering out quantum fluctuations.

### 3.3 Reversal Density and the Schwinger Limit

The density of reversal points in the prime gap sequence predicts the pair creation rate in strong fields. For a constant electric field $E$, the Schwinger pair creation rate per unit volume is:

$$
\Gamma \sim \frac{(eE)^2}{4\pi^3 \hbar^2 c} \exp\left( -\frac{\pi m_e^2 c^3}{e \hbar E} \right)
$$

In the Prime Electron model, the effective field strength at gap $n$ is $E_n \propto 1/d_n$. The reversal density $\rho_{\text{rev}}(n)$ (reversals per unit proper time) scales as:

$$
\rho_{\text{rev}}(n) \sim \frac{1}{d_n} \exp\left( -\frac{\pi \alpha d_n}{2} \right)
$$

This reproduces the Schwinger exponential suppression for large gaps (weak fields) and predicts enhanced pair creation at small gaps (strong effective fields), with twin primes ($d_n = 2$) corresponding to the maximum pair creation rate.