# Document 9: ADC/DAC Quantization Theory and Analog Tax
## Piece 1: Sampling Theorem and Aliasing in Photonic-Electronic Interface

---

### 9.1 Sampling Theorem and Aliasing in Photonic-Electronic Interface

The photonic-electronic interface in optical neural networks requires analog-to-digital conversion (ADC) and digital-to-analog conversion (DAC) to bridge the continuous optical domain with digital electronics. The sampling theorem and aliasing analysis are fundamental to understanding the fidelity and limitations of this interface.

#### 9.1.1 Shannon-Nyquist Sampling Theorem

**Continuous signal**: x(t) ∈ L²(ℝ)
**Bandlimited**: X(f) = 0 for |f| > B
**Sampling**: x[n] = x(nT_s), T_s = 1/f_s

**Shannon theorem**: If f_s > 2B, then
x(t) = Σ_{n=-∞}^∞ x[n] sinc((t - nT_s)/T_s)

**Nyquist rate**: f_s,Nyquist = 2B
**Oversampling ratio**: OSR = f_s / (2B)

**Reconstruction filter**: Ideal lowpass, cutoff = f_s/2

#### 9.1.2 Aliasing in Undersampled Systems

**Aliased spectrum**:
X_s(f) = (1/T_s) Σ_{k=-∞}^∞ X(f - k f_s)

**Aliasing error** (for signal component at f₀):
If f₀ > f_s/2: appears at f_alias = |f₀ - k f_s|
where k = round(f₀/f_s)

**Aliasing power** (for white noise, bandwidth B):
P_alias = (B - f_s/2) / B × P_signal (for f_s < 2B)
P_alias = 0 (for f_s ≥ 2B)

**Anti-aliasing filter**: Required before ADC
Attenuation at f_s/2: > 60 dB typical
Transition band: f_s/2 - f_c

#### 9.1.3 Sampling in Photonic Systems

**Optical signal bandwidth**: B_opt = symbol rate × (1 + α)
For PAM-4, 56 GBd: B_opt ≈ 56 GHz (α=0)
For NRZ, 56 Gbps: B_opt ≈ 28 GHz

**ADC sampling rate**: f_s = 1-2 × symbol rate
For 56 GBd PAM-4: f_s = 56-112 GS/s
Time-interleaved ADCs required

**Coherent detection** (I/Q sampling):
Complex sampling: f_s = symbol rate
I and Q sampled at f_s/2 each
Effective: f_s = symbol rate

**Direct detection** (intensity):
Real sampling: f_s ≥ 2 × B_opt
Higher sampling rate needed

#### 9.1.4 Time-Interleaved ADC (TI-ADC)

**M-channel TI-ADC**: f_s,eff = M × f_s,channel
Channel spacing: T_s/M
**Channel mismatches** (dominant error source):
- Offset mismatch: ΔV_os
- Gain mismatch: ΔG/G
- Timing skew: Δt_skew
- Bandwidth mismatch: ΔBW

**Spurious tones** from mismatches:
Offset: f = k f_s/M (k = 1,2,...)
Gain: f = f_s/2 ± f_in
Timing: f = f_in ± k f_s/M

**Calibration**:
- Background: continuous, digital
- Foreground: calibration signal
- Lookup tables for correction

**State-of-the-art**: 4-32 channels
100+ GS/s demonstrated
ENOB: 6-8 bits at Nyquist

#### 9.1.5 Bandpass Sampling (Undersampling)

**Bandpass signal**: Center f_c, bandwidth B
**Undersampling condition**:
f_s ≥ 2B
f_c = k f_s/2 ± f_s/4 (integer k)

**Aliasing zones**:
Zone k: f ∈ [k f_s/2, (k+1) f_s/2]
Signal folds to baseband or IF

**Application in coherent receivers**:
f_c = 193 THz (optical carrier)
LO frequency offset: f_IF = 10-100 GHz
Sample IF directly: f_s = 2-4 × f_IF
Avoids high-speed ADC at optical carrier

**Jitter sensitivity**:
Phase noise: σ_φ = 2π f_c σ_t
For f_c = 193 THz, σ_t = 100 fs:
σ_φ = 0.12 rad (acceptable)
For direct optical sampling: σ_t < 1 fs needed

#### 9.1.6 Quantization and Aliasing Interaction

**Quantization noise** (uniform, step Δ):
e_q[n] = x[n] - Q(x[n])
Power: P_q = Δ²/12
Spectrum: White (for busy signals)

**Quantization noise aliasing** (in ΣΔ ADC):
Noise shaped to high frequencies
Aliasing folds shaped noise back
Requires f_s > 2 × shaped noise bandwidth

**Multi-bit quantization**:
Δ = 2V_ref / 2^N
SQNR = 6.02N + 1.76 dB (for full-scale sine)

**Dithering**:
Add noise before quantization
Linearizes quantization
Trades SNR for linearity

#### 9.1.7 Optical Sampling (Photonic ADC)

**Photonic sampling**: Optical pulses sample optical signal
No electronic sampling jitter
Limited by optical pulse width

**Techniques**:
1. **Electro-optic sampling**: EO modulator as gate
2. **Two-photon absorption**: TPA-based sampling
3. **Four-wave mixing**: FWM-based sampling
4. **Optical Kerr gate**: Kerr shutter

**Pulse width requirements**:
< 100 fs for > 100 GHz signals
Mode-locked lasers: 50-100 fs
Microcombs: < 100 fs

**Advantages**: No electronic jitter, high bandwidth
**Challenges**: Integration, power, noise

#### 9.1.8 Sampling Jitter Analysis

**Sampling jitter**: σ_t (timing uncertainty)
**SNR degradation**:
SNR_jitter = 20 log₁₀(1/(2π f_in σ_t))

**For f_in = 28 GHz (NRZ 56 Gbps)**:
σ_t = 100 fs → SNR = 45 dB
σ_t = 10 fs → SNR = 65 dB
σ_t = 1 fs → SNR = 85 dB

**Jitter sources**:
- Clock phase noise (dominant)
- Aperture jitter (sample-and-hold)
- Power supply noise
- Substrate noise

**Clock jitter budget** (for 8-bit ENOB):
σ_t < 1/(2π f_in 2^N)
For f_in = 28 GHz, N=8: σ_t < 0.7 fs

**Impossible with electronic clocks** → photonic sampling needed

#### 9.1.9 Compressive Sampling (Sub-Nyquist)

**Compressive sensing**: x sparse in basis Ψ
Measurements: y = Φ x
M measurements, M ≪ N
Recovery: min ||x||₁ s.t. y = Φ x

**Random measurements**: Φ ∈ ℝ^{M×N}, i.i.d. Gaussian
Recovery condition: M ≥ C K log(N/K)
K = sparsity, C ≈ 4

**Optical compressive sensing**:
- Single-pixel camera (spatial)
- Random modulation + single detector
- M measurements instead of N pixels

**Temporal compressive sensing**:
- Random sampling in time
- Sub-Nyquist rate
- Requires sparsity in frequency domain

**Application in optical neural networks**:
- Sparse weight matrices
- Sub-sampled activation patterns
- Reduced ADC bandwidth

#### 9.1.10 Future: Quantum Sampling and Quantum ADC

**Quantum non-demolition (QND) measurement**:
Measure photon number without absorption
Repeated measurement → improved precision

**Quantum ADC**:
Superconducting circuits
Quantum-limited noise
SNR at quantum limit: SNR = 2 n_ph + 1

**Quantum sampling theorem**:
For non-commuting observables
Simultaneous measurement impossible
Trade-off: Δx Δp ≥ ħ/2

**Quantum Nyquist rate**:
For conjugate variables
Joint measurement: increased rate needed

**Future**: Quantum-enhanced sampling
Entangled probe states
Heisenberg-limited sampling

---

*End of Piece 1. Next: Piece 2 - Quantization Noise Power: Δ²/12 Derivation for Uniform Quantizer*# Document 9: ADC/DAC Quantization Theory and Analog Tax
## Piece 2: Quantization Noise Power: Δ²/12 Derivation for Uniform Quantizer

---

### 9.2 Quantization Noise Power: Δ²/12 Derivation for Uniform Quantizer

Quantization noise is the fundamental limit on the signal-to-noise ratio (SNR) of analog-to-digital converters (ADCs) and digital-to-analog converters (DACs). The classic result Δ²/12 for the quantization noise power of a uniform quantizer is derived here from first principles, along with its extensions to non-uniform quantizers and practical considerations.

#### 9.2.1 Uniform Quantizer Model

**Quantizer function**: Q(x) = Δ · round(x/Δ)
**Step size**: Δ = 2V_ref / 2^N
**Number of levels**: L = 2^N
**Input range**: [-V_ref, V_ref]

**Quantization error**: e = Q(x) - x
**Error range**: e ∈ [-Δ/2, Δ/2]

**Assumptions for Δ²/12**:
1. Input signal busy (pdf spans many levels)
2. Step size Δ small compared to signal variation
3. Quantization error uncorrelated with signal
4. Error uniformly distributed over [-Δ/2, Δ/2]

#### 9.2.2 Derivation of Δ²/12

**Probability density of error** (under assumptions):
p(e) = 1/Δ for e ∈ [-Δ/2, Δ/2]
p(e) = 0 otherwise

**Mean error**:
E[e] = ∫_{-Δ/2}^{Δ/2} e · (1/Δ) de = 0

**Mean square error** (quantization noise power):
E[e²] = ∫_{-Δ/2}^{Δ/2} e² · (1/Δ) de
= (1/Δ) [e³/3]_{-Δ/2}^{Δ/2}
= (1/Δ) (Δ³/24 + Δ³/24)
= Δ²/12

**RMS quantization noise**:
σ_q = Δ/√12 = Δ/(2√3)

#### 9.2.3 Signal-to-Quantization-Noise Ratio (SQNR)

**Full-scale sine wave**: x(t) = V_ref sin(ωt)
**Signal power**: P_s = V_ref²/2

**Quantization noise power**: P_q = Δ²/12
Δ = 2V_ref / 2^N

**SQNR**:
SQNR = P_s / P_q = (V_ref²/2) / (Δ²/12)
= 6 (V_ref/Δ)²
= 6 × (2^N/2)²
= 1.5 × 2^{2N}

**In dB**:
SQNR_dB = 10 log₁₀(1.5) + 20N log₁₀(2)
= 1.76 + 6.02N dB

**For N=8**: SQNR = 1.76 + 48.16 = 49.92 dB
**For N=10**: SQNR = 1.76 + 60.2 = 61.96 dB
**For N=12**: SQNR = 1.76 + 72.24 = 74.0 dB

#### 9.2.4 Effective Number of Bits (ENOB)

**Real ADC SQNR** (includes all non-idealities):
SQNR_real = 6.02 ENOB + 1.76

