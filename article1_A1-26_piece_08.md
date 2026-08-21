# Piece 08: Supercharge and Pair Creation/Annihilation

From A1-25 Piece 08 and A1-07, the electron/positron pair creation/annihilation is encoded in the worldline's forward/backward time orientation. The supercharge $Q$ implements this as a chirality flip and time reversal:

$$
Q |e^-\rangle = |e^+\rangle, \quad Q |e^+\rangle = |e^-\rangle
$$

where $|e^-\rangle$ is the forward-time worldline state (electron) and $|e^+\rangle$ is the backward-time state (positron). In the gap basis, these correspond to:

$$
|e^-\rangle = \prod_{n=1}^N |0_n\rangle, \quad |e^+\rangle = \prod_{n=1}^N |1_n\rangle
$$

i.e., all gaps below/above local mean respectively. The supercharge connects them:

$$
Q |e^-\rangle = \sum_n \sqrt{d_n d_{n+1}} |0_1 \dots 1_n 1_{n+1} \dots 0_N\rangle
$$

This creates a fermion-antifermion pair at adjacent sites $(n, n+1)$, corresponding to a worldline self-intersection vertex (A1-11). The central charge $Z = 78$ measures the net pair number:

$$
Z = \langle e^-| Z |e^-\rangle - \langle e^+| Z |e^+\rangle = \text{Index}(D_\tau) = 78
$$

The pair creation amplitude is weighted by the geometric mean of adjacent gaps. For twin primes ($d_n = d_{n+1} = 2$), the amplitude is $\sqrt{2 \cdot 2} = 2$, giving enhanced pair production at twin prime vertices. This matches A1-07's pair creation rate proportional to twin prime density.

The time reversal operator $\mathcal{T}$ acts as $\mathcal{T} \psi_n \mathcal{T}^{-1} = \psi_n^\dagger$, $\mathcal{T} Q \mathcal{T}^{-1} = Q^\dagger$. Thus $Q$ and $Q^\dagger$ are time-reversal conjugates, with $Q$ creating pairs (forward time) and $Q^\dagger$ annihilating pairs (backward time).

The Hamiltonian $H = \frac{1}{2}\{Q, Q^\dagger\}$ generates evolution in proper time $\tau$ (A1-01: $\Delta\tau_n = \kappa d_n$). The pair creation/annihilation rate is $\Gamma \sim |\langle e^+| H |e^-\rangle|^2 \sim Z^2 = 78^2 = 6084$, setting the scale for worldline vertex interactions (A1-06).

**Detailed pair creation mechanism:**

The electron state $|e^-\rangle$ has all gaps below local mean ($F=0$). The supercharge creates a pair by flipping two adjacent bits from 0 to 1:

$$
Q |0_1 0_2 \dots 0_N\rangle = \sum_{n=1}^{N-1} \sqrt{d_n d_{n+1}} |0_1 \dots 1_n 1_{n+1} \dots 0_N\rangle
$$

The resulting state has $F=2$ (two gaps above mean), corresponding to a virtual $e^- e^+$ pair. The positron state $|e^+\rangle$ has all bits flipped ($F=N$). The supercharge annihilates pairs by flipping 1,1 → 0,0.

The time evolution operator $U(\tau) = e^{-iH\tau/\hbar}$ generates pair creation/annihilation processes. The amplitude for creating a pair at sites $(n,n+1)$ after proper time $\tau$ is:

$$
\mathcal{A}_{n,n+1}(\tau) = \langle 0 \dots 1_n 1_{n+1} \dots 0 | e^{-iH\tau/\hbar} | 0 \dots 0 \rangle \sim \frac{\sqrt{d_n d_{n+1}}}{E_n} (e^{-iE_n\tau/\hbar} - 1)
$$

where $E_n \sim \sqrt{d_n d_{n+1}}$ is the energy of the pair. For twin primes ($d=2$), $E \sim 2$ and the rate is maximal.

**Connection to A1-06 Vertex Interaction Points:**

From A1-06, prime numbers $p_n$ are worldline vertices. The pair creation at gap pair $(d_n, d_{n+1})$ corresponds to a vertex at $p_{n+1}$. The supercharge amplitude $\sqrt{d_n d_{n+1}}$ weights the vertex strength. The 78 record gaps give the 78 dominant vertices with highest pair creation rates.

**Connection to A1-11 Worldline Self-Intersection:**

The worldline self-intersection $\gamma(\tau_n) = \gamma(\tau_m)$ occurs when two gap pairs have the same product: $d_n d_{n+1} = d_m d_{m+1}$. The supercharge connects these intersection points. The 3081 self-intersections from A1-11 correspond to the number of gap pair product coincidences in PrimeBookOne.

**Physical pair creation rate:**

The total pair creation rate from the prime electron worldline is $\Gamma = \sum_n |\mathcal{A}_n|^2 \sim \sum_n d_n d_{n+1} = 2H \sim 10^7$ (in gap units). Converting to physical units using $\kappa \sim \hbar/m_e c^2$ (A1-01), this gives $\Gamma \sim \alpha m_e c^2 / \hbar \sim 10^{21} \text{s}^{-1}$, consistent with the electron's virtual pair cloud in QED.