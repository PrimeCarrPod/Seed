# Document 10: Heterogeneous Integration and III-V/Silicon Epitaxy
## Piece 8: Coefficient of Thermal Expansion (CTE) Mismatch Stress Analysis

---

### 10.8 Coefficient of Thermal Expansion (CTE) Mismatch Stress Analysis

CTE mismatch between dissimilar materials in heterogeneous photonic integration generates thermomechanical stress during temperature changes (cool-down from processing, operating temperature cycles). This stress causes wafer bow, delamination, cracking, and device performance degradation. Accurate stress analysis is essential for reliable heterogeneous integration.

#### 10.8.1 CTE Values for Key Materials

**Substrates and semiconductors**:
| Material | CTE (ppm/°C) | Notes |
|----------|--------------|-------|
| Si (100) | 2.6 | Anisotropic: 2.3-2.8 |
| GaAs | 5.7 | |
| InP | 4.5 | |
| InGaAs (x=0.53) | 5.2 | |
| GaN | 5.6 | |
| Ge | 6.0 | |

**Dielectrics**:
| Material | CTE (ppm/°C) | Notes |
|----------|--------------|-------|
| SiO₂ (thermal) | 0.5 | |
| SiO₂ (PECVD) | 2-3 | Depends on density |
| SiN | 2-3 | |
| SiCN | 3-4 | |
| BCB | 40-60 | Polymer |
| PI (polyimide) | 20-50 | |
| Epoxy | 40-80 | |

**Metals**:
| Material | CTE (ppm/°C) | Notes |
|----------|--------------|-------|
| Cu | 17 | |
| Al | 23 | |
| Au | 14 | |
| Sn | 22 | |
| Ni | 13 | |
| W | 4.5 | |

**Advanced materials**:
| Material | CTE (ppm/°C) | Notes |
|----------|--------------|-------|
| Diamond | 1.0 | Best thermal match to Si |
| SiC | 4.0 | |
| AlN | 4.5 | |
| BeO | 9.0 | |
| Graphene (in-plane) | -8 to -1 | Negative CTE! |
| CNT forest | 0.1-1 | Tunable |

#### 10.8.2 Thermal Strain and Stress Fundamentals

**Thermal strain** (unconstrained):
ε_th = α ΔT
where ΔT = T_process - T_operating (or T_room)

**Biaxial stress** (constrained film on thick substrate):
σ_f = E_f / (1-ν_f) × (α_s - α_f) ΔT
where:
- E_f, ν_f = film Young's modulus, Poisson's ratio
- α_s, α_f = substrate, film CTE
- ΔT = temperature change

**Stoney equation** (wafer curvature):
κ = 6 (1-ν_s) h_f σ_f / (E_s h_s²)
κ = curvature (1/R)
h_f, h_s = film, substrate thickness

**Example**: InP on Si, ΔT = 400°C (growth to RT)
α_Si = 2.6, α_InP = 4.5 ppm/°C
Δα = 1.9 ppm/°C
σ_InP = 85/(1-0.36) × 1.9e-6 × 400 ≈ 190 MPa (tensile)

#### 10.8.3 Wafer Bow and Warpage

**Wafer bow** (bow = center displacement):
bow = κ L² / 8
L = wafer diameter

**For 300mm wafer, InP film (1μm) on Si (775μm)**:
κ = 6(1-0.28)×1e-6×190e6/(130e9×775e-6²) ≈ 0.002 m⁻¹
bow = 0.002 × 0.3²/8 ≈ 22.5 μm

**Acceptable bow limits** (SEMI standards):
- 150mm: < 25 μm
- 200mm: < 40 μm
- 300mm: < 60 μm

**Bow mitigation**:
- Symmetric film stacks (front/back balanced)
- CTE-matched materials
- Stress compensation layers
- Low-temperature processing

#### 10.8.4 Stress in Multilayer Stacks

**General multilayer stress** (N layers on substrate):
σ_i = E_i/(1-ν_i) × [α_eff - α_i] ΔT
α_eff = Σ (E_j h_j α_j/(1-ν_j)) / Σ (E_j h_j/(1-ν_j))

**Force balance**:
Σ σ_j h_j = 0 (no net force)
**Moment balance**:
Σ σ_j h_j (z_j - z_neutral) = 0

**Neutral axis**:
z_n = Σ (E_j h_j/(1-ν_j) z_j) / Σ (E_j h_j/(1-ν_j))

**Stress at layer i**:
σ_i = E_i/(1-ν_i) (α_eff - α_i) ΔT
α_eff = Σ (E_j/(1-ν_j) h_j α_j) / Σ (E_j/(1-ν_j) h_j)

#### 10.8.4 Delamination and Fracture Mechanics

**Energy release rate** (mode I, opening):
G_I = K_I² / E'
K_I = σ √(πa) (edge crack)
E' = E/(1-ν²)

**Energy release rate** (mode II, shear):
G_II = K_II² / E'
K_II = τ √(πa)

**Interfacial fracture toughness**:
- SiO₂/Si: G_c ≈ 10-20 J/m²
- SiO₂/SiO₂ (bonded): G_c ≈ 5-15 J/m²
- Cu/SiO₂: G_c ≈ 5-10 J/m²
- Polymer/Si: G_c ≈ 1-5 J/m²

