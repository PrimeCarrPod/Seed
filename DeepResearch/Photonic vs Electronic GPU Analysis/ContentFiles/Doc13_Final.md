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

*End of Piece 1. Next: Piece 2 - MEMS Optical Circuit Switch: Mirror Tilt Angle vs. Insertion Loss*# Document 13: Optical NVLink and Optical Circuit Switching Physics
## Piece 2: MEMS Optical Circuit Switch: Mirror Tilt Angle vs. Insertion Loss

---

### 13.2 MEMS Optical Circuit Switch: Mirror Tilt Angle vs. Insertion Loss

MEMS (Micro-Electro-Mechanical Systems) optical circuit switches are the leading technology for large-port-count, low-loss optical circuit switching in datacenter and HPC networks. This piece analyzes the fundamental physics of MEMS mirror tilt actuation, its relationship to insertion loss, and the design trade-offs for datacenter-scale optical circuit switching.

#### 13.2.1 MEMS Mirror Physics

**Mirror actuation principles**:
- **Electrostatic actuation**: Parallel-plate or comb-drive
- **Electromagnetic actuation**: Magnetic torque on current-carrying coil
- **Piezoelectric actuation**: Strain-induced bending
- **Thermal actuation**: Bimorph bending (slow, high force)

**Electrostatic parallel-plate actuator** (most common):
```
Torque: τ = ½ × ε₀ × A × V² / d² × d_mirror
```
where:
- ε₀ = vacuum permittivity (8.85×10⁻¹² F/m)
- A = electrode area
- V = actuation voltage
- d = electrode gap
- d_mirror = distance from pivot to electrode center

**Mirror tilt angle**:
```
θ = τ / k_spring
```
where k_spring = torsional spring constant

**Pull-in voltage** (snap-through instability):
```
V_pi = √(8 × k_spring × d³ / (27 × ε₀ × A))
```
- **Stable range**: 0 < V < V_pi
- **Typical V_pi**: 50-150 V (depending on design)

#### 13.2.2 Mirror Design Parameters

**Mirror geometry**:
| Parameter | Typical Range | Impact |
|-----------|---------------|--------|
| Mirror diameter | 0.5-3 mm | Larger = lower diffraction loss |
| Mirror thickness | 10-50 µm | Thicker = stiffer, higher V_pi |
| Mirror material | Single-crystal Si, polysilicon, metal-coated | Reflectivity, stress |
| Gap (mirror to electrode) | 2-10 µm | Smaller = lower V_pi, higher capacitance |
| Pivot type | Torsion bar, flexure hinge | Stiffness, linearity |

**Optical performance**:
- **Reflectivity**: > 99.5% (Au/Ag coating)
- **Surface roughness**: < 1 nm RMS
- **Flatness**: < λ/10 (λ=1550 nm)
- **Fill factor**: > 90% (mirror area / cell area)

#### 13.2.3 Insertion Loss Mechanisms

**Insertion loss components**:
```
IL_total = IL_diffraction + IL_misalignment + IL_absorption + IL_scattering + IL_gap
```

**Diffraction loss** (Gaussian beam, circular aperture):
```
IL_diff = -10 log10(1 - exp(-2 × (w/a)²))
```
where w = beam waist radius, a = mirror radius

**Typical values**:
| Mirror Diameter | Beam Waist | Diffraction Loss |
|-----------------|------------|------------------|
| 1 mm | 200 µm | 0.02 dB |
| 1 mm | 300 µm | 0.1 dB |
| 2 mm | 300 µm | 0.01 dB |
| 2 mm | 500 µm | 0.1 dB |

**Misalignment loss** (lateral offset Δx):
```
IL_align = -10 log10(exp(-2 × (Δx/w)²))
```
For w = 300 µm: Δx = 10 µm → 0.03 dB, Δx = 50 µm → 0.7 dB

**Gap loss** (axial displacement Δz):
```
IL_gap = -10 log10(1 / (1 + (Δz/z_R)²))
```
where z_R = πw₀²/λ (Rayleigh range)

#### 13.2.4 Mirror Tilt Angle vs. Insertion Loss

**Optical path geometry** (2D MEMS switch):
```
Input fiber → Collimator → MEMS mirror → Output fiber
```

**Beam displacement** on output plane:
```
Δx = 2 × f × tan(θ)
```
where f = collimator focal length, θ = mirror tilt angle

**Coupling efficiency** (Gaussian beam):
```
η = exp(-2 × (Δx/w_out)²) × exp(-2 × (Δθ/θ_div)²)
```
where Δθ = angular misalignment, θ_div = beam divergence

**Insertion loss vs. tilt angle** (typical 2D MEMS):
| Tilt Angle | Beam Displacement | Coupling Loss | Total IL |
|------------|-------------------|---------------|----------|
| 0° (on-axis) | 0 | 0 dB | 0.2 dB |
| 5° | 1.7 mm | 0.1 dB | 0.3 dB |
| 10° | 3.5 mm | 0.4 dB | 0.5 dB |
| 15° | 5.2 mm | 1.2 dB | 1.5 dB |
| 20° | 7.0 mm | 2.5 dB | 2.8 dB |

**Optimal tilt range**: ±10° to ±15° (balance port count vs. loss)

#### 13.2.5 2D vs 3D MEMS Architectures

**2D MEMS** (single-axis tilt):
- **Port count**: 64-256 ports (practical)
- **Tilt axes**: 1 (tip/tilt)
- **Mirror array**: 2D grid
- **Optical path**: Collimator → Mirror → Output
- **Typical**: 128×128, 256×256

**3D MEMS** (dual-axis tilt):
- **Port count**: 1024-4096 ports
- **Tilt axes**: 2 (tip + tilt)
- **Mirror array**: 2D grid with 2D tilt
- **Optical path**: Input → 3D MEMS → Output
- **Typical**: 256×256, 1024×1024

**Comparison**:
| Parameter | 2D MEMS | 3D MEMS |
|-----------|---------|---------|
| Max ports | 256 | 4096 |
| Tilt range | ±15° | ±15° (per axis) |
| Insertion loss | 0.5-1.5 dB | 1-3 dB |
| Switching time | 1-10 ms | 5-50 ms |
| Complexity | Lower | Higher |
| Cost/port | Lower | Higher |

#### 13.2.6 Actuation Voltage and Power

**Electrostatic actuation**:
- **Voltage range**: 0-150 V (typical)
- **Capacitance**: 0.1-1 pF per electrode
- **Switching energy**: E = ½CV² ≈ 1-10 µJ per switch
- **Hold power**: Near zero (capacitive)

**Voltage scaling** (with mirror size):
| Mirror Diameter | V_pi (approx) | Switching Energy |
|-----------------|---------------|------------------|
| 500 µm | 30 V | 0.5 µJ |
| 1 mm | 60 V | 2 µJ |
| 2 mm | 120 V | 8 µJ |
| 3 mm | 180 V | 18 µJ |