**ENOB definition**:
ENOB = (SQNR_real - 1.76) / 6.02

**SINAD** (Signal-to-Noise and Distortion):
SINAD = Signal / (Noise + Distortion)
ENOB = (SINAD - 1.76) / 6.02

**Typical ENOB vs. resolution**:
| Resolution | Ideal SNR | Typical ENOB |
|------------|-----------|--------------|
| 8-bit | 49.9 dB | 7.0-7.5 |
| 10-bit | 62.0 dB | 8.5-9.5 |
| 12-bit | 74.0 dB | 10.5-11.5 |
| 14-bit | 86.0 dB | 12.0-13.0 |

#### 9.2.5 Quantization Noise Spectrum

**Time-domain error**: e[n] = Q(x[n]) - x[n]
**For busy signal** (pdf spans many levels):
e[n] ≈ uniform white noise
**Spectrum**: Flat (white) up to f_s/2
Power spectral density: S_e(f) = Δ²/(12 f_s) for |f| < f_s/2

**Correlation with signal**:
For sinusoidal input: e[n] correlated with x[n]
Generates harmonic distortion
THD = Σ_{k=2}^∞ |E[e[kω]]|² / |E[x[ω]]|²

**Dithering** (adds noise before quantization):
- Triangular PDF dither (TPDF): Δ amplitude
- Linearizes quantization
- Eliminates harmonic distortion
- Increases noise floor by 3 dB
- TPDF: e_q + d where d = Δ·(U₁ - U₂)/√2

#### 9.2.6 Non-Uniform Quantization

**Non-uniform quantizer**: Q(x) = f(x) where f is nonlinear
**Companding**: Compress → uniform quantize → expand
**μ-law** (North America):
y = sign(x) · ln(1 + μ|x|) / ln(1+μ)
μ = 255

**A-law** (Europe):
y = sign(x) · (A|x|/(1+ln A)) for |x| < 1/A
y = sign(x) · (1 + ln(A|x|))/(1+ln A) for |x| ≥ 1/A
A = 87.6

**SQNR improvement**:
For voice (Laplacian pdf): ~24 dB gain
For uniform pdf: no gain (actually loss)

**Optimal non-uniform quantizer** (Lloyd-Max):
Minimize E[(x - Q(x))²] over decision levels and reconstruction levels
Iterative algorithm converges to optimal

#### 9.2.7 Quantization Noise in D2NN Context

**D2NN ADC requirements**:
- Input: analog optical intensity
- Output: digital for electronic post-processing
- Resolution: 4-8 bits typical

**Quantization noise impact on D2NN**:
- Weight precision: limited by ADC bits
- Activation precision: limited by ADC bits
- Gradient precision: limited by ADC bits (if training)

**Error propagation** (L layers):
Each layer adds quantization noise
Total noise: σ²_total = Σ σ²_layer
For L layers: σ²_total = L Δ²/12

**Required resolution** for target fidelity:
F = 1 - L Δ²/(12 σ_x²)
For F > 0.99, L=10, σ_x=1:
Δ < 0.11 → N > 4 bits

**Practical**: 6-8 bits for inference, 8-10 bits for training

#### 9.2.8 Quantization Noise in ΣΔ ADC

**Sigma-delta ADC**:
Oversampling: f_s = OSR × 2B
Noise shaping: H(z) = (1 - z^{-1})^L
Quantization noise pushed to high frequencies

**In-band noise power**:
P_q,in = (Δ²/12) × (π^{2L} / (2L+1)) × (1/OSR)^{2L+1}

**SQNR for ΣΔ**:
SQNR = 6.02N + 1.76 + (2L+1) × 10 log₁₀(OSR)
- 10 log₁₀((2L+1)/π^{2L})

**Example** (1st order, OSR=64):
SQNR gain = 10 log₁₀(64³/3π²) ≈ 30 dB
Equivalent to 5 extra bits

#### 9.2.9 Quantization Noise in Photonic ADCs

**Photonic ADC architectures**:
1. **Photonic flash ADC**: Parallel comparators, optical reference
2. **Photonic ΣΔ ADC**: Optical integrator, quantizer
3. **Photonic time-stretch ADC**: Time-stretch + electronic ADC

**Quantization in optical domain**:
- No electronic jitter
- Limited by optical pulse energy
- Shot noise: σ_shot = √N_ph

**Quantum limit**:
N_ph photons per sample
SQNR_quantum = 10 log₁₀(N_ph) dB
For N_ph = 10⁴: SQNR = 40 dB (6.6 bits)

**Energy per bit**:
E_bit = P_optical / (f_s ENOB)
Optical: ~100 fJ/bit (state-of-the-art)
Electronic: ~1-10 pJ/bit

#### 9.2.10 Practical Quantization Noise Considerations

**DAC quantization noise**:
Same Δ²/12 for uniform DAC
Images at multiples of f_s
Reconstruction filter removes images

**Mismatch in DAC** (current-steering):
Current source mismatch: σ_I/I
Generates harmonic distortion
Calibration: foreground/background

**Quantization in MZI mesh**:
Phase shifter quantization: Δθ = 2π/2^N_phase
Weight quantization: Δw = Δθ (for small angles)
SQNR_phase = 6.02 N_phase + 1.76 dB

**Summary of quantization noise budgets** (for 8-bit system):
| Source | Bits | Noise (dB) |
|--------|------|------------|
| ADC | 8 | -50 |
| DAC | 8 | -50 |
| Phase shifter | 8 | -50 |
| Weight | 8 | -50 |
| **Total** | **6** | **-44** |

**System design**: Budget 2-3 bits margin
Target ADC: 10-12 bits for 8-bit system

---

*End of Piece 2. Next: Piece 3 - Signal-to-Quantization-Noise Ratio (SQNR): 6.02N + 1.76 dB*# Document 9: ADC/DAC Quantization Theory and Analog Tax
## Piece 3: Signal-to-Quantization-Noise Ratio (SQNR): 6.02N + 1.76 dB

---

### 9.3 Signal-to-Quantization-Noise Ratio (SQNR): 6.02N + 1.76 dB

The Signal-to-Quantization-Noise Ratio (SQNR) is the primary metric for quantizer performance. The classic 6.02N + 1.76 dB formula for an ideal uniform quantizer with a full-scale sinusoidal input is derived and analyzed here, along with its variations for different signal statistics and practical non-idealities.

#### 9.3.1 SQNR Derivation for Sinusoidal Input

**Full-scale sinusoid**: x(t) = A sin(ωt), A = V_ref
**Signal power**: P_s = A²/2 = V_ref²/2

**Quantizer**: N bits, step Δ = 2V_ref/2^N
**Quantization noise power**: P_q = Δ²/12

**SQNR (linear)**:
SQNR = P_s/P_q = (V_ref²/2) / (Δ²/12)
= 6 (V_ref/Δ)²
= 6 (2^N/2)²
= 1.5 × 2^{2N}

**SQNR (dB)**:
SQNR_dB = 10 log₁₀(1.5) + 20N log₁₀(2)
= 1.7609 + 6.0206N dB

**Approximation**: SQNR ≈ 6.02N + 1.76 dB

#### 9.3.2 SQNR for Different Signal Distributions

**Gaussian signal** (zero mean, variance σ²):
P_s = σ²
Optimal: V_ref = kσ (k = crest factor)
Typical k = 4 (0.006% clipping)
Δ = 2kσ/2^N
SQNR = (σ²) / (Δ²/12) = 3 × 2^{2N} / k²
SQNR_dB = 6.02N + 4.77 - 20 log₁₀(k)
For k=4: SQNR_dB = 6.02N - 7.24 dB

**Uniform distribution** (over [-V_ref, V_ref]):
P_s = V_ref²/3
Δ = 2V_ref/2^N
SQNR = (V_ref²/3) / (Δ²/12) = 2^{2N}
SQNR_dB = 6.02N dB

**Laplacian distribution** (speech-like):
p(x) = (1/√2σ) e^{-√2|x|/σ}
Optimal companding (μ-law): SQNR gain ~24 dB
Without companding: poor SQNR at low levels

#### 9.3.3 Crest Factor and Clipping

**Crest factor**: CF = V_peak / V_rms
For sine: CF = √2 = 1.414 (3 dB)
For Gaussian: CF ≈ 4 (12 dB) for 0.006% clipping
For OFDM: CF ≈ 10-13 (20-22 dB)

**Clipping distortion**:
When |x| > V_ref: Q(x) = ±V_ref
Clipping power: P_clip = ∫_{|x|>V_ref} (x - sign(x)V_ref)² p(x) dx

**Total noise** (quantization + clipping):
P_total = P_q + P_clip

**Optimal V_ref** (minimize P_total):
Balance between quantization noise (decreases with V_ref)
and clipping noise (increases with V_ref)

**For Gaussian, N=8**:
Optimal k ≈ 4.2
SQNR ≈ 45 dB (vs 49.9 dB ideal)

#### 9.3.4 SQNR with Oversampling

**Oversampling ratio**: OSR = f_s / (2B)
**In-band quantization noise**:
P_q,in = P_q / OSR = Δ²/(12 OSR)

**SQNR with oversampling**:
SQNR_OSR = 6.02N + 1.76 + 10 log₁₀(OSR)

**For OSR = 64** (6×): SQNR gain = 18 dB
Equivalent to 3 extra bits

**Noise shaping (ΣΔ)**:
SQNR_ΣΔ = 6.02N + 1.76 + (2L+1) × 10 log₁₀(OSR)
- 10 log₁₀(π^{2L}/(2L+1))

**Comparison**:
| Architecture | SQNR formula | Gain at OSR=64 |
|--------------|--------------|----------------|
| Nyquist | 6.02N + 1.76 | 0 dB |
| Oversampled | +10 log₁₀(OSR) | 18 dB |
| 1st-order ΣΔ | +30 log₁₀(OSR) | 54 dB |
| 2nd-order ΣΔ | +50 log₁₀(OSR) | 90 dB |

#### 9.3.5 ENOB from SQNR

**Effective Number of Bits**:
ENOB = (SQNR_measured - 1.76) / 6.02

**SINAD** (includes distortion):
SINAD = 10 log₁₀(P_s / (P_q + P_dist))
ENOB = (SINAD - 1.76) / 6.02

**Typical ADC ENOB vs. resolution**:
| Resolution | Ideal SQNR | Typical SINAD | Typical ENOB |
|------------|------------|---------------|--------------|
| 6-bit | 37.9 dB | 34-35 dB | 5.3-5.5 |
| 8-bit | 49.9 dB | 45-47 dB | 7.0-7.5 |
| 10-bit | 62.0 dB | 56-59 dB | 8.8-9.5 |
| 12-bit | 74.0 dB | 66-71 dB | 10.5-11.5 |
| 14-bit | 86.0 dB | 77-83 dB | 12.5-13.5 |

