# Document 13: Optical NVLink and Optical Circuit Switching Physics
## Piece 8: Bit Error Rate (BER) vs. Q-factor for PAM-4 Optical

---

### 13.8 Bit Error Rate (BER) vs. Q-factor for PAM-4 Optical

The relationship between Bit Error Rate (BER) and Q-factor is fundamental to optical communication system design, especially for PAM-4 modulation where three decision thresholds create unequal eye openings and different error probabilities for each level transition.

#### 13.8.1 BER and Q-factor Fundamentals

**Q-factor definition** (for Gaussian noise):
```
Q = (μ₁ - μ₀) / (σ₁ + σ₀)
```
where μ₁, μ₀ = mean signal levels, σ₁, σ₀ = noise standard deviations

**BER for binary signaling** (AWGN channel):
```
BER = ½ erfc(Q/√2) ≈ (1/√(2π)Q) exp(-Q²/2)  (for Q > 3)
```

**Q-factor to BER conversion**:
| Q-factor | BER | Application |
|----------|-----|-------------|
| 3.0 | 1.35×10⁻³ | Marginal |
| 4.0 | 3.17×10⁻⁵ | FEC threshold |
| 5.0 | 2.87×10⁻⁷ | Good |
| 6.0 | 9.87×10⁻¹⁰ | Excellent |
| 7.0 | 1.28×10⁻¹² | Target (pre-FEC) |
| 8.0 | 6.22×10⁻¹⁶ | Ultra-low |

**Inverse Q-function** (for target BER):
```
Q = √2 × erfc⁻¹(2 × BER)
```

#### 13.8.2 PAM-4 BER Analysis

**PAM-4 signal levels**:
```
Level 0: -3A (00)
Level 1: -A  (01)
Level 2: +A  (10)
Level 3: +3A (11)
```
where A = amplitude scaling factor

**Three decision thresholds**:
- Th₁ = -2A (between Level 0 and 1)
- Th₂ = 0 (between Level 1 and 2)
- Th₃ = +2A (between Level 2 and 3)

**Symbol error probability** (equiprobable symbols, AWGN):
```
P_s = ¼ [ erfc(Q₁/√2) + erfc(Q₂/√2) + erfc(Q₃/√2) ]
```
where Q_i = ΔV_i / (2σ), ΔV_i = voltage spacing at threshold i

**Bit error rate** (Gray coding: 00, 01, 11, 10):
```
BER ≈ P_s / 2  (for Gray coding, high SNR)
```
More precisely:
```
BER = ⅛ [ 2erfc(Q₁/√2) + 3erfc(Q₂/√2) + 2erfc(Q₃/√2) ]
```
where Q₁ = A/σ, Q₂ = A/σ, Q₃ = A/σ (for equal spacing, equal noise)

**Equal spacing, equal noise**:
```
Q₁ = Q₂ = Q₃ = Q = A/σ
P_s = ¾ erfc(Q/√2)
BER ≈ ⅜ erfc(Q/√2)
```

#### 13.8.3 PAM-4 Eye Asymmetry and Unequal Noise

**Real-world asymmetries**:
1. **Level spacing asymmetry**: Inner eyes smaller than outer
2. **Noise asymmetry**: Different noise on each level
3. **ISI asymmetry**: Different ISI patterns per level
4. **Nonlinearity**: DAC/ADC/TIA nonlinearity

**General BER expression** (unequal spacing, unequal noise):
```
BER = ⅛ [ 
  erfc((μ₁-μ₀)/(√2(σ₁+σ₀))) + 
  2×erfc((μ₂-μ₁)/(√2(σ₂+σ₁))) + 
  erfc((μ₃-μ₂)/(√2(σ₃+σ₂))) 
]
```
where μ_i, σ_i = mean and std of level i

**Eye asymmetry parameters**:
- **Eye height ratio**: H_inner / H_outer
- **Eye width ratio**: W_inner / W_outer
- **Level separation ratio**: ΔV_inner / ΔV_outer

**Typical PAM-4 eye asymmetry** (56 Gbaud, 100m SMF):
- Outer eye height: 100%
- Inner eye height: 60-80%
- Q_inner / Q_outer ≈ 0.7-0.9

#### 13.8.4 PAM-4 with FEC (Forward Error Correction)

**KP4 FEC (RS(544,514))**:
- **Code**: RS(544, 514) over GF(2¹⁰)
- **Overhead**: 5.84%
- **Correction capability**: t = 15 symbols
- **Pre-FEC BER target**: 10⁻⁴ to 10⁻⁶
- **Post-FEC BER**: < 10⁻¹⁵

