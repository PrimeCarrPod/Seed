# Document 13: Optical NVLink and Optical Circuit Switching Physics
## Piece 7: Clock and Data Recovery (CDR) in Optical Domain

---

### 13.7 Clock and Data Recovery (CDR) in Optical Domain

Clock and Data Recovery (CDR) is the critical interface between the optical and digital domains, recovering both clock timing and data from the received optical signal. As data rates push beyond 100 Gbaud, CDR architectures must evolve to meet stringent jitter, power, and area constraints.

#### 13.7.1 CDR Fundamentals

**CDR function**:
```
Input: Noisy serial data stream (optical → electrical)
Output: Recovered clock (f_clk) + Retimed data (clean)
```

**CDR requirements** (56-224 Gbaud PAM-4):
| Parameter | Requirement | Challenge |
|-----------|-------------|-----------|
| Jitter tolerance | > 0.5 UIpp | High-frequency jitter |
| Jitter generation | < 0.1 UIpp | Low intrinsic jitter |
| Lock time | < 10 ms | Fast acquisition |
| Frequency offset | ±100 ppm | Crystal tolerance |
| Power | < 50 mW/lane | Power budget |
| Area | < 0.1 mm²/lane | Integration density |

**Jitter decomposition**:
```
Jitter_total² = Jitter_RJ² + Jitter_DJ²
RJ (Random): Gaussian, unbounded
DJ (Deterministic): Bounded, pattern-dependent
  - DDJ: Data-dependent (ISI)
  - BUJ: Bounded uncorrelated (crosstalk)
  - PJ: Periodic (PLL spurs, clock feedthrough)
```

#### 13.7.2 CDR Architectures

**1. Bang-Bang CDR (Alexander Phase Detector)**:
```
Phase detector: PD = sign(x[n]) × (x[n-1] - x[n+1])
```
- **Operation**: Bang-bang (1-bit) phase detection
- **Loop filter**: Digital accumulator (1st/2nd order)
- **Pros**: Simple, low power, no linearity requirement
- **Cons**: Jitter peaking, limited lock range, meta-stability
- **Use case**: 10-56 Gbaud PAM-4, high-volume

**2. Linear CDR (Hogge / Mueller-Muller)**:
```
Hogge: PD = x[n-1] × (x[n] - 0.5)
Mueller-Muller: PD = x[n]×x[n-2] - x[n-1]×x[n-1]
```
- **Operation**: Linear phase detection (multi-bit)
- **Pros**: Better jitter performance, no meta-stability
- **Cons**: Requires linear ADC/DAC, higher power
- **Use case**: Coherent, high-performance

**3. Oversampling CDR**:
- **Architecture**: N× oversampling (N=2, 4, 8)
- **Phase detection**: Interpolation / polyphase filter
- **Advantage**: No strict timing alignment needed
- **Disadvantage**: N× ADC power, complex DSP

**4. Injection-Locked CDR (IL-CDR)**:
```
Slave oscillator + Injection locking → Phase alignment
```
- **Principle**: Free-running oscillator injection-locked to data
- **Advantage**: No phase detector, ultra-low power
- **Challenge**: Lock range, pulling range, process variation
- **Use case**: Ultra-low power, short reach

#### 13.7.3 CDR for PAM-4 Signaling

**PAM-4 challenges**:
- **3 eye openings**: 3 decision thresholds
- **Unequal eye heights**: Inner eyes smaller
- **Level crossing**: More zero crossings (clock content)

**PAM-4 CDR architectures**:

**1. 3-eye independent CDRs**:
```
3 independent CDRs (one per eye)
Phase alignment → Weighted combination
```
- **Pros**: Independent optimization per eye
- **Cons**: 3× area/power, phase alignment complexity

**2. Multi-level CDR (ML-CDR)**:
```
Single CDR with multi-level slicer
Phase detection: Weighted sum of level crossings
```
- **Phase detector**: Weighted sum of edge crossings
- **Weights**: Optimized for PAM-4 transition density
- **Advantage**: Single CDR, lower power/area

**3. Feedforward Equalization (FFE) + CDR co-design**:
```
FFE → CDR (joint optimization)
```
- **Joint adaptation**: FFE taps + CDR phase
- **Benefit**: Compensates ISI before phase detection
- **Challenge**: Joint optimization complexity

#### 13.7.4 CDR for Coherent Detection

**Intradyne coherent receiver**:
```
Signal + LO → 90° Hybrid → 4 BPDs → ADC → DSP
```

