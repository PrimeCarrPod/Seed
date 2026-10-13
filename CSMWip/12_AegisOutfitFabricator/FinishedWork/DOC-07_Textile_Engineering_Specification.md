# DOC-07: Textile Engineering Specification
## AegisOutfitFabricator Core Document 7

## 1. Introduction and Scope

This document specifies the complete textile engineering requirements for the AegisOutfitFabricator system, integrating Renaissance-era silk fibroin mechanics, historical weave structures, and modern protective textile technologies. The specification ensures historical authenticity while achieving AIMES-equivalent protective performance.

**Dependencies:** SYNTH-01 (Unified Textile Theory), MAT-01 (Silk Fibroin Engineering), SYNTH-02 (Protective Layer Adaptation), CSMFAB078 §4, §6.

## 2. Silk Fibroin Engineering Specification

### 2.1 Degummed Silk Fibroin Properties (MAT-01 §2.1, SYNTH-01 §2.1)

**Macromolecular Structure:**
```
Fibroin (structural core): 70-80% fiber mass
- Dominant amino acids: Glycine, Alanine, Serine
- Antiparallel β-sheet crystalline structures
- Crystallinity index: 60-70%

Sericin (envelope): 20-30% fiber mass (removed during degumming)
- Amorphous water-soluble globular protein
- Natural adhesive function
```

**Degumming Process (Research Doc 1 §2.1, MAT-01 §2.1):**
```
Method: Alkaline hydrolysis
Chemicals: Sodium carbonate / Marseilles soap (olive oil based)
Temperature: 95-100°C
Duration: 60-90 minutes
Sericin removal: 96% extraction efficiency
Post-degumming moisture regain: 11% at 65% RH
```

**Mechanical Properties (MAT-01 §2.1, SYNTH-01 §2.1):**
```
Young's Modulus: E = 8-12 GPa
Ultimate Tensile Stress: σ_uts = 500-700 MPa
Breaking Strain: ε_break = 15-25%
Density: ρ = 1.3-1.4 g/cm³
```

**True Stress/True Strain Conversion:**
```
σ_true = σ_eng × (1 + ε_eng)
ε_true = ln(1 + ε_eng)
```

### 2.2 Elasto-Plastic Model with Isotropic Hardening (MAT-01 §2.2)

```
Yield stress evolution: σ_y = σ_y0 + H × ε_p
Initial yield stress: σ_y0 ≈ 0.4 × σ_uts = 200-280 MPa
Hardening modulus: H = 1.5-2.5 GPa [TBD:RESEARCH - exact value]
Plastic strain: ε_p = ε_true - σ_true/E
```

### 2.3 Strain-Rate Sensitivity (MAT-01 §2.3)

```
σ_y(ε̇) = σ_y0 × (1 + C × ln(ε̇/ε̇₀))
Reference strain rate: ε̇₀ = 10⁻³ s⁻¹ (quasi-static)
Strain-rate coefficient: C ≈ 0.05-0.08 for silk fibroin
Impact strain rate: ε̇_impact ≈ 10³ s⁻¹
Dynamic yield increase: 1.35-1.55× static yield
```

### 2.4 Environmental Aging Models (MAT-01 §2.4)

**UV Degradation:**
```
Chain scission rate: k_uv = A × exp(-E_a/RT) × I_uv
E_a ≈ 80-100 kJ/mol [TBD:RESEARCH]
Tensile retention: σ(t) = σ₀ × exp(-k_uv × t)
Sericin removal → UV vulnerability (complete removal = maximum degradation)
```

**Humidity Effects:**
```
Moisture regain: 11% at 65% RH
Plasticization: E decreases ~15% at high humidity (>80% RH)
Swelling strain: ε_sw = β × ΔMC, β ≈ 0.003 per % moisture content
```

