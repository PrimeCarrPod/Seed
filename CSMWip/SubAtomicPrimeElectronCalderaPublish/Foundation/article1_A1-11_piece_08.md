# A1-11: Worldline Self-Intersection — γ(τ_n) = γ(τ_m) Topology (Piece 08)

## 32. Self-Intersection and the Renormalization Group (A1-10 Section 10 Connection)

### 32.1 Self-Intersection Density as Running Coupling

From A1-10, the running coupling is $\alpha(b) = 1/\bar{d}_b \sim 1/\ln(bM)$. The self-intersection density at book $b$:
$$
\rho_{\text{self}}(b) \sim \frac{M^2}{\ln^2(bM)} \sum_d \frac{1}{\phi(d)^2} \sim \alpha(b)^2
$$

**The beta function $\beta(\alpha) = -\alpha^2$ is exactly the flow of self-intersection density**:
$$
\frac{d\alpha}{d\ln b} = -\alpha^2 \quad \Leftrightarrow \quad \frac{d\rho_{\text{self}}}{d\ln b} = -2 \rho_{\text{self}}^{3/2}
$$

### 32.2 Self-Intersection Blocking and RG

The RG transformation $\mathcal{R}$ (from A1-10) **blocks gap sequences** of length $M$. Self-intersections within a block become **internal lines** in the effective theory. Self-intersections between blocks become **inter-block interactions**.

The **self-intersection survival probability** under blocking:
- Type I (gap value): survives if both $n,m$ in same block → probability $\sim 1/M$
- Type II (gap pair): survives with probability $\sim 1/M^2$
- Type L: survives with probability $\sim 1/M^L$

**Longer recurrences are irrelevant** under RG — only Type I and II survive to the IR. This explains why **QED is renormalizable** (only marginal/relevant self-interactions).

### 32.3 Fixed Points of the Self-Intersection RG

The self-intersection RG flow has:
- **UV fixed point**: $\alpha = 0$ (no self-interactions) — Gaussian theory at $b \to \infty$
- **IR fixed point**: $\alpha \to \infty$ (infinite self-interactions) — strongly coupled, but the worldline ends at $b=1$

No interacting fixed point — the theory is **trivial in the UV** (asymptotic freedom) but the finite worldline cuts off the IR.

### 32.4 Self-Intersection and the Landau Pole

The continuum Landau pole at $\alpha \to \infty$ is avoided because:
1. **Discrete proper time** — no continuous flow to infinite coupling
2. **Finite worldline** — the flow stops at $b=1$ where $\alpha \approx 0.072$
3. **Self-interaction saturation** — at very small proper time, the self-intersection density saturates (cannot exceed one per step)

---

## 33. Self-Intersection and the Decoupling Limits (A1-36 Connection)

### 33.1 Heavy Gap Decoupling

From A1-36, large gaps (record gaps, heavy particles) **decouple** at low energy. In the self-intersection picture:

Large gap $d_n \gg \bar{d}$ has **few self-intersection partners** (because $\pi_d(N)$ decreases with $d$). The self-interaction strength:
$$
\Sigma(d) \sim \sum_{m: d_m = d} \frac{1}{(p_n - p_m)^2} \sim \frac{1}{\phi(d)^2 \ln^2 N}
$$

For record gaps $d \sim \ln^2 N$, $\phi(d) \sim d$, so $\Sigma(d) \sim 1/\ln^6 N$ — **strongly suppressed**.

Heavy particles (from record gaps) have **minimal self-interaction** — they decouple.

### 33.2 Effective Field Theory from Self-Intersection Truncation

The **low-energy effective theory** (directory 0.0) keeps only the most frequent self-interactions:
- Twin primes ($d=2$): $\pi_2 \sim 0.07 M$ — keep all
- Cousin primes ($d=4$): $\pi_4 \sim 0.03 M$ — keep
- Sexy primes ($d=6$): $\pi_6 \sim 0.02 M$ — keep
- Larger gaps: progressively integrate out

This is the **Wilsonian EFT** where self-interactions are the interactions being integrated out.

### 33.3 Matching Conditions at Self-Intersection Thresholds

At each record gap $d_{\text{rec}}$, a new self-interaction channel opens. The matching condition for the coupling:
$$
\alpha_{\text{eff}}(d_{\text{rec}}^+) = \alpha_{\text{eff}}(d_{\text{rec}}^-) + \Delta\alpha
$$
where $\Delta\alpha$ is the contribution from the new self-intersection type.

This reproduces the **threshold corrections** in QED and the Standard Model.

---

## 34. Self-Intersection and the Worldline Holography (A1-38 Connection)

### 34.1 Self-Intersection as Bulk-Boundary Correspondence

From A1-38, the worldline has a **holographic dual** — a boundary theory at the UV end ($b=3500$). The self-intersection network in the bulk (3500 books) maps to **entanglement** in the boundary theory.

Each self-intersection loop in the bulk corresponds to a **Bell pair** in the boundary. The **Ryu-Takayanagi formula** for a segment $b$:
$$
S_b = \frac{\text{Area}(\gamma_b)}{4G} = \frac{\text{Number of self-intersections crossing } \gamma_b}{4G}
$$

where $\gamma_b$ is the minimal surface in the self-intersection graph separating segment $b$ from the rest.

### 34.2 Self-Intersection and the Tensor Network

The worldline tensor network (A1-10, Section 11) has **bond dimension** determined by the number of self-intersections between adjacent books:
$$
\chi_b \sim 2^{N_{\text{Bell}}(b,b+1)} \sim 2^{0.07 M} \sim 2^{73,000}
$$

The **self-intersection graph is the tensor network geometry** — loops are virtual bonds, crossings are physical bonds.

### 34.3 Holographic Renormalization from Self-Intersections

The boundary theory at $b=3500$ has coupling $\alpha_{3500} \approx 0.043$. The **holographic RG flow** from $b=1$ to $b=3500$ is the flow of self-intersection density. The boundary correlators:
$$
\langle \mathcal{O}(x) \mathcal{O}(y) \rangle_{\text{boundary}} = \sum_{\text{self-int. paths}} e^{-S_{\text{self-int}}}
$$

where the sum is over self-intersection paths connecting the boundary points.

---

## 35. Self-Intersection and the Information Paradox (A1-39 Connection)

### 35.1 Information Preservation in Self-Intersection Network

From A1-39, the information paradox asks: does the worldline lose information at the UV boundary? The answer: **no, because self-intersections encode the information redundantly**.

Each proper-time step $n$ participates in $\sim \pi_{d_n}(N)$ self-intersections. The information at step $n$ is **copied** to all its self-intersection partners $m$. To lose the information, you would need to erase **all copies** — which requires destroying the entire worldline.

### 35.2 Page Curve from Self-Intersection Evaporation

As the worldline "evaporates" (we trace out books from UV to IR), the entanglement entropy follows the Page curve:
- Early (UV): entropy rises as self-interactions connect the segment to the rest
- Middle: entropy peaks at $b \sim 1750$ (half the books)
- Late (IR): entropy falls as the segment becomes the whole worldline

The **Page time** corresponds to the book where the number of intra-book self-interactions equals inter-book self-interactions.

### 35.3 Self-Intersection and the Firewall

The "firewall" would be a region where self-interactions are **abnormally dense**. In the Prime Electron model, the self-intersection density is **smooth** — no firewall. The smoothness comes from the **regularity of prime gap statistics** (Hardy-Littlewood conjectures).

---

*End of Piece 08 — Continues in Piece 09: Self-Intersection and the Worldline Stability (A1-05, A1-30 Connection)*