**Digital CDR (in DSP)**:
```
ADC → Resampler → Timing Recovery → Carrier Recovery → Equalizer
```

**Timing recovery algorithms**:

**1. Gardner TED (Non-data-aided)**:
```
TED = (y[n] - y[n-1]) × (y[n-1/2] - y[n-3/2])
```
- **Requirement**: ≥ 2 samples/symbol
- **S-curve**: Odd symmetry, zero at optimal phase
- **Advantage**: No training sequence needed

**2. Mueller-Müller TED**:
```
TED = y[n] × (y[n-1] - y[n+1])  (for real)
TED = Re{y[n] × (y*[n-1] - y*[n+1])} (complex)
```
- **Requirement**: 1 sample/symbol (symbol-spaced)
- **Advantage**: Lower oversampling

**3. Zero-Crossing / Spectral TED**:
- **Zero-crossing**: Time between level crossings
- **Spectral**: Spectral line at symbol rate
- **Use case**: Coherent, high OSNR

**Carrier recovery (phase estimation)**:
1. **Viterbi-Viterbi** (M-th power):
   - M=4 for QPSK, M=8 for 8QAM, M=16 for 16QAM
   - Complexity: O(M)

2. **Pilot-aided**:
   - Known pilot symbols
   - Lower complexity, overhead

3. **Blind (Blind phase search)**:
   - Test multiple phase hypotheses
   - Parallel processing, high complexity

#### 13.7.5 CDR for Optical NVLink (PAM-4, 100-224 Gbaud)

**NVLink CDR requirements**:
| Generation | Data Rate | Modulation | CDR Type |
|------------|-----------|------------|----------|
| NVLink 4.0 | 50 Gbps | NRZ | Bang-bang |
| NVLink 5.0 | 100 Gbps | PAM-4 | Multi-level |
| NVLink 6.0 | 200 Gbps | PAM-4 | ML-CDR + FFE |
| Optical 7.0 | 448 Gbps | PAM-4 | ML-CDR + DSP |
| Optical 8.0 | 896 Gbps | Coherent | DSP-based |

**PAM-4 CDR at 100-224 Gbaud**:
- **Architecture**: ML-CDR + 3-tap FFE + 5-tap DFE
- **ADC**: 4-6 bit flash/SAR (80-120 GS/s)
- **DSP**: 7nm/5nm CMOS, 200-500 mW/lane
- **Latency**: < 10 ns (CDR + FFE + DFE)

**Jitter budget** (224 Gbaud PAM-4):
| Component | Allocation (UIpp) |
|-----------|-------------------|
| Tx jitter | 0.15 |
| Channel ISI | 0.20 |
| Crosstalk | 0.10 |
| Rx noise | 0.10 |
| CDR tracking | 0.05 |
| **Total** | **0.60** (target < 0.7) |

#### 13.7.5 CDR for Coherent Optical (400ZR/800ZR/1600ZR)

**Coherent DSP chain**:
```
ADC → Resampler → CD → PMD → Carrier Recovery → TED → Equalizer → Decoder
```

**Digital resampler**:
- **Input**: ADC samples (2-4 samples/symbol)
- **Output**: 2 samples/symbol (timing aligned)
- **Method**: Polyphase filter / Farrow structure
- **Complexity**: O(N log N) with FFT

**Carrier recovery** (Digital PLL):
```
PLL: θ̂[n] = θ̂[n-1] + K_p × e[n] + K_i × Σ e[k]
```
where e[n] = phase error from carrier recovery

**Digital CDR advantages**:
- **Flexibility**: Software-defined algorithms
- **Adaptability**: Per-channel optimization
- **Monitoring**: Full visibility (TED, eye, constellation)
- **Upgradability**: Firmware updates

**Power/area trade-off**:
- **ASIC CDR**: 5-10 mW/lane, 0.05 mm²
- **DSP CDR**: 50-200 mW/lane, 0.5-1 mm² (in DSP)
- **Hybrid**: Analog front-end + digital back-end

#### 13.7.6 CDR in Optical Circuit Switching

**OCS control plane CDR**:
- **Function**: Monitor link health, not data recovery
- **Rate**: Low speed (1-10 Gbps) monitoring channels
- **Function**: Link monitoring, fault detection

**Data plane CDR (OCS data path)**:
- **Transparent**: No CDR in OCS (all-optical)
- **End-point CDR**: At Tx/Rx endpoints only
- **Monitoring**: Tap + slow CDR for monitoring

