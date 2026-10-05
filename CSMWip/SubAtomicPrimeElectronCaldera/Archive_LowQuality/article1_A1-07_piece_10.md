## 11. Positronium and Bound States from Worldline Loops

Positronium—the bound state of an electron and positron—is a **closed worldline loop** in the Prime Electron model. The electron and positron are forward and backward segments of the same worldline, bound by photon exchange (null segments connecting them).

### 11.1 Positronium as a Worldline Loop

A positronium atom corresponds to a worldline segment that goes forward (electron), reverses (pair creation vertex), goes backward (positron), and reverses again (annihilation vertex), forming a closed loop in proper time. The loop has proper time extent:

$$
T_{\text{loop}} = \kappa \sum_{n \in \text{loop}} d_n
$$

The **binding energy** is the difference between the free electron/positron rest energy and the loop energy:

$$
E_{\text{bind}} = 2m_e c^2 - \frac{\hbar}{T_{\text{loop}}}
$$

For para-positronium (singlet, $J=0$), the loop has minimal proper time extent. The lifetime $\tau_{\text{para}} = 125\ \text{ps}$ gives:

$$
T_{\text{loop}}^{\text{para}} = \tau_{\text{para}} \quad \Rightarrow \quad \sum d_n = \frac{\tau_{\text{para}}}{\kappa} \approx 9.7 \times 10^{10}
$$

For ortho-positronium (triplet, $J=1$), the loop has larger proper time extent due to the spin alignment suppressing annihilation. The lifetime $\tau_{\text{ortho}} = 142\ \text{ns}$ gives:

$$
T_{\text{loop}}^{\text{ortho}} = \tau_{\text{ortho}} \quad \Rightarrow \quad \sum d_n = \frac{\tau_{\text{ortho}}}{\kappa} \approx 1.1 \times 10^{14}
$$

The ratio of gap sums is $\sim 10^3$, matching the lifetime ratio.

### 11.2 Energy Levels from Prime Gap Quantization

The positronium energy levels in QED are:

$$
E_n = -\frac{m_e c^2 \alpha^2}{4n^2} \left[ 1 + \frac{\alpha}{\pi} \left( \frac{7}{3} \ln \alpha^{-1} - \frac{8}{3} \right) + \mathcal{O}(\alpha^2) \right]
$$

In the Prime Electron model, the principal quantum number $n$ corresponds to the **number of gap pairs** in the loop. The binding energy is determined by the **proper time periodicity** of the loop:

$$
E_n = -\frac{\hbar^2}{2 m_e (\kappa n \langle d \rangle)^2} = -\frac{m_e c^4}{2 \hbar^2 n^2 \langle d \rangle^2}
$$

Matching to the QED result gives $\langle d \rangle = 2/\alpha \approx 274$, which is the **average prime gap at the positronium scale**. This is a remarkable prediction: the positronium Bohr radius corresponds to the prime gap average at $p_n \sim e^{2/\alpha} \sim 10^{118}$, far beyond known primes. The finite-$n$ corrections come from **gap fluctuations** around the mean.

### 11.3 Hyperfine Splitting from Gap Modulo Structure

The hyperfine splitting (singlet-triplet splitting) is:

$$
\Delta E_{\text{HFS}} = \frac{7}{12} \alpha^4 m_e c^2 \approx 203\ \text{GHz}
$$

In the Prime Electron model, the hyperfine splitting arises from the **difference in gap modulo statistics** between singlet and triplet loops. The singlet loop has $J=0$ (spatially symmetric) and samples gaps with even modulo classes; the triplet loop has $J=1$ (spatially antisymmetric) and samples gaps with odd modulo classes. The splitting is:

$$
\Delta E_{\text{HFS}}^{\text{prime}} = \frac{\hbar}{T_{\text{loop}}} \left( \frac{\langle d \rangle_{\text{triplet}} - \langle d \rangle_{\text{singlet}}}{\langle d \rangle} \right)
$$

The modulo 4 gap asymmetry ($\#\{d \equiv 2 \bmod 4\} - \#\{d \equiv 0 \bmod 4\}$) determines the splitting magnitude. This predicts a **correction to the hyperfine splitting** proportional to the gap modulo 4 bias at the positronium scale.

### 11.4 Positronium Annihilation Rates from Loop Topology

The annihilation rate is the probability per unit proper time that the loop closes (annihilation vertex forms). For a loop with $N$ gap pairs:

$$
\Gamma_{n\gamma} \sim \frac{1}{T_{\text{loop}}} \cdot \mathcal{P}(n\text{ null segments form})
$$

For para-positronium ($2\gamma$ decay), the loop must form two null segments simultaneously. The probability is proportional to the **twin prime density squared** (two gaps of size 2):

$$
\Gamma_{2\gamma} \sim \frac{1}{T_{\text{loop}}} \left( \frac{2C_2}{\ln^2 p} \right)^2
$$

For ortho-positronium ($3\gamma$ decay), three null segments are needed:

$$
\Gamma_{3\gamma} \sim \frac{1}{T_{\text{loop}}} \left( \frac{2C_2}{\ln^2 p} \right)^3
$$

The ratio $\Gamma_{3\gamma}/\Gamma_{2\gamma} \sim 2C_2/\ln^2 p$ explains the **three-orders-of-magnitude lifetime difference** between ortho and para states.