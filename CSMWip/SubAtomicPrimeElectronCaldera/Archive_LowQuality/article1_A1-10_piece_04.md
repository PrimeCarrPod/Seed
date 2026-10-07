# A1-10: Worldline Segment Books — 3500 Books = 3500 Segments (Piece 04)

## 5. Worldline Segment Hamiltonian and Energy

### 5.1 Segment-Local Hamiltonian

From A1-17 (Worldline Hamiltonian), the full worldline Hamiltonian is:
$$
H = \frac{\hbar}{\kappa} \sum_{n=1}^{N_{\text{total}}} \frac{1}{d_n}
$$

The **segment Hamiltonian** for book $b$ is the restriction:
$$
H_b = \frac{\hbar}{\kappa} \sum_{n=(b-1)M+1}^{bM} \frac{1}{d_n}
$$

This is the **energy contribution** from segment $b$ to the total worldline action.

### 5.2 Segment Energy Spectrum

Define the **segment energy** $E_b = \langle H_b \rangle$ (expectation in the ground state). Using $d_n \sim \ln n$:
$$
E_b \approx \frac{\hbar}{\kappa} \cdot \frac{M}{\ln(bM)}
$$

In physical units, with $\kappa = \hbar/(m_e c^2)$:
$$
E_b \approx m_e c^2 \cdot \frac{M}{\ln(bM)}
$$

For $M = 2^{20} \approx 10^6$ and $b \sim 10^3$:
$$
E_b \sim 0.511 \text{ MeV} \times \frac{10^6}{13.8} \sim 37 \text{ GeV}
$$

Each book carries **~37 GeV of worldline energy** — comparable to electroweak scale!

### 5.3 Segment Zero-Point Energy

The **zero-point energy** of segment $b$ (from A1-31, A1-32 entanglement entropy):
$$
E_{0,b} = \frac{\hbar}{2} \omega_b, \quad \omega_b = \frac{2\pi}{\Delta\tau_b}
$$

Since $\Delta\tau_b = \kappa G_b$:
$$
E_{0,b} = \frac{\hbar}{2} \frac{2\pi}{\kappa G_b} = \frac{\pi m_e c^2}{G_b}
$$

For typical $G_b \sim M \ln(bM) \sim 1.4 \times 10^7$:
$$
E_{0,b} \sim \frac{\pi \times 0.511 \text{ MeV}}{1.4 \times 10^7} \sim 1.1 \times 10^{-7} \text{ eV}
$$

This is the **Casimir-like energy** of a finite worldline segment — extremely small but non-zero.

### 5.4 Segment Energy Conservation

Energy is conserved **locally per segment** in the Euclidean path integral formulation:
$$
\sum_b H_b = H_{\text{total}}
$$

In the Lorentzian formulation, energy flows between segments via the **transition gaps** $d_{bM}$. The continuity equation:
$$
\frac{dE_b}{d\tau} = J_{b \to b+1} - J_{b-1 \to b}
$$
where $J_{b \to b+1}$ is the energy current across the boundary at $p_{bM}$.

### 5.5 Segment Temperature (Thermal Interpretation)

From A1-33 (Modular Hamiltonian), each segment has an effective temperature:
$$
T_b = \frac{\hbar}{2\pi k_B} \frac{1}{\Delta\tau_b} = \frac{m_e c^2}{2\pi k_B} \frac{1}{G_b}
$$

For $G_b \sim 1.4 \times 10^7$:
$$
T_b \sim \frac{0.511 \text{ MeV}}{2\pi \times 1.4 \times 10^7} \sim 5.8 \times 10^{-9} \text{ MeV} \sim 0.07 \text{ K}
$$

**Each worldline segment is a thermal system at ~70 mK** — the electron's worldline has intrinsic thermal structure from finite segment size.