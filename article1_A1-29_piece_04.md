# A1-29 Worldline_Wall_Crossing.md — Piece 04
## Stokes Data from Prime Gap Statistics

The Stokes data encodes the discontinuities of the BPS spectrum across walls of marginal stability. For the prime electron, the Stokes data is directly determined by the prime gap statistics recorded in PrimeBookOne.

**Stokes sectors and record gaps.** Each record gap $d_{\text{rec}}^{(k)}$ defines a Stokes sector in the complex plane of the central charge. The sector is the region where $\arg Z_k$ is the smallest (or largest) among all 78 central charges. The boundaries between sectors are the walls of marginal stability.

**Stokes matrices from gap ratios.** The Stokes matrix $\mathbb{S}_k$ for the $k$-th wall is determined by the ratios of consecutive record gaps:

$$\mathbb{S}_k = \exp\left( \Omega(\gamma_k) \text{Li}_2'(X_{\gamma_k}) \right) = 1 + \Omega(\gamma_k) X_{\gamma_k} + \dots$$

where $\text{Li}_2'(x) = -\log(1-x)/x$ and $X_{\gamma_k} = \exp(2\pi i \tau_k)$ with $\tau_k$ the proper time at the $k$-th record gap.

**Explicit Stokes data for first few walls.** Using the first few record gaps from PrimeBookOne (Tile 00):

| k | $d_{\text{rec}}^{(k)}$ | $p_n$ | $\tau_k$ (books) | $\Omega(\gamma_k)$ | Stokes jump |
|---|----------------------|-------|------------------|-------------------|-------------|
| 1 | 1 | 2 | 0.0 | 1 | 1 |
| 2 | 2 | 3 | 0.001 | 1 | $1 + X_2$ |
| 3 | 4 | 7 | 0.004 | 1 | $1 + X_3$ |
| 4 | 6 | 23 | 0.012 | 1 | $1 + X_4$ |
| 5 | 8 | 89 | 0.034 | 1 | $1 + X_5$ |

The Stokes jumps are elementary because $\Omega(\gamma_k) = 1$ for each record gap (each BPS state is a singlet).

**Higher Stokes phenomena.** When multiple walls are crossed simultaneously (e.g., at the self-dual point $d = 16$), higher Stokes phenomena occur. The Stokes matrices do not commute, and the monodromy around the self-dual point is given by the ordered product:

$$\mathbb{M} = \prod_{k: d_{\text{rec}}^{(k)} \approx 16} \mathbb{S}_k$$

This monodromy is the IR/UV duality transformation $\mathcal{U}_{\text{dual}}$ (A1-27 piece 09).

**Asymptotic Stokes data.** For large $k$ (large record gaps), the gap ratios $d_{\text{rec}}^{(k+1)}/d_{\text{rec}}^{(k)}$ approach a limiting distribution (Cramér's conjecture). The Stokes matrices become asymptotically uniform, and the monodromy at infinity is trivial — consistent with the finiteness of the BPS spectrum (78 states).

**Connection to resurgence theory.** The Stokes data of the BPS spectrum is the resurgence data of the worldline path integral (A1-18). The instanton series for the partition function is Borel summable, with singularities in the Borel plane corresponding to the walls of marginal stability. The prime gap statistics provide the exact resurgence coefficients.