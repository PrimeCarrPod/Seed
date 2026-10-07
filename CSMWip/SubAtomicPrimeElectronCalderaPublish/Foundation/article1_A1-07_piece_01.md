# A1-07: Pair Creation and Annihilation — Forward/Backward Time as Electron/Positron

## 1. Introduction: The One-Electron Universe and Worldline Reversals

Wheeler's 1940 one-electron universe conjecture posits that all electrons and positrons are manifestations of a single worldline weaving through spacetime. In this framework, a positron is not a distinct particle but the same electron worldline traversed backward in time. The Prime Electron formulation grounds this topological insight in the arithmetic of prime gaps: each prime gap $d_n = p_{n+1} - p_n$ corresponds to a proper-time tick $\Delta\tau_n = \kappa d_n$ along the worldline, and the direction of traversal—forward or backward in proper time—distinguishes electron from positron.

The central thesis of this article is that **pair creation and annihilation events correspond precisely to worldline reversals**, where the single electron worldline folds back on itself in proper time. A reversal from forward to backward proper-time traversal appears in the laboratory frame as electron-positron pair creation ($e^- + e^+$ emerging from a photon); a reversal from backward to forward appears as annihilation ($e^- + e^+ \to \gamma\gamma$). The prime gap sequence $\{d_n\}$ encodes these reversals through specific topological signatures in the gap distribution.

## 2. Proper Time Orientation and the Arrow of Charge

Let the worldline be parameterized by proper time $\tau$, with the mapping to prime index $n$ given by:

$$
\tau(n) = \kappa \sum_{k=1}^{n-1} d_k, \qquad \kappa = \frac{\hbar}{m_e c^2} \approx 1.288 \times 10^{-21}\ \text{s}
$$

The **proper time orientation** at step $n$ is defined by the sign of the proper time derivative:

$$
\sigma_n = \text{sign}\left( \frac{d\tau}{dn} \right) = \text{sign}(d_n)
$$

Since all prime gaps $d_n \geq 2$ are positive, the orientation $\sigma_n = +1$ for forward traversal (electron) and $\sigma_n = -1$ for backward traversal (positron). A **worldline reversal** occurs at index $n$ where the orientation flips:

$$
\sigma_n \neq \sigma_{n-1} \quad \Longleftrightarrow \quad \text{pair creation/annihilation event}
$$

The charge of the particle manifestation is then:

$$
q_n = -e \cdot \sigma_n = \begin{cases} -e & \text{(electron, forward in $\tau$)} \\ +e & \text{(positron, backward in $\tau$)} \end{cases}
$$

This recovers the Feynman-Stueckelberg interpretation: the positron is an electron moving backward in proper time, carrying opposite charge.