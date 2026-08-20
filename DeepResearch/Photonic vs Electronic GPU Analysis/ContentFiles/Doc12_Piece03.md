# Document 12: NVIDIA Architecture Evolution: Hopper to Feynman
## Piece 3: Rubin R100: 3nm, Chiplet Architecture, HBM4 Integration

---

### 12.3 Rubin R100: 3nm, Chiplet Architecture, HBM4 Integration

The Rubin architecture (R100) represents NVIDIA's transition to a fully disaggregated chiplet architecture on TSMC's 3nm process (N3E/N3P), integrating HBM4 memory and optical I/O as standard features. This piece analyzes the Rubin architecture's chiplet-based design, 3nm process advantages, and HBM4 integration.

#### 12.3.1 Chiplet Architecture Overview

**Rubin chiplet disaggregation**:
- **Compute chiplets**: 8-16 compute dies (each 150-200 mm²)
- **I/O die**: Central I/O hub (500-800 mm²)
- **Cache die**: Shared L3/L4 cache (optional, 256-512 MB)
- **Optical I/O die**: Co-packaged optics (8-16 Tb/s)
- **Interconnect**: 2.5D/3D hybrid (CoWoS-R + SoIC)

**Total transistor count**: ~300-400 billion
**Package size**: ~2500-3000 mm² (beyond reticle limit)
**Target TDP**: 1200-1500W (liquid cooled)

**Chiplet breakdown** (R100, 16 compute chiplets):
| Chiplet Type | Count | Area (mm²) | Transistors (B) | Function |
|--------------|-------|------------|-----------------|----------|
| Compute | 16 | 180 | 12 | 64 SMs, 512 Tensor Cores |
| I/O Hub | 1 | 600 | 15 | NVLink, PCIe, PCIe, Optical I/O |
| L3 Cache | 4 | 150 | 8 | 512 MB L3 (distributed) |
| Optical I/O | 2 | 200 | 5 | 16 Tb/s optical I/O |
| **Total** | **23** | **~4,200** | **~350** | |

#### 12.3.2 TSMC N3E/N3P Process (3nm)

**N3E (3nm Enhanced)**:
- **Density**: 1.7× N5 (290 MTr/mm² logic)
- **Performance**: +18% speed at iso-power vs N5
- **Power**: -32% at iso-speed vs N5
- **EUV layers**: 20-25

**N3P (3nm Performance)**:
- **Density**: 1.1× N3E
- **Performance**: +5% at iso-power vs N3E
- **Power**: -10% at iso-speed vs N3E
- **EUV layers**: 25+

**Rubin-specific optimizations**:
- **High-frequency libraries**: 3.0-3.5 GHz target
- **Low-voltage operation**: 0.65V typical (vs 0.75V 4NP)
- **SRAM**: 4T/5T bitcells (ultra-high density)
- **Backside power delivery**: BSPD (Buried Power Delivery)

#### 12.3.3 Chiplet Interconnect Architecture

**UCIe (Universal Chiplet Interconnect Express)**:
- **Standard**: UCIe 1.1/2.0
- **Data rate**: 32-64 GT/s per lane
- **Lane count**: 256-512 lanes per chiplet interface
- **Bandwidth**: 2-4 TB/s per chiplet interface
- **Energy**: <0.5 pJ/bit (advanced package)

**NVLink-C2C evolution** (die-to-die):
- **Gen 2**: 200 GB/s per lane, 128 lanes
- **Bandwidth**: 25 TB/s per chiplet interface
- **Latency**: < 2 ns
- **Coherency**: Full cache coherency (CHI-C)

**3D stacking (SoIC - System on Integrated Chips)**:
- **Compute on Cache**: Compute chiplets stacked on cache die
- **TSV pitch**: < 4 µm
- **Density**: 10,000 TSV/mm²
- **Thermal**: Microfluidic cooling between layers

#### 12.3.4 HBM4 Memory Integration

**HBM4 specifications** (JEDEC standard):
- **Data rate**: 6.4-9.6 Gbps/pin (vs 9.2 Gbps HBM3E)
- **Interface**: 2048-bit per stack (vs 1024-bit HBM3)
- **Stack height**: 16-hi (16 layers)
- **Capacity per stack**: 24-32 GB
- **Total bandwidth**: 1.5-2.0 TB/s per stack

**Rubin HBM4 configuration**:
- **Stacks per GPU**: 8-12 stacks
- **Total capacity**: 192-384 GB HBM4
- **Aggregate bandwidth**: 12-24 TB/s
- **Interface**: 16K-24K bits wide (vs 8K HBM3E)

**HBM4 innovations**:
- **Logic die**: Integrated controller + ECC + compression
- **TSV**: Hybrid bonding (Cu-Cu direct)
- **Power**: 30% lower pJ/bit vs HBM3E
- **Thermal**: Integrated thermal sensors, fluid cooling channels

