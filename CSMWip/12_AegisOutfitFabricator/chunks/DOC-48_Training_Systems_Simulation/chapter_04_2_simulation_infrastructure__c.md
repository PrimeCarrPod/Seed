## 2. Simulation Infrastructure — CSMFAB-TGPU004.htm

### 2.1 Compute Architecture

The simulation infrastructure is defined in **CSMFAB-TGPU004.htm** (Training GPU Cluster Specification) and provides the computational backbone for the AIMES virtual training domain. This aligns with the **SYNTH-01** unified textile engineering theory for simulation physics and **MAT-04** cross-property validation for material modeling. **CSMFAB078-B** threat protection validation informs compute sizing.

**Hardware Topology**:

| Component | Specification | Quantity | Role |
|-----------|---------------|----------|------|
| **GPU Nodes** | NVIDIA H100 80GB SXM5 | 32 | Physics simulation, rendering |
| **CPU Nodes** | AMD EPYC 9754 128-core | 8 | HLA federation, CGF, AI adversary |
| **Storage** | NVMe-oF 100TB (RAID-6) | 1 | Scenario assets, replay data |
| **Network** | InfiniBand NDR 400Gb/s | Full mesh | DIS/HLA/RPR-FOM transport |
| **Interconnect** | NVLink 900 GB/s | Per node | Multi-GPU scaling |

**Compute Capacity Formulas**:

$$\text{Total FP64 TFLOPS} = N_{\text{GPU}} \times \text{FP64}_{\text{per-GPU}} = 32 \times 67 = 2144 \text{ TFLOPS}$$

$$\text{Total FP32 TFLOPS} = N_{\text{GPU}} \times \text{FP32}_{\text{per-GPU}} = 32 \times 1979 = 63328 \text{ TFLOPS}$$

$$\text{Memory Bandwidth} = N_{\text{GPU}} \times \text{BW}_{\text{HBM3}} = 32 \times 3.35 \text{ TB/s} = 107.2 \text{ TB/s}$$

$$\text{Interconnect Bandwidth} = N_{\text{GPU}} \times \text{NVLink}_{\text{BW}} = 32 \times 900 \text{ GB/s} = 28.8 \text{ TB/s}$$

### 2.2 Physics Simulation Pipeline

**Frame Budget Allocation (V4.0 Physics Engine)**:

$$\Delta t_{\text{frame}} = \frac{1}{f_{\text{target}}} = \frac{1}{90 \text{ Hz}} = 11.11 \text{ ms}$$

| Pipeline Stage | Budget (ms) | Parallelism |
|----------------|-------------|-------------|
| Input processing (DIS/HLA) | 0.5 | 8 threads |
| Rigid body dynamics | 2.0 | 32 GPUs |
| Soft body / cloth (LES) | 3.0 | 32 GPUs |
| Fluid / thermal (CFD) | 2.5 | 16 GPUs |
| EMI / RF propagation | 1.0 | 8 GPUs |
| Sensor simulation (FBG, IR) | 1.0 | 8 GPUs |
| Rendering (stereo, 4K/eye) | 1.11 | 32 GPUs |
| **Total** | **11.11** | — |

### 2.3 Scalability Model

**Strong Scaling Efficiency (Amdahl's Law with overhead)**:

$$S(N) = \frac{1}{(1-p) + \frac{p}{N} + \alpha \log_2 N}$$

Where $p = 0.95$ (parallel fraction), $\alpha = 0.005$ (communication overhead), $N$ = GPU count.

**Weak Scaling (Gustafson's Law)**:

$$S(N) = N - \alpha (N-1) \log_2 N$$

**Maximum Supported Concurrent Trainees**:

$$N_{\text{trainees}}^{\text{max}} = \left\lfloor \frac{\text{Total FP32 TFLOPS}}{\text{TFLOPS}_{\text{per-trainee}}} \right\rfloor = \left\lfloor \frac{63328}{150} \right\rfloor = 422$$

Where $\text{TFLOPS}_{\text{per-trainee}} = 150$ (physics + rendering at 90Hz, 4K stereo).

---

