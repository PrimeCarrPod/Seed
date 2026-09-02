## 10. Experimental Signatures: Quantum Noise Measurements

### 10.1 Proper Time Fluctuations as Fundamental Noise Source

In the Prime Electron model, the proper time fluctuation spectrum is a **fundamental noise floor** — not environmental, but intrinsic to the electron worldline itself. Any quantum system containing electrons (which is all matter) couples to this noise. The coupling is universal:

$$
H_{\text{int}} = \sum_{\text{electrons}} \lambda \mathcal{O}_i \Delta\tau(t)
$$

where $\mathcal{O}_i$ is an operator for the $i$-th electron (e.g., position, momentum, spin). The coupling constant $\lambda$ is determined by the electron's role in the worldline.

### 10.2 Qubit Dephasing from Proper Time Noise

For a superconducting qubit or trapped ion qubit, the proper time fluctuations cause **frequency noise**. The qubit Hamiltonian is:

$$
H = \frac{\hbar \omega_0}{2} \sigma_z + \frac{\hbar}{2} \delta\omega(t) \sigma_z
$$

where $\delta\omega(t) = \omega_0 \frac{\Delta\tau(t) - \langle \Delta\tau \rangle}{\langle \Delta\tau \rangle} = \omega_0 \frac{\delta d(t)}{\langle d \rangle}$.

The **dephasing rate** (pure dephasing, $T_\phi$) is:

$$
\frac{1}{T_\phi} = \frac{\omega_0^2}{2\langle d \rangle^2} \int_{-\infty}^\infty \langle \delta d(t) \delta d(0) \rangle dt = \frac{\omega_0^2}{2\langle d \rangle^2} S_d(0)
$$

For $1/f$ noise $S_d(f) \sim A/f$, the integral diverges logarithmically, giving:

$$
\frac{1}{T_\phi} \sim \frac{\omega_0^2 A}{2\langle d \rangle^2} \ln\left(\frac{f_{\text{max}}}{f_{\text{min}}}\right)
$$

The Prime Electron model predicts **$A \propto \kappa^2 \ln x$** and **discrete peaks at $f = 1/q$** (primorials).

### 10.3 Spin Echo and Dynamical Decoupling

Spin echo (Hahn echo) and CPMG sequences filter the noise spectrum. The filter function for CPMG with $N$ pulses is:

$$
F_N(f) = \frac{8}{\pi^2 f^2} \sin^4(\pi f \tau/2) \frac{\sin^2(N \pi f \tau)}{\sin^2(\pi f \tau)}
$$

The **echo decay** is:

$$
W_N(\tau) = \exp\left( -\frac{1}{\pi} \int_0^\infty S_d(f) F_N(f) df \right)
$$

For $1/f$ noise, $W_N(\tau) \sim \exp(-C \tau \ln \tau)$ for CPMG. The **primorial peaks** in $S_d(f)$ appear as **oscillations in $W_N(\tau)$** at times $\tau \sim q$ (primorials).

### 10.4 Optical Lattice Clocks and Proper Time Noise

Optical lattice clocks (e.g., $^{87}\text{Sr}$, $^{171}\text{Yb}$) have fractional frequency stability $\sigma_y(\tau) \sim 10^{-18}$ at $\tau \sim 1\ \text{s}$. The Prime Electron proper time noise contributes:

$$
\sigma_y^{\text{prime}}(\tau) \sim \frac{\kappa}{\langle d \rangle} \sqrt{\frac{\ln \tau}{\tau}}
$$

At $\tau = 1\ \text{s}$, $\kappa \sim 10^{-21}\ \text{s}$, $\langle d \rangle \sim 30$ (for $p \sim 10^{12}$):

$$
\sigma_y^{\text{prime}}(1\ \text{s}) \sim \frac{10^{-21}}{30} \cdot 1 \sim 3 \times 10^{-23}
$$

This is **below current clock noise floors** but within reach of next-generation clocks (nuclear clocks, highly charged ion clocks). The **primorial oscillations** would be the smoking gun.

### 10.5 Gravitational Wave Detectors and Proper Time Fluctuations

LIGO/Virgo/KAGRA measure differential arm length changes $\Delta L/L \sim 10^{-23}$. Proper time fluctuations affect the **light travel time** in the arms. The effective strain noise from proper time fluctuations is:

$$
h_{\text{prime}}(f) \sim \frac{c}{\omega_0} \frac{\kappa}{\langle d \rangle} \sqrt{S_d(f)}
$$

where $\omega_0$ is the laser frequency. This is a **common-mode noise** (affects both arms equally) but with **correlated spatial structure** from the worldline embedding.

The **primorial peaks** at $f = 1/q$ would appear as **narrow lines** in the strain spectrum. For $q=6$, $f = 1/6 \approx 0.167$ in units of the gap sampling rate. The sampling rate is the worldline parameter rate $dn/dt$, which is unknown but could be constrained.

### 10.6 Cosmic Microwave Background and Primordial Proper Time Noise

The CMB power spectrum $C_\ell$ is affected by proper time fluctuations during recombination. The **Sachs-Wolfe effect** gets a contribution from proper time noise:

$$
\frac{\Delta T}{T} \sim \frac{1}{3} \Phi + \delta\tau_{\text{rec}}
$$

where $\Phi$ is the gravitational potential and $\delta\tau_{\text{rec}}$ is the proper time fluctuation at recombination. The angular power spectrum contribution is:

$$
C_\ell^{\text{prime}} \sim \left(\frac{\kappa}{\langle d \rangle_{\text{rec}}}\right)^2 P_d(\ell)
$$

where $P_d(\ell)$ is the power spectrum of gap fluctuations at the recombination scale ($p \sim 10^{20}$, $\ln p \sim 46$). This predicts **small-scale modulations in $C_\ell$** correlated with primorial scales.

### 10.7 Table: Experimental Sensitivity to Prime Gap Noise

| Experiment | Current Sensitivity | Prime Gap Signal | Detection Prospects |
|------------|-------------------|------------------|---------------------|
| Superconducting qubits | $T_2 \sim 100\ \mu\text{s}$ | $1/T_\phi \sim 10^2\ \text{Hz}$ | Marginal (needs $T_2$ improvement) |
| Trapped ion qubits | $T_2 \sim 1\ \text{s}$ | $1/T_\phi \sim 10^{-2}\ \text{Hz}$ | Possible with dynamical decoupling |
| Optical lattice clocks | $\sigma_y \sim 10^{-18}$ | $\sigma_y^{\text{prime}} \sim 10^{-23}$ | Next-gen clocks (nuclear, HCI) |
| Gravitational wave (LIGO) | $h \sim 10^{-23}/\sqrt{\text{Hz}}$ | $h_{\text{prime}} \sim 10^{-30}$ | Not feasible (common mode) |
| CMB (Planck) | $\Delta C_\ell/C_\ell \sim 10^{-3}$ | $C_\ell^{\text{prime}}/C_\ell \sim 10^{-10}$ | Future CMB-S4/LiteBIRD |
| Matter interferometry | $\Delta\phi \sim 10^{-3}$ | $\Delta\phi_{\text{prime}} \sim 10^{-8}$ | Large-scale atom interferometers |

The **most promising near-term test** is **dynamical decoupling on trapped ion or superconducting qubits** with sufficient coherence to resolve the primorial oscillations.