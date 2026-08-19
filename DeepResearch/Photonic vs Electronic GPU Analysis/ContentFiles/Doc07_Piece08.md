# Document 7: Microring Resonator Physics and Coupled Mode Theory
## Piece 8: Microring Weight Bank: Broadcast-and-Weight Architecture

---

### 7.8 Microring Weight Bank: Broadcast-and-Weight Architecture

The broadcast-and-weight architecture using microring resonator (MRR) weight banks is a leading approach for optical neural networks (ONNs). It leverages wavelength division multiplexing (WDM) to achieve massive parallelism, where each wavelength carries a separate data channel and microrings apply wavelength-selective weights.

#### 7.8.1 Broadcast-and-Weight Principle

**Concept**:
1. **Broadcast**: Multi-wavelength input sent on single bus waveguide
2. **Weight**: Each MRR extracts one wavelength, applies weight
3. **Sum**: Weighted signals combined at photodetector

**Input**: WDM signal with N channels
λ₁, λ₂, ..., λ_N on single bus

**Ring bank**: N rings, each resonant at one λ_k
Ring k couples λ_k to drop port with weight w_k

**Output**: Σ w_k x_k (dot product)

**Parallelism**: N wavelengths → N operations per cycle
Throughput: N × symbol rate

#### 7.8.2 MRR Weight Bank Architecture

**Layout**:
- Single bus waveguide (horizontal)
- N rings vertically stacked (side-coupled)
- Each ring: different radius → different resonance
- Dropped signals → photodetector array or summed

**Ring parameters**:
Radius R_k = m λ_k / n_eff
Gap g_k → coupling coefficient κ_k
Heater → tuning (thermal/carrier)

**Weight encoding**:
w_k = κ_k² / (Δω² + (κ_k/2)²)
At resonance (Δω = 0): w_k = 4 (max)
Off resonance: w_k ≈ 0

**Weight range**: 0 to w_max (by detuning)
Typical: 0 to 1 (normalized)

#### 7.8.3 Wavelength Assignment and FSR

**Channel spacing**: Δλ = FSR / N_channels
**FSR requirement**: FSR > N × Δλ
For N = 32, Δλ = 0.8 nm (100 GHz):
FSR > 25.6 nm → R < 3.5 μm (challenging)

**Solution**: Multiple ring banks
Each bank handles subset of channels
FSR = 10 nm, 4 banks × 8 channels

**Alternative**: Vernier rings
Two rings per weight → enhanced FSR
Select one channel per Vernier pair

#### 7.8.4 Weight Precision and Resolution

**Phase shifter resolution**:
Thermal: Δθ ≈ 0.01 rad (8-bit DAC)
Carrier: ΔV ≈ 1 mV (10-bit DAC)
Weight resolution: Δw/w ≈ 2 Δθ/θ

**Weight error sources**:
1. Phase quantization: Δθ
2. Thermal crosstalk: ΔT_xtalk
3. Fabrication variation: Δκ, ΔR
4. Temperature drift: dλ/dT

**Error budget** (for 8-bit weights):
Phase error: < 0.5° (0.009 rad)
Thermal stability: < 0.1 K
Coupling variation: < 1%

**Calibration**:
Measure weight matrix W_actual
Compute correction: W_cal = W_target W_actual⁻¹
Apply inverse to phase shifters

#### 7.8.5 Signal Flow and Detection

**Coherent detection** (complex weights):
- I/Q modulators at input
- Complex weights: w_k = a_k + j b_k
- Requires two rings per channel (or dual-pol)
- Coherent receiver (homodyne)

**Direct detection** (real positive weights):
- Intensity modulation (IM)
- Real weights: w_k ≥ 0
- Photodetector sums power
- Simpler, but limited to positive weights

**Differential detection** (bipolar weights):
- Two rings per weight: w_k = w_k⁺ - w_k⁻
- Balanced photodetector
- Real weights with sign

**Detection noise**:
Shot noise: σ_shot = √(2qI B)
Thermal noise: σ_th = √(4kT B/R_L)
RIN: σ_RIN = RIN × I

#### 7.8.6 Scaling to Large N

**Single bus limitation**:
Insertion loss: N × α_ring
Crosstalk: N × XT_ring
FSR constraint: FSR > N Δλ

**Maximum practical N**:
Loss: N < 10 dB / α_ring
For α = 0.1 dB/ring: N < 100
Crosstalk: N < ER/10
For ER = 30 dB: N < 30

**Tiling strategy**:
Multiple parallel buses
Each bus: N_bank channels
Total N = N_bus × N_bank

**Hierarchical weight banks**:
Level 1: Coarse (few channels, large weights)
Level 2: Fine (many channels, small weights)
Logarithmic scaling

#### 7.8.7 Training and Inference

**Forward pass**:
1. Encode input vector x onto WDM wavelengths
2. Propagate through ring bank
3. Detect weighted sum y = W x
4. Apply activation (optical or electronic)

**Backward pass** (training):
1. Compute error δ = ∂L/∂y
2. Backpropagate: δ W^T
3. Update weights: ΔW = -η δ x^T

**Weight update**:
Δθ_k = -η (∂L/∂w_k) (∂w_k/∂θ_k)
∂w_k/∂θ_k from ring transfer function

**In-situ training**:
- Optical forward + electronic backward
- Or all-optical backprop (phase conjugation)

**Weight drift compensation**:
Periodic recalibration
Online gradient correction
Redundancy (spare rings)

#### 7.8.8 MRR Weight Bank vs. MZI Mesh

| Parameter | MRR Bank | MZI Mesh |
|-----------|----------|----------|
| Area | O(N) | O(N²) |
| Depth | 1 ring | N MZIs |
| Loss | O(1) | O(N) |
| Weight type | Real (mostly) | Complex (unitary) |
| Parallelism | WDM (N ch) | Spatial (N modes) |
| Speed | Limited by FSR | Full bandwidth |
| Weight range | Positive (direct) | Full complex |
| Cascadability | Limited | Excellent |

**MRR advantages**:
- Compact (O(N) vs O(N²))
- Low latency (single pass)
- Natural WDM parallelism
- Low loss for large N

**MZI advantages**:
- Universal unitary
- Complex weights
- Better cascadability
- Mature calibration

#### 7.8.9 MRR Weight Bank for Convolution

**1D convolution**:
Input: WDM signal
Rings with different delays (ring lengths)
Weighted sum = convolution

**2D convolution**:
Multiple buses (rows)
Ring bank per row
Cross-bar summation

**Frequency-domain convolution**:
WDM = frequency domain
Ring weights = filter frequency response
Convolution theorem: y = F⁻¹(F(x)·F(w))

**Implementation**:
Rings as programmable optical filters
FIR filter with N taps = N rings

#### 7.8.10 Future: MRR Weight Bank Integration

**Monolithic integration**:
- Rings + heaters + detectors on SOI
- CMOS driver IC (flip-chip)
- High-density packaging

**Heterogeneous integration**:
- III-V gain for loss compensation
- Ge detectors for high-speed detection
- Polymer for athermal operation

**Advanced architectures**:
- Resonant tunneling for negative weights
- Quantum dot rings for single-photon weights
- Topological rings for robust weights

**Co-packaged MRR banks**:
Near-memory computing
HBM-style stacking
Optical I/O for weight loading

---

*End of Piece 8. Next: Piece 9 - Active Thermal Stabilization: PID Control Loop Design*