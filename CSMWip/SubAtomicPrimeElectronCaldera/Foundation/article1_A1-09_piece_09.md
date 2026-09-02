## 10. Worldline Steps to Cosmic Time: The Conversion Map

### 10.1 From Prime Index to Cosmic Time

The **conversion map** from prime index $n$ to cosmic time $t$ is:

$$
t(n) = \tau(n) = \kappa (p_n - 2) \approx \kappa n \ln n
$$

The **inverse map** (cosmic time to prime index) is:

$$
n(t) \approx \frac{t/\kappa}{\ln(t/\kappa)}
$$

### 10.2 Key Conversion Points

| Cosmic Event | Time $t$ | $t/\kappa$ | Prime Index $n$ | Prime $p_n$ | Directory |
|--------------|----------|------------|-----------------|-------------|-----------|
| Planck era | $5\times 10^{-44}\ \text{s}$ | $4\times 10^{-23}$ | — | — | — |
| GUT symmetry breaking | $10^{-36}\ \text{s}$ | $10^{-15}$ | $10^{14}$ | $10^{16}$ | 2.0 |
| Inflation end | $10^{-32}\ \text{s}$ | $10^{-11}$ | $10^{10}$ | $10^{11}$ | 1.0/2.0 |
| Electroweak transition | $10^{-12}\ \text{s}$ | $10^9$ | $10^8$ | $10^9$ | 1.0 |
| QCD transition | $10^{-5}\ \text{s}$ | $10^{16}$ | $10^{15}$ | $10^{16}$ | 1.0/2.0 |
| Nucleosynthesis | $10^2\ \text{s}$ | $10^{23}$ | $10^{21}$ | $10^{23}$ | 1.0 |
| Recombination | $10^{13}\ \text{s}$ | $10^{34}$ | $10^{32}$ | $10^{34}$ | 1.0/2.0 |
| **Now** | $4\times 10^{17}\ \text{s}$ | $3\times 10^{38}$ | $10^{36}$ | $3\times 10^{38}$ | 2.0 |
| PrimeBookOne 3.0 start | — | — | $10^{58}$ | $10^{60}$ | 3.0 |
| PrimeBookOne 3.0 end | — | — | $10^{58}+3.67\times 10^9$ | $10^{60}$ | 3.0 |

**Key finding**: The **"now" ($t \sim 10^{17}\ \text{s}$) corresponds to $n \sim 10^{36}$**, which is **between directories 1.0 and 2.0** in prime scale. The PrimeBookOne directory 3.0 samples the **far future** ($n \sim 10^{58}$), not the present.

### 10.3 The Sampling Rate Problem

The PrimeBookOne dataset samples the worldline at **specific scales**, not uniformly in time. The **sampling rate** (steps per cosmic time) varies:

- **Directory 0.0**: 94,500 steps over $\Delta t \sim 10^{-15}\ \text{s}$ → rate $\sim 10^{20}\ \text{steps/s}$
- **Directory 1.0**: 94,500 steps over $\Delta t \sim 10^{-15}\ \text{s}$ → rate $\sim 10^{20}\ \text{steps/s}$
- **Directory 2.0**: 94,500 steps over $\Delta t \sim 10^{-15}\ \text{s}$ → rate $\sim 10^{20}\ \text{steps/s}$
- **Directory 3.0**: 3.67B steps over $\Delta t \sim 10^{-9}\ \text{s}$ → rate $\sim 10^{18}\ \text{steps/s}$

The **early universe** is sampled at **higher rate per cosmic time** than the Planck scale! This is because the early universe directories cover tiny proper time intervals but with fixed step count.

### 10.4 Proper Time Per Step at Each Epoch

| Epoch | Mean Gap $\langle d \rangle$ | Proper Time/Step $\Delta\tau$ | Frequency $1/\Delta\tau$ |
|-------|------------------------------|------------------------------|---------------------------|
| Electroweak ($p\sim 10^3$) | $\sim 7$ | $9\times 10^{-21}\ \text{s}$ | $10^{20}\ \text{Hz}$ |
| Nucleosynthesis ($p\sim 10^{10}$) | $\sim 23$ | $3\times 10^{-20}\ \text{s}$ | $3\times 10^{19}\ \text{Hz}$ |
| Recombination ($p\sim 10^{30}$) | $\sim 69$ | $9\times 10^{-20}\ \text{s}$ | $10^{19}\ \text{Hz}$ |
| Now ($p\sim 10^{38}$) | $\sim 87$ | $1.1\times 10^{-19}\ \text{s}$ | $9\times 10^{18}\ \text{Hz}$ |
| Planck ($p\sim 10^{60}$) | $\sim 138$ | $1.8\times 10^{-19}\ \text{s}$ | $5\times 10^{18}\ \text{Hz}$ |

The **proper time per step grows logarithmically** with cosmic time. The **worldline "tick rate" slows down** as the universe expands.

