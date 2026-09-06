# Document 5: Wavelength Division Multiplexing Mathematics
## Piece 6: Nonlinear Schrödinger Equation for Pulse Propagation

---

### 5.6 Nonlinear Schrödinger Equation for Pulse Propagation

The Nonlinear Schrödinger Equation (NLSE) is the fundamental equation governing pulse propagation in nonlinear optical fibers and waveguides. It captures the interplay between dispersion, nonlinearity, and loss, forming the basis for modeling WDM system impairments.

#### 5.6.1 Derivation of NLSE

**Starting from Maxwell's equations**:
∇ × E = -μ₀ ∂H/∂t
∇ × H = ε₀ ∂E/∂t + ∂P/∂t

**Polarization**:
P = P_L + P_NL
P_L = ε₀ χ⁽¹⁾ E (linear)
P_NL = ε₀ χ⁽³⁾ |E|² E (Kerr nonlinearity)

**Slowly varying envelope approximation**:
E(r,t) = ½ [A(z,t) F(x,y) e^{j(β₀z-ω₀t)} + c.c.]

**Wave equation for envelope**:
∂A/∂z + β₁ ∂A/∂t + jβ₂/2 ∂²A/∂t² - β₃/6 ∂³A/∂t³ + ...
= -α/2 A + jγ |A|² A

where γ = n₂ ω₀ / (c A_eff)

#### 5.6.2 NLSE Terms and Physical Meaning

**Linear terms**:
- β₁ = 1/v_g: inverse group velocity (walk-off)
- β₂ = dβ₁/dω: group velocity dispersion (GVD)
- β₃ = dβ₂/dω: third-order dispersion (TOD)
- α: linear loss coefficient

**Nonlinear term**:
γ|A|²A: self-phase modulation (SPM), cross-phase modulation (XPM), four-wave mixing (FWM)

**Raman term** (delayed nonlinearity):
jγ A ∫ h_R(t') |A(t-t')|² dt'
h_R(t) = (τ₁²+τ₂²)/(τ₁τ₂²) e^{-t/τ₂} sin(t/τ₁)

**Self-steepening**:
j ∂/∂t (γ|A|²A)/ω₀
Shock wave formation, optical wave breaking

#### 5.6.3 Soliton Solutions

**Fundamental soliton** (β₂ < 0, anomalous dispersion):
A(z,t) = √P₀ sech(t/T₀) exp(jz/2L_D)

where L_D = T₀²/|β₂| (dispersion length)
L_NL = 1/(γ P₀) (nonlinear length)
Soliton condition: L_D = L_NL → N = 1

**N-th order soliton**:
A(z,t) = N √P₀ sech(t/T₀) × periodic evolution
Period: z₀ = (π/2) L_D

**Dispersion-managed solitons**:
Alternating β₂ > 0 and β₂ < 0
Average β₂ ≈ 0, but pulse breathes
Used in high-capacity systems

#### 5.6.4 WDM: Coupled NLSE

**Multi-channel NLSE** (for channels n = 1..N):
∂A_n/∂z + β₁ ∂A_n/∂t + jβ₂/2 ∂²A_n/∂t²
= -α/2 A_n + jγ [ |A_n|² + 2 Σ_{m≠n} |A_m|² ] A_n
+ 2jγ Σ_{m≠n} A_m² A*_n (XPM with phase correlation)
+ jγ Σ_{i,j,k} A_i A_j A*_k δ(ω_i+ω_j-ω_k-ω_n) (FWM)

**Manakov equation** (random polarization):
∂A/∂z = ... + j(8/9)γ |A|² A
Averaged over fast polarization rotation

#### 5.6.5 Split-Step Fourier Method (SSFM)

**Numerical solution**:
1. Linear step (frequency domain):
   Ã(ω,z+Δz) = Ã(ω,z) exp[( -α/2 + jβ₂ω²/2 - jβ₃ω³/6 ) Δz]
2. Nonlinear step (time domain):
   A(t,z+Δz) = A(t,z) exp[ jγ |A|² Δz + Raman + self-steepening ]
