# Document 9: ADC/DAC Quantization Theory and Analog Tax
## Piece 7: Schreier FoM: FoM = P/(2^ENOB × BW)

---

### 9.7 Schreier FoM: FoM = P/(2^ENOB × BW)

The Schreier Figure of Merit (FoM_S) is a bandwidth-normalized energy efficiency metric that addresses the fundamental limitation of the Walden FoM for oversampled and sigma-delta (ΣΔ) ADCs. By normalizing power by signal bandwidth rather than Nyquist bandwidth, it provides a fairer comparison across different oversampling ratios and architectures.

#### 9.7.1 Motivation for Bandwidth-Normalized FoM

**Walden FoM limitation**:
FoM_W = P / (f_s × 2^{ENOB})
Assumes Nyquist sampling (BW = f_s/2)
Penalizes oversampled ADCs unfairly

**Example**: ΣΔ ADC with OSR = 64
- f_s = 64 × 2B = 128B
- FoM_W = P / (128B × 2^{ENOB})
- Nyquist ADC (same ENOB, same B): FoM_W = P / (2B × 2^{ENOB})
- Ratio: 64× worse FoM_W despite same information bandwidth!

**Schreier FoM** (1997):
FoM_S = P / (2^{ENOB} × BW)
where BW = signal bandwidth = f_s/(2 × OSR)

**For Nyquist ADC**: BW = f_s/2 → FoM_S = 2 × FoM_W
**For ΣΔ ADC**: BW = f_s/(2OSR) → FoM_S = 2OSR × FoM_W

**Key advantage**: FoM_S depends on information bandwidth, not sampling rate
Enables fair comparison across OSR

#### 9.7.2 Schreier FoM Derivation

**Information capacity** (Shannon):
C = BW × log₂(1 + SNR)
For high SNR: C ≈ BW × log₂(SNR)
SNR = 2^{2ENOB} (for ideal quantizer)

**Information rate**:
R = BW × 2ENOB (bits/s)
= 2 × ENOB × BW

**Energy per bit**:
E_bit = P / R = P / (2 × ENOB × BW)

**FoM_S** (energy per "Nyquist sample" equivalent):
FoM_S = P / (2^{ENOB} × BW)

**Note**: The factor of 2 difference from E_bit:
E_bit = FoM_S / (2 × ENOB × 2^{ENOB})? No.
FoM_S = P/(2^{ENOB} BW) = E_bit × 2 × ENOB

**Physical interpretation**: Energy to achieve one "Nyquist-rate sample equivalent" with ENOB bits precision

#### 9.7.3 FoM_S for Different Architectures

**Nyquist ADC** (Flash, SAR, Pipeline):
OSR = 1, BW = f_s/2
FoM_S = P / (2^{ENOB} × f_s/2) = 2 × FoM_W

**Oversampled Nyquist ADC**:
OSR > 1, BW = f_s/(2OSR)
FoM_S = P / (2^{ENOB} × f_s/(2OSR)) = 2OSR × FoM_W
But ENOB increases with OSR: ENOB = N + 0.5 log₂(OSR)
Net: FoM_S improves with √OSR

**Sigma-Delta ADC** (L-th order):
OSR = f_s/(2BW)
In-band noise: P_q,in = P_q × (π^{2L}/(2L+1)) / OSR^{2L+1}
ENOB = N + 0.5 log₂(OSR) + L log₂(OSR) + constant
= N + (L+0.5) log₂(OSR) + C

**FoM_S for ΣΔ**:
FoM_S = P / (2^{ENOB} × BW)
= P × 2^{N + (L+0.5)log₂(OSR)} / BW
∝ OSR^{-(L+0.5)} / BW
= OSR^{-(L+0.5)} × (2BW/OSR)
∝ OSR^{-(L-0.5)} × BW

For L=1: FoM_S ∝ 1/√OSR (improves with OSR)
For L=2: FoM_S ∝ 1/OSR^{1.5} (strongly improves)

**Optimal OSR for minimum FoM_S**:
Balance between noise shaping gain and increased power
P ∝ f_s ∝ OSR
FoM_S ∝ OSR × OSR^{-(L+0.5)} = OSR^{0.5-L}
For L=1: FoM_S ∝ OSR^{-0.5} (always improves)
For L=2: FoM_S ∝ OSR^{-1.5} (strongly improves)