**Memory subsystem hierarchy**:
```
L1 (Register/Shared) → L2 (per SM) → L3 (per chiplet, 32 MB) → L4 (distributed, 512 MB) → HBM4 (192-384 GB)
```

#### 12.3.5 Optical I/O Integration

**Co-packaged optics (CPO)**:
- **Optical I/O chiplets**: 2-4 per package
- **Data rate**: 200 Gbps/lane (112G PAM-4 / 224G PAM-4)
- **Lane count**: 64-128 lanes per optical die
- **Aggregate bandwidth**: 8-16 Tb/s per optical die
- **Total optical I/O**: 16-32 Tb/s per GPU

**Optical engine** (integrated in optical I/O die):
- **Laser array**: 64-128 VCSELs / EMLs
- **Modulator**: Silicon photonics (Mach-Zehnder / Ring)
- **Detector**: Ge/SiGe photodiodes
- **Driver/TIA**: 3nm CMOS (co-designed)

**Optical interconnect topology**:
- **Scale-up**: GPU-to-GPU (NVLink optical)
- **Scale-out**: Rack-to-rack (optical circuit switching)
- **Reach**: 100m (VCSEL), 2km (EML)

**Optical NVLink 6.0/7.0**:
- **Data rate**: 224 Gbps/lane (PAM-4)
- **Lanes per link**: 16-32
- **Reach**: 100m (MMF), 2km (SMF)
- **Energy**: < 2 pJ/bit (target)

#### 12.3.6 Rubin Architecture Innovations

**Next-Gen Tensor Cores (6th Gen)**:
- **FP2/FP4**: Native 2-bit/4-bit floating point
- **FP6/FP8**: Enhanced training precision
- **MXFP8/MXFP4**: Micro-scaling formats
- **Sparsity**: 2:4 structured + unstructured 50%
- **Tensor Core density**: 2× Blackwell

**Execution Model Enhancements**:
- **Persistent threads**: Persistent kernel execution
- **Async execution**: Graph capture + async dispatch
- **Cluster launch**: Multi-GPU single kernel launch
- **Dynamic parallelism**: Hardware-managed child kernels

**Memory Management**:
- **Unified memory**: Hardware page migration
- **Compression**: Lossless (ZSTD) + lossy (FP8) inline
- **Tiering**: HBM → CXL → SSD (hardware managed)

**Security & Confidential Computing**:
- **TEE**: Hardware TEE (TrustZone-like)
- **Attestation**: Remote attestation for multi-tenant
- **Encryption**: Inline memory encryption (AES-256-XTS)
- **Key management**: Hardware root of trust

#### 12.3.7 Rubin System-Level Integration

**NVLink 7.0 / 8.0**:
- **Data rate**: 224-448 Gbps/lane
- **Lanes per GPU**: 144-288
- **Aggregate bandwidth**: 4-8 TB/s per GPU
- **NVLink Switch**: 3rd/4th gen (512-1024 ports)

**Grace CPU Integration** (Vera CPU successor):
- **CPU**: Vera (Arm Neoverse V3/V4, 144-288 cores)
- **Coherency**: CHI-C + CXL 3.0
- **Unified memory**: CPU+GPU unified address space
- **CPU-GPU bandwidth**: 2 TB/s (NVLink-C2C)

**Rack-scale system** (RV100 NVL144):
- **GPUs**: 144 Rubin GPUs (72 dual-die packages)
- **CPUs**: 36 Vera CPUs (2 per 4 GPUs)
- **NVLink domain**: 144 GPUs fully connected
- **Aggregate compute**: 10+ EFLOPS/FP4
- **Power**: 200-250 kW/rack (advanced liquid cooling)
- **Optical I/O**: 100+ Tb/s rack-level optical I/O

#### 12.3.8 Rubin as Feynman Predecessor

**Architectural trajectory**:
| Feature | Blackwell (B200) | Rubin (R100) | Feynman (est.) |
|---------|------------------|--------------|----------------|
| Process | 4NP | N3E/N3P | 2nm/1.5nm |
| Transistors | 208B | 350B | 500B+ |
| Architecture | Dual-die | Chiplet (23) | 3D-stacked chiplets |
| Memory | HBM3E | HBM4 | HBM4 + Optical |
| Interconnect | NVLink 5.0 + C2C | UCIe + C2C Gen2 | Optical fabric |
| Tensor Core | 5th Gen (FP4) | 6th Gen (FP2/FP4) | 7th Gen (FP2/FP1) |
| Optical I/O | External (CPO) | Integrated (chiplet) | Native (on-die) |
| Packaging | CoWoS-L | CoWoS-R + SoIC | 3D SoIC + Optical |

**Feynman enablers from Rubin**:
- Chiplet architecture → 3D stacking (SoIC)
- UCIe standardization → Heterogeneous integration
- HBM4 + Optical I/O → Native optical memory fabric
- Disaggregated architecture → Composable disaggregation

---

*End of Piece 3. Next: Piece 4 - Feynman Architecture: 2nm/1.5nm, 3D Stacking, Native Optical Interconnect*