**Drive electronics**:
- **HV DAC**: 12-16 bit, 200 V range
- **Charge pump**: On-chip or external
- **Switching time**: 0.1-1 ms (RC limited)
- **Slew rate**: Limited by mechanical resonance

#### 13.2.7 Switching Time and Dynamics

**Mechanical response**:
```
θ(t) = θ_final × (1 - exp(-t/τ_mech))
```
where τ_mech = √(I/k_spring) (mechanical time constant)

**Typical time constants**:
- **Small mirrors** (< 1 mm): 0.5-2 ms
- **Medium mirrors** (1-2 mm): 2-10 ms
- **Large mirrors** (> 2 mm): 10-50 ms

**Resonant frequency**:
```
f_res = 1/(2π) × √(k_spring/I)
```
- **Typical**: 1-10 kHz (depends on mirror size)
- **Damping**: Critical damping (ζ ≈ 0.7) for fast settling

**Settling time** (to 0.1%):
- **Critical damping**: t_settle ≈ 5/ζω_n
- **Typical**: 1-10 ms (to < 0.1% final position)

**Resonance avoidance**:
- **Drive waveform**: Shaped pulses (trapezoidal, sigmoid)
- **Feedforward**: Pre-distortion for resonance
- **Active damping**: Velocity feedback (capacitive sensing)

#### 13.2.8 Reliability and Lifetime

**Failure modes**:
1. **Stiction**: Mirror sticks to electrode (humidity, contamination)
2. **Fatigue**: Torsional hinge fatigue (10⁹-10¹⁰ cycles)
3. **Dielectric charging**: Charge buildup in dielectric
4. **Mirror deformation**: Stress-induced curvature change
5. **Coating degradation**: Reflectivity loss over time

**Lifetime targets** (datacenter):
- **Cycles**: > 10¹⁰ (10 billion switch cycles)
- **Operating life**: > 10 years continuous
- **MTBF**: > 1 million hours

**Accelerated testing**:
- **Temperature cycling**: -40°C to +85°C
- **Humidity**: 85% RH at 85°C
- **Voltage stress**: 1.5× rated voltage
- **Cycle testing**: 10⁹ cycles accelerated

#### 13.2.8 Advanced MEMS Technologies

**Digital MEMS** (binary mirrors):
- **States**: On/Off (no analog tilt)
- **Speed**: < 1 µs (resonant)
- **Port count**: > 10,000 ports
- **Application**: Optical cross-connect, LiDAR

**Analog MEMS with feedback**:
- **Capacitive sensing**: Position feedback (capacitive)
- **Closed-loop control**: Sub-µrad precision
- **Drift compensation**: Temperature, aging compensation

**Single-crystal silicon mirrors**:
- **Material**: SC-Si (single-crystal silicon)
- **Advantage**: No grain boundaries, low stress
- **Fabrication**: SOI wafer, DRIE etching

**Metal-coated vs. dielectric mirrors**:
| Coating | Reflectivity | Bandwidth | Durability |
|---------|--------------|-----------|------------|
| Au (Gold) | 99%+ | Broadband | Good |
| Ag (Silver) | 99.5%+ | Broadband | Fair (tarnish) |
| Al (Aluminum) | 92% | Broadband | Good |
| Dielectric | 99.9% | Narrowband | Excellent |

#### 13.2.9 MEMS Switch Scaling for Datacenters

**Port scaling trends**:
| Generation | Ports | Year | Technology |
|------------|-------|------|------------|
| Gen 1 | 16×16 | 2000 | 2D MEMS |
| Gen 2 | 64×64 | 2005 | 2D MEMS |
| Gen 3 | 256×256 | 2010 | 2D MEMS |
| Gen 4 | 1024×1024 | 2015 | 3D MEMS |
| Gen 5 | 4096×4096 | 2020 | 3D MEMS |
| Gen 6 | 16384×16384 | 2025 | 3D MEMS + AI |

**Google's MEMS OCS** (production):
- **Ports**: 256×256 (Gen 3), 1024×1024 (Gen 5)
- **Switching time**: 10 ms (Gen 3), 5 ms (Gen 5)
- **Insertion loss**: 0.8 dB (Gen 3), 1.2 dB (Gen 5)
- **Crosstalk**: -50 dB
- **Lifetime**: > 10¹⁰ cycles

**Future: Optical MEMS for AI clusters**:
- **Port count**: 4096-16384 per switch
- **Switching time**: < 1 ms (resonant)
- **Power**: < 100 W (full 4096×4096)
- **Integration**: Co-packaged with GPU/CPU

#### 13.2.10 Future: Resonant MEMS and Optical MEMS

**Resonant MEMS**:
- **Principle**: Drive at mechanical resonance
- **Speed**: 10-100× faster (sub-ms)
- **Amplitude**: Large angle at resonance
- **Challenge**: Precise frequency control, damping

**Optical MEMS (MOEMS) for LiDAR/communication**:
- **Scanning MEMS**: LiDAR beam steering
- **Optical phased arrays**: Solid-state beam steering
- **Integrated photonics + MEMS**: Co-packaged

**Quantum MEMS**:
- **Quantum-limited displacement sensing**
- **Squeezed-light enhanced MEMS**
- **Quantum-limited position measurement**

---

*End of Piece 2. Next: Piece 3 - Wavelength Routing: Broadcast-and-Select Architecture*# Document 13: Optical NVLink and Optical Circuit Switching Physics
## Piece 3: Wavelength Routing: Broadcast-and-Select Architecture

---

### 13.3 Wavelength Routing: Broadcast-and-Select Architecture

Wavelength routing enables dynamic, reconfigurable optical networks by assigning different wavelengths to different communication paths. The broadcast-and-select architecture is the dominant paradigm for wavelength-routed optical networks, offering scalability, flexibility, and compatibility with WDM systems.

#### 13.3.1 Broadcast-and-Select Principle

**Core concept**:
```
N inputs → Broadcast (star coupler/AWG) → N outputs
           ↓
       Each output receives ALL wavelengths
           ↓
       Wavelength selector (tunable filter) at each output
```

**Key principle**: 
- **Broadcast**: All wavelengths sent to all outputs (passive)
- **Select**: Each output tunes to desired wavelength (active)

**Advantages**:
- **Non-blocking**: Any input → any output (if wavelength available)
- **Scalability**: Add wavelengths for more capacity
- **Protocol transparent**: Any bit rate, format, protocol
- **Reconfigurable**: Dynamic wavelength assignment

#### 13.3.2 Broadcast Stage Architectures

**1. Star Coupler (Passive Star)**:
```
N inputs → 1×N star coupler → N outputs
```
- **Principle**: Equal power splitting (1/N per output)
- **Loss**: 10 log₁₀(N) + excess loss (3-5 dB typical)
- **Wavelengths**: All wavelengths to all outputs
- **Scalability**: Limited by splitting loss (practical: N ≤ 64)

