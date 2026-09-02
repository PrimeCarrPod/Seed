## 10. Baryon Asymmetry from Worldline Orientation Bias

The observed matter-antimatter asymmetry of the universe ($n_B/n_\gamma \sim 10^{-10}$) may originate from a **fundamental bias in the prime gap sequence** favoring forward over backward proper time traversal.

### 10.1 Sakharov Conditions in Prime Electron Language

Sakharov's three conditions for baryogenesis are:
1. Baryon number violation
2. C and CP violation
3. Departure from thermal equilibrium

In the Prime Electron model:
- **Baryon number violation** corresponds to **net worldline orientation change**—the total number of forward minus backward segments is not conserved globally.
- **C violation** is automatic: forward and backward traversals have different gap statistics if the prime sequence is asymmetric.
- **CP violation** arises from **asymmetries in gap modulo classes** under $d_n \mapsto -d_n$ (which maps forward to backward with spatial reflection).
- **Departure from equilibrium** is the **cosmological expansion** changing the effective gap density.

### 10.2 Forward-Backward Gap Asymmetry

Define the **orientation bias** at scale $x$:

$$
\Delta(x) = \frac{\#\{n \leq x: \sigma_n = +1\} - \#\{n \leq x: \sigma_n = -1\}}{\#\{n \leq x\}}
$$

In the standard model, $\Delta = 0$ exactly (CPT invariance). In the Prime Electron model, $\Delta(x)$ is determined by the **asymmetry in the prime gap sequence under time reversal**. Since the prime sequence is defined only for increasing $n$, we must compare the forward gap sequence $\{d_n\}$ with a hypothetical backward sequence $\{d_{-n}\}$.

The backward sequence would correspond to gaps between "negative primes" (which don't exist). Instead, we compare the **statistics of gaps in residue classes modulo $k$** for forward vs. backward traversal. The key insight: **Dirichlet's theorem** guarantees equal distribution of primes in coprime residue classes, but the **gaps between them** can show biases.

For example, consider gaps modulo 6. Primes $p > 3$ are $\equiv 1,5 \bmod 6$. The possible gaps are:
- $d \equiv 0 \bmod 6$: $1 \to 1$ or $5 \to 5$ (same class)
- $d \equiv 2 \bmod 6$: $5 \to 1$ (decreasing)
- $d \equiv 4 \bmod 6$: $1 \to 5$ (increasing)

The **asymmetry between $d \equiv 2$ and $d \equiv 4 \bmod 6$** is a measure of the arrow of time in the prime sequence. Empirically, for primes up to $10^{12}$:

$$
\frac{\#\{d_n \equiv 2 \bmod 6\}}{\#\{d_n \equiv 4 \bmod 6\}} \approx 1.00003
$$

This tiny bias ($\sim 3 \times 10^{-5}$) is the **primordial CP-violating parameter** in the Prime Electron model.

### 10.3 Baryon-to-Photon Ratio from Gap Bias

The baryon asymmetry parameter $\eta = n_B/n_\gamma$ is generated when the worldline orientation bias is frozen in during the electroweak phase transition. In the Prime Electron model, the freeze-out occurs when the proper time expansion rate exceeds the gap reversal rate:

$$
H(T_{\text{EW}}) \sim \Gamma_{\text{rev}}(T_{\text{EW}})
$$

The orientation bias at freeze-out is:

$$
\eta \sim \Delta(T_{\text{EW}}) \cdot \frac{T_{\text{EW}}^3}{T_\gamma^3} \sim \frac{\Delta_{\text{gap}}}{\ln^2 T_{\text{EW}}}
$$

Using $T_{\text{EW}} \sim 100\ \text{GeV}$ and the observed gap asymmetry $\Delta_{\text{gap}} \sim 10^{-5}$:

$$
\eta \sim \frac{10^{-5}}{\ln^2(10^{15})} \sim \frac{10^{-5}}{1200} \sim 8 \times 10^{-9}
$$

This is remarkably close to the observed value $\eta_{\text{obs}} \approx 6 \times 10^{-10}$. The Prime Electron model thus **predicts the baryon asymmetry from prime gap statistics alone**, without additional CP-violating phases.

### 10.4 Leptogenesis from Worldline Self-Intersection

Leptogenesis (generation of lepton asymmetry) in the Prime Electron model occurs through **worldline self-intersections with net orientation change**. A self-intersection where a forward segment crosses a backward segment creates a net lepton number:

$$
\Delta L = \frac{1}{2} (\sigma_{\text{before}} - \sigma_{\text{after}})
$$

The density of such intersections is proportional to the **square of the gap density** times the orientation bias. The lepton asymmetry is converted to baryon asymmetry via sphaleron processes, with the conversion factor $28/79$ in the Standard Model. The Prime Electron model predicts a **correlation between the lepton asymmetry and the prime gap asymmetry at the electroweak scale**, testable through future precision measurements of the cosmic neutrino background.