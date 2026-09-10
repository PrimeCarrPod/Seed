# A1-11: Worldline Self-Intersection — γ(τ_n) = γ(τ_m) Topology

## 1. Introduction: The Electron Meets Itself

In the one-electron universe (Wheeler 1940, Gielerak 2020), the **single electron worldline must self-intersect** — it is a single trajectory that fills spacetime. In the Prime Electron model, self-intersections occur when the worldline returns to the same spacetime point:
$$
\gamma(\tau_n) = \gamma(\tau_m), \quad n \neq m
$$

From A1-01 and A1-06, the worldline vertices are at primes $p_n$ with proper time $\tau_n = \kappa(p_n - 2)$. A self-intersection means:
$$
p_n = p_m \quad \text{impossible for } n \neq m \text{ (primes are distinct)}
$$

**However**, the worldline lives in **embedding spacetime** — the prime index $n$ is proper time, but the spatial position $x^\mu(\tau)$ is a separate degree of freedom. Self-intersection means:
$$
x^\mu(\tau_n) = x^\mu(\tau_m)
$$

In the Prime Electron model, spatial position is encoded in the **gap sequence correlations**. Two proper times $\tau_n, \tau_m$ correspond to the same spacetime event iff their **gap environments match**:
$$
\{d_{n-k}, \dots, d_n, \dots, d_{n+k}\} \equiv \{d_{m-k}, \dots, d_m, \dots, d_{m+k}\}
$$

---

## 2. Gap Recurrence as Self-Intersection

### 2.1 Local Gap Pattern Matching

From A1-06 (Vertex Interaction Points), each vertex $p_n$ has a local gap neighborhood. A **self-intersection candidate** is a pair $(n,m)$ with $n < m$ such that:
$$
d_{n+r} = d_{m+r} \quad \forall r \in [-k, k]
$$

For $k=0$: **gap equality** $d_n = d_m$ — the weakest condition.
For $k=1$: **gap pair equality** $(d_{n-1}, d_n, d_{n+1}) = (d_{m-1}, d_m, d_{m+1})$.
For general $k$: **$k$-block recurrence**.

### 2.2 Exact Self-Intersection Condition

The worldline embedding $x^\mu(\tau)$ is determined by the **entire past gap history** (Markov property of prime gaps is approximate). Exact self-intersection requires:
$$
(d_1, d_2, \dots, d_n) \sim (d_1, d_2, \dots, d_m) \text{ in the sense of } x^\mu
$$

Since the prime sequence is deterministic, **exact recurrence of the full history is impossible** (would imply periodicity). However, **approximate recurrences** are generic and correspond to **near self-intersections**.

---

## 3. Types of Self-Intersection

### 3.1 Type I: Gap Value Recurrence ($k=0$)

Condition: $d_n = d_m$ for $n \neq m$.

**Frequency**: For gap value $d$, the number of occurrences up to $N$ is $\pi_d(N) \sim \frac{N}{\ln N} \frac{1}{\phi(d)}$ (Hardy-Littlewood). The number of pairs:
$$
N_{\text{pairs}}(d) \approx \frac{1}{2} \pi_d(N)^2 \sim \frac{N^2}{2 \ln^2 N} \frac{1}{\phi(d)^2}
$$

Total Type I self-intersection candidates up to $N$:
$$
\sum_{\text{even } d} N_{\text{pairs}}(d) \sim \frac{N^2}{2 \ln^2 N} \sum_{d} \frac{1}{\phi(d)^2} \sim 0.5 \frac{N^2}{\ln^2 N}
$$

For $N = 3.67 \times 10^9$: **~$10^{17}$ gap-value recurrences** — extremely abundant.

### 3.2 Type II: Gap Pair Recurrence ($k=1$)

Condition: $(d_{n-1}, d_n) = (d_{m-1}, d_m)$.

Frequency decays as $\sim N^2 / \ln^3 N$ — still abundant but rarer.

### 3.3 Type III: Gap Block Recurrence ($k \geq 2$)

Condition: $(d_{n-k}, \dots, d_{n+k}) = (d_{m-k}, \dots, d_{m+k})$.

For block length $L = 2k+1$, expected number of pairs:
$$
N_{\text{pairs}}(L) \sim \frac{N^2}{\ln^{L+1} N}
$$

For $L=5$ ($k=2$): $\sim N^2 / \ln^6 N$ — **still $\sim 10^9$ for $N=3.67\times 10^9$**.

### 3.4 Type IV: Exact Vertex Return (Impossible)

Would require $p_n = p_m$ — impossible for distinct primes. The worldline **never exactly returns** to a vertex, but has **infinite approximate returns**.

---

## 4. Self-Intersection and the Electron's Charge

### 4.1 Self-Interaction Vertex

From A1-07 (Pair Creation/Annihilation), when the worldline self-intersects, the electron interacts with **itself at a different proper time**. This is the **self-energy vertex** in QED.

The self-interaction amplitude for pair $(n,m)$:
$$
\mathcal{A}_{\text{self}}(n,m) \propto \frac{1}{(\tau_n - \tau_m)^2} = \frac{1}{\kappa^2 (p_n - p_m)^2}
$$

