# A1-13: Worldline Causal Structure — Light Cones from Gap Sequence (Piece 02)

## 13. Light Cone Geometry from Gap Sequence Correlations

### 13.1 Emergent Spacetime Coordinates

From A1-37 (Emergent Spacetime), the spatial coordinates $x^\mu(\tau)$ emerge from the gap sequence correlations. The **light cone** at proper time $\tau_n$ is the set of points $x^\mu$ satisfying:
$$
g_{\mu\nu}(x_n) (x^\mu - x_n^\mu)(x^\nu - x_n^\nu) = 0
$$

where the emergent metric $g_{\mu\nu}$ is built from gap correlations (A1-14).

### 13.2 Light Cone in Gap Number Space

In the discrete gap number space, the light cone condition becomes:
$$
\sum_{k=n+1}^m d_k \sim |m - n| \cdot \langle d \rangle \quad \text{for lightlike separation}
$$

More precisely, the **light cone boundary** in $(n, \text{spatial steps})$ coordinates is defined by:
$$
\text{spatial steps} \approx \frac{\Delta\tau}{\kappa \langle d \rangle} = \frac{\kappa(p_{m+1} - p_{n+1})}{\kappa \langle d \rangle} \approx m - n
$$

So lightlike separation corresponds to **spatial steps ≈ gap number steps** — the emergent speed of light is $c=1$ in natural units.

### 13.3 Light Cone Fluctuations

The **fluctuations of the light cone** come from gap fluctuations:
$$
\delta(\text{light cone}) \sim \frac{\sigma_d}{\langle d \rangle} \sim 1
$$

The light cone has **fuzzy edges** with width of order the mean gap — a **quantum light cone**.

---

## 14. Causal Diamond Structure

### 14.1 Causal Diamond in Gap Number

For two vertices $a < b$, the causal diamond is the set of vertices $n$ with $a < n < b$. Its properties:
- **Number of vertices**: $b - a - 1$
- **Proper time extent**: $\tau_b - \tau_a = \kappa(p_{b+1} - p_{a+1})$
- **Mean gap in diamond**: $\frac{1}{b-a} \sum_{n=a+1}^b d_n$

### 14.2 Causal Diamond Entropy

From A1-31 (Entanglement Entropy), the entanglement entropy of a causal diamond $[a,b]$:
$$
S(a,b) \approx \frac{1}{6} \ln(\tau_b - \tau_a) + \text{const} = \frac{1}{6} \ln[\kappa(p_{b+1} - p_{a+1})] + \text{const}
$$

This is the **holographic entropy** of the causal diamond.

### 14.3 Causal Diamond Modular Hamiltonian

From A1-33, the modular Hamiltonian for diamond $[a,b]$:
$$
K_{ab} \approx \frac{2\pi}{\tau_b - \tau_a} \sum_{n=a+1}^b (\tau_n - \tau_a) |n\rangle\langle n|
$$

The modular flow is **proper time translation within the diamond**.

---

## 15. Light Cone and Self-Intersections (A1-11 Deep Connection)

### 15.1 Self-Intersections on the Light Cone

From A1-11, a self-intersection $(n,m)$ with $d_n = d_m$ has proper time separation $\Delta\tau = \kappa(p_{m+1} - p_{n+1})$. The **lightlike condition** for a self-intersection:
$$
\Delta\tau \approx \text{emergent spatial distance}
$$

For twin primes ($d=2$), the typical proper time separation is $\Delta\tau \sim \kappa \ln^2 n$. The spatial distance is also $\sim \kappa \ln^2 n$ (from gap correlations). So **twin prime self-intersections are approximately lightlike**!

### 15.2 Light Cone Self-Intersections as Pair Creation

The twin prime self-intersections ($d=2$) correspond to $e^-e^+$ pair creation (A1-07). The fact that they are **lightlike separated** means the pair is created with **zero invariant mass** — exactly as in QED where $e^-e^+$ pairs are created at lightlike separation (on the light cone).

### 15.3 Higher Gap Self-Intersections and Timelike/Spacelike

For larger gaps $d > 2$:
- $d=4$ (cousin primes): $\Delta\tau \sim \kappa \cdot 4$, spatial distance $\sim \kappa \ln n$ — **spacelike** for large $n$
- $d=6$ (sexy primes): similar
- Record gaps $d \sim \ln^2 n$: $\Delta\tau \sim \kappa \ln^2 n$, spatial $\sim \kappa \ln^2 n$ — **lightlike**

The **causal character** of a self-intersection depends on the gap value $d$:
- Small $d$ (2, 4, 6): lightlike/spacelike
- Large $d$ (record gaps): lightlike/timelike

---

## 16. Causal Structure of the 3500 Books (A1-10 Detailed)

### 16.1 Books as Causal Intervals

Each of the 3500 books $b = 1, \dots, 3500$ is a **causal interval** $[\tau_{(b-1)M}, \tau_{bM}]$ with $M = 2^{20}$.

