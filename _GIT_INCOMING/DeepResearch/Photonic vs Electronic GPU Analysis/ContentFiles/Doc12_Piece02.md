# Document 12: NVIDIA Architecture Evolution: Hopper to Feynman
## Piece 2: Blackwell B200: Dual-Die, 208B Transistors, 20 pJ/flop

---

### 12.2 Blackwell B200: Dual-Die, 208B Transistors, 20 pJ/flop

The Blackwell architecture (B200 GPU) represents NVIDIA's most ambitious GPU to date, employing a dual-die architecture with 208 billion transistors fabricated on TSMC's 4NP process. This piece analyzes the Blackwell architecture's dual-die design, energy efficiency targets, and its role as the bridge between Hopper and Feynman.

#### 12.2.1 Dual-Die Architecture

**B200 package architecture**:
- **Two reticle-limited dies**: 2 × 850 mm² = 1700 mm² total
- **Total transistors**: 208 billion (104B per die)
- **Inter-die interconnect**: NVLink-C2C (die-to-die)
- **Package**: CoWoS-L (TSMC Chip-on-Wafer-on-Substrate)

**Per-die composition** (GB200 die, 104B transistors):
| Block | Transistors (B) | Percentage |
|-------|-----------------|------------|
| Compute (SMs + Tensor Cores) | 72.8 | 70% |
| L2 Cache (128 MB/die) | 8.3 | 8% |
| HBM3E Interface (4 stacks) | 4.2 | 4% |
| NVLink 5.0 (18 links) | 2.1 | 2% |
| NVLink-C2C (die-to-die) | 4.2 | 4% |
| PCIe 6.0 / I/O | 1.0 | 1% |
| Control/Logic/Other | 12.5 | 12% |

**Inter-die NVLink-C2C**:
- **Bandwidth**: 1.8 TB/s (die-to-die)
- **Links**: 100+ parallel lanes
- **Latency**: < 5 ns (die-to-die)
- **Protocol**: Coherent, cache-coherent across dies
- **Power**: ~20W for inter-die link

#### 12.2.2 TSMC 4NP Process

**4NP (4nm Performance) process**:
- **Density**: 10% higher than 4N
- **Performance**: +6% at iso-power vs 4N
- **Power**: -10% at iso-speed vs 4N
- **EUV layers**: 15+ (vs 12 for 4N)

**Blackwell-specific optimizations**:
- **Clock frequency**: 2.2-2.4 GHz target (vs 2.0 GHz H100)
- **Voltage**: 0.75V typical (vs 0.80V H100)
- **SRAM**: High-density 5T/6T bitcells
- **Clock distribution**: Resonant clocking for >2 GHz

#### 12.2.3 5th Generation Tensor Cores (Blackwell)

**Precision support**:
- **FP4**: Native FP4 (E2M1) for inference
- **FP6**: FP6 (E3M2/E2M3) for training
- **FP8**: E4M3/E5M2 (enhanced from Hopper)
- **FP16/BF16**: Full support
- **TF32**: Continued support
- **INT4/INT8**: Enhanced sparsity support

**Performance targets** (per B200 GPU, dual-die):
| Precision | Dense TFLOPS | Sparse (2:4) TFLOPS | vs H100 |
|-----------|--------------|---------------------|---------|
| FP4 | 20,000 | 40,000 | 10× |
| FP6 | 10,000 | 20,000 | 5× |
| FP8 | 5,000 | 10,000 | 2.5× |
| FP16/BF16 | 2,500 | 5,000 | 2.5× |
| TF32 | 1,250 | 2,500 | 2.5× |
| FP16 (dense) | 2,500 | - | 2.5× |
| FP64 | 90 | - | 1.3× |

**Transformer Engine 2.0**:
- **FP4/FP6 quantization**: Per-tensor + per-channel
- **Micro-scaling**: 8×8 block scaling
- **Online calibration**: Dynamic range tracking
- **Kernel fusion**: Attention + FFN fusion

#### 12.2.4 Energy Efficiency: 20 pJ/flop Target

**Energy per operation** (target):
| Precision | Energy (pJ/op) | vs H100 |
|-----------|----------------|---------|
| FP4 | 5 | 4× better |
| FP6 | 8 | 3× better |
| FP8 | 12 | 2.5× better |
| FP16/BF16 | 20 | 2× better |
| TF32 | 30 | 1.5× better |
| FP64 | 500 | 1.2× better |

**System-level efficiency** (B200 in GB200 NVL72):
- **System power**: 120 kW/rack (72 GPUs)
- **Compute density**: 1.44 EFLOPS/FP4 per rack
- **Power efficiency**: 12 GFLOPS/FP4 per watt
- **Cooling**: Liquid cooling mandatory (direct-to-chip)

