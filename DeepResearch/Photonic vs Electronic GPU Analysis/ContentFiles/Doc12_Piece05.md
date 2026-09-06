# Document 12: NVIDIA Architecture Evolution: Hopper to Feynman
## Piece 5: NVLink Evolution: 1.0 (80 GB/s) → 2.0 (1.8 TB/s) → Optical (TB/s)

---

### 12.5 NVLink Evolution: 1.0 (80 GB/s) → 2.0 (1.8 TB/s) → Optical (TB/s)

The evolution of NVLink from a simple GPU-to-GPU interconnect to a rack-scale optical fabric traces NVIDIA's strategy for overcoming the memory wall and enabling trillion-parameter model training. This piece traces the complete NVLink evolution from 1.0 through the optical era.

#### 12.5.1 NVLink 1.0 (Pascal, 2016)

**Specifications**:
- **Data rate**: 20 Gbps/lane (NRZ)
- **Lanes per link**: 4
- **Bandwidth per link**: 80 GB/s (bidirectional)
- **Links per GPU**: 4 (P100), 6 (GV100)
- **Aggregate**: 320-480 GB/s per GPU
- **Topology**: Mesh / Ring / Hybrid cube

**Signaling**:
- **Modulation**: NRZ (Non-Return-to-Zero)
- **Equalization**: FFE (Feed-Forward Equalization) at TX
- **Clock**: Forwarded clock (source-synchronous)
- **Encoding**: 8b/10b (20% overhead)

**Protocol**:
- **Packet-based**: Flit-based (variable length)
- **Flow control**: Credit-based (per virtual channel)
- **Virtual channels**: 8 (VC0-VC7)
- **Routing**: Source-based / Table-based

**Package integration**:
- **Wire bonds**: Traditional wire bonding to substrate
- **Reach**: < 50 mm (on-board)
- **Power**: ~10W per link (including SerDes)

**Limitations**:
- Wire-bond inductance limits data rate
- Short reach limits topology flexibility
- High power per Gbps (~150 mW/Gbps)
- No error correction (reliance on link reliability)

#### 12.5.2 NVLink 2.0 (Volta, 2017)

**Specifications**:
- **Data rate**: 25 Gbps/lane (NRZ)
- **Lanes per link**: 8 (up from 4)
- **Bandwidth per link**: 150 GB/s (bidirectional)
- **Links per GPU**: 6 (GV100)
- **Aggregate**: 900 GB/s per GPU

**Improvements over 1.0**:
- **Data rate**: 25 Gbps (vs 20 Gbps)
- **Lane count**: 8 (vs 4)
- **Reach**: 300 mm (vs 50 mm) - enables board-to-board
- **Encoding**: 64b/66b (3% overhead vs 20% 8b/10b)
- **FEC**: Light-weight FEC (Reed-Solomon)

**New capabilities**:
- **Multi-GPU scaling**: 8-GPU DGX-1 (NVLink cube)
- **Peer-to-peer**: Direct GPU-to-GPU memory access
- **Atomic operations**: Remote atomics across NVLink
- **Coherency**: Limited (via PCIe for CPU coherence)

**Package integration**:
- **TSV interposer**: Silicon interposer (CoWoS)
- **Microbumps**: Cu-Cu microbumps (35µm pitch)
- **Reach**: Up to 300mm (board-to-board via cable)

#### 12.5.3 NVLink 3.0 / 3.1 (Ampere, 2020)

**NVLink 3.0 (A100)**:
- **Data rate**: 28 Gbps/lane (NRZ)
- **Lanes per link**: 4 (x4) or 12 (x12)
- **Links per GPU**: 12 (6 x4 + 6 x12)
- **Bandwidth per link**: 50 GB/s (x4), 150 GB/s (x12)
- **Aggregate**: 600 GB/s per GPU

**NVLink 3.1 (A100 80GB / A30)**:
- **Data rate**: 28.125 Gbps (NRZ)
- **Improved signal integrity**: Better equalization

**Key features**:
- **NVLink Switch support**: External NVLink Switch (1st gen)
- **GPUDirect RDMA**: Direct NIC-to-GPU via NVLink
- **Unified memory**: Hardware page migration over NVLink
- **Multi-process service (MPS)**: Improved sharing