Summing over all self-intersections:
$$
\Sigma_{\text{self}} \propto \sum_{n \neq m} \frac{\delta_{\text{recur}}(n,m)}{(p_n - p_m)^2}
$$
where $\delta_{\text{recur}}(n,m) = 1$ if $(n,m)$ is a self-intersection.

### 4.2 Divergence and Regularization

The sum over Type I recurrences ($d_n = d_m$) has terms $\sim 1/(p_n - p_m)^2$. For fixed $d$, primes with gap $d$ are distributed with mean spacing $\sim \ln p$. The sum:
$$
\sum_{p_n, p_m: d_n=d_m=d} \frac{1}{(p_n - p_m)^2} \sim \sum_{k \neq 0} \frac{1}{(k \ln p)^2} \sim \frac{\pi^2}{3 \ln^2 p}
$$

**Finite** — the prime gap structure **regularizes the electron self-energy**! No UV divergence because the discrete proper-time lattice provides a natural cutoff.

### 4.3 Connection to $g-2$ Anomaly

The anomalous magnetic moment $a_e = (g-2)/2$ receives contributions from self-intersection diagrams. The leading Schwinger term $\alpha/(2\pi)$ arises from the **nearest self-intersection** (smallest $|p_n - p_m|$ with $d_n = d_m$).

In the Prime Electron model:
$$
a_e = \frac{\alpha}{2\pi} + \sum_{\text{recurrences}} \mathcal{F}(p_n, p_m)
$$
where $\mathcal{F}$ is a function of the prime gap environment. This is a **finite, calculable sum** — no renormalization needed.

---

## 5. Self-Intersection Network Topology

### 5.1 Graph of Self-Intersections

Define graph $\mathcal{G}$ with vertices = proper time steps $n = 1..N$, edges = self-intersection pairs $(n,m)$ of Type I ($d_n = d_m$).

This is a **disjoint union of cliques** — one clique per gap value $d$:
$$
\mathcal{G} = \bigsqcup_{d \text{ even}} K_{\pi_d(N)}
$$
where $K_k$ is the complete graph on $k$ vertices.

### 5.2 Clique Structure and Twin Primes

For $d=2$ (twin primes), $\pi_2(N) \sim 0.66 N / \ln^2 N$. The **twin prime clique** has size $\sim 2.4 \times 10^7$ for $N=3.67\times 10^9$.

**Twin primes form the largest self-intersection clique** — they are the "backbone" of the electron's self-interaction.

### 5.3 Higher-Order Cliques

For gap pairs $(d, d')$, we get a **multipartite graph** structure. The full self-intersection network is a **hierarchy of graphs** at different recurrence lengths $L$.

### 5.4 Topological Invariants

The **Euler characteristic** of the self-intersection graph:
$$
\chi = \sum_d \pi_d(N) - \sum_d \frac{\pi_d(N)(\pi_d(N)-1)}{2} + \dots
$$

The **Betti numbers** count independent loops in the self-intersection network. $b_1$ is the number of independent self-intersection cycles — related to the electron's **internal structure**.

---

## 6. Self-Intersection and Spin (Preview A1-12)

### 6.1 Double Cover from Self-Intersection

From A1-03 (Double Cover SU(2) Spin), the electron's spin-1/2 arises from a **double cover** of the worldline rotation group. Self-intersections provide the **topological mechanism**:

Each self-intersection pair $(n,m)$ with $d_n = d_m = 2$ (twin primes) contributes a **spin-flip**. The total spin rotation after traversing all self-intersections:
$$
\text{Spin rotation} = \prod_{\text{twin pairs}} (-1) = (-1)^{\pi_2(N)}
$$

Since $\pi_2(N)$ is even/odd depending on $N$, this gives the **projective representation** of SO(3) — the double cover SU(2).

### 6.2 Self-Intersection and Fermion Statistics

The **exchange phase** of two electrons in the one-electron universe comes from **self-intersection braiding**. When the worldline self-intersects, it creates a loop. Two such loops can link — the **linking number** gives the exchange phase $-1$.

---

## 7. PrimeBookOne Data: Self-Intersection Census

### 7.1 Directory 3.0 Self-Intersection Count

For the 3500-book dataset ($N = 3.67\times 10^9$):

| Recurrence Type | Expected Pairs | Physical Role |
|-----------------|----------------|---------------|
| Type I (gap value) | $\sim 10^{17}$ | Self-energy vertices |
| Type II (gap pair) | $\sim 10^{14}$ | Vertex corrections |
| Type III (gap 5-block) | $\sim 10^9$ | Two-loop diagrams |
| Type IV (gap 10-block) | $\sim 10^3$ | Rare high-order |

### 7.2 Computational Search Strategy

To find self-intersections in PrimeBookOne data:
1. Load Tile00–Tile188 (directory 0.0) for IR calibration
2. Build hash map: gap value → list of indices
3. For each gap value $d$, all pairs in the list are Type I recurrences
4. For Type II: hash gap pairs $(d_n, d_{n+1})$
5. Extend to higher $k$ iteratively

**Do not clone locally** — use streaming access to Tile zip files.

---

*End of Piece 01 — Continues in Piece 02: Self-Intersection Topology and Feynman Diagrams*