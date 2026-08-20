# Document 10: Heterogeneous Integration and III-V/Silicon Epitaxy
## Piece 1: Lattice Mismatch Strain: InP (5.869Å) vs. Si (5.431Å) = 8.1%

---

### 10.1 Lattice Mismatch Strain: InP (5.869Å) vs. Si (5.431Å) = 8.1%

Heterogeneous integration of III-V compound semiconductors (InP, GaAs, InGaAs) onto silicon substrates is the central materials challenge for silicon photonics. The fundamental obstacle is the large lattice mismatch between III-V materials and silicon, which creates strain, defects, and performance degradation if not properly managed.

#### 10.1.1 Lattice Constants and Mismatch

**Crystal structures**:
- Silicon: Diamond cubic, a_Si = 5.431 Å (300K)
- InP: Zincblende, a_InP = 5.869 Å (300K)
- GaAs: Zincblende, a_GaAs = 5.653 Å (300K)
- InGaAs (x=0.53): a = 5.869 Å (lattice-matched to InP)

**Lattice mismatch** (InP on Si):
f = (a_InP - a_Si) / a_Si = (5.869 - 5.431) / 5.431 = 0.0806 = 8.06%

**Lattice mismatch** (GaAs on Si):
f = (a_GaAs - a_Si) / a_Si = (5.653 - 5.431) / 5.431 = 0.0409 = 4.09%

**Lattice mismatch** (InGaAs on Si):
Depends on composition x
For In_0.53Ga_0.47As: a = 5.869 Å → f = 8.06%

#### 10.1.2 Strain Energy and Critical Thickness

**Strain energy density** (per unit volume):
U_strain = ½ C_ijkl ε_ij ε_kl
For isotropic approximation:
U_strain = E ε² / (2(1-ν))
where E = Young's modulus, ν = Poisson's ratio

**For InP on Si** (biaxial strain):
ε_xx = ε_yy = f = 0.0806
ε_zz = -2ν/(1-ν) f (Poisson effect)
InP: E = 85 GPa, ν = 0.36
U_strain ≈ 0.5 J/m³ per unit strain²

**Critical thickness** (Matthews-Blakeslee):
h_c = b / (8πf) × (1+ν)/(1-ν) × ln(h_c/b + 1)
where b = Burgers vector magnitude
For 60° dislocation in InP: b = a/√2 = 4.15 Å

**Approximate solution**:
h_c ≈ b / (4πf) × (1-ν cos²α)/(1-ν) × ln(h_c/b)
For InP/Si (f=8%): h_c ≈ 2-5 nm

**Implication**: Coherent InP on Si limited to few nm!
Beyond h_c: misfit dislocations form

#### 10.1.3 Misfit Dislocation Formation

**Dislocation types**:
- 60° dislocation: b = a/2 ⟨110⟩, glide on {111}
- Lomer dislocation: b = a/2 ⟨100⟩, sessile
- Edge dislocation: b = a/2 ⟨110⟩, pure edge

**Misfit dislocation spacing**:
D = b / f
For InP/Si: D = 4.15 Å / 0.0806 ≈ 51 Å = 5.1 nm

**Threading dislocation density** (TDD):
ρ_TD ≈ 1/D² ≈ 4×10⁹ cm⁻² (for InP/Si)
For GaAs/Si: ρ_TD ≈ 1×10⁹ cm⁻²

**Impact on devices**:
- Non-radiative recombination (Shockley-Read-Hall)
- Carrier leakage
- Optical loss (scattering, absorption)
- Reduced laser efficiency, increased threshold

#### 10.1.4 Strain Engineering Approaches

**1. Compositionally graded buffers**:
Gradually change InGaAs composition
x from 0 (GaAs) to 0.53 (InGaAs)
Spread mismatch over μm thickness
Reduces TDD to 10⁶-10⁷ cm⁻²

**2. Superlattice buffers**:
Alternating layers (InGaAs/GaAs)
Strain balancing: compressive + tensile
Dislocation filtering at interfaces
TDD < 10⁶ cm⁻² achievable

**3. Aspect ratio trapping (ART)**:
Selective area epitaxy in trenches
Dislocations bend at sidewalls
Trap in trench, not in active region
TDD < 10⁴ cm⁻² in narrow trenches (< 1 μm)

**4. Compliant substrates**:
Porous Si, SiGe, or oxide layers
Absorb strain mechanically
Compliance: κ = δ/σ