**2. Arrayed Waveguide Grating (AWG)**:
```
Input → FPR1 → Waveguide array → FPR2 → Outputs
```
- **Routing**: Wavelength-dependent (cyclic)
- **Loss**: 3-6 dB (lower than star coupler for N > 32)
- **Crosstalk**: -25 to -30 dB
- **Channel spacing**: 50/100/200 GHz
- **Flatness**: ±0.5 dB (within passband)

**3. Planar Lightwave Circuit (PLC) Splitter**:
```
1×N or N×N PLC splitter
```
- **Technology**: Silica-on-silicon / SiN
- **Loss**: 0.1 dB/split + 10 log₁₀(N)
- **Uniformity**: ±0.3 dB
- **Scalability**: Up to 128×128

**4. Free-Space Broadcast** (MEMS-based):
```
Fiber array → Collimator array → MEMS mirror array → Output fibers
```
- **Advantage**: Low loss (< 1 dB), high port count
- **Scalability**: Up to 4096 ports
- **Flexibility**: Reconfigurable broadcast pattern

#### 13.3.3 Select Stage Architectures

**Tunable Filter Technologies**:

**1. Tunable Fabry-Perot Filter**:
```
Transmission: T = 1 / (1 + F sin²(φ/2))
F = π√R/(1-R) (finesse)
```
- **Tuning**: MEMS (cavity length) / Thermal / Electro-optic
- **Finesse**: 100-500
- **Tuning range**: C+L band (1520-1620 nm)
- **Speed**: 1-10 ms (MEMS), µs (electro-optic)

**2. Tunable Bragg Grating** (FBG):
```
λ_B = 2n_effΛ
```
- **Tuning**: Thermal (heater) / Strain (piezo)
- **Bandwidth**: 0.1-1 nm (tunable)
- **Reflectivity**: > 99%
- **Speed**: 1-10 ms (thermal), µs (piezo)

**3. Arrayed Waveguide Grating (AWG) Demux + Switch**:
```
AWG → Optical switch array → Output
```
- **Switch**: MEMS / SOA / Thermo-optic
- **Resolution**: Channel-level granularity
- **Speed**: Switch-limited (ms to ns)

**4. Microring Resonator (MRR) Bank**:
```
Bus waveguide → N MRRs (different radii) → Drop ports
```
- **Footprint**: < 100 µm × 100 µm per ring
- **Density**: 1000+ channels/mm²
- **Tuning**: Thermal (10 mW/ring) / Carrier injection
- **Speed**: 10 ns (carrier), 1 µs (thermal)

**5. Tunable Laser + Fixed Filter**:
```
Tunable laser → Fixed AWG/FBG → Output
```
- **Advantage**: No tunable filter at receiver
- **Disadvantage**: Requires N tunable lasers per node
- **Use case**: Coherent transceivers (increasingly common)

#### 13.3.4 Wavelength Assignment and Routing

**Static Wavelength Routing** (fixed assignment):
- **Assignment**: Fixed λ per connection
- **Simplicity**: No dynamic control
- **Waste**: Unused wavelengths blocked

**Dynamic Wavelength Routing** (Wavelength Switched Optical Network - WSON):
```
Control plane: Wavelength assignment algorithm
Data plane: Tunable transceivers + ROADM
```

**Routing and Wavelength Assignment (RWA)**:
```
Minimize: Blocking probability
Subject to: 
  1. Wavelength continuity (same λ end-to-end)
  2. Distinct wavelengths on shared links
  3. Transceiver tuning range constraints
```

**RWA algorithms**:
1. **First-fit**: First available wavelength
2. **Random-fit**: Random selection
2. **Least-loaded**: Minimize link load
3. **Most-used**: Pack wavelengths
4. **ILP/MILP**: Optimal (offline)

**Wavelength conversion** (relaxes continuity):
- **Full conversion**: Any λ_in → any λ_out
- **Limited conversion**: k wavelengths per node
- **Technology**: SOA-FWM, PPLN, EO modulator

#### 13.3.5 ROADM (Reconfigurable Optical Add-Drop Multiplexer)

**ROADM architectures**:

**1. Fixed Filter ROADM** (Gen 1):
```
Fixed filters → Fixed add/drop
```
- **Flexibility**: None (fixed wavelengths)
- **Cost**: Lowest
- **Use case**: Fixed metro rings

**2. Wavelength Selective Switch (WSS) ROADM** (Gen 2):
```
WSS (1×N) → Add/Drop ports
```
- **Flexibility**: Per-wavelength add/drop
- **WSS technology**: MEMS / LC / LCOS
- **Ports**: 1×9, 1×20, 1×40, 1×80
- **Grid**: 50/100/200 GHz, flexible grid

**3. Colorless/Directionless/Contentionless (CDC) ROADM** (Gen 3):
```
Colorless: Any wavelength any port
Directionless: Any direction any port
Contentionless: Multiple same λ different ports
```
- **Architecture**: Multiple WSS + optical couplers
- **Complexity**: O(N²) WSS ports
- **Benefit**: Maximum flexibility, no manual planning

**4. Flexible Grid (Flexgrid) ROADM**:
```
Super-channel support: n × 12.5 GHz slots
Variable bandwidth: 37.5 GHz - 600+ GHz
```
- **Standards**: ITU-T G.694.1, G.698.2
- **Efficiency**: 20-30% better spectrum utilization

#### 13.3.6 Wavelength Routing in Datacenters

**Topology: Broadcast-and-Select for AI Clusters**:
```
GPU Server (Tx) → Broadcast (Star/AWG) → OCS → Broadcast (Star/AWG) → GPU Server (Rx)
```

**Wavelength allocation strategies**:

**1. Static allocation**:
- Fixed λ per GPU pair
- Simple, no control plane
- Low utilization (many idle λ)

**2. Semi-static (semi-dynamic)**:
- Per-job wavelength assignment
- Reconfigure between jobs (seconds)
- Good for batch AI training

**3. Fully dynamic (WSON)**:
- Per-flow wavelength assignment
- Sub-second reconfiguration
- Requires fast tunable Tx/Rx, fast OCS

**Datacenter-specific considerations**:
- **Short reach**: < 100m (SMF), < 2km (SMF)
- **High port count**: 1000-4000 ports per OCS
- **Low latency**: < 10 µs switching (for AI collectives)
- **High reliability**: 99.999% availability

**Wavelength grid for datacenters**:
| Grid | Spacing | Channels | Use Case |
|------|---------|----------|----------|
| 100 GHz | 0.8 nm | 40-80 | Standard DWDM |
| 50 GHz | 0.4 nm | 80-160 | High density |
| 25 GHz | 0.2 nm | 160-320 | Flexgrid |
| 12.5 GHz | 0.1 nm | 320-640 | Super-channel |
| Flexible | 12.5 GHz slots | Variable | Super-channel, variable BW |

#### 13.3.7 Spectral Efficiency and Super-Channels

