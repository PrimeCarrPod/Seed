## 3. Gap Distribution Statistics: Complete Moment Hierarchy

### 3.1 Exact Gap Distribution from PrimeBookOne

The PrimeBookOne dataset provides 3.67 billion prime gap differences across 3500 books $\times$ $2^{20}$ differences per book (directories 0.0 through 3.0). The **empirical gap distribution** $P(d; x)$ at scale $x$ is:

$$
P(d; x) = \frac{1}{\pi(x)} \#\{p_n \leq x: p_{n+1} - p_n = d\}
$$

For even gaps $d = 2k$, the Hardy-Littlewood conjecture predicts:

$$
P(2k; x) \sim \frac{2 C_2}{\ln^2 x} \prod_{p|k, p>2} \frac{p-1}{p-2}
$$

where $C_2 = \prod_{p>2} (1 - 1/(p-1)^2) \approx 0.66016$ is the twin prime constant.

### 3.2 Moments of the Gap Distribution

The $m$-th moment of the gap distribution is:

$$
\langle d^m \rangle = \sum_{d \text{ even}} d^m P(d; x)
$$

Using the Hardy-Littlewood form and extending to continuous $d$:

$$
\langle d^m \rangle \sim \frac{2 C_2}{\ln^2 x} \int_2^\infty d^m e^{-d/\ln x} \prod_{p|d/2} \frac{p-1}{p-2} \, dd
$$

For large $x$, the moments scale as:

$$
\langle d^m \rangle \sim m! (\ln x)^{m+1}
$$

The **central moments** (fluctuations around mean) are:

$$
\mu_m = \langle (d - \langle d \rangle)^m \rangle
$$

- $\mu_1 = 0$ (by definition)
- $\mu_2 = \text{Var}(d) \sim \ln x$
- $\mu_3 \sim (\ln x)^2$ (positive skew — long tail toward large gaps)
- $\mu_4 \sim (\ln x)^3$ (excess kurtosis — heavy tails)

### 3.3 Proper Time Fluctuation Moments

Scaling by $\kappa$, the proper time fluctuation moments are:

$$
\langle (\Delta\tau)^m \rangle = \kappa^m \langle d^m \rangle \sim \kappa^m m! (\ln x)^{m+1}
$$

The **cumulant generating function** is:

$$
K_{\Delta\tau}(t) = \ln \langle e^{t \Delta\tau} \rangle = \sum_{m=1}^\infty \frac{\kappa_m t^m}{m!}
$$

where $\kappa_m$ are the cumulants. For the gap distribution:

$$
\kappa_1 = \kappa \langle d \rangle \sim \kappa \ln x
$$
$$
\kappa_2 = \kappa^2 \text{Var}(d) \sim \kappa^2 \ln x
$$
$$
\kappa_3 \sim \kappa^3 (\ln x)^2, \quad \kappa_4 \sim \kappa^3 (\ln x)^3, \dots
$$

The proper time distribution is **not Gaussian** — higher cumulants don't vanish. This non-Gaussianity is a distinctive signature of the Prime Electron model.

### 3.4 Modulo Class Decomposition

Decomposing by modulo 6 classes (for $p > 3$, primes are $\equiv 1,5 \pmod 6$):

- $d \equiv 0 \pmod 6$: transitions $1 \to 1$ or $5 \to 5$ (same class)
- $d \equiv 2 \pmod 6$: $5 \to 1$ (decreasing modulo 6)
- $d \equiv 4 \pmod 6$: $1 \to 5$ (increasing modulo 6)

The densities are asymptotically equal (Dirichlet), but finite-$x$ biases exist:

$$
\frac{P(d \equiv 2 \pmod 6)}{P(d \equiv 4 \pmod 6)} = 1 + \mathcal{O}\left(\frac{1}{\ln x}\right)
$$

This **modulo bias** induces a preferred direction in proper time fluctuations — the microscopic origin of the arrow of time and baryon asymmetry (see A1-07).