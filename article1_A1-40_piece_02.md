# A1-40 Worldline_PrimeBookOne.md — Piece 02
## Master Gap Sequence Matrix — 3500 Books × dₙ

The foundational data in PrimeBookOne is the gap sequence matrix. Each book provides a row of gap statistics.

**Gap sequence per book.** Book $b$ has gap sequence $d_n(b)$ for $n = 1$ to $N_b$. The master matrix is:
$$\mathcal{D}_{b,n} = d_n(b) \quad (b = 1,\dots,3500; n = 1,\dots,N_b)$$
This is a ragged matrix (different $N_b$ per book). The padded version uses $\mathcal{D}_{b,n} = 0$ for $n > N_b$.

**Gap distribution statistics.** For each book $b$, the gap distribution is:
$$P_b(d) = \frac{1}{N_b} \sum_{n=1}^{N_b} \delta_{d, d_n(b)}$$
PrimeBookOne stores the histogram $\mathcal{H}_{b,d} = P_b(d) \cdot N_b$ for $d \in \{2, 4, 6, \dots, d_{\max}(b)\}$.

**Multiplicity matrix.** The multiplicity of gap $d$ in book $b$ is:
$$m_{b,d} = \sum_{n=1}^{N_b} \delta_{d, d_n(b)}$$
This 3500×D matrix (D = max gap = 354) is the core statistical data.

**Gap ratio matrix.** The adjacent gap ratio $r_n = d_{n+1}/d_n$ gives:
$$\mathcal{R}_{b,n} = r_n(b)$$
The distribution $P_b(r)$ is stored per book. The ratio $r=1$ for twin primes ($d=2$) has high weight.

**Record gap matrix.** The record gaps (A005250) for each book:
$$\mathcal{R}\mathcal{G}_{b,k} = \text{k-th record gap in book } b$$
The 78 BPS record gaps appear as $\mathcal{R}\mathcal{G}_{b,k} = d_k^{\text{record}}$ for $k \leq 78$ when $b$ is large enough.

**Twin prime indicator matrix.** The twin prime indicator:
$$\mathcal{T}_{b,n} = \begin{cases} 1 & \text{if } d_n(b) = 2 \text{ and } d_{n+1}(b) = 2 \\ 0 & \text{otherwise} \end{cases}$$
Summing over $n$ gives the twin prime count $\pi_2(b)$ per book.

**Scaling collapse.** Plotting $m_{b,d}/m_{b,2}$ vs $d$ for all 3500 books shows data collapse onto the Hardy-Littlewood constants $C_d/C_2$.

(End of file - 35 lines)