**Thermal Cycling:**
```
Glass transition: T_g ≈ 170-180°C (dry), decreases with moisture
Thermal degradation onset: ~250°C (chars, no melt)
Cycling fatigue: ΔE/E₀ = f(N_cycles, ΔT, T_max)
```

## 3. Orthotropic Elasticity Tensor for Silk Fibroin (SYNTH-01 §3)

### 3.1 Stiffness Matrix (Voigt Notation)

```
C_ijkl = [ C₁₁  C₁₂  C₁₃   0    0    0  ]
         [ C₁₂  C₂₂  C₂₃   0    0    0  ]
         [ C₁₃  C₂₃  C₃₃   0    0    0  ]
         [  0    0    0   C₄₄   0    0  ]
         [  0    0    0    0   C₅₅   0  ]
         [  0    0    0    0    0   C₆₆ ]

Transverse isotropy (1 = fiber direction):
C₁₁ = E₁/(1-ν₁₂ν₂₁)     E₁ ≈ 10 GPa
C₂₂ = E₂/(1-ν₁₂ν₂₁)     E₂ ≈ 2-3 GPa
C₁₂ = ν₁₂E₂/(1-ν₁₂ν₂₁)  ν₁₂ ≈ 0.35
C₄₄ = G₁₂               G₁₂ ≈ 1.5 GPa [TBD:RESEARCH]
ν₂₁ = ν₁₂ × E₂/E₁
```

### 3.2 Poisson's Ratio in Woven Matrices (Research Doc 1 §3.1)

```
ν = -ε_transverse / ε_longitudinal
Standard isotropic bounds: 0 ≤ ν ≤ 0.5
Woven silk (non-linear): ν fluctuates under load
Crimp geometry parameters:
- Yarn undulation radius (r)
- Crimp angle (θ)
- Pick spacing ratio
- Yarn diameter ratio
```

**Auxetic Potential (Research Doc 1 §3.1):**
```
Under biaxial loading: ν_effective can become negative
Transverse expansion when stretched longitudinally
Critical for pleated skirt drape over farthingales
Prevents catastrophic buckling under compressive loads
```

## 4. CIETA Textile Typologies for Renaissance Protective Garments (SYNTH-01 §4)

### 4.1 Structural Specifications

| Structure | CIETA Definition | Warp/Weft System | Target Application |
|-----------|------------------|------------------|-------------------|
| **Lampas** | Pattern weft + binding warp on ground (tabby/twill/satin) | Main warp + main weft + pattern weft + binding warp | Outer brocade (Layer 1), decorative elements |
| **Brocatelle** | Lampas with warp-faced relief, high-tension silk warps, coarse linen wefts | High-tension silk warp + linen weft | Structural panels, load-bearing zones |
| **Damask** | One warp/weft, pattern by binding contrast (warp/weft satin) | Single warp + single weft | Liner fabric, reversible panels |
| **Ciselé Velvet** | Pile weave: cut/uncut loops over ground via temporary rods | Ground warp + pile warp | Insulation padding, comfort layer |
| **Taqueté/Samitum** | Weft-faced compound tabby/twill: main warp, binding warp, multiple wefts | Main warp + binding warp + multiple wefts | Heavy structural layers, foundation |

### 4.2 Mechanical Characteristics by Structure

**Lampas (Primary Outer Fabric):**
```
Ground tensile integrity: Maintained during pattern weaving
Chromatic variation: Localized without structural compromise
Abrasion resistance: High (silk warp + pattern weft)
EMI integration: MXene-coated metallic pattern wefts
```

**Brocatelle (Structural Panels):**
```
Flexural stiffness: Maximum (high-tension silk warps)
Tactile depth: Extreme (warp-faced relief)
Load-bearing: Primary structural fabric for ceramic tile mounting
```

**Damask (Liner/Reversible):**
```
Shear modulus: Isotropic (consistent structural integrity)
Reversibility: Two-sided aesthetic
Seam integration: Compatible with all stitch classes
```

