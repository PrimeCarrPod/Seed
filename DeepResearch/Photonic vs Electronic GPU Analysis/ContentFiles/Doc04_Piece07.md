# Document 4: RC Delay Physics and Transmission Line Theory
## Piece 7: Equalization: FFE, DFE, CTLE Mathematical Formulations

---

### 4.7 Equalization: FFE, DFE, CTLE Mathematical Formulations

Equalization compensates for channel loss and distortion to reopen the eye diagram. Three primary architectures—Feed-Forward Equalization (FFE), Decision-Feedback Equalization (DFE), and Continuous-Time Linear Equalization (CTLE)—address different aspects of channel impairment with distinct mathematical formulations and implementation trade-offs.

#### 4.7.1 Channel Model and Equalization Goal

**Channel impulse response**:
h(t) = δ(t) + h_ISI(t) + n(t)

**Discrete-time model** (sampled at 1 UI):
y_k = x_k + Σ_{i=1}^L h_i x_{k-i} + n_k

**Equalization goal**: Find filter w such that
ŷ_k = Σ_j w_j y_{k-j} ≈ x_k

**Zero-forcing (ZF) criterion**: w * h = δ
**MMSE criterion**: min E[|ŷ_k - x_k|²]

#### 4.7.2 Feed-Forward Equalization (FFE)

**Transmitter FFE (Tx-FFE)**:
Pre-distorts transmitted signal
x'_k = Σ_{m=-M}^N c_m x_{k-m}

**Typical 3-tap FFE**:
c_{-1} = pre-cursor (pre-emphasis)
c_0 = main cursor
c_1 = post-cursor (de-emphasis)

**Frequency response**:
H_FFE(ω) = Σ c_m e^{-jωmT}

**Optimization**:
For channel H_ch(ω), want H_FFE(ω) H_ch(ω) ≈ constant
FFE taps from: c = H_ch⁻¹ (truncated)

**Loss compensation**:
Channel loss: H_ch(ω) ≈ e^{-α(ω)L}
α(ω) = α₀ + α₁√ω + α₂ω
FFE boosts high frequencies: |H_FFE| ∝ e^{+α(ω)L}

**Tap constraints**:
- ∑|c_m| ≤ 1 (voltage swing limit)
- c_0 > |c_{-1}| + |c_1| (main cursor dominant)
- Resolution: 4-6 bits per tap

**FFE noise enhancement**:
Boosts high-frequency noise along with signal
SNR penalty: NF = 1 + (Σ_{m≠0} c_m²)/c_0²

#### 4.7.3 Continuous-Time Linear Equalization (CTLE)

**Analog filter** at receiver front-end
Provides high-frequency boost before sampling

**Transfer function** (single-zero, single-pole):
H_CTLE(s) = G_DC × (1 + s/ω_z) / (1 + s/ω_p)

where ω_z < ω_p (zero before pole)

**Peaking frequency**:
ω_peak = √(ω_z ω_p)
Peak gain: G_peak = G_DC × (ω_p/ω_z)

**Multi-pole CTLE**:
H_CTLE(s) = G_DC Π_i (1 + s/ω_{z,i}) / (1 + s/ω_{p,i})

**Adaptive CTLE**:
- Tunable ω_z, ω_p, G_DC
- Control: DACs, varactors, switched capacitors
- Adaptation algorithm: minimize BER, maximize eye

**CTLE noise**:
- Adds thermal noise from resistors
- Noise figure: NF ≈ 1 + (ω_p/ω_z - 1) × (kT/g_m)
- Lower NF than FFE (no noise enhancement)

#### 4.7.4 Decision-Feedback Equalization (DFE)

**Feedback of detected symbols**:
ŷ_k = y_k - Σ_{i=1}^N d_i ˆx_{k-i}

where ˆx_{k-i} = sign(ŷ_{k-i}) (hard decision)

**DFE tap weights**:
d_i ≈ h_i (post-cursor ISI coefficients)

**ZF-DFE**: d_i = h_i for i=1..N
**MMSE-DFE**: d_i from Wiener-Hopf equations

**Error propagation**:
If ˆx_{k-i} ≠ x_{k-i}, error feeds back
Probability of error burst: P_burst ≈ P_e / (1 - Σ|d_i|)

**Stability condition**:
Σ|d_i| < 1 (for no error propagation)
In practice: Σ|d_i| < 0.5-0.7

**DFE vs. FFE**:
- DFE: no noise enhancement (uses decisions)
- DFE: limited to post-cursor ISI
- FFE: handles pre- and post-cursor
- FFE: noise enhancement

**Hybrid FFE-CTLE-DFE**:
- CTLE: moderate boost (6-12 dB)
- FFE: 1-2 pre-cursor, 2-3 post-cursor
- DFE: 5-10 post-cursor taps
- Optimal partitioning minimizes total power

#### 4.7.5 Equalizer Adaptation Algorithms

**Least Mean Squares (LMS)**:
w_{k+1} = w_k + μ e_k y_k^*
e_k = ˆx_k - w_k^H y_k

