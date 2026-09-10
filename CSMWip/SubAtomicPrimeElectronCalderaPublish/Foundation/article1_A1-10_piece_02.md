# A1-10: Worldline Segment Books — 3500 Books = 3500 Segments (Piece 02)

## 3. Mathematical Structure of Worldline Segments

### 3.1 Segment Boundary Conditions

Each worldline segment (book) has well-defined boundary data:

**Initial vertex:** prime $p_{(b-1)M+1}$ at proper time $\tau_{(b-1)M}$  
**Final vertex:** prime $p_{bM}$ at proper time $\tau_{bM}$  
**Segment proper time:** $\Delta\tau_b = \tau_{bM} - \tau_{(b-1)M} = \kappa(p_{bM} - p_{(b-1)M})$

The **segment action** (in natural units $\hbar = c = 1$):
$$
S_b = \sum_{n=(b-1)M+1}^{bM} d_n = p_{bM} - p_{(b-1)M}
$$

### 3.2 Segment Invariants

For each book $b$, we define the following invariants:

1. **Total gap sum:** $G_b = \sum_{n \in \text{book}_b} d_n = p_{bM} - p_{(b-1)M}$
2. **Mean gap:** $\bar{d}_b = G_b / M$
3. **Gap variance:** $\sigma_b^2 = \frac{1}{M} \sum_{n \in \text{book}_b} (d_n - \bar{d}_b)^2$
4. **Twin prime count:** $T_b = \#\{n \in \text{book}_b : d_n = 2\}$
5. **Record gap indicator:** $R_b = 1$ if $\max_{n \in \text{book}_b} d_n > \max_{m < bM} d_m$, else 0
6. **Merit maximum:** $\mathcal{M}_b = \max_{n \in \text{book}_b} \frac{d_n}{\ln p_n}$

These 6 invariants completely characterize the segment's topology in the prime gap space.

### 3.3 Segment-to-Segment Transition

The transition between book $b$ and book $b+1$ occurs at vertex $p_{bM}$. The **transition gap** is:
$$
d_{bM} = p_{bM+1} - p_{bM}
$$

This single gap connects two worldline segments. The **continuity condition** is automatic — the prime sequence has no breaks. However, the **statistical properties** change across boundaries because $p_{bM}$ samples a different region of the prime distribution.

### 3.4 Asymptotic Segment Properties

For large $b$ (deep in directory 3.0), using the Prime Number Theorem:
$$
p_n \sim n \ln n, \quad d_n \sim \ln n
$$

Segment $b$ covers indices $n \in [(b-1)M+1, bM]$. For $M = 2^{20} \approx 10^6$:
$$
\bar{d}_b \sim \ln(bM) = \ln b + \ln M \approx \ln b + 13.8
$$

The segment proper time scales as:
$$
\Delta\tau_b \sim \kappa M \ln(bM) \sim \kappa \cdot 10^6 \cdot (\ln b + 13.8)
$$

As $b$ increases from 1 to 3500, the mean gap grows logarithmically — reflecting the **primordial expansion** of proper-time intervals along the worldline.