**Topology** (DGX A100):
- **8 GPUs**: Fully connected via NVLink 3.0 (12 links each)
- **NVLink Switch**: 12-port (optional, for multi-node)
- **Aggregate**: 4.8 TB/s per node

#### 12.5.4 NVLink 4.0 (Hopper, 2022)

**NVLink 4.0 (H100)**:
- **Data rate**: 50 Gbps/lane (PAM-4)
- **Lanes per link**: 4 (standard), 8 (high-bw)
- **Links per GPU**: 18 (max)
- **Bandwidth per link**: 100 GB/s (x4), 200 GB/s (x8)
- **Aggregate**: 900 GB/s (bidirectional)

**PAM-4 signaling**:
- **Modulation**: 4-level Pulse Amplitude Modulation
- **2 bits/UI**: 2× bandwidth vs NRZ at same baud
- **Equalization**: FFE (TX) + CTLE/DFE (RX)
- **FEC**: RS(544,514) + KR-FEC (optional)

**NVLink Switch (2nd gen)**:
- **Ports**: 64 ports × 50 GB/s
- **Aggregate**: 3.2 TB/s per switch
- **Topology**: Fat-tree (2-tier for 256 GPUs)
- **Latency**: < 200 ns (GPU-to-GPU via switch)

**New capabilities**:
- **In-network computing**: SHARP (Scalable Hierarchical Aggregation Reduction Protocol)
- **Collectives offload**: AllReduce, AllGather, Broadcast
- **Multicast**: Hardware multicast for parameter sync
- **Congestion control**: ECN-style feedback

**Power efficiency**:
- **Energy**: 3.5 pJ/bit (vs 5 pJ/bit NVLink 3.0)
- **SerDes**: 28nm → 7nm (improved efficiency)

#### 12.5.5 NVLink 5.0 / 6.0 (Blackwell / Rubin)

**NVLink 5.0 (Blackwell B200)**:
- **Data rate**: 100 Gbps/lane (PAM-4, 50 Gbaud)
- **Lanes per link**: 8 (standard)
- **Links per GPU**: 18
- **Bandwidth per link**: 400 GB/s (bidirectional)
- **Aggregate per GPU**: 1.8 TB/s (bidirectional)

**NVLink 5.0 enhancements**:
- **PAM-4 at 50 Gbaud**: Next-gen SerDes
- **FEC**: Enhanced RS(544,514) + LDPC
- **Equalization**: 16-tap FFE + 16-tap DFE
- **Clocking**: Forwarded clock + CDR (Clock Data Recovery)

**NVLink-C2C Gen 2** (die-to-die):
- **Data rate**: 100 Gbps/lane
- **Bandwidth**: 1.8 TB/s per die interface
- **Latency**: < 2 ns
- **Coherency**: Full cache coherency (CHI-C)

**NVLink 6.0 (Rubin)**:
- **Data rate**: 200 Gbps/lane (PAM-4, 100 Gbaud)
- **Lanes per link**: 16
- **Links per GPU**: 36 (est.)
- **Aggregate per GPU**: 7.2 TB/s (est.)

**NVLink 6.0 innovations**:
- **112 Gbaud PAM-4**: Next-gen SerDes
- **Co-packaged optics ready**: Optical-ready SerDes
- **CXL 3.0 integration**: CXL over NVLink
- **CXL.mem / CXL.cache**: Coherent memory expansion

#### 12.5.6 Optical NVLink (Feynman and beyond)

**Optical NVLink 7.0/8.0 (Feynman)**:
- **Modulation**: 224G/448G PAM-4, 128G/256Gbaud coherent
- **Data rate**: 448 Gbps/lane (224G PAM-4)
- **Lanes per link**: 16-32
- **Links per GPU**: 64-128
- **Aggregate**: 32-64 TB/s per GPU

**Optical SerDes**:
- **TX**: Silicon-organic hybrid modulator (EO polymer)
- **RX**: Ge/SiGe APD (avalanche photodiode)
- **Laser**: Integrated III-V (InP) or external CW laser
- **Wavelengths**: 16-64 λ (DWDM, C+L band)

