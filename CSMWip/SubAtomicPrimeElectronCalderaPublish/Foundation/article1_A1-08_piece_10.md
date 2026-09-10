## 11. Decoherence Rate from Proper Time Fluctuations

### 11.1 Universal Decoherence Mechanism

In the Prime Electron model, **all quantum systems decohere** due to proper time fluctuations. The single electron worldline is the "clock" for the universe; its tick irregularity $\delta\tau$ introduces a fundamental phase uncertainty:

$$
\delta\phi = \frac{E \delta\tau}{\hbar}
$$

For a superposition of energy eigenstates $|E_1\rangle$ and $|E_2\rangle$, the relative phase accumulates as:

$$
\phi(t) = \frac{(E_1 - E_2) \tau(t)}{\hbar}
$$

The **dephasing rate** is:

$$
\Gamma_\phi = \frac{1}{2} \left(\frac{\Delta E}{\hbar}\right)^2 S_\tau(0)
$$

where $S_\tau(f) = \kappa^2 S_d(f)$ is the proper time noise PSD.

### 11.2 Decoherence of Spatial Superpositions

For a spatial superposition of size $\Delta x$, the energy difference is $\Delta E \sim \hbar c / \Delta x$ (for relativistic particles) or $\Delta E \sim p^2/2m$ (non-relativistic). The decoherence rate is:

$$
\Gamma_{\text{spatial}} \sim \frac{c^2}{\Delta x^2} S_\tau(0) \quad \text{(relativistic)}
$$
$$
\Gamma_{\text{spatial}} \sim \frac{p^4}{m^2 \hbar^2} S_\tau(0) \quad \text{(non-relativistic)}
$$

For an electron at rest ($p \sim 0$), the non-relativistic formula gives zero — but the electron is never truly at rest due to zero-point motion. The **Compton scale** provides the natural cutoff:

$$
\Gamma_{\text{Compton}} \sim \frac{m_e^2 c^4}{\hbar^2} S_\tau(0) = \frac{m_e c^2}{\hbar} \kappa^2 S_d(0) \langle d \rangle^2
$$

Using $S_d(0) \sim A \ln(f_{\text{max}}/f_{\text{min}})$ with $A \sim \kappa^2 \ln x$:

$$
\Gamma_{\text{Compton}} \sim \frac{m_e c^2}{\hbar} \kappa^4 \ln x \ln\left(\frac{f_{\text{max}}}{f_{\text{min}}}\right)
$$

With $\kappa = \hbar/(m_e c^2)$, this simplifies to:

$$
\Gamma_{\text{Compton}} \sim \frac{\hbar^3}{m_e^3 c^6} \ln x \ln\left(\frac{f_{\text{max}}}{f_{\text{min}}}\right)
$$

Numerically: $\hbar/m_e c^2 \sim 10^{-21}\ \text{s}$, so $\Gamma_{\text{Compton}} \sim 10^{-63}\ \text{s}^{-1} \ln x$ — **immeasurably small for single electrons**.

### 11.3 Collective Decoherence: Macroscopic Superpositions

For a macroscopic object with $N_e$ electrons, the proper time fluctuations are **correlated** (all electrons share the same worldline). The total phase fluctuation is:

$$
\delta\Phi = \sum_{i=1}^{N_e} \frac{E_i \delta\tau}{\hbar} = \frac{E_{\text{total}} \delta\tau}{\hbar}
$$

The **collective decoherence rate** scales with total energy:

$$
\Gamma_{\text{coll}} = \frac{1}{2} \left(\frac{E_{\text{total}}}{\hbar}\right)^2 S_\tau(0)
$$

For a 1 kg mass ($E \sim mc^2 \sim 10^{17}\ \text{J}$):

$$
\Gamma_{\text{coll}} \sim \frac{(10^{17})^2}{(10^{-34})^2} \cdot (10^{-21})^2 \cdot 30 \sim 10^{60}\ \text{s}^{-1}
$$