**Super-channel concept**:
```
Multiple sub-carriers → Single "super-channel"
```

**Super-channel architectures**:
1. **Nyquist-WDM**: Sinc-shaped pulses, zero guard band
2. **OFDM**: Orthogonal sub-carriers, cyclic prefix
3. **CAP**: Carrierless Amplitude/Phase modulation
4. **OFDM-OQAM**: Offset QAM, no cyclic prefix

**Spectral efficiency comparison**:
| Format | SE (bit/s/Hz) | Guard Band | Complexity |
|--------|---------------|------------|------------|
| NRZ | 0.8-1.0 | 20-30% | Low |
| PAM-4 | 1.6-2.0 | 10-20% | Medium |
| PAM-8 | 2.4-3.0 | 5-10% | High |
| Nyquist-WDM | 1.8-2.2 | 0% | High |
| OFDM | 3-6 | 5-10% | Very High |
| Probabilistic shaping | 5-8 | 5% | Very High |

**Super-channel in datacenters**:
- **400G**: 4×100G (Nyquist) / 1×400G (PAM-4)
- **800G**: 8×100G / 2×400G / 1×800G
- **1.6T**: 16×100G / 4×400G / 1×1.6T
- **3.2T**: 32×100G / 8×400G / 2×1.6T

#### 13.3.8 Coherent Detection for Wavelength Routing

**Coherent receiver advantages**:
- **Sensitivity**: -30 to -40 dBm (vs -15 dBm direct detect)
- **Dispersion tolerance**: Electronic CD compensation
- **PMD tolerance**: Electronic PMD compensation
- **Spectral efficiency**: 4-8 bit/s/Hz (vs 1-2 direct detect)
- **OSNR tolerance**: 3-6 dB better

**Coherent receiver architecture**:
```
Signal + LO → 90° Hybrid → 4 Balanced PDs → ADC → DSP
```

**DSP functions**:
- **CD compensation**: Frequency domain equalization
- **PMD compensation**: Adaptive MIMO equalizer
- **Carrier recovery**: Viterbi-Viterbi / Pilot-aided
- **Equalization**: CMA / LMS / RLS
- **Phase noise**: Wiener filter / Pilot-aided

**Coherent for datacenter**:
- **Reach**: 2km-10km (intra-DC), 80-120km (inter-DC)
- **Power**: 5-10W per coherent transceiver
- **Cost**: 5-10× direct detect
- **Trend**: Coherent lite (lite-coherent) for < 2km

#### 13.3.9 Optical Performance Monitoring

**In-service monitoring**:
1. **OPM (Optical Performance Monitoring)**:
   - OSNR, CD, PMD, PDL, BER
   - Per-channel, in-service
   
2. **Real-time telemetry**:
   - Per-channel power, OSNR, BER
   - Latency, jitter, dispersion
   - Alarm thresholds, predictive maintenance

3. **AI/ML-based analytics**:
   - Anomaly detection (anomalous loss, crosstalk)
   - Predictive failure (aging, degradation)
   - Optimization (wavelength assignment, power)

**Telemetry standards**:
- **OpenConfig / gNMI**: Model-driven telemetry
- **OpenROADM / TAPI**: Multi-vendor orchestration
- **OIF**: 400ZR, 400ZR+, 800ZR, 1600ZR

#### 13.3.10 Future: Quantum Wavelength Routing

**Quantum wavelength routing**:
- **Entangled photon routing**: Preserve entanglement
- **Quantum wavelength conversion**: FC, SFG, DFG
- **Quantum memory**: Storage and retrieval

**Quantum ROADM**:
- **Quantum add-drop**: Preserve entanglement
- **Quantum switching**: Path selection for entangled pairs
- **Entanglement distribution**: Quantum repeater nodes

**Quantum-secure wavelength routing**:
- **QKD over WDM**: Coexistence with classical
- **Twin-field QKD**: Long-distance QKD
- **Measurement-device-independent QKD**: MDI-QKD

---

*End of Piece 3. Next: Piece 4 - Optical Power Budget: Laser Wall-Plug Efficiency (WPE) > 30%*# Document 13: Optical NVLink and Optical Circuit Switching Physics
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

*End of Piece 4. Next: Piece 5 - Silicon Photonics Modulator: Depletion vs. Injection vs. GeSi*# Document 13: Optical NVLink and Optical Circuit Switching Physics
## Piece 5: Silicon Photonics Modulator: Depletion vs. Injection vs. GeSi

---

### 13.5 Silicon Photonics Modulator: Depletion vs. Injection vs. GeSi

Silicon photonics modulators are the critical active components that encode electrical data onto optical carriers. The choice of modulation mechanism—carrier depletion, carrier injection, or GeSi electro-absorption—determines the modulator's speed, power, footprint, and integration complexity.

#### 13.5.1 Modulation Physics in Silicon

**Plasma dispersion effect** (free-carrier effect):
```
Δn = -8.8×10⁻²² × ΔN_e - 8.5×10⁻¹⁸ × ΔN_h  (cm³)
Δα = 8.5×10⁻¹⁸ × ΔN_e + 6.0×10⁻¹⁸ × ΔN_h  (cm⁻¹)
```
where ΔN_e, ΔN_h = electron/hole concentration change (cm⁻³)

**Key parameters**:
- **Δn**: Refractive index change (phase modulation)
- **Δα**: Absorption coefficient change (amplitude modulation)
- **Phase shift**: Δφ = (2π/λ) × Δn × L
- **Extinction ratio**: ER = exp(Δα × L)

**Silicon limitations**:
- **No Pockels effect**: Silicon is centrosymmetric (χ⁽²⁾ = 0)
- **Free-carrier based**: Slower than Pockels (carrier dynamics)
- **Loss**: Free-carrier absorption (FCA) accompanies index change
- **Thermal sensitivity**: dn/dT = 1.86×10⁻⁴ K⁻¹ (thermal crosstalk)

#### 13.5.2 Carrier Depletion Modulator (Reverse-Biased PN Junction)

**Operating principle**:
- **Reverse bias**: Widens depletion region
- **Carrier sweep-out**: Electrons/holes removed from waveguide core
- **Δn < 0**: Refractive index increases (depletion)
- **Low loss**: Minimal free-carrier absorption in depletion region

**PN junction modulator**:
```
Reverse bias: V_R = 0 to -3V (typically -2V)
Depletion width: W_dep = √(2ε_s(V_bi + V_R)/(qN))
Capacitance: C_j = ε_sA/W_dep ∝ 1/√(V_bi + V_R)
```

**Performance metrics**:
| Parameter | Typical Value | Best Reported |
|-----------|---------------|---------------|
| V_πL_π | 2-3 V·cm | 1.2 V·cm |
| Bandwidth | 30-50 GHz | 70 GHz |
| Insertion loss | 2-4 dB | 1.5 dB |
| V_π | 2-4 V | 1.5 V |
| Footprint | 1-2 mm | 0.5 mm |
| Energy/bit | 50-100 fJ | 20 fJ |

