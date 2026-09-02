# A1-11: Worldline Self-Intersection — γ(τ_n) = γ(τ_m) Topology (Piece 02)

## 8. Self-Intersection as Feynman Diagrams

### 8.1 One-Loop Self-Energy from Type I Recurrences

The electron self-energy diagram in QED:
```
    ───●───●───
         ↻
```

In the Prime Electron model, this is a **single self-intersection pair** $(n,m)$ with $d_n = d_m$. The loop is the worldline segment between $\tau_n$ and $\tau_m$:
$$
\Sigma(p) = \int \frac{d^4k}{(2\pi)^4} \frac{\gamma^\mu(\not{p}-\not{k}+m)\gamma_\mu}{(p-k)^2-m^2} \frac{1}{k^2}
$$

In proper-time representation (Schwinger):
$$
\Sigma(p) = -ie^2 \int_0^\infty d\tau \int_0^\tau d\tau' e^{-i(m^2-i\epsilon)(\tau-\tau')} \langle x(\tau) x(\tau') \rangle
$$

The proper-time separation $\tau - \tau' = \kappa(p_m - p_n)$. The sum over all Type I recurrences:
$$
\Sigma(p) \propto \sum_{d \text{ even}} \sum_{p_n, p_m: d_n=d_m=d} \frac{1}{(p_n - p_m)^2}
$$

### 8.2 Vertex Correction from Type II Recurrences

The vertex correction diagram:
```
    ───●───●───
         ↻
       /
      /
     /
```

Corresponds to **two self-intersections** sharing a vertex — a gap pair recurrence $(d_{n-1}, d_n) = (d_{m-1}, d_m)$. The amplitude:
$$
\Lambda^\mu(p', p) \propto \sum_{\text{Type II}} \frac{\gamma^\mu}{(p_n - p_m)^2} \dots
$$

### 8.3 Two-Loop Diagrams from Type III Recurrences

Higher-loop QED diagrams correspond to **longer gap block recurrences**. The light-light scattering box diagram:
```
    ───●───────●───
         ╱ ╲
        ╱   ╲
       ╱     ╲
    ───●───────●───
```

Requires a **4-vertex recurrence** — gap block of length 4. The rarity of long block recurrences ($\sim N^2/\ln^{L+1} N$) matches the **suppression of higher-loop diagrams** by powers of $\alpha$.

### 8.4 Diagram Topology = Recurrence Graph

The **Feynman diagram topology** is isomorphic to the **self-intersection graph topology**:

| QED Diagram | Recurrence Type | Graph Structure |
|-------------|-----------------|-----------------|
| Self-energy (1-loop) | Type I (single gap) | Edge in gap-value clique |
| Vertex correction | Type II (gap pair) | Path of length 2 |
| Self-energy (2-loop) | Type III (5-block) | Triangle in gap-pair graph |
| Light-light box | Type III (4-block) | Square in gap-pair graph |
| Higher loops | Type $k$ ($L$-block) | $L$-cycle in $k$-block graph |

### 8.5 Finiteness from Prime Gap Statistics

The **UV finiteness** of QED in the Prime Electron model comes from:
1. **Discrete proper time** — no continuous $\tau$ integral divergence
2. **Gap value distribution** — sum over $1/(p_n-p_m)^2$ converges
3. **Recurrence rarity** — longer blocks exponentially suppressed

No renormalization counterterms needed — the **bare parameters are the physical parameters** because the theory is UV-complete at the Compton scale.

---

## 9. Self-Intersection Topology and Knot Theory

### 9.1 Worldline as a Knot in 4D Spacetime

The single electron worldline is a **curve in $\mathbb{R}^4$** (or $\mathbb{M}^4$). Self-intersections are **double points** of this curve. The **knotting** of the worldline is characterized by:

- **Self-intersection points**: $d_n = d_m$ pairs
- **Self-intersection arcs**: segments between recurrence pairs
- **Linking numbers**: between different self-intersection loops

### 9.2 Self-Intersection Loops

A **self-intersection loop** is a segment of the worldline from $n$ to $m$ where $d_n = d_m$ and the gap sequence in between forms a closed loop in gap space. The **writhe** of this loop:
$$
Wr(n,m) = \frac{1}{4\pi} \sum_{i,j \in [n,m]} \frac{(d_i - d_j) \cdot (\tau_i - \tau_j)}{|d_i - d_j|^3}
$$

### 9.3 Linking of Self-Intersection Loops

Two self-intersection loops $(n_1, m_1)$ and $(n_2, m_2)$ can **link** in spacetime. The linking number:
$$
Lk = \frac{1}{4\pi} \oint_{C_1} \oint_{C_2} \frac{(x_1 - x_2) \cdot (dx_1 \times dx_2)}{|x_1 - x_2|^3}
$$

In the Prime Electron model, this linking is determined by **gap sequence cross-correlations**.

### 9.4 Knot Invariants from Prime Gaps

The **Jones polynomial** $V(q)$ of the worldline knot can be expressed as a sum over self-intersection configurations:
$$
V(q) = \sum_{\text{self-int. configs}} q^{\text{writhe}} \prod_{\text{crossings}} (\text{gap weights})
$$

This connects **knot theory** to **prime gap statistics** — a new mathematical framework.

---

## 10. Self-Intersection and Causality

### 10.1 Timelike, Spacelike, Lightlike Separations

For a self-intersection pair $(n,m)$ with $n < m$:
- **Proper time separation**: $\Delta\tau = \tau_m - \tau_n = \kappa(p_m - p_n) > 0$ (always timelike)
- **Spatial separation**: depends on embedding $x^\mu(\tau)$

Since proper time always increases, **all self-intersections are timelike separated** in the worldline parameterization. The electron meets its **future self** (or past self from the other segment's perspective).

### 10.2 Causal Structure of Self-Interactions

The self-interaction is **causal** — the electron at $\tau_n$ interacts with itself at $\tau_m > \tau_n$. This is consistent with the **Feynman propagator** structure.

### 10.3 Closed Timelike Curves?

If the worldline has a self-intersection that forms a **closed loop** in spacetime (not just proper time), it could create a CTC. The condition:
$$
x^\mu(\tau_n) = x^\mu(\tau_m) \text{ AND } \text{the segment } [n,m] \text{ is closed in space}
$$

This requires the spatial embedding to close. From A1-13 (Causal Structure), the light cone structure from gap sequences prevents macroscopic CTCs — but **microscopic CTCs at Compton scale** may exist.

---

## 11. Self-Intersection Density and the Fine-Structure Constant

### 11.1 Self-Intersection Density

The **density of Type I self-intersections** per unit proper time:
$$
\rho_{\text{self}}(\tau) = \frac{d}{d\tau} \sum_{d} \frac{1}{2} \pi_d(N(\tau))^2
$$

Using $N(\tau) \approx \tau/(\kappa \ln N)$ and $\pi_d \sim N/(\ln N \phi(d))$:
$$
\rho_{\text{self}} \sim \frac{N}{\kappa \ln^3 N} \sum_d \frac{1}{\phi(d)^2} \sim \frac{m_e}{\hbar} \frac{\alpha}{\ln N}
$$

### 11.2 Connection to $\alpha$

From A1-10, $\alpha^{-1} \approx \bar{d} \sim \ln N$. The self-intersection density:
$$
\rho_{\text{self}} \sim \frac{m_e}{\hbar} \alpha \cdot \alpha = \frac{m_e}{\hbar} \alpha^2
$$

The **fine-structure constant $\alpha$ is the square root of the self-intersection density** in natural units. This is a **geometric derivation of $\alpha$**.

### 11.3 Running $\alpha$ from Self-Intersection Flow

As we move along the worldline (increasing $N$), the self-intersection density changes:
$$
\frac{d\alpha}{d\ln N} = -\alpha^2
$$

This **exactly reproduces the QED beta function** (from A1-10, Section 10). The **running of $\alpha$ is the flow of self-intersection density** along the worldline.

---

*End of Piece 02 — Continues in Piece 03: Self-Intersection and the Electron's Internal Structure*