**ENOB degradation sources**:
- Thermal noise: -1 to -3 dB
- Clock jitter: -1 to -6 dB (high freq)
- Nonlinearity (INL/DNL): -1 to -3 dB
- Power supply noise: -1 to -2 dB

#### 9.3.6 SQNR in Coherent Optical Receivers

**Coherent detection** (balanced):
Signal: I ∝ |E_s + E_LO|²
Shot noise: σ_shot² = 2q(I_s + I_LO)B
Thermal noise: σ_th² = 4kTB/R_eq

**ADC SQNR requirement**:
SQNR_ADC > OSNR_optical + 3 dB (for coherent)
OSNR_optical = 10 log₁₀(P_s/P_ASE)

**For 100G DP-QPSK**:
OSNR ≈ 15 dB (pre-FEC)
Required ADC ENOB: 6-7 bits
(6.5 bits = 40 dB SQNR)

**Direct detection (IM/DD)**:
Higher dynamic range needed
ADC ENOB: 8-10 bits typical

#### 9.3.7 SQNR in D2NN and Optical Neural Networks

**D2NN quantization chain**:
1. Input encoding (DAC): N_DAC bits
2. Optical propagation: analog
3. Detection (ADC): N_ADC bits
4. Weight representation (phase): N_phase bits

**Total effective precision**:
1/σ_total² = 1/σ_DAC² + 1/σ_ADC² + 1/σ_phase²
Assuming equal bits: σ_total² = 3 × Δ²/12
Effective bits = N - 0.5 log₂(3) ≈ N - 0.8

**For 8-bit target**: Need 9-bit components
**Practical**: 10-bit DAC/ADC, 8-bit phase

**Training precision**:
Forward: 8-bit sufficient (inference)
Backward: 16-32 bits (gradients)
Mixed precision: 8-bit forward, 16-bit backward

#### 9.3.8 SQNR Measurement Techniques

**Histogram method**:
1. Apply DC input
2. Capture histogram of output codes
3. Compute variance of code transitions
4. DNL = (V_{k+1} - V_k)/Δ - 1
4. INL = cumulative DNL

**Sine-wave fitting** (IEEE 1241):
1. Apply pure sine wave
2. Capture M samples (M ≥ 2^N)
3. Fit 4-parameter sine: A sin(ωt+φ) + C
4. Compute residuals → noise + distortion
5. SINAD = 10 log₁₀(P_s/P_residual)

**FFT method**:
1. Apply low-distortion sine
2. Windowed FFT (Blackman-Harris)
6. Signal bin + harmonics
7. Noise floor = average non-harmonic bins
8. SNR = signal bin / noise floor
9. SINAD = signal / (noise + harmonics)

**Two-tone IMD test**:
Two tones f₁, f₂
Measure IMD3: 2f₁-f₂, 2f₂-f₁
IMD3 intercept (IIP3) → linearity

#### 9.3.9 SQNR vs. Power and Speed Trade-offs

**Figure of Merit (FoM)**:
FoM_Walden = P / (2^{ENOB} × f_s)
Units: J/conv-step

**FoM_Schreier** (for ΣΔ):
FoM_S = P / (2^{ENOB} × BW)
BW = f_s/(2 OSR)

**State-of-the-art FoM**:
- Flash ADC: 10-50 fJ/conv
- SAR ADC: 1-10 fJ/conv
- ΣΔ ADC: 0.1-1 fJ/conv
- Photonic ADC: 10-100 fJ/conv

**Power-SQNR-Speed trade-off**:
P ∝ 2^{ENOB} × f_s / FoM
For fixed FoM: P ∝ 2^{ENOB} × f_s

**Optimal operating point**:
Maximize ENOB for given P, f_s
Or minimize P for given ENOB, f_s

#### 9.3.10 Future: Quantum-Limited SQNR

**Quantum non-demolition (QND) measurement**:
Repeated measurement of same observable
SQNR improves with √M (M measurements)
Heisenberg limit: Δx ≥ 1/√N (vs SQL 1/√N)

**Squeezed state input**:
Squeezing reduces one quadrature noise
SQNR improvement: 10 log₁₀(e^{2r}) dB
For 10 dB squeezing: 10 dB SQNR gain

**Quantum ADC**:
Superconducting qubit + resonator
Quantum-limited added noise: 1/2 photon
ENOB → ∞ as T → 0, P_LO → ∞

**Future**: Quantum-enhanced ADCs
Entangled probe states
Heisenberg-limited sampling
Beyond SQL for specific measurements

---

*End of Piece 3. Next: Piece 4 - Effective Number of Bits (ENOB) vs. SINAD Measurement*# Document 9: ADC/DAC Quantization Theory and Analog Tax
## Piece 4: Effective Number of Bits (ENOB) vs. SINAD Measurement

---

### 9.4 Effective Number of Bits (ENOB) vs. SINAD Measurement

Effective Number of Bits (ENOB) is the standard metric for quantifying the real-world resolution of an ADC or DAC, accounting for all non-idealities including quantization noise, thermal noise, clock jitter, nonlinearity, and distortion. This piece covers the theory, measurement methodologies, and practical interpretation of ENOB and SINAD.

#### 9.4.1 ENOB Definition and Relationship to SINAD

**SINAD** (Signal-to-Noise and Distortion):
SINAD = P_signal / (P_noise + P_distortion)
= 1 / (1/SNR + 1/SINAD_distortion)

**ENOB definition**:
ENOB = (SINAD - 1.76) / 6.02

**Derivation**:
Ideal SQNR = 6.02N + 1.76
Real SINAD = 6.02 ENOB + 1.76
→ ENOB = (SINAD - 1.76) / 6.02

**Interpretation**: ENOB = equivalent ideal ADC bits that would give the same SINAD

**ENOB vs. Resolution**:
- Resolution = N (number of bits in digital output)
- ENOB ≤ N (always, typically ENOB = N - 0.5 to N - 2)
- Missing bits = N - ENOB = "lost bits"

#### 9.4.2 SINAD Measurement: Sine-Wave Fitting (IEEE 1241)

**Test setup**:
- Pure sine wave input (THD < -80 dB)
- Amplitude: -0.5 to -1 dBFS (avoid clipping)
- Frequency: non-coherent with f_s (avoid aliasing of harmonics)
- Capture M samples (M ≥ 2^N, typically 2^N to 2^{N+2})

**4-parameter sine fit**:
x[n] = A sin(ωn + φ) + C
Parameters: A (amplitude), ω (frequency), φ (phase), C (DC offset)

**Fitting algorithm** (nonlinear least squares):
1. Initial guess via FFT
2. Refine with Levenberg-Marquardt
3. Compute residuals: r[n] = x[n] - x_fit[n]

**SINAD calculation**:
SINAD = 10 log₁₀(Σ x_fit[n]² / Σ r[n]²)
= 20 log₁₀(A/√2) - 10 log₁₀(Σ r[n]²/M)

**ENOB**:
ENOB = (SINAD - 1.76) / 6.02

#### 9.4.3 SINAD Measurement: FFT Method

**FFT-based method**:
1. Apply window (Blackman-Harris 4-term)
2. Compute FFT: X[k] = Σ x[n] w[n] e^{-j2πkn/M}
3. Find signal bin k_s (max magnitude)
4. Signal power: P_s = |X[k_s]|² / (M W_c)²
   W_c = coherent gain of window

**Noise + distortion power**:
P_nd = (Σ_{k≠k_s} |X[k]|²) / (M W_c)²
- Exclude DC (k=0) and Nyquist (k=M/2)

**Harmonic exclusion** (for THD):
Identify harmonic bins: k_h = round(h × k_s)
Exclude from noise calculation

**SINAD**:
SINAD = 10 log₁₀(P_s / P_nd)

**Window selection**:
- Rectangular: high leakage, high resolution
- Hann: good balance
- Blackman-Harris 4-term: low leakage, wide mainlobe
- Flat-top: accurate amplitude, wide mainlobe

#### 9.4.4 ENOB vs. Frequency (ENOB vs. f_in)

**ENOB degradation with frequency**:
ENOB(f) = ENOB_DC - ΔENOB(f)

**Degradation sources**:
1. **Clock jitter**: ΔENOB_jitter = -log₂(2π f σ_t)
   For σ_t = 100 fs, f = 1 GHz: -1.4 bits
   
2. **Aperture jitter**: Sample-and-hold uncertainty
   Typically 10-50 fs rms

3. **Bandwidth limitation**:
   ENOB drops when f_in > 0.3 × f_{-3dB}
   
4. **Slew-rate limitation**:
   Front-end amplifier slew rate
   ENOB drop at high frequency/amplitude

**Typical ENOB vs. f_in curve**:
- Flat to ~0.1 f_s
- Roll-off: -6 dB/octave (1 bit/octave)
- Floor at thermal noise limit

**Spec example** (12-bit 1 GS/s ADC):
- DC-100 MHz: 11.2 bits
- 500 MHz: 10.5 bits
- 1 GHz (Nyquist): 9.8 bits

#### 9.4.5 ENOB vs. Amplitude (ENOB vs. A_in)

**Amplitude dependence**:
ENOB(A) = ENOB_FS - ΔENOB(A)

**Low amplitude** (thermal noise limited):
SNR ∝ A² (20 dB/decade)
ENOB drops 1 bit per 6 dB amplitude reduction

**Mid amplitude** (quantization limited):
Constant ENOB (flat region)

**High amplitude** (clipping/distortion):
THD increases rapidly near full-scale
ENOB drops sharply near 0 dBFS

**Typical ENOB vs. amplitude**:
- -20 dBFS: ENOB drops 2-3 bits
- -6 dBFS: flat (best ENOB)
- -1 dBFS: starts dropping
- 0 dBFS: drops sharply

**Optimal operating point**: -3 to -6 dBFS
Best trade-off: headroom vs. quantization noise

#### 9.4.6 ENOB vs. Temperature and Supply

**Temperature drift**:
ΔENOB/ΔT ≈ -0.01 to -0.05 bits/°C
Main sources: reference drift, bias current drift

**Supply sensitivity**:
PSRR = ΔENOB / ΔV_DD
Typical: 0.1-0.5 bits/V
Critical for battery-powered systems

**Aging**:
ΔENOB/year ≈ -0.01 to -0.1 bits
Reference voltage drift, oxide degradation

#### 9.4.7 ENOB Budget Allocation in System Design

**System-level ENOB budget** (example 100G coherent):
| Component | Bits | Rationale |
|-----------|------|-----------|
| ADC | 7.0 | Best available at 64 GS/s |
| Laser RIN | 0.5 | -3 dB penalty |
| LO phase noise | 0.3 | -1.8 dB penalty |
| LO RIN | 0.2 | -1.2 dB penalty |
| Thermal noise | 0.3 | -1.8 dB penalty |
| DSP quantization | 0.2 | -1.2 dB penalty |
| **Total ENOB** | **5.5** | **Target: 5.5 bits** |

