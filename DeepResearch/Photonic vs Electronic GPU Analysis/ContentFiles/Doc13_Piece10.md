# Document 13: Optical NVLink and Optical Circuit Switching Physics
## Piece 10: Coherent vs. Direct Detection: Sensitivity and Reach Comparison

---

### 13.10 Coherent vs. Direct Detection: Sensitivity and Reach Comparison

The choice between coherent and direct detection fundamentally determines the reach, capacity, power, and cost of optical interconnects. This piece provides a comprehensive comparison across all critical metrics for datacenter and AI cluster optical interconnects.

#### 13.10.1 Detection Principle Comparison

**Direct Detection (Intensity Modulation / Direct Detection - IM/DD)**:
```
Photocurrent: I(t) = R × P_opt(t) + n(t)
Decision: Threshold comparison (voltage level)
```
- **Principle**: Direct conversion of optical power to current
- **Information**: Amplitude only (intensity)
- **Phase information**: Lost
- **Complexity**: Low (single photodiode + TIA)

**Coherent Detection (Intradyne / Homodyne)**:
```
E_sig × E_LO* → 90° Hybrid → 4 BPDs → I_Q, Q_I
```
- **Principle**: Mix signal with Local Oscillator (LO)
- **Information**: Full field (amplitude + phase + polarization)
- **Phase recovery**: Digital Signal Processing (DSP)
- **LO requirement**: Narrow linewidth (< 100 kHz), high power (5-10 mW)

#### 13.10.2 Sensitivity Comparison

**Quantum-limited sensitivity** (BER=10⁻¹², 56 Gbaud):
| Detection | Modulation | Sensitivity (dBm) | Photons/bit |
|-----------|------------|-------------------|-------------|
| Direct (PIN) | NRZ | -19 dBm | 1000 |
| Direct (APD) | NRZ | -28 dBm | 100 |
| Direct (PIN) | PAM-4 | -16 dBm | 2000 |
| Direct (APD) | PAM-4 | -25 dBm | 200 |
| Coherent (BPSK) | BPSK | -38 dBm | 10 |
| Coherent (QPSK) | QPSK | -35 dBm | 20 |
| Coherent (16QAM) | 16QAM | -28 dBm | 80 |
| Coherent (64QAM) | 64QAM | -22 dBm | 200 |

**Sensitivity advantage**:
- **Coherent vs Direct (PIN)**: 15-20 dB advantage
- **Coherent vs APD**: 5-10 dB advantage
- **Per-bit energy**: Coherent approaches quantum limit (10-20 photons/bit)

**Quantum limit** (BER=10⁻¹², 56G):
- **Direct (ideal)**: ~1000 photons/bit
- **Coherent (ideal)**: ~10 photons/bit (100× better)

#### 13.10.3 Reach Comparison

**Reach vs. Data Rate** (SMF, 1550 nm, BER=10⁻¹²):
| Data Rate | Direct (PIN) | Direct (APD) | Coherent (QPSK) | Coherent (16QAM) | Coherent (64QAM) |
|-----------|--------------|--------------|-----------------|------------------|------------------|
| 25 Gbps | 10 km | 40 km | 80 km | 40 km | 10 km |
| 50 Gbps | 5 km | 20 km | 80 km | 40 km | 10 km |
| 100 Gbps | 2 km | 10 km | 80 km | 40 km | 5 km |
| 400 Gbps | 500 m | 2 km | 80 km | 40 km | 2 km |
| 800 Gbps | 200 m | 500 m | 80 km | 20 km | 1 km |

**Key observations**:
- **Direct detection**: Reach drops rapidly with data rate (CD limited)
- **Coherent**: Reach maintained to 80+ km (electronic CD compensation)
- **Coherent advantage**: 10-100× reach at high data rates
- **16QAM/64QAM**: Higher capacity but reduced reach

#### 13.10.4 Spectral Efficiency Comparison

**Spectral efficiency (bit/s/Hz)**:
| Modulation | Direct Detect | Coherent |
|------------|---------------|----------|
| NRZ | 0.8-1.0 | 1.0 (BPSK) |
| PAM-4 | 1.6-2.0 | 2.0 (QPSK) |
| PAM-8 | 2.4-3.0 | 3.0 (8QAM) |
| PAM-16 | 3.2-4.0 | 4.0 (16QAM) |
| PAM-16 (probabilistic) | 3.5-4.5 | 4.5-5.5 |
| CAP/DMT | 2-4 | 6-8 (64QAM) |
| Probabilistic shaping | - | +0.5-1.0 bit/s/Hz |

**Capacity per fiber (C-band, 4.8 THz)**:
| Technology | Capacity (Tbps) | Reach |
|------------|-----------------|-------|
| Direct (PAM-4, 100G) | 4.8 Tbps | 2 km |
| Coherent (DP-16QAM) | 19.2 Tbps | 80 km |
| Coherent (DP-64QAM + PS) | 40+ Tbps | 40 km |
| Flexgrid + Prob. shaping | 50+ Tbps | 80 km |

