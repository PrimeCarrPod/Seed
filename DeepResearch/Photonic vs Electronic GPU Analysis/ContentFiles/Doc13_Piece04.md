# Document 13: Optical NVLink and Optical Circuit Switching Physics
## Piece 4: Optical Power Budget: Laser Wall-Plug Efficiency (WPE) > 30%

---

### 13.4 Optical Power Budget: Laser Wall-Plug Efficiency (WPE) > 30%

The wall-plug efficiency (WPE) of semiconductor lasers is a critical metric determining the power budget of optical interconnects. Achieving >30% WPE is essential for meeting the stringent power budgets of next-generation optical NVLink and optical circuit switching systems.

#### 13.4.1 WPE Definition and Fundamentals

**Wall-Plug Efficiency (WPE) definition**:
```
WPE = P_optical / P_electrical = P_optical / (V_f × I_inject)
```
where:
- P_optical = Optical output power (W)
- P_electrical = Electrical input power (W)
- V_f = Forward voltage (V)
- I_inject = Injection current (A)

**Efficiency breakdown**:
```
WPE = η_injection × η_radiative × η_extraction
```
where:
- η_injection = Carrier injection efficiency
- η_radiative = Internal quantum efficiency (IQE)
- η_extraction = Light extraction efficiency

**Theoretical limits** (room temperature, 300K):
- **GaAs/AlGaAs** (850 nm): WPE_max ≈ 70-80%
- **InGaAsP/InP** (1310/1550 nm): WPE_max ≈ 50-60%
- **InGaAs/GaAs** (980 nm): WPE_max ≈ 70-80%
- **Fundamental limit**: Shockley-Queisser detailed balance

#### 13.4.2 VCSEL (Vertical-Cavity Surface-Emitting Laser)

**VCSEL structure**:
```
Top DBR (20-30 pairs) → Active region (QWs) → Bottom DBR (25-35 pairs)
```

**VCSEL WPE state-of-the-art**:
| Parameter | 850 nm (GaAs) | 980 nm (InGaAs) | 1310 nm (InGaAsP) |
|-----------|---------------|-----------------|-------------------|
| Peak WPE | 50-60% | 55-65% | 30-40% |
| Threshold current | 0.5-1 mA | 0.3-0.8 mA | 1-3 mA |
| Slope efficiency | 0.6-0.8 W/A | 0.8-1.0 W/A | 0.3-0.5 W/A |
| Max power | 5-10 mW | 10-20 mW | 2-5 mW |
| Modulation BW | 25-56 Gbaud | 30-56 Gbaud | 25-40 Gbaud |

**VCSEL WPE optimization**:
1. **DBR design**: High reflectivity (>99.9%), low absorption
2. **Active region**: Strain-compensated QWs, optimized number (3-5)
3. **Oxide confinement**: Precise aperture definition (5-10 µm)
3. **Thermal management**: Diamond submount, AuSn solder
4. **Doping optimization**: Minimize free-carrier absorption

**VCSEL WPE limitations**:
- **Series resistance**: DBR resistance, contact resistance
- **Thermal impedance**: Self-heating at high current
- **Gain compression**: Gain saturation at high photon density
- **Spatial hole burning**: Multi-mode oscillation

#### 13.4.3 Edge-Emitting Lasers (EML, DML, DFB)

**EML (Electro-absorption Modulated Laser)**:
- **Structure**: DFB laser + EA modulator (monolithic)
- **WPE**: 15-25% (lower than VCSEL due to modulator loss)
- **Advantage**: High speed (>100 Gbaud), chirp control
- **Application**: Coherent transceivers, 400G/800G

**DML (Directly Modulated Laser)**:
- **Structure**: DFB/DBR laser with direct current modulation
- **WPE**: 20-35% (higher than EML)
- **Limitation**: Chirp, bandwidth < 56 Gbaud
- **Application**: 100G/200G FR/LR, datacenter interconnects

**DFB (Distributed Feedback Laser)**:
- **Structure**: Grating in active region for single-mode
- **WPE**: 25-40% (CW operation)
- **Application**: External modulation (EAM, MZM), coherent Tx

**Edge-emitter WPE optimization**:
1. **Strain-compensated QWs**: Higher differential gain
2. **AlGaInAs/InP**: Better confinement, lower threshold
3. **Buried heterostructure**: Current confinement, low leakage
4. **High-reflection coatings**: R > 95% (front), < 0.1% (rear)

#### 13.4.4 Quantum Dot (QD) Lasers

