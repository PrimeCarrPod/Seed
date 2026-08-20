# Document 13: Optical NVLink and Optical Circuit Switching Physics
## Piece 1: Optical Link Budget: Link Margin, Extinction Ratio, Dispersion Penalty

---

### 13.1 Optical Link Budget: Link Margin, Extinction Ratio, Dispersion Penalty

The optical link budget is the fundamental accounting framework for designing reliable high-speed optical interconnects in NVLink and optical circuit switching systems. It quantifies the power margin available to overcome losses, noise, and impairments across the optical channel.

#### 13.1.1 Link Budget Fundamentals

**Link budget equation**:
```
P_rx = P_tx - L_total - Penalty
```

where:
- P_tx = Transmitter launch power (dBm)
- P_rx = Receiver sensitivity (dBm)
- L_total = Total channel loss (dB)
- Penalty = Sum of all impairment penalties (dB)

**Link margin**:
```
Margin = P_rx - P_rx,min
```
where P_rx,min is the minimum required received power for target BER.

**Required margin** (typical):
- **Design margin**: 3-6 dB (manufacturing variations, aging)
- **Aging margin**: 1-2 dB (laser degradation, connector wear)
- **Temperature margin**: 1-2 dB (temp-dependent loss)
- **Total margin**: 5-10 dB (typical design target)

#### 13.1.2 Transmitter Parameters

**Laser source** (VCSEL / EML / DFB):
| Parameter | VCSEL | EML | DFB |
|-----------|-------|-----|-----|
| Wavelength | 850 nm | 1310/1550 nm | 1310/1550 nm |
| Modulation | Direct | External | External |
| Bandwidth | ≤ 56 Gbaud | ≤ 112 Gbaud | ≤ 100 Gbaud |
| Power | 0-5 mW | 2-10 mW | 5-20 mW |
| Extinction ratio | 3-6 dB | 8-12 dB | 10-15 dB |
| RIN | -130 dB/Hz | -150 dB/Hz | -155 dB/Hz |
| Cost | Low | Medium | High |

**Transmitter output power**:
```
P_tx = I_bias × V_f × η_slope (for VCSEL)
P_tx = P_laser × η_mod (for EML/DFB)
```

**Extinction ratio (ER)**:
```
ER = P_1 / P_0 (linear)
ER_dB = 10 × log10(P_1 / P_0)
```
- **High ER**: Better eye opening, lower BER
- **Trade-off**: Higher ER → higher bias current → more power
- **Target**: > 4 dB (VCSEL), > 8 dB (EML), > 10 dB (coherent)

**Relative Intensity Noise (RIN)**:
```
RIN = <ΔP²> / P² / Δf
```
- **Impact**: Adds to noise floor at receiver
- **Target**: < -130 dB/Hz (direct detect), < -150 dB/Hz (coherent)

#### 13.1.3 Channel Loss Budget

**Fiber loss** (SMF-28e, 1550 nm):
- **Attenuation**: 0.18-0.20 dB/km (1550 nm)
- **Water peak**: 1383 nm (avoided in modern fiber)
- **Bend loss**: 0.1-0.5 dB/turn (bend radius dependent)

**Connector loss**:
- **LC/SC**: 0.2-0.5 dB/mated pair
- **MPO/MTP**: 0.3-0.7 dB/mated pair
- **Angled Polish (APC)**: -60 dB return loss
- **Ultra Polish (UPC)**: -55 dB return loss

**Splice loss**:
- **Fusion splice**: 0.01-0.05 dB
- **Mechanical splice**: 0.1-0.3 dB

**Total channel loss** (example 100m link):
```
L_fiber = 0.02 dB (100m)
L_connectors = 2 × 0.5 dB = 1.0 dB (Tx + Rx)
L_splices = 0 (direct connect)
L_total = 1.02 dB
```

#### 13.1.4 Receiver Sensitivity

**Direct detection** (PIN/APD):
```
P_rx,min = NEP × √(B) × Q⁻¹(BER) + P_shot + P_thermal
```

where:
- **NEP**: Noise Equivalent Power (W/√Hz)
- **B**: Electrical bandwidth (Hz)
- **Q⁻¹(BER)**: Inverse Q-function

**PIN photodiode**:
- **Responsivity**: 0.8-1.0 A/W (1550 nm)
- **Dark current**: 1-10 nA
- **Bandwidth**: > 50 GHz
- **NEP**: 1-2 pW/√Hz

**APD (Avalanche Photodiode)**:
- **Gain**: M = 10-30
- **Excess noise factor**: F(M) = kM + (2-1/M)(1-k)
- **Sensitivity gain**: 10× PIN (theoretical)
- **Excess noise penalty**: 1-3 dB

