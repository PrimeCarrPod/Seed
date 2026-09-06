# Document 5: Wavelength Division Multiplexing Mathematics
## Piece 9: Optical Signal-to-Noise Ratio (OSNR) Budget for 100+ Channels

---

### 5.9 Optical Signal-to-Noise Ratio (OSNR) Budget for 100+ Channels

OSNR is the key metric for optical link performance in amplified WDM systems. For 100+ channel systems spanning C+L bands, the OSNR budget must account for amplifier noise, nonlinear penalties, crosstalk, and component impairments to ensure target BER across all channels.

#### 5.9.1 OSNR Definition and Measurement

**OSNR definition** (per 0.1 nm reference bandwidth):
OSNR = P_sig / P_ASE (in 0.1 nm ≈ 12.5 GHz at 1550 nm)

**In dB**:
OSNR_dB = 10 log₁₀(P_sig/P_ASE) + 10 log₁₀(B_ref/B_meas)
where B_ref = 12.5 GHz, B_meas = measurement resolution

**In-band OSNR (IB-OSNR)**:
Measured within signal bandwidth
IB-OSNR = P_sig / P_noise (in signal BW)

**Polarization-resolved OSNR**:
OSNR_x, OSNR_y (for coherent)
OSNR = (OSNR_x + OSNR_y)/2

#### 5.9.2 ASE Noise from Optical Amplifiers

**EDFA (Erbium-Doped Fiber Amplifier)**:
ASE power spectral density:
S_ASE = n_sp hν (G - 1) (W/Hz)
n_sp = population inversion factor (≥ 1)
G = gain

**Noise figure**:
NF = 2 n_sp (G - 1)/G ≈ 2 n_sp (for G ≫ 1)
Quantum limit: NF = 3 dB (n_sp = 1)
Practical EDFA: NF = 4.5-6 dB

**Raman amplifier**:
Lower NF (can approach 0 dB)
Distributed gain → better OSNR
SRS pump noise transfer

**SOA (Semiconductor Optical Amplifier)**:
High NF (7-10 dB)
Fast gain saturation
Pattern-dependent effects

#### 5.9.3 Cascaded Amplifier OSNR

**N identical spans** (loss = G per span):
OSNR_total = P_sig / (N × P_ASE,span)

**OSNR after N spans**:
1/OSNR_N = N / OSNR_1
OSNR_N = OSNR_1 / N

**In dB**:
OSNR_N,dB = OSNR_1,dB - 10 log₁₀(N)

**Example**: 20 spans, 80 km each, OSNR_1 = 30 dB
OSNR_20 = 30 - 10 log₁₀(20) = 30 - 13 = 17 dB

**Hybrid amplification** (EDFA + Raman):
OSNR improvement: 2-4 dB
Raman provides distributed gain
Reduces effective span loss

#### 5.9.4 OSNR Requirements by Modulation Format

**Required OSNR** (at BER = 10⁻³ pre-FEC, 0.1 nm BW):

| Format | SE (b/s/Hz) | OSNR_req (dB) |
|--------|-------------|---------------|
| BPSK | 1 | 9-10 |
| QPSK | 2 | 12-13 |
| 8-QAM | 3 | 15-16 |
| 16-QAM | 4 | 18-19 |
| 32-QAM | 5 | 21-22 |
| 64-QAM | 6 | 24-25 |
| PAM-4 (direct detect) | 2 | 20-22 |

**With FEC overhead** (20% KP4):
Post-FEC BER < 10⁻¹⁵
Pre-FEC BER ≈ 10⁻³ to 10⁻⁴
OSNR penalty: ~0.5-1 dB vs. uncoded

**Penalty factors**:
- Nonlinear penalty: 0.5-2 dB
- Component penalty: 0.5-1 dB
- Implementation penalty: 0.5-1 dB
- Aging/temp margin: 1-2 dB

#### 5.9.5 OSNR Budget for 100+ Channel System

**System example**: 100 channels × 100 GHz, C+L band (8 THz)
- Reach: 1000 km (12 spans × 80 km)
- EDFA only: NF = 5 dB
- Span loss: 16 dB (80 km SMF)

**Per-span ASE**:
P_ASE = n_sp hν (G-1) B_ch
G = 16 dB = 40
n_sp = 1.6 (NF = 5 dB)
B_ch = 50 GHz (for 100G QPSK)
P_ASE ≈ 1.6 × 1.28e-19 × 39 × 50e9 ≈ 4e-8 W = -44 dBm

**Total ASE after 12 spans**:
P_ASE,total = 12 × (-44 dBm) = -33.2 dBm (in 50 GHz)
Wait: powers add → P_total = P_1 + 10log10(12) = -44 + 10.8 = -33.2 dBm

**Signal power per channel**:
Launch: 0 dBm per channel
After 12 spans: 0 dBm (gain = loss)

