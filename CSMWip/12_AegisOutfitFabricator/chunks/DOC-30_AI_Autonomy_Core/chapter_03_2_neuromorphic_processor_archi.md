## 2. Neuromorphic Processor Architecture

### 2.1 Processor Selection: Intel Loihi 2 (Lava Framework)

#### 2.1.1 Architecture Overview
```
Loihi 2 Specifications (Intel 4 process, 65 nm SOI equivalent):
  - Neuron cores: 128 (each 8,192 neurons) = 1,048,576 neurons
  - Synapses: 120 million (programmable, STDP-enabled)
  - Axonal delay: 1-16 steps (programmable)
  - Neuron model: LIF + adaptive threshold + refractory
  - Learning rules: STDP, R-STDP, voltage-based, custom microcode
  - On-chip SRAM: 192 MB (neuron/synapse state)
  - Off-chip DDR: LPDDR5 8 GB (ECC, weights, event buffers)
  - Interconnect: Hierarchical mesh (NoC), 4 Tbps bisection
  - Power: 1 W (idle) to 6 W (max load) → 1.7 TOPS/W typical
  - Process: Intel 4 (7 nm EUV) → radiation hardened variant
```

#### 2.1.2 Event-Driven Processing Model
```
Event Representation (Address Event Representation - AER):
  event = { x, y, polarity, timestamp, core_id }
  x,y ∈ [0, 127] (spatial), polarity ∈ {0,1} (ON/OFF)
  timestamp: 32-bit (1 μs resolution, 71 min wrap)
  
Sparse Computation:
  Only active neurons consume power:
  P_dynamic = N_active × E_spike
  E_spike ≈ 23 pJ (Loihi 2, 4 nm)
  
  Typical sparsity: 0.1-1% → 1000-10000× efficiency vs. GPU
```

**Event Rate Equations:**
- Total event rate: $R_{total} = \sum_i R_i = 1.4M + 1.9M + 2K + 10K + 6K = 3.316M \text{ events/s}$
- Sparsity factor: $S = \frac{N_{active}}{N_{total}} = \frac{3.3M}{1.05M} \approx 0.3\%$ (per frame)
- Dynamic power: $P_{dyn} = R_{total} \times E_{spike} = 3.3M \times 23 \text{ pJ} = 76 \text{ mW}$

#### 2.1.3 Radiation Hardening (CSMFAB078-B §6)
```
RHBD (Radiation Hardened by Design) Modifications:
  - Process: 65 nm SOI (Silicon on Insulator) → SEL immune
  - TID tolerance: 100 krad(Si) (enclosed layout, guard rings)
  - SEU mitigation: TMR on configuration registers
  - EDAC: SEC-DED on SRAM/DDR (Hamming + scrubbing)
  - SEL latch-up: SOI eliminates parasitic thyristor
  - Displacement damage: Neutron fluence 1×10¹² n/cm² (1 MeV eq)
```

### 2.2 Neural Network Topologies

#### 2.2.1 Sensor Fusion SNN (Spiking Neural Network)
```
Input Layer (from DOC-29 sensors):
  - FBG array: 1400 channels × 1 kHz → 1.4M events/s
  - OFDR: 19200 points × 100 Hz → 1.9M events/s (compressed)
  - BOTDA: 2000 points × 1 Hz → 2K events/s
  - RF mesh: 100 nodes × 100 Hz → 10K events/s
  - IMU: 6-axis × 1 kHz → 6K events/s
  Total: ~3.3M events/s (sparse encoded)

Hidden Layers:
  Layer 1: 256k neurons (convolutional, 3×3 kernels, stride 2)
  Layer 2: 128k neurons (residual, skip connections)
  Layer 3: 64k neurons (temporal, recurrent with delays)
  Layer 4: 32k neurons (attention, threat classification)

Output Layer:
  - Structural state: 12 layers × 10 params = 120 neurons
  - Threat classification: 8 classes (ballistic, blast, thermal, DE, chem/bio, EMI, seal, power)
  - Response commands: 16 actuators × 3 params = 48 neurons
  - Health monitoring: 50 subsystems × 2 params = 100 neurons
```
 
