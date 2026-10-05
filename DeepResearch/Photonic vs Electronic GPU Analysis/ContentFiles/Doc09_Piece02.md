# Document 9: ADC/DAC Quantization Theory and Analog Tax
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

*End of Piece 2. Next: Piece 3 - Signal-to-Quantization-Noise Ratio (SQNR): 6.02N + 1.76 dB*