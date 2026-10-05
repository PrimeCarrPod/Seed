# Document 6: Mach-Zehnder Interferometer Mesh Theory
## Piece 1: SU(N) Group Representation of Unitary Mesh Transformations

---

### 6.1 SU(N) Group Representation of Unitary Mesh Transformations

Mach-Zehnder Interferometer (MZI) meshes implement arbitrary unitary transformations on optical modes, providing the mathematical foundation for programmable linear optics in optical neural networks and quantum computing. The mesh represents elements of the special unitary group SU(N), where N is the number of optical modes.

#### 6.1.1 Unitary Group and Optical Modes

**Optical field as vector**:
E = [E₁, E₂, ..., Eₙ]ᵀ ∈ ℂᴺ

**Linear optical transformation**:
E_out = U E_in
where U ∈ U(N) (unitary group)

**Energy conservation**:
E_out† E_out = E_in† U† U E_in = E_in† E_in
→ U† U = I

**Special unitary group SU(N)**:
det(U) = 1 (global phase irrelevant)
Dimension: N² - 1 real parameters

#### 6.1.2 MZI as SU(2) Building Block

**Single MZI transfer matrix**:
U_MZI(θ, φ) = e^{jφ/2} [cos(θ/2)  -j sin(θ/2)
                        -j sin(θ/2)  cos(θ/2)]

where θ = phase difference between arms, φ = common phase

**SU(2) parameterization**:
U(θ, φ) = exp(-j θ/2 n·σ) × e^{jφ/2}
where σ = (σ_x, σ_y, σ_z) are Pauli matrices, n = (0,0,1)

**Universal SU(2)**:
Any SU(2) matrix can be written as MZI with appropriate θ, φ

#### 6.1.3 Mesh Architecture for SU(N)

**Triangular mesh (Reck et al., 1994)**:
- N(N-1)/2 MZIs
- Upper triangular arrangement
- Input modes enter top, output at bottom

**Rectangular mesh (Clements et al., 2016)**:
- N(N-1)/2 MZIs (same count)
- Rectangular grid
- Better loss uniformity, easier fabrication

**Both implement full SU(N)**:
Any U ∈ SU(N) can be decomposed

#### 6.1.4 Reck Decomposition

**Algorithm**:
1. Zero out last column from bottom up
2. Zero out second-last column, etc.
3. Sequence of N(N-1)/2 Givens rotations

**Givens rotation** G(i,j,θ):
- Acts on modes i, j
- Zeroes element U_{i,j}
- Implemented by MZI between waveguides i, j

**Parameter count**:
N(N-1)/2 angles θ + N phases = N² - N + N = N² parameters
SU(N) has N²-1 parameters (one global phase free)

#### 6.1.5 Clements Decomposition

**Rectangular mesh layout**:
- MZIs arranged in N/2 columns
- Alternating even/odd pairing
- (N-1) rows of MZIs

**Advantages over Reck**:
- Uniform depth (all modes traverse N-1 MZIs)
- Lower maximum loss (loss ∝ depth)
- Easier fabrication (regular grid)
- Better thermal crosstalk symmetry

**Decomposition algorithm**:
Similar Givens rotations but ordered differently
Same parameter count, different mesh topology

#### 6.1.6 SU(N) Lie Algebra and Generators

**Lie algebra su(N)**:
Traceless anti-Hermitian matrices
Dimension: N² - 1

**Generators**:
- N-1 diagonal (Cartan subalgebra)
- N(N-1)/2 raising operators
- N(N-1)/2 lowering operators

**MZI mesh as exponentiation**:
U = exp(Σ θ_k G_k)
where G_k are mesh generators (embedded SU(2) algebras)

**Geodesic on SU(N)**:
Mesh parameters define geodesic from I to U
Length = √(Σ θ_k²) (for Reck) or similar

#### 6.1.7 Universality and Completeness

**Theorem** (Reck, Clements):
Any U ∈ SU(N) can be exactly implemented by N(N-1)/2 MZIs
Mesh is universal for linear optics

**Proof sketch**:
- Givens rotations generate SU(N)
- QR decomposition via Givens
- Mesh implements QR decomposition optically

**Limitations**:
- Requires phase shifters with 2π range
- Losses accumulate
- Fabrication errors limit fidelity

#### 6.1.8 Mesh Parameterization for ONNs

**Weight matrix** W ∈ ℂ^{M×N}:
For M×N ONN layer, need rectangular mesh
Or square mesh with input/output padding

**Singular Value Decomposition**:
W = U Σ V†
U, V implemented by MZI meshes (unitary)
Σ implemented by attenuators/amplifiers (or singular value mesh)

**Singular value mesh**:
Diagonal Σ requires variable splitting ratios
MZI with θ = 2 arctan(√σ) implements singular value

#### 6.1.9 Gradient Computation on Mesh

**Wirtinger calculus**:
For real loss L(θ), gradient:
∂L/∂θ_k = 2 Re[ (∂L/∂U)† ∂U/∂θ_k ]

**Adjoint method** (efficient):
1. Forward pass: compute U(θ)
2. Backward pass: propagate adjoint
3. Gradient: ∂L/∂θ_k = 2 Im[ ⟨ψ_out| G_k |ψ_in⟩ ]

**Automatic differentiation**:
Modern frameworks (PyTorch, JAX) can differentiate through mesh
Custom CUDA kernels for speed

#### 6.1.10 Mesh Fabrication Non-Idealities

**Phase errors**:
Δθ_k ~ N(0, σ_θ²)
Typical σ_θ ≈ 0.01-0.05 rad (0.5-3°)

**Amplitude errors**:
Imperfect splitting ratio
cos²(θ/2) ≠ ideal
Due to waveguide width variation

**Loss variation**:
Different path lengths → different loss
Mismatch in interference visibility

**Crosstalk**:
Unintended coupling between adjacent waveguides
Parasitic MZIs

**Calibration**:
- Measure transfer matrix
- Solve for actual θ_k (nonlinear optimization)
- Use in forward model for training

---

*End of Piece 1. Next: Piece 2 - Reck vs. Clements Decomposition: Optimality Proofs*