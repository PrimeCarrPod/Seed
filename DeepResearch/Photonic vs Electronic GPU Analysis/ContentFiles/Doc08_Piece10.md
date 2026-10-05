# Document 8: Diffractive Optical Neural Network Mathematics
## Piece 10: 3D Volumetric Computing: Axial Resolution and Depth of Field

---

### 8.10 3D Volumetric Computing: Axial Resolution and Depth of Field

Diffractive Optical Neural Networks can exploit the third dimension (axial/z-direction) for volumetric computing, enabling 3D convolution, volumetric classification, and depth-resolved sensing. This piece analyzes the axial resolution, depth of field, and information capacity of 3D diffractive systems.

#### 8.10.1 Axial Resolution Fundamentals

**Axial resolution** (depth resolution): Minimum resolvable distance along optical axis

**Coherent axial PSF**:
h(z) = ∫ U(x,y,0) e^{j k_z z} dx dy
k_z = √(k² - k_x² - k_y²)

**Axial FWHM**:
Δz = 2λ / NA² (for high NA)
Δz = λ / (2 NA²) (for low NA, paraxial)

**For NA = 0.5, λ = 1.55 μm**:
Δz = 2 × 1.55 / 0.5² = 12.4 μm

**Comparison**: Lateral Δx = 0.61 λ/NA = 1.9 μm
Axial resolution ~6× worse than lateral

#### 8.10.2 Depth of Field

**Depth of field (DoF)**: Range where image remains "in focus"
DoF = λ / NA² (Rayleigh criterion)
DoF = ±λ / (2 NA²) (half-range)

**For NA = 0.5**: DoF = 6.2 μm

**Extended DoF** (with phase masks):
Cubic phase mask: Extends DoF 10-100×
Wavefront coding: Trade resolution for DoF

**Trade-off**: DoF × Resolution ≈ constant
Extended DoF → reduced lateral resolution

#### 8.10.3 Volumetric Point Spread Function

**3D PSF** (intensity):
PSF_3D(x,y,z) = |h(x,y,z)|²

**Shape**: Elongated along z (cigar-shaped)
Aspect ratio: Δz/Δx ≈ 2/NA

**For NA=0.5**: Δz/Δx ≈ 4
Volume of PSF: V_PSF ≈ (π/4) Δx² Δz

**Volume per resolvable voxel**:
V_voxel = Δx Δy Δz = (0.61λ/NA)² (2λ/NA²)
= 0.74 λ³ / NA⁴

**For λ=1.55μm, NA=0.5**: V_voxel ≈ 1.5×10⁻¹⁷ m³

#### 8.10.4 Volumetric Information Capacity

**Number of resolvable voxels**:
N_voxel = (Volume / V_voxel) = (A L / V_voxel)

**For 1 cm³ volume, NA=0.5**:
N_voxel ≈ (10⁻⁶ m³) / (1.5×10⁻¹⁷ m³) ≈ 6.7×10¹⁰ voxels

**Voxel rate** (at 10 GHz):
6.7×10¹⁰ × 10¹⁰ = 6.7×10²⁰ voxels/s

**Voxel operations** (MAC per voxel):
If each voxel = 1 MAC: 6.7×10²⁰ MAC/s

**Comparison**: Electronic GPU ~10¹⁵ MAC/s
Optical volumetric: 10⁵× higher theoretical throughput

#### 8.10.5 3D Convolution in D2NN

**3D convolution**: y(x,y,z) = x * * h (3D convolution)

**Optical implementation**:
- Input: 3D volume (encoded in wavelength, angle, or time)
- D2NN: 3D phase mask (volume hologram)
- Output: 3D convolution result

**Angular spectrum for 3D**:
U(k_x,k_y,z) = U(k_x,k_y,0) H(k_x,k_y,z)
H = exp(j √(k² - k_x² - k_y²) z)

**3D Fourier relationship**:
ℱ₃D{U(x,y,z)} = ℱ₂D{U(x,y,0)} × H(k_x,k_y,z)

**3D convolution theorem**:
y = x * * h ↔ ℱ₃D{y} = ℱ₃D{x} · ℱ₃D{h}

**Optical 3D filter**:
Phase mask encodes ℱ₃D{h}
Input volume → propagation → filtered volume

#### 8.10.6 Axial Sectioning and Tomography

**Optical sectioning**: Isolate single axial plane
Methods:
1. **Confocal**: Pinhole rejects out-of-focus
2. **Structured illumination**: Moiré fringes
3. **Light sheet**: Illumination orthogonal to detection
4. **Computational**: Digital refocusing

**D2NN for optical sectioning**:
Phase mask designed to focus at specific z
Rejects other planes → optical sectioning

**Tomographic reconstruction**:
Multiple angles → 3D reconstruction
D2NN as projection operator
Inverse problem: x = A⁻¹ y

#### 8.10.7 3D D2NN Architectures

**Volumetric D2NN** (3D-printed):
- Multiple layers in z
- True 3D phase modulation
- Fabrication: Two-photon polymerization
- Resolution: ~200 nm

**Layered 2D D2NN** (stacked):
- N 2D layers with spacing Δz
- Equivalent to 3D if Δz < λ/2
- Easier fabrication (standard lithography)

**Wavelength-encoded 3D**:
Different λ → different z planes
WDM for volumetric parallelism
N_λ wavelengths → N_λ depth planes

**Temporal encoding**:
Time-gated detection
Different delays → different z
Compatible with pulsed lasers

#### 8.10.8 Axial Resolution Enhancement

**Super-resolution techniques**:
1. **STED** (Stimulated Emission Depletion):
   Depletion beam with donut shape
   Δz < λ/NA² (down to λ/10)

2. **4Pi microscopy**:
   Opposing objectives
   Coherent interference
   Δz = λ/(4n) ≈ λ/6

3. **Structured illumination** (SIM):
   Patterned illumination
   2× resolution improvement

4. **STORM/PALM** (single-molecule):
   Localization precision < 10 nm
   Requires sparse emitters

**D2NN for super-resolution**:
Phase mask encodes super-resolution PSF
Learns optimal depletion/pattern
End-to-end trained

#### 8.10.9 3D Classification and Segmentation

**3D object classification**:
Input: 3D volume (voxel grid)
D2NN: 3D convolutional layers
Output: Class probabilities

**Volumetric MNIST** (3D digits):
- 16×16×16 voxels
- 10 classes
- Accuracy: >95% achievable

**Medical imaging** (CT/MRI):
- 512×512×512 voxels
- Tumor detection, organ segmentation
- D2NN as fast inference engine

**Point cloud processing**:
Input: Sparse 3D points
Voxelization → D2NN
PointNet-style but optical

#### 8.10.10 Future: Holographic and Quantum Volumetric Computing

**Holographic volumetric memory**:
Store 3D data in volume hologram
Readout: Reference beam → reconstruction
Capacity: TB/cm³ demonstrated

**Volumetric optical computing**:
Full 3D matrix multiplication
x, W → y (all 3D)
True 3D tensor cores

**Quantum volumetric**:
Multi-photon interference in 3D
Boson sampling in 3D
Quantum advantage for 3D problems

**Light field computing**:
4D light field (x,y,θ,φ)
D2NN operates on light field
Novel imaging modalities

**Conclusion**: 3D volumetric D2NNs offer:
- 100-1000× more parallelism than 2D
- Natural for volumetric data (medical, scientific)
- Challenges: Fabrication, alignment, readout
- Future: Hybrid 2D+WDM+temporal

---

*End of Piece 10. Document 8 complete (10 pieces). Next: Glue pieces into Doc08_Final.md*