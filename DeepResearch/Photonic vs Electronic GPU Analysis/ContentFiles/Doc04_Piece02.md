# Document 4: RC Delay Physics and Transmission Line Theory
## Piece 2: Skin Effect and Proximity Effect in Copper Damascene Processes

---

### 4.2 Skin Effect and Proximity Effect in Copper Damascene Processes

As interconnect frequencies exceed GHz, current crowds near conductor surfaces (skin effect) and redistributes due to adjacent conductors (proximity effect). In copper Damascene processes with nanoscale dimensions, these effects dominate resistance increase and must be modeled accurately for signal integrity.

#### 4.2.1 Skin Effect Fundamentals

**Skin depth**:
δ = √(2ρ/ωμ) = √(1/(πfμσ))

For copper at 300K:
ρ = 1.68×10⁻⁸ Ω·m, σ = 5.96×10⁷ S/m, μ = 4π×10⁻⁷ H/m

δ(f) = 66/√f μm (f in Hz)
δ(1 GHz) = 2.1 μm
δ(10 GHz) = 0.66 μm
δ(100 GHz) = 0.21 μm

**Current density distribution** (semi-infinite conductor):
J(z) = J₀ e^{-z/δ} e^{-jz/δ}
where z = depth from surface

**AC resistance per unit length**:
R_ac = R_DC × F(δ/t, δ/W)

For thick conductor (t ≫ δ):
R_ac/R_DC = t/δ × (1 - e^{-t/δ}) ≈ t/δ (for t ≫ δ)

For rectangular conductor (width W, thickness t):
R_ac(ω) = (ρ/δ) × [1/W + 1/t] × (perimeter/2)?
Actually: R_ac = (ρ/δ) × (1 + (δ/t)(1-e^{-t/δ}) + (δ/W)(1-e^{-W/δ}))

**High-frequency limit** (δ ≪ t, W):
R_ac ≈ (ρ/δ) (1/t + 1/W) × (perimeter/2)? No.

Exact: For rectangular cross-section:
R_ac = (ρ/δ) [coth(t/2δ) + coth(W/2δ)] / 2
≈ (ρ/δ) (1 + δ/t + δ/W) for small δ

#### 4.2.2 Proximity Effect

**Mechanism**: Magnetic fields from adjacent conductors induce eddy currents that redistribute current.

**Two parallel conductors** (width W, separation S, thickness t):
Current density perturbed from skin-effect-only distribution.

**Dowell's equation** (for rectangular conductors):
R_ac/R_DC = F(ξ, η, m)
ξ = t/δ, η = S/δ, m = W/t

**General expression** (from field solution):
R_ac = R_DC [1 + (2/ξ) Σ_{n odd} (1/n) tanh(nξ/2) / (1 + (nπη/ξ)²) + ...]

**Key insight**: Proximity effect adds to skin effect
R_total = R_skin + R_proximity

For dense arrays (S < t):
R_proximity can exceed R_skin

**Coupled line matrices**:
[R] and [L] become full matrices
R_ii = self-resistance, R_ij = mutual resistance (proximity)
L_ii = self-inductance, L_ij = mutual inductance

#### 4.2.3 Copper Damascene Process Impact

**Damascene structure**:
- Copper filled in etched trenches
- Barrier/liner: Ta/TaN (2-5 nm)
- Capping layer: CoWP, SiN, or dielectric

**Barrier resistance contribution**:
R_barrier = ρ_barrier × L / (A_barrier)
ρ_TaN ≈ 200-500 μΩ·cm (vs Cu 1.7 μΩ·cm)
For 2 nm TaN on 40 nm Cu: R increases ~10-20%

**Grain size effects**:
- Cu grain size: 20-100 nm (damascene)
- Grain boundary scattering: Mayadas-Shatzkes model
- ρ = ρ₀ [1 + 3α/2 - 3α² + 3α³ ln(1+1/α)]
  α = (ρ₀ λ_F)/(d ρ_GB)