#### 9.7.4 FoM_S for Different ADC Types

**Nyquist ADC** (Flash, SAR, Pipeline):
FoM_S = 2 × FoM_W
Typical: 5-100 fJ/conv

**Oversampled SAR** (OSR = 4-16):
ENOB increases by 0.5 log₂(OSR)
FoM_S improves by ~√OSR
Typical: 2-10 fJ/conv

**1st-order ΣΔ**:
ENOB = N + 1.5 log₂(OSR)
FoM_S ∝ OSR^{-0.5}
Typical: 0.1-1 fJ/conv

**2nd-order ΣΔ**:
ENOB = N + 2.5 log₂(OSR)
FoM_S ∝ OSR^{-1.5}
Typical: 0.01-0.1 fJ/conv

**Higher-order ΣΔ** (L=3,4):
FoM_S ∝ OSR^{-(L-0.5)}
Diminishing returns for L>3 (stability)

**CT ΣΔ** (Continuous-time):
Includes anti-aliasing filter
Excess loop delay degrades ENOB
FoM_S 2-5× worse than DT ΣΔ

#### 9.7.5 FoM_S vs. FoM_W Comparison

**When to use FoM_W**:
- Nyquist-rate ADCs (OSR ≈ 1)
- Flash, Pipeline, TI-Flash
- High-speed applications
- Quick comparison

**When to use FoM_S**:
- Oversampled ADCs (SAR, Pipeline)
- ΣΔ ADCs (any order)
- Low-bandwidth, high-resolution
- Comparing across OSR

**Conversion**:
FoM_S = 2 × FoM_W (for Nyquist, OSR=1)
FoM_S = 2OSR × FoM_W (for oversampled, if ENOB constant)
But ENOB increases with OSR, so actual ratio varies

**Rule of thumb**:
- FoM_W: "energy per Nyquist sample"
- FoM_S: "energy per unit bandwidth"

#### 9.7.6 FoM_S for System-Level Design

**Link budget with FoM_S**:
Total link power = Σ P_i
Each block: P_i = FoM_S,i × 2^{ENOB_i} × BW_i

**For optical link** (BW = symbol rate/2 for PAM-4):
- TIA: FoM_S,TIA × 2^{ENOB_TIA} × BW
- ADC: FoM_S,ADC × 2^{ENOB_ADC} × BW
- DSP: FoM_S,DSP × 2^{ENOB_DSP} × BW

**Optimization**:
Minimize Σ FoM_S,i × 2^{ENOB_i}
Subject to: Σ ENOB_i ≥ ENOB_target
            ENOB_i ≥ ENOB_min,i

**Lagrange multiplier solution**:
ENOB_i ∝ log₂(1/FoM_S,i)
Higher FoM_S → lower ENOB allocation

#### 9.7.7 FoM_S for ΣΔ ADC Design Optimization

**Design variables**: OSR, N (resolution), L (order)
**Objective**: Minimize FoM_S = P / (2^{ENOB} × BW)

**Power model** (simplified):
P = P_dyn + P_static
P_dyn ∝ f_s × C × V²
f_s = 2 × OSR × BW
C ∝ N (capacitor array)
V ∝ 1 (fixed)

**ENOB model**:
ENOB = N + (L+0.5) log₂(OSR) + C_L
C_L = constant for order L

**FoM_S expression**:
FoM_S = (α OSR × 2^N + β) / (2^{N + (L+0.5)log₂(OSR)} × BW)
= (α OSR + β 2^{-N}) / (2^{(L+0.5)log₂(OSR)} × BW)
= (α OSR + β 2^{-N}) / (OSR^{L+0.5} × BW)

**Optimization**:
d(FoM_S)/d(OSR) = 0
α OSR^{L+0.5} - (L+0.5)(α OSR + β 2^{-N}) OSR^{L-0.5} = 0
Solve for optimal OSR

**Result** (L=1):
OSR_opt ∝ (β 2^{-N} / α)^{2/3}
For L=2: OSR_opt ∝ (β 2^{-N} / α)^{2/5}

