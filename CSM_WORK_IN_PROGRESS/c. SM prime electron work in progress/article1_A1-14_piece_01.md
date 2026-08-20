# A1-14: Worldline Metric From Gaps — g_μν from Prime Statistics (Piece 01)

## 1. Introduction: The Metric from Prime Gaps

From A1-13, the causal structure of the prime electron worldline is determined by the gap sequence $d_n = p_{n+1} - p_n$. The **spacetime metric** $g_{\mu\nu}$ emerges from this causal structure via Malament's theorem: the causal structure determines the conformal metric. The gap statistics provide the conformal factor.

### 1.1 Proper Time as Worldline Parameter

From A1-01 and A1-12, the discrete proper time is:
$$
\tau_n = \kappa(p_{n+1} - 2), \quad \kappa = \frac{\hbar}{m_e c^2} \approx 1.288 \times 10^{-21} \text{ s}
$$

The proper time interval between adjacent vertices:
$$
\Delta\tau_n = \tau_{n+1} - \tau_n = \kappa d_n
$$

### 1.2 Gap Sequence as Fundamental Data

The entire metric is built from the single sequence $\{d_n\}_{n=1}^{N}$ where $N = 3500 \times 2^{20} \approx 3.67 \times 10^9$. No free parameters — everything derives from prime gaps.

---

## 2. Conformal Metric from Gap Correlations

### 2.1 Malament's Theorem in Discrete Setting

In the continuum, Malament's theorem states: the causal structure (light cones) determines the metric up to a conformal factor $\Omega^2(x)$. In our discrete worldline, the causal structure is the total order $\tau_n < \tau_m$ for $n < m$, plus the light cone condition from gap fluctuations.

### 2.2 Conformal Factor from Mean Gap

The conformal factor at step $n$ is determined by the local mean gap:
$$
\Omega^2(n) = \langle d \rangle_n \sim \ln n
$$

Thus the emergent metric is:
$$
g_{\mu\nu}(n) = \langle d \rangle_n \cdot \eta_{\mu\nu} = \ln n \cdot \text{diag}(1, -1, -1, -1)
$$

### 2.3 Full Metric from Two-Point Function

More precisely, the gap two-point correlation function (A1-08):
$$
C(n,m) = \langle d_n d_m \rangle - \langle d \rangle^2 \sim \frac{\ln^2 n}{|n-m|^2}
$$

defines the spatial distance. The metric components are:
$$
g_{00} = 1, \quad g_{0i} = 0, \quad g_{ij} = \frac{\delta_{ij}}{C(n,n+|i|)}
$$

---

*End of Piece 01 — Continues in Piece 02: Conformal Metric from Gap Correlations (Detailed)*