# Document 10: Heterogeneous Integration and III-V/Silicon Epitaxy
## Piece 2: Critical Thickness: Matthews-Blakeslee Model for Dislocation Formation

---

### 10.2 Critical Thickness: Matthews-Blakeslee Model for Dislocation Formation

The critical thickness (h_c) is the maximum thickness of a strained epitaxial layer before misfit dislocations form to relieve the strain. The Matthews-Blakeslee model provides the foundational theoretical framework for predicting this critical thickness in lattice-mismatched heteroepitaxy.

#### 10.2.1 Force Balance on a Dislocation

**Dislocation line energy** (per unit length):
E_line = (Gb²/4π) × (1-ν cos²α)/(1-ν) × ln(h/b)
where:
- G = shear modulus
- b = Burgers vector magnitude
- ν = Poisson's ratio
- α = angle between b and dislocation line
- h = layer thickness

**Force on dislocation** (Peach-Koehler):
F = σ × b (per unit length)
σ = strain-induced stress

**Misfit stress** (biaxial):
σ_xx = σ_yy = E f / (1-ν)
σ_zz = 0

**Force on 60° dislocation** (glide on {111}):
F_misfit = σ_xx b cosφ
φ = angle between Burgers vector and strain direction

**Force balance at critical thickness**:
F_misfit = F_line_tension
σ f b = (Gb²/4π) × (1-ν cos²α)/(1-ν) × (1/h_c)

#### 10.2.2 Matthews-Blakeslee Equation

**Critical thickness equation**:
h_c = b / (8πf) × (1-ν cos²α)/(1-ν) × [ln(h_c/b) + 1]

**For 60° dislocation** (α = 60°, cos²α = 1/4):
(1-ν cos²α)/(1-ν) = (1-ν/4)/(1-ν)

**Simplified form** (commonly used):
h_c = b / (4πf) × (1-ν/4)/(1-ν) × ln(h_c/b)

**Iterative solution**:
h_c appears on both sides
Typical: h_c ≈ b/(4πf) × ln(h_c/b)

**Example: InP on Si**
f = 0.0806, b = 4.15 Å, ν = 0.36
h_c ≈ 4.15 / (4π × 0.0806) × (1-0.36/4)/(1-0.36) × ln(h_c/4.15)
≈ 4.1 Å × 1.25 × ln(h_c/4.15)
Iteration: h_c ≈ 5-10 nm

**Example: GaAs on Si**
f = 0.0409, b = 4.0 Å, ν = 0.31
h_c ≈ 10-20 nm

#### 10.2.3 People-Bean Model (Improved)

**People-Bean correction** (accounts for dislocation core energy):
h_c = b / (4πf) × (1-ν/4)/(1-ν) × [ln(h_c/b) + 1]

**Core energy term**: +1 inside ln argument
Accounts for dislocation core formation energy

**Difference**:
MB: ln(h_c/b)
PB: ln(h_c/b) + 1
≈ 10-20% thicker h_c prediction

**Empirical validation**:
PB model matches experiments better for III-V/Si

#### 10.2.4 Kinetic Critical Thickness (vs. Thermodynamic)

**Thermodynamic h_c**: Energy minimum (equilibrium)
**Kinetic h_c**: Nucleation barrier limited

**Dislocation nucleation barrier**:
E_nuc = E_line × L_c - F_misfit × L_c
L_c = critical nucleus length

**Nucleation rate**:
J = J_0 exp(-E_nuc/kT)

**Kinetic h_c** (time-dependent):
h_c(t) = h_c,thermo + (kT/Gb) ln(t/t_0)

**At growth temperature** (600°C):
E_nuc small → kinetic h_c ≈ thermodynamic h_c

**At room temperature**:
E_nuc large → kinetic h_c > thermodynamic h_c
Metastable strained layers possible

#### 10.2.5 Critical Thickness for Different Dislocation Types

**60° dislocation** (most common):
b = a/√2, α = 60°
h_c,60° = b/(4πf) × (1-ν/4)/(1-ν) × ln(h_c/b)

**Edge dislocation** (α = 90°):
b = a/√2, α = 90°
h_c,edge = b/(4πf) × 1/(1-ν) × ln(h_c/b)
Larger h_c (no cos²α reduction)