**Depletion modulator advantages**:
- **Speed**: RC-limited (sub-ns to few ps)
- **Low loss**: Minimal FCA in depletion region
- **CMOS compatible**: Standard PN junction process
- **Low voltage**: 2-3V drive (CMOS compatible)
- **Linearity**: Good (quadratic C-V)

**Depletion modulator challenges**:
- **V_πL_π product**: Trade-off V_π vs L
- **Doping profile**: Abrupt vs graded junction
- **Optical loss**: Sidewall roughness, doping absorption
- **Thermal sensitivity**: V_π drifts with temperature

#### 13.5.3 Carrier Injection Modulator (Forward-Biased PIN)

**Operating principle**:
- **Forward bias**: Injects electrons/holes into intrinsic region
- **Carrier accumulation**: High ΔN in intrinsic region
- **Large Δn**: Strong phase/absorption change
- **High loss**: Significant FCA from injected carriers

**PIN diode modulator**:
```
Forward bias: I_F = q × A × (D_n n_p/L_n + D_p p_n/L_p) × (exp(qV/kT) - 1)
Carrier density: ΔN = I_F × τ / (q × A × L_i)
Phase shift: Δφ = (2π/λ) × Δn × L
```

**Performance metrics**:
| Parameter | Typical Value | Best Reported |
|-----------|---------------|---------------|
| V_π | 1-2 V | 0.5 V |
| V_πL_π | 0.5-1 V·cm | 0.2 V·cm |
| Bandwidth | 1-10 GHz | 25 GHz |
| Insertion loss | 5-15 dB | 3 dB |
| Extinction ratio | 10-20 dB | 30 dB |
| Energy/bit | 1-5 pJ | 100 fJ |

**Injection modulator advantages**:
- **Low voltage**: 1-2V drive
- **Large phase shift**: High Δn per volt
- **Compact**: Short L_π (100-500 µm)
- **Simple drive**: Forward bias (no HV)

**Injection modulator challenges**:
- **Speed limited by carrier lifetime**: τ = 1-10 ns (bulk Si)
- **High loss**: FCA from injected carriers
- **Pattern dependence**: Carrier lifetime effects
- **Thermal sensitivity**: Strong T-dependence of τ

**Speed enhancement techniques**:
1. **Carrier lifetime engineering**: Proton implantation, He⁺ implantation
2. **Pinched PIN**: Lateral p-n-p-n structure, field-assisted sweep-out
3. **Reverse recovery**: Pre-charge, fast sweep-out
3. **Traveling-wave electrode**: Velocity-matched, 50+ GHz

#### 13.5.4 Germanium-Silicon (GeSi) Electro-Absorption Modulator

**GeSi EAM principle**:
- **Material**: Ge₁₋ₓSiₓ (x = 0.2-0.5) on Si
- **Mechanism**: Quantum-confined Stark effect (QCSE)
- **Mechanism**: Electric field shifts absorption edge (Franz-Keldysh/QCSE)

**GeSi EAM structure**:
```
Si substrate → Si buffer → GeSi MQW → Si cap
PIN/PIN diode across MQW region
```

**GeSi EAM advantages**:
- **Direct bandgap** (Ge-rich): Strong absorption at 1310/1550 nm
- **CMOS compatible**: Ge on Si (epitaxial or transfer)
- **High speed**: > 50 GHz demonstrated
- **Low voltage**: < 2V (EAM) + 1-2V (laser)
- **Compact**: 200-500 µm length

**GeSi EAM performance**:
| Parameter | Typical | Best Reported |
|-----------|---------|---------------|
| Bandwidth | 30-50 GHz | 67 GHz |
| V_π | 1-2 V | 0.8 V |
| Extinction ratio | 10-15 dB | 25 dB |
| Insertion loss | 2-4 dB | 1.5 dB |
| Wavelength range | 1500-1600 nm | 1480-1620 nm |
| Temperature range | 0-70°C | -40 to 85°C |

**GeSi EAM challenges**:
- **Strain management**: Ge on Si (4.2% lattice mismatch)
- **Defect density**: Threading dislocations (TDD ~10⁶-10⁷/cm²)
- **Thermal budget**: Low-temp growth (< 450°C) for CMOS compatibility
- **Polarization sensitivity**: TE/TM extinction ratio
- **Temperature sensitivity**: Bandgap shift with T

**GeSi integration approaches**:
1. **Epitaxial Ge on Si**: Reduced thermal budget, high TDD
2. **Micro-transfer printing**: Ge on Si (heterogeneous)
3. **GeSn**: Higher Ge content (Sn reduces bandgap)
3. **Quantum well engineering**: Strain-balanced MQWs

#### 13.5.5 Silicon-Organic Hybrid (SOH) Modulator

**SOH concept**:
- **Organic EO polymer**: High χ⁽²⁾ (Pockels effect)
- **Integration**: Polymer cladding on Si waveguide
- **Pockels effect**: Δn = ½ n³ r E (linear EO effect)

**Organic EO polymers**:
| Polymer | r₃₃ (pm/V) | Bandwidth | Stability |
|---------|------------|-----------|-----------|
| JRD1 | 100-150 | >100 GHz | Good |
| BTR | 150-200 | >100 GHz | Moderate |
| Chromophore-doped | 200-300 | >100 GHz | Challenging |

**SOH modulator performance**:
| Parameter | Value |
|-----------|-------|
| V_πL_π | 0.5-1 V·cm |
| Bandwidth | >100 GHz |
| V_π | 1-2 V |
| Loss | 2-4 dB |
| Footprint | < 1 mm |

**SOH challenges**:
- **Poling stability**: Thermal decay of χ⁽²⁾
- **Thermal stability**: Polymer Tg > 150°C needed
- **Integration complexity**: Polymer deposition, poling
- **Reliability**: 10+ years at 85°C unproven

#### 13.5.6 Thin-Film Lithium Niobate (TFLN) Modulator

**TFLN advantages**:
- **Large Pockels coefficient**: r₃₃ = 30 pm/V
- **Low loss**: < 0.1 dB/cm
- **Wide bandwidth**: DC-100+ GHz
- **Low V_π**: < 1V (with push-pull)
- **Temperature stability**: dn/dT low

**TFLN on insulator (TFLNOI)**:
- **Structure**: LN (300-600 nm) / SiO₂ (2-3 µm) / Si
- **Fabrication**: Ion slicing / direct bonding / etching
- **Waveguide**: Ridge / slot / sub-wavelength grating

**TFLN modulator performance**:
| Parameter | Value |
|-----------|-------|
| V_πL_π | 0.5-1 V·cm |
| Bandwidth | >100 GHz (110 GHz demo) |
| V_π | < 1V (push-pull) |
| Loss | 1-2 dB/cm |
| Footprint | < 1 cm |
| Optical power handling | > 100 mW |

