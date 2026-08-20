# Document 12: NVIDIA Architecture Evolution: Hopper to Feynman
## Piece 1: H100 Transistor Count: 80B at 4N (TSMC 4nm custom)

---

### 12.1 H100 Transistor Count: 80B at 4N (TSMC 4nm custom)

The NVIDIA H100 "Hopper" GPU represents a watershed moment in GPU architecture, specifically designed for AI and HPC workloads. With 80 billion transistors fabricated on TSMC's custom 4N process (a 4nm-class node optimized for NVIDIA), the H100 establishes the foundation for understanding NVIDIA's architectural trajectory toward the Feynman generation.

#### 12.1.1 Transistor Budget Allocation

**Die composition** (GH100, full GPU):
- **Total transistors**: 80 billion
- **Die size**: 814 mm² (reticle limit)
- **Transistor density**: 98.3 MTr/mm²

**Functional block breakdown** (estimated):
| Block | Transistors (B) | Percentage | Function |
|-------|-----------------|------------|----------|
| GPCs (Graphics Processing Clusters) | 48.0 | 60% | 8 GPCs × 6 TPCs each |
| TPCs (Texture Processing Clusters) | - | - | 48 total, 128 FP32 cores each |
| Tensor Cores (4th gen) | 18.4 | 23% | 528 cores, FP8/FP16/BF16/TF32 |
| CUDA Cores (FP32/INT32) | 8.0 | 10% | 18,432 cores |
| L2 Cache (60 MB) | 3.2 | 4% | 60 MB unified |
| HBM3 Interface (6 stacks) | 2.4 | 3% | 3 TB/s bandwidth |
| NVLink 4.0 (18 links) | 1.6 | 2% | 900 GB/s |
| PCIe 5.0 / NVDEC/NVENC | 0.8 | 1% | I/O, video codecs |
| Control/Logic/Other | 0.8 | 1% | Schedulers, PMU, etc. |

#### 12.1.2 TSMC 4N Process Technology

**4N process characteristics** (NVIDIA-customized 4nm):
- **FinFET**: 3rd gen FinFET (improved over N5/N4)
- **Density**: 170-200 MTr/mm² (logic), 300+ MTr/mm² (SRAM)
- **Performance**: +11% speed at iso-power vs N5
- **Power**: -22% power at iso-speed vs N5
- **Area**: -6% vs N5 (for same logic)

**Customizations for NVIDIA**:
- **High-voltage I/O**: Optimized for NVLink/HBM signaling
- **SRAM optimization**: 6T/8T bitcells tuned for L2/register file
- **Clock mesh**: Optimized for 1.9-2.0 GHz operation
- **Power grid**: Reinforced for 700W TDP

**Yield considerations**:
- Die size: 814 mm² (at reticle limit 858 mm²)
- Estimated yield: 65-75% (mature 4N)
- Redundancy: 1 GPC disabled (7/8 active) for yield

#### 12.1.3 H100 Architectural Innovations

**Transformer Engine** (key innovation):
- **FP8 precision**: Native FP8 (E4M3/E5M2) for training/inference
- **FP8 Tensor Cores**: 2× throughput vs FP16
- **Automatic precision management**: FP8 ↔ FP16/BF16 dynamic
- **Per-layer precision**: Compiler-assisted precision assignment

**4th Generation Tensor Cores**:
- **FP8**: 2× FP16 throughput (1979 TFLOPS peak)
- **FP16/BF16**: 989 TFLOPS (dense), 1979 TFLOPS (sparse 2:4)
- **TF32**: 495 TFLOPS (dense), 990 TFLOPS (sparse)
- **INT8**: 3956 TOPS (dense), 7912 TOPS (sparse)
- **INT4**: 7912 TOPS (dense), 15824 TOPS (sparse)