**Required pre-FEC Q-factor** (for KP4):
| Pre-FEC BER | Required Q-factor | Margin to KP4 |
|-------------|-------------------|---------------|
| 10⁻³ | 4.5 | Minimal |
| 5×10⁻⁴ | 4.8 | Comfortable |
| 10⁻⁴ | 5.1 | Good |
| 5×10⁻⁵ | 5.5 | Robust |
| 10⁻⁵ | 5.9 | Very robust |

**Net coding gain (NCG)**:
```
NCG = 10 log₁₀(Q_pre² / Q_post²) ≈ 5.5-6 dB (for KP4 at BER=10⁻¹⁵)
```

**KP4 FEC overhead**: 5.84% (544/514)
**Effective data rate**: 56 GBd × (1 - 0.0584) = 52.7 Gbps/lane (net)

#### 13.8.4 KP4 FEC Performance with PAM-4

**KP4 RS(544,514) performance**:
- **Symbol error correction**: t = 15 symbols
- **Symbol size**: 10 bits
- **Codeword**: 544 symbols (514 data + 30 parity)
- **Latency**: ~500 ns (encoding + decoding)

**Pre-FEC BER vs Post-FEC BER** (RS(544,514)):
| Pre-FEC BER | Post-FEC BER | Q-factor |
|------------|--------------|----------|
| 10⁻³ | 10⁻¹⁰ | 4.5 |
| 5×10⁻⁴ | 10⁻¹² | 4.8 |
| 10⁻⁴ | 10⁻¹⁵ | 5.1 |
| 5×10⁻⁵ | 10⁻¹⁸ | 5.5 |
| 10⁻⁵ | < 10⁻²⁰ | 5.9 |

**FEC threshold** (waterfall region):
- **Sharp transition**: 0.5 dB Q-factor change → 10 orders BER change
- **Design margin**: Target 0.5-1 dB above threshold

#### 13.8.5 PAM-4 with Concatenated FEC (Inner + Outer)

**Concatenated FEC architecture**:
```
Outer: Hamming / BCH / LDPC (low overhead)
  ↓
Inner: KP4 RS(544,514) (high overhead, strong)
```

**Concatenated FEC gains**:
| Architecture | Pre-FEC BER | Net Coding Gain |
|--------------|-------------|-----------------|
| KP4 only | 10⁻⁴ | 5.5 dB |
| LDPC(1/2) + KP4 | 10⁻³ | 7.5 dB |
| LDPC(3/4) + KP4 | 5×10⁻⁴ | 6.5 dB |
| Turbo + KP4 | 5×10⁻⁴ | 7.0 dB |

**Overhead trade-off**:
| Architecture | Total Overhead | NCG | Complexity |
|--------------|----------------|-----|------------|
| KP4 only | 5.8% | 5.5 dB | Low |
| LDPC(3/4)+KP4 | 12% | 6.5 dB | Medium |
| LDPC(1/2)+KP4 | 20% | 7.5 dB | High |

#### 13.8.5 PAM-4 BER with Non-Gaussian Noise

**Non-Gaussian noise sources**:
1. **ISI**: Deterministic, pattern-dependent
2. **Crosstalk**: Coherent/incoherent addition
3. **RIN**: Relative Intensity Noise (multiplicative)
4. **Nonlinearity**: DAC/ADC/TIA nonlinearity
5. **Jitter**: Timing uncertainty → voltage noise

**Non-Gaussian BER estimation**:
```
BER = ∫ BER_Gaussian(v) × p(v) dv
```
where p(v) = noise voltage PDF (non-Gaussian)

**Edgeworth expansion** (non-Gaussian correction):
```
BER ≈ BER_Gaussian × [1 + (κ₃/6)H₃(Q) + (κ₄/24)H₄(Q) + ...]
```
where κ₃, κ₄ = skewness, kurtosis; Hₙ = Hermite polynomials

**Cumulants for PAM-4**:
- **Skewness (κ₃)**: Asymmetry from ISI, RIN
- **Kurtosis (κ₄)**: Heavy tails from crosstalk, impulsive noise

**Typical non-Gaussian penalty** (56G PAM-4):
- **ISI-dominated**: 0.5-1 dB Q-penalty
- **Crosstalk-dominated**: 0.5-1.5 dB penalty
- **RIN-dominated**: 0.3-0.8 dB penalty
- **Total non-Gaussian penalty**: 1-2 dB Q-factor

#### 13.8.5 PAM-4 BER with ISI (Inter-Symbol Interference)

**ISI model**:
```
y[n] = Σ h[k] × x[n-k] + n[n]
```
where h[k] = channel impulse response

**ISI-induced BER**:
```
BER_ISI = Σ P(x[n-k]) × Q( (V_th - Σ h[k]x[n-k]) / σ )
```

**Worst-case patterns** (max ISI):
- **PAM-4**: 00→33→00 transitions (max swing)
- **Pattern**: 0000→3333→0000 (max eye closure)