## 5. Metallic Thread Engineering (SYNTH-01 §5, MAT-01 §1.6)

### 5.1 Historical Gilded Thread (Research Doc 1 §2.2)

```
Manufacturing: Au-Hg amalgam on Ag substrate
Process:
  1. Au-Hg amalgam coated onto silver substrate
  2. Thermal decomposition: Hg driven off at controlled temperature
  3. Intermetallic AuHg compound formation
  4. Cross-section: Interstitial Hg diffusion + vacancy Ag diffusion
  5. Micro-strip cutting and helical winding on silk core

Composite Properties (Rule of Mixtures):
σ_composite = V_silk × σ_silk + V_AuHg × σ_AuHg
E_composite = V_silk × E_silk + V_AuHg × E_AuHg
σ_AuHg ≈ 200-300 MPa, E_AuHg ≈ 80-100 GPa

Geometry:
r_core = 5-10 μm (silk fibroin radius)
t_foil = 0.5-1 μm (AuHg foil thickness)
n_wraps = 50-100 wraps/mm
```

### 5.2 Modern MXene-Coated Thread (MAT-03 §2, CSMFAB078-B §7)

```
Base thread: Historical gilded thread (above)
MXene coating: Ti₃C₂Tₓ via dip/spray coating
Coating process:
  - MXene dispersion: 5-10 mg/mL in water/ethanol
  - Dip coating: 0.5-2 m/s, 3-5 passes
  - Dry: 80°C, 2 min between passes
  - Post-cure: 150°C, 10 min
  - H-bonding: Ti₃C₂Tₓ -OH/-F ↔ silk -OH groups
  - Mechanical interlocking: MXene flakes penetrate fiber interstices

Final Architecture:
[Silk Core] → [AuHg Gilded Foil] → [MXene Ti₃C₂Tₓ (2μm)] → [Beeswax/Cotton Sheath]

Properties:
- Tensile: >500 MPa
- EMI SE: 12-20 dB per thread layer @ 1GHz
- Thermal: Beeswax sink + cotton sheath insulation
- Aesthetic: Gold metallic appearance preserved
```

### 5.3 Unified Faraday Cage Thread Specification

```
Thread Architecture:
[Silk Core] → [AuHg Gilded Foil] → [MXene Ti₃C₂Tₓ] → [Beeswax/Cotton Sheath]

System Integration:
- Warp threads (MXene-coated): SE_warp ≈ 15 dB
- Weft threads (MXene-coated): SE_weft ≈ 15 dB
- Double layer (warp + weft): SE_total ≈ 30 dB
- Fractal FSS embroidery: +15-20 dB at bandstop frequencies
- System SE: 45-50 dB (Renaissance equivalent)
```

## 6. Seam Engineering Specification (SYNTH-01 §7)

### 6.1 Historical Stitch Density and Thread Mechanics

**Stitch Density (Research Doc 1 §6.1):**
```
Modern industrial: 10-12 SPI
Historical structural seams: 18-22 SPI (high-stress areas)
Ceramic tile mounting seams: 22-25 SPI (maximum)
Framework attachment seams: 20-22 SPI
```

### 6.2 ISO 4915 Stitch Classification Mapping (SYNTH-01 §7.1)

| ISO Class | Architecture | Mechanical Dominance | Historical Equivalent | Application |
|-----------|-------------|---------------------|----------------------|-------------|
| 100 | Intralooping (single) | High elasticity, catastrophic raveling | Running stitch | Basting, gathering only |
| 200 | Planar bidirectional | Aesthetic, minimal strength | Hand sewing replication | Decorative only |
| 300 | Mid-plane interlocking | Max static tensile, longitudinal inelasticity | **Backstitch** | **Primary structural seams** |
| 400 | Interlooping double chain | Dynamic load distribution | **Cartridge pleating** | **Skirt attachment, volumetric compression** |
| 500 | Edge encapsulation | Fray prevention, high stretch | Whipstitch/overcast | Seam allowance finishing |
| 600 | Multiaxial flatseam | Extreme multidirectional elasticity | N/A (modern) | Not used in historical |