- At 40 nm width: grain boundary scattering adds 20-50%

**Surface scattering** (Fuchs-Sondheimer):
ρ/ρ₀ = 1 + 3λ_F/(8t) (1-p) for t ≪ λ_F
λ_F ≈ 40 nm (Cu at 300K)
p = specularity (0 = diffuse, 1 = specular)

#### 4.2.4 Frequency-Dependent Resistance Model

**Wideband model** (from field solver or measurement):
R(ω) = R_DC + R_skin(ω) + R_proximity(ω) + R_rough(ω)

**Pole-residue approximation** (for SPICE):
R(ω) = R_DC + Σ_k R_k / (1 + jω/ω_k)

**Foster equivalent circuit**:
Series R-L branches:
R(ω) = R_DC + Σ_k (jω L_k) / (1 + jω τ_k)

**Causal model** (Kramers-Kronig):
R(ω) and L(ω) are Hilbert transforms
L(ω) = L_DC - (2/π) ∫_0^∞ R(ω')/(ω'² - ω²) dω'

**Practical compact model** (ASITIC, FastHenry):
R(ω) = R_DC [1 + √(ω/ω_skin) + (ω/ω_prox) + ...]
with corner frequencies:
ω_skin = 2ρ/μt²
ω_prox = 2ρ/μS²

#### 4.2.5 Surface Roughness

**Roughness models**:
1. **Hammerstad-Bekkadal**:
   R_rough/R_smooth = 1 + 2/π arctan(1.4 (Δ/δ)²)
   Δ = RMS roughness

2. **Huray (snowball)**:
   R_rough/R_smooth = 1 + (Δ/δ)² F(Δ/λ)
   
3. **Morgan**:
   R_rough/R_smooth = 1 + 2(Δ/δ)²

**Cu Damascene roughness**:
- CMP process: Δ ≈ 2-5 nm (post-CMP)
- Electrochemical polishing: Δ ≈ 1-2 nm
- Impact: 10-30% R increase at 10-100 GHz

#### 4.2.6 Temperature Dependence

**Resistivity vs. temperature**:
ρ(T) = ρ₀ [1 + α(T - T₀)]
α = 0.00393/K for Cu (at 300K)

**Skin depth temperature dependence**:
δ ∝ √ρ ∝ √(1 + αΔT)

**Self-heating coupling**:
I²R heating → ΔT → ρ increases → R increases → more heating
Thermal runaway possible in high-current lines

**Electromigration acceleration**:
J²ρ(T) heating → void formation
Black's equation: MTTF ∝ J^{-n} exp(E_a/kT)

#### 4.2.7 Experimental Characterization

**TDR (Time Domain Reflectometry)**:
- Fast step response
- Extract Z₀, τ, R(ω) from reflections

**VNA (Vector Network Analyzer)**:
- S-parameters up to 110 GHz
- De-embedding for fixture effects
- Extract R(ω), L(ω), C(ω), G(ω)

**On-wafer measurement**:
- GSG probes, calibration (SOLT, TRL)
- Kelvin structures for DC R
- Transmission line structures for AC

**Key metrics**:
- R_DC from Kelvin
- R(ω)/R_DC vs. √f (skin effect slope)
- Q = ωL/R at frequency

#### 4.2.8 Design Mitigation Strategies

1. **Wider lines**: Reduce R_DC, but increase C
2. **Thicker metal**: Upper layers (Mx, Mx+1) for global signals
3. **Shielding**: Ground lines between signals (increases C)
4. **Low-k dielectric**: Reduce C, but may increase R (porosity)
5. **Alternative metals**: Co, Ru for narrow lines (better scaling)
6. **Repeaters**: Break long lines (but add delay, power)

**Future**: Graphene, carbon nanotubes for interconnects
- Ballistic transport possible
- No skin effect (1D/2D)
- Integration challenges

---

*End of Piece 2. Next: Piece 3 - Surface Roughness Scattering: Hammerstad-Bekkadal Model*