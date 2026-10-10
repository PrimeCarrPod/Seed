# 13.6 Mathematical Notation Standards

All mathematical content follows these conventions:

### 13.6.1 Formula Representation
- **Inline**: `$E = mc^2$` or `σ = E·ε`
- **Block**: 
  ```
  σ_y = σ_0 + K·ε_p^n
  where:
    σ_y = yield stress
    σ_0 = initial yield stress
    K = strength coefficient
    ε_p = plastic strain
    n = strain hardening exponent
  ```

### 13.6.2 Tensor Notation
- **Scalars**: italic (σ, E, ν)
- **Vectors**: bold lowercase (σ, ε)
- **2nd-order tensors**: bold uppercase (C, S, ε)
- **4th-order tensors**: blackboard bold (ℂ, ℙ)
- **Indices**: Einstein summation convention

### 13.6.3 Unit System
- **SI Base**: m, kg, s, A, K, mol, cd
- **Derived**: Pa (N/m²), J (N·m), W (J/s), Hz (1/s)
- **Prefixes**: k (10³), M (10⁶), G (10⁹), m (10⁻³), μ (10⁻⁶), n (10⁻⁹)
- **Consistent**: All formulas dimensionally consistent

### 13.6.4 Special Symbols
- **Poisson's ratio**: ν (nu)
- **Young's modulus**: E
- **Shear modulus**: G
- **Stress**: σ (sigma)
- **Strain**: ε (epsilon)
- **Permeability**: μ (mu)
- **Permittivity**: ε (epsilon) — context distinguishes from strain
- **Wavelength**: λ (lambda)
- **Thermal conductivity**: k or λ
- **Density**: ρ (rho)

## 13.7 Terminology Glossary

| Term | Definition | Source |
|------|------------|--------|
| **Aegis** | Greek αἰγίς — protective shield of Zeus/Athena | Project naming |
| **AIMES** | Aegis Iron Man Adaptive Exosuit | CSMFAB078 |
| **Alcega** | Juan de Alcega, 1589 Libro de Geometría | Research Doc 1 |
| **Auxetic** | Negative Poisson's ratio (expands transversely when stretched) | Research Doc 1 |
| **Baleen** | Keratinous plates from baleen whales, historical corset boning | Research Doc 1 |
| **BFRP** | Basalt Fiber Reinforced Polymer | CSMFAB078 |
| **Cartridge Pleating** | S-curve volumetric compression, perpendicular force alignment | Research Doc 1 |
| **CIETA** | Centre International d'Etude des Textiles Anciens | Research Doc 1 |
| **CoAl₂O₄** | Cobalt aluminate spinel, Schumann resonance absorber | CSMFAB078 |
| **Convolute Surface** | Developable surface from two directrix curves | Research Doc 1 |
| **Core-Spun** | Composite thread: synthetic core + natural sheath | Research Doc 2 |
| **Degumming** | Sericin removal from silk via alkaline hydrolysis | Research Doc 1 |
| **Dyneema SK99** | UHMWPE fiber, 4250 MPa tensile strength | CSMFAB078-A |
| **Elium®** | Thermoplastic acrylic resin (Arkema) | CSMFAB078 |
| **FSS** | Frequency Selective Surface | CSMFAB078 |
| **Garsault** | François-Alexandre de Garsault, 1769 L'Art du Tailleur | Research Doc 1 |
| **GIC** | Geomagnetically Induced Current | CSMFAB078-B |
| **Guillotine Cutting** | Rectangular partitioning for zero-waste nesting | DRAFT-05 |
| **Hooke's Law (Orthotropic)** | σ = ℂ:ε with full stiffness tensor | Research Doc 1 |
| **LES** | Leaf Edition System (AIMES morphology adaptation) | CSMFAB078-A |
| **Lockstitch** | ISO 301, needle + bobbin thread interlock | Research Doc 2 |
| **MR Fluid** | Magnetorheological fluid, field-activated viscosity change | CSMFAB078 |
| **MXene** | Ti₃C₂Tₓ, 2D transition metal carbide, EMI shielding | CSMFAB078 |
| **Osculating Circle** | Circle with zero curvature matching curve at point | Research Doc 1 |
| **Phoenix Protocol** | Circular economy material recovery system | CSMFAB078 |
| **Poisson's Ratio** | ν = -ε_transverse/ε_longitudinal | Research Doc 1 |
| **PVOH** | Polyvinyl Alcohol, water-soluble stiffening agent | Research Doc 2 |
| **PVDF-TrFE** | Piezoelectric copolymer, bio-acoustic sensing | CSMFAB078 |
| **QD** | Quantum Dots (CsPbBr₃), tunable absorption/fluorescence | CSMFAB078 |
| **RenaissanceMan** | Male variant of Aegis Renaissance outfit | Project naming |
| **RenaissanceWoMan** | Female variant of Aegis Renaissance outfit | Project naming |
| **Schumann Resonance** | Earth-ionosphere cavity resonance, 7.83 Hz fundamental | CSMFAB078 |
| **SE** | Shielding Effectiveness (dB) | CSMFAB078-B |
| **Sewbo** | PVOH-based robotic fabric handling protocol | Research Doc 2 |
| **Sierpiński G3** | Fractal iteration 3, bandstop substrate | CSMFAB078 |
| **SPI** | Stitches Per Inch | Research Doc 1/2 |
| **STF** | Shear-Thickening Fluid (SiO₂-PEG) | CSMFAB078 / Research Doc 2 |
| **TFP** | Tailored Fiber Placement (CNC embroidery) | Research Doc 2 |
| **UHTC** | Ultra-High Temperature Ceramic (ZrB₂-SiC) | CSMFAB078 |
| **Watteau Back** | Double box pleats descending from neckline (robe à la française) | Research Doc 1 |
| **YInMn Blue** | Yttrium Indium Manganese oxide, NIR-reflective pigment | CSMFAB078 |
| **ZrB₂-SiC** | Zirconium diboride - silicon carbide ceramic composite | CSMFAB078 |