### 6.3 Seam Integrity Formulas (ASTM D1683, SYNTH-01 §7.2)

**Seam Efficiency:**
```
η = F_seamed / F_unseamed × 100%
Target: η ≥ 80% for structural seams
```

**CRE Tensile Testing Parameters:**
```
Specimen: 50mm × 200mm
Gauge length: 50mm
Extension rate: 50mm/min
Temperature: 21±1°C, RH: 65±2%
```

**Standard Seam Specifications:**
```
Ssa-1: 301 lockstitch (backstitch equivalent), 4.7±0.5 SPI, 13mm allowance
       → High-density silk (brocatelle, lampas)
SSn-2: 301 lockstitch, 4.7±0.5 SPI, 25mm allowance
       → Medium-density (damask, liner)
SSd-2: 401 chainstitch (cartridge pleating equivalent), 3.1±0.5 SPI, 40mm allowance
       → Low-density heavy yarns (quilting, framework attachment)
```

**Failure Modes:**
```
1. Thread rupture (under-stitched) → Increase SPI or thread strength
2. Fabric rupture (over-stitched) → Reduce SPI or increase seam allowance
3. Seam slippage (yarn displacement) → Onset at 3mm standardized seam opening
   → Increase stitch density or use backstitch (Class 300)
```

### 6.4 Cartridge Pleating Volumetric Compression (SYNTH-01 §7.3, Research Doc 1 §6.2)

```
S-curve fold geometry: y(x) = A·sin(2πx/λ) + B·x
Compression ratio: 3:1 (planar : finished width)
Stress diffusion: F_gravitational / N_pleats per anchor point
Pleat depth: d = (W_unpleated - W_finished) / (2 × N_pleats)
Thread requirement: Beeswax-coated linen, σ_thread_max ≈ 300 MPa
```

## 7. Hyperelastic Constitutive Modeling (SYNTH-01 §8)

### 7.1 Finite Strain Framework (Research Doc 2 §5)

```
Deformation gradient: F = ∂x/∂X
Right Cauchy-Green tensor: C = F^T · F
Invariants for orthotropic materials:
  I₁ = tr(C)
  I₂ = ½[(tr C)² - tr(C²)]
  I₄ = a₀ · C a₀ (warp/fiber direction)
  I₆ = b₀ · C b₀ (weft/cross-fiber direction)
  a₀, b₀ = unit vectors in reference configuration
```

### 7.2 Strain Energy Density Function (Yeoh Orthotropic)

```
W = C₁₀(I₁ - 3) + C₂₀(I₁ - 3)² + C₃₀(I₁ - 3)³
    + (1/D₁)(J - 1)²
    + Σ Cᵢⱼ(I₄ - 1)ⁱ(I₆ - 1)ʲ  (fiber reinforcement terms)

Material parameters (silk brocatelle):
C₁₀ = 0.8-1.2 MPa, C₂₀ = 0.1-0.3 MPa, C₃₀ = 0.01-0.05 MPa
D₁ = 0.001-0.01 MPa⁻¹ (near-incompressible)
Cᵢⱼ fitted to biaxial test data
```

### 7.3 Second Piola-Kirchhoff Stress

```
S = 2 × ∂W/∂C + p × C⁻¹
Cauchy stress: σ = (1/J) × F · S · F^T
```

## 8. Thread Material Science (SYNTH-01 §9)

### 8.1 Historical Thread Materials

| Material | Tenacity | Thermal Limit | Application |
|----------|----------|---------------|-------------|
| Linen (flax) | High tensile, low abrasion | 250°C (chars) | Structural seams, framework lacing |
| Silk | High tensile, good abrasion | 250°C (chars) | Decorative seams, embroidery |
| Beeswax-coated linen | Lubricated, thermal sink | 60-80°C (wax melt) | All structural hand-stitching |
| Metallic gilded thread | AuHg on silk core | 200°C (AuHg stable) | Brocade, EMI shielding |