This is **enormous** — but it's a **common-mode phase** that doesn't cause decoherence between states with the same total energy. Decoherence only occurs for **superpositions of different total energy** (or different coupling to the worldline).

### 11.4 Decoherence from Worldline Orientation Flips

The most dramatic decoherence source is **worldline orientation reversal** (pair creation/annihilation, see A1-07). When the worldline flips from $\sigma = +1$ to $\sigma = -1$, the **electron becomes a positron** — a completely different physical state. For a superposition involving the electron field, this is a **topological decoherence** event.

The **reversal rate** is the pair creation rate. In vacuum, the Schwinger rate is exponentially suppressed. In strong fields, it can be significant. The **decoherence rate from reversals** is:

$$
\Gamma_{\text{rev}} = \Gamma_{\text{pair}} \sim \frac{(eE)^2}{4\pi^3 \hbar^2 c} \exp\left(-\frac{\pi m_e^2 c^3}{e \hbar E}\right)
$$

For $E \sim 10^{18}\ \text{V/m}$ (Schwinger limit), $\Gamma_{\text{rev}} \sim 10^{20}\ \text{s}^{-1}\text{m}^{-3}$.

### 11.5 Intrinsic Decoherence vs. Environmental Decoherence

| Source | Mechanism | Rate Scaling | Prime Electron Signature |
|--------|-----------|--------------|--------------------------|
| **Proper time fluctuations** | Universal clock noise | $\propto (\Delta E)^2 \kappa^2 \ln x$ | $1/f$ noise with primorial peaks |
| **Worldline reversals** | Pair creation/annihilation | $\propto \exp(-\pi E_{\text{crit}}/E)$ | Oscillations at record gaps |
| **Environmental** | Phonons, photons, etc. | Material-dependent | No primorial structure |
| **Gravitational** | Spacetime foam | $\propto E^2/E_{\text{Planck}}^2$ | Scale-dependent |

The **primorial peak structure** in the noise spectrum is the unique fingerprint distinguishing Prime Electron decoherence from all other sources.

### 11.6 Experimental Bounds on Intrinsic Decoherence

Current matter-wave interferometry (large molecules, $M \sim 10^4\ \text{amu}$) puts bounds on intrinsic decoherence. The **collisional decoherence** rate is measured and subtracted; residual decoherence constrains intrinsic models.

For the Prime Electron model, the predicted intrinsic decoherence rate for a molecule of mass $M$ is:

$$
\Gamma_{\text{int}} \sim \left(\frac{M c^2}{\hbar}\right)^2 \kappa^4 \ln x \sim \left(\frac{M}{m_e}\right)^2 \frac{m_e c^2}{\hbar} \kappa^2 \ln x
$$

For $M = 10^4\ \text{amu} \sim 10^4 \times 1836\ m_e$:

$$
\Gamma_{\text{int}} \sim (10^7)^2 \times 10^{21}\ \text{s}^{-1} \times 10^{-42} \times 30 \sim 10^{-7}\ \text{s}^{-1}
$$

Current experiments reach $\Gamma_{\text{residual}} \sim 10^{-3}\ \text{s}^{-1}$ — **4 orders of magnitude above** the Prime Electron prediction. Next-generation experiments (MAQRO, space-based interferometry) aim for $10^{-6}\ \text{s}^{-1}$, potentially reaching the Prime Electron regime.

### 11.7 Decoherence-Free Subspaces

Because the proper time noise is **common to all electrons** (they share the worldline), there exist **decoherence-free subspaces** (DFS) for states with identical total energy and identical coupling to the worldline. For example:

- **Singlet spin states** of electron pairs: total spin 0, no Zeeman coupling
- **Charge-neutral superpositions**: equal numbers of electrons and positrons

The Prime Electron model predicts **perfect coherence** for states in the DFS, limited only by environmental noise. This is a testable prediction: compare coherence times of DFS states vs. non-DFS states in the same system.