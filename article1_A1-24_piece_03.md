# PIECE 03: Heat Kernel Asymptotics and the Local Index Density

The Atiyah-Singer index theorem has a celebrated proof via heat kernel asymptotics (Atiyah-Bott-Patodi 1973, Gilkey 1984). For a Dirac operator $D$ on a manifold $M$, the index equals the $t \to 0$ limit of the supertrace of the heat kernel:

$$\text{Index}(D) = \lim_{t \to 0} \text{Str}\left(e^{-t D^2}\right) = \lim_{t \to 0} \int_M \text{str}\left(\gamma_5 K_t(x,x)\right) d^n x$$

where $K_t(x,y) = \langle x | e^{-t D^2} | y \rangle$ is the heat kernel and $\text{str}$ is the supertrace over spinor indices. For the prime electron worldline, the manifold is the discrete proper-time axis $\tau_n$, the integral becomes a sum, and the heat kernel is replaced by the matrix elements of $e^{-t D_\tau^2}$.

The **local index density** at step $n$ is:
$$\mathcal{I}_n = \lim_{t \to 0} \langle n | \gamma_5 e^{-t D_\tau^2} | n \rangle_{\text{str}}$$

where $|n\rangle$ denotes the basis state at proper-time step $n$ (with 256-component spinor in $\mathcal{H}$). Using the gap-dependent hopping $1/d_n$ and potential $V(d_n)$, we compute the short-time asymptotics via a discrete analog of the Seeley-DeWitt expansion:

$$\mathcal{I}_n = \frac{1}{2\pi i} \oint \frac{dz}{z} \text{Tr}_{\mathcal{H}} \left[ \gamma_5 (z - D_\tau^2)^{-1} \right]_{nn}$$

The resolvent $(z - D_\tau^2)^{-1}$ can be expanded in the gap basis. To leading order in $t$ (or large $z$), the diagonal matrix element receives contributions from paths that start and end at $n$. The dominant contribution comes from the on-site potential $V(d_n)$ and the adjacent hoppings $1/d_{n-1}, 1/d_n$. After tracing over the 256-dimensional Hilbert space (which contributes a factor of $\dim \mathcal{H} = 256$ for the trivial representation, modified by the chirality matrix $\gamma_5$ eigenvalues $\pm 1$), we obtain:

$$\mathcal{I}_n = \frac{1}{2} \cdot 256 \cdot \text{sign}\left( \frac{1}{d_n} + \frac{1}{d_{n-1}} - 2 V(d_n) \right) + \mathcal{O}(t)$$

Using the explicit form $V(d) = \alpha \log d$ derived from the prime number theorem density $\pi(x) \sim x/\log x$ (Article 2), the sign condition becomes:
$$\frac{1}{d_n} + \frac{1}{d_{n-1}} > 2\alpha \log d_n$$

For large $n$, $d_n \sim \log p_n$ on average, so $\log d_n \sim \log \log p_n$ grows extremely slowly. The left side is $\mathcal{O}(1/\log p_n)$, which decays. Thus the inequality is violated for typical gaps (giving $\mathcal{I}_n = -128$) but *satisfied* for record gaps where $d_n \gg \log p_n$ (giving $\mathcal{I}_n = +128$). The sum over $n$ yields:

$$\text{Index}(D_\tau) = \sum_{n=1}^N \mathcal{I}_n = 128 \sum_{n=1}^N \text{sign}\left(d_n - \langle d \rangle_{\text{local}}(n)\right) + \text{boundary terms}$$

The boundary terms from the IR (directory 0.0, $p \sim 10^6$) and UV (directory 3.0, $p \sim 10^{18}$) cancel exactly due to the Callan-Harvey anomaly inflow mechanism (A1-23). The factor 128 is half the Hilbert space dimension, reflecting the $\gamma_5$ eigenvalue split. The remaining sum is precisely the gap sign sum from Piece 02.

This heat kernel derivation provides the second independent route to the index theorem. It explicitly reveals the **local index density** $\mathcal{I}_n$ as a measurable quantity: it is $+128$ at record gap positions, $-128$ at anti-record positions, and $-128$ at typical gaps. The spatial distribution of $\mathcal{I}_n$ along the worldline is a diagnostic of the prime gap sequence topology.