# Document 9: ADC/DAC Quantization Theory and Analog Tax
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

*End of Piece 3. Next: Piece 4 - Effective Number of Bits (ENOB) vs. SINAD Measurement*