**Normalized LMS (NLMS)**:
w_{k+1} = w_k + (μ/|y_k|²) e_k y_k^*

**Recursive Least Squares (RLS)**:
Fast convergence, O(N²) complexity
P_{k+1} = (P_k - P_k y_k y_k^H P_k / (1 + y_k^H P_k y_k)) / λ

**Blind adaptation** (no training sequence):
- Constant Modulus Algorithm (CMA)
- Decision-Directed (DD) after initial convergence
- Godard algorithm

**Adaptation for PAM-4**:
- 3 slicers (for 4 levels)
- Error: e_k = ˆx_k - y_k
- More sensitive to noise (smaller eyes)

#### 4.7.6 Equalization for PAM-4 Signaling

**PAM-4 levels**: -3, -1, +1, +3 (normalized)
**Eye diagrams**: 3 eyes (inner, middle, outer)

**Challenges**:
- Smaller eye openings (1/3 of NRZ)
- Higher SNR required: ~9.6 dB more than NRZ
- Unequal level spacing after channel distortion

**FFE for PAM-4**:
- Pre-emphasis critical for inner eyes
- Tap resolution: 5-6 bits
- Non-linear FFE (Volterra) for severe distortion

**CTLE for PAM-4**:
- Boost optimized for inner eyes
- Asymmetric boosting (different for each transition)

**DFE for PAM-4**:
- 3-level slicer decisions
- Error propagation more severe
- Soft decisions (reliability-weighted) help

**ADC-based receivers**:
- 4-6 bit flash/SAR ADC
- Digital FFE/DFE in DSP
- Maximum flexibility, higher power

#### 4.7.7 Power and Area Trade-offs

**FFE power**:
P_FFE ≈ C_load V_DD² f × (1 + Σ|c_m/c_0|²)
Typical: 0.5-2 pJ/bit per tap

**CTLE power**:
P_CTLE ≈ I_bias V_DD
Typical: 0.2-1 mW/Gbps
Area: 0.01-0.05 mm²

**DFE power**:
P_DFE ≈ N_taps × P_slicer + P_feedback
P_slicer ≈ 0.1-0.5 mW/Gbps per tap
Area: 0.005-0.02 mm² per tap

**Total equalization power** (56 Gbps):
- NRZ: 5-15 mW
- PAM-4: 15-40 mW

**Technology scaling**:
- 28nm: 1 pJ/bit
- 7nm: 0.3 pJ/bit
- 3nm: 0.1 pJ/bit (projected)

#### 4.7.8 Equalization in Optical Links

**Optical channel impairments**:
- Chromatic dispersion (CD)
- Polarization mode dispersion (PMD)
- Nonlinear effects (SPM, XPM, FWM)
- Laser phase noise

**Electronic dispersion compensation (EDC)**:
- FFE/DFE in DSP
- CD compensation: FIR filter with conjugate phase
- Overlapped frequency-domain equalization (OFDE)

**Coherent detection**:
- Intradyne: mixing with LO
- DSP: CD, PMD, phase recovery, equalization
- 100+ Gbaud, 16-QAM, 64-QAM

**Direct detection (IM/DD)**:
- PAM-4, CAP, DMT
- Kramers-Kronig (KK) receiver
- Single-ended detection with DSP

#### 4.7.9 Spec-Compliant Equalization

**IEEE 802.3 (Ethernet)**:
- 100GBASE-KR4: CTLE + DFE (10-14 taps)
- 400GBASE-KR8: CTLE + FFE + DFE
- Training: LT (Link Training) protocol

**OIF CEI (Chip-to-Chip)**:
- CEI-56G: CTLE + DFE (5-10 taps)
- CEI-112G: FFE + CTLE + DFE
- Adaptation: autonomous or host-controlled

**PCIe Gen 6/7**:
- PAM-4, 64/66b encoding
- FFE (Tx: -6 to +3 dB), CTLE, DFE
- LTSSM training states

**UCIe (Universal Chiplet Interconnect)**:
- 32 GT/s per lane
- FFE + DFE, adaptive
- Low latency, low power

#### 4.7.10 Future: ML-Based and Nonlinear Equalization

**Deep learning equalizers**:
- CNN for channel estimation
- RNN/LSTM for sequence detection
- End-to-end learned receivers

**Volterra series equalization**:
- Nonlinear channel model
- 2nd/3rd order kernels
- Compensates TX/RX nonlinearities

**Neural network DFE**:
- Soft decisions from NN
- Reduced error propagation
- Turbo equalization (LDPC + equalization)

**Joint TX/RX optimization**:
- Global optimization of FFE + CTLE + DFE
- Convex formulation (for linear)
- Gradient-based for nonlinear

**Silicon photonics integration**:
- Optical equalization (MZI mesh, MRR)
- Electronic + optical co-design
- All-optical FFE (nonlinear)

---

*End of Piece 7. Next: Piece 8 - PAM-4 vs. NRZ Spectral Efficiency and SNR Requirements*