3. Repeat

**Adaptive step size**:
Δz = min( 0.1/γP_max, 0.1 T₀²/|β₂|, ... )

**Symmetrized SSFM** (higher order):
½ Linear → Nonlinear → ½ Linear

#### 5.6.6 Nonlinear Impairments from NLSE

**Self-Phase Modulation (SPM)**:
Phase shift: φ_NL = γ P L_eff
Spectral broadening: Δω ≈ φ_NL / T₀
Chirp: δω(t) = -∂φ_NL/∂t

**Cross-Phase Modulation (XPM)**:
Phase on channel n from m:
φ_XPM = 2γ ∫ P_m(z) dz
More severe than SPM (factor 2)

**Four-Wave Mixing (FWM)**:
Energy transfer between channels
Phase matching: Δβ = 0

**Raman effects**:
SRS: power transfer to longer λ
Raman-induced crosstalk
Raman gain saturation

**Modulation instability**:
CW beam breaks into pulse train
Gain: g = 2√(γ P |β₂| ω) - α
Threshold: P > |β₂|/γ ω²

#### 5.6.7 Perturbation Theory for NLSE

**Linearized NLSE** (small signal on CW background):
A = √P₀ + a(z,t) e^{jγP₀z}
∂a/∂z + β₁ ∂a/∂t + jβ₂/2 ∂²a/∂t² = jγP₀ (a + a*)

**Eigenmode analysis**:
a(z,t) = u e^{j(Ωt - Kz)} + v* e^{-j(Ωt - Kz)}
Dispersion relation:
K² = (β₂Ω²/2)² - (γP₀)² + ...

**Gain spectrum**:
For β₂ < 0: modulation instability gain
For β₂ > 0: no instability (stable)

#### 5.6.8 Variational Method for Pulse Evolution

**Lagrangian density**:
L = (j/2)(A*∂A/∂z - A∂A*/∂z) - β₂/2 |∂A/∂t|² + γ/2 |A|⁴

**Ansatz** (Gaussian pulse):
A(z,t) = √P₀ (T₀/T) exp[ - (1+jC)t²/2T² + jφ ]

**Euler-Lagrange equations**:
dT/dz = β₂ C T / T₀²
dC/dz = β₂ (C² - 1)/T₀² + 2γP₀/√π T₀/T
...

**Pulse parameters evolution**:
Width T(z), chirp C(z), phase φ(z)

#### 5.6.9 NLSE for Silicon Waveguides

**Modified NLSE for Si**:
∂A/∂z = -α/2 A - β_TPA/2 |A|² A - σ_FCA N_c A
+ jβ₂/2 ∂²A/∂t² - β₃/6 ∂³A/∂t³
+ jγ |A|² A + jγ_R A ∫ h_R(t')|A(t-t')|² dt'

**Carrier density**:
∂N_c/∂t = β_TPA/(2ħω) |A|⁴ - N_c/τ_c + D∇²N_c

**Free-carrier effects**:
σ_FCA = σ_e + σ_h
Δn_FC = - (e²λ²/8π²c²ε₀n) (N_e/m_e + N_h/m_h)

**Two-photon absorption**:
β_TPA ≈ 0.5 cm/GW
Limits peak power, effective length

#### 5.6.10 Numerical Validation and Applications

**Validation metrics**:
- Soliton propagation: shape preservation
- SPM spectrum: analytical vs numerical
- FWM efficiency: phase matching curves
- Raman gain: g_R(Ω) vs theory

**Applications**:
- System design (100G, 400G, 800G+)
- Digital back-propagation (DBP) algorithms
- Nonlinear compensation (inverse NLSE)
- Soliton communication systems
- Supercontinuum generation
- Frequency comb generation

**Performance optimization**:
- Step size control (local error)
- Parallelization (channel-level, z-level)
- GPU acceleration (cuFFT)
- Reduced models (moment method, moment closure)

---

*End of Piece 6. Next: Piece 7 - Dispersion Management: β₂, β₃, β₄ Engineering in Si Waveguides*