**Optical NVLink protocol**:
- **Native optical**: No electrical SerDes in path
- **FEC**: Concatenated (RS + LDPC + Polar)
- **Flow control**: Credit-based (optical credit return)
- **QoS**: Priority classes (compute, storage, management)

**Optical NVLink Switch (ONS)**:
- **Technology**: MEMS / Electro-optic / Thermo-optic
- **Port count**: 1024-4096 ports
- **Switching time**: < 1 µs (MEMS), < 10 ns (electro-optic)
- **Blocking**: Non-blocking (full crossbar)
- **Power**: 10-50 W per switch

#### 12.5.7 Optical Circuit Switching Integration

**Optical Circuit Switching (OCS)**:
- **Technology**: MEMS mirror arrays (Google/Subcom)
- **Port count**: 256-4096 ports
- **Switching time**: 10-50 µs (MEMS)
- **Insertion loss**: < 1.5 dB
- **Crosstalk**: < -40 dB

**Hybrid packet/circuit network**:
- **Packet layer**: NVLink (electrical/optical) for small messages
- **Circuit layer**: OCS for bulk data (model params, checkpoints)
- **Control plane**: SDN-controlled (Google Jupiter style)
- **Reconfiguration**: Sub-second for circuit setup

**Rack-scale optical fabric** (Feynman SuperPOD):
```
GPU → Optical NVLink → OCS → Optical NVLink → GPU
     (intra-rack)      (inter-rack)   (intra-rack)
```

**Bandwidth allocation**:
- **Packet (NVLink)**: 10-20% (control, small tensors)
- **Circuit (OCS)**: 80-90% (model params, gradients, checkpoints)

#### 12.5.8 Energy Efficiency Evolution

**Energy per bit evolution**:
| Generation | Modulation | Data Rate | Energy (pJ/bit) | Improvement |
|------------|------------|-----------|-----------------|-------------|
| NVLink 1.0 | NRZ | 20 Gbps | 150 | Baseline |
| NVLink 2.0 | NRZ | 25 Gbps | 80 | 1.9× |
| NVLink 3.0 | NRZ | 28 Gbps | 50 | 1.6× |
| NVLink 4.0 | PAM-4 | 50 Gbps | 25 | 2.0× |
| NVLink 5.0 | PAM-4 | 100 Gbps | 12 | 2.1× |
| NVLink 6.0 | PAM-4 | 200 Gbps | 6 | 2.0× |
| Optical 7.0 | PAM-4 | 448 Gbps | 2.5 | 2.4× |
| Optical 8.0 | Coherent | 896 Gbps | 1.0 | 2.5× |

**Projected trend**: ~2× improvement per generation
- **2030 target**: < 0.5 pJ/bit (optical, coherent)
- **2035 target**: < 0.1 pJ/bit (quantum-enhanced)

#### 12.5.9 NVLink Ecosystem and Standards

**NVLink Consortium**:
- **Members**: NVIDIA, IBM, Mellanox, Cisco, HPE, Dell, Lenovo
- **Specification**: Open (royalty-free for members)
- **Conformance**: NVLink Integrators List

**Interoperability**:
- **CXL 3.0/4.0 over NVLink**: CXL.mem, CXL.cache over NVLink
- **PCIe 6.0/7.0 coexistence**: Shared SerDes, unified PHY
- **UCIe integration**: Chiplet-to-chiplet over UCIe + NVLink

**Future roadmap**:
| Year | Generation | Key Feature |
|------|------------|-------------|
| 2024 | NVLink 4.0 | PAM-4, 50 Gbps |
| 2025 | NVLink 5.0 | 100 Gbps PAM-4 |
| 2026 | NVLink 6.0 | 200 Gbps PAM-4 |
| 2027 | Optical NVLink 7.0 | 448 Gbps PAM-4 |
| 2028 | Optical NVLink 8.0 | Coherent 896 Gbps |
| 2029 | Optical NVLink 9.0 | 1.6 Tbps coherent |
| 2030 | Optical NVLink 10.0 | 3.2 Tbps, quantum-ready |

---

*End of Piece 5. Next: Piece 6 - Tensor Core Evolution: FP16 → BF16 → FP8 → FP4 → FP2*