**QD laser advantages**:
- **3D confinement**: Delta-function-like density of states
- **Low threshold**: J_th < 100 A/cm² (vs 1-2 kA/cm² QW)
- **Temperature insensitivity**: T₀ > 200K (vs 50-100K QW)
- **Low linewidth**: < 100 kHz (vs 1-10 MHz QW)
- **High WPE potential**: > 50% demonstrated

**QD laser WPE**:
- **Peak WPE**: 55-65% (1300 nm), 50-55% (1550 nm)
- **Temperature stability**: < 10% variation (0-80°C)
- **Modulation bandwidth**: 25-40 Gbaud (improving)
- **Reliability**: > 10⁶ hours at 80°C

**QD laser challenges**:
- **Modulation bandwidth**: Lower than QW (carrier capture time)
- **Gain saturation**: Lower differential gain
- **Manufacturing**: Epitaxy complexity, uniformity
- **Cost**: Higher than QW (MOCVD/MBE growth)

#### 13.4.5 Silicon Photonics Integrated Lasers

**Heterogeneous integration** (III-V on Si):
- **Bonding**: Adhesive / molecular / hybrid / direct
- **III-V materials**: InP, GaAs, GaSb
- **Si waveguide**: Low-loss (< 1 dB/cm), CMOS-compatible

**Integrated laser WPE**:
| Integration | WPE | Challenges |
|-------------|-----|------------|
| Adhesive bonding | 20-30% | Thermal resistance, CTE mismatch |
| Molecular bonding | 25-35% | Surface preparation, yield |
| Heterogeneous (wafer-level) | 30-45% | Defect density, thermal budget |
| Monolithic (GeSn, Ge) | < 10% | Indirect bandgap, low efficiency |

**Silicon photonics laser requirements**:
- **WPE target**: > 30% (for 100G+ transceivers)
- **Power**: < 200 mW (laser + modulator)
- **Temperature range**: -40°C to +85°C (no TEC)
- **Lifetime**: > 20 years (datacenter)

**Breakthrough approaches**:
1. **GeSn/SiGeSn**: Direct bandgap on Si (WPE ~10-20% emerging)
2. **Quantum dot on Si**: InAs/GaAs QD on Si (WPE 25-35%)
3. **Bonded III-V**: InP-on-Si (WPE 30-40% demonstrated)
4. **Micro-ring laser**: Ultra-low threshold, WPE > 40%

#### 13.4.6 External Cavity Lasers (ECL) for Coherent

**ECL architectures**:
1. **Littrow**: Grating in Littrow configuration
2. **Littman-Metcalf**: Grating + mirror (wavelength tuning)
3. **VECSEL**: Vertical-external-cavity surface-emitting laser
4. **Micro-ring laser**: Ring resonator + gain section

**ECL for coherent transceivers**:
- **Linewidth**: < 100 kHz (target < 10 kHz)
- **Tuning range**: C+L band (40-80 nm)
- **Tuning speed**: < 1 ms (MEMS), < 1 µs (electro-optic)
- **Side-mode suppression**: > 50 dB
- **RIN**: < -150 dB/Hz

**ECL integration with SiPh**:
- **Butt-coupling**: III-V gain chip + SiPh modulator
- **Evanescent coupling**: Evanescent coupling to Si waveguide
- **WPE**: 15-25% (system-level, including coupling loss)

#### 13.4.6 WPE Requirements for Optical NVLink

**Optical NVLink power budget** (Feynman era):
- **Target link power**: < 5 pJ/bit (target < 1 pJ/bit)
- **Link distance**: 100m (MMF), 2km (SMF), 10km (coherent)
- **Data rate**: 224 Gbps/lane (224G PAM-4), 896 Gbps (coherent)

**Laser power budget** (per lane):
| Component | Power (mW) | Notes |
|-----------|------------|-------|
| Laser (Tx) | 2-5 mW | CW, WPE > 30% |
| Modulator | 1-2 mW | EAM/MZM, V_π < 2V |
| Driver | 5-10 mW | CMOS 3nm, 50 Gbaud |
| TIA (Rx) | 5-10 mW | APD/TIA, 50 Gbaud |
| CDR/DSP | 10-20 mW | 7nm/5nm CMOS |
| **Total per lane** | **25-50 mW** | Target < 20 mW |

**Required laser WPE**:
```
P_elec = P_opt / WPE
For P_opt = 2 mW, WPE = 30% → P_elec = 6.7 mW
For P_opt = 2 mW, WPE = 50% → P_elec = 4 mW
```
**Target**: WPE > 40% for < 20 mW/lane total