**Coherent detection** (intradyne):
- **LO power**: 5-10 mW
- **Shot noise limited**: NEP = √(2qP_LO/hν)
- **Sensitivity**: -30 to -40 dBm (at 100 Gbaud)
- **DSP overhead**: ADC, DSP power (2-5 W)

#### 13.1.5 Extinction Ratio Penalty

**ER penalty** (direct detection):
```
Penalty_ER = -10 log10(1 - 1/ER_linear)
```

| ER (dB) | ER (linear) | Penalty (dB) |
|---------|-------------|--------------|
| 3 | 2.0 | 3.0 |
| 4 | 2.5 | 1.7 |
| 5 | 3.2 | 1.0 |
| 6 | 4.0 | 0.6 |
| 7 | 5.0 | 0.4 |
| 8 | 6.3 | 0.2 |
| 10 | 10 | 0.04 |

**ER penalty** (coherent):
- **Phase noise**: Laser linewidth adds phase noise
- **IQ imbalance**: I/Q amplitude/phase mismatch
- **Skew**: I/Q temporal misalignment
- **Target**: < 0.5 dB total penalty

#### 13.1.6 Dispersion Penalty

**Chromatic dispersion** (CD):
```
Δτ = D × L × Δλ
```
where:
- D = Dispersion coefficient (ps/nm/km)
- L = Fiber length (km)
- Δλ = Spectral width (nm)

**CD penalty** (NRZ):
```
Penalty_CD ≈ 10 log10(1 + (2π × B × Δτ)²)
```

| Bit Rate | Fiber Length | D (ps/nm/km) | Δλ (nm) | Penalty |
|----------|--------------|--------------|---------|---------|
| 25 Gbps | 2 km | 17 | 0.1 | 0.1 dB |
| 50 Gbps | 2 km | 17 | 0.1 | 0.4 dB |
| 100 Gbps | 2 km | 17 | 0.05 | 0.8 dB |
| 100 Gbps | 10 km | 17 | 0.1 | 8 dB (uncompensated) |

**Polarization Mode Dispersion (PMD)**:
```
PMD penalty ≈ 10 log10(1 + (2π × B × DGD)²)
```
- **DGD**: Differential Group Delay (ps)
- **PMD coefficient**: 0.1-0.5 ps/√km (modern fiber)
- **Penalty**: < 0.5 dB for < 10 km at 100 Gbps

#### 13.1.7 Nonlinear Penalties

**Self-Phase Modulation (SPM)**:
```
φ_NL = γ × P × L_eff
```
where γ = nonlinear coefficient (1.3 W⁻¹km⁻¹ for SMF)

**SPM penalty** (direct detection):
```
Penalty_SPM ≈ 10 log10(1 + (φ_NL)²)
```

**Four-Wave Mixing (FWM)**:
```
Δλ_FWM = λ² / (2πc) × Δβ
```
- **Phase matching**: Critical for FWM efficiency
- **Mitigation**: Non-zero dispersion, unequal channel spacing

**Cross-Phase Modulation (XPM)**:
```
φ_XPM = 2γ × P_pump × L_eff
```
- **Factor of 2**: XPM twice as strong as SPM
- **Walk-off**: Reduces effective interaction length

#### 13.1.8 Complete Link Budget Example (100 Gbps PAM-4, 100m)

**Transmitter** (EML):
- P_tx = 2 dBm (1.6 mW)
- ER = 8 dB
- RIN = -150 dB/Hz

**Channel** (100m SMF, 2 connectors):
- Fiber loss: 0.02 dB
- Connectors: 2 × 0.5 dB = 1.0 dB
- L_total = 1.02 dB

**Receiver** (Coherent intradyne):
- Sensitivity: -25 dBm (at BER=10⁻¹²)
- Implementation penalty: 2 dB
- FEC overhead: 20% (RS+LDPC)

**Penalties**:
- ER penalty: 0.2 dB
- CD penalty: 0.1 dB
- PMD penalty: 0.1 dB
- Implementation: 2.0 dB
- FEC overhead: 1.0 dB (net coding gain - overhead)
- Total penalties: 3.4 dB

**Link budget**:
```
P_rx = 2 - 1.02 - 3.4 = -2.42 dBm
Margin = -2.42 - (-25) = 22.58 dB
```

**Design margin**: 22.58 - 6 (design) = 16.58 dB (healthy)

---

*End of Piece 1. Next: Piece 2 - MEMS Optical Circuit Switch: Mirror Tilt Angle vs. Insertion Loss*