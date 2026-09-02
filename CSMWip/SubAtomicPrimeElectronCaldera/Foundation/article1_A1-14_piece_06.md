# A1-14: Worldline Metric From Gaps — Piece 06: Metric Evolution Along Worldline

## 11. RG Flow of the Metric

### 11.1 Directory Flow as RG Flow

The PrimeBookOne directory hierarchy (0.0 → 1.0 → 2.0 → 3.0) is an RG flow in the metric. Each directory is a **coarse-graining** of the previous:
- Directory 0.0: 189 tiles × 500 steps (IR)
- Directory 3.0: 3500 books × $2^{20}$ steps (UV complete)

### 11.2 Metric Scaling

Under coarse-graining by factor $b$, the metric scales as:
$$
g_{\mu\nu}^{(b)}(n) = b^{-\Delta_{\mu\nu}} g_{\mu\nu}(bn)
$$

where the scaling dimension $\Delta_{00} = 0$, $\Delta_{ij} = 2$ (since $g_{ij} \sim \ln n$).

### 11.3 Beta Function for Conformal Factor

The conformal factor $\Omega^2(n) = \langle d_n \rangle$ satisfies:
$$
n \frac{d\Omega^2}{dn} = \beta(\Omega^2) = 1
$$

Solution: $\Omega^2(n) = \ln n + C$. This is the **logarithmic running** of the metric — asymptotic freedom in the UV.

---

## 12. Metric at Different Energy Scales

### 12.1 Scale-Book Correspondence

| Book $b$ | Proper Time $\tau_b$ | Energy Scale | $\Omega^2 \sim \ln b$ |
|----------|---------------------|--------------|----------------------|
| 1 | $\sim \kappa$ | IR (meV) | $\sim 1$ |
| 100 | $\sim 100\kappa$ | eV | $\sim 4.6$ |
| 1000 | $\sim 1000\kappa$ | keV | $\sim 6.9$ |
| 3500 | $\sim 3500\kappa$ | MeV (Compton) | $\sim 8.1$ |

### 12.2 Running of Physical Constants

The metric running induces running of couplings:
$$
\alpha^{-1}(b) \sim \Omega^2(b) \sim \ln b
$$

Matching A1-10: $\beta(\alpha) = -\alpha^2$ from $\frac{d}{d\ln b} \ln b = 1$.

---

*End of Piece 06 — Continues in Piece 07: Curvature from Gap Fluctuations*