# A1-10: Worldline Segment Books — 3500 Books = 3500 Segments (Piece 06)

## 7. Vertex Interaction Points Within Segments

### 7.1 Vertices as Prime Indices

From A1-06 (Vertex Interaction Points), each prime $p_n$ is a **vertex** on the worldline where the electron can interact. Within a segment $b$, the vertices are:
$$
\mathcal{V}_b = \{ p_{(b-1)M+1}, p_{(b-1)M+2}, \dots, p_{bM} \}
$$

There are exactly **$M = 1,048,576$ vertices per segment**.

### 7.2 Vertex Interaction Amplitude

The amplitude for an interaction at vertex $p_n$ is proportional to the **local gap density**. For vertex $p_n$ inside segment $b$:
$$
\mathcal{A}(p_n) \propto \frac{1}{d_n} = \frac{1}{p_{n+1} - p_n}
$$

**Small gaps (twin primes) = strong interaction vertices. Large gaps = weak interaction vertices.**

### 7.3 Segment Vertex Distribution

Within segment $b$, the gap distribution follows the local prime statistics. The **vertex interaction density** is:
$$
\rho_{\text{int}}^{(b)}(E) = \frac{1}{M} \sum_{n \in \text{book}_b} \delta\left( E - \frac{\hbar}{\kappa d_n} \right)
$$

This is the **spectral function** of interaction vertices in segment $b$. It peaks at:
- $E \approx m_e c^2$ (twin primes, $d=2$)
- Broad continuum up to $E \sim \hbar/(\kappa \ln p_n)$

### 7.4 Intra-Segment Vertex Correlations

The **two-vertex correlation function** within segment $b$:
$$
C_b(r) = \frac{1}{M} \sum_{n \in \text{book}_b} \frac{1}{d_n d_{n+r}} - \left( \frac{1}{M} \sum_{n \in \text{book}_b} \frac{1}{d_n} \right)^2
$$

For $r \ll M$, this decays as $C_b(r) \sim 1/r^2$ (from gap correlations). For $r \sim M$, it vanishes — **no long-range vertex order within a segment** (except at critical points).

### 7.5 Vertex Self-Intersection (A1-11 Preview)

A vertex $p_n$ can be visited multiple times if the worldline self-intersects (A1-11). Within a single segment, self-intersections occur when:
$$
p_n \equiv p_m \pmod{\text{topology}}
$$

In the prime gap model, this corresponds to **gap sequence recurrences**: $d_{n} = d_{m}$ for $n \neq m$ within the same book. The number of such recurrences in segment $b$ is:
$$
N_{\text{recur}}^{(b)} \approx M \cdot \frac{\text{distinct gaps in book}_b}{\text{total possible gaps}}
$$

For typical segments, most gaps are distinct — **minimal self-intersection within a segment**. Self-intersections predominantly occur **between different segments** (different books).

### 7.6 Segment Vertex Count and Gauge Couplings

From A1-12 (Proper Time Operator) and A4 (Coupling Constants), the number of vertices per segment determines the **running couplings**:
$$
\alpha^{-1}(b) = \frac{1}{M} \sum_{n \in \text{book}_b} d_n = \bar{d}_b
$$

**The mean gap in segment $b$ is the inverse fine-structure constant at that worldline scale.** As $b$ increases, $\bar{d}_b$ grows logarithmically — **$\alpha$ runs logarithmically**, matching QED!