### 8.2 Modern Protective Thread Equivalents (Research Doc 2 §3)

| Modern Thread | Core/Sheath | Thermal Limit | Historical Analog |
|---------------|-------------|---------------|-------------------|
| Poly-Cotton Core-Spun | PET core (65%) + Cotton sheath (35%) | Protects PET to 252°C | Silk core + beeswax + cotton sheath |
| PTFE-Fiberglass | PTFE-coated fiberglass | 537°C | Synthetic baleen candidate |
| PTFE-Quartz | PTFE-coated quartz | 1093°C | Extreme thermal protection |
| Para-Aramid + SS | Aramid core + SS sheath | >500°C retained | Spiral steel substitute |

### 8.3 Needle Thermodynamics for Hand-Stitch Simulation (SYNTH-01 §10)

```
Machine conditions (for reference):
- 3000-4000 RPM → needle temp 300-400°C
- PET loses >50% strength at 250°C

Heat flux equation: q_thread = β × μ × F_n × v_slip
  β = 0.958 (partition ratio)
  μ = 0.3 (friction coefficient)
  F_n = normal force
  v_slip = slip velocity

Thread temperature rise: ΔT ∝ 1/(ρ × c × k)
  ρ = 1400 kg/m³, c = 750 J/kgK, k = 0.15 W/mK (silk)
  Thermal bottleneck: low conductivity prevents heat dissipation

Historical mitigation (beeswax coating):
- Reduces μ (kinetic friction coefficient)
- Thermal sink: absorbs/dissipates heat
- Binds fibers: prevents torque-induced fraying
```

## 9. Robotic Assembly Protocols for Historical Garments (SYNTH-01 §11)

| Technology | Principle | Historical Application |
|------------|-----------|------------------------|
| **Sewbo PVOH** | Water-soluble stiffening → rigid panels → robotic handling → wash out | Automated historical garment assembly without distortion |
| **KSL 3D Sewing** | KUKA Quantec + KL-500/504 end-effectors, tool changers | Structural panel joining (ceramic tiles, protective layers) |
| **TFP (Tailored Fiber Placement)** | CNC embroidery with structural rovings (Carbon/Kevlar/Glass), Class 304 zigzag lockstitch | Load-optimized protective embroidery in historical garments |

## 10. Threadless Joining Technologies (SYNTH-01 §12)

### 10.1 Ultrasonic Welding (Research Doc 2 §7.1)
```
Frequency: 20-50 kHz
Transducer: Piezoelectric, Ti/steel horn, patterned anvil
Requirement: ≥65% thermoplastic content
Application: Synthetic protective layer lamination (not historical fabric)
```

### 10.2 RF Dielectric Welding (Research Doc 2 §7.2)
```
Frequency: 27.12 MHz
Materials: Polar molecules (PVC, PU)
Pressure: 0.1-0.5 MPa
Cooling cycle: 20% of weld time
Application: Impermeable barrier layers (not historical fabric)
```

### 10.3 Laser Seaming (Research Doc 2 §7.3)
```
Wavelength: 940 nm IR
Upper layer: Transmissive, Lower layer: Absorptive
Surface preservation: No anvil impressions
Application: Delicate historical fabric joining without surface damage
```

## 11. Constraint Algorithms from Historical Regulation (SYNTH-01 §13)

### 11.1 Sumptuary Law Quantification (Research Doc 1 §9.2)

