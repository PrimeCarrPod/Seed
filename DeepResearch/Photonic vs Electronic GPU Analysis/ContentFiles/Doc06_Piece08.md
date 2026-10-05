# Document 6: Mach-Zehnder Interferometer Mesh Theory
## Piece 8: Thermal Crosstalk Matrix in Dense MZI Arrays

---

### 6.8 Thermal Crosstalk Matrix in Dense MZI Arrays

Thermal crosstalk is a dominant non-ideality in dense MZI meshes, where heat from one phase shifter affects neighboring phase shifters, causing unintended phase shifts. Understanding and modeling the thermal crosstalk matrix is essential for calibration, control, and mesh design.

#### 6.8.1 Thermal Physics in Silicon Photonics

**Heat equation**:
ρ C_p ∂T/∂t = ∇·(k ∇T) + Q
where Q = I²R (Joule heating in heater)

**Steady-state**:
∇·(k ∇T) + Q = 0

**Thermal conductivity of silicon**:
k_Si = 150 W/m·K (at 300K)
Anisotropic: k_<100> ≈ 150, k_<111> ≈ 130 W/m·K

**Silicon dioxide (cladding)**:
k_SiO₂ = 1.4 W/m·K
Thermal insulator, traps heat in silicon

**Thermal resistance** (point source in infinite medium):
R_th = 1/(4π k r)

**For waveguide on SOI**:
Heat flows: down (BOX), up (air/cladding), lateral (silicon)
BOX (SiO₂, 2-3 μm) is main bottleneck
R_th,vertical ≈ t_BOX/(k_SiO₂ A) ≈ 10⁴ K/W

#### 6.8.2 Thermal Crosstalk Matrix Definition

**N phase shifters** with powers P = [P₁, ..., P_N]
**Temperature rise**: ΔT = R_th P
where R_th ∈ ℝ^{N×N} is thermal resistance matrix

**Phase shift**: θ = (2π/λ) (dn/dT) L ΔT
**Crosstalk matrix**: C = (2π/λ) (dn/dT) L R_th
θ = C P

**Matrix properties**:
- Symmetric: C_{ij} = C_{ji} (reciprocity)
- Positive definite: eigenvalues > 0
- Diagonal dominant: C_{ii} ≫ Σ_{j≠i} |C_{ij}|
- Diagonal: C_{ii} = self-heating coefficient (η)
- Off-diagonal: C_{ij} = crosstalk coefficient

#### 6.8.3 Crosstalk Scaling with Distance

**2D heat diffusion** (thin film):
ΔT(r) = (P/2πk) K₀(r/λ_th)
K₀ = modified Bessel function
λ_th = √(k t / h) (thermal healing length)

**For SOI**:
t_Si = 220 nm, k = 150, h = 10⁴ (BOX)
λ_th ≈ √(150 × 2.2e-7 / 1e4) ≈ 1.8 μm

**Crosstalk decay**:
C_{ij} ∝ K₀(d_{ij}/λ_th) ≈ exp(-d_{ij}/λ_th) / √d_{ij}

**Typical values** (pitch = 2 μm):
Nearest neighbor (d=2μm): C_{ij}/C_{ii} ≈ 5-10%
Next-nearest (d=4μm): ≈ 1-2%
Beyond 10 μm: < 0.1%

#### 6.8.4 Mesh Geometry Impact on Crosstalk

**Reck mesh (triangular)**:
- MZIs stacked in columns
- Phase shifters aligned vertically
- Strong vertical crosstalk (column)
- Horizontal spacing larger → less crosstalk
- 1D thermal gradient along column

**Clements mesh (rectangular)**:
- MZIs distributed in grid
- Better 2D thermal spreading
- More uniform neighbor distances
- Lower peak crosstalk

**Measured crosstalk** (N=32, pitch=2μm):
Reck: max off-diagonal = 12%
Clements: max off-diagonal = 7%

#### 6.8.5 Thermal Time Constants

**Thermal RC circuit**:
C_th = ρ C_p V_heater
R_th = thermal resistance to substrate
τ = R_th C_th

**Typical values**:
Heater volume: 10 × 10 × 0.5 μm³ = 5×10⁻¹⁷ m³
ρ C_p (Si) = 1.6×10⁶ J/m³·K
C_th ≈ 8×10⁻¹¹ J/K
R_th ≈ 10⁴ K/W
τ ≈ 1-10 μs