**OSNR** (in 50 GHz):
OSNR = 0 - (-33.2) = 33.2 dB (in 50 GHz)
OSNR (0.1 nm) = 33.2 + 10log10(12.5/50) = 33.2 - 6 = 27.2 dB

**Required OSNR** (QPSK): ~13 dB
**Margin**: 27.2 - 13 = 14.2 dB

**Penalties** (subtracted from margin):
- Nonlinear: 1.5 dB
- Component (PDL, PMD, filter): 1 dB
- Crosstalk: 0.5 dB
- Implementation: 1 dB
- Aging/temp: 1.5 dB
Total penalties: 5.5 dB

**Net margin**: 14.2 - 5.5 = 8.7 dB (healthy)

#### 5.9.6 Wavelength-Dependent OSNR

**Gain tilt** (EDFA):
Gain varies with wavelength
C-band: ~3-5 dB tilt
Flattening: gain flattening filter (GFF)

**Raman tilt**:
Shorter λ → higher gain
Tilt across C-band: ~3 dB

**Total tilt** (EDFA + Raman):
Can be compensated by:
- Pre-emphasis (variable attenuator array)
- Dynamic gain equalization (DGE)
- Channel-by-channel power control

**OSNR variation across band**:
ΔOSNR ≈ tilt + ASE variation
Typical: 2-3 dB across C-band
Design for worst-case channel (usually edges)

#### 5.9.7 Nonlinear OSNR Penalty

**GN model** (Gaussian Noise model):
Nonlinear interference (NLI) power:
P_NLI = η_NLI P_ch³
η_NLI = (16/27) γ² / (α |β₂|) × arcsinh(π² β₂ B² N_ch²/2α) / (π β₂ B)

**OSNR with NLI**:
OSNR_NL = P_ch / (P_ASE + P_NLI)

**Effective OSNR penalty**:
ΔOSNR_NL = 10 log₁₀(1 + P_NLI/P_ASE)

**For 400G QPSK, 1000 km**:
P_NLI/P_ASE ≈ 0.1-0.3
ΔOSNR_NL ≈ 0.4-1.2 dB

**For 800G 16-QAM**:
More sensitive to nonlinearity
ΔOSNR_NL ≈ 1-2 dB

**Mitigation**:
- Lower launch power (optimal power)
- Larger effective area fiber
- Digital back-propagation (DBP)

#### 5.9.8 OSNR Monitoring and Control

**In-service OSNR monitoring**:
- **Polarization-nulling**: polarization scrambling + nulling
- **ASE interpolation**: fit ASE between channels
- **Pilot tone**: out-of-band pilot
- **Coherent RX**: direct OSNR estimation from constellation

**Dynamic OSNR control**:
- **VOA array**: per-channel power control
- **DGE (Dynamic Gain Equalizer)**: per-wavelength gain
- **Raman pump control**: adjust tilt
- **EDFA gain/tilt control**: constant power, constant gain

**Control loop**:
1. Monitor OSNR (per channel)
2. Compare to target
3. Adjust VOA/DGE/Raman
4. Converge in < 1 s

#### 5.9.9 OSNR Margin and Link Design

**Design margin** (typical):
- System margin: 3 dB
- Aging: 1 dB
- Temperature: 1 dB
- Repair: 1 dB
- Manufacturing: 1 dB
Total: 7 dB

**Link design process**:
1. Define reach, capacity, BER
2. Choose modulation, FEC
3. Calculate required OSNR
3. Design amplifier chain (span count, type)
4. Calculate OSNR with penalties
5. Verify margin > 0
6. Optimize launch power (minimize NLI)
7. Add margins, verify

**Optimal launch power**:
P_opt = (P_ASE / (2 η_NLI))^{1/3}
Balances ASE and NLI

#### 5.9.10 Future: OSNR for 800G/1.6T and Beyond

**Higher-order modulation**:
64-QAM: OSNR_req ≈ 25 dB
256-QAM: OSNR_req ≈ 30 dB
Requires: lower NF amps, better DSP, lower nonlinearity

**Probabilistic constellation shaping (PCS)**:
0.5-1 dB OSNR reduction at same SE
Adaptive to channel conditions

**Geometric shaping**:
Constellation on sphere (spherical codes)
0.2-0.5 dB gain

**Joint TX/RX optimization**:
End-to-end learned transceivers
Neural network equalizers
Joint optimization with FEC

**Quantum-limited amplifiers**:
Phase-sensitive amplifiers (PSA)
NF → 0 dB (theoretical)
Pump phase noise limitation

**All-optical processing**:
Optical phase conjugation (OPC)
Mid-link spectral inversion
Cancels nonlinear phase noise

---

*End of Piece 9. Next: Piece 10 - Wavelength Routing: Broadcast-and-Select vs. Wavelength-Selective Switch*