# Document 9: ADC/DAC Quantization Theory and Analog Tax
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

*End of Piece 6. Next: Piece 7 - Schreier FoM: FoM = P/(2^ENOB × BW)*