**ENOB margin**: Design for 0.5-1 bit margin
If spec requires 5.5 bits → design for 6.5 bits

#### 9.4.8 ENOB in Photonic and Optical ADCs

**Photonic ADC ENOB**:
- State-of-the-art: 7-8 bits at 50-100 GS/s
- Limited by: optical pulse jitter, SOA noise, detector noise
- Jitter: σ_t = 50-100 fs → ENOB limited to 7-8 bits at 50 GHz

**Photonic ΣΔ ADC**:
- Optical integrator + quantizer
- Demonstrated: 8-10 bits at 10 GS/s
- Limited by: optical integrator nonlinearity, detector noise

**Photonic time-stretch ADC**:
- Time-stretch preprocessor + electronic ADC
- Effective ENOB: 8-10 bits at 50+ GS/s
- Limited by: time-stretch distortion, dispersion

**Quantum-limited photonic ADC**:
- Squeezed light probing
- Quantum non-demolition measurement
- Theoretical: ENOB → ∞ with infinite resources

#### 9.4.8 ENOB in D2NN Systems

**D2NN ENOB chain**:
Input (DAC) → Optical (analog) → Detector → ADC → Digital

**Effective ENOB**:
1/σ_total² = 1/σ_DAC² + 1/σ_optical² + 1/σ_ADC²

**Typical budget** (for 8-bit system):
- DAC: 10 bits (0.5 bit loss)
- Optical (shot noise): 9 bits (1 bit loss)
- ADC: 10 bits (0.5 bit loss)
- **Effective: 8.5 bits** (target 8 bits with margin)

**Weight precision** (phase shifters):
N_phase = 8 bits → 6 dB margin
For training: 10-bit phase shifters

**Training vs. Inference**:
- Inference: 6-8 bits ENOB sufficient
- Training: 12-16 bits (gradients)
- Mixed precision: 8-bit forward, 16-bit backward

#### 9.4.9 ENOB Measurement Pitfalls and Best Practices

**Common pitfalls**:
1. **Coherent sampling**: f_in = k f_s/M
   - Harmonics fall on same bins
   - Underestimates distortion
   - Solution: non-coherent frequency

2. **Insufficient samples**: M < 2^N
   - Poor statistics
   - M ≥ 2^{N+2} recommended

3. **Window leakage**: Poor window choice
   - Harmonic leakage into noise bins
   - Use Blackman-Harris or Flat-top

3. **Harmonic inclusion**: Including harmonics in noise
   - Overestimates noise
   - Must exclude harmonic bins

4. **DC offset**: Not removed
   - Corrupts SINAD
   - Subtract mean before FFT

**Best practices**:
- Use IEEE 1241 standard test methods
- Multiple acquisitions, average results
- Report: mean ± std over temperature
- Specify: f_in, A_in, T, V_DD conditions

#### 9.4.10 Future: Self-Calibrating ENOB and Adaptive Resolution

**Background calibration**:
- Continuous foreground/background
- Digital correction of INL/DNL
- ENOB recovery: 1-2 bits

**Adaptive resolution**:
- Reduce resolution for low-SNR signals
- Power ∝ 2^{ENOB}
- Dynamic ENOB saves 30-50% power

**Self-healing ADC**:
- Monitor ENOB continuously
- Detect degradation
- Recalibrate automatically

**AI-enhanced ENOB**:
- Neural network post-processing
- Learns ADC non-idealities
- Recovers 1-2 bits ENOB

**Quantum ENOB**:
- Squeezed state probing
- QND measurement
- Quantum-limited ENOB → ∞

---

*End of Piece 4. Next: Piece 5 - ADC Architectures: Flash, SAR, Pipeline, Time-Interleaved*# Document 9: ADC/DAC Quantization Theory and Analog Tax
## Piece 5: ADC Architectures: Flash, SAR, Pipeline, Time-Interleaved

---

### 9.5 ADC Architectures: Flash, SAR, Pipeline, Time-Interleaved

The choice of ADC architecture fundamentally determines the speed-resolution-power trade-off in photonic-electronic interfaces. This piece analyzes the four dominant high-speed ADC architectures—Flash, SAR, Pipeline, and Time-Interleaved—their operating principles, performance limits, and suitability for optical neural network interfaces.

#### 9.5.1 Flash ADC (Parallel Comparator)

**Architecture**: 2^N - 1 comparators + resistor ladder + priority encoder
**Operation**: Single clock cycle
- Resistor ladder generates 2^N - 1 reference voltages
- All comparators fire simultaneously
- Encoder converts thermometer code to binary

**Speed**: Fastest possible (1 cycle)
- f_s,max = 10-100+ GS/s
- Limited by: comparator delay + encoder delay + clock distribution

**Resolution**: Limited to 6-8 bits
- Comparator count: 2^N - 1
- 8-bit: 255 comparators
- 10-bit: 1023 comparators (impractical)

**Power**: High
- P ∝ 2^N × f_s
- 8-bit 10 GS/s: ~1-5 W
- Dominated by: comparator bias + ladder current + clock

**Sparkle codes** (metastability):
- Comparator output settles wrong
- Probability: P_meta ∝ e^{-t_res/τ}
- Gray coding + error correction

**Best for**: Oscilloscopes, direct RF sampling, photonic ADCs
**Photonic flash**: Optical comparators, 50+ GS/s demonstrated

#### 9.5.2 SAR ADC (Successive Approximation Register)

**Architecture**: 1 comparator + DAC + SAR logic
**Operation**: N cycles for N bits
1. Sample input (S/H)
2. Set MSB, compare
3. Keep/clear bit based on comparison
3. Repeat for all bits

**Speed**: Moderate
- f_s,max = 10-500 MS/s (single channel)
- 1 GS/s with time-interleaving
- Limited by: DAC settling + comparator delay × N

**Resolution**: Excellent (12-18 bits)
- No comparator matching required
- Linearity limited by DAC matching
- Self-calibration possible

**Power**: Low
- P ∝ f_s (single comparator)
- 12-bit 100 MS/s: ~1-10 mW
- 16-bit 1 MS/s: ~100 μW

**Best for**: Precision measurement, sensor interfaces, low-power IoT
**Photonic SAR**: Optical comparator + electronic DAC, ~1 GS/s

#### 9.5.3 Pipeline ADC

**Architecture**: M stages × 1.5-2 bits/stage + digital error correction
**Operation**: Pipelined (throughput 1 sample/cycle after latency)
1. Stage 1: Sample, coarse quantize (1.5 bits), residue ×2
2. Stage 2: Quantize residue, new residue
3. ... M stages
4. Digital alignment + error correction

**Speed**: High
- f_s,max = 1-10 GS/s
- Limited by: inter-stage amplifier settling
- Each stage: 1.5 bits → 8-bit = 6 stages

**Resolution**: Good (10-14 bits)
- Error correction tolerates stage errors
- Calibration: foreground/background
- Inter-stage gain calibration critical

**Power**: Moderate
- P ∝ f_s × stages
- 12-bit 2 GS/s: ~100-500 mW
- Inter-stage amps dominate

**Latency**: M cycles (typically 6-12 cycles)
- Important for control loops

**Best for**: Communications, digitizers, high-speed imaging
**Photonic pipeline**: Optical amps + modulators, challenging

#### 9.5.4 Time-Interleaved ADC (TI-ADC)

**Architecture**: M parallel sub-ADCs (any type) + clock phasing
**Operation**: 
- Clocks: φ_k = 2πk/M, k = 0...M-1
- Sub-ADC k samples at t = nT_s + kT_s/M
- Digital multiplexer combines outputs

**Speed**: Scales with M
- f_s,eff = M × f_s,sub
- 4× 25 GS/s → 100 GS/s
- 8× 50 GS/s → 400 GS/s

**Resolution**: Limited by mismatches
- Offset mismatch → spurs at k f_s/M
- Gain mismatch → images at f_s/2 ± f_in
- Timing skew → broadband noise floor
- Bandwidth mismatch → frequency-dependent gain error

**Calibration** (essential):
- **Background**: Continuous, during normal operation
  - Random signal statistics
  - LMS/RLS adaptation
  - Slow (ms to s)
  
- **Foreground**: Dedicated calibration signal
  - Known ramp/sine
  - Fast (μs to ms)
  - Requires calibration mode

- **Built-in self-test (BIST)**:
  - On-chip reference
  - Measures mismatches directly

**Mismatch-induced spurs**:
- Offset: f = k f_s/M (k = 1,2,...)
- Gain: f = f_s/2 ± f_in
- Timing: f = f_in ± k f_s/M
- Bandwidth: frequency-dependent

**State-of-the-art TI-ADC**:
- 8× 50 GS/s flash → 400 GS/s, 6-bit
- 4× 25 GS/s SAR → 100 GS/s, 10-bit
- 16× 10 GS/s pipeline → 160 GS/s, 8-bit

**Best for**: Highest sample rates (>50 GS/s), coherent optical receivers
**Photonic TI-ADC**: Optical sampling + electronic sub-ADCs

#### 9.5.5 Architecture Comparison for Optical Neural Networks

| Parameter | Flash | SAR | Pipeline | TI-ADC |
|-----------|-------|-----|----------|--------|
| Speed | 10-100 GS/s | 0.1-1 GS/s | 1-10 GS/s | 50-400 GS/s |
| Resolution | 6-8 bit | 12-18 bit | 10-14 bit | 6-10 bit |
| Power (10 GS/s) | 1-5 W | N/A | 100-500 mW | 2-5 W |
| Latency | 1 cycle | N cycles | M cycles | 1 cycle |
| Area | Large (2^N) | Small | Medium | M × sub |
| Calibration | Simple | Built-in | Complex | Critical |
| Photonic fit | Excellent | Good | Poor | Excellent |

**For coherent optical receiver** (64 GS/s, 6-8 bit):
- **TI-Flash**: 8× 8 GS/s flash → 64 GS/s, 6-7 bit ENOB
- **Photonic TI**: Optical sampling + 8 electronic SARs

**For D2NN training** (moderate speed, high precision):
- **TI-SAR**: 8× 1 GS/s SAR → 8 GS/s, 10-bit ENOB
- Better precision for gradients

**For D2NN inference** (high speed, moderate precision):
- **TI-Flash** or **Photonic Flash**: 50+ GS/s, 6-7 bit ENOB
- Direct detection: lower speed, higher resolution

#### 9.5.6 Emerging ADC Architectures for Photonics

**Asynchronous ADC** (level-crossing):
- Samples on signal threshold crossing
- No clock, data-driven
- Variable rate, sparse sampling
- Good for sparse optical signals

**Sigma-Delta ADC** (ΣΔ):
- Oversampling + noise shaping
- 10-18 bits at 10-100 MS/s
- Photonic ΣΔ: optical integrator
- For D2NN training (high precision)