**All-optical CDR (research)**:
- **All-optical clock recovery**: Mode-locked laser, Kerr comb
- **All-optical phase detection**: Nonlinear interferometer
- **Potential**: Sub-ps jitter, no OEO conversion
- **Status**: Research (not commercial)

#### 13.7.7 CDR Jitter Analysis

**Jitter transfer function**:
```
H_jitter(s) = θ_out(s)/θ_in(s) = H_CDR(s)
```

**Peaking specification**:
- **Peaking**: < 0.1 dB (0.1 dB typical target)
- **Bandwidth**: f_BW = f_baud / (10-20) for CDR

**Jitter tolerance mask** (IEEE 802.3, OIF):
```
Low freq: High tolerance (tracking)
Mid freq: Minimum tolerance (peaking region)
High freq: Low tolerance (attenuation)
```

**Jitter generation sources**:
| Source | Contribution | Mitigation |
|--------|--------------|------------|
| VCO phase noise | Core jitter | Low-noise VCO, clean supply |
| Supply noise | Substrate coupling | LDOs, isolation |
| Substrate noise | Digital switching | Guard rings, deep N-well |
| Reference clock | Crystal/jitter | Low-jitter XO, PLL cleanup |
| Data pattern | DDJ | FFE/DFE, scrambling |

#### 13.7.7 CDR Power and Area Optimization

**Power breakdown** (56 Gbaud PAM-4 CDR):
| Block | Power (mW) | Percentage |
|-------|------------|------------|
| Phase detector | 15 | 25% |
| Loop filter / accumulator | 5 | 8% |
| DCO / VCO | 20 | 33% |
| Frequency divider | 5 | 8% |
| Phase interpolator | 10 | 17% |
| Clock distribution | 5 | 8% |
| **Total** | **60** | **100%** |

**Area breakdown** (28nm CMOS):
| Block | Area (mm²) |
|-------|------------|
| Phase detector | 0.01 |
| Loop filter | 0.005 |
| DCO/VCO | 0.03 |
| Divider | 0.005 |
| Phase interpolator | 0.02 |
| **Total** | **0.07** |

**Power reduction techniques**:
1. **Sub-sampling CDR**: Reduce clock frequency
2. **Injection-locked**: Eliminate PD
3. **Gear-box CDR**: Lower frequency CDR + gearbox
2. **Adaptive bandwidth**: Dynamic BW adjustment
3. **Sub-sampling ADC**: Lower ADC rate

#### 13.7.7 CDR Testing and Characterization

**Test methodologies**:
1. **Jitter tolerance**: Sinusoidal jitter injection
2. **Jitter transfer**: Input jitter → output jitter
3. **Jitter generation**: Inherent CDR jitter
4. **Lock time**: Acquisition time from cold start
5. **Frequency offset**: Lock range (± ppm)

**Test equipment**:
- **BERT**: Bit Error Rate Tester (with jitter injection)
- **Oscilloscope**: Real-time scope (> 100 GHz BW)
- **Phase noise analyzer**: VCO/clock phase noise
- **TDR/TDT**: Time domain reflectometry

**Compliance testing**:
- **IEEE 802.3**: Ethernet CDR specs
- **OIF**: CEI-56G, CEI-112G, CEI-224G
- **PCIe**: PCIe 6.0/7.0 CDR specs
- **NVLink**: NVIDIA proprietary specs

#### 13.7.8 Future: All-Optical and Quantum CDR

**All-optical CDR**:
- **Kerr comb + filtering**: Mode-locked laser + filtering
- **Nonlinear loop mirror**: NOLM-based clock recovery
- **Four-wave mixing**: FWM-based clock recovery
- **Advantage**: No OEO, sub-ps jitter
- **Challenge**: Power, integration, stability

**Quantum-enhanced CDR**:
- **Squeezed light**: Sub-SQL phase estimation
- **Quantum non-demolition**: QND measurement
- **Entanglement-assisted**: Entanglement-assisted synchronization
- **Potential**: Heisenberg-limited timing

**Neuromorphic CDR**:
- **Spiking neural network**: Event-driven CDR
- **Spike-timing-dependent plasticity**: Adaptive CDR
- **Event-driven**: Spike-based timing recovery
- **Power**: µW-level (event-driven)

---

*End of Piece 7. Next: Piece 8 - Bit Error Rate (BER) vs. Q-factor for PAM-4 Optical*