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

*End of Piece 1. Next: Piece 2 - Quantization Noise Power: Δ²/12 Derivation for Uniform Quantizer*