#### 13.10.5 Power Consumption Comparison

**Per-lane power breakdown** (100 Gbps equivalent):

| Component | Direct Detect (PAM-4) | Coherent (DP-16QAM) |
|-----------|----------------------|---------------------|
| Laser (Tx) | 10-20 mW | 20-50 mW (LO + Tx) |
| Modulator | 10-20 mW | 20-40 mW (IQ mod) |
| Driver | 10-20 mW | 20-40 mW |
| TIA | 10-20 mW | 20-30 mW (×2 for I/Q) |
| ADC | 10-20 mW | 40-80 mW (4× ADC) |
| DSP/CDR | 10-30 mW | 200-500 mW |
| CDR/Clock | 5-10 mW | 20-30 mW |
| **Total** | **50-120 mW** | **300-700 mW** |

**Power per bit**:
| Technology | pJ/bit | Trend |
|------------|--------|-------|
| Direct (NRZ) | 2-5 pJ | Mature |
| Direct (PAM-4) | 1-3 pJ | Improving |
| Coherent (QPSK) | 5-10 pJ | Improving |
| Coherent (16QAM) | 5-15 pJ | Improving |
| Coherent (64QAM) | 10-20 pJ | Emerging |

**Power scaling with data rate**:
- **Direct**: P ∝ R (linear-ish, limited by SerDes)
- **Coherent**: P ∝ R^0.7 (DSP scales sub-linearly)
- **Crossover**: ~200 Gbps where coherent becomes more efficient

#### 13.10.6 Cost Comparison

**Component cost** (per lane, volume pricing):
| Component | Direct Detect | Coherent |
|-----------|-------------|----------|
| Laser | $5-10 | $20-50 (Tx + LO) |
| Modulator | $5-15 | $30-60 (IQ mod) |
| Photodetector | $5-10 | $50-100 (4× BPD) |
| Driver/TIA | $5-10 | $20-30 |
| ADC/DSP | $10-20 | $100-200 |
| Packaging | $5-10 | $30-50 |
| **Total** | **$30-65** | **$260-470** |

**Cost per Gbps**:
- **Direct (100G PAM-4)**: $0.50-1.00/Gbps
- **Coherent 400ZR**: $1.50-2.50/Gbps
- **Coherent 800ZR**: $1.00-2.00/Gbps
- **Coherent 1.6T**: $0.80-1.50/Gbps

**Cost crossover**: ~200 Gbps where coherent becomes cost-competitive

#### 13.10.5 DSP Complexity Comparison

**Direct detection DSP**:
```
Rx → TIA → ADC → FFE → CDR → DFE → Decoder
```
- **Complexity**: Low-Medium
- **Operations**: FFE (5-10 taps), DFE (5-10 taps)
- **Precision**: 4-6 bit ADC, 6-8 bit DFE
- **Power**: 10-30 mW
- **Latency**: < 10 ns

**Coherent DSP**:
```
ADC ×4 → Resample → CD Comp → PMD Comp → Carrier Recovery → TED → Equalizer → Decoder
```
- **Operations**: CD (FFT), PMD (MIMO), Carrier recovery (VV), TED, Equalizer (LMS/RLS)
- **Precision**: 6-8 bit ADC, 12-16 bit internal
- **Operations**: 1000+ GOPS/lane
- **Power**: 200-500 mW
- **Latency**: 100-500 ns

**DSP operations per bit**:
| Algorithm | Ops/bit (Direct) | Ops/bit (Coherent) |
|-----------|------------------|---------------------|
| Equalization | 10-20 | 200-500 |
| CDR | 5-10 | 50-100 |
| Decoding | 10-20 | 50-100 |
| **Total** | **25-50** | **300-700** |

#### 13.10.6 Sensitivity to Impairments

| Impairment | Direct Detection | Coherent |
|------------|------------------|----------|
| Chromatic Dispersion | Severe (limits reach) | Compensated digitally |
| PMD | Severe | Compensated (MIMO) |
| Polarization Dependent Loss | Moderate | Tracked (MIMO) |
| Nonlinearities (SPM/XPM/FWM) | Severe | Partially compensated |
| Laser Phase Noise | N/A | Critical (Carrier recovery) |
| LO RIN | N/A | Transferred to signal |
| LO Phase Noise | N/A | Critical (linewidth req.) |
| ADC Quantization | Moderate | Critical (ENOB > 4.5) |
| DAC Nonlinearity | Moderate | Critical (constellation) |

#### 13.10.7 Application Decision Matrix