**TFLN challenges**:
- **Fabrication yield**: Uniform thin film, low loss
- **Photorefractive effect**: High optical power
- **Integration**: Hybrid (bonding) vs monolithic
- **Cost**: LN wafer cost, processing complexity

#### 13.5.7 Barium Titanate (BTO) on Silicon

**BTO properties**:
- **r₄₂**: 800-1200 pm/V (vs 30 for LN)
- **Curie temperature**: ~120°C (ferroelectric)
- **Bandgap**: 3.2 eV (transparent at 1550 nm)
- **Refractive index**: n ≈ 2.4 (1550 nm)

**BTO on Si integration**:
- **Epitaxy**: MBE/MOCVD on Si (buffer layers: SrTiO₃, MgO)
- **Polarization**: Self-poling / electric field poling
- **Thickness**: 100-500 nm (thin film)

**BTO modulator potential**:
- **V_πL_π**: < 0.5 V·cm (theoretical)
- **Bandwidth**: > 100 GHz
- **Footprint**: < 500 µm
- **Power**: < 10 mW (static)

**Challenges**: Ferroelectric domain control, fatigue, integration yield

#### 13.5.8 Modulator Comparison and Selection Guide

**Performance comparison** (1550 nm, 56 Gbaud PAM-4):

| Metric | Depletion PN | Injection PIN | GeSi EAM | SOH | TFLN |
|--------|--------------|---------------|----------|-----|------|
| Bandwidth | 50 GHz | 10 GHz | 50 GHz | 100 GHz | 100 GHz |
| V_π | 3 V | 1.5 V | 1.5 V | 1.5 V | 1 V |
| V_πL_π | 2.5 V·cm | 0.5 V·cm | 1 V·cm | 0.5 V·cm | 0.5 V·cm |
| Insertion loss | 2 dB | 8 dB | 2 dB | 3 dB | 1 dB |
| Extinction ratio | 15 dB | 20 dB | 15 dB | 20 dB | 20 dB |
| Energy/bit | 50 fJ | 500 fJ | 50 fJ | 20 fJ | 10 fJ |
| Footprint | 1.5 mm | 0.3 mm | 0.3 mm | 0.5 mm | 0.5 cm |
| CMOS compatible | Yes | Yes | Yes | Hybrid | Hybrid |
| TRL | 9 (production) | 7 (qualified) | 7 (qualified) | 5 (R&D) | 6 (prototyping) |
| Temperature sensitivity | Medium | High | Medium | High | Low |
| Optical power handling | High | Low | Medium | Medium | High |

#### 13.5.9 Modulator Selection by Application

**Datacenter interconnect (100-800G)**:
- **Choice**: Depletion PN / GeSi EAM
- **Reason**: CMOS compatible, 56-112 Gbaud, volume manufacturing

**Coherent transceiver (400ZR/800ZR)**:
- **Choice**: TFLN / TFLN-IQ modulator
- **Reason**: Low V_π, low loss, high linearity, high power handling

**AI cluster interconnect (NVLink optical)**:
- **Choice**: Depletion PN / GeSi EAM (integrated)
- **Reason**: CMOS compatible, 100-200 Gbaud, integration density

**HPC / Supercomputing**:
- **Choice**: TFLN / GeSi EAM (co-packaged)
- **Reason**: Low latency, high bandwidth, low power

**LiDAR / Sensing**:
- **Choice**: TFLN / SOH (high speed, low chirp)
- **Reason**: Fast tuning, low chirp, wide bandwidth

**Quantum/Photonic computing**:
- **Choice**: TFLN / SOH (low loss, high extinction)
- **Reason**: Quantum state fidelity, low loss

#### 13.5.10 Future: Unified Modulator Platform

**Heterogeneous integration vision**:
```
Si Photonic Wafer
├── Depletion PN modulators (high-volume, datacom)
├── GeSi EAM (high-speed, coherent)
├── TFLN modulators (high-performance, coherent)
├── SOH modulators (ultra-fast, quantum)
├── GeSi photodetectors (integrated Rx)
├── SiGeSn lasers (integrated Tx)
└── TFLN/GeSi TIA (integrated Rx)
```

**Monolithic integration roadmap**:
| Year | Integration Level | Key Enablers |
|------|-------------------|--------------|
| 2024 | Hybrid (III-V on Si) | Bonding, III-V on Si |
| 2026 | Heterogeneous (Si + III-V + LN) | Micro-transfer printing |
| 2028 | Quasi-monolithic | Selective area growth, aspect ratio trapping |
| 2030 | Monolithic (SiGeSn, GeSn) | Direct epitaxy on Si |

**Unified modulator platform vision**:
- **Single process flow**: All modulator types on one wafer
- **Design kit**: PDK with all modulator types
- **Compiler**: Auto-select modulator type per application
- **Yield**: > 90% (mature Si photonics process)

---

*End of Piece 5. Next: Piece 6 - Photodetector: Ge-on-Si vs. InGaAs APD Sensitivity*# Document 13: Optical NVLink and Optical Circuit Switching Physics
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

*End of Piece 6. Next: Piece 7 - Clock and Data Recovery (CDR) in Optical Domain*# Document 13: Optical NVLink and Optical Circuit Switching Physics
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

*End of Piece 6. Next: Piece 7 - Clock and Data Recovery (CDR) in Optical Domain*# Document 13: Optical NVLink and Optical Circuit Switching Physics
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

*End of Piece 7. Next: Piece 8 - Bit Error Rate (BER) vs. Q-factor for PAM-4 Optical*# Document 13: Optical NVLink and Optical Circuit Switching Physics
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

*End of Piece 8. Next: Piece 9 - FEC Overhead and Latency Trade-offs*# Document 13: Optical NVLink and Optical Circuit Switching Physics
## Piece 9: FEC Overhead and Latency Trade-offs

---

### 13.9 FEC Overhead and Latency Trade-offs

Forward Error Correction (FEC) is essential for achieving the ultra-low BER targets in high-speed optical interconnects, but it introduces overhead in bandwidth, latency, and power. This piece analyzes the trade-offs between different FEC schemes for optical NVLink and coherent optical interconnects.

#### 13.9.1 FEC Overhead Fundamentals

**Overhead definition**:
```
Overhead (%) = (n - k) / k × 100%
Code rate = k/n
```

where n = codeword length, k = information symbols

**Overhead impact on data rate**:
```
R_net = R_line × (k/n)
```
For 56 GBaud PAM-4 with KP4 (544/514):
- Line rate: 56 GBd × 2 bits/symbol = 112 Gbps
- Net rate: 112 × (514/544) = 105.9 Gbps
- Overhead: 5.84%

**Overhead vs. coding gain trade-off**:
- Higher overhead → stronger correction → lower pre-FEC BER required
- Lower overhead → higher net rate → less coding margin

#### 13.9.2 FEC Latency Components

**Total FEC latency**:
```
T_FEC = T_encode + T_transmit + T_decode + T_buffer
```

