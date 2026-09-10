# A1-14: Worldline Metric From Gaps — Piece 02: Conformal Metric from Gap Correlations (Detailed)

## 3. Gap Correlation Function and Conformal Factor

### 3.1 Exact Two-Point Function

The connected gap correlator from A1-08:
$$
C(n,m) = \langle d_n d_m \rangle_c = \frac{\ln^2 n}{(n-m)^2} \left( 1 + \mathcal{O}\left(\frac{\ln \ln n}{\ln n}\right) \right)
$$

This power-law decay $\sim 1/|n-m|^2$ is characteristic of a **critical system** — the worldline sits at a causal phase transition.

### 3.2 Conformal Factor from Diagonal Correlator

The diagonal element gives the local gap variance:
$$
C(n,n) = \text{Var}(d_n) \sim \ln^2 n
$$

The conformal factor:
$$
\Omega^2(n) = \langle d_n \rangle \sim \ln n
$$

relates to the square root of the variance — consistent with log-normal gap distribution.

### 3.3 Conformal Transformation to Minkowski

The metric $g_{\mu\nu}(n) = \Omega^2(n) \eta_{\mu\nu}$ is conformal to Minkowski. The proper time interval:
$$
ds^2 = g_{\mu\nu} dx^\mu dx^\nu = \ln n (dt^2 - d\vec{x}^2)
$$

is conformally related to flat space. The causal structure (light cones) is identical to Minkowski — only the conformal factor varies.

---

## 4. Discrete Metric Components

### 4.1 Proper Time Component

The $g_{00}$ component is fixed by proper time definition:
$$
g_{00}(n) = \left( \frac{d\tau}{dt} \right)^2 = 1
$$

where $t$ is the emergent coordinate time. The proper time $d\tau = \kappa d_n$ is the fundamental interval.

### 4.2 Cross Components

By causal structure (no preferred spatial direction at a point):
$$
g_{0i}(n) = 0
$$

### 4.3 Spatial Components

The spatial metric $g_{ij}$ is determined by the requirement that light cones are at 45°:
$$
g_{ij}(n) = \Omega^2(n) \delta_{ij} = \langle d_n \rangle \delta_{ij} \sim \ln n \, \delta_{ij}
$$

---

*End of Piece 02 — Continues in Piece 03: Proper Time Metric Components*