# Document 13: Optical NVLink and Optical Circuit Switching Physics
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

*End of Piece 3. Next: Piece 4 - Optical Power Budget: Laser Wall-Plug Efficiency (WPE) > 30%*