**Screw dislocation** (α = 0°):
b = a/√2, α = 0°
h_c,screw = b/(4πf) × (1-ν)/(1-ν) × ln(h_c/b)
= b/(4πf) × ln(h_c/b)
Smallest h_c

**Lomer dislocation** (b = a/2⟨100⟩):
b = a/2, α = 90°
h_c,Lomer = a/(8πf) × 1/(1-ν) × ln(h_c/b)

#### 10.2.6 Strain Relaxation Beyond h_c

**Relaxation degree**:
η = (a_film - a_relaxed) / (a_film - a_substrate)

**Relaxation kinetics**:
dη/dt = v_d × ρ_m
v_d = dislocation velocity
ρ_m = mobile dislocation density

**Dislocation velocity**:
v_d = v_0 (τ/τ_0)^m
τ = resolved shear stress
m = stress exponent (3-10)

**Complete relaxation**:
η → 1 as thickness → ∞
Saturation: η_sat < 1 (dislocation interactions)

#### 10.2.7 Critical Thickness for III-V/Si Systems

| System | f (%) | b (Å) | ν | h_c (nm) |
|--------|-------|-------|---|----------|
| GaAs/Si | 4.09 | 4.00 | 0.31 | 12-18 |
| InP/Si | 8.06 | 4.15 | 0.36 | 4-7 |
| In_0.53Ga_0.47As/Si | 8.06 | 4.15 | 0.36 | 4-7 |
| AlGaAs/Si (x=0.3) | 2.5 | 4.05 | 0.30 | 25-35 |
| InGaAs/Si (x=0.3) | 3.2 | 4.10 | 0.32 | 18-25 |

**Graded buffer approach**:
Start at small f, gradually increase
Effective h_c much larger (cumulative)

#### 10.2.7 Experimental Verification Techniques

**In-situ monitoring**:
- RHEED (Reflection High-Energy Electron Diffraction)
- Streaks → spots transition at h_c
- Intensity oscillations → monolayer counting

**Ex-situ characterization**:
- XRD: rocking curve broadening
- TEM: direct dislocation imaging
- AFM: surface cross-hatch pattern
- CL: non-radiative recombination

**Cross-hatch pattern**:
Surface undulations from dislocation strain fields
Spacing ≈ h_c
Amplitude ∝ strain relaxation

#### 10.2.8 Design Rules for III-V/Si Epitaxy

**For coherent growth** (no dislocations):
h < 0.5 h_c (design margin)
Typical: 2-3 nm for InP/Si, 5-10 nm for GaAs/Si

**For partially relaxed buffers**:
h ≈ h_c to 2 h_c
Target η = 30-50% relaxation
Then grow active region on relaxed template

**For fully relaxed buffers**:
h > 5 h_c
η > 90%
Dislocation density saturates

**Graded buffer design**:
Δf/Δz = constant (linear grading)
Total thickness H = Σ h_c(f_i)
Optimal: constant strain energy rate

#### 10.2.9 Beyond Matthews-Blakeslee: Modern Extensions

**Dislocation dynamics simulations**:
Phase-field, dislocation dynamics
Predict TDD evolution
Account for dislocation interactions

**Compositionally graded buffers**:
h_c,eff = ∫ df / (dh_c/df)
Much larger than single-layer h_c

**Dislocation filtering**:
Interposed layers (InGaP, AlGaAs)
Strain fields trap threading dislocations
Effective h_c for subsequent layers increased

**Quantum dot formation**:
Stranski-Krastanov transition
3D islands instead of dislocations
Critical for QD lasers on Si

#### 10.2.9 Future: Machine Learning for h_c Prediction

**ML models for h_c prediction**:
Input: material parameters, growth conditions
Output: h_c, TDD prediction
Training: experimental database

**In-situ ML control**:
RHEED pattern analysis → real-time h_c detection
Adaptive growth parameter adjustment

**Digital twin for epitaxy**:
Virtual growth simulation
Predict h_c, TDD, surface morphology
Closed-loop growth control

---

*End of Piece 2. Next: Piece 3 - Aspect Ratio Trapping (ART) in Selective Area Epitaxy*