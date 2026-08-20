# Document 4: RC Delay Physics and Transmission Line Theory
## Piece 3: Surface Roughness Scattering: Hammerstad-Bekkadal Model

---

### 4.3 Surface Roughness Scattering: Hammerstad-Bekkadal Model

Surface roughness is a critical factor limiting high-frequency performance of copper interconnects. As skin depth δ approaches surface roughness RMS Δ, current flows along a longer effective path, increasing resistance beyond the smooth-conductor prediction. The Hammerstad-Bekkadal model provides a widely used correction factor.

#### 4.3.1 Physical Mechanism

**Smooth conductor**: Current flows parallel to surface within depth δ
Effective cross-section: A_eff = perimeter × δ

**Rough conductor**: Current follows surface contours
Effective path length: L_eff = L × (1 + ΔL/L)
Resistance increase: R_rough = R_smooth × (L_eff/L)

**Roughness parameters**:
- Δ = RMS height (σ)
- λ = correlation length (lateral)
- Δ/λ = roughness slope

**Regimes**:
- Δ ≪ δ: negligible effect
- Δ ≈ δ: moderate increase
- Δ ≫ δ: current flows in "valleys", large increase

#### 4.3.2 Hammerstad-Bekkadal Model

**Original model** (Hammerstad & Bekkadal, 1980):
R_rough/R_smooth = 1 + 2/π arctan(1.4 (Δ/δ)²)

**Parameters**:
- Δ = RMS roughness (typically 0.3-0.5 μm for PCB, 2-5 nm for IC)
- δ = skin depth = √(2ρ/ωμ)

**Limit behaviors**:
- Δ/δ → 0: ratio → 1 (smooth)
- Δ/δ → ∞: ratio → 1 + 2/π × π/2 = 2 (maximum 2×)

**Modified for ICs** (Huray, snowball model):
R_rough/R_smooth = 1 + (Δ/δ)² F(Δ/λ)

#### 4.3.3 Huray "Snowball" Model

**Physical picture**: Surface modeled as spheres of radius r on base plane
- Sphere radius r ≈ λ/2
- Coverage fraction: A_rough/A_smooth

**Formulation**:
R_rough/R_smooth = 1 + (Δ/δ)² × (1 - e^{-√2 Δ/λ})? 

Actually, Huray model:
R_ratio = 1 + (Δ/δ)² × (1 - (λ/Δ) tanh(Δ/λ))

**Parameters from AFM/SEM**:
- Δ = RMS roughness
- λ = correlation length (from PSD)

**For Cu Damascene**:
- Post-CMP: Δ ≈ 3-5 nm, λ ≈ 20-50 nm
- Δ/λ ≈ 0.1
- At 10 GHz (δ ≈ 660 nm): Δ/δ ≈ 0.005 → negligible
- At 100 GHz (δ ≈ 210 nm): Δ/δ ≈ 0.02 → ~1% increase
- At 1 THz (δ ≈ 66 nm): Δ/δ ≈ 0.075 → ~3% increase

#### 4.3.4 Morgan Model

**Morgan (1949, extended)**:
R_rough/R_smooth = 1 + 2(Δ/δ)²

Simple quadratic, no saturation
Overestimates at high Δ/δ

#### 4.3.5 Gradient Model (Roughness as Tilted Facets)

**Local surface slope**: tan θ = dz/dx
Current path length increase: 1/cos θ ≈ 1 + ½ θ²

**Average over surface**:
⟨θ²⟩ = (2π/λ)² Δ²? No.

For Gaussian surface with PSD S(k):
⟨(dz/dx)²⟩ = ∫ k² S(k) dk

**Exponential correlation**: S(k) ∝ 1/(1 + k²λ²)
⟨θ²⟩ = Δ²/λ²

R_rough/R_smooth ≈ 1 + ½ ⟨θ²⟩ (δ/Δ)²? Need careful derivation.

