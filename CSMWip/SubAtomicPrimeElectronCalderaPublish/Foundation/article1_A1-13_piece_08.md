# A1-13: Worldline Causal Structure — Piece 08: Causal Structure and the Path Integral

## 42. Path Integral from Causal Structure (A1-18 Preview)

### 42.1 Causal Path Integral

From A1-18, the worldline path integral sums over all causal paths:

$$
Z = \int_{\text{causal}} \mathcal{D}[x(\tau)] e^{i S[x]/\hbar}
$$

where the causal condition is $\dot{x}^0(\tau) > 0$ (proper time increases).

### 42.2 Proper Time Gauge Fixing

The proper time gauge $\tau_n = \kappa(p_{n+1} - 2)$ is a causal gauge — it fixes the worldline parameter to increase monotonically. The Faddeev-Popov determinant is:

$$
\det\left( \frac{\delta \tau_n}{\delta \alpha(\tau')} \right) = \prod_n \frac{1}{\kappa d_n}
$$

### 42.3 Causal Propagator from Path Integral

The causal propagator between vertices $n$ and $m$:

$$
K(m,n) = \int_{\text{causal paths } n\to m} \mathcal{D}[x] e^{i S/\hbar}
$$

For $m > n$, this is the retarded propagator. For $m < n$, it vanishes — causality is built into the path integral measure.

---

*End of Piece 08 — Continues in Piece 09: Causal Structure and Instantons*