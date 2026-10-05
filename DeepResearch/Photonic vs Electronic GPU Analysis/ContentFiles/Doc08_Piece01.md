# Document 8: Diffractive Optical Neural Network Mathematics
## Piece 1: Scalar Diffraction Theory: Rayleigh-Sommerfeld Integral

---

### 8.1 Scalar Diffraction Theory: Rayleigh-Sommerfeld Integral

Diffractive Optical Neural Networks (D2NNs) rely on the fundamental physics of light diffraction to perform matrix operations. The mathematical foundation is scalar diffraction theory, which describes how optical fields propagate through free space and interact with phase-modulating elements. This piece establishes the rigorous diffraction theory underlying D2NN operation.

#### 8.1.1 Wave Equation and Scalar Approximation

**Maxwell's equations** in source-free region:
∇²E - (n²/c²) ∂²E/∂t² = 0

**Monochromatic field**: E(r,t) = Re[U(r) e^{-jωt}]
**Helmholtz equation**: ∇²U + k²U = 0
where k = 2π/λ = ωn/c

**Scalar approximation**: Valid when
- Feature sizes ≫ λ
- Paraxial propagation (small angles)
- Weak polarization coupling

**Validity for D2NNs**:
- Pixel sizes: 1-10 μm (≫ λ = 1.55 μm)
- Propagation distances: cm-scale
- Angles: typically < 10°

#### 8.1.2 Rayleigh-Sommerfeld Diffraction Integral (First Kind)

**Exact solution** for field at z > 0 given field at z = 0:
U(x,y,z) = (1/jλ) ∬ U(x',y',0) (z/R) (e^{jkR}/R) dx'dy'
where R = √((x-x')² + (y-y')² + z²)

**Boundary conditions**:
- U(x',y',0) = known (aperture field)
- Sommerfeld radiation condition at infinity

**Physical interpretation**:
- Each point on aperture acts as secondary source
- Spherical wavelets propagate to observation point
- z/R factor = obliquity factor (cosine of angle)

#### 8.1.3 Rayleigh-Sommerfeld Second Kind

