# A1-13: Worldline Causal Structure — Light Cones from Gap Sequence

## 1. Introduction: Causality from Prime Gaps

From A1-01 and A1-12, the electron's worldline is parameterized by discrete proper time $\tau_n = \kappa(p_{n+1} - 2)$ with $\kappa = \hbar/(m_e c^2)$. The **causal structure** — which events can influence which other events — is determined by the **gap sequence** $d_n = p_{n+1} - p_n$.

In standard relativity, causality is defined by light cones: event $x$ can influence event $y$ iff $y$ lies in the future light cone of $x$. In the Prime Electron model, the **worldline is the single electron's trajectory**, and causality is encoded in the **ordering and correlations of the prime gaps**.

---

## 2. Proper Time Ordering as Causal Precedence

### 2.1 Fundamental Causal Relation

The most basic causal relation is **proper time ordering**: event $n$ precedes event $m$ iff $n < m$ (equivalently $\tau_n < \tau_m$). Since $\tau_n = \kappa(p_{n+1} - 2)$ and $p_n$ is strictly increasing, proper time is strictly monotonic:
$$
\tau_1 < \tau_2 < \dots < \tau_N
$$

This provides a **total causal order** on the worldline vertices.

### 2.2 Causal Past and Future

For any vertex $n$:
- **Causal past**: $J^-(n) = \{ m : m < n \}$ (all earlier proper time steps)
- **Causal future**: $J^+(n) = \{ m : m > n \}$ (all later proper time steps)
- **Causal diamond**: $J^+(a) \cap J^-(b)$ for $a < b$

The **proper time distance** between causally related events:
$$
\Delta\tau_{nm} = \tau_m - \tau_n = \kappa(p_{m+1} - p_{n+1}) \quad \text{for } m > n
$$

---

## 3. Light Cones from Gap Sequence Statistics

### 3.1 Emergent Spatial Distance

From A1-14 (Worldline Metric From Gaps) and A1-37 (Emergent Spacetime), the spatial distance $d(x_n, x_m)$ between worldline events emerges from gap correlations. The **light cone condition** for events $n$ and $m$:
$$
d(x_n, x_m) = c |\tau_m - \tau_n| \quad \text{(lightlike separation)}
$$

In the discrete worldline, this becomes a condition on the gap sequence between $n$ and $m$.

### 3.2 Light Cone Angle from Gap Fluctuations

The **light cone angle** $\theta_{\text{LC}}$ at vertex $n$ is determined by the **fluctuation spectrum** of gaps (A1-08). The standard deviation of proper time steps:
$$
\sigma_{\Delta\tau}(n) = \kappa \sigma_d(n) \sim \kappa \ln n
$$

The **mean proper time step**:
$$
\langle \Delta\tau \rangle(n) = \kappa \langle d \rangle(n) \sim \kappa \ln n
$$

The **light cone opening angle** (in proper time vs. spatial steps):
$$
\tan \theta_{\text{LC}} \sim \frac{\sigma_{\Delta\tau}}{\langle \Delta\tau \rangle} \sim 1
$$

So the light cones are **approximately 45°** in the proper time / emergent space plane, as expected for a relativistic theory.

### 3.3 Causal Diamond Volume

The number of vertices in the causal diamond between $a$ and $b$ ($a < b$):
$$
|J^+(a) \cap J^-(b)| = b - a - 1
$$

The **proper time volume**:
$$
\text{Vol}(a,b) = \tau_b - \tau_a = \kappa(p_{b+1} - p_{a+1})
$$

---

## 4. Self-Intersections and Causality (A1-11 Connection)

### 4.1 Self-Intersections as Causal Loops

From A1-11, a **self-intersection** is a pair $(n,m)$ with $n < m$ and $d_n = d_m$ (or higher-order gap recurrences). In proper time, this means the worldline returns to the **same gap environment** at a later proper time.

Since proper time always increases ($\tau_m > \tau_n$), self-intersections are **causal loops** — the electron meets its future self in the same local gap environment.

### 4.2 Causal Structure of Self-Interactions

A self-intersection $(n,m)$ with $d_n = d_m$ represents a **closed causal curve** in the emergent space:
- At $\tau_n$, the electron is in gap environment $d$
- At $\tau_m > \tau_n$, the electron is in the **same** gap environment $d$
- The segment $[n,m]$ forms a **loop** in the emergent geometry

