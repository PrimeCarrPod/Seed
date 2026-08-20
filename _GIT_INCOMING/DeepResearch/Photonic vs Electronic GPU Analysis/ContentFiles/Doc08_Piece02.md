# Document 8: Diffractive Optical Neural Network Mathematics
## Piece 2: Angular Spectrum Method for Layer-to-Layer Propagation

---

### 8.2 Angular Spectrum Method for Layer-to-Layer Propagation

The Angular Spectrum Method (ASM) provides an exact, computationally efficient framework for simulating light propagation between diffractive layers in D2NNs. Unlike the Fresnel or Fraunhofer approximations, ASM handles both propagating and evanescent waves exactly and is naturally implemented via FFT, making it the method of choice for D2NN simulation and training.

#### 8.2.1 Angular Spectrum Fundamentals

**Field representation**:
U(x,y,z) = ∬ A(k_x,k_y;z) e^{j(k_x x + k_y y)} dk_x dk_y

where A(k_x,k_y;z) = angular spectrum at plane z

**At z=0**:
A(k_x,k_y;0) = (1/2π)² ∬ U(x,y,0) e^{-j(k_x x + k_y y)} dx dy
= ℱ{U(x,y,0)} / (2π)²

**Propagation in k-space**:
A(k_x,k_y;z) = A(k_x,k_y;0) H(k_x,k_y;z)

**Transfer function**:
H(k_x,k_y;z) = e^{j k_z z}
k_z = √(k² - k_x² - k_y²) for k_x² + k_y² ≤ k²
k_z = j√(k_x² + k_y² - k²) for k_x² + k_y² > k²

**Propagating waves**: Real k_z, oscillatory
**Evanescent waves**: Imaginary k_z, exponential decay

#### 8.2.2 Discrete Angular Spectrum Implementation

**Grid parameters**:
N × N points, sampling Δx, Δy
Spatial frequencies: k_x = 2π m/(N Δx), m = -N/2,...,N/2-1

**Algorithm**:
1. U₀ = U(x,y,0) (input field)
2. A₀ = FFT2(U₀) / N²
3. A_z = A₀ ⊙ H (element-wise multiply)
4. U_z = N² × IFFT2(A_z)

**Transfer function discretization**:
H[m,n] = exp(j Δz √(k² - k_x[m]² - k_y[n]²))

**Bandlimited H**: Set H=0 for k_x²+k_y² > k² (evanescent cutoff)
Or keep evanescent for exact near-field

#### 8.2.3 Sampling and Aliasing Considerations

**Spatial sampling**: Δx = L/N (L = computational window size)

**Frequency sampling**: Δk_x = 2π/L

**Nyquist criterion** (for propagating waves):
Maximum spatial frequency: k_max = k = 2π/λ
Required: N ≥ 2L/λ

**Aliasing condition** (for propagation):
Δx ≤ λz/L (Fresnel)
Δx ≤ λ/2 (Fraunhofer, for full angular spectrum)

**Zero-padding for linear convolution**:
Pad input by factor 2: N_pad = 2N
Computational window: L_pad = 2L
Prevents circular convolution artifacts

**Memory**: 4× increase (N → 2N)
**Speed**: 4× FFT cost (N² → 4N²)

#### 8.2.4 Exact Propagation vs. Approximations

**Comparison of methods**:

| Method | Validity | Evanescent | Accuracy | Speed |
|--------|----------|------------|----------|-------|
| Angular Spectrum | All z | Exact | Exact | FFT O(N²logN) |
| Fresnel | z > a²/λ | Approximate | Good | FFT |
| Fraunhofer | z ≫ a²/λ | No | Far-field | FFT |
| Rayleigh-Sommerfeld | All z | Exact | Exact | O(N⁴) |

**For D2NNs**: ASM preferred because:
- Layer spacing ~ cm (not far-field)
- Need evanescent waves for high-NA features
- Exact transfer function available
- FFT-based → fast for training

#### 8.2.5 Transfer Function Variants

**Standard ASM** (bandlimited):
H = exp(j z √(k² - k_x² - k_y²)) for k_x²+k_y² ≤ k²
H = 0 for k_x²+k_y² > k²

**Exact ASM** (with evanescent):
H = exp(j z √(k² - k_x² - k_y²))
For k_x²+k_y² > k²: √(negative) = j√(k_x²+k_y²-k²)

