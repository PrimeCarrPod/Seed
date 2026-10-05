# Document 4: RC Delay Physics and Transmission Line Theory
## Piece 6: Eye Diagram Analysis: Jitter Decomposition

---

### 4.6 Eye Diagram Analysis: Jitter Decomposition

The eye diagram is the primary visualization tool for high-speed link signal integrity. Jitter—the timing deviation of signal edges from ideal positions—determines the eye opening and bit error rate (BER). Decomposing jitter into its components enables root-cause analysis and targeted mitigation.

#### 4.6.1 Eye Diagram Fundamentals

**Construction**: Overlay many UI (unit intervals) of signal
- Persistence display: color = probability density
- Eye opening: region where logic levels are distinct
- Eye height: voltage margin at sampling instant
- Eye width: timing margin at crossing threshold

**Key metrics**:
- **Eye height** (V_eye): V_high - V_low at center
- **Eye width** (T_eye): time between 10% and 90% crossings
- **Eye area**: integral of opening
- **Q-factor**: (μ₁ - μ₀)/(σ₁ + σ₀) for logic levels
- **BER**: ½ erfc(Q/√2)

**Ideal eye**: Rectangular opening
**Real eye**: Closed by noise, jitter, ISI

#### 4.6.2 Jitter Taxonomy

**Total Jitter (TJ)** at BER = 10⁻¹²:
TJ = DJ + RJ

**Deterministic Jitter (DJ)**:
- Bounded, specific causes
- Data-dependent: DDJ (ISI, DCD)
- Uncorrelated: BUJ (crosstalk, EMI, PSU noise)
- Periodic: PJ (PLL spurs, clock feedthrough)

**Random Jitter (RJ)**:
- Unbounded, Gaussian
- Thermal noise, shot noise, oscillator phase noise
- Characterized by σ_RJ (RMS)

**Composite jitter PDF**:
PDF_TJ = PDF_DJ * PDF_RJ (convolution)

#### 4.6.3 Random Jitter (RJ)

**Sources**:
- Thermal noise: kT/C, kT/R
- Shot noise: √(2qIΔf)
- Flicker noise (1/f): upconverted in oscillators
- VCO phase noise: ℒ(f) = ½ S_φ(f)

**RJ model**:
Gaussian distribution: σ_RJ
TJ contribution at BER: TJ_RJ = Q_BER × σ_RJ
For BER=10⁻¹²: Q = 7.0 → TJ_RJ = 7 σ_RJ

**Measurement**:
- Long capture on oscilloscope
- Histogram of edge crossings
- Tail fit to Gaussian (extrapolate)

#### 4.6.4 Deterministic Jitter - Data-Dependent (DDJ)

**Inter-Symbol Interference (ISI)**:
- Channel memory: previous bits affect current
- Bandwidth limitation: low-pass filtering
- Lossy line: frequency-dependent attenuation

**ISI jitter**:
Δt_ISI = (V_ISI) / (dV/dt)_crossing
V_ISI = Σ h_k a_{n-k} (channel pulse response)

**Duty Cycle Distortion (DCD)**:
- Rising vs. falling edge asymmetry
- Driver imbalance, different slew rates
- Even-order harmonics

**DDJ measurement**:
- Dual-Dirac model: DDJ = Δμ (separation of two Dirac deltas)
- Tail-fit method: fit Gaussian to tails, remainder is DJ

#### 4.6.5 Deterministic Jitter - Uncorrelated (BUJ)

**Bounded Uncorrelated Jitter**:
- Crosstalk (NEXT, FEXT)
- Power supply noise (PSN)
- Electromagnetic interference (EMI)
- Substrate noise

**Characteristics**:
- Bounded (unlike RJ)
- Uncorrelated with data pattern
- Can be periodic or random-like

**Modeling**:
- Crosstalk: known aggressor patterns → deterministic
- PSN: spectrum analysis → identify frequencies
- EMI: near-field probes → source identification