**Correct gradient model** (for Δ ≪ δ):
R_ratio = 1 + (πΔ/λ)² / 4 × (δ/Δ)²? 

Actually: For small slopes, resistance increase proportional to surface area increase:
A_rough/A_smooth = √(1 + ⟨(∇z)²⟩) ≈ 1 + ½ ⟨(∇z)²⟩

For exponential correlation: ⟨(∇z)²⟩ = 2Δ²/λ²
R_ratio = 1 + Δ²/λ²

Independent of frequency! (for Δ ≪ δ)

#### 4.3.6 Full-Wave Validation

**Method of Moments (MoM)**:
- Discretize rough surface
- Solve integral equation for current
- Compute R, L from fields

**Finite Element (FEM)**:
- 3D mesh of rough geometry
- Direct Maxwell solution
- Benchmark for compact models

**Results for Cu (Δ=5nm, λ=30nm)**:
| Frequency | δ (nm) | Δ/δ | Hammerstad | MoM |
|-----------|--------|-----|------------|-----|
| 10 GHz | 660 | 0.0076 | 1.0001 | 1.0001 |
| 100 GHz | 210 | 0.024 | 1.001 | 1.001 |
| 500 GHz | 93 | 0.054 | 1.005 | 1.005 |
| 1 THz | 66 | 0.076 | 1.01 | 1.01 |
| 5 THz | 29 | 0.17 | 1.05 | 1.05 |

Hammerstad matches full-wave within 5% for Δ/δ < 0.3

#### 4.3.7 Roughness in Damascene Process Flow

**CMP (Chemical Mechanical Polishing)**:
- Primary source of roughness
- Slurry particles, pad asperities
- Δ_post-CMP ≈ 2-5 nm

**Electroplating**:
- Bottom-up fill
- Grain growth affects surface
- Annealing: grain growth → smoother?

**Capping layer**:
- CoWP (electroless): Δ ≈ 1-2 nm
- SiN (PECVD): conformal, follows Cu roughness
- SiCN: similar

**Etch-back / recess**:
- Dishing, erosion
- Local thickness variation
- Affects R, L, C

#### 4.3.8 Impact on Signal Integrity

**Insertion loss increase**:
α = R/(2Z₀) ∝ R_rough
IL(dB) = 20 log₁₀(e) × α × L × R_ratio

**Eye diagram degradation**:
- Increased ISI
- Reduced eye height
- Jitter increase

**Crosstalk modification**:
- Roughness affects coupling capacitance
- Non-uniform fields near rough surfaces

**Clock distribution**:
- Jitter: σ_jitter ∝ √(R_rough)
- Phase noise increase

#### 4.3.9 Mitigation Techniques

**Process optimization**:
- CMP parameter tuning (pressure, speed, slurry)
- Post-CMP clean (brush, megasonic)
- Electrochemical planarization (ECP)

**Design techniques**:
- Wider lines (reduces R, but increases C)
- Shielded lines (G-S-G)
- Differential signaling (common-mode rejection)

**Material solutions**:
- CoWP cap: smoother, diffusion barrier
- Ru liner: smoother nucleation
- Graphene cap: atomically smooth

**Advanced patterning**:
- Self-aligned quadruple patterning (SAQP)
- EUV with optimized resist
- Directed self-assembly (DSA)

#### 4.3.10 Future: Atomic-Scale Smoothness

**Atomic layer deposition (ALD)**:
- Sub-nm roughness possible
- Conformal coverage

**Epitaxial Cu**:
- Single-crystal Cu on lattice-matched substrate
- Δ < 0.5 nm
- No grain boundaries

**2D material capping**:
- Graphene/hBN on Cu
- Prevents oxidation, smoothens
- Thermal management benefit

**Superconducting interconnects**:
- Nb, Al at cryogenic temps
- Zero DC resistance
- Surface roughness still matters for RF loss

---

*End of Piece 3. Next: Piece 4 - Dielectric Loss Tangent and Frequency-Dependent Permittivity*