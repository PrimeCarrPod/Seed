# Document 9: ADC/DAC Quantization Theory and Analog Tax
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

*End of Piece 4. Next: Piece 5 - ADC Architectures: Flash, SAR, Pipeline, Time-Interleaved*