**ISI penalty** (Q-factor degradation):
```
ΔQ_ISI ≈ 20 log₁₀(1 - ISI_ratio)
ISI_ratio = Σ|h[k]| / |h[0]|  (k ≠ 0)
```

**ISI penalty examples**:
| ISI Ratio | ΔQ (dB) | BER Penalty (at Q=6) |
|-----------|---------|----------------------|
| 0.05 | 0.4 | 1.5× |
| 0.10 | 0.9 | 3× |
| 0.15 | 1.4 | 7× |
| 0.20 | 1.9 | 15× |

**Equalization impact** (FFE/DFE):
- **FFE**: Reduces precursor ISI (feedforward)
- **DFE**: Reduces postcursor ISI (feedback)
- **Residual ISI**: Typically 0.02-0.05 after equalization

#### 13.8.6 PAM-4 BER with Crosstalk

**Crosstalk types**:
1. **Coherent crosstalk**: Phase-correlated (same source)
2. **Incoherent crosstalk**: Phase-uncorrelated (different sources)

**Coherent crosstalk penalty**:
```
Penalty = 20 log₁₀(1 + Σ √XT_i × cos(φ_i))
```
Worst-case (all in-phase): 20 log₁₀(1 + Σ√XT_i)

**Incoherent crosstalk penalty**:
```
Penalty = 10 log₁₀(1 + Σ XT_i)
```

**XT penalty examples** (56G PAM-4, Q=6):
| XT per source | # sources | Coherent penalty | Incoherent penalty |
|---------------|-----------|------------------|-------------------|
| -30 dB | 1 | 0.04 dB | 0.02 dB |
| -25 dB | 1 | 0.1 dB | 0.05 dB |
| -25 dB | 4 | 0.6 dB | 0.2 dB |
| -20 dB | 1 | 0.4 dB | 0.2 dB |
| -20 dB | 8 | 2.5 dB | 0.7 dB |

**Crosstalk mitigation**:
- **Physical**: Spacing, shielding, guard bands
- **Signal processing**: MIMO equalization, ICA
- **Wavelength**: Guard bands, different λ
- **Polarization**: Orthogonal polarization

#### 13.8.6 PAM-4 BER with RIN (Relative Intensity Noise)

**RIN model**:
```
RIN = <ΔP²> / P² / Δf
```
RIN contribution to noise variance:
```
σ_RIN² = RIN × P² × B
```

**RIN-induced Q-penalty**:
```
Q_RIN = P / √(σ_shot² + σ_thermal² + σ_RIN²)
```

**RIN penalty** (dB):
```
Penalty_RIN = 10 log₁₀(1 + RIN × P × B / (2q(I_ph+I_d)B + 4kTB/R_L))
```

**Typical RIN values**:
| Laser Type | RIN (dB/Hz) | Penalty (56G PAM-4) |
|------------|-------------|---------------------|
| DFB (high-quality) | -155 | < 0.1 dB |
| DFB (standard) | -145 | 0.2 dB |
| VCSEL | -135 | 0.8 dB |
| EML | -145 | 0.2 dB |
| SiPh integrated | -130 to -140 | 0.5-1.5 dB |

**RIN mitigation**:
- **Laser selection**: Low RIN lasers
- **Optical filtering**: Reduce ASE noise
- **Balanced detection**: Common-mode RIN rejection
- **DSP**: RIN estimation and cancellation

#### 13.8.7 PAM-4 BER with Nonlinearity

**DAC/ADC nonlinearity**:
- **INL/DNL**: Integral/Differential nonlinearity
- **Effect**: Level-dependent distortion
- **Penalty**: Constellation warping, unequal eye openings

**TIA nonlinearity**:
- **Compression**: Gain compression at high power
- **Effect**: Outer eye compression
- **Penalty**: Reduced outer eye height

**DSP compensation**:
- **Lookup table**: INL/DNL correction
- **Volterra series**: Nonlinear equalization
- **Neural network**: DNN-based nonlinear compensation

**Nonlinearity penalty** (typical):
| Nonlinearity | INL (LSB) | Q-penalty |
|--------------|-----------|-----------|
| DAC | 0.5 | 0.2 dB |
| DAC | 1.0 | 0.5 dB |
| ADC | 0.5 | 0.1 dB |
| ADC | 1.0 | 0.3 dB |
| TIA | 1 dB comp | 0.5 dB |

#### 13.8.7 PAM-4 BER Measurement Methodology

**Measurement setup**:
```
Tx → Channel → Rx → CDR → Error Counter
```

**Error counting methods**:
1. **Bit-by-bit comparison**: PRBS pattern match
2. **Symbol error counting**: 2-bit symbol errors
3. **FEC-based**: Pre-FEC BER from syndrome weight
4. **Histogram method**: Voltage histogram → Q-factor → BER

