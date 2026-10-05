# Document 8: Diffractive Optical Neural Network Mathematics
## Piece 5: Information Capacity: Degrees of Freedom in Free-Space Optics

---

### 8.5 Information Capacity: Degrees of Freedom in Free-Space Optics

The information capacity of a diffractive optical system is fundamentally limited by the number of degrees of freedom (DoF) that can be transmitted through free space. Understanding these limits is crucial for designing D2NNs with appropriate complexity and for establishing the theoretical bounds on optical computing throughput.

#### 8.5.1 Degrees of Freedom in Optical Systems

**Definition**: Degrees of freedom = number of independent parameters needed to specify the optical field

**For a field U(x,y)**:
- Continuous: Infinite DoF
- Bandlimited: Finite DoF
- Discretized (N×N): N² DoF

**Space-bandwidth product (SBP)**:
SBP = (Area/λ²) × (Solid angle) = A Ω / λ²

**Shannon number** (DoF for imaging):
N_SBP = (2/π) SBP ≈ 0.64 × (A/λ²) × (NA)²

**For free-space propagation**:
DoF = (2 × Aperture / λ)² (for coherent)
DoF = (Aperture / λ)² (for incoherent)

#### 8.5.2 Prolate Spheroidal Wavefunctions (PSWFs)

**Optimal basis** for bandlimited functions:
PSWFs are eigenfunctions of the finite Fourier transform

**Eigenvalue spectrum**:
λ_n ≈ 1 for n < N_SBP
λ_n ≈ 0 for n > N_SBP
Transition region: width ≈ log(N_SBP)

**Degrees of freedom** = number of significant eigenvalues
= N_SBP = SBP (approximately)

**For circular aperture** (radius a):
N_DoF ≈ (π a / λ)² = (π a NA / λ)²

**For rectangular aperture** (L×L):
N_DoF ≈ (2L/λ)² (coherent)

#### 8.5.3 Information Capacity of Free-Space Channel

**Coherent channel** (complex field):
Capacity = N_DoF × log₂(1 + SNR) bits

**Per spatial mode**:
C_mode = log₂(1 + SNR_mode)

**Total capacity**:
C_total = N_DoF × log₂(1 + P_total/(N_DoF hν B))

**Photon efficiency**:
Bits/photon = log₂(1 + SNR) / SNR
Max at SNR → 0: log₂(e) ≈ 1.44 bits/photon
At SNR = 1: 1 bit/photon

**Holevo capacity** (quantum):
χ = g(η N_S + N_B) - g(N_B)
g(x) = (x+1)log₂(x+1) - x log₂(x)
η = efficiency, N_S = signal photons, N_B = background

#### 8.5.4 D2NN Information Capacity

**Input DoF**: N_in = N_x N_y (input pixels)
**Output DoF**: N_out = N_x N_y (output pixels)
**Hidden DoF**: N_h = N_x N_y per layer

**Total optical parameters**: L × N² (phase values)
**Effective DoF**: min(L N², N²) (due to unitarity)

**Effective capacity**:
C_D2NN = N_DoF × log₂(1 + SNR_eff)

**SNR per mode**:
SNR = P_optical / (N_DoF hν B)

**For N=512, P=1 mW, B=10 GHz**:
N_DoF = 512² = 2.6×10⁵
Photon rate = 10⁻³ / (1.28×10⁻¹⁹) = 7.8×10¹⁵ photons/s
Photons/mode = 7.8×10¹⁵ / (2.6×10⁵ × 10¹⁰) = 3
SNR = 3 (quantum limited)
Capacity = 2.6×10⁵ × log₂(4) = 5.2×10⁵ bits

**Throughput** (at 10 GHz):
5.2×10⁵ bits × 10¹⁰/s = 5.2 Pbps (petabits/s)

#### 8.5.5 Diffraction-Limited Resolution

**Rayleigh criterion**:
Δx = 0.61 λ / NA
Δy = 0.61 λ / NA

**For D2NN** (NA ≈ 0.5, λ = 1.55 μm):
Δx = 1.9 μm