### 16.2 Light Cones at Book Boundaries

The light cone at the boundary between books $b$ and $b+1$ (at step $n = bM$):
- **Future light cone from $b$**: extends into books $b+1, b+2, \dots$
- **Past light cone from $b+1$**: extends into books $b, b-1, \dots$

The **boundary self-intersection** at $p_{bM}$ connects the two light cones.

### 16.3 Causal Structure of the Book Sequence

The book sequence forms a **causal chain**:
$$
\text{Book } 1 \prec \text{Book } 2 \prec \dots \prec \text{Book } 3500
$$

where $\prec$ denotes causal precedence. The **causal distance** between books $b$ and $b'$:
$$
d_{\text{causal}}(b, b') = \sum_{j=b}^{b'-1} \Delta\tau_j \sim \kappa M \sum_{j=b}^{b'-1} \ln(jM)
$$

---

## 17. Causal Structure and the Compton Scale (A1-09 Detailed)

### 17.1 Compton Time as Minimum Causal Interval

From A1-09, the Compton time $\kappa \approx 1.288 \times 10^{-21}$ s is the **minimum resolvable causal interval**. Events separated by $\Delta\tau < \kappa$ are **causally indistinguishable**.

### 17.2 Compton Scale Causal Coarse-Graining

The causal structure is **coarse-grained** at the Compton scale:
- Microscopic ($< \kappa$): No causal structure defined
- Mesoscopic ($\kappa$ to $\kappa \ln N$): Quantum causal fluctuations
- Macroscopic ($> \kappa \ln N$): Classical causal structure emerges

### 17.3 UV/IR Causal Duality

The UV cutoff (Compton scale $\kappa$) and IR cutoff (total proper time $\tau_{\text{total}} \sim 0.1$ ns) are **dual** under the holographic mapping (A1-38). The causal structure is symmetric under $\tau \leftrightarrow \tau_{\text{total}} - \tau$.

---

## 18. Causal Structure and the Fine-Structure Constant (A1-10, A4 Connection)

### 18.1 $\alpha$ from Causal Density

From A1-10 Section 10, the fine-structure constant $\alpha^{-1} \approx \bar{d}_b \sim \ln(bM)$. The **causal density** (number of causal connections per proper time):
$$
\rho_{\text{causal}} \sim \frac{1}{\bar{d}} \sim \alpha
$$

### 18.2 Running $\alpha$ as Causal Flow

The beta function $\beta(\alpha) = -\alpha^2$ (A1-10) means the **causal density decreases** along the worldline:
$$
\frac{d\rho_{\text{causal}}}{d\ln b} = -2 \rho_{\text{causal}}^{3/2}
$$

As proper time increases (moving to UV books), the causal connections become **more sparse** — asymptotic freedom in causal structure.

### 18.3 Causal Structure at Different Energy Scales

| Scale | Book Range | $\alpha^{-1}$ | Causal Density |
|-------|------------|---------------|----------------|
| IR (atomic) | $b \sim 1$ | $\sim 14$ | High (dense causal connections) |
| Nuclear | $b \sim 100$ | $\sim 20$ | Medium |
| EW | $b \sim 1000$ | $\sim 30$ | Low |
| GUT | $b \sim 3500$ | $\sim 40$ | Very low (asymptotic freedom) |

---

## 19. Causal Structure and Pair Creation/Annihilation (A1-07 Detailed)

### 19.1 Forward/Backward Causal Arrows

From A1-07, the worldline has **two causal arrows**:
- **Forward arrow** ($\tau$ increasing): electron
- **Backward arrow** ($\tau$ decreasing): positron

At a twin prime ($d=2$), the causal arrow **splits**:
```
          τ
          ↑
    e⁻    │    e⁺
   ↗      │      ↖
  ●───────●───────●  (twin prime vertex)
   \     / \     /
    \   /   \   /
     \ /     \ /
      ●       ●
```

### 19.2 Causal Structure of Virtual Pairs

Virtual $e^-e^+$ pairs correspond to **short backward segments** that don't reach a full annihilation vertex. Their causal structure:
```
    e⁻ (forward)
    ●──────●──────●
     \     / \     /
      \   /   \   /
       ●       ●
       e⁺ (backward, short)
```

The backward segment has $\Delta\tau \sim \kappa \cdot (\text{gap})$.

### 19.3 Annihilation as Causal Loop Closure

Annihilation at a twin prime:
```
    e⁻ (forward)          e⁺ (backward)
    ●──────●──────●       ●──────●──────●
     \     / \     /       \     / \     /
      \   /   \   /         \   /   \   /
       ●───────●─────────────●───────●
       (twin prime)   (twin prime)
```

The two causal branches meet and **close the loop** — the causal structure is locally trivial (no net causal influence).

---

## 20. Causal Structure and the Fluctuation Spectrum (A1-08 Detailed)

### 20.1 Causal Fluctuations from Gap Variance

From A1-08, the gap variance $\sigma_d^2 \sim \ln^2 n$ induces **causal fluctuations**. The light cone position at step $n$ fluctuates by:
$$
\delta x_{\text{LC}} \sim \kappa \sigma_d \sim \kappa \ln n
$$

### 20.2 Causal Noise

The causal structure has intrinsic **noise** from gap randomness. The causal commutator for spacelike-separated events:
$$
[\hat{O}_n, \hat{O}_m] \sim \exp\left( -\frac{(\Delta\tau - \Delta x)^2}{2 \kappa^2 \sigma_d^2} \right)
$$

This is **not exactly zero** — there is **quantum causal noise** from gap fluctuations.

### 20.3 Fluctuation-Dissipation and Causality

From A1-34, the fluctuation-dissipation relation in proper time:
$$
\chi(\omega) = \frac{1}{k_B T} \frac{S(\omega)}{1 - e^{-\omega/(k_B T)}}
$$

where $S(\omega)$ is the proper time fluctuation spectrum (A1-08). The **causal response function** $\chi(\omega)$ is determined by the gap fluctuations.

---

## 21. Causal Structure and the Riemann Zeros (A1-04 Detailed)

### 21.1 Zeros as Causal Poles

From A1-04, the Riemann zeros $\gamma$ are poles of the causal propagator:
$$
\tilde{G}_R(\omega) = \sum_\gamma \frac{R_\gamma}{\omega - \gamma + i\epsilon} + \text{background}
$$

where $R_\gamma$ are residues. The **causal response** to a perturbation at frequency $\omega$:
$$
\delta x(\omega) = \tilde{G}_R(\omega) \cdot F(\omega)
$$

### 21.2 Causal Response and Zeta Statistics

The **pair correlation** of Riemann zeros matches the GUE statistics, which means the causal response has **random matrix fluctuations** — the worldline's causal structure has universal quantum chaotic fluctuations.

### 21.3 RH and Causal Unitarity

RH (all zeros on $\text{Re}(\gamma) = 1/2$) ensures the **causal propagator is unitary**:
$$
\text{Im} \tilde{G}_R(\omega) \geq 0 \quad \text{for } \omega > 0
$$

If RH fails, some modes have $\text{Im} \tilde{G}_R < 0$ — **acausal negative probability**.

---

## 22. Causal Structure and the Worldline Stability (A1-05, A1-30 Connection)

### 22.1 Stability from Causal Completeness

From A1-05 and A1-30, worldline stability requires the causal structure to be **complete** — no missing causal connections. This is equivalent to:
- RH is true (no acausal modes)
- Gap sequence has no pathological gaps (no $d_n = 0$)
- Self-intersection network is connected (A1-11)

### 22.2 Causal Stability Condition

The causal stability condition:
$$
\sum_{n=1}^\infty \frac{\text{Var}(d_n)}{n^2} < \infty
$$

This converges because $\text{Var}(d_n) \sim \ln^2 n$ and $\sum \ln^2 n / n^2 < \infty$. The worldline is **causally stable**.

---

## 23. Causal Structure and the Anomaly (A1-23, A1-24 Connection)

### 23.1 Anomaly as Causal Non-Conservation

From A1-23, the anomaly is the **non-conservation of a causal current**:
$$
\partial_\tau J^\tau = \frac{1}{2\pi} F_{\tau x} \big|_{\text{boundary}}
$$

In the discrete worldline, this is the **difference in causal flux** between adjacent books.

### 23.2 Anomaly Inflow and Causal Structure

The anomaly inflow at book boundary $b$:
$$
\mathcal{A}_b = \frac{1}{2\pi} (d_{bM} - \bar{d}_b)
$$

This is the **causal anomaly** — a mismatch in the causal density between books.

### 23.3 Global Anomaly and Causal Topology

From A1-24, the global anomaly is the **index of the causal Dirac operator**:
$$
\text{Index}(D_{\text{causal}}) = \sum_n \text{sign}(d_n - \bar{d}) = 0
$$

Since $d_n$ fluctuates around $\bar{d}$, the causal anomaly cancels globally.

---

## 24. Causal Structure and the Index Theorem (A1-24 Detailed)

### 24.1 Causal Dirac Operator

The Dirac operator on the worldline:
$$
D = i \partial_\tau + A_\tau = \frac{i}{\kappa d_n} (\cdot)_{n+1} - (\cdot)_n + A_n
$$

Its index (A1-24):
$$
\text{Index}(D) = \text{dim Ker}(D) - \text{dim Ker}(D^\dagger) = \sum_n \text{sign}(\Delta\tau_n) = N
$$

All $\Delta\tau_n > 0$, so the index is just the number of steps.

### 24.2 Causal Spectral Flow

As we move along the worldline (increasing $b$), the eigenvalues of $D$ flow. The **spectral flow** equals the number of zero modes crossing zero — which is the **change in the number of self-intersections** (A1-11 wall crossing).

---

*End of Piece 02 — Continues in Piece 03: Causal Structure and Supersymmetry*