**HBM3 Memory Subsystem**:
- **6 stacks × 16 GB**: 96 GB total (H100 SXM)
- **5.2 Gbps/pin**: 3 TB/s aggregate bandwidth
- **6144-bit interface**: 1024-bit × 6 channels
- **ECC**: Side-band ECC (9th bit per byte)

**NVLink 4.0 Interconnect**:
- **18 links × 50 GB/s**: 900 GB/s bidirectional
- **18 NVLink + 1 PCIe**: 19 total high-speed links
- **Switch support**: NVLink Switch (up to 256 GPUs)
- **Protocol**: Flit-based, credit-based flow control

**Thread Block Cluster** (new hierarchy):
- **Cluster**: 1-8 thread blocks
- **Shared memory**: Cross-block sharing (distributed shared memory)
- **Synchronization**: Cluster-level barriers
- **Benefit**: Larger working sets, reduced global memory traffic

#### 12.1.4 H100 Variants and Binning

**H100 SXM5** (highest performance):
- **TDP**: 700W
- **Clock**: 1.98 GHz boost
- **All 8 GPCs active**: 144 SMs, 18,432 CUDA cores
- **Full NVLink**: 18 links, 900 GB/s
- **HBM3**: 96 GB (SXM5) or 80 GB (PCIe)

**H100 PCIe** (air-cooled):
- **TDP**: 350W (configurable to 300W)
- **Clock**: 1.76 GHz boost
- **7 GPCs active**: 132 SMs (1 GPC disabled)
- **NVLink**: 18 links (bridged via NVLink Bridge)
- **HBM2e**: 80 GB (lower bandwidth than HBM3)

**H100 NVL** (dual-GPU NVLink):
- **2× H100 PCIe**: NVLink-C2C interconnect
- **600 GB/s**: GPU-to-GPU bandwidth
- **Target**: LLM inference (dual-GPU model parallel)

**H100 CNX** (China-specific):
- **Reduced NVLink**: 8 links (400 GB/s)
- **Compliance**: Export control compliant
- **Performance**: ~85% of SXM5

#### 12.1.5 H100 Performance Metrics

**AI Training** (FP8/FP16/BF16):
- **GPT-3 175B**: 9× faster than A100 (32× DGX)
- **GPT-3 175B**: 6× faster than A100 (8× DGX)
- **ResNet-50**: 2.5× faster than A100
- **BERT-Large**: 3× faster than A100

**HPC** (FP64/TF32):
- **FP64**: 67 TFLOPS (1/30 of FP8)
- **TF32**: 990 TFLOPS (sparse), 495 TFLOPS (dense)
- **HPL-AI**: 2.5× A100

**Inference** (FP8/INT8/INT4):
- **LLaMA-2 70B**: 30K tokens/sec (8× H100)
- **Latency**: Sub-ms for small models
- **Throughput**: 30M tokens/sec (batch, FP8)

**Performance per Watt**:
- **Training**: 2.5× A100 (FP8 vs FP16)
- **Inference**: 4× A100 (INT4 vs INT8)
- **TCO**: 2.5× better 3-year TCO vs A100

#### 12.1.6 H100 as Foundation for Next Generations

**Architectural legacy for Blackwell/Feynman**:
- **Tensor Core evolution**: FP8 → FP4/INT4 (Blackwell)
- **Transformer Engine**: Continued refinement
- **NVLink**: 4.0 → 5.0/6.0 (Blackwell/Feynman)
- **HBM**: HBM3 → HBM3E/HBM4 (Blackwell/Feynman)
- **NVLink Switch**: External → Integrated (Feynman)

**Scaling trajectory**:
- H100: 80B transistors, 700W, 80B params (FP8)
- B200: 208B transistors, 1000W, 1.8T params (FP4)
- Feynman: ~500B transistors, 1500W, 10T params (FP4/FP2)

---

*End of Piece 1. Next: Piece 2 - Blackwell B200: Dual-Die, 208B Transistors, 20 pJ/flop*