### 10.5 Total Steps from Big Bang to Now

The **total number of worldline steps** from the Big Bang ($n=1$) to now ($n \sim 10^{36}$) is:

$$
N_{\text{total, now}} \approx 10^{36}
$$

The **PrimeBookOne dataset has $3.67 \times 10^9$ steps** — a tiny fraction ($3.67 \times 10^{-27}$) of the total history to now.

But the dataset samples **different epochs with different densities**. The **total steps sampled** across all directories:

- 0.0: 94,500
- 1.0: 94,500
- 2.0: 94,500
- 3.0: 3,670,016,000
- **Total**: $\approx 3.67 \times 10^9$

The **late universe / Planck scale** is massively oversampled.

### 10.6 Steps per Cosmic Decade

A "cosmic decade" is a factor of 10 in scale factor $a(t)$, or equivalently in prime $p$.

The **number of steps per decade** at scale $p$ is:

$$
\frac{dn}{d\ln p} = \frac{dn}{dp} \cdot p \approx \frac{p}{\ln p} \cdot \frac{1}{p} \cdot p = \frac{p}{\ln p}
$$

At $p \sim 10^{38}$ (now): $p/\ln p \sim 10^{38}/87 \sim 10^{36}$ steps per decade.

At $p \sim 10^{60}$ (Planck): $p/\ln p \sim 10^{60}/138 \sim 7 \times 10^{57}$ steps per decade.

The **dataset samples only a minuscule fraction** of each decade.

### 10.7 The "Steps to Compton Time" Revisited

We previously found: **2 steps** (gaps $d_1=1$, $d_2=2$) give 1 Compton time of accumulated proper time.

But the **proper time per step at early times** is $\sim \kappa \ln n$. For $n \sim 10$ (early primes), $\ln n \sim 2.3$, so $\Delta\tau \sim 2.3\kappa$.

The **first step** ($d_1 = 1$ between primes 2 and 3) gives exactly **1 Compton time**:
$$
\Delta\tau_1 = \kappa \times 1 = \kappa
$$

The **second step** ($d_2 = 2$ between 3 and 5) gives **2 Compton times**:
$$
\Delta\tau_2 = \kappa \times 2 = 2\kappa
$$

So the **accumulated proper time after step 2** is $3\kappa$.

The **first Compton time** is reached **at the very first step** (from prime 2 to 3). This is the **origin of the worldline** — the "birth" of the electron.

### 10.8 Conversion Table: Steps ↔ Time ↔ Energy

| Steps $n$ | Prime $p_n$ | Proper Time $\tau$ | Energy Scale $E$ | Cosmic Epoch |
|-----------|-------------|-------------------|------------------|--------------|
| 1 | 2 | 0 | $\infty$ | Birth |
| 2 | 3 | $\kappa$ | $m_e c^2$ | First Compton time |
| 10 | 29 | $\sim 30\kappa$ | $\sim 17\ \text{keV}$ | — |
| $10^3$ | $10^4$ | $\sim 10^4\kappa$ | $\sim 50\ \text{eV}$ | — |
| $10^6$ | $10^7$ | $\sim 10^7\kappa$ | $\sim 50\ \text{meV}$ | — |
| $10^9$ | $10^{10}$ | $\sim 10^{10}\kappa$ | $\sim 0.5\ \mu\text{eV}$ | — |
| $10^{12}$ | $10^{13}$ | $\sim 10^{13}\kappa$ | $\sim 0.5\ \text{neV}$ | — |
| $10^{15}$ | $10^{16}$ | $\sim 10^{16}\kappa$ | $\sim 0.5\ \text{peV}$ | GUT scale |
| $10^{36}$ | $10^{38}$ | $\sim 10^{38}\kappa$ | $\sim 10^{-22}\ \text{eV}$ | Now |
| $10^{58}$ | $10^{60}$ | $\sim 10^{60}\kappa$ | $\sim 10^{-44}\ \text{eV}$ | Planck |

The **energy scale** decreases as $1/\tau$ — the worldline "cools" as proper time accumulates.

### 10.9 Practical Use: Converting Observations to Prime Index

To test the Prime Electron model, we convert **observed cosmic times/energies** to **prime indices** and check gap statistics:

1. **Observation**: CMB temperature $T = 2.725\ \text{K}$ → energy $k_B T \approx 2.35 \times 10^{-4}\ \text{eV}$
2. **Convert to proper time**: $\tau = \hbar/E \approx 2.8 \times 10^{-12}\ \text{s}$
3. **Convert to Compton units**: $\tau/\kappa \approx 2.2 \times 10^9$
4. **Prime index**: $n \approx (\tau/\kappa)/\ln(\tau/\kappa) \approx 10^8$
5. **Check**: Gap statistics at $n \sim 10^8$ (directory 1.0) should match CMB fluctuations

This **observation → prime index → gap statistics** pipeline is the core methodology of the Prime Electron program.