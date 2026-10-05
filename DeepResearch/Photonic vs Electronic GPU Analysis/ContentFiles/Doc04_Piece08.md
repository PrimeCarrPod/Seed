# Document 4: RC Delay Physics and Transmission Line Theory
## Piece 8: PAM-4 vs. NRZ Spectral Efficiency and SNR Requirements

---

### 4.8 PAM-4 vs. NRZ Spectral Efficiency and SNR Requirements

Pulse Amplitude Modulation with 4 levels (PAM-4) doubles the data rate per symbol compared to Non-Return-to-Zero (NRZ) but requires significantly higher SNR. This piece analyzes the fundamental trade-offs, spectral efficiency, and implementation challenges of PAM-4 for high-speed serial links.

#### 4.8.1 Modulation Format Comparison

**NRZ (2-level)**:
- Symbols: {0, 1} or {-1, +1}
- 1 bit/symbol
- Bandwidth: ≈ 0.5 × Baud rate (Nyquist)
- Eye: 1 opening

**PAM-4 (4-level)**:
- Symbols: {-3, -1, +1, +3} (normalized)
- 2 bits/symbol
- Bandwidth: ≈ 0.5 × Baud rate (same symbol rate)
- Eye: 3 openings (inner, middle, outer)

**Spectral efficiency**:
- NRZ: 1 bit/s/Hz (at Nyquist)
- PAM-4: 2 bits/s/Hz (at Nyquist)
- 2× improvement in bandwidth efficiency

#### 4.8.2 SNR Requirements

**AWGN channel capacity**:
C = B log₂(1 + SNR)

**For target rate R = 2B (PAM-4 at Nyquist)**:
SNR_min = 2^{R/B} - 1 = 2² - 1 = 3 (4.77 dB)

**For NRZ at R = B**:
SNR_min = 2¹ - 1 = 1 (0 dB)

**Practical SNR** (with coding gap, implementation loss):
- NRZ: ~10-12 dB for BER 10⁻¹²
- PAM-4: ~18-22 dB for BER 10⁻¹²
- Gap: ~9.6 dB theoretical, ~10-12 dB practical

**Level spacing**:
NRZ: ΔV = 2 (from -1 to +1)
PAM-4: ΔV = 2 (between adjacent levels)
But outer levels at ±3 → peak voltage 3× NRZ

**Power scaling** (for same ΔV):
P_PAM4 / P_NRZ = (3² + 1² + 1² + 3²)/4 / 1 = 20/4 = 5×
5× power for same eye opening!

#### 4.8.3 BER Analysis for PAM-4

**Symbol error probability** (AWGN, Gray coding):
P_s ≈ 3/2 erfc(ΔV/(2√2 σ))

**Bit error rate** (Gray coded):
P_b ≈ P_s/2 ≈ 3/4 erfc(ΔV/(2√2 σ))

**Required SNR per bit**:
E_b/N₀ = (ΔV²/4) / (2σ²) = ΔV²/(8σ²)

For P_b = 10⁻¹²: erfc⁻¹(4×10⁻¹²/3) ≈ 6.5
ΔV/(2√2 σ) ≈ 6.5 → ΔV/σ ≈ 18.4
E_b/N₀ ≈ (18.4)²/8 ≈ 42 (16.2 dB)

With coding gain (LDPC, ~3-4 dB):
Required SNR ≈ 12-13 dB

#### 4.8.4 Eye Diagram and Level Crossing

**Three eye openings**:
1. Inner eye: between -1 and +1 (smallest margin)
2. Middle eye: between -3 and -1, +1 and +3
3. Outer eye: between -3 and +3 (not used for slicing)

**Slicer thresholds**: V_th1 = -2, V_th2 = 0, V_th3 = +2

**Eye heights**:
- Inner eye: most sensitive to noise
- Level compression: non-linear channel distorts levels
- Adaptive slicer thresholds needed

**Equalization impact**:
- FFE: pre-emphasis helps inner eye
- CTLE: boosts high-freq, helps all eyes
- DFE: post-cursor cancellation critical

#### 4.8.5 Noise Analysis

**Thermal noise** (kT/C, kT/R):
σ_th² = kT/C_eq
Same for NRZ and PAM-4

**Shot noise** (optical):
σ_sh² = 2qI B
Same for both

**Crosstalk noise**:
NRZ: adds to 1 decision boundary
PAM-4: adds to 3 boundaries → 3× vulnerability

