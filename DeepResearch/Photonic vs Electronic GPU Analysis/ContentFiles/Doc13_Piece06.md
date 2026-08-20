# Document 13: Optical NVLink and Optical Circuit Switching Physics
## Piece 6: Photodetector: Ge-on-Si vs. InGaAs APD Sensitivity

---

### 13.6 Photodetector: Ge-on-Si vs. InGaAs APD Sensitivity

Photodetectors are the critical receive-side components in optical interconnects, converting optical signals back to electrical domain. The choice between Germanium-on-Silicon (Ge-on-Si) photodiodes and Indium Gallium Arsenide Avalanche Photodiodes (InGaAs APD) involves fundamental trade-offs between sensitivity, bandwidth, integration density, and cost.

#### 13.6.1 Photodetector Fundamentals

**Photodetection physics**:
```
Photon absorption: ħω > E_g → e-h pair generation
Photocurrent: I_ph = q × η × (P_opt / ħω) × M
```
where:
- η = Quantum efficiency (QE)
- M = Avalanche gain (M=1 for PIN, M>1 for APD)
- P_opt = Optical power
- ħω = Photon energy

**Key metrics**:
| Metric | Definition | Target |
|--------|------------|--------|
| Responsivity (R) | I_ph/P_opt (A/W) | > 0.8 A/W (1550 nm) |
| Quantum efficiency (η) | R × ħω/q | > 80% |
| Bandwidth (f_3dB) | Electrical 3dB BW | > 50 GHz (100G PAM-4) |
| Dark current (I_d) | Reverse bias leakage | < 10 nA (PIN), < 100 nA (APD) |
| Noise equivalent power (NEP) | √(4kTB/R + 2qI_d) | < 1 pW/√Hz |
| Gain-bandwidth product | GBW (APD) | > 100 GHz |

#### 13.6.2 Ge-on-Si Photodetector

**Ge-on-Si epitaxy**:
```
Si substrate → Graded SiGe buffer → Ge epitaxial layer
```
- **Lattice mismatch**: 4.2% (Ge vs Si)
- **Buffer strategies**: Graded SiGe, aspect ratio trapping (ART)
- **Threading dislocation density (TDD)**: 10⁶-10⁷ cm⁻² (improving)

**Ge PIN photodiode**:
- **Bandgap**: 0.67 eV (direct at Γ, indirect L-valley)
- **Absorption**: Strong at 1310/1550 nm (α ~ 500-1000 cm⁻¹)
- **Thickness**: 1-2 µm (absorption length ~10 µm)

**Ge PIN performance**:
| Parameter | Typical | Best Reported |
|-----------|---------|---------------|
| Responsivity (1550nm) | 0.8-1.0 A/W | 1.1 A/W |
| QE | 80-95% | 98% |
| Bandwidth | 40-50 GHz | 70 GHz |
| Dark current | 1-10 µA | 10 nA |
| Responsivity × BW | 40 A/W·GHz | 70 A/W·GHz |
| Capacitance | 50-100 fF | 30 fF |

**Ge-on-Si integration challenges**:
- **TDD**: Threading dislocations → dark current, reliability
- **Thermal budget**: < 450°C (CMOS BEOL compatible)
- **Strain**: Tensile strain improves direct gap (Γ-valley)
- **n-type doping**: As/P implantation, activation challenges

**Ge APD (Avalanche Photodiode)**:
- **Gain mechanism**: Impact ionization (electrons > holes in Ge)
- **Gain (M)**: 10-30 (practical), 100+ (breakdown)
- **Excess noise factor**: k = α_h/α_e ≈ 0.1-0.3 (electrons ionize more)
- **Excess noise factor**: F(M) = kM + (2-1/M)(1-k)
- **Bandwidth**: 20-40 GHz (gain-bandwidth product ~100 GHz)

**Ge APD performance**:
| Parameter | Typical | Best |
|-----------|---------|------|
| Gain (M) | 10-20 | 30 |
| Responsivity (M=10) | 8-10 A/W | 11 A/W |
| Bandwidth (M=10) | 20 GHz | 40 GHz |
| Gain-bandwidth | 200 GHz | 400 GHz |
| Excess noise (k) | 0.2-0.3 | 0.15 |
| Sensitivity (BER=10⁻¹²) | -25 dBm | -28 dBm |