**Folding ADC**:
- Folding amplifier + coarse ADC
- 8-10 bits at 1-5 GS/s
- Lower power than flash

**VCO-based ADC**:
- Voltage-controlled oscillator
- Time-to-digital conversion
- Low power, PVT sensitive

**Photonic-specific**:
- **Photonic flash**: Optical comparators (SOA, MZI)
- **Photonic time-stretch**: Dispersion + slow ADC
- **Electro-optic sampling**: EO modulator as sampler
- **Two-photon absorption sampler**: TPA-based, < 100 fs resolution

#### 9.5.7 ADC Selection for D2NN System Design

**Inference path** (high throughput, 6-8 bits):
- Coherent receiver: TI-Flash (64+ GS/s)
- Direct detection: Pipeline (10-12 bits, 2-5 GS/s)
- Photonic: TI with optical sampling

**Training path** (gradient precision, 12-16 bits):
- SAR with time-interleaving
- ΣΔ for ultra-high precision (gradients)
- Lower speed acceptable (batch processing)

**Weight loading** (DAC for phase shifters):
- Precision: 8-10 bits
- Speed: 1-10 MS/s (slow tuning)
- Architecture: String DAC, R-2R, or ΣΔ DAC

**Hybrid approach**:
- Fast TI-Flash for data path (inference)
- Slow high-precision SAR for weight updates
- Shared reference, calibrated together

#### 9.5.8 ADC/DAC Co-Design for Optical Interfaces

**ADC-DAC matching**:
- Same reference voltage
- Calibrated together
- Shared clock (for coherent systems)

**DAC architectures** (for phase shifters):
- **String DAC**: 2^N resistors, best matching
- **R-2R ladder**: Compact, needs matching
- **Current-steering**: Fast, needs calibration
- **ΣΔ DAC**: High precision, slow

**DAC specs for phase shifters**:
- Resolution: 8-10 bits
- Settling: < 1 μs (thermal), < 1 ns (carrier)
- Glitch: < 1 LSB (critical for MZI)
- SFDR: > 60 dB

**Co-design flow**:
1. System budget: ENOB, speed, power
2. ADC/DAC pair selection
3. Joint calibration strategy
4. Shared reference, clock
5. BIST for both

#### 9.5.9 ADC in Advanced Packaging (3D, Chiplet)

**Chiplet-based ADC**:
- ADC as separate chiplet
- UCIe / BoW interface
- Enables process optimization (ADC in 28nm, logic in 3nm)

**3D-stacked ADC**:
- ADC die on logic die
- TSVs for digital output
- Short interconnects → less jitter

**Photonic-electronic co-packaging**:
- ADC next to photodetector
- Minimizes RF loss
- Co-packaged optics (CPO) standard

**UCIe ADC interface**:
- 32 GT/s per lane
- 16 lanes = 512 Gbps
- Multiple ADCs per chiplet

#### 9.5.10 Future: Neuromorphic and Quantum ADC

**Neuromorphic ADC** (event-driven):
- Level-crossing sampling
- Spikes at threshold crossings
- Sparse data → massive power savings
- For sparse optical spike trains

**Spike-based ADC**:
- Input: analog
- Output: spike train (rate = voltage)
- Natural fit for spiking neural networks

**Quantum ADC**:
- Superconducting qubit + resonator
- Quantum non-demolition measurement
- Quantum-limited noise: 1/2 photon
- ENOB → ∞ as T → 0, P_LO → ∞

**Photonic neuromorphic ADC**:
- Spiking photodetectors
- Optical thresholding
- All-optical spike generation
- For all-optical SNN

**In-memory ADC**:
- Compute-in-memory
- ADC integrated in SRAM/ReRAM
- For analog compute acceleration

---

*End of Piece 5. Next: Piece 6 - Walden Figure of Merit: FoM = P/(2^ENOB × f_s)*# Document 9: ADC/DAC Quantization Theory and Analog Tax
## Piece 6: Walden Figure of Merit: FoM = P/(2^ENOB × f_s)

---

### 9.6 Walden Figure of Merit: FoM = P/(2^ENOB × f_s)

The Walden Figure of Merit (FoM) is the standard metric for comparing ADC energy efficiency across different architectures, speeds, and resolutions. It normalizes power consumption by the effective information throughput, enabling fair comparison across vastly different designs.

#### 9.6.1 Walden FoM Definition and Derivation

**Information throughput** of an ADC:
I_throughput = f_s × ENOB (bits/s)
where f_s = sampling rate, ENOB = effective bits

**Energy per conversion step**:
E_step = P / f_s (J/conversion)

**Energy per bit**:
E_bit = P / (f_s × ENOB)

**Walden FoM** (energy per conversion step per bit):
FoM_W = P / (f_s × 2^{ENOB})
Units: J/conv-step (often reported in fJ/conv-step)

**Alternative form** (using ENOB directly):
FoM_W = P / (f_s × 2^{ENOB})

**Physical interpretation**: Energy required to generate one "ideal" conversion step with ENOB bits of precision

**Why 2^{ENOB}?**:
- Information capacity = 2^{ENOB} distinct levels
- ENOB bits → 2^{ENOB} distinguishable states
- FoM = E_bit × 2^{ENOB} (energy per level)

#### 9.6.2 Walden FoM for Different Architectures

**Theoretical minimum** (kT/C limit):
P_min = (kT/C) × f_s × 2^{ENOB} (for charge-redistribution)
FoM_kT = kT/C (for charge-sharing SAR)

**Practical FoM ranges** (state-of-the-art, 2024):

| Architecture | ENOB | f_s (GS/s) | Power (mW) | FoM (fJ/conv) |
|--------------|------|------------|------------|---------------|
| Flash | 6-7 | 10-100 | 500-5000 | 10-100 |
| Pipeline | 10-12 | 1-10 | 100-500 | 5-50 |
| SAR | 10-16 | 0.01-1 | 1-100 | 1-10 |
| ΣΔ | 12-20 | 0.01-0.1 | 0.1-10 | 0.1-5 |
| TI-Flash | 6-8 | 50-200 | 2000-5000 | 20-100 |
| TI-SAR | 9-11 | 10-50 | 100-500 | 10-50 |
| Photonic Flash | 6-7 | 50-100 | 1000-5000 | 50-200 |
| Photonic SAR | 7-9 | 1-10 | 100-500 | 10-50 |