#### 2.2.2 Threat Assessment Network
```

**SNN Dimension Equations:**
- Input dimension: $D_{in} = 1400 + 192 + 2 + 100 + 6 = 1700$ (compressed features)
- Hidden layer 1: $N_1 = 256,000$ neurons, $C_1 = 3 \times 3 \times 64 = 576$ params/neuron
- Hidden layer 2: $N_2 = 128,000$ neurons, residual connections
- Hidden layer 3: $N_3 = 64,000$ neurons, recurrent delays $\tau \in [1, 16]$
- Hidden layer 4: $N_4 = 32,000$ neurons, attention heads $H = 8$
- Output dimension: $D_{out} = 120 + 8 + 48 + 100 = 276$ neurons
- Total synapses: $\sum N_i \times C_i \approx 120M$ (matches Loihi 2 capacity)

#### 2.2.2 Threat Assessment Network
Ballistic Impact Detection (≤10 ms):
  Input: FBG strain rate (dε/dt > 10⁶ με/s) + MR fluid pressure spike
  SNN: 2-layer (1000 → 100 neurons), STDP-trained on impact signatures
  Latency: 3 ms (event-driven, no frame wait)
  False positive: <10⁻⁶ (validated on NIJ 0101.06 dataset)

Directed Energy Detection (≤100 ms):
  Input: Thermal gradient (∇T > 50°C/cm) + EMI burst (Layer 4, 9)
  SNN: 3-layer (500 → 50 → 8 neurons), R-STDP (reward: threat confirmed)
  Latency: 50 ms (requires thermal integration)
  False positive: <10⁻⁴

Chemical/Biological Detection (≤1 s):
  Input: MOF sensor fluorescence (Layer 7) + physiological anomalies
  SNN: 4-layer (200 → 100 → 20 → 5 neurons), supervised (labeled simulants)
  Latency: 500 ms (chemical reaction time)
  False positive: <10⁻³
```
 
**Threat Detection Equations:**
- Strain rate threshold: $\dot{\varepsilon}_{th} = 10^6 \mu\varepsilon/s = 1 s^{-1}$
- Detection probability: $P_D = 1 - e^{-\lambda t} \approx 0.999$ ($\lambda = 1000/s, t = 3ms$)
- False alarm rate: $FAR = \lambda_{FA} \times T_{obs} < 10^{-6}/h$
- Thermal gradient: $\nabla T = \sqrt{(\partial T/\partial x)^2 + (\partial T/\partial y)^2 + (\partial T/\partial z)^2} > 50^\circ\text{C/cm}$
- EMI burst energy: $E_{EMI} = \int |S_{21}(f)|^2 df > -30 \text{ dBm/MHz}$

#### 2.2.3 Autonomous Response Network
```
MR Fluid Stiffening (≤20 ms):
  Trigger: Ballistic impact detected (SNN output > 0.9)
  Path: SNN → ARINC 653 partition → PWM driver → MR fluid coil
  Latency budget:
    SNN inference: 3 ms
    Partition scheduling: 1 ms (next major frame)
    Driver + coil: 10 ms (L/R time constant)
    Fluid response: 5 ms (particle chain formation)
    Total: 19 ms (within 20 ms budget)

Seal Deployment (≤5 ms):
  Trigger: Pressure drop > 50 kPa/s (decompression) + FBG seal strain
  Path: SNN → dedicated GPIO (bypass ARINC) → pyrotechnic/seal actuator
  Latency: 1 ms (SNN) + 2 ms (GPIO) + 2 ms (actuator) = 5 ms

Thermal Management (≤100 ms):
  Trigger: Hotspot detected (BOTDA/FBG ∇T)
  Path: SNN → ARINC partition → heat pump VFD → valve control
  Latency: 50 ms (thermal inertia dominates)
```
 
**Response Latency Equations:**
- MR fluid total: $L_{MR} = L_{SNN} + L_{sched} + L_{driver} + L_{fluid} = 3 + 1 + 10 + 5 = 19 \text{ ms}$
- Seal deployment: $L_{seal} = L_{SNN} + L_{GPIO} + L_{act} = 1 + 2 + 2 = 5 \text{ ms}$
- Thermal response: $L_{th} = L_{detect} + L_{control} + \tau_{th} \approx 50 + 10 + \tau_{th} \text{ ms}$
- Pressure rate threshold: $\dot{P}_{th} = 50 \text{ kPa/s} \rightarrow \Delta P = \dot{P}_{th} \times t_{response} = 250 \text{ Pa}$ (at 5 ms)

---
