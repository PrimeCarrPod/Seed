# A1-32 Worldline_Renyi_Entropies.md — Piece 04
## Full Hilbert Space Renyi Entropies — 256 Dimensions from Prime Gaps

The full worldline Hilbert space has dimension 256 (8-bit basis, A1-25). The Renyi entropies interpolate between the BPS sector and the full space depending on temperature and $n$.

**Full density matrix.** At finite temperature $\beta < \infty$, the thermal state is:

$$\rho = \frac{e^{-\beta H}}{Z(\beta)}, \quad H = \sum_i E_i |i\rangle\langle i|$$

with eigenvalues $p_i = e^{-\beta E_i}/Z$. The 256 eigenvalues split into:
- 78 BPS: $E_i = 0 \Rightarrow p_i = 1/Z$
- 176 non-BPS: $E_i > 0 \Rightarrow p_i = e^{-\beta E_i}/Z$
- 2 Goldstino: $E_i \sim 10^{-8} \Rightarrow p_i \approx e^{-10^{-8}\beta}/Z$

**Renyi entropy as function of n and β.** The full Renyi entropy is:

$$S_n(\beta) = \frac{1}{1-n} \log \left[ 78 \left(\frac{1}{Z}\right)^n + \sum_{\text{non-BPS}} \left(\frac{e^{-\beta E_i}}{Z}\right)^n + 2 \left(\frac{e^{-10^{-8}\beta}}{Z}\right)^n \right]$$

where $Z = 78 + \sum_{\text{non-BPS}} e^{-\beta E_i} + 2 e^{-10^{-8}\beta}$.

**Low temperature limit ($\beta \to \infty$).** Only BPS states survive:
$$S_n(\infty) = \log 78 \quad \text{for all } n$$

**High temperature limit ($\beta \to 0$).** All 256 states equally populated:
$$S_n(0) = \log 256 = 8 \log 2 \approx 5.545 \quad \text{for all } n$$

**Intermediate temperatures.** The Renyi entropy $S_n(\beta)$ shows a crossover from $\log 78$ to $\log 256$. The crossover temperature $T_c$ depends on $n$:
- For $n=2$ (collision entropy): $T_c \sim \min(E_{\text{non-BPS}})$
- For $n \to \infty$ (min-entropy): $T_c$ probes the largest gap in BPS sector
- For $n \to 0$ (max-entropy): $T_c$ probes the full 256-state space

**PrimeBookOne thermal ensemble.** Each book $b$ has its own gap sequence, hence its own $H(b)$ and $Z(b)$. The 3500 books give 3500 Renyi profiles $S_n(b, \beta)$. The physical chamber books show smooth $S_n(b, \beta)$ with no phase transitions $\Leftrightarrow$ RH.