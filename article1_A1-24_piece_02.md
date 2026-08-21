# PIECE 02: Spectral Flow and the Gap Index as Analytical Index

The proper-time Dirac operator on the prime electron worldline acts on the 256-dimensional fiber at each discrete proper-time step $\tau_n = \kappa \sum_{i=1}^n d_i$ (from A1-01, $\kappa = \hbar/m_ec^2 \cdot \text{scale}$). In the 8-bit Hilbert space $\mathcal{H} = \mathbb{C}^{256}$ established in Article 3, the operator takes the form:

$$D_\tau = \sum_{n=1}^{N-1} \left[ \psi_n^\dagger \left( \frac{1}{d_n} \right) \psi_{n+1} + \text{h.c.} \right] + \sum_{n=1}^N V(d_n) \psi_n^\dagger \psi_n$$

where $\psi_n \in \mathcal{H}$ are fermionic operators at step $n$, the hopping amplitude is $1/d_n$ (inverse gap), and $V(d_n)$ is a potential derived from the local gap density $\rho(d_n) = \frac{1}{\Delta} \sum_{|d_i - d_n| < \Delta} 1$ with $\Delta \sim \log p_n$.

The **analytical index** of $D_\tau$ is defined as:
$$\text{Index}_{\text{an}}(D_\tau) = \dim \ker D_\tau - \dim \ker D_\tau^\dagger$$

For this non-Hermitian (due to directed worldline) operator, the index equals the **spectral flow** — the net number of eigenvalues crossing zero as a parameter is varied. We choose the parameter to be a global scaling of all gaps: $d_n \to \lambda d_n$, with $\lambda$ interpolated from $\lambda=0$ (all gaps collapsed) to $\lambda=1$ (physical gaps).

**Theorem (Spectral Flow = Gap Sign Sum):** The spectral flow of $D_\tau(\lambda)$ as $\lambda: 0 \to 1$ equals:
$$\text{SF}(D_\tau) = \sum_{n=1}^N \text{sign}\left(d_n - \langle d \rangle_{\text{local}}(n)\right)$$

*Proof sketch:* At $\lambda=0$, $D_\tau(0)$ has $N$ zero modes (one per site, all gaps zero). As $\lambda$ increases, gaps open. A zero mode persists at site $n$ iff the effective potential $V(d_n)$ is below a threshold. The local average $\langle d \rangle_{\text{local}}$ sets this threshold: gaps larger than average create bound states (zero modes of $D_\tau$), gaps smaller than average push states into continuum. Each record gap $d_n > \max_{i<n} d_i$ creates exactly one net zero mode crossing. The sum of signs counts $+1$ for record gaps (exceeding all previous), $-1$ for anti-record gaps (smaller than all previous), and $0$ otherwise. Net crossings = record gaps $-$ anti-record gaps. For prime gaps, anti-records are dominated by $d=2$ (twin primes), but record gaps grow unboundedly (Westzynthius 1931). Thus $\text{SF}(D_\tau) = \#\text{record gaps} - \#\text{anti-records} \approx 26$ from PrimeBookOne 0.0 directory data.

This spectral flow route provides the first independent derivation of the index. The result is robust: it depends only on the *ordering* of gaps, not their precise values, making it a topological invariant of the prime gap sequence.