**Dynamic crosstalk**:
Pump heater i with step
Neighbor j temperature: ΔT_j(t) = C_{ij} (1 - e^{-t/τ})
Crosstalk transient follows same time constant

**Thermal RC network model**:
N nodes, resistors to ground, resistors between neighbors
State-space: C dΔT/dt = -G ΔT + P
G = conductance matrix (diagonal + off-diagonal)

#### 6.8.6 Thermal Crosstalk Compensation

**Feedforward compensation**:
P = C⁻¹ θ_desired
Requires C matrix inversion
Ill-conditioned if crosstalk strong

**Iterative compensation**:
P_{k+1} = P_k + α (θ_desired - C P_k)
Converges if ||I - α C|| < 1
α = 1/λ_max(C)

**Closed-loop control**:
Measure actual phase (monitor tap)
PID control on each phase shifter
Crosstalk naturally rejected by feedback

**Frequency-domain decoupling**:
High-frequency control on individual shifters
Low-frequency (thermal) coordinated control
Time-scale separation: thermal (μs) vs electronic (ns)

#### 6.8.7 Thermal Crosstalk in Training

**Loss function with crosstalk**:
L(θ) = ||U(C P(θ)) - W||²

**Gradient with crosstalk**:
∂L/∂P_i = Σ_j (∂L/∂θ_j) C_{ji}

**Crosstalk-aware training**:
1. Characterize C matrix (offline)
2. Include C in forward model
3. Backprop through C matrix
4. Optimize P (heater powers) not θ

**Analytic gradient**:
∂L/∂P = Cᵀ ∂L/∂θ

**Regularization**:
Add penalty for large P (power budget)
Add penalty for P variation (thermal uniformity)

#### 6.8.8 Thermal Crosstalk Measurement

**DC characterization**:
1. Set P_i = 1 mW, others 0
2. Measure all θ_j
3. C_{ji} = θ_j / P_i
4. Repeat for all i

**AC characterization** (frequency domain):
Modulate P_i at frequency f
Measure θ_j(f)
C_{ji}(f) = θ_j(f)/P_i(f)
Extract τ from phase lag

**Thermal imaging**:
IR camera (spatial resolution ~5 μm)
Or Raman thermometry (sub-μm)
Map temperature distribution

**On-chip sensors**:
Integrated thermistors (doped Si)
Or Bragg gratings
Monitor temperature in real-time

#### 6.8.8 Thermal-Aware Mesh Design

**Layout optimization**:
- Increase pitch where possible
- Stagger phase shifters (checkerboard)
- Thermal isolation trenches (etch through Si)

**Trench isolation**:
Etch Si between heaters (down to BOX)
Reduces lateral conduction
Crosstalk reduction: 5-10×
Trade-off: mechanical stress, optical loss

**Heat spreading layers**:
Diamond (k=2000 W/m·K) on top
Graphene (in-plane k=5000 W/m·K)
AlN (k=200 W/m·K)

**Active cooling**:
Microfluidic channels in substrate
Thermoelectric coolers (TEC)
Phase-change materials

#### 6.8.9 Thermal Crosstalk in Large Meshes

**N × N mesh crosstalk matrix size**: N² × N²
For N=64: 4096 × 4096
Sparse (bandwidth ≈ √N)

**Hierarchical compensation**:
- Global: wafer-scale thermal gradient
- Regional: column/row level
- Local: nearest-neighbor

**Model order reduction**:
Proper Orthogonal Decomposition (POD)
Keep first K modes (K ≈ 10-20)
Fast online compensation

**Distributed control**:
Local controllers per column/row
Coordinate via consensus algorithm
Scalable to large N

#### 6.8.10 Cryogenic Thermal Crosstalk

**At 4K**:
k_Si → 10,000 W/m·K (100× increase)
C_p → 0 (T³ law)
τ → ns (very fast)

**Crosstalk reduction**:
k increased → better heat spreading
But thermal gradients steeper (higher ΔT for same P)

**Superconducting heaters**:
Zero static power
Fast (ns), no thermal crosstalk
NbTi, NbN resistors

**Quantum applications**:
Single-photon detectors (SNSPDs) need mK
Thermal crosstalk from heaters → dark counts
Shielding essential

---

*End of Piece 8. Next: Piece 9 - Non-Volatile Phase Change Material (PCM) Integration: GST Physics*