**Alternative formulation** (for Dirichlet boundary):
U(x,y,z) = (1/jλ) ∬ (∂U/∂z') (e^{jkR}/R) dx'dy'

**Relationship**: First kind for soft aperture (U specified)
Second kind for hard aperture (∂U/∂z specified)

**For D2NNs**: Phase masks specify U(x',y',0) → use first kind

#### 8.1.4 Fresnel Approximation

**Paraxial approximation** (z ≫ |x-x'|, |y-y'|):
R ≈ z + (x-x')²/(2z) + (y-y')²/(2z)

**Fresnel diffraction integral**:
U(x,y,z) = (e^{jkz}/jλz) e^{jk(x²+y²)/(2z)}
× ∬ U(x',y',0) e^{jk(x'²+y'²)/(2z)} e^{-jk(xx'+yy')/z} dx'dy'

**Structure**: Quadratic phase factor × Fourier transform
**Fresnel number**: N_F = a²/(λz)
- N_F ≫ 1: Fresnel (near-field)
- N_F ≪ 1: Fraunhofer (far-field)

#### 8.1.5 Fraunhofer Approximation

**Far-field condition**: z ≫ 2a²/λ (N_F ≪ 1)
Quadratic phase factor ≈ 1

**Fraunhofer diffraction**:
U(x,y,z) = (e^{jkz}/jλz) e^{jk(x²+y²)/(2z)}
× ∬ U(x',y',0) e^{-jk(xx'+yy')/z} dx'dy'

**Fourier transform relationship**:
U(x,y,z) ∝ ℱ{U(x',y',0)}|_{f_x=x/λz, f_y=y/λz}

**Scaling**: Spatial frequency f_x = x/(λz)
Coordinate at observation plane maps to spatial frequency

#### 8.1.6 Angular Spectrum Method

**Exact angular spectrum representation**:
U(x,y,z) = ∬ A(k_x,k_y) e^{j(k_x x + k_y y + k_z z)} dk_x dk_y

where A(k_x,k_y) = (1/2π)² ∬ U(x,y,0) e^{-j(k_x x + k_y y)} dx dy

**Propagation transfer function**:
H(k_x,k_y) = e^{j k_z z}
k_z = √(k² - k_x² - k_y²)

**Evanescent waves** (k_x² + k_y² > k²):
k_z = j√(k_x² + k_y² - k²)
Exponential decay: e^{-√(k_x²+k_y²-k²) z}

**Angular spectrum algorithm**:
1. Compute A(k_x,k_y) = FFT[U(x,y,0)]
2. Multiply by H(k_x,k_y) = e^{j√(k²-k_x²-k_y²) z}
3. Inverse FFT: U(x,y,z) = FFT⁻¹[A·H]

**Advantages**: Exact, handles evanescent waves, efficient FFT implementation

#### 8.1.7 Diffraction Efficiency and Sampling

**Sampling requirements** (angular spectrum):
Δx ≤ λz/(N Δx') (to avoid aliasing)
N = number of samples

**Space-bandwidth product**:
N² ≥ (D/λ)² (for D = aperture diameter)

**Zero-padding**: Required for linear convolution
Pad by factor 2: N_pad = 2N

**Diffraction efficiency** (for phase-only masks):
η = |∬ e^{jφ(x,y)} dx dy|² / A²
For random phase: η ≈ 1/N²
For optimized: η can approach 1

**Binary phase mask** (0 or π):
η_max = (2/π)² ≈ 40.5%
4-level: η ≈ 81%
8-level: η ≈ 95%
Continuous: η → 100%

#### 8.1.8 Multi-Layer Diffraction

**Cascaded propagation**:
U_L = P_L ∘ M_L ∘ P_{L-1} ∘ M_{L-1} ∘ ... ∘ P_1 ∘ M_1 (U_0)

where P_i = propagation operator, M_i = mask operator

**Mask operator** (phase-only):
M_i{U} = U · e^{jφ_i(x,y)}

**Propagation operator** (angular spectrum):
P_i{U} = FFT⁻¹[FFT[U] · H_i(k_x,k_y)]

**Matrix representation** (discretized):
U_{i+1} = H_i D_i U_i
H_i = propagation matrix, D_i = diagonal phase matrix

**Total system matrix**:
U_out = (∏_{i=1}^L H_i D_i) U_in

#### 8.1.9 Inverse Design and Phase Retrieval

**Forward problem**: Given {φ_i}, compute U_out
**Inverse problem**: Given U_target, find {φ_i}

**Phase retrieval algorithms**:
1. **Gerchberg-Saxton**: Alternating projections
   - Known: |U_0|, |U_L|
   - Iterate: U_k = P_k M_k U_{k-1}
   - Project onto intensity constraints

2. **Wirtinger Flow** (gradient descent):
   - Loss: L = |||U_L| - |U_target|||²
   - Gradient via Wirtinger calculus
   - Converges to global minimum for oversampled

3. **PhaseLift** (semidefinite programming):
   - Lift to rank-1 matrix X = uu†
   - Convex relaxation of phase retrieval
   - Guaranteed recovery for m ≥ O(n log n)

#### 8.1.10 Computational Complexity

**Single propagation** (N×N grid):
FFT-based: O(N² log N)
Direct integration: O(N⁴)

**L-layer D2NN**:
Forward: O(L N² log N)
Backward (adjoint): O(L N² log N)

**Memory**: O(L N²) for storing intermediate fields

**Typical sizes**:
N = 256-1024 (grid size)
L = 5-20 (layers)
FLOPs per forward pass: ~10⁹-10¹¹

**GPU acceleration**:
- cuFFT for FFT operations
- Batch processing for batch training
- Mixed precision (FP16) for speed

---

*End of Piece 1. Next: Piece 2 - Angular Spectrum Method for Layer-to-Layer Propagation*