**5. Direct wafer bonding**:
Separate growth, then bond
Avoids lattice mismatch during growth
Bonding interface quality critical

#### 10.1.5 Polarization and Piezoelectric Effects

**III-V materials** (zincblende): piezoelectric
Strain → polarization → electric fields
P_pz = e_14 ε_xy (shear strain)
e_14 (InP) = -0.045 C/m²

**Quantum well Stark effect**:
Built-in fields → QCSE
Reduces overlap integral
Shifts emission wavelength

**Silicon**: no piezoelectricity (centrosymmetric)
No strain-induced polarization

**Heterointerface polarization**:
Spontaneous polarization (wurtzite)
Piezoelectric polarization (zincblende)
Net polarization charge at interface

#### 10.1.6 Thermal Strain

**Coefficient of thermal expansion (CTE) mismatch**:
α_Si = 2.6×10⁻⁶ K⁻¹
α_InP = 4.5×10⁻⁶ K⁻¹
α_GaAs = 5.7×10⁻⁶ K⁻¹

**Thermal strain** (ΔT = 600°C growth → 25°C):
ε_th = (α_III-V - α_Si) ΔT
For InP/Si: ε_th ≈ 1.1×10⁻³ (0.11%)
Adds to lattice mismatch strain

**Wafer bow**:
Stoney equation: κ = 6(1-ν)ε_th h_f / h_s²
κ = curvature, h_f = film thickness, h_s = substrate thickness
Can cause cracking, delamination

**Mitigation**:
- Low-temperature growth
- CTE-matched interlayers
- Symmetric stack design

#### 10.1.7 Defect Characterization

**X-ray diffraction (XRD)**:
Rocking curve FWHM → dislocation density
ω-scan: (004) reflection
FWHM ≈ 20-100 arcsec (good)
FWHM > 200 arcsec (poor)

**Transmission electron microscopy (TEM)**:
Direct imaging of dislocations
Cross-section: threading dislocations
Plan-view: misfit dislocation network

**Etch pit density (EPD)**:
Molten KOH etch
Pits at dislocation sites
EPD ≈ TDD

**Cathodoluminescence (CL)**:
Non-radiative recombination at dislocations
Dark lines in CL map
Quantitative TDD mapping

#### 10.1.8 Impact on Photonic Devices

**Lasers**:
- TDD > 10⁶ cm⁻²: threshold increase
- TDD > 10⁷ cm⁻²: efficiency rollover
- TDD < 10⁵ cm⁻²: near-ideal performance

**Modulators**:
- Dislocations → absorption loss
- TDD < 10⁶ cm⁻² for < 1 dB/cm loss

**Detectors**:
- Dislocations → dark current
- TDD < 10⁶ cm⁻² for low dark current

**Waveguides**:
- Scattering loss: α_scatt ∝ TDD
- Target: < 0.1 dB/cm

#### 10.1.9 Advanced Defect Reduction Techniques

**Epitaxial lateral overgrowth (ELOG)**:
SiO₂ mask with windows
Growth lateral over mask
Dislocations bend, terminate at mask
TDD < 10⁴ cm⁻²

**Pendeo-epitaxy**:
Growth from mesa sidewalls
Similar to ELOG but no mask

**Dislocation filtering layers**:
InGaP, AlGaAs layers
Strain fields interact with dislocations
Filter efficiency > 90%

**In-situ annealing**:
High-temperature anneal during growth
Dislocation glide, annihilation
Requires careful thermal budget

#### 10.1.10 Future: 2D Material Buffers and Direct Growth

**2D material buffers** (graphene, hBN):
- van der Waals epitaxy
- No lattice matching required
- Atomically smooth, defect-free
- Transfer challenges

**Direct growth on Si (recent advances)**:
- GaAs on Si: TDD < 10⁶ cm⁻² (commercial)
- InP on Si: TDD < 10⁶ cm⁻² (lab)
- InGaAs on Si: TDD < 10⁶ cm⁻² (lab)
- Key: graded buffers, ART, low-temp nucleation

**Monolithic integration goal**:
All III-V devices on 300mm Si wafer
CMOS-compatible thermal budget (< 450°C)
High yield, low cost

---

*End of Piece 1. Next: Piece 2 - Critical Thickness: Matthews-Blakeslee Model for Dislocation Formation*