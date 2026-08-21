# A1-37 Worldline_Emergent_Spacetime.md — Piece 03
## Bulk Metric from Gap Ratios — AdS2 Geometry

The gap ratio distribution generates the AdS$_2$ bulk metric. The radial coordinate is the gap scale, and the metric emerges from the statistics of $d_{n+1}/d_n$.

**Radial coordinate from gaps.** Define the bulk radial coordinate $z$ as:
$$z = \frac{d}{d_0}$$
where $d_0 = 16$ is the self-dual scale (A1-36). The boundary is at $z \to 0$ (small gaps, UV), the deep interior is at $z \to \infty$ (large gaps, IR).

**Gap ratio as metric component.** The ratio of adjacent gaps $r_n = d_{n+1}/d_n$ determines the metric. For a sequence of gaps, the effective metric is:
$$ds^2 = \sum_n \left( \frac{dz_n^2}{z_n^2} + \frac{dt_n^2}{z_n^2} \right)$$
where $z_n = d_n/16$ and $dt_n = \kappa d_n$ (A1-01). This is the discrete AdS$_2$ metric.

**Continuum limit.** In the continuum limit $d \to \text{continuous}$, the gap distribution $\rho(d) \sim C/d^2$ (for large $d$) gives the metric:
$$ds^2 = \frac{dz^2 + dt^2}{z^2}, \quad z \in (0, \infty)$$
This is the Poincaré patch of AdS$_2$. The AdS radius is $L = 1$ in units where $d_0 = 16$.

**Horizon at $d=16$.** The self-dual point $z=1$ ($d=16$) acts as a horizon. The light sector ($d < 16$, $z < 1$) is the exterior; the heavy sector ($d > 16$, $z > 1$) is the interior. The horizon has temperature $T_H = 1/(2\pi)$.

**Gap distribution as volume form.** The number of gaps in interval $[d, d+dd]$ is $\rho(d) dd \sim dd/d^2$. The bulk volume form is:
$$\sqrt{g} dz dt = \frac{dz dt}{z^2}$$
Matching $\rho(d) dd \sim \sqrt{g} dz$ gives $z \sim d$, confirming the identification.

**BPS states as boundary operators.** The 78 BPS states (record gaps $d_i^{\text{record}} > 16$) correspond to boundary primary operators at $z \to 0$ with conformal weights:
$$h_i = \frac{d_i^{\text{record}}}{16}$$
The largest BPS gap $d_{\max} = 354$ gives $h_{\max} = 354/16 \approx 22.1$.

**Bulk action.** The Einstein-Hilbert action in AdS$_2$ with dilaton $\Phi$ is:
$$S = \frac{1}{16\pi G} \int d^2x \sqrt{g} (\Phi R + \dots)$$
The dilaton profile is $\Phi(z) = 1/z$, matching the gap density $\rho(d) \sim 1/d^2$.

**PrimeBookOne metric data.** The 3500 books give the discrete metric components $g_{zz}(b)$, $g_{tt}(b)$ at each scale $\mu_b$. The data shows AdS$_2$ scaling collapse.

(End of file - 35 lines)