#### 4.6.6 Periodic Jitter (PJ)

**Sources**:
- PLL reference spurs
- Clock feedthrough
- Switching regulator ripple
- SSC (spread spectrum clocking)

**Model**:
PJ = Σ A_i sin(2πf_i t + φ_i)

**Measurement**:
- Spectrum of jitter (TIE spectrum)
- Peaks at f_i with amplitude A_i
- Total PJ = Σ A_i (peak-to-peak)

**Impact on eye**:
- Modulates eye crossing points
- Creates "shoulders" on eye diagram

#### 4.6.7 Jitter Decomposition Methods

**1. Tail-fit method (industry standard)**:
- Fit Gaussian to distribution tails
- Mean = σ_RJ
- Remainder = DJ
- Assumes RJ is Gaussian

**2. Dual-Dirac model**:
- DJ = two Dirac deltas at ±DJ/2
- RJ = Gaussian
- Total PDF = ½ N(-DJ/2, σ) + ½ N(+DJ/2, σ)
- Parameters from CDF fit

**3. Spectral method**:
- TIE (Time Interval Error) spectrum
- Discrete peaks = PJ
- Broadband = RJ + BUJ
- Inverse FFT → time domain decomposition

**4. Pattern-based (ISI separation)**:
- Known pattern (PRBS, K28.5)
- Correlate jitter with pattern history
- ISI = correlated component
- BUJ = uncorrelated remainder

#### 4.6.8 BER Estimation from Jitter Components

**Total Jitter at BER**:
TJ(BER) = DJ_δδ + Q_BER × σ_RJ

where DJ_δδ = peak-to-peak DJ (from dual-Dirac)
Q_BER = √2 erfc⁻¹(2 BER)

For BER = 10⁻¹²: Q = 7.03
For BER = 10⁻¹⁵: Q = 7.94
For BER = 10⁻¹⁸: Q = 8.75

**Eye opening**:
Eye width = UI - TJ(BER)
Eye height = V_signal - TN(BER) (voltage noise)

**Margin**:
Timing margin = (UI - TJ)/2
Voltage margin = (V_eye - TN)/2

#### 4.6.9 Jitter Budget Allocation

**System-level budget** (example for 56 Gbps PAM-4):
| Component | Budget (ps) | % UI |
|-----------|-------------|------|
| TX RJ | 0.15 | 2.5% |
| TX DJ (ISI) | 0.30 | 5% |
| TX PJ | 0.05 | 0.8% |
| Channel ISI | 0.40 | 6.7% |
| Channel crosstalk | 0.20 | 3.3% |
| RX RJ | 0.10 | 1.7% |
| RX DJ | 0.15 | 2.5% |
| Clock jitter | 0.10 | 1.7% |
| **Total TJ (10⁻¹²)** | **1.45** | **24%** |
| **Margin** | **4.55** | **76%** |

**Budgeting philosophy**:
- Allocate per component
- Track through design
- Measure at each stage
- Guard-band for uncertainty

#### 4.6.10 Advanced Jitter Analysis

**Bathtub curve**:
Plot BER vs. sampling offset
Slope in log scale = RJ
Horizontal asymptote = DJ

**Q-scale**:
Vertical axis: Q = √2 erfc⁻¹(2 BER)
Linear fit to tails → σ_RJ

**Jitter transfer function** (for CDR):
JTF(f) = H_CDR(f) (closed-loop response)
Input jitter → output jitter
Peaking in JTF → jitter amplification

**Stressed-eye testing**:
- Add SJ (sinusoidal jitter) per spec
- Add ISI (lossy channel)
- Add crosstalk
- Verify BER < spec

**Machine learning for jitter**:
- CNN on eye diagrams
- Predict TJ from early silicon
- Root-cause classification

---

*End of Piece 6. Next: Piece 7 - Equalization: FFE, DFE, CTLE Mathematical Formulations*