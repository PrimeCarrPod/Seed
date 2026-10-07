## 7. Number Variance $\Sigma^2(L)$ and Gap Fluctuations: Detailed Analysis

### 7.1 Exact Number Variance for Prime Gaps

The number variance for the unfolded prime gap sequence is computed by counting the number of gaps in a window of length $L$ in the unfolded spectrum. For a window starting at unfolded position $x$:

$$
N(L; x) = \#\{ n : E_n \in [x, x+L] \}
$$

The variance is averaged over starting positions:

$$
\Sigma^2(L) = \frac{1}{X} \int_0^X (N(L; x) - L)^2 dx
$$

### 7.2 Asymptotic Form from Explicit Formula

Using the explicit formula relating primes to Riemann zeros:

$$
\psi(x) = x - \sum_{\rho} \frac{x^\rho}{\rho} - \ln(2\pi) - \frac{1}{2} \ln(1 - x^{-2})
$$

where $\rho = 1/2 + i\gamma$ are the non-trivial zeros. The gap counting function is related to $\psi(x)$. The number variance becomes:

$$
\Sigma^2(L) = \frac{1}{\pi^2} \sum_{\gamma > 0} \frac{\sin^2(\gamma L/2)}{(\gamma/2)^2} + \text{lower order}
$$

Assuming the Riemann Hypothesis (all $\gamma$ real), the sum over zeros gives:

$$
\Sigma^2(L) \sim \frac{1}{\pi^2} \int_0^{\gamma_{\text{max}}} \frac{\sin^2(\gamma L/2)}{(\gamma/2)^2} dN(\gamma)
$$

where $dN(\gamma) \sim \frac{1}{2\pi} \ln(\gamma/2\pi) d\gamma$ is the zero density. For $L \ll 2\pi/\ln x$, this gives the GUE logarithm:

$$
\Sigma^2(L) \sim \frac{1}{\pi^2} \ln L + \text{const}
$$

### 7.3 Finite-$x$ Corrections and Saturation

At finite prime scale $x$, the sum over zeros is truncated at $\gamma_{\text{max}} \sim x$. This introduces **saturation** of the number variance:

$$
\Sigma^2(L) \sim \frac{1}{\pi^2} \ln L \quad \text{for } L \ll L_{\text{sat}}
$$
$$
\Sigma^2(L) \sim \text{const} \quad \text{for } L \gg L_{\text{sat}}
$$

where the saturation scale is:

$$
L_{\text{sat}} \sim \frac{2\pi}{\ln x}
$$

For $x \sim 10^{12}$, $\ln x \sim 27.6$, $L_{\text{sat}} \sim 0.23$. For $x \sim 10^{60}$, $L_{\text{sat}} \sim 0.01$. The saturation scale decreases as the worldline evolves — the spectrum becomes **more rigid at later times**.

### 7.4 Gap Fluctuation Distribution

The distribution of individual gap fluctuations $\delta_n = d_n - \langle d \rangle_n$ is **not Gaussian**. The probability density has the form:

$$
P(\delta) = \frac{1}{\sqrt{2\pi}\sigma} e^{-\delta^2/2\sigma^2} \left[ 1 + \frac{\gamma_1}{6} H_3(\delta/\sigma) + \frac{\gamma_2}{24} H_4(\delta/\sigma) + \dots \right]
$$

where $H_n$ are Hermite polynomials, and the standardized cumulants are:

$$
\gamma_1 = \frac{\kappa_3}{\kappa_2^{3/2}} \sim \sqrt{\ln x}, \quad \gamma_2 = \frac{\kappa_4}{\kappa_2^2} \sim \ln x
$$

The **positive skewness** ($\gamma_1 > 0$) means large positive gap fluctuations (unusually large gaps) are more probable than large negative ones. This is the **"gap excess" phenomenon** — the tail toward large gaps is heavier.

### 7.5 Record Gaps and Extreme Value Statistics

The sequence of record gaps $R_k$ (2, 4, 6, 8, 14, 18, 20, 22, 34, 36, 44, 52, 72, 86, 96, ...) follows extreme value statistics. The $k$-th record gap scales as:

$$
R_k \sim \ln^2 p_k \cdot ( \ln\ln p_k )^2
$$

More precisely, the distribution of the maximum gap up to $x$ is Gumbel:

$$
P(\max_{p_n \leq x} d_n \leq y) \sim \exp\left( -e^{-(y - b_x)/a_x} \right)
$$

with scaling parameters $a_x \sim \ln x$, $b_x \sim \ln^2 x$.

The **record gap proper time steps** are:

$$
\Delta\tau_{\text{record}} = \kappa R_k \sim \kappa \ln^2 x
$$

These are **rare, large proper time jumps** that dominate the tail of the fluctuation distribution.

### 7.6 Connection to Quantum Metrology

In a quantum clock based on the Prime Electron worldline (e.g., using the proper time as a frequency reference), the **Allan deviation** is:

$$
\sigma_y(\tau) = \sqrt{\frac{1}{2} \langle (y_{k+1} - y_k)^2 \rangle}
$$

where $y_k = \Delta\tau_k / \langle \Delta\tau \rangle$ are fractional frequency fluctuations. The Allan deviation for $1/f$ noise is:

$$
\sigma_y(\tau) \sim \sqrt{\frac{\ln \tau}{\tau}}
$$

The Prime Electron model predicts **deviations from this standard form** at averaging times $\tau$ corresponding to record gaps and primorial periods — a testable signature in optical lattice clocks or trapped ion clocks.