**Practical OSR ranges**:
- L=1: OSR = 16-64
- L=2: OSR = 32-128
- L=3: OSR = 64-256

#### 9.7.7 FoM_S for Photonic ΣΔ ADC

**Photonic ΣΔ challenges**:
- Optical integrator nonlinearity
- Photodetector noise (shot + thermal)
- Optical power consumption (laser)
- Excess loop delay

**Photonic ΣΔ FoM_S**:
FoM_S,photonic = (P_elec + P_opt) / (2^{ENOB} × BW)

**State-of-the-art**:
- Optical integrator (SOA/MZI): ENOB 8-10 bits, BW 10-50 MHz
- FoM_S: 10-50 fJ/conv (100-500× worse than electronic)

**Improvement paths**:
- Electro-optic integrator (LiNbO₃, BaTiO₃)
- Balanced photodetection
- Microcomb-based multi-wavelength ΣΔ
- Digital ΣΔ with photonic front-end

#### 9.7.8 FoM_S in Standards and Reporting

**IEEE 1241/1057**:
- Report FoM_S for ΣΔ ADCs
- Specify: ENOB, BW, OSR, L, P, T, V_DD
- Plot: ENOB vs. BW, ENOB vs. OSR

**ISSCC FoM reporting**:
- FoM_S mandatory for ΣΔ papers
- FoM_W for Nyquist papers
- Both for oversampled Nyquist

**Comparison table template**:
| Parameter | Value |
|-----------|-------|
| Architecture | ΣΔ, 2nd order |
| Process | 28nm CMOS |
| Supply | 0.9V |
| BW | 10 MHz |
| OSR | 64 |
| ENOB | 16.2 bits |
| P | 1.2 mW |
| FoM_S | 0.04 fJ/conv |
| FoM_W | 12 fJ/conv |

#### 9.7.8 FoM_S for Emerging Architectures

**Time-interleaved ΣΔ**:
M channels × ΣΔ
BW_total = M × BW
FoM_S same as single channel (if calibrated)
Calibration power adds overhead

**Hybrid ΣΔ + Nyquist**:
Coarse ΣΔ + fine Nyquist
Best of both: high ENOB + high BW
FoM_S intermediate

**Photonic ΣΔ**:
P_optical dominates
FoM_S = (P_elec + P_laser) / (2^{ENOB} × BW)
Laser power: 10-100 mW
Typical FoM_S: 10-100 fJ/conv

**Quantum ΣΔ**:
Quantum non-demolition measurement
Quantum noise shaping
FoM_S → 0 (quantum limit)

#### 9.7.9 FoM_S for Neuromorphic and Event-Driven ADCs

**Event-driven FoM_S**:
FoM_event = E_per_event / (2^{ENOB} × BW_eff)
BW_eff = average spike rate × information/spike

**Spike-based ΣΔ**:
Spike rate encodes signal
FoM_S,spike = E_spike / (2^{ENOB} × BW_info)

**Asynchronous ADC** (level-crossing):
FoM_async = E_per_crossing / (2^{ENOB} × BW)

#### 9.7.9 Future: Quantum and Thermodynamic FoM Limits

**Quantum FoM limit**:
Quantum Cramér-Rao bound
FoM_quantum ≥ h/(4π η)
h = Planck's constant, η = efficiency
For η=1: FoM ≥ 5×10⁻³⁵ J·s (theoretical)

**Thermodynamic limit** (Landauer):
E_bit ≥ kT ln 2
FoM_thermo = kT ln 2 × 2^{ENOB} / BW
At 300K: FoM ≥ 2.9×10⁻²¹ × 2^{ENOB} / BW J

**Landauer FoM** (for ENOB=10, BW=1GHz):
FoM ≥ 2.9×10⁻²¹ × 1024 / 10⁹ = 3×10⁻²⁷ J
Current best: ~10⁻¹⁸ J (9 orders above limit)

**Practical limit** (kT/C):
FoM_kT = kT/C × 2^{ENOB} / BW
For C=1fF, T=300K: 4 fJ/conv at Nyquist
For ΣΔ (OSR=64): 0.06 fJ/conv

---

*End of Piece 7. Next: Piece 8 - Quantization-Aware Training: Straight-Through Estimator Gradient*