#### 13.4.7 Thermal Management and WPE

**Temperature dependence of WPE**:
```
WPE(T) = WPE(25°C) × exp(-(T-25)/T₀)
```
**Characteristic temperature T₀**:
| Laser Type | T₀ (K) | WPE Drop (25→85°C) |
|------------|--------|---------------------|
| VCSEL (850nm) | 150-200K | 40-50% |
| VCSEL (980nm) | 200-250K | 30-40% |
| QW Laser (1310/1550) | 50-100K | 60-80% |
| QD Laser | 200-400K | 10-20% |

**Thermal management strategies**:
1. **Diamond submount**: κ = 2000 W/m·K (vs Cu 400)
2. **Microfluidic cooling**: Direct liquid cooling
3. **Thermo-electric cooler (TEC)**: For λ stabilization
4. **Adaptive bias**: Temperature-compensated bias current

**WPE vs temperature compensation**:
```
I_bias(T) = I_bias(25°C) × exp((T-25)/T₀)
V_f(T) = V_f(25°C) - α(T-25)
WPE(T) = P_opt / (I_bias(T) × V_f(T))
```

#### 13.4.7 Reliability and Aging Effects on WPE

**Degradation mechanisms**:
1. **Non-radiative recombination**: Defect generation (SRH)
2. **Facet degradation**: Catastrophic optical damage (COD)
3. **Contact degradation**: Electromigration, void formation
4. **Oxidation**: DBR oxidation (VCSEL), facet oxidation
5. **Dopant diffusion**: Zn, Be, C diffusion at high T

**WPE degradation model**:
```
WPE(t) = WPE₀ × exp(-t/τ_deg)
τ_deg = τ₀ × exp(E_a/kT)
```

**Accelerated aging** (Telcordia GR-468):
- **HTOL**: 85°C, 85% RH, 1000-2000 hours
- **HTRB**: High-temperature reverse bias
- **Cyclic aging**: Temperature cycling (-40°C to +85°C)

**WPE end-of-life criteria**:
- **WPE degradation**: < 20% drop from initial
- **Power degradation**: < 3 dB drop
- **Wavelength shift**: < 0.5 nm
- **Spectral width**: < 2× initial

#### 13.4.8 Future: >50% WPE Technologies

**Emerging approaches for >50% WPE**:

1. **Tunnel junction VCSEL**:
   - **Concept**: Tunnel junction replaces p-DBR
   - **Benefit**: Lower resistance, better heat extraction
   - **WPE**: 55-65% demonstrated (850 nm)

2. **Tunnel junction edge-emitter**:
   - **Concept**: n-p-n-p tunnel junction injection
   - **Benefit**: Lower series resistance, better heat spreading
   - **WPE**: 50-60% (1310/1550 nm)

3. **Photonic crystal surface-emitting laser (PCSEL)**:
   - **Concept**: 2D photonic crystal for feedback
   - **Advantage**: Large area, single mode, low divergence
   - **WPE**: 40-50% (large area, high power)

4. **Quantum cascade laser (QCL) inspired**:
   - **Concept**: Intersubband transitions
   - **Wavelength**: Mid-IR (4-12 µm)
   - **WPE**: >50% (mid-IR, cryogenic)

5. **Monolithic integration on diamond**:
   - **Substrate**: Single-crystal diamond (κ=2000 W/m·K)
   - **Thermal resistance**: < 5 K/W (vs 50 K/W Si)
   - **WPE boost**: 20-30% improvement at high power

6. **Quantum well intermixing**:
   - **Technique**: Impurity-free vacancy diffusion (IFVD)
   - **Benefit**: Bandgap engineering, lower loss
   - **WPE improvement**: 10-20% relative

7. **Non-Hermitian / Exceptional point lasers**:
   - **Concept**: Operate at exceptional point
   - **Benefit**: Enhanced sensitivity, single-mode
   - **WPE impact**: Under investigation

**WPE roadmap** (industry targets):
| Year | Datacom VCSEL | Coherent EML | SiPh Integrated |
|------|---------------|--------------|-----------------|
| 2024 | 50% | 25% | 30% |
| 2026 | 55% | 30% | 35% |
| 2028 | 60% | 35% | 40% |
| 2030 | 65% | 40% | 45% |
| 2032 | 70% | 50% | 50% |

---

*End of Piece 4. Next: Piece 5 - Silicon Photonics Modulator: Depletion vs. Injection vs. GeSi*