**Latency components**:
| Component | Typical Latency | Scaling |
|-----------|-----------------|---------|
| Encoding | 10-100 ns | O(k) to O(k log k) |
| Transmission | n/R_line | Linear in n |
| Decoding | 50-500 ns | O(n) to O(n log n) |
| Buffering | 1-10 codewords | Depends on burstiness |

**Latency by FEC type** (for 56G PAM-4, 544-symbol codeword):
| FEC Type | Encode Latency | Decode Latency | Total Latency |
|----------|----------------|----------------|---------------|
| KP4 RS(544,514) | 50 ns | 200 ns | 250 ns |
| oFEC (Open FEC) | 100 ns | 500 ns | 600 ns |
| LDPC (1/2, 64800 bits) | 200 ns | 1 µs | 1.2 µs |
| Turbo (1/2, 64800 bits) | 300 ns | 2 µs | 2.3 µs |
| Hamming (7,4) | 5 ns | 10 ns | 15 ns |

**Latency budget allocation** (100G PAM-4, 100km):
| Component | Latency Budget |
|-----------|----------------|
| FEC (Tx + Rx) | 1-2 µs |
| Propagation (100km) | 500 µs |
| SerDes + CDR | 100 ns |
| **Total** | **~501 µs** |

#### 13.9.3 FEC Schemes Comparison

**Reed-Solomon (RS) Codes**:
| Code | Rate | Overhead | t (correctable) | NCG (dB) |
|------|------|----------|-----------------|----------|
| RS(255,239) | 0.937 | 6.7% | 8 | 5.0 dB |
| RS(528,514) | 0.973 | 2.7% | 7 | 4.5 dB |
| RS(544,514) - KP4 | 0.945 | 5.8% | 15 | 5.5 dB |
| RS(528,514) | 0.973 | 2.7% | 7 | 4.5 dB |

**RS advantages**: Low latency, mature, low complexity
**RS disadvantages**: Limited coding gain, fixed overhead

**LDPC (Low-Density Parity-Check)**:
| Code | Rate | Overhead | NCG (dB) | Complexity |
|------|------|----------|----------|------------|
| LDPC (1/2) | 1/2 | 100% | 7.5 dB | High |
| LDPC (2/3) | 2/3 | 50% | 6.5 dB | High |
| LDPC (3/4) | 3/4 | 33% | 5.8 dB | Medium |
| LDPC (5/6) | 5/6 | 20% | 5.5 dB | Medium |
| LDPC (14/15) | 14/15 | 7% | 5.0 dB | Low-Medium |

**LDPC advantages**: Near-Shannon limit, flexible rates
**LDPC disadvantages**: Higher latency, iterative decoding, error floor

**Turbo Codes**:
- **Rate**: 1/3, 1/2, 2/3, 3/4
- **NCG**: 6-7 dB (rate 1/2)
- **Latency**: High (iterative, 10-20 iterations)
- **Use case**: Deep space, not optical interconnects

#### 13.9.4 FEC for Optical NVLink

**NVLink FEC requirements**:
- **Target BER**: < 10⁻¹⁵ (post-FEC)
- **Latency budget**: < 200 ns (link-level)
- **Power budget**: < 50 mW/lane (FEC portion)
- **Area budget**: < 0.1 mm²/lane

**NVLink FEC evolution**:
| Generation | FEC Scheme | Overhead | Latency | Net Coding Gain |
|------------|------------|----------|---------|-----------------|
| NVLink 1.0 | None | 0% | 0 | N/A |
| NVLink 2.0 | Hamming (SECDED) | 12.5% | 10 ns | 3 dB |
| NVLink 3.0 | RS(255,239) | 6.7% | 50 ns | 5 dB |
| NVLink 4.0 | Custom RS | 5% | 100 ns | 5.5 dB |
| NVLink 5.0 | RS + LDPC concat | 8% | 200 ns | 7 dB |
| Optical 7.0 | LDPC + KP4 concat | 10% | 500 ns | 8 dB |

**NVLink 5.0+ FEC architecture** (projected):
```
Outer: LDPC (3/4 or 5/6) - corrects burst errors
Inner: KP4 RS(544,514) - corrects random errors
Interleaver: Between outer/inner (burst dispersal)
```

#### 13.9.5 Latency-Overhead Pareto Frontier

**Pareto-optimal FEC designs** (for 100G+ optical):

| Design Point | Overhead | Net Coding Gain | Latency | Best For |
|--------------|----------|-----------------|---------|----------|
| KP4 RS(544,514) | 5.8% | 5.5 dB | 250 ns | Standard Ethernet |
| RS(528,514) | 2.7% | 4.5 dB | 150 ns | Low latency |
| LDPC(14/15) + RS | 10% | 6.5 dB | 500 ns | High reach |
| LDPC(5/6) + RS | 15% | 7.0 dB | 1 µs | Ultra-long haul |
| Hamming + RS | 10% | 4.5 dB | 50 ns | Ultra-low latency |

**Pareto frontier equation** (empirical):
```
NCG (dB) ≈ 10 log₁₀(1 + α × Overhead^β)
α ≈ 2.5, β ≈ 0.7 (for modern codes)
Latency ∝ Overhead^γ, γ ≈ 1.2
```

#### 13.9.5 Latency-Critical Applications

**HPC/AI Collective Operations** (AllReduce, AllGather):
- **Latency sensitivity**: High (critical path)
- **FEC requirement**: Ultra-low latency (< 100 ns)
- **Solution**: Minimal FEC (Hamming/SECDED) + ARQ

**Storage/Database Replication**:
- **Latency sensitivity**: Medium (ms-level acceptable)
- **FEC requirement**: Strong (LDPC + RS)
- **Solution**: Concatenated LDPC + RS

**Storage/Backup**:
- **Latency sensitivity**: Low (seconds acceptable)
- **FEC requirement**: Maximum protection
- **Solution**: Strong LDPC + outer RS + erasure coding

#### 13.9.6 ARQ (Automatic Repeat Request) vs. FEC

**Hybrid ARQ (HARQ) types**:
| Type | Description | Latency | Throughput |
|------|-------------|---------|------------|
| Type I | Retransmit same | High | Low |
| Type II | Incremental redundancy | Medium | High |
| Type III | New codeword each retry | Low | Highest |

**FEC vs. ARQ trade-off**:
| Scenario | Preferred | Reason |
|----------|-----------|--------|
| Low BER channel (<10⁻⁶) | FEC only | Low overhead |
| Bursty errors | FEC + ARQ | FEC corrects random, ARQ handles bursts |
| High latency path | ARQ (Type II/III) | RTT dominates |
| Ultra-low latency | FEC only (no ARQ) | ARQ latency unacceptable |

**Optical NVLink ARQ strategy**:
- **Link-level**: FEC only (no ARQ, latency-critical)
- **Packet-level**: End-to-end ARQ (transport layer)
- **Retry logic**: At transport layer (NVLink protocol)