**Trend**: FoM improving ~2× per decade (Moore's law for ADCs)

#### 9.6.3 Walden FoM Limitations and Corrections

**Limitation 1**: Ignores bandwidth
- Two ADCs with same ENOB, f_s but different input bandwidth
- Same FoM but different utility

**Limitation 2**: ENOB measured at specific conditions
- ENOB drops at high frequency
- FoM should specify measurement frequency

**Limitation 3**: Doesn't account for area
- FoM per area: FoM_A = FoM / Area (fJ/conv/mm²)

**Limitation 4**: ENOB vs. N confusion
- FoM uses ENOB (real) not N (nominal)
- Always report ENOB conditions: f_in, A_in, T, V_DD

#### 9.6.4 Schreier FoM: FoM_S = P/(2^{ENOB} × BW)

**Bandwidth-aware FoM** (for ΣΔ and oversampled ADCs):
FoM_S = P / (2^{ENOB} × BW)
where BW = f_s / (2 × OSR) = signal bandwidth

**For Nyquist ADCs**: BW = f_s/2
FoM_S = P / (2^{ENOB} × f_s/2) = 2 × FoM_W

**For ΣΔ ADCs**: BW = f_s/(2 OSR) ≪ f_s/2
FoM_S better reflects efficiency

**Typical FoM_S values**:
| Architecture | FoM_S (fJ/conv) |
|--------------|-----------------|
| ΣΔ (audio) | 0.01-0.1 |
| ΣΔ (instrumentation) | 0.1-1 |
| Pipeline | 1-10 |
| SAR | 2-20 |
| Flash | 20-100 |

#### 9.6.5 FoM for Photonic ADCs

**Photonic ADC FoM challenges**:
- Optical power included in P?
- Laser power (often dominant) included?
- Photonic integration loss?

**Proposed photonic FoM**:
FoM_photonic = (P_electrical + P_optical) / (f_s × 2^{ENOB})

**State-of-the-art photonic ADC FoM**:
- Photonic time-stretch: 50-200 fJ/conv
- Photonic flash (SOA-based): 100-500 fJ/conv
- Electro-optic sampling: 10-100 fJ/conv
- Microcomb-based: 50-100 fJ/conv

**Laser power consideration**:
- Mode-locked laser: 100-500 mW
- Microcomb: 10-100 mW
- Often dominates total power budget

#### 9.6.6 FoM for DACs

**DAC FoM** (analogous to ADC):
FoM_DAC = P / (f_s × 2^{ENOB})
where f_s = update rate, ENOB = effective DAC bits

**DAC FoM ranges**:
| Architecture | ENOB | f_s (GS/s) | FoM (fJ/conv) |
|--------------|------|------------|---------------|
| String | 8-12 | 0.1-1 | 1-10 |
| R-2R | 10-14 | 0.1-2 | 5-50 |
| Current-steering | 8-12 | 5-20 | 10-100 |
| ΣΔ | 12-18 | 0.01-0.5 | 0.1-5 |

**Current-steering DAC** (for high speed):
- Segmentation: unary + binary
- Dynamic element matching (DEM)
- FoM: 10-100 fJ/conv

#### 9.6.6 FoM in System-Level Design

**ADC-DAC FoM chain** (for optical link):
FoM_total = FoM_ADC + FoM_DAC + FoM_driver + FoM_TIA

**System FoM budget** (100G PAM-4 link):
| Block | FoM (fJ/conv) | Power (mW) |
|-------|---------------|------------|
| Driver DAC | 20 | 50 |
| TIA | 50 | 100 |
| ADC | 50 | 200 |
| DSP | 5 | 20 |
| **Total** | **125** | **370** |

**Optimization**: Allocate power budget based on FoM
- Best FoM block gets more speed/resolution
- Worst FoM block gets relaxed specs

#### 9.6.7 FoM Trends and Projections

**Historical trend** (Walden, 1999-2024):
FoM ∝ 2^{-year/5.5} (2× improvement per 5.5 years)
Correlates with CMOS scaling

**Projection** (2025-2035):
- 2025: 1 fJ/conv (SAR), 10 fJ/conv (Flash)
- 2030: 0.3 fJ/conv (SAR), 3 fJ/conv (Flash)
- 2035: 0.1 fJ/conv (SAR), 1 fJ/conv (Flash)

**Fundamental limit** (kT/C):
FoM_kT = kT/C
For C = 1 fF: kT/C = 4×10⁻¹⁵ J = 4 fJ
For C = 100 aF: 40 fJ

**Quantum limit** (quantum non-demolition):
FoM_quantum → 0 (with infinite resources)

#### 9.6.7 FoM for ADC-DAC Pairs in Optical Links

**Pair FoM** (for coherent transceiver):
FoM_pair = (P_ADC + P_DAC) / (f_s × 2^{ENOB_avg})

**Typical pair FoM**:
- Coherent 100G: 100-200 fJ/conv
- Coherent 400G: 50-100 fJ/conv
- IM/DD 100G: 50-100 fJ/conv

**Optimization**: Balance ADC/DAC ENOB
- ENOB_ADC = ENOB_DAC (typically)
- If channel limits: relax one side

#### 9.6.8 FoM in Advanced Technologies

**28nm CMOS**: FoM_SAR ≈ 5 fJ/conv
**16nm FinFET**: FoM_SAR ≈ 2 fJ/conv
**7nm FinFET**: FoM_SAR ≈ 1 fJ/conv
**3nm GAA**: FoM_SAR ≈ 0.5 fJ/conv (projected)

**Photonic integration impact**:
- Monolithic: lower parasitics → better FoM
- Heterogeneous: interface loss → worse FoM
- 3D stacking: TSV parasitics → mixed

**Cryogenic ADC** (4K):
- Thermal noise ↓ 100×
- kT/C limit ↓ 100×
- FoM → 0.01 fJ/conv (projected)

#### 9.6.9 FoM for Quantum and Neuromorphic ADCs

**Quantum ADC FoM**:
FoM_quantum = P / (f_s × 2^{ENOB_quantum})
ENOB_quantum → ∞ (QND measurement)
FoM → 0 (with ideal resources)

**Neuromorphic ADC FoM** (event-driven):
FoM_neuromorphic = E_per_spike / (2^{ENOB})
E_per_spike: energy per output spike
Typical: 1-10 pJ/spike
ENOB: 6-8 bits (rate-coded)

**Spiking FoM**:
FoM_spike = P_avg / (f_spike × 2^{ENOB})
f_spike: average spike rate
P_avg: average power

#### 9.6.10 FoM Standardization and Reporting

**IEEE 1241 / 1057 standards**:
- Mandatory FoM reporting conditions
- Specify: ENOB, f_s, f_in, A_in, T, V_DD
- Process corner: TT, FF, SS

**ISSCC FoM reporting guidelines**:
1. Report FoM_W and FoM_S
2. Specify measurement conditions
3. Include: process, voltage, temperature
4. Plot ENOB vs. f_in, A_in
5. Report calibration overhead power

**Best practices for papers**:
- FoM at Nyquist (f_in = f_s/2)
- FoM at max f_in (specified)
- Temperature sweep data
- Monte Carlo FoM distribution

---

*End of Piece 6. Next: Piece 7 - Schreier FoM: FoM = P/(2^ENOB × BW)*# Document 9: ADC/DAC Quantization Theory and Analog Tax
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

*End of Piece 7. Next: Piece 8 - Quantization-Aware Training: Straight-Through Estimator Gradient*# Document 9: ADC/DAC Quantization Theory and Analog Tax
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

*End of Piece 7. Next: Piece 8 - Quantization-Aware Training: Straight-Through Estimator Gradient*# Document 9: ADC/DAC Quantization Theory and Analog Tax
## Piece 8: Quantization-Aware Training: Straight-Through Estimator Gradient

---

### 9.8 Quantization-Aware Training: Straight-Through Estimator Gradient

Quantization-aware training (QAT) is essential for deploying neural networks on low-precision hardware, including optical neural networks where weight and activation precision is fundamentally limited by ADC/DAC resolution and phase shifter quantization. The Straight-Through Estimator (STE) is the key technique enabling gradient-based optimization through non-differentiable quantization operations.

#### 9.8.1 Quantization in Neural Networks

**Forward quantization**:
x_q = Q(x) = Δ · round(x/Δ)
Δ = 2^(-N+1) (for symmetric range [-1, 1))

**Backward problem**:
∂x_q/∂x = 0 almost everywhere (step function)
Standard backprop fails: ∂L/∂x = ∂L/∂x_q · ∂x_q/∂x = 0

**Naive solutions** (don't work):
- Ignore quantization in backward pass: ∂x_q/∂x = 1
- Use subgradient: ∂x_q/∂x = 0 or 1

#### 9.8.2 Straight-Through Estimator (STE)

**Core idea** (Bengio et al., 2013):
Forward: x_q = Q(x) (true quantization)
Backward: ∂x_q/∂x = 1 (identity)

**Implementation**:
```python
def quantize_ste(x):
    x_q = torch.round(x / Δ) * Δ
    return x_q - x.detach() + x  # STE: gradient = 1
```

**Gradient flow**:
∂L/∂x = ∂L/∂x_q · ∂x_q/∂x = ∂L/∂x_q · 1 = ∂L/∂x_q

**Why it works**:
- Provides non-zero gradient
- Approximates ∂Q/∂x ≈ 1 in regions where Q(x) ≈ x
- Equivalent to assuming Q(x) ≈ x + noise

**Theoretical justification** (Courbariaux et al.):
STE ≈ E[∂Q/∂x] under input noise
If input has noise σ² ≫ Δ², Q is locally linear

#### 9.8.3 STE Variants and Improvements

**1. STE with clipping**:
Forward: x_q = clip(Q(x), -1+Δ, 1-Δ)
Backward: ∂x_q/∂x = 1 (inside range), 0 (outside)

**2. STE with scaled gradient**:
∂x_q/∂x = α (α < 1 for stability)
α = 1 / (1 + Δ²/12σ²) ≈ 1 - Δ²/(12σ²)

**3. STE with noise injection** (training-time only):
Forward: x_q = Q(x + ε), ε ~ Uniform(-Δ/2, Δ/2)
Backward: STE
Equivalent to adding quantization noise during training

**4. Gumbel-Softmax relaxation** (for discrete weights):
x_q = Σ_k π_k w_k
π_k = softmax((log α_k + g_k)/τ)
τ → 0 during training

#### 9.8.4 Quantization-Aware Training (QAT) Flow

**Full QAT pipeline**:
1. Pre-trained FP32 model
2. Insert fake quantization nodes:
   - After conv/linear: quantize weights
   - After activation: quantize activations
2. Fine-tune with STE (1-10 epochs)
3. Freeze BN statistics
4. Export quantized model

**Per-channel quantization** (weights):
Separate Δ per output channel
Better accuracy than per-tensor

**Asymmetric quantization** (activations):
Range [min, max] not symmetric
Zero-point: z = -round(min/Δ)

#### 9.8.5 QAT for Optical Neural Networks

**D2NN quantization challenges**:
- Phase quantization: φ ∈ [0, 2π), K levels
- Amplitude quantization: ADC/DAC limited bits
- Phase shifter nonlinearity: non-uniform steps

**Phase quantization STE**:
Forward: φ_q = round(φ K/2π) × 2π/K
Backward: ∂φ_q/∂φ = 1

**Weight quantization** (phase = weight):
W_q = round(W / Δ_w) × Δ_w
Backward: ∂W_q/∂W = 1

**Activation quantization** (intensity):
A_q = round(A / Δ_a) × Δ_a
Backward: ∂A_q/∂A = 1

**Mixed precision QAT**:
Weights: 4-8 bits (critical for accuracy)
Activations: 4-8 bits
Gradients: 16-32 bits (FP16/FP32)

#### 9.8.6 Knowledge Distillation for QAT

**Teacher-student framework**:
Teacher: FP32 model (high accuracy)
Student: Quantized model (target precision)

**Loss function**:
L = L_task(student) + λ L_KD(teacher, student)
L_KD = KL(student || teacher) or MSE(logits)

**Benefits**:
- Recovers 1-2 bits of accuracy
- Student learns smooth decision boundaries
- Reduces quantization sensitivity

**Quantization-aware distillation**:
Teacher: FP32
Student: Quantized
KD loss on intermediate features

#### 9.8.7 Post-Training Quantization (PTQ) vs. QAT

**PTQ** (no retraining):
1. Calibrate: collect activation statistics
2. Determine Δ per layer
3. Quantize weights/activations
4. Evaluate, iterate

**PTQ techniques**:
- MinMax calibration: Δ = max(|x|)/(2^{N-1}-1)
- Percentile calibration: ignore outliers (99.9%)
- KL divergence: minimize KL(original || quantized)
- AdaRound: optimize rounding direction

**QAT vs PTQ accuracy gap**:
- PTQ: 1-5% accuracy drop (ResNet-50, 8-bit)
- QAT: <0.5% drop (with 10 epochs fine-tune)
- For 4-bit: PTQ fails, QAT essential

**Hybrid approach**:
PTQ → QAT (few epochs) → Deploy
Best trade-off: PTQ calibration + few QAT epochs

#### 9.8.8 Gradient Estimation for Non-Uniform Quantization

**Non-uniform quantization**:
x_q = Σ_k c_k · 1_{x ∈ [t_k, t_{k+1})}
t_k = decision thresholds, c_k = reconstruction levels

**STE for non-uniform**:
∂x_q/∂x = 1 (same as uniform)
But Δ_k = t_{k+1} - t_k varies

**Lloyd-Max QAT**:
Jointly optimize thresholds t_k and levels c_k
Backward: ∂L/∂t_k = ∂L/∂x_q · ∂x_q/∂t_k
∂x_q/∂t_k = c_{k+1} - c_k (for threshold)

**Learned quantization**:
Parameterize t_k, c_k as learnable
Constrained: t_0 < t_1 < ... < t_K
Use softplus for ordering: t_k = Σ_{i<k} softplus(δ_i)

#### 9.8.8 Quantization Noise Injection During Training

**Noise injection** (more accurate than STE):
Forward: x_q = Q(x + ε), ε ~ Uniform(-Δ/2, Δ/2)
Backward: ∂x_q/∂x = 1 (STE)

**Why it works**:
E_ε[Q(x + ε)] ≈ x (for smooth Q)
Gradient unbiased: E[∂Q(x+ε)/∂x] = 1

**Variance of gradient estimator**:
Var(∂L/∂x) = Var(∂L/∂x_q)
No additional variance from STE

**Comparison**:
- STE: biased but low variance
- Noise injection: unbiased but higher variance
- Practical: STE preferred (lower variance)

#### 9.8.9 QAT for Optical Phase Shifters

**Phase shifter non-idealities**:
- Nonlinear V-φ curve: φ(V) ≠ αV
- Hysteresis: φ(V) ≠ φ(V) on return
- Thermal crosstalk: φ_i depends on V_j
- Drift: φ(t) = φ_0 + α t

**Calibration-aware QAT**:
1. Characterize φ(V) per shifter
2. Build lookup table or polynomial
3. Forward: φ_actual = LUT(V)
4. Backward: STE through LUT
   ∂φ/∂V = LUT'(V) (interpolated derivative)

**Crosstalk-aware QAT**:
Forward: φ = C V (C = crosstalk matrix)
Backward: ∂φ/∂V = C^T

**Joint optimization**:
min_V L(Q(C V))
V updated via STE gradient

#### 9.8.10 QAT for Mixed-Precision and Dynamic Quantization

**Mixed-precision QAT**:
Different layers → different bit-widths
Learnable bit-width: b_i = softmax(θ_i)
Gumbel-Softmax for discrete selection

**Loss with precision penalty**:
L = L_task + λ Σ b_i

**Dynamic quantization** (input-dependent):
Δ(x) = f(x; θ) (learned)
Small Δ for important features
Large Δ for robust features

**Bit-width scheduling**:
Start: high precision (16-bit)
Gradually reduce: 16 → 12 → 8 → 4
Curriculum learning for quantization

**Hardware-aware QAT**:
Incorporate hardware constraints:
- Power budget: Σ 2^{b_i} ≤ P_max
- Area budget: Σ b_i ≤ A_max
- Latency budget: Σ f(b_i) ≤ T_max

**AutoQ** (automated quantization):
Search: bit-width per layer + quantization scheme
Reward: accuracy - λ × cost
Search: RL, evolution, gradient-based

---

*End of Piece 8. Next: Piece 9 - Hessian-Weighted Quantization: Optimal Bit-Width per Layer*# Document 9: ADC/DAC Quantization Theory and Analog Tax
## Piece 9: Hessian-Weighted Quantization: Optimal Bit-Width per Layer

---

### 9.9 Hessian-Weighted Quantization: Optimal Bit-Width per Layer

Not all layers in a neural network are equally sensitive to quantization. Hessian-weighted quantization uses second-order sensitivity information to allocate bit-widths optimally across layers, minimizing accuracy loss for a given bit budget. This is critical for optical neural networks where different layers may have different quantization constraints.

#### 9.9.1 Sensitivity Analysis for Quantization

**Quantization error** for layer i:
ΔW_i = W_i,q - W_i
ΔA_i = A_i,q - A_i

**Loss increase** (second-order Taylor):
ΔL ≈ ½ Σ_i Tr[Δθ_i^T H_i Δθ_i]
where H_i = ∂²L/∂θ_i² (Hessian w.r.t. layer i parameters)

**Quantization noise variance**:
σ²_i = Δ_i²/12 (for uniform quantizer)

**Expected loss increase**:
E[ΔL] ≈ ½ Σ_i σ²_i Tr[H_i]
= Σ_i (Δ_i²/24) Tr[H_i]

**Sensitivity metric**:
S_i = Tr[H_i] (layer sensitivity to quantization)

**Optimal bit allocation** (for fixed total bits):
Minimize Σ_i (Δ_i²/24) Tr[H_i]
Subject to: Σ_i N_i = B_total
Δ_i = 2R_i / 2^{N_i} (R_i = range)

**Solution** (continuous relaxation):
N_i = ½ log₂(Tr[H_i] R_i²) + λ
where λ chosen to satisfy Σ N_i = B_total

**Intuition**: More bits to layers with larger Hessian trace (more sensitive)

#### 9.9.2 Hessian Computation Methods

**Full Hessian** (impractical):
H = ∂²L/∂θ∂θ^T ∈ ℝ^{P×P}
P = total parameters (millions)

**Diagonal Hessian** (practical):
H_ii = ∂²L/∂θ_i²
Can be computed via Hutchinson's estimator:
H_ii ≈ (g(θ+εe_i) - g(θ))_i / ε
where g = ∇L, e_i = basis vector

**Hessian-vector product** (HVP):
Hv = ∇_θ (v^T ∇L)
Computed via forward-over-reverse autodiff
Cost: 2× backward pass

**Layer-wise Hessian trace**:
Tr[H_i] = Σ_{j∈layer_i} H_{jj}
Can be estimated via:
Tr[H_i] ≈ E_z[z^T H_i z] (z ~ N(0,I))
z^T H z = ∇_θ (z^T ∇L) · z

**K-FAC approximation** (Kronecker-Factored):
H_i ≈ A_i ⊗ G_i
A_i = input covariance, G_i = gradient covariance
Tr[H_i] = Tr[A_i] Tr[G_i]

#### 9.9.3 Optimal Bit-Width Allocation Algorithm

**Problem formulation**:
Minimize Σ_i c_i / 2^{2N_i}
Subject to: Σ N_i = B, N_i ≥ N_min

where c_i = R_i² Tr[H_i] / 12 (layer cost coefficient)

**Optimal allocation** (continuous):
N_i* = ½ log₂(c_i) + λ
λ = (B - ½ Σ log₂(c_i)) / L

**Discrete algorithm** (greedy):
1. Initialize N_i = N_min
2. While Σ N_i < B:
   Find i maximizing ΔGain_i = c_i(2^{-2N_i} - 2^{-2(N_i+1)})
   N_i += 1

**Complexity**: O((B - L·N_min) log L)

#### 9.9.4 Mixed-Precision Quantization for D2NN

**D2NN layer sensitivity**:
- Input layer: High sensitivity (error propagates)
- Middle layers: Moderate sensitivity
- Output layer: High sensitivity (directly affects loss)

**D2NN-specific sensitivity factors**:
- Optical loss: later layers have less power → lower SNR
- Phase error accumulation: earlier errors amplified
- Detection noise: final layer most affected

**Bit-width allocation example** (8-layer D2NN, 64 total bits):
| Layer | Hessian trace | Bits allocated |
|-------|---------------|----------------|
| 1 (input) | High | 10 |
| 2 | Medium | 8 |
| 3 | Medium | 8 |
| 4 | Medium | 8 |
| 5 | Medium | 8 |
| 6 | Medium | 8 |
| 7 | Medium | 8 |
| 8 (output) | High | 10 |

**Result**: 2.3% accuracy improvement vs. uniform 8-bit

#### 9.9.5 Mixed-Precision for Phase Shifters vs. ADCs

**Different components, different budgets**:
- Phase shifters: N_phase bits (continuous → quantized)
- ADCs: N_ADC bits (analog → digital)
- DACs: N_DAC bits (digital → analog)

**Joint optimization**:
Minimize Σ_i c_i,phase 2^{-2N_phase,i} + c_i,ADC 2^{-2N_ADC,i} + c_i,DAC 2^{-2N_DAC,i}
Subject to: Σ (N_phase,i + N_ADC,i + N_DAC,i) = B_total

**Coupled sensitivity**:
Phase error → weight error → activation error
ADC error → gradient error → weight update error
DAC error → weight error (during loading)

**Optimal ratio** (typical):
N_phase : N_ADC : N_DAC ≈ 1 : 1 : 1 (for inference)
N_phase : N_ADC : N_DAC ≈ 1 : 1.5 : 1 (for training)

#### 9.9.6 Hardware-Aware Mixed-Precision Search

**AutoQ** (automated quantization):
Search space: bit-width per layer, quantization scheme
Reward: accuracy - λ × cost
Cost: power, area, latency

**Search algorithms**:
- Reinforcement learning (RL)
- Evolutionary algorithms
- Bayesian optimization
- Gradient-based (Gumbel-Softmax)

**Hardware cost model**:
Power_i = P_0 + α_i 2^{N_i}
Area_i = A_0 + β_i 2^{N_i}
Latency_i = L_0 + γ_i 2^{N_i}

**Multi-objective Pareto search**:
Find Pareto front: (accuracy, power, area, latency)
Designer selects operating point

**Example** (ResNet-18, ImageNet):
| Precision | Top-1 Acc | Power | Area |
|-----------|-----------|-------|------|
| FP32 | 70.5% | 1.0W | 1.0mm² |
| Uniform 8-bit | 69.8% | 0.35W | 0.3mm² |
| Mixed (HAQ) | 70.2% | 0.28W | 0.25mm² |
| Mixed (AutoQ) | 70.3% | 0.25W | 0.22mm² |

#### 9.9.6 Quantization-Aware Mixed-Precision Training

**Differentiable bit-width**:
N_i = Σ_k k · softmax(θ_i)_k
Gumbel-Softmax for discrete selection

**Loss function**:
L = L_task + λ Σ_i c_i 2^{-2N_i}

**Gradient**:
∂L/∂θ_i = -2 ln(2) c_i 2^{-2N_i} ∂N_i/∂θ_i

**Gumbel-Softmax**:
π_k = exp((log α_k + g_k)/τ) / Σ exp(...)
N_i = Σ k π_k
g_k ~ Gumbel(0,1)
τ → 0 during training

#### 9.9.7 Quantization-Aware Mixed-Precision for Optical Systems

**Optical system constraints**:
- Phase shifter resolution: fixed by hardware (e.g., 8-bit)
- ADC resolution: fixed by hardware (e.g., 8-bit)
- Optical power budget: limits SNR

**Variable precision per layer**:
- Early layers: more bits (high sensitivity)
- Late layers: fewer bits (lower power)

**Free-space vs. waveguide**:
Free-space D2NN: phase mask resolution limited by fabrication
Waveguide D2NN: phase shifter resolution limited by DAC

**Optical power allocation**:
More optical power → higher SNR → fewer bits needed
Joint optimization: bits + optical power

#### 9.9.8 Quantization-Robust Architecture Design

**Architecture modifications for quantization robustness**:
1. **Batch normalization**: Absorbs scale variations
2. **Skip connections**: Gradient flow bypasses quantization
3. **Group normalization**: Less sensitive to batch statistics
4. **Weight standardization**: Normalizes weights per channel
5. **Quantization-friendly activations**: ReLU6, hard-sigmoid

**Quantization-aware NAS**:
Search: architecture + quantization policy
Reward: accuracy / (power × area)
Search space: layer types, connections, bit-widths

**Optical NAS**:
Search: D2NN architecture + phase quantization
Optical constraints: minimum feature size, alignment

#### 9.9.9 Mixed-Precision for Training vs. Inference

**Inference** (fixed weights):
- Weights: 4-8 bits (offline quantized)
- Activations: 4-8 bits (online quantized)
- No gradient computation

**Training** (weight updates):
- Forward: 8-bit weights/activations
- Backward: 16-32 bits (gradients)
- Weight update: 32-bit accumulation

**Mixed-precision training flow**:
1. FP32 master weights
2. Forward: quantize to 8-bit
3. Loss computation: FP32
4. Backward: FP16 gradients
5. Weight update: FP32 master + FP16 gradient
6. Quantize updated weights to 8-bit

**Gradient scaling** (for FP16):
Scale loss by S = 2^{14} (typical)
Unscale gradients before update
Prevents underflow

**Optical training specifics**:
- Optical forward: analog, high precision
- Optical backward: analog adjoint (high precision)
- Electronic weight update: digital
- Phase shifter update: DAC precision limited

#### 9.9.10 Future: Learned Quantization and Adaptive Precision

**Learned quantization**:
- Learn optimal thresholds and levels
- End-to-end differentiable
- Surpasses uniform quantization

**Adaptive precision** (runtime):
- Monitor layer sensitivity (online Hessian)
- Adjust precision per layer dynamically
- Save power during easy inputs

**Continual quantization**:
- Quantize once, adapt to new tasks
- Preserve accuracy on old tasks
- Elastic weight consolidation for quantization

**Self-supervised quantization**:
- Learn quantization from unlabeled data
- Contrastive learning with quantization
- Improves transfer learning

**Quantum-inspired quantization**:
- Variational quantization (quantum circuits)
- Quantum annealing for bit allocation
- Quantum neural network quantization

---

*End of Piece 9. Next: Piece 10 - Mixed-Precision Quantization: Knowledge Distillation and AdaRound*# Document 9: ADC/DAC Quantization Theory and Analog Tax
## Piece 10: Mixed-Precision Quantization: Knowledge Distillation and AdaRound

---

### 9.10 Mixed-Precision Quantization: Knowledge Distillation and AdaRound

Post-training quantization (PTQ) and quantization-aware training (QAT) are the two main approaches for deploying quantized neural networks. This piece covers advanced PTQ techniques—specifically AdaRound for weight rounding optimization and knowledge distillation for recovering accuracy—along with their application to mixed-precision optical neural networks.

#### 9.10.1 Post-Training Quantization (PTQ) Challenges

**Standard PTQ pipeline**:
1. Calibrate activation ranges (min/max or percentile)
2. Compute scale Δ = (max - min) / (2^N - 1)
3. Quantize weights: W_q = round(W / Δ) × Δ
4. Quantize activations per layer
5. Evaluate accuracy

**Common issues**:
- **Weight rounding**: round() is suboptimal
- **Activation range**: outliers skew scale
- **Cross-layer error propagation**: early layer errors amplify
- **No gradient information**: cannot recover lost accuracy

**Typical accuracy drop** (ResNet-50, ImageNet):
- 8-bit PTQ: 1-2% top-1 drop
- 6-bit PTQ: 5-10% drop
- 4-bit PTQ: >20% drop (often unusable)

#### 9.10.2 AdaRound: Adaptive Rounding for Weights

**Key insight** (Nagel et al., 2020):
round(x) = floor(x) + round(frac(x))
The rounding direction (up vs. down) is a discrete choice
Can be optimized to minimize task loss

**AdaRound formulation**:
For each weight w:
w_q = s · (⌊w/s⌋ + h(σ(v)))
where:
- s = scale factor
- v = learnable parameter per weight
- h(·) = sigmoid (soft rounding)
- σ(v) ∈ [0,1] → probability of rounding up

**Loss function**:
L = L_task(W_q) + λ L_reg(v)
L_reg = Σ (1 - |2h(σ(v)) - 1|)^β
Encourages h → 0 or 1 (hard rounding)
β = 2/3 (recommended)

**Optimization**:
- Freeze all other parameters
- Optimize v for 1000-5000 iterations
- Batch size: 32-64
- LR: 1e-3 to 1e-4

**Results** (ResNet-50, 4-bit weights):
- Standard PTQ: 20% drop
- AdaRound: <1% drop
- Near QAT performance without retraining

#### 9.10.3 AdaQuant: Joint Weight and Activation Quantization

**Extension to activations**:
AdaQuant optimizes both weight rounding and activation clipping thresholds

**Joint optimization**:
min_{v, t} L_task(W_q(v), A_q(t))
where:
- v: weight rounding parameters
- t: activation clipping thresholds (min/max per channel)

**Activation quantization**:
A_q = clip(A, t_min, t_max)
Δ = (t_max - t_min) / (2^N - 1)

**Clipping threshold optimization**:
t_max = argmin L_task
Can be learned per channel or per layer

**Gradient for thresholds**:
∂L/∂t = ∂L/∂A_q · ∂A_q/∂t
∂A_q/∂t = 1 (inside range), 0 (outside) → STE

#### 9.10.4 Knowledge Distillation for Quantized Networks

**Teacher-Student framework**:
- Teacher: FP32 model (high accuracy)
- Student: Quantized model (target precision)

**Distillation loss**:
L = α L_CE(y, y_student) + (1-α) L_KD(y_teacher, y_student)

**Distillation losses**:
1. **Logit matching** (Hinton):
   L_KD = KL(softmax(z_T/τ) || softmax(z_S/τ))
   τ = temperature (2-10)

2. **Feature matching** (FitNets):
   L_KD = Σ ||F_T - F_S||²

3. **Attention transfer** (AT):
   L_KD = Σ ||A_T - A_S||²
   A = attention maps

4. **Correlation congruence** (CC):
   L_KD = Σ ||C_T - C_S||²
   C = correlation matrices

**Quantization-aware distillation**:
- Teacher: FP32, fixed
- Student: Quantized, learning
- KD loss on quantized student logits
- Recovers 1-2 bits of precision

**Data-free distillation**:
- Generate synthetic data from teacher
- No real data needed
- Useful for privacy-sensitive deployment

#### 9.10.5 Mixed-Precision AdaRound with Distillation

**Combined approach**:
1. Hessian-weighted bit allocation → target bits per layer
2. AdaRound per layer at target precision
3. Distillation to recover residual accuracy

**Algorithm**:
1. Compute Hessian trace per layer (or K-FAC approx)
2. Allocate bits: N_i = ½ log₂(Tr[H_i] R_i²) + λ
3. For each layer i:
   - Run AdaRound at N_i bits
   - Fine-tune clipping thresholds
4. Distill from FP32 teacher:
   - L = L_task + λ L_KD
   - Few epochs (5-10)

**Performance** (ResNet-50, mixed 4-8 bit):
| Method | Top-1 Acc | Drop |
|--------|-----------|------|
| FP32 | 76.1% | - |
| Uniform 8-bit PTQ | 75.3% | 0.8% |
| Mixed 4-8 bit PTQ | 74.1% | 2.0% |
| + AdaRound | 75.6% | 0.5% |
| + Distillation | 75.9% | 0.2% |
| QAT (8-bit) | 76.0% | 0.1% |

#### 9.10.6 AdaRound for Optical Neural Networks

**Phase shifter AdaRound**:
Phase shifters have discrete levels (e.g., 8-bit = 256 levels)
Rounding: φ_q = φ_min + round((φ - φ_min)/Δ) × Δ

**AdaRound for phase**:
v_i per phase shifter
φ_q,i = φ_min + Δ · (⌊(φ_i - φ_min)/Δ⌋ + h(σ(v_i)))
Δ = 2π / 2^{N_phase}

**Loss function**:
L = L_task(φ_q(v)) + λ Σ (1 - |2h(σ(v_i)) - 1|)^β

**Phase shifter specific considerations**:
- Non-uniform phase response: Δ varies with voltage
- Hysteresis: different rounding for up/down
- Thermal crosstalk: coupled rounding decisions

**Coupled AdaRound**:
v = vector of all phase shifter rounding params
Crosstalk matrix C: φ_actual = C φ_q
Loss: L(φ_q(v)) with C in forward pass

#### 9.10.7 Knowledge Distillation for Optical Neural Networks

**Optical teacher-student**:
Teacher: High-precision electronic model (or high-res optical sim)
Student: Quantized optical model (D2NN/MRR/MZI)

**Optical-specific distillation**:
- Teacher: high-resolution D2NN (continuous phase)
- Student: Quantized D2NN (discrete phase levels)
- KD loss on output intensity patterns

**Diffraction-aware distillation**:
Teacher output: |U_teacher|²
Student output: |U_student|²
L_KD = || |U_teacher|² - |U_student|² ||²

**Phase-aware distillation**:
L_KD = ||φ_teacher - φ_student||² (if phase accessible)
Or: L_KD = ||ℱ{φ_teacher} - ℱ{φ_student}||² (frequency domain)

**Multi-wavelength distillation**:
Teacher: multi-wavelength (high info capacity)
Student: single-wavelength (hardware constraint)
KD transfers multi-wavelength knowledge

#### 9.10.8 Quantization for Optical Training vs. Inference

**Inference quantization** (weights fixed):
- Weights: offline quantized (AdaRound)
- Activations: online quantized (per-layer calibration)
- No backprop through quantization

**Training quantization** (weights updated):
- Forward: quantized weights/activations
- Backward: STE gradients
- Weight update: high precision (FP32 master)

**Mixed-precision training**:
- Forward pass: 8-bit weights, 8-bit activations
- Backward: 16-bit gradients (FP16)
- Weight update: FP32 master weights
- Quantize updated weights: AdaRound or STE

**Optical training flow**:
1. Electronic forward: quantized weights → optical encoder
2. Optical propagation: analog (high precision)
3. Detection: ADC quantization
4. Electronic backward: STE through ADC
5. Adjoint optical: analog (high precision)
6. Weight gradient: electronic (high precision)
7. Weight update: FP32
8. Weight quantization: AdaRound for phase shifters

#### 9.10.9 Mixed-Precision Quantization for Sparse Optical Networks

**Sparsity + quantization**:
Pruning + quantization = super-linear compression
Optical networks naturally sparse (diffraction limits)

**Sparse AdaRound**:
Only quantize non-zero weights
Zero weights stay zero
Reduces rounding variables

**Structured sparsity + quantization**:
- Channel pruning + quantization
- Block sparsity + quantization
- Optical: diffraction-limited sparsity

**Sparsity-aware bit allocation**:
More bits for dense layers
Fewer bits for sparse layers
N_i ∝ density_i × Tr[H_i]

#### 9.10.10 Future: Self-Supervised Quantization and Continual Quantization

**Self-supervised quantization**:
- Learn quantization from unlabeled data
- Contrastive loss with quantization
- Improves transfer learning performance

**Contrastive quantization**:
L = L_contrastive + λ L_quant
z_q = Q(z)
L_contrastive = -log(exp(sim(z_q, z'_q)/τ) / Σ exp(sim(z_q, z_k)/τ))

**Continual quantization**:
- Quantize model for task A
- Adapt to task B without full retraining
- Elastic weight consolidation for quantization
- Preserve quantization on important weights

**Online quantization adaptation**:
- Monitor accuracy drift
- Re-quantize sensitive layers
- Dynamic bit-width adjustment

**Quantum-inspired rounding**:
Quantum annealing for optimal rounding
Quantum approximate optimization (QAOA)
Solves discrete rounding problem globally

**Neuromorphic quantization**:
Spike-based quantization
Rate coding: precision = √N_spikes
Event-driven quantization
Natural fit for optical spike trains

---

*End of Piece 10. Document 9 complete (10 pieces). Next: Glue pieces into Doc09_Final.md*