## 13.8 Standards Cross-Reference

| Standard | Domain | Application in Project |
|----------|--------|------------------------|
| **ISO 4915** | Stitch classification | Historical ↔ Modern stitch mapping |
| **ASTM D1683** | Seam strength testing | Historical seam validation |
| **ASTM D6193** | Stitch standard practices | Stitch specification |
| **ASTM E9** | Compression testing | Auxetic metamaterial testing |
| **ASTM E119** | Fire tests of building materials | Thermal protection validation |
| **ASTM F739** | Permeation resistance | Chemical protection testing |
| **ASTM F1939** | Radiant protective performance | Thermal protection (TPP) |
| **ASTM F1959** | Arc flash testing | Electrical protection (ATPV) |
| **NIJ STD-0101.06** | Ballistic resistance | NIJ Level IV validation |
| **NIJ Appendix C** | Blunt trauma testing | Force trauma validation |
| **NFPA 1971** | Structural firefighting ensemble | Thermal/fire protection |
| **NFPA 70E** | Electrical safety in workplace | Arc flash protection |
| **MIL-STD-461G** | EMI/EMC requirements | RE102 radiated emissions |
| **MIL-STD-810H** | Environmental engineering | 507.6 blast, thermal, humidity |
| **IEC 61000-4-9** | Pulse magnetic field immunity | GIC protection testing |
| **IEC 60950** | IT equipment safety | Dielectric isolation |
| **IEEE 1313** | GIC waveform standards | Carrington-class threat model |
| **ANSI Z136.1** | Laser safety | Optical density validation |
| **ISO 17493** | Clothing heat resistance | Thermal protection testing |
| **ISO 5660** | Cone calorimeter | Heat release rate testing |

## 13.9 Material Property Quick Reference

| Material | Density | Young's Modulus | Tensile Strength | Thermal Cond. | Key Property |
|----------|---------|-----------------|------------------|---------------|--------------|
| Degummed Silk | 1.3 g/cm³ | 8-12 GPa | 500-700 MPa | 0.04 W/m·K | Elasto-plastic |
| Baleen (hydrated) | 1.3 g/cm³ | 2-6 GPa | 100-200 MPa | 0.2 W/m·K | Thermoplastic 60°C |
| Spiral Steel (17-7 PH) | 7.8 g/cm³ | 200 GPa | 1000-1300 MPa | 16 W/m·K | 2D flexible |
| ZrB₂-SiC | 5.6 g/cm³ | 450 GPa | 590 MPa (flex) | 65 W/m·K | UHTC, Hv 22-23 GPa |
| BFRP/Elium® | 2.1 g/cm³ | 60 GPa | 1000 MPa | 0.5 W/m·K | Dielectric >10¹² Ω·m |
| MXene Ti₃C₂Tₓ | ~2.5 g/cm³ | ~300 GPa (in-plane) | ~1 GPa | ~50 W/m·K | SE 92 dB @ 1GHz |
| Aerogel (PI-Silica) | 0.1 g/cm³ | 0.01 GPa | 0.5 MPa | 0.010 W/m·K | λ=0.010 W/m·K |
| MR Fluid (LORD 140CG) | 3.0 g/cm³ | N/A | Yield 80 kPa | 0.15 W/m·K | η: 0.28→85 Pa·s |
| STF (SiO₂-PEG) | 1.2 g/cm³ | N/A | N/A | 0.2 W/m·K | η: 0.8→85 Pa·s |
| YInMn Blue | 4.5 g/cm³ | 150 GPa | N/A | 5 W/m·K | NIR reflectance 85-92% |
| CoAl₂O₄ Spinel | 4.8 g/cm³ | 200 GPa | N/A | 10 W/m·K | Schumann absorption |
| Dyneema SK99 | 0.97 g/cm³ | 120 GPa | 4250 MPa | 0.5 W/m·K | UV resistant |
| Ti₃AlC₂ MAX | 4.2 g/cm³ | 280 GPa | 400 MPa | 25 W/m·K | Machinable ceramic |

---

*End of README.md — Complete Project Documentation*
*All sections covered: Vision, History, Technology, Architecture, Pipeline, Framework, Research, Variants, Quality, GitHub, Sessions, Roadmap, Appendices*
*Ready for 13-piece split, zip, GitHub push, and verification*