**ISI noise**:
Channel memory causes level spreading
PAM-4: 4 levels → more ISI states (4^L vs 2^L)
More severe ISI for same channel

**Jitter noise**:
Timing jitter → voltage noise at crossing
σ_V = σ_t × (dV/dt)
PAM-4: 3 crossings per UI → 3× jitter sensitivity

#### 4.8.6 Forward Error Correction (FEC)

**Required for PAM-4** at high speeds
Pre-FEC BER target: 10⁻⁴ to 10⁻⁶
Post-FEC BER: < 10⁻¹⁵

**Common FEC schemes**:
- **RS(544,514)** (KP4): 10-bit symbols, 30 parity
  Overhead: 5.8%, coding gain: ~6 dB
- **RS(272,258)** (KP4 short): overhead 5.4%
- **LDPC**: soft decision, higher gain
  Used in 400G/800G Ethernet

**FEC overhead**:
- Latency: ~100-500 ns
- Power: ~5-15 mW
- Area: ~1-2 mm²

**Net coding gain (NCG)**:
NCG = SNR_uncoded - SNR_coded (at target BER)
PAM-4 with KP4: NCG ≈ 5.5-6 dB

#### 4.8.7 Transmitter Requirements

**Linearity**:
- DAC resolution: 6-8 bits (4 levels + margin)
- INL/DNL < 0.5 LSB
- Level spacing accuracy: < 5%

**Pre-emphasis (Tx FFE)**:
- Pre-cursor: 1-2 taps
- Post-cursor: 2-4 taps
- Tap resolution: 4-5 bits
- De-emphasis range: -6 to +6 dB

**Rise/fall time matching**:
- Symmetric edges for all transitions
- DCD < 0.05 UI
- Slew rate control per transition

**Clock jitter**:
- RJ < 0.1 UI (PAM-4 tighter than NRZ)
- PJ < 0.02 UI

#### 4.8.8 Receiver Requirements

**CTLE**:
- Peaking: 6-15 dB
- Tunable zero/pole
- Low noise figure: < 3 dB

**ADC** (for DSP-based RX):
- Resolution: 5-7 bits (4 levels + overhead)
- Sampling: 1-2× Baud rate
- ENOB: > 4.5 bits

**DSP equalization**:
- FFE: 5-10 taps (fractionally spaced)
- DFE: 10-20 taps (symbol spaced)
- Adaptation: LMS, RLS, or blind

**Slicer/DFE**:
- 3 slicers (for 3 thresholds)
- Soft decisions for LDPC
- Error propagation control

#### 4.8.9 Power and Area Comparison

| Parameter | NRZ (56G) | PAM-4 (56G) | PAM-4 (112G) |
|-----------|-----------|-------------|--------------|
| Data rate | 56 Gbps | 112 Gbps | 224 Gbps |
| Baud rate | 56 GBd | 56 GBd | 112 GBd |
| Tx power | 15 mW | 30 mW | 60 mW |
| Rx power | 25 mW | 50 mW | 100 mW |
| Total power | 40 mW | 80 mW | 160 mW |
| pJ/bit | 0.7 | 0.7 | 0.7 |
| Area | 0.5 mm² | 0.8 mm² | 1.2 mm² |

**Key insight**: pJ/bit similar, but PAM-4 enables 2× bandwidth
Power scales with data rate, not modulation format

#### 4.8.10 Future: Beyond PAM-4

**PAM-8 (3 bits/symbol)**:
- 3× spectral efficiency
- SNR requirement: ~12 dB more than PAM-4
- 7 decision boundaries
- Challenging for electrical, possible for optical

**CAP (Carrierless Amplitude Phase)**:
- 2D modulation (QAM-like)
- Better spectral shaping
- Used in DSL, some optical

**DMT/OFDM (Discrete Multi-Tone)**:
- Bit/power loading per subcarrier
- Adapts to channel response
- High PAPR (peak-to-average power ratio)

**Probabilistic constellation shaping (PCS)**:
- Non-uniform symbol distribution
- Matches capacity-achieving distribution
- 0.5-1 dB gain over uniform

**Geometric shaping**:
- Constellation points on sphere (spherical codes)
- Optimized for AWGN
- 0.2-0.5 dB gain

**Conclusion**: PAM-4 is sweet spot for 56-112 Gbps electrical
Beyond: coherent optical (QAM), or new modulation formats

---

*End of Piece 8. Next: Piece 9 - Channel Operating Margin (COM) Metric Derivation*