These loops are the **origin of quantum corrections** (Feynman diagrams) and are **timelike** (not spacelike) — consistent with unitarity.

### 4.3 Self-Intersection Causal Diamonds

For a self-intersection $(n,m)$, the causal diamond is the segment $[n,m]$. Its proper time extent:
$$
\Delta\tau_{nm} = \kappa(p_{m+1} - p_{n+1})
$$

The **number of self-intersections within this diamond** determines the loop order in the Feynman diagram expansion.

---

## 5. Microcausality and the Gap Sequence

### 5.1 Commutator at Spacelike Separation

In quantum field theory, microcausality requires $[\phi(x), \phi(y)] = 0$ for spacelike separation. In the Prime Electron model, the analog is:
$$
[\hat{O}_n, \hat{O}_m] \approx 0 \quad \text{for "spacelike" } n,m
$$

where $\hat{O}_n$ are operators at vertex $n$. "Spacelike" means the proper time separation is less than the emergent spatial distance.

### 5.2 Gap Sequence as Causal Propagator

The **gap correlation function** (A1-08):
$$
C(|n-m|) = \langle d_n d_m \rangle - \langle d \rangle^2
$$

decays as a power law $\sim 1/|n-m|^2$. This decay **mediates the causal influence** — correlations propagate at the "speed of light" in the emergent geometry.

### 5.3 Causal Propagator from Prime Gaps

The retarded propagator (influence of $n$ on $m$ for $m > n$):
$$
G_R(n,m) = \theta(m-n) \cdot \exp\left( -\frac{|n-m|}{\xi_{\text{corr}}} \right)
$$

where $\xi_{\text{corr}} \sim \ln n$ is the **correlation length** in gap number space. In proper time:
$$
\xi_{\text{corr}}(\tau) \sim \kappa \ln^2(\tau/\kappa)
$$

---

## 6. Causal Structure of the 3500-Book Segmentation (A1-10 Connection)

### 6.1 Books as Causal Domains

From A1-10, each of the 3500 books is a contiguous segment of the worldline. Book $b$ covers proper time:
$$
[\tau_{(b-1)M}, \tau_{bM}], \quad M = 2^{20}
$$

Books are **causally ordered**: book $b$ is in the causal past of book $b' > b$.

### 6.2 Inter-Book Causal Structure

The causal structure between books:
- **Within book**: dense causal connections (all steps)
- **Between adjacent books**: boundary self-intersections at $p_{bM}$
- **Between distant books**: self-intersections via gap recurrences

