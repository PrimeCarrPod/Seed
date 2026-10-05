# A1-10: Worldline Segment Books — 3500 Books = 3500 Segments (Piece 07)

## 8. Proper Time Fluctuations Within Segments

### 8.1 Segment Fluctuation Spectrum

From A1-08 (Proper Time Fluctuation Spectrum), the proper time fluctuation within segment $b$ is characterized by the **gap variance** $\sigma_b^2$. The fluctuation spectrum:
$$
P_b(\omega) = \sum_{n \in \text{book}_b} \delta(\omega - \Delta\tau_n) = \sum_{n \in \text{book}_b} \delta(\omega - \kappa d_n)
$$

This is a **discrete spectrum** with peaks at $\omega = 2\kappa, 4\kappa, 6\kappa, \dots$ (since all prime gaps are even except the first).

### 8.2 Fluctuation Moments

For segment $b$, the $k$-th moment of proper time fluctuations:
$$
\langle (\Delta\tau)^k \rangle_b = \frac{\kappa^k}{M} \sum_{n \in \text{book}_b} d_n^k
$$

The first few moments:
- **Mean:** $\langle \Delta\tau \rangle_b = \kappa \bar{d}_b$
- **Variance:** $\sigma_{\tau,b}^2 = \kappa^2 (\langle d^2 \rangle_b - \bar{d}_b^2)$
- **Skewness:** $\gamma_{1,b} = \frac{\langle (d - \bar{d}_b)^3 \rangle_b}{\sigma_b^3}$
- **Kurtosis:** $\gamma_{2,b} = \frac{\langle (d - \bar{d}_b)^4 \rangle_b}{\sigma_b^4} - 3$

### 8.3 Segment Fluctuation Statistics (Conjectured Values)

| Moment | Typical Value | Physical Meaning |
|--------|---------------|------------------|
| $\bar{d}_b$ | $13.8 + \ln b$ | Mean proper time step |
| $\sigma_b$ | $\sim 1.5 \bar{d}_b$ | Fluctuation amplitude |
| $\gamma_{1,b}$ | $\sim 2$ | Positive skew (large gaps) |
| $\gamma_{2,b}$ | $\sim 6$ | Heavy tails (record gaps) |

### 8.4 Fluctuation-Dissipation Within Segment

From A1-34 (Relative Entropy), the **fluctuation-dissipation relation** for segment $b$:
$$
\chi_b(\omega) = \frac{1}{k_B T_b} \frac{P_b(\omega)}{1 - e^{-\omega/(k_B T_b)}}
$$
where $\chi_b$ is the response function, $T_b$ is the segment temperature (Section 5.5).

This connects the **discrete prime gap spectrum** to **continuous dissipation** — the worldline segment behaves as a thermal bath for quantum fluctuations.

### 8.5 Inter-Segment Fluctuation Correlations

Fluctuations in segment $b$ correlate with segment $b'$:
$$
\langle \Delta\tau_n \Delta\tau_m \rangle = \kappa^2 \langle d_n d_m \rangle
$$
for $n \in \text{book}_b$, $m \in \text{book}_{b'}$.

For $|b - b'| = 1$ (adjacent segments):
$$
\langle \Delta\tau_n \Delta\tau_{n'} \rangle \sim \kappa^2 \ln|n - n'|
$$

For $|b - b'| \gg 1$:
$$
\langle \Delta\tau_n \Delta\tau_{n'} \rangle \sim \frac{\kappa^2}{|b - b'|^2}
$$

**Long-range correlations decay as power-law** — consistent with the critical entanglement in Section 6.

### 8.6 Segment Fluctuation and Cosmological Expansion

The **increase in mean gap** $\bar{d}_b$ with book index $b$ maps to **cosmological expansion** of proper time intervals:
$$
\frac{\Delta\tau_{b+1}}{\Delta\tau_b} \approx \frac{\ln(b+1)}{\ln b} \approx 1 + \frac{1}{b \ln b}
$$

Over 3500 books, the proper time step grows by factor:
$$
\frac{\bar{d}_{3500}}{\bar{d}_1} \approx \frac{\ln 3500}{\ln 1} \to \infty \text{ (formally)}
$$
Actually $\bar{d}_1 \sim \ln(2^{20}) \approx 13.8$, $\bar{d}_{3500} \sim \ln(3500 \times 2^{20}) \approx 22.1$ — **factor of ~1.6 growth**.

This **60% increase in proper time step** over the 3500 segments is the **primordial expansion** from IR to UV.