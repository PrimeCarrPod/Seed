# Document 8: Diffractive Optical Neural Network Mathematics
## Piece 6: Diffraction Efficiency vs. Quantization Levels (Binary vs. Multi-Level)

---

### 8.6 Diffraction Efficiency vs. Quantization Levels (Binary vs. Multi-Level)

The diffraction efficiency of phase-only spatial light modulators (SLMs) and fabricated diffractive optical elements (DOEs) depends critically on the number of phase quantization levels. This piece analyzes the theoretical and practical efficiency limits for binary, multi-level, and continuous phase profiles.

#### 8.6.1 Diffraction Efficiency Fundamentals

**Definition**: Diffraction efficiency η = P_desired_order / P_incident
For D2NN: η = Power in desired output mode / Input power

**Phase-only modulation**:
Transmission: t(x,y) = e^{jφ(x,y)}
Ideal continuous phase: η → 100% (with sufficient DoF)

**Quantized phase**:
φ_q(x,y) = round(φ(x,y)/Δφ) × Δφ
Δφ = 2π/K (K levels)

**Efficiency loss**: Due to quantization error
Δφ = φ - φ_q
Error field: e^{jφ} - e^{jφ_q}

#### 8.6.2 Binary Phase (K=2)

**Phase levels**: 0, π
**Transmission**: t(x,y) = ±1

**Diffraction efficiency** (for grating):
η_1 = (2/π)² ≈ 40.5%

**For general phase profile**:
η = (2/π)² = 40.5% (theoretical max)
Actual: 35-38% (fabrication errors)

**Binary phase mask**:
φ_b(x,y) = 0 if φ(x,y) < π
φ_b(x,y) = π if φ(x,y) ≥ π

**Error field**: e^{jφ} - e^{jφ_b} = e^{jφ}(1 - e^{jΔφ})
Δφ ∈ [-π/2, π/2]

#### 8.6.3 Four-Level Phase (K=4)

**Phase levels**: 0, π/2, π, 3π/2
**Quantization step**: Δφ = π/2

**Diffraction efficiency** (blazed grating):
η_4 = [sin(π/4)/(π/4)]² = (4/π)² ≈ 81.1%

**General formula** (for blazed grating):
η_K = [sin(π/K)/(π/K)]²

**For general phase**:
η ≈ 1 - (π²/3K²) (for large K)

**Error analysis**:
Quantization noise power: σ_φ² = π²/(3K²)
Efficiency loss: Δη ≈ σ_φ² = π²/(3K²)

#### 8.6.4 Eight-Level Phase (K=8)

**Phase levels**: 0, π/4, π/2, 3π/4, π, 5π/4, 3π/2, 7π/4
**Efficiency** (blazed grating):
η_8 = [sin(π/8)/(π/8)]² = (8 sin(π/8)/π)² ≈ 95.0%

**For general phase**:
η ≈ 1 - π²/(3×64) ≈ 94.8%

**Practical**: 90-95% (fabrication, alignment)

**8-level considered "sufficient"** for most applications
Marginal gain beyond 8 levels

#### 8.6.5 General K-Level Efficiency Formula

**Quantization noise power**:
σ_φ² = Δφ²/12 = (2π/K)²/12 = π²/(3K²)

**Diffraction efficiency** (small error approximation):
η_K ≈ 1 - σ_φ² = 1 - π²/(3K²)

**Exact formula** (for blazed grating):
η_K = [sin(π/K)/(π/K)]²

**Asymptotic expansion**:
η_K = 1 - π²/(3K²) + π⁴/(30K⁴) - ...

**Table of efficiencies**:
| K | η_exact | η_approx | Δη |
|---|---------|----------|-----|
| 2 | 40.5% | 59.5% | - |
| 4 | 81.1% | 74.9% | 6.2% |
| 8 | 95.0% | 94.8% | 0.2% |
| 16 | 98.7% | 98.7% | 0.0% |
| 32 | 99.7% | 99.7% | 0.0% |
| ∞ | 100% | 100% | - |

**Rule of thumb**: K=8 gives >95%, K=16 >98%

#### 8.6.6 Diffraction Efficiency for General Phase Profiles

**For arbitrary phase φ(x,y)**:
η = |∬ e^{jφ(x,y)} e^{-jφ_q(x,y)} dx dy|² / A²
where A = aperture area

**Approximation** (small quantization error):
η ≈ 1 - ⟨(Δφ)²⟩ = 1 - σ_φ²

**For random phase** (uniform distribution):
⟨Δφ²⟩ = π²/(3K²)
η = 1 - π²/(3K²)