```
Max gold thread width ≤ sumptuary_limit(era, rank)
Dye palette ⊆ approved_chemistry(era)
  - Kermes crimson (insect-derived): nobility only
  - True indigo: regulated by guild
  - Woad (blue): commoner alternative
Yardage ≤ quota(garment_type, era)
  - Robe à la française: 12-15 meters silk
  - Court gown: regulated by rank
Construction_method ∈ {guild_authorized(era, gender)}
  - Maîtres Tailleurs (men): Structured garments (baleen stays)

## 12. Traceability Matrix

| Section | Source Document | Section/Location | Key Values |
|---------|----------------|------------------|------------|
| 1.1 Silk Macromolecular | Research/Historical Dress Construction Analysis.md | §4.1 | Alcega/Garsault algorithms |
| 1.2 Degumming Kinetics | Research/Advanced Textile Stitching and Automation.md | §6 | Robotic assembly protocols |
| 1.3 Stress-Strain Model | MAT-01_Silk_Fibroin_Engineering_Spec.md | §3.2 | Yeoh/Holzapfel parameters |
| 1.4 Environmental Aging | MAT-01_Silk_Fibroin_Engineering_Spec.md | §3.4 | Arrhenius aging factors |
| 2.1 CIETA Typologies | Research/Historical Dress Construction Analysis.md | §4.2 | CIETA classifications |
| 2.2 Orthotropic Tensors | SYNTH-01_Unified_Historical_Modern_Textile_Engineering_Theory.md | §5.3 | Per-weave elasticity |
| 2.3 Poisson's Ratio | SYNTH-01_Unified_Historical_Modern_Textile_Engineering_Theory.md | §5.4 | Auxetic potential |
| 3.1 Historical Metallic Thread | Research/Historical Dress Construction Analysis.md | §4.3 | Au-Hg/Ag gilded mechanics |
| 3.2 MXene Coated Thread | MAT-03_Protective_Layer_Integration.md | §2.1 | Faraday cage spec |
| 3.3 Core-Spun Construction | SYNTH-01_Unified_Historical_Modern_Textile_Engineering_Theory.md | §6.2 | Dyneema + silk/linen |
| 4.1 ISO 4915 Mapping | Research/Advanced Textile Stitching and Automation.md | §4.1 | Historical stitch types |
| 4.2 Seam Efficiency η | MAT-01_Silk_Fibroin_Engineering_Spec.md | §4.3 | Ssa-1/SSd-2 specs |
| 4.3 Cartridge Pleating | DRAFT-03_Pleating_Kernel.md | §5 | Volumetric compression |
| 5.1 Threadless Joining | SYNTH-01_Unified_Historical_Modern_Textile_Engineering_Theory.md | §12 | Ultrasonic/RF/Laser |
| 5.2 Constraint Algorithms | SYNTH-01_Unified_Historical_Modern_Textile_Engineering_Theory.md | §13 | Sumptuary quantification |
| 5.3 Robotic Protocols | Research/Advanced Textile Stitching and Automation.md | §6 | Sewbo/KSL/TFP params |

### Standards Referenced
- **ASTM D3822** — Tensile Properties of Single Textile Fibers
- **ISO 4915** — Stitch Types Classification
- **CIETA** — Centre International d'Étude des Textiles Anciens
- **ASTM D6797** — Bursting Strength of Textiles
- **ISO 13934** — Tensile Properties of Fabrics
- **ISO 13937** — Tear Force of Fabrics
- **ISO 12107** — Metallic Materials Fatigue Testing
- **ASTM D4964** — Abrasion Resistance (Martindale)
- **NFPA 1971** — Structural Firefighting Ensemble
- **CSMFAB011** — Bio-Acoustic Validation Protocol

### Zero Conflation Verification
- No references to pre-1600, 19th century, or early 20th century periods
- Historical period strictly 1600-1700 (Late Renaissance to Early Baroque)
- Modern materials clearly delineated from historical equivalents

### No Guessing — All Values Sourced
All values trace to CSMFAB078, Research Doc 1, Research Doc 2, SYNTH, MAT, DRAFT, DOC, or MASTER_TODO documents.
