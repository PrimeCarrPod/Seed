
### Section 7: Corset/Crinoline Vector Mechanics (Lines 59-102)
**Extract to SYNTH-01 & SYNTH-02:**
- [ ] Baleen: keratinous, E = 2-6 GPa (hydrated), thermoplastic 60-80°C
- [ ] Euler critical load: P_cr = π²EI/L² for stay buckling prevention
- [ ] Hoop stress: lateral force transfer from constrained buckling
- [ ] Metal eyelets 1828: stress concentration factor K_t = 3 at hole edge
- [ ] Spiral steel boning: 2D bending, longitudinal rigidity
- [ ] Cage crinoline 1856: moment of inertia I = πr³t for hoops
- [ ] Volumetric expansion with minimal mass → load shift from iliac crest to steel matrix

### Section 8: Seam Mechanics & Stitching (Lines 79-124)
**Extract to SYNTH-01:**
- [ ] SPI historical: 18-22 in high-stress areas (vs 10-12 modern)
- [ ] Backstitch: 50% overlap → mimics lockstitch, max longitudinal shear resistance
- [ ] Linen thread: high tensile, low abrasion → beeswax coating
- [ ] Beeswax: reduces kinetic friction coefficient, binds fibers against torque fraying
- [ ] Cartridge pleating: S-curve folds, perpendicular to waistband, stress diffusion

### Section 9: Political Economy & Constraints (Lines 100-143)
**Extract to SYNTH-01 — Constraint Algorithms:**
- [ ] Colbert 1667: Lyon silk monopoly, standardized weaves/dyes/thread counts
- [ ] Sumptuary laws: quantified extravagance (gold width, dye chemistry, yardage)
- [ ] Loophole engineering: slashed sleeves = 2 garments technically
- [ ] Guild segregation: Maîtres Tailleurs (men, structured) vs Maîtresses Couturières (women, unstructured)
- [ ] **Algorithmic constraints** for fabrication system

---

## 📊 RESEARCH DOCUMENT 2 — EXTRACTION TEMPLATE
**Source:** `Research/Advanced Textile Stitching and Automation.md` (225+ lines)

### Section 1: ISO 4915 Stitch Classification (Lines 3-33)
**Extract to SYNTH-01 — Map to Historical:**
| ISO Class | Architecture | Mechanical Dominance | Historical Equivalent | Renaissance Application |
|-----------|-------------|---------------------|----------------------|------------------------|
| 100 | Intralooping (single) | High elasticity, catastrophic raveling | Running stitch | Basting, gathering |
| 200 | Planar bidirectional | Aesthetic, minimal strength | Hand sewing replication | Bespoke finishing |
| 300 | Mid-plane interlocking | Max static tensile, longitudinal inelasticity | **Backstitch** | **Primary structural seams** |
| 400 | Interlooping double chain | Dynamic load distribution | **Cartridge pleating tension** | **Skirt attachment, volumetric compression** |
| 500 | Edge encapsulation | Fray prevention, high stretch | Whipstitch/overcast | Seam allowance finishing |
| 600 | Multiaxial flatseam | Extreme multidirectional elasticity | N/A (modern) | Activewear equivalent |

### Section 2: Seam Integrity & ASTM D1683 (Lines 22-54)
**Extract to SYNTH-01 — Formulas:**
- [ ] Seam efficiency: η = F_seamed / F_unseamed × 100%
- [ ] CRE tensile testing: 50mm × 200mm specimens, 50mm gauge, 50mm/min extension
- [ ] Failure modes: Thread rupture (under-stitched), Fabric rupture (over-stitched), Seam slippage (yarn displacement)
- [ ] Slippage onset: 3mm standardized seam opening
- [ ] Standard seams: Ssa-1 (301 lockstitch, 4.7±0.5 SPI, 13mm allowance) for high-density
- [ ] SSd-2 (401 chainstitch, 3.1±0.5 SPI, 40mm allowance) for low-density heavy yarns

### Section 3: Thread Material Science (Lines 38-98)
**Extract to SYNTH-01 & SYNTH-02:**
- [ ] Pure cotton: low tenacity, no melt (chars 250°C), dye affinity only
- [ ] Pure PET/Polyester: HTY > 8 g/den, melt 252°C, needle heat vulnerability
- [ ] **Core-spun Poly-Cotton**: PET core (65% mass) + cotton sheath (38mm staple)
  - Core: tensile strength, modulus, dynamic load
  - Sheath: thermal insulation (needle heat), hydrophilic swelling → hydrostatic resistance
  - Manufacturing: Z-twist single → S-twist plied (prevents untwisting in needle)
- [ ] Extreme threads: PTFE-coated fiberglass (537°C), PTFE-quartz (1093°C), Para-aramid+SS (>500°C)

### Section 4: Needle Thermodynamics (Lines 74-118)
**Extract to SYNTH-01 — Hand-Stitch Simulation:**
- [ ] 3000-4000 RPM → needle 300-400°C
- [ ] PET loses >50% strength at 250°C
- [ ] Heat flux: q_thread = β × μ × F_n × v_slip (β=0.958 partition ratio)
- [ ] Thread temp rise: ΔT ∝ 1/(ρ·c·k) — low k (0.15 W/mK) = thermal bottleneck
- [ ] Mitigation: silicone/mineral oil lubricants (hydrodynamic), TN/NIT coated needles (-20% friction)
- [ ] **Historical analog**: Beeswax coating = natural lubricant + thermal sink

### Section 5: Hyperelastic Constitutive Modeling (Lines 94-128)
**Extract to SYNTH-03 — Fabric Deformation Simulation:**
- [ ] Right Cauchy-Green tensor: C = F^T·F
- [ ] Strain energy density: W = W(I₁, I₂, I₄, I₆) for orthotropic (warp/weft/shear/out-of-plane)
- [ ] 2nd Piola-Kirchhoff: S = 2∂W/∂C + pC⁻¹
- [ ] Yeoh/Holzapfel models for mixed invariants
- [ ] **Robotic application**: Shear-tension energy evolution → dynamic tensile load adjustment
- [ ] **Historical**: Predict fabric behavior during hand manipulation, pleating, cartridge folds

### Section 6: Robotic Assembly Protocols (Lines 104-158)
**Extract to SYNTH-02 — Automation for Historical:**
- [ ] **Sewbo PVOH**: Water-soluble stiffening → rigid panels → robotic handling → wash out
  - Application: Automated historical garment assembly without distortion
- [ ] **KSL 3D Sewing**: KUKA Quantec + KL-500/504 end-effectors
  - Tool changers: blind stitch, double chain, ultrasonic cut, Z-pinning
  - Machine vision: real-time vector correction
  - **Application**: Structural panel joining (ceramic tiles, protective layers)
- [ ] **TFP (Tailored Fiber Placement)**: CNC embroidery with structural rovings (Carbon/Kevlar/Glass)
  - Class 304 zigzag lockstitch, 360° rotation → stress-trajectory alignment
  - **Application**: Load-optimized protective embroidery in historical garments

### Section 7: Threadless Joining (Lines 125-172)
**Extract to SYNTH-02 — Seamless Historical Integration:**
- [ ] **Ultrasonic**: 20-50 kHz, piezoelectric transducer, Ti/steel horn, patterned anvil
  - ≥65% thermoplastic content required
  - **Application**: Synthetic protective layer lamination
- [ ] **RF Dielectric**: 27.12 MHz, polar molecules (PVC, PU), volumetric heating
  - Pressure: 0.1-0.5 MPa, cooling cycle 20% weld time
  - **Application**: Impermeable barrier layers
