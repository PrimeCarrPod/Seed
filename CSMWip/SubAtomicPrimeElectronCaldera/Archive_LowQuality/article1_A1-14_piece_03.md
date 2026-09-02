# A1-14: Worldline Metric From Gaps — Piece 03: Proper Time Metric Components

## 5. Proper Time Line Element

### 5.1 Discrete Line Element

The proper time line element between adjacent vertices:
$$
d\tau^2 = g_{\mu\nu} dx^\mu dx^\nu = \kappa^2 d_n^2
$$

This is the **fundamental interval** — the proper time step is exactly $\kappa d_n$.

### 5.2 Continuous Approximation

In the continuum limit $M = 2^{20} \to \infty$ (within a book), the proper time becomes a continuous parameter. The metric in proper time coordinates:
$$
ds^2 = d\tau^2 - \langle d \rangle(\tau) \delta_{ij} dx^i dx^j
$$

where $\langle d \rangle(\tau) \sim \ln(\tau/\kappa)$.

### 5.3 Proper Time as Cosmological Time

The proper time $\tau$ acts as a **cosmological time** — it increases monotonically from IR ($\tau \sim \kappa$) to UV ($\tau \sim \kappa N \sim 0.1$ ns). The conformal factor $\Omega^2(\tau) \sim \ln(\tau/\kappa)$ grows logarithmically — the universe "expands" in proper time.

---

## 6. Metric in Emergent Spatial Coordinates

### 6.1 Emergent Spatial Coordinates from Self-Intersections

From A1-11, spatial coordinates $x^i$ emerge from self-intersection topology. The spatial distance between vertices $n$ and $m$:
$$
d_{\text{spatial}}(n,m) \sim \kappa \sqrt{ \sum_{k=n+1}^m \text{Var}(d_k) } \sim \kappa \ln n \sqrt{|m-n|}
$$

### 6.2 Spatial Metric Components

In these coordinates:
$$
g_{ij}(n) = \langle d_n \rangle \delta_{ij} \sim \ln n \, \delta_{ij}
$$

The spatial metric is isotropic and conformal to Euclidean — consistent with the 3D emergent space from self-intersection network.

### 6.3 Determinant and Volume Element

The metric determinant:
$$
\sqrt{-g} = \Omega^4(n) = \langle d_n \rangle^2 \sim \ln^2 n
$$

The proper volume element:
$$
dV = \sqrt{-g} \, d\tau \, d^3x = \ln^2 n \, d\tau \, d^3x
$$

---

*End of Piece 03 — Continues in Piece 04: Spatial Metric from Self-Intersections*