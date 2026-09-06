# Document 5: Wavelength Division Multiplexing Mathematics
## Piece 10: Wavelength Routing: Broadcast-and-Select vs. Wavelength-Selective Switch

---

### 5.10 Wavelength Routing: Broadcast-and-Select vs. Wavelength-Selective Switch

Wavelength routing architectures determine how WDM channels are switched and directed through optical networks. The two primary paradigms—broadcast-and-select and wavelength-selective switching—offer different trade-offs in scalability, loss, crosstalk, and flexibility for ROADMs, OXCs, and datacenter interconnects.

#### 5.10.1 Broadcast-and-Select Architecture

**Principle**: All wavelengths broadcast to all outputs; selection at receiver
- **Broadcast**: Passive splitter (star coupler, AWG)
- **Select**: Tunable filter at each receiver

**Star coupler (N×N)**:
- Input → 1/N splitter → N outputs
- Each output receives all wavelengths
- Receiver uses tunable filter to select desired λ

**AWG-based broadcast**:
- Cyclic AWG (periodic routing)
- Input i → output (i + k) mod N for wavelength k
- All wavelengths at each output (different mapping)

**Receiver-side selection**:
- Tunable filter (MEMS, LC, ring resonator)
- Switching time: μs to ms
- Filter bandwidth: channel spacing

**Advantages**:
- Simple, passive broadcast
- No wavelength conversion needed
- Scalable to many outputs
- Low cost per port

**Disadvantages**:
- 1/N splitting loss (10 log₁₀N dB)
- For N=64: 18 dB loss
- Amplified spontaneous emission (ASE) from pre-amplifier
- Limited by splitter loss budget

#### 5.10.2 Wavelength-Selective Switch (WSS)

**Principle**: Active routing of individual wavelengths
- Input fibers → Wavelength demux → Switching engine → Mux → Output fibers

**WSS configurations**:
- 1×N (add/drop)
- N×M (full switching)
- Flexible grid (37.5/75 GHz slots)

**Switching technologies**:
1. **MEMS (Micro-Electro-Mechanical Systems)**:
   - Tilt mirrors steer beams
   - 1D or 2D arrays
   - Low loss (0.5-1 dB), low crosstalk (-50 dB)
   - Slow (ms), high voltage

2. **LCoS (Liquid Crystal on Silicon)**:
   - Phase hologram on LC pixels
   - Flexible grid, hitless switching
   - Polarization dependent
   - Fast (ms), low voltage

3. **Liquid Crystal (LC) beam steering**:
   - Prism/grating via LC phase profile
   - Continuous steering
   - Low power

4. **Waveguide-based (Si photonics)**:
   - Thermo-optic MZI/MRR switches
   - Fast (μs), integrated
   - Higher loss, crosstalk

5. **Acousto-optic (AO)**:
   - Sound wave creates grating
   - Fast (μs), analog
   - Limited resolution

#### 5.10.3 WSS Architecture Comparison

**MEMS WSS (dominant commercial)**:
- Demux: grating or AWG
- MEMS mirror array (1D or 2D)
- Mux: same grating/AWG
- Ports: 1×4, 1×9, 1×20, 1×50
- Flexible grid: 50 GHz resolution
- IL: 4-6 dB (including demux/mux)
- Crosstalk: -40 to -50 dB
- PDL: < 0.3 dB

**LCoS WSS (emerging)**:
- Single LCoS panel for all ports
- Software-defined spectrum
- Hitless resizing
- IL: 5-7 dB
- PDL: < 0.5 dB (improving)

#### 5.10.4 ROADM Architectures

**CDC-ROADM (Colorless, Directionless, Contentionless)**:
- Any wavelength, any direction, no contention
- Uses WSS for add/drop
- Multiple WSS for directionless

**CD-ROADM (Colorless, Directionless)**:
- No contentionless (shared drop)
- Lower cost

**C-ROADM (Colorless only)**:
- Fixed direction
- Simpler

**Degree-N ROADM**:
- N directions (N = 2-20)
- Mesh networking
- WSS count scales with degree

**ROADM block diagram**:
Line amps → Demux → WSS (express) → Mux → Line amps
                    ↓
              WSS (add/drop)
                    ↓
              Transponders

#### 5.10.5 Broadcast-and-Select vs. WSS: Trade-offs

| Parameter | Broadcast-and-Select | WSS |
|-----------|---------------------|-----|
| Scalability (ports) | Excellent (passive) | Good (active) |
| Insertion loss | 10 log₁₀N dB | 4-7 dB (fixed) |
| Power | Passive (no power) | Active (WSS: 10-50W) |
| Switching speed | Filter speed (μs-ms) | WSS speed (ms) |
| Flexibility | Fixed grid | Flexible grid |
| Cost per port | Low (splitter) | High (WSS) |
| Crosstalk | Limited by filter | -40 to -50 dB |
| Granularity | Channel | Sub-channel (slice) |

