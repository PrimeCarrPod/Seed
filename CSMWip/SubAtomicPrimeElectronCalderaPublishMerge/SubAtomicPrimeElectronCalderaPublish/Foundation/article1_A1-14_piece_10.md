# A1-14: Worldline Metric From Gaps — Piece 10: Metric at Book Boundaries

## 20. Book Boundaries as Metric Junctions

### 20.1 Boundary Conditions at Book Edges

Each book $b$ covers proper time $[\tau_{(b-1)M}, \tau_{bM}]$ with $M = 2^{20}$. At the boundary $n = bM$, the metric must satisfy matching conditions.

### 20.2 Continuity of Metric

The metric is continuous across book boundaries:
$$
g_{\mu\nu}^{(b)}(n=bM) = g_{\mu\nu}^{(b+1)}(n=bM)
$$

The conformal factor $\Omega^2(n) = \langle d_n \rangle$ is continuous because $\langle d \rangle$ varies slowly.

### 20.3 Jump in Derivatives

The derivative of the conformal factor has a jump:
$$
\partial_\tau \Omega^2|_{(b+1)^-} - \partial_\tau \Omega^2|_{b^+} \sim \frac{1}{M \ln b}
$$

This is small ($\sim 10^{-6}$) — the metric is nearly $C^1$ across boundaries.

---

## 21. Boundary Stress-Energy

### 21.1 Israel Junction Conditions

The jump in extrinsic curvature $K_{ij}$ gives a boundary stress-energy:
$$
K_{ij}^+ - K_{ij}^- = -8\pi G \left( S_{ij} - \frac{1}{2} g_{ij} S \right)
$$

### 21.2 Boundary Energy Density

The boundary energy density:
$$
S_{00} \sim \frac{1}{M \ln b} \sim 10^{-6} \kappa^{-1}
$$

This is the **energy cost** of the book segmentation — negligible at low energy, but contributes to the UV cosmological constant.

---

## 22. Book Interiors as Causal Domains

### 22.1 Each Book is a Causal Diamond

Book $b$ is a causal diamond with:
- Past tip: $\tau = \tau_{(b-1)M}$
- Future tip: $\tau = \tau_{bM}$
- Proper time extent: $\Delta\tau_b = \tau_{bM} - \tau_{(b-1)M} \sim M \kappa \ln b$

### 22.2 Book Causal Structure

Within a book, the metric is smooth. The causal structure is Minkowski-like with conformal factor $\Omega^2 \sim \ln(bM)$. The book boundaries are **spacelike surfaces** — no causal influence flows between adjacent books except through the proper time evolution.

---

*End of Piece 10 — Continues in Piece 11: Computational Verification*