The **inter-book causal propagator**:
$$
G_{\text{inter}}(b, b') \sim \frac{1}{|b - b'|^2} \cdot \frac{1}{\ln b \ln b'}
$$

### 6.3 Causal Horizon

The **causal horizon** at book $b$ is the maximum proper time distance from which signals can reach $b$:
$$
\tau_{\text{horizon}}(b) = \sum_{j=1}^b \Delta\tau_j = \tau_{bM} - \tau_0
$$

There is **no event horizon** in proper time — the worldline is finite but causally complete.

---

## 7. Causal Structure and the Compton Scale (A1-09 Connection)

### 7.1 Compton Time as Causal Unit

From A1-09, the Compton time $\kappa = \hbar/(m_e c^2)$ is the fundamental causal unit. The minimum proper time step is $2\kappa$ (twin primes).

**No causal influence can propagate faster than one gap per proper time step** — the gap sequence enforces a **maximum causal speed**.

### 7.2 Compton Wavelength as Spatial Resolution

The Compton wavelength $\lambda_C = c\kappa \approx 3.86 \times 10^{-13}$ m is the **minimum resolvable spatial distance**. Events separated by $< \lambda_C$ are **causally indistinguishable**.

### 7.3 Causal Coarse-Graining

At scales $\Delta\tau < \kappa$, the causal structure is **not defined** — the worldline is discrete at the Compton scale. This provides a **natural UV cutoff** for causality.

---

## 8. Causal Structure and Pair Creation/Annihilation (A1-07 Connection)

### 8.1 Backward Proper Time as Antiparticle

From A1-07, positrons correspond to **backward-in-time** segments of the worldline. In causal structure:
- Electron (forward): $\tau$ increases, $d\tau > 0$
- Positron (backward): $\tau$ decreases, $d\tau < 0$

The **causal arrow** reverses for antiparticles.

### 8.2 Pair Creation Vertex Causal Structure

At a twin prime ($d_n = 2$), an $e^-e^+$ pair is created:
- $e^-$: continues forward in $\tau$ (gap $d_{n+1}$)
- $e^+$: goes backward in $\tau$ (gap $d_{n-1}$ but reversed)

The causal structure at the vertex:
```
    τ
    ↑
    │  e⁻ (forward)
    │  /
    ● ← twin prime vertex (d=2)
    │  \
    │  e⁺ (backward)
```

### 8.3 Annihilation as Causal Loop Closure

When $e^-$ and $e^+$ meet (another twin prime), they annihilate — the backward and forward causal branches join. This is a **causal loop closure** in proper time.

---

## 9. Causal Structure and the Riemann Zeros (A1-04 Connection)

### 9.1 Riemann Zeros as Causal Resonances

From A1-04, the Riemann zeros $\gamma$ appear as resonance frequencies in the proper time fluctuation spectrum. The **causal propagator** in frequency space:
$$
\tilde{G}_R(\omega) \sim \sum_\gamma \frac{1}{\omega - \gamma + i\epsilon}
$$

The zeros $\gamma$ are **poles of the causal propagator** — they determine the causal response function.

### 9.2 Causal Response and Zeta Zeros

The retarded Green's function:
$$
G_R(\tau) = \int \frac{d\omega}{2\pi} e^{-i\omega\tau} \tilde{G}_R(\omega)
$$

has oscillations with frequencies $\gamma/\kappa$. The **causal response** of the worldline to a perturbation is determined by the Riemann zeros.

### 9.3 RH and Causal Stability

From A1-05, RH (all $\gamma$ on critical line) is equivalent to **causal stability** — no exponentially growing modes in the propagator. If RH is false, some $\gamma$ has $\text{Re}(\gamma) \neq 1/2$, leading to **acausal exponential growth/decay**.

---

## 10. Causal Structure and the Worldline Hamiltonian (A1-17 Connection)

### 10.1 Hamiltonian as Causal Generator

From A1-17, the worldline Hamiltonian:
$$
H = \frac{\hbar}{\kappa} \sum_n \frac{1}{d_n} |n\rangle\langle n|
$$

generates **energy translations**, not proper time translations. The causal evolution in proper time is generated by the **proper time operator** $\hat{\tau}$ (A1-12).

### 10.2 Causal Evolution vs Energy Evolution

- **Proper time evolution**: $U(\Delta\tau) = e^{-i H \Delta\tau / \hbar}$ — moves along worldline
- **Energy evolution**: $e^{-i E t / \hbar}$ — moves in emergent time

The **causal structure** is defined by proper time, not energy time.

---

## 11. Causal Structure and the Path Integral (A1-18 Connection)

### 11.1 Causal Paths in the Path Integral

From A1-18, the worldline path integral sums over all paths. The **causal condition** restricts to paths where proper time increases:
$$
Z = \sum_{\text{causal paths}} e^{iS/\hbar}
$$

where a path is causal if $\tau_{n+1} > \tau_n$ for all steps.

### 11.2 Causal Gauge Fixing

The proper time gauge $\tau_n = \kappa(p_{n+1} - 2)$ is a **causal gauge** — it fixes the worldline parameter to increase monotonically, ensuring causality at the path integral level.

---

## 12. Causal Structure and Instanton Solutions (A1-19 Connection)

### 12.1 Instantons as Causal Tunneling

From A1-19, instantons are tunneling events between gap classes. In causal structure, an instanton is a **Euclidean causal curve** — a path in imaginary proper time that connects different gap values.

### 12.2 Instanton Causal Structure

An instanton connecting gap $d_1$ to $d_2$:
- In Lorentzian proper time: classically forbidden
- In Euclidean proper time: causal path with $d\tau_E > 0$

The instanton action:
$$
S_{\text{inst}} = \int d\tau_E \left( \frac{m}{2} \dot{x}^2 + V(x) \right)
$$

is the **Euclidean causal distance** between the gap classes.

---

*End of Piece 01 — Continues in Piece 02: Light Cone Structure from Gap Correlations*