**Critical stress for delamination**:
σ_crit = √(G_c E' / (πa))
For a = 1 mm, G_c = 10 J/m², E' = 100 GPa:
σ_crit ≈ 180 MPa

#### 10.8.5 Stress-Induced Device Performance Degradation

**Laser threshold current**:
ΔJ_th/J_th = π_ε σ (piezoelectric coefficient)
InGaAsP: π_ε ≈ 10⁻¹⁰ Pa⁻¹
σ = 100 MPa → ΔJ_th/J_th ≈ 10%

**Modulator V_π shift**:
ΔV_π/V_π = p_ε σ (photoelastic coefficient)
Si: p_ε ≈ 10⁻¹² Pa⁻¹
σ = 100 MPa → ΔV_π/V_π ≈ 0.1%

**Waveguide loss increase**:
Δα = C_σ σ
C_σ ≈ 0.01 dB/cm/MPa (Si)
σ = 100 MPa → Δα ≈ 1 dB/cm

**Detector dark current**:
J_dark ∝ exp(-E_g/kT) × exp(σ/σ_0)
Stress reduces effective bandgap

#### 10.8.6 Stress Mitigation Strategies

**Material selection**:
- CTE-matched dielectrics (SiCN, SiC)
- Low-CTE polymers (BCB, PI with fillers)
- Compliant layers (porous SiO₂, polymers)

**Geometry optimization**:
- Symmetric stacks (balanced moments)
- Thinner films (σ ∝ h_f)
- Stress relief trenches/slots
- Rounded corners (stress concentration factor)

**Process optimization**:
- Lower temperature (ΔT reduction)
- Slower ramp rates (stress relaxation)
- Symmetric heating/cooling
- Stress-relief anneals

**Structural design**:
- Stress relief slots in films
- Compliant buffer layers
- Mesh/grid patterns instead of solid films
- Slotted metal lines

#### 10.8.6 Stress Simulation and Analysis

**Finite Element Analysis (FEA)**:
- 3D thermomechanical simulation
- Temperature-dependent material properties
- Nonlinear geometry (large deformation)
- Contact mechanics (delamination)

**Key outputs**:
- Stress distribution (von Mises, principal)
- Wafer bow/warpage
- Interfacial shear/normal stress
- Critical delamination sites

**Simulation tools**:
- ANSYS, COMSOL, ABAQUS
- Custom TCAD (Sentaurus, Silvaco)
- In-house codes

**Validation**:
- Wafer curvature measurement
- Raman stress mapping
- XRD stress measurement
- Moiré interferometry

#### 10.8.7 CTE Mismatch in Specific Integration Scenarios

**III-V on Si (direct epitaxy)**:
- Large Δα (InP: 1.9, GaAs: 3.1 ppm/°C)
- Cool-down from 600°C: high tensile stress
- Cracking in thick films (> h_c)

**Wafer bonding (III-V on SiO₂/Si)**:
- Bond at 300°C, cool to RT: ΔT = 300°C
- III-V/oxide: moderate stress
- Oxide/Si: low stress (matched)

**Hybrid bonding (Cu-Cu + oxide)**:
- Cu/oxide: Δα = 14 ppm/°C
- ΔT = 200°C (anneal): σ_Cu ≈ 500 MPa
- Stress relaxation via Cu creep

**μTP (III-V on Si)**:
- Small devices: stress relaxed at edges
- Adhesive layer: stress buffer
- Minimal wafer-level bow

**3D stacking (multiple tiers)**:
- Cumulative stress
- TSV stress adds to CTE stress
- Design for stress balance per tier

#### 10.8.8 Advanced Stress Management

**Graded CTE layers**:
- Compositionally graded SiGe, SiCN
- Continuous CTE transition
- Eliminates sharp stress interfaces

**Compliant substrates**:
- Porous Si (CTE tunable 1-10 ppm/°C)
- Engineered compliance
- Absorbs CTE mismatch strain

**Active stress control**:
- Piezoelectric actuators
- Thermal actuators (MEMS)
- Real-time stress compensation

**Self-assembled stress relief**:
- Nanopatterned surfaces
- Self-organized dislocation networks
- Bio-inspired hierarchical structures

#### 10.8.9 Experimental Stress Characterization

**Raman spectroscopy**:
- Si: 520 cm⁻¹ peak shift
- Δω = -2.3 cm⁻¹/GPa (hydrostatic)
- Shear stress: peak splitting

**XRD (X-ray diffraction)**:
- sin²ψ method
- Lattice parameter change
- Stress tensor determination

**Wafer curvature**:
- Laser scanning (Tencor, KLA)
- Multi-point measurement
- Thermal cycling in situ

**Moiré interferometry**:
- Full-field displacement
- Sub-nm resolution
- Thermal cycling capability

**Photoelasticity**:
- Birefringence measurement
- Stress-optic coefficient
- Full-field stress map

#### 10.8.10 Future: Zero-CTE Integration and Smart Stress Management

**Zero-CTE composites**:
- SiC/Si, C/SiC composites
- Tailored CTE = 2.6 ppm/°C (match Si)
- Near-zero thermal stress

**Negative CTE materials**:
- ZrW₂O₈ (CTE = -9 ppm/°C)
- Composites with tailored CTE
- Zero net expansion

**Smart stress management**:
- Embedded sensors (FBG, piezoresistive)
- AI-driven stress prediction
- Active compensation (piezo, thermal)

**Self-healing interfaces**:
- Reversible bonds (Diels-Alder)
- Microcapsules with healing agent
- Autonomous crack repair

**Quantum-limited stress sensing**:
- NV centers in diamond
- Nanoscale stress imaging
- Quantum-enhanced metrology

---

*End of Piece 8. Next: Piece 9 - Wafer-Scale Integration: 300mm Si Photonics Foundry Flow*