**Measurement challenges**:
- **Low BER**: Requires long measurement time
- **10⁻¹² BER**: 10¹² bits = 5 hours at 56 Gbps
- **Acceleration**: Higher BER extrapolation, importance sampling

**Extrapolation methods**:
1. **Gaussian fit**: Fit tail, extrapolate
2. **Importance sampling**: Bias noise, weight results
3. **Bathtub curve**: BER vs. decision threshold
4. **Q-factor extrapolation**: Q vs. BER curve fitting

**Standard test patterns**:
- **PRBS31Q**: PAM-4 version of PRBS31
- **PRBS13Q**: Shorter, faster acquisition
- **QPRBS13-CEI**: CEI-defined pattern
- **Square wave**: Stress test (max ISI)

#### 13.8.8 BER Targets for Optical Interconnects

**Target BER by application**:
| Application | Pre-FEC BER | Post-FEC BER | FEC |
|-------------|-------------|--------------|-----|
| Ethernet (IEEE 802.3) | 10⁻⁴ | 10⁻¹² | KP4 |
| InfiniBand HDR | 10⁻⁶ | 10⁻¹⁵ | Custom |
| NVLink | 10⁻⁶ | 10⁻¹⁵ | Custom |
| PCIe 6.0 | 10⁻⁶ | 10⁻¹⁵ | Custom |
| Coherent 400ZR | 10⁻⁴ | 10⁻¹⁵ | KP4 |
| Coherent 800ZR | 10⁻⁵ | 10⁻¹⁵ | oFEC |
| Optical NVLink | 10⁻⁶ | 10⁻¹⁵ | Custom |

**Pre-FEC BER targets by generation**:
| Generation | Rate | Modulation | Pre-FEC BER Target |
|------------|------|------------|-------------------|
| 100G | 28G | PAM-4 | 10⁻⁴ |
| 400G | 56G | PAM-4 | 10⁻⁴ |
| 800G | 112G | PAM-4 | 10⁻⁵ |
| 1.6T | 224G | PAM-4 | 10⁻⁵ |
| 3.2T | 224G | PAM-4/8 | 10⁻⁶ |

#### 13.8.9 Q-factor Estimation from Eye Diagram

**Q-factor from eye diagram** (histogram method):
```
Q = (μ₁ - μ₀) / (σ₁ + σ₀)
```
where μ₁, μ₀ = means of 1/0 levels; σ₁, σ₀ = standard deviations

**For PAM-4** (three eyes):
```
Q₁ = (μ₁ - μ₀) / (σ₁ + σ₀)  (inner eye 1)
Q₂ = (μ₂ - μ₁) / (σ₂ + σ₁)  (middle eye)
Q₃ = (μ₃ - μ₂) / (σ₃ + σ₂)  (inner eye 2)
```

**BER from eye diagram**:
```
BER = ⅛ [ erfc(Q₁/√2) + 2erfc(Q₂/√2) + erfc(Q₃/√2) ]
```

**Histogram method**:
1. Capture voltage histogram at sampling instant
2. Fit Gaussian mixture model (4 Gaussians)
3. Extract μ_i, σ_i for each level
4. Compute Q-factors and BER

**Accuracy considerations**:
- **Sample count**: > 10⁶ for BER ~10⁻⁶
- **Histogram bins**: > 1000 (resolution)
- **DC offset**: Remove before fitting
- **Clock recovery**: Accurate sampling phase critical

#### 13.8.10 BER Extrapolation and Confidence Intervals

**Extrapolation methods**:

**1. Gaussian tail fit**:
```
log(BER) vs Q² → linear fit → extrapolate
```

**2. Weibull fit**:
```
BER = exp(-(Q/α)^β)
```
Fit α, β from measured Q-BER points

**3. Importance sampling**:
```
Bias noise distribution → more errors → weight by likelihood ratio
```

**Confidence intervals** (for N bits, E errors):
```
BER_lower = χ²(α/2, 2E) / (2N)
BER_upper = χ²(1-α/2, 2(E+1)) / (2N)
```

**Example**: 1 error in 10¹² bits (BER=10⁻¹²)
- 95% CI: [2.5×10⁻¹³, 4.7×10⁻¹²]
- Relative uncertainty: > 100% (insufficient statistics)

**Required samples for 95% CI ±50%**:
| Target BER | Errors needed | Bits at 56G |
|------------|---------------|-------------|
| 10⁻⁶ | 100 | 1.8×10⁷ |
| 10⁻⁹ | 100 | 1.8×10¹⁰ |
| 10⁻¹² | 100 | 1.8×10¹³ |
| 10⁻¹⁵ | 100 | 1.8×10¹⁶ |

**Practical approach**: Measure at higher BER (10⁻⁶ to 10⁻⁹), extrapolate with confidence bounds

---

*End of Piece 8. Next: Piece 9 - FEC Overhead and Latency Trade-offs*