**Wide-angle ASM** (improved paraxial):
Use exact k_z = √(k² - k_x² - k_y²)
No paraxial approximation

**Shifted ASM** (for off-axis):
U(x-x₀, y-y₀, z) = ℱ⁻¹[H · ℱ[U(x,y,0)] e^{-j(k_x x₀ + k_y y₀)}]

**Multi-wavelength ASM**:
H(λ) = exp(j z √(k(λ)² - k_x² - k_y²))
k(λ) = 2π/λ
Compute separately for each λ

#### 8.2.6 Numerical Stability and Accuracy

**Evanescent wave handling**:
- High frequencies decay exponentially
- Numerical noise amplified if not cut off
- Cutoff: |H| < ε → H = 0 (ε = 10⁻¹²)

**Phase unwrapping** (for phase extraction):
φ = arg(U)
Unwrap to avoid 2π jumps
Use quality-guided or path-following

**Phase error accumulation**:
Δφ_total = √L × σ_φ (per layer)
For L=20, σ_φ=0.01: Δφ ≈ 0.045 rad

**Energy conservation check**:
∫|U(x,y,z)|² dxdy = ∫|U(x,y,0)|² dxdy (lossless)
Discrete: Σ|U|² ΔxΔy should be constant
Error: < 0.1% with proper padding

#### 8.2.7 ASM for D2NN Layer Propagation

**Layer-to-layer propagation**:
U_{i+1}(x,y) = ASM[U_i(x,y), z_i]

where z_i = distance between layer i and i+1

**Discretized system**:
U_{i+1} = H_i D_i U_i
H_i = ASM propagation matrix (N²×N², circulant)
D_i = diag(e^{jφ_i}) (phase mask)

**For training (backprop)**:
Adjoint method: ∂L/∂φ_i = 2 Im[U_i* ⊙ (H_i† ∂L/∂U_{i+1})]

**GPU implementation**:
- cuFFT for forward/backward
- Batch dimension for training
- FP16 for speed (sufficient for inference)

#### 8.2.8 Computational Complexity

**Forward pass (L layers)**:
- L × (2 FFT + N² multiply)
- FLOPs: L × (10 N² log N + 4 N²)
- For N=512, L=10: ~2×10⁹ FLOPs

**Memory**:
- Fields: L × N² complex = 8L N² bytes
- For N=512, L=10: ~20 MB
- Gradients: 2× (forward + backward)

**Training batch**:
Batch size B = 32-128
Total FLOPs/step: B × L × 10 N² log N
For B=64, N=512, L=10: ~1.3×10¹¹ FLOPs

**GPU utilization**:
- cuFFT: ~80% peak on V100
- Batch FFT: better utilization
- Mixed precision: 2× speedup

#### 8.2.9 ASM for Non-Uniform and Curved Layers

**Curved wavefronts** (lens effect):
Add quadratic phase before propagation:
U_lens = U · exp(-j k (x²+y²)/(2f))
Then propagate by ASM

**Tilted planes**:
Coordinate transformation before ASM
Or use shifted ASM formula

**Non-paraxial correction**:
For high-NA (> 0.5):
Standard ASM underestimates angles
Use exact k_z = √(k² - k_x² - k_y²)
Include evanescent for accuracy

**Vectorial correction** (for high-NA):
Scalar ASM ignores polarization coupling
Vectorial ASM: 3×3 matrix transfer function
Polarization-dependent phase

#### 8.2.10 Acceleration Techniques

**1. Sub-sampling for far layers**:
Far layers: low spatial frequencies dominate
Downsample: N' = N/2, z' = 2z
Saves 4× compute for far layers

**2. Learned propagation kernel**:
Train H_i as parameters
Initialize with ASM, fine-tune
Compensates for model mismatch

**3. Sparse angular spectrum**:
Most energy in low frequencies
Keep only central K×K of H
O(K²) instead of O(N²)

**4. Multi-resolution (wavelet)**:
Wavelet transform of field
Propagate coarse + detail separately
Adaptive resolution

**5. Mixed-precision training**:
FP16 for FFT, FP32 for accumulation
2× speed, < 1% accuracy loss
Native tensor core support on modern GPUs

---

*End of Piece 2. Next: Piece 3 - Phase Mask Optimization: Wirtinger Flow and Phase Retrieval*