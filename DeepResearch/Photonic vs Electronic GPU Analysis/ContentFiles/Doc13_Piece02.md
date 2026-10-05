# Document 13: Optical NVLink and Optical Circuit Switching Physics
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

*End of Piece 2. Next: Piece 3 - Wavelength Routing: Broadcast-and-Select Architecture*