**Power breakdown** (B200 GPU, 1000W TDP):
| Component | Power (W) | Percentage |
|-----------|-----------|------------|
| Compute (SMs + Tensor Cores) | 550W | 55% |
| HBM3E (8 stacks × 24GB) | 180W | 18% |
| NVLink 5.0 (18 links) | 90W | 9% |
| NVLink-C2C (die-to-die) | 40W | 4% |
| L2 Cache / SRAM | 60W | 6% |
| PCIe 6.0 / I/O | 30W | 3% |
| Leakage / Other | 80W | 8% |

#### 12.2.5 Memory Subsystem

**HBM3E Memory**:
- **8 stacks × 24 GB**: 192 GB total (per B200 GPU)
- **9.2 Gbps/pin**: 8 TB/s aggregate bandwidth
- **12-high stacking**: 12-hi HBM3E
- **Bandwidth per GPU**: 8 TB/s (vs 3 TB/s H100)

**L2 Cache** (unified):
- **256 MB total** (128 MB per die)
- **2× H100 L2 capacity**
- **Bandwidth**: 20 TB/s (aggregate)

**NVLink 5.0**:
- **18 links × 100 GB/s**: 1.8 TB/s per GPU
- **3.6 TB/s**: Dual-GPU (B200) aggregate
- **Protocol**: Flit-based, 256b flit
- **Flow control**: Credit-based, virtual channels

#### 12.2.6 Blackwell Architecture Innovations

**RAS (Reliability, Availability, Serviceability)**:
- **ECC**: End-to-end ECC (HBM, SRAM, NVLink)
- **Retry**: Link-level retry with CRC
- **Degraded mode**: Graceful degradation (link/die failure)
- **Telemetry**: Real-time health monitoring

**Decompression Engine** (new):
- **LZ4/ZSTD**: Hardware decompression
- **Bandwidth**: 10 TB/s aggregate
- **Use case**: Compressed model weights, datasets

**TMA (Tensor Memory Accelerator) 2.0**:
- **Async copy**: 10 TB/s bidirectional
- **Cluster support**: Multi-SM coordination
- **Compression**: Inline compression support

**Distributed Shared Memory** (enhanced):
- **Capacity**: 256 MB L2 (distributed)
- **Atomics**: 128-bit CAS, distributed reduction
- **Consistency**: Sequential consistency model

#### 12.2.7 GB200 NVL72 System

**Rack-scale system** (GB200 NVL72):
- **72 B200 GPUs**: 36 GB200 Superchips (2×B200 + 1 Grace CPU)
- **Grace CPUs**: 36 × 72-core Grace (Arm Neoverse V2)
- **NVLink domain**: 72 GPUs fully connected (NVLink Switch)
- **Aggregate bandwidth**: 130 TB/s (NVLink fabric)
- **Aggregate compute**: 1.44 EFLOPS/FP4, 720 PFLOPS/FP16
- **Memory**: 13.8 TB HBM3E (72 × 192 GB)
- **Power**: 120 kW/rack (liquid cooled)

**NVLink Switch** (3rd gen):
- **Ports**: 144 ports × 100 GB/s
- **Fabric**: 2-layer fat-tree (72 GPUs)
- **Latency**: < 200 ns (GPU-to-GPU)
- **Power**: 2 kW per switch tray

#### 12.2.8 Blackwell as Feynman Predecessor

**Architectural continuity**:
- **Tensor Core evolution**: FP4/FP6 → FP2/FP4 (Feynman)
- **Transformer Engine**: 2.0 → 3.0 (Feynman)
- **NVLink**: 5.0 → 6.0/7.0 (Feynman)
- **Interconnect**: NVLink-C2C → Integrated fabric (Feynman)
- **Packaging**: CoWoS-L → CoWoS-R/SoIC (Feynman)

**Scaling trajectory**:
| Generation | Transistors | Process | TDP | FP4 TFLOPS | FP16 TFLOPS |
|------------|-------------|---------|-----|------------|-------------|
| H100 (Hopper) | 80B | 4N | 700W | - | 1,979 |
| B200 (Blackwell) | 208B | 4NP | 1,000W | 20,000 | 2,500 |
| Feynman (est.) | ~500B | 3nm/2nm | 1,500W | 100,000 | 10,000 |

**Key enablers for Feynman**:
- Dual-die → Multi-die (4-8 dies)
- CoWoS-L → CoWoS-R/SoIC (3D stacking)
- NVLink-C2C → On-die optical interconnect
- HBM3E → HBM4/optical I/O

---

*End of Piece 2. Next: Piece 3 - Rubin R100: 3nm, Chiplet Architecture, HBM4 Integration*