**Pixel size requirement**:
Δx_pixel ≤ Δx/2 = 0.95 μm (Nyquist)
Typical SLM pixels: 8-20 μm (too large!)
Phase mask fabrication: < 1 μm (EBL)

**Space-bandwidth product** for D2NN:
SBP = (L/Δx)² = (L NA / λ)²
For L = 1 cm, NA = 0.5: SBP ≈ 10⁶

#### 8.5.6 Number of Resolvable Spots

**Airy disk radius**: r_Airy = 1.22 λ f/D
**Number of spots**: N_spots = (D/1.22 λ)² (for circular)
**For rectangular**: N_spots = (L_x/Δx)(L_y/Δy) = (L_x NA/λ)(L_y NA/λ)

**D2NN capacity in spots**:
N_spots = N_DoF = (L/λ)² (NA)²
For L=1 cm, NA=0.5: 10⁶ spots

**Each spot = one independent channel**
Can process N_spots parallel inputs
Equivalent to N_spots parallel MAC operations

#### 8.5.7 Temporal Degrees of Freedom

**Temporal DoF** = Time-bandwidth product
TBP = T × B (for pulse duration T, bandwidth B)

**For transform-limited pulse**:
TBP ≈ 1 (minimum)

**For shaped pulses**:
TBP = N_t (number of temporal modes)

**Spatiotemporal DoF**:
N_total = N_spatial × N_temporal

**Example**: 100 fs pulse, 10 nm bandwidth
B = 1.25 THz, T = 100 fs
TBP ≈ 100
N_total = 10⁶ × 100 = 10⁸

#### 8.5.8 Information Density Limits

**Areal information density**:
ρ_info = N_DoF / Area = (NA/λ)²
For λ=1.55μm, NA=0.5: ρ = 10⁸ bits/cm²

**Volumetric density** (with layers):
ρ_vol = L N_DoF / Volume
For 10 layers, 1 cm thick: ρ_vol = 10⁹ bits/cm³

**Comparison with electronics**:
SRAM: ~10⁶ bits/mm² = 10¹⁰ bits/cm³
DRAM: ~10⁷ bits/mm² = 10¹¹ bits/cm³
Optical: 10⁸-10⁹ bits/cm³ (lower, but 3D)

**Energy per bit**:
Optical: 10⁻¹⁸ J (attojoule target)
Electronic: 10⁻¹⁵ J (femtojoule)

#### 8.5.9 Quantum Information Capacity

**Quasi-probability distributions**:
Wigner function for optical modes
Negativity = non-classicality

**Continuous-variable quantum computing**:
Each mode = qumode (infinite-dimensional)
Logical qubits encoded in GKP/cat states

**Quantum capacity**:
Q = max{0, log₂(η/(1-η))} (for lossy channel)
η = transmission efficiency

**Entanglement distribution**:
Rate = η × repetition rate
For η=0.5, 1 GHz: 500 MHz entangled pairs

**Quantum error correction**:
GKP code: corrects displacement errors
Cat code: corrects photon loss
Requires: η > 50%, squeezing > 10 dB

#### 8.5.10 Ultimate Physical Limits

**Landauer limit** (optical):
k_B T ln 2 ≈ 3×10⁻²¹ J at 300K
Optical can approach this with reversible computing

**Bekenstein bound**:
I ≤ 2π R E / (ħ c ln 2)
For 1 cm³ at 300K: ~10⁴² bits (not practical)

**Holographic principle**:
Max information in volume ∝ surface area
Not reached by any current technology

**Practical limits for D2NN**:
- SLM resolution (8K × 8K = 67 Mpix)
- Phase quantization (8-bit = 256 levels)
- Laser coherence (limits N_layers)
- Detector noise (limits SNR)
- Alignment tolerance (sub-μm)

**Future scaling**:
- Metasurfaces: sub-wavelength pixels
- Multi-wavelength (WDM): ×N_λ
- Temporal multiplexing: ×TBP
- Quantum: exponential advantage for specific tasks

---

*End of Piece 5. Next: Piece 6 - Diffraction Efficiency vs. Quantization Levels*