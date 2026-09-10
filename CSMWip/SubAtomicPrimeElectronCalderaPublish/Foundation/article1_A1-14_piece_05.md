# A1-14: Worldline Metric From Gaps — Piece 05: Emergent Light Cone Structure

## 9. Light Cone from Metric

### 9.1 Light Cone Equation

The light cone at vertex $n$ is given by $ds^2 = 0$:
$$
d\tau^2 = g_{ij}(n) dx^i dx^j = \langle d_n \rangle \delta_{ij} dx^i dx^j
$$

The light cone angle in $(d\tau, dx)$ plane:
$$
\tan \theta_{\text{LC}} = \frac{dx}{d\tau} = \frac{1}{\sqrt{\langle d_n \rangle}} \sim \frac{1}{\sqrt{\ln n}}
$$

Wait — this gives angle $\to 0$ as $n \to \infty$. Let's reconsider.

### 9.2 Correct Light Cone Condition

The proper time step is $\Delta\tau = \kappa d_n$. The spatial step between self-intersections is $\Delta x \sim \kappa \sqrt{\text{Var}(d)} \sim \kappa \ln n$. The light cone condition is:
$$
\frac{\Delta x}{\Delta \tau} \sim \frac{\kappa \ln n}{\kappa d_n} \sim \frac{\ln n}{d_n}
$$

For typical gaps $d_n \sim \ln n$, this ratio is $\mathcal{O}(1)$ — the light cone is at $\sim 45^\circ$.

### 9.3 Fluctuating Light Cone

The light cone fluctuates with gap value:
$$
\tan \theta_{\text{LC}}(n) = \frac{\sigma_d(n)}{\langle d \rangle(n)} \sim \frac{\ln n}{\ln n} \sim 1
$$

The light cone has **quantum fuzziness** of order 1 — a fundamental property from gap randomness.

---

## 10. Causal Diamond Geometry

### 10.1 Diamond Volume

For vertices $a < b$, the causal diamond volume:
$$
\text{Vol}(a,b) = \int_a^b \sqrt{-g} \, d\tau = \int_a^b \langle d_n \rangle^2 d\tau \sim \kappa \int_a^b \ln^2 n \, d_n
$$

### 10.2 Diamond Entropy

From A1-31, the entanglement entropy of causal diamond $[a,b]$:
$$
S(a,b) = \frac{1}{6} \ln \text{Vol}(a,b) + \text{const} \sim \frac{1}{3} \ln \ln b
$$

This logarithmic growth is characteristic of 1+1D CFT — the worldline causal diamonds behave like a 1+1D conformal system.

---

*End of Piece 05 — Continues in Piece 06: Metric Evolution Along Worldline*