| Application | Reach | Data Rate | Recommended | Rationale |
|-------------|-------|-----------|-------------|-----------|
| Rack-to-Rack (SR) | < 100m | ≤ 200G | Direct (PAM-4) | Lowest cost/power |
| Row-to-Row (DR) | 500m | 200-400G | Direct (PAM-4) / APD | Cost-effective |
| Building-to-Building (FR) | 2km | 400G | APD / Coherent | Reach requirement |
| Campus (LR) | 10km | 400G | Coherent (DP-QPSK) | Reach + capacity |
| Metro (ER) | 40km | 400G | Coherent (DP-16QAM) | Capacity + reach |
| Long-Haul (ZR/ZR+) | 80-120km | 400-800G | Coherent (16/64QAM) | Max capacity/reach |
| AI Cluster (SR) | 100m | 400-800G | Direct (PAM-4) / CPO | Density, power |
| AI Cluster (DR) | 500m | 800G-1.6T | Coherent / CPO | Bandwidth density |
| Inter-DC (ZR/ZR+) | 80-120km | 800G-1.6T | Coherent (64QAM) | Max capacity |

#### 13.10.8 Technology Evolution Roadmap

**Direct Detection Roadmap**:
| Year | Rate | Modulation | Reach | Key Tech |
|------|------|------------|-------|----------|
| 2024 | 100G | PAM-4 | 2km | APD, DSP |
| 2025 | 200G | PAM-4 | 2km | APD, 112Gbaud |
| 2026 | 400G | PAM-4 | 2km | 112Gbaud, DSP |
| 2026 | 400G | PAM-8 | 1km | 8-level, DSP |
| 2027 | 800G | PAM-4 | 2km | 224Gbaud |
| 2028 | 1.6T | PAM-4 | 2km | 224Gbaud, DSP |
| 2029 | 3.2T | PAM-4/8 | 1km | 224Gbaud, advanced DSP |

**Coherent Roadmap**:
| Year | Rate | Modulation | Reach | Key Tech |
|------|------|------------|-------|----------|
| 2024 | 400G | DP-16QAM | 120km | KP4 |
| 2025 | 400G | DP-16QAM | 240km | oFEC |
| 2025 | 800G | DP-16QAM | 120km | oFEC |
| 2026 | 800G | DP-64QAM | 80km | oFEC |
| 2027 | 1.6T | DP-64QAM | 120km | LDPC+RS |
| 2028 | 1.6T | Prob. 64QAM | 240km | PS + LDPC |
| 2029 | 3.2T | Prob. 64QAM | 240km | Advanced FEC |

#### 13.10.9 Economic Crossover Analysis

**Total Cost of Ownership (TCO) model**:
```
TCO = CapEx + OpEx (5 years)
CapEx = Optics + Electronics + Installation
OpEx = Power × PUE × $/kWh × 5 years + Maintenance
```

**Break-even analysis** (100km link, 5-year TCO):
| Technology | CapEx ($/km) | OpEx ($/km/yr) | 5-yr TCO ($/km) |
|------------|--------------|----------------|-----------------|
| Direct (PAM-4, 100G) | $500 | $200 | $1,500 |
| Coherent (QPSK) | $800 | $150 | $1,550 |
| Coherent (16QAM) | $1,000 | $120 | $1,600 |

**Crossover distance** (Direct vs Coherent):
- **100G**: ~50 km (coherent wins beyond)
- **400G**: ~2 km (coherent wins beyond)
- **800G**: < 1 km (coherent wins)
- **1.6T**: Direct not viable (> 100m)

**Key insight**: Coherent becomes mandatory above 200G for any significant reach

#### 13.10.10 Future: Convergence and Hybrid Architectures

**Convergent architectures**:
1. **Coherent Lite (Direct-Detect Coherent)**:
   - Simplified DSP (no carrier recovery)
   - Self-coherent (delay-line interferometer)
   - Target: 200-400G, 10km, 50% coherent power

2. **Kramers-Kronig (KK) Receiver**:
   - Direct detect + DSP (retrieve phase)
   - Single photodiode + DSP
   - Single-sideband (SSB) transmission required

3. **Self-Coherent / Delay-Line Interferometer**:
   - DLI + balanced detection
   - DPSK/DQPSK demodulation
   - No LO required

4. **Hybrid Direct-Coherent**:
   - Short reach: Direct detect
   - Long reach: Coherent mode
   - Shared transceiver hardware

**Quantum-enhanced detection**:
- **Squeezed state receiver**: 3 dB sensitivity improvement
- **Quantum illumination**: Target detection in noise
- **CV-QKD**: Coherent states + homodyne detection

**Ultimate convergence**:
- **Unified transceiver**: Programmable DSP for direct/coherent
- **Software-defined**: Mode switch via firmware
- **Economy of scale**: Single volume product for all reaches

---

*End of Piece 10. Document 13 complete (10 pieces). Next: Glue pieces into Doc13_Final.md*