**When to use broadcast-and-select**:
- Small N (< 16)
- Fixed wavelength assignment
- Cost-sensitive (access, metro)
- Datacenter (single-hop)

**When to use WSS**:
- Large N (> 16)
- Dynamic wavelength routing
- Mesh networks (core, metro)
- Flexible grid needed
- CDC requirements

#### 5.10.6 Datacenter Interconnect Architectures

**Single-hop (broadcast)**:
- ToR switches → passive star/AWG → servers
- All-to-all connectivity
- No routing latency
- Limited by splitter loss (N ≤ 64)

**Multi-hop (WSS/OXC)**:
- Spine-leaf with optical circuit switching
- OCS (Optical Circuit Switch) for elephant flows
- EPS (Electrical Packet Switch) for mice flows
- Hybrid OCS/EPS

**Optical Circuit Switching (OCS)**:
- MEMS OCS (Google, Microsoft)
- 10-50 μs switching
- Circuit-switched, not packet-switched
- Saves 30-50% power vs. all-electrical

**Wavelength-routed datacenter**:
- Each server: tunable Tx, fixed Rx (or coherent)
- Wavelength = destination
- AWG/star for routing
- Centralized wavelength assignment

#### 5.10.7 Flexible Grid and Elastic Optical Networking

**Flexible grid (ITU-T G.694.1)**:
- Slot width: 12.5 GHz
- Channel = N × 12.5 GHz
- Minimum guard band: 12.5 GHz

**WSS requirements for flex-grid**:
- Slot resolution: 12.5 GHz (or 6.25 GHz)
- Variable bandwidth per channel
- Hitless add/drop/resize

**Elastic optical networking**:
- Bandwidth on demand
- Modulation format adaptation
- Spectrum defragmentation

**Spectrum allocation algorithms**:
- First-fit, best-fit, exact-fit
- Defragmentation: hitless vs. make-before-break
- Fragmentation metric: usable spectrum blocks

#### 5.10.8 OXC (Optical Cross-Connect) Scaling

**OXC generations**:
- OXC-1: Opaque (O-E-O), digital switching
- OXC-2: Transparent (OOO), wavelength switching
- OXC-3: Translucent, selective regeneration

**Port count scaling**:
- MEMS OXC: 1000×1000 demonstrated
- 3D MEMS: 2D mirror arrays
- Waveguide OXC: Si photonics, 128×128

**Switching fabric architectures**:
- **Single-stage**: N×N direct (broadcast or WSS)
- **Two-stage**: N×k → k×N (Clos)
- **Three-stage**: Clos-N (scalable)

**Clos architecture for OXC**:
- Stage 1: N/r × r WSS
- Stage 2: r × N/r WSS
- Non-blocking if r ≥ 2N-1
- Practical: r = N/2 to N

#### 5.10.9 Emerging Wavelength Routing Technologies

**Silicon photonic OXC**:
- Thermo-optic MZI mesh
- 128×128 demonstrated
- μs switching, 10 dB loss
- CMOS compatible

**Hybrid MEMS/SiPh**:
- MEMS for coarse routing
- SiPh for fine add/drop
- Best of both worlds

**Free-space optical switching**:
- MEMS mirrors in free space
- 1000×1000 ports
- Low loss, low crosstalk
- Bulk, alignment sensitive

**Quantum wavelength routing**:
- Entanglement distribution
- Quantum repeaters
- Wavelength-selective Bell measurement

**AI-driven optical networking**:
- ML for traffic prediction
- Proactive wavelength allocation
- Reinforcement learning for routing

#### 5.10.10 Future: Petabit Optical Switching

**Scaling challenges**:
- Port count: 1000 → 10,000 → 100,000
- Power: WSS 10W/port → 100 kW total
- Control plane complexity
- Reliability (MTBF)

**Solutions**:
- **Photonic integration**: SiPh OXC (μW/port)
- **Hierarchical switching**: OCS for bulk, EPS for detail
- **Optical packet switching (OPS)**: label switching
- **Flow-based**: circuit for elephants, packet for mice

**Architecture evolution**:
- 2020s: CDC-ROADM, 400G/800G
- 2025: Flex-grid, 1.6T, open ROADM
- 2030: 10T superchannels, AI-driven
- 2035: Photonic integrated OXC, quantum-ready

**Conclusion**: Broadcast-and-select for small-scale, low-cost; WSS for large-scale, flexible, dynamic networks. Convergence toward photonic integration for power/scaling.

---

*End of Piece 10. Document 5 complete (10 pieces). Next: Glue pieces into Doc05_Final.md*