#### 13.9.6 FEC Power Consumption

**Power breakdown** (per lane, 56G PAM-4):
| FEC Type | Encode Power | Decode Power | Total |
|----------|--------------|--------------|-------|
| KP4 RS | 5 mW | 15 mW | 20 mW |
| RS(528,514) | 3 mW | 10 mW | 13 mW |
| LDPC (5/6) | 15 mW | 50 mW | 65 mW |
| Turbo (1/2) | 25 mW | 80 mW | 105 mW |

**Power scaling**:
- **RS**: P ∝ n × f_clk (linear)
- **LDPC**: P ∝ iterations × n × f_clk (superlinear)
- **Turbo**: P ∝ iterations × n × f_clk (high)

**Energy per bit**:
```
E_bit = P_total / R_net
```

| FEC | E_bit (pJ/bit) | Overhead |
|-----|----------------|----------|
| KP4 RS | 15 | 5.8% |
| LDPC (3/4) | 35 | 33% |
| Turbo (1/2) | 80 | 100% |

#### 13.9.7 FEC for Coherent Optical (400ZR/800ZR/1600ZR)

**400ZR (400 Gbps, DP-16QAM)**:
- **FEC**: KP4 RS(544,514) × 2 (I/Q)
- **Overhead**: 5.84% (per polarization)
- **Net rate**: 400 Gbps × 2 × (514/544) = 755 Gbps gross
- **Latency**: 250 ns per polarization

**800ZR (800 Gbps, DP-16QAM)**:
- **FEC**: oFEC (Open FEC) - concatenated LDPC + RS
- **Overhead**: ~20% (higher for reach)
- **Net rate**: 800 Gbps
- **Latency**: 500-1000 ns

**1600ZR (1.6 Tbps)**:
- **FEC**: Concatenated LDPC (outer) + RS (inner)
- **Overhead**: 15-20%
- **Latency**: 1-2 µs
- **Net coding gain**: 8-10 dB

**ZR+ / ZR++ evolution**:
| Standard | Rate | Modulation | FEC | Overhead |
|----------|------|------------|-----|----------|
| 100ZR | 100G | DP-QPSK | KP4 | 5.8% |
| 400ZR | 400G | DP-16QAM | KP4 | 5.8% |
| 400ZR+ | 400G | DP-16QAM | oFEC | 20% |
| 800ZR | 800G | DP-16QAM | oFEC | 20% |
| 800ZR+ | 800G | DP-64QAM | LDPC+RS | 25% |
| 1600ZR | 1.6T | DP-64QAM | LDPC+RS | 25% |

#### 13.9.7 FEC Implementation Architectures

**Encoder architectures**:
1. **Serial LFSR** (RS): Low area, low speed
2. **Parallel LFSR** (RS): High speed, area ∝ parallelism
3. **Systolic array** (LDPC): Parallel, regular
4. **Layered decoder** (LDPC): High throughput, low latency
4. **Min-sum / Offset min-sum**: Approximate belief propagation

**Decoder architectures**:
1. **Serial**: Low area, low throughput
2. **Fully parallel**: High area, max throughput
3. **Layered/Partial parallel**: Balanced (most common)
4. **Pipelined**: Deep pipeline, high frequency

**Area comparison** (28nm, 56G):
| Decoder | Area (mm²) | Throughput | Latency |
|---------|------------|------------|---------|
| KP4 RS | 0.05 mm² | 112 Gbps | 250 ns |
| LDPC (3/4) | 0.5 mm² | 112 Gbps | 500 ns |
| LDPC (5/6) | 0.4 mm² | 112 Gbps | 700 ns |
| Turbo | 0.8 mm² | 112 Gbps | 2 µs |

#### 13.9.8 FEC for Emerging Applications

**AI/HPC Collective Communication**:
- **AllReduce/AllGather**: Low latency critical
- **FEC**: Minimal (SECDED) + application-level checkpointing
- **Rationale**: Collective time dominates, FEC latency adds up

**Storage/Backup**:
- **Erasure coding**: Reed-Solomon (k,n) across disks/nodes
- **Latency**: Seconds (acceptable)
- **Overhead**: 1.5-2× (RAID-6 equivalent)

**Quantum Communication**:
- **QEC (Quantum Error Correction)**: Surface codes, color codes
- **Overhead**: 10-100× (physical qubits per logical)
- **Latency**: µs-ms (syndrome extraction)

**Quantum Key Distribution (QKD)**:
- **Error correction**: Cascade, LDPC, Turbo
- **Privacy amplification**: Universal hashing
- **Latency**: ms (sifting, error correction, privacy amp)

#### 13.9.9 FEC Standardization Landscape

**Standards bodies**:
| Standard | FEC | Application |
|----------|-----|-------------|
| IEEE 802.3ck | KP4 RS(544,514) | 100/200/400G Ethernet |
| IEEE 802.3dj | TBD | 800G/1.6T Ethernet |
| OIF CEI-56G | KP4 RS | 56G electrical |
| OIF CEI-112G | oFEC / KP4 | 112G electrical |
| OIF 400ZR | KP4 | 400G coherent |
| OIF 800ZR | oFEC | 800G coherent |
| PCIe 6.0/7.0 | CRC + Retry | PCIe FLIT mode |
| NVLink 5.0 | Proprietary | NVLink protocol |

**Open FEC initiative** (OIF):
- **Goal**: Interoperable FEC for 800G+
- **Code**: LDPC + RS concatenated
- **Flexibility**: Programmable rates, overheads

#### 13.9.10 Future: AI-Designed Codes and Soft Decoding

**AI for FEC design**:
- **Neural decoders**: Replace belief propagation with NN
- **Code construction**: RL for LDPC degree distribution
- **Adaptive decoding**: RL-based early termination

**Soft-decision decoding evolution**:
| Generation | Algorithm | Complexity | Gain |
|------------|-----------|------------|------|
| Hard decision | Berlekamp-Massey | Low | Baseline |
| Soft decision (Chase) | Chase-II/III | Medium | +1-2 dB |
| Belief Propagation | Sum-product | High | +2-3 dB |
| Neural BP | NN-enhanced BP | Medium | +1-2 dB |
| Transformer decoder | Attention-based | High | +1-3 dB |

**Soft-output Viterbi (SOVA)**:
- **Application**: Turbo, convolutional
- **Soft output**: LLR (Log-Likelihood Ratio)
- **Use case**: Turbo decoder, concatenated codes

**Quantum error correction (future)**:
- **Surface code**: Threshold ~1%, overhead 100-1000×
- **Color codes**: Lower overhead, higher threshold
- **GKP codes**: Bosonic, continuous variable
- **Integration**: Hybrid quantum-classical FEC

---

*End of Piece 9. Next: Piece 10 - Coherent vs. Direct Detection: Sensitivity and Reach Comparison*# Document 13: Optical NVLink and Optical Circuit Switching Physics
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