**For structured phase** (correlated):
Error depends on local phase gradient
Smooth phase: higher efficiency
Rapidly varying: lower efficiency

**Correction factor** (for correlated phase):
η ≈ 1 - (π²/3K²) × (1 - C)
C = correlation coefficient of phase gradients

#### 8.6.7 Fabrication Quantization vs. SLM Quantization

**SLM quantization** (liquid crystal, MEMS):
- Continuous voltage → phase
- Quantization: DAC bits (8-10 bit typical)
- Phase resolution: 2π/2^N_DAC
- 8-bit DAC: 256 levels (K=256)
- Efficiency: >99.9% (effectively continuous)

**Fabrication quantization** (lithography, etching):
- Discrete etch depths
- K = number of mask layers + 1
- 1 mask: K=2 (binary)
- 2 masks: K=4 (4-level)
- 3 masks: K=8 (8-level)
- Gray-scale lithography: continuous (analog)

**Cost vs. efficiency trade-off**:
- 1 mask: $1K, η=40%
- 2 masks: $5K, η=81%
- 3 masks: $20K, η=95%
- Gray-scale: $50K+, η>98%

**Multi-patterning** (EUV):
Single exposure: 2-level
Multiple patterning: more levels
Cost grows exponentially

#### 8.6.8 Quantization Error Propagation in D2NN

**Per-layer error**:
ΔU_i = D_i^q U_i - D_i U_i
||ΔU_i|| ≤ σ_φ ||U_i||

**Accumulated error** (L layers):
||ΔU_L|| ≤ L σ_φ ||U_0|| (worst-case)
||ΔU_L|| ≤ √L σ_φ ||U_0|| (random errors)

**For L=10, K=4** (σ_φ = π/4):
Error = 10 × 0.785 = 7.85 rad (worst)
Random: √10 × 0.785 = 2.5 rad

**Output fidelity**:
F = |⟨U_ideal|U_quant⟩|²
F ≈ 1 - L σ_φ² (small errors)

**Required K for target fidelity**:
σ_φ < √((1-F)/L)
For F=0.99, L=10: σ_φ < 0.03 rad → K > 100

**Practical compromise**: K=8 (training), K=16 (fabrication)

#### 8.6.9 Quantization-Aware Training

**Straight-Through Estimator (STE)**:
Forward: φ_q = round(φ K/2π) × 2π/K
Backward: ∂φ_q/∂φ = 1

**Gumbel-Softmax relaxation**:
p_k = exp((log α_k + g_k)/τ) / Σ exp(...)
φ_q = Σ π_k φ_k
τ → 0 during training

**Knowledge distillation**:
Teacher: continuous phase (high accuracy)
Student: quantized phase (hardware)
Loss: L = L_task + λ||φ_student - φ_teacher||²

**Post-training quantization**:
Train continuous → quantize → fine-tune
Minimal accuracy loss

**Layer-wise quantization**:
Early layers: higher precision (K=16-32)
Late layers: lower precision (K=4-8)
Error propagation: early layers more critical

#### 8.6.9 Gray-Scale Lithography and Analog Fabrication

**Gray-scale e-beam lithography**:
Variable dose → variable resist thickness
Analog profile after development
Effectively continuous phase

**Process flow**:
1. Write dose map D(x,y) ∝ φ(x,y)
2. Develop resist → height h(x,y) ∝ D(x,y)
3. Etch transfer → final phase profile

**Accuracy**: Δh/h ≈ 1-2%
Phase error: Δφ = (2π/λ) Δn Δh
For Si (Δn=2), λ=1.55μm, h=1μm: Δφ < 0.01 rad

**Cost**: 10-100× binary lithography
Throughput: 10-100× slower

**Direct laser writing**:
Voxel-based 3D printing
True 3D phase profiles
Resolution: ~200 nm
Speed: slow (mm²/hour)

#### 8.6.10 Future: Metasurface and Sub-Wavelength Quantization

**Metasurface phase control**:
Sub-wavelength scatterers
Phase control via geometry (size, shape, orientation)
Effectively continuous phase

**Meta-atom library**:
Discrete set of geometries
Each → specific phase shift
K = number of meta-atom designs

**Advantages**:
- Single-layer fabrication
- Sub-wavelength resolution
- Polarization control
- Dispersion engineering

**Challenges**:
- Large libraries (100s of designs)
- Coupling between neighbors
- Fabrication variations
- Polarization dependence

**Future**: Inverse-designed metasurfaces
End-to-end optimization
Joint optical + electronic design

---

*End of Piece 6. Next: Piece 7 - Speckle Contrast Reduction: Memory Effect and Optical Vortices*