#### 13.6.3 InGaAs APD (InP-based)

**InGaAs APD structure**:
```
InP substrate → InAlAs multiplication layer → InGaAs absorption → InP window
```
- **Material system**: In₀.₅₃Ga₀.₄₇As / InP (lattice-matched)
- **Absorption layer**: InGaAs (direct gap, 0.75 eV)
- **Multiplication layer**: InAlAs (wider bandgap, electron injection)

**InGaAs APD advantages**:
- **Mature technology**: 30+ years production
- **High gain**: M = 10-30 (operating), 50-100 (breakdown)
- **Low excess noise**: k = 0.2-0.4 (electrons favored)
- **High bandwidth**: 40-80 GHz (up to 120 GHz)
- **Low dark current**: < 10 nA (vs µA for Ge)
- **Reliability**: Proven in telecom (> 25 years)

**InGaAs APD performance**:
| Parameter | Typical | Best |
|-----------|---------|------|
| Gain (M) | 10-30 | 40 |
| Responsivity (M=10) | 8-10 A/W | 12 A/W |
| Bandwidth (M=10) | 40 GHz | 80 GHz |
| Gain-bandwidth | 400 GHz | 1 THz |
| Excess noise factor (k) | 0.3-0.4 | 0.2 |
| Sensitivity (BER=10⁻¹²) | -30 dBm | -34 dBm |
| Dark current | 1-10 nA | < 1 nA |
| Breakdown voltage | 40-60 V | 30-50 V |

**InGaAs APD challenges**:
- **High voltage**: 40-60V breakdown (HV supply needed)
- **Temperature sensitivity**: Gain varies with T (dM/dT ~ 1-2%/°C)
- **Integration**: Heterogeneous (InP on Si), not monolithic
- **Cost**: 10-50× Ge-on-Si (InP substrate, epitaxy)

#### 13.6.4 Silicon Photonics Integrated Photodetectors

**Monolithic Si PD (Silicon PIN)**:
- **Wavelength**: < 1100 nm (Si bandgap 1.12 eV)
- **Use case**: 850 nm VCSEL links, visible light
- **Advantage**: Fully monolithic, CMOS compatible
- **Limitation**: No 1310/1550 nm detection

**Ge-on-Si PIN (heterogeneous)**:
- **Integration**: Ge epitaxy on Si (selective area growth)
- **Process**: Graded SiGe buffer, ART, or direct growth
- **Maturity**: Manufacturing (Intel, Cisco, Intel, Juniper)
- **Performance**: 50 GHz, 1 A/W, 1 µA dark current

**GeSi EAM + PD co-integration**:
- **Tx/Rx co-design**: Shared GeSi platform
- **Tx**: GeSi EAM (EAM)
- **Rx**: Ge PIN (same epitaxy)
- **Benefit**: Single epitaxy, matched process

#### 13.6.4 InGaAs APD Heterogeneous Integration

**Integration approaches**:
1. **Die-to-wafer bonding**: InGaAs APD die → Si photonics wafer
2. **Wafer bonding**: InP wafer → Si wafer (molecular/adhesive)
3. **Micro-transfer printing**: µTP (pick-and-place)
4. **Selective area growth**: InP on Si (ART, graded buffer)

**Integration challenges**:
- **Alignment**: < 1 µm (passive), < 100 nm (active)
- **Thermal**: CTE mismatch (InP 4.5, Si 2.6 ppm/K)
- **Electrical**: Via through InP, TSV in Si
- **Thermal**: InP κ = 68 W/mK vs Si 150 W/mK

**Heterogeneous integration performance**:
| Parameter | Discrete InGaAs APD | Heterogeneous |
|-----------|---------------------|---------------|
| Responsivity | 10 A/W | 9 A/W (coupling loss) |
| Bandwidth | 60 GHz | 50 GHz (parasitic) |
| Dark current | 5 nA | 10 nA (interface traps) |
| Breakdown voltage | 50 V | 50 V |
| Coupling loss | N/A | 1-2 dB |

#### 13.6.5 Sensitivity Comparison: Ge-on-Si vs InGaAs APD

**Sensitivity analysis** (BER = 10⁻¹², 56 Gbaud PAM-4):

**Shot noise limit** (quantum limit):
```
P_min = (hν/q) × (Q²/2η) × (1/M²) × (1 + (k(M-1))²)
```
For BER=10⁻¹², Q ≈ 7

**Sensitivity comparison** (56 Gbaud PAM-4, BER=10⁻¹²):

| Detector | M | Sensitivity (dBm) | Penalty vs QL |
|----------|---|-------------------|---------------|
| PIN (ideal) | 1 | -19.2 dBm | 0 dB (QL) |
| Ge PIN | 1 | -17.5 dBm | 1.7 dB |
| Ge APD | 10 | -25.2 dBm | 1.7 dB |
| InGaAs APD | 10 | -28.5 dBm | 0.7 dB |
| InGaAs APD | 20 | -30.2 dBm | 1.0 dB |

**Quantum limit (QL)**: -19.2 dBm (56 GBd, η=1, BER=10⁻¹²)

**Key observations**:
- **InGaAs APD**: Closest to QL (0.7-1 dB penalty)
- **Ge APD**: 2-3 dB worse (higher k, lower M)
- **Ge PIN**: 1.7 dB penalty (no gain)
- **InGaAs PIN**: Similar to Ge PIN (no gain)

**Excess noise penalty**:
```
Penalty = 10 log₁₀(M + (M-1)k) ≈ 10 log₁₀(M) + 10 log₁₀(1+k)
```
For M=10, k=0.3: Penalty = 10 + 1.1 = 11.1 dB (theoretical)
Actual: 1-2 dB (due to optimized k, M)

#### 13.6.5 Bandwidth and Speed Comparison

**3dB bandwidth** (56 Gbaud PAM-4 requires > 40 GHz):

| Detector | f_3dB (GHz) | GBW (GHz) | 56G PAM-4 Margin |
|----------|-------------|-----------|------------------|
| Ge PIN | 50 | 50 | 1.25× |
| Ge APD (M=10) | 30 | 300 | 0.75× (marginal) |
| Ge APD (M=5) | 40 | 200 | 1.0× (tight) |
| InGaAs APD (M=10) | 60 | 600 | 1.5× (comfortable) |
| InGaAs APD (M=20) | 40 | 800 | 1.0× |
| Si PIN (850nm) | 60 | 60 | 1.5× |

**Gain-bandwidth trade-off**:
- **Ge APD**: GBW ~ 200-400 GHz
- **InGaAs APD**: GBW ~ 400-1000 GHz
- **Optimal gain**: M_opt = √(GBW/B) ≈ 10-20 for 56G

**Transit time vs RC limit**:
- **Ge**: τ_transit ~ 10-20 ps (1-2 µm absorption)
- **InGaAs**: τ_transit ~ 5-10 ps (1 µm absorption)
- **RC limit**: R_s × C_j (typically dominant)

#### 13.6.5 Noise Analysis

**Noise sources** (APD):
```
i_n² = 2q(I_ph + I_d)M²F(M)B + 4kTB/R_L + i_amp²
```
where F(M) = kM + (2-1/M)(1-k) (excess noise factor)

**Noise figure** (APD receiver):
```
NF = 10 log₁₀(1 + (M²F(M) - 1)/η)
```

**Noise figure comparison** (M=10, η=0.8):
| Detector | k | F(M) | NF (dB) |
|----------|---|------|---------|
| Ge APD | 0.3 | 5.5 | 4.8 dB |
| InGaAs APD | 0.3 | 5.5 | 4.8 dB |
| InGaAs APD (k=0.2) | 0.2 | 4.0 | 3.5 dB |

**Best case**: InGaAs APD with k=0.2 → NF ≈ 3.5 dB
**Quantum limit**: 0 dB (shot noise only)

#### 13.6.6 Integration and Packaging

**Co-packaged optics (CPO)**:
```
ASIC/GPU → Chiplet → Optical Engine (Tx+Rx) → Fiber
```

**Detector integration options**:

| Integration | Ge-on-Si | InGaAs APD | TFLN PD |
|-------------|----------|------------|---------|
| Monolithic | Yes (Ge epi) | No | No |
| Heterogeneous | Yes (μTP) | Yes (μTP) | Yes (μTP) |
| Wafer bonding | Yes (direct) | Yes (InP-on-Si) | Yes (LN-on-Si) |
| Flip-chip | No | Yes (InP die) | Yes (LN die) |
| 3D stacking | Yes (TSV) | Yes (TSV) | Yes (TSV) |

**Package types**:
- **QSFP-DD / OSFP**: Discrete ROSA/TOSA
- **CPO**: Chiplet on interposer (SiPh + ASIC)
- **Co-packaged**: Optical engine on GPU/ASIC substrate
- **3D stacked**: Detector on interposer/ASIC

#### 13.6.6 Cost Analysis

**Cost per channel** (100G lane, volume pricing):

| Component | Ge PIN | Ge APD | InGaAs APD | TFLN PD |
|-----------|--------|--------|------------|---------|
| Die cost | $1-2 | $5-10 | $20-50 | $50-100 |
| Packaging | $2-3 | $3-5 | $10-20 | $20-30 |
| Testing | $1-2 | $2-3 | $5-10 | $10-20 |
| **Total** | **$4-7** | **$10-18** | **$35-80** | **$80-150** |

**Volume scaling** (1M units/yr):
- Ge-on-Si: $2-5 (mature CMOS)
- InGaAs APD: $15-30 (InP substrate cost)
- TFLN: $30-50 (LN wafer + processing)

#### 13.6.7 Temperature and Reliability

**Temperature dependence**:
| Parameter | Ge-on-Si | InGaAs APD |
|-----------|----------|------------|
| Responsivity dR/dT | +0.5%/°C | +0.3%/°C |
| Dark current dI_d/dT | 2×/10°C | 1.5×/10°C |
| Breakdown voltage dV_br/dT | N/A | +0.1%/°C |
| Gain temperature coeff | N/A | -1.5%/°C |
| Bandwidth temp coeff | -0.5%/°C | -0.3%/°C |

**Reliability (FIT rate)**:
- Ge-on-Si PIN: < 10 FIT (mature CMOS)
- Ge APD: 50-100 FIT (dislocation-related)
- InGaAs APD: 5-20 FIT (mature InP process)
- TFLN PD: 10-50 FIT (emerging)

**Lifetime** (at 85°C, 80% RH):
- Ge PIN: > 20 years
- InGaAs APD: > 25 years
- Ge APD: 10-15 years (dislocation growth)

#### 13.6.7 Future Detector Technologies

**Emerging detector technologies**:

1. **Superconducting Nanowire SPD (SNSPD)**:
   - Efficiency: > 95% (system)
   - Timing jitter: < 3 ps
   - Dark counts: < 1 Hz
   - Temperature: < 4K (cryogenic)
   - Application: Quantum communication

2. **Graphene Photodetector**:
   - Bandwidth: > 500 GHz
   - Broadband: UV to THz
   - Responsivity: 0.1-1 A/W (no gain)
   - Integration: On Si/SiN/glass

3. **2D Material Photodetectors** (MoS₂, WSe₂, black phosphorus):
   - Tunable bandgap (layer-dependent)
   - High mobility, high gain
   - Heterogeneous integration

4. **Quantum Dot Photodetector**:
   - Tunable wavelength (size-dependent)
   - High gain (avalanche-like)
   - Solution-processable

5. **Single-Photon Avalanche Diode (SPAD) Arrays**:
   - 2D arrays (1024×1024)
   - Timing resolution: < 50 ps
   - Photon counting, FLIM, LiDAR

**Integration roadmap**:
| Year | Technology | Integration | Application |
|------|------------|-------------|-------------|
| 2024 | Ge-on-Si PIN | Monolithic | Datacom 100G |
| 2025 | Ge APD | Heterogeneous | Coherent 100G |
| 2026 | InGaAs APD | μTP/wafer bond | Coherent 400G |
| 2027 | TFLN PD | Wafer bonding | Coherent 800G |
| 2028 | Graphene PD | Heterogeneous | THz/THz comm |
| 2030 | Quantum detectors | Hybrid | Quantum networks |

---

*End of Piece 6. Next: Piece 7 - Clock and Data Recovery (CDR) in Optical Domain*