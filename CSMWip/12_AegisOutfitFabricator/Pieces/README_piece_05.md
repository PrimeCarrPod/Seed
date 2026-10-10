- `merge_queue.json` — Manual intervention queue

## 6.4 External Dependencies

| Tool | Purpose | Location |
|------|---------|----------|
| Git | Version control | System |
| jq | JSON processing | System |
| curl | GitHub API calls | System |
| gh (GitHub CLI) | PR creation | Optional |
| zip/unzip | Piece archiving | System |
| split | File splitting | System |
| sha256sum | Checksums | System |
| diff | Reassembly verification | System |

## 6.5 CSMFAB078 Reference Access

**Path**: `/workspace/app/CSMFAB/CSMFAB078_AegisIronMan/`
**Key Documents**:
- Main Plan: `CSMFAB078 Aegis Iron Man Adaptive Exosuit Fabrication Plan.md`
- Mechanical Spec: `CSMFAB078-A Leaf Edition Mechanical Specification.md`
- Threat Protection: `CSMFAB078-B Threat Protection Validation and Materials Deep-Dive.md`
- Image Prompts: `CSM_GEN_IMAGE_PROMPTS/` (23 documents including Master Composition Guide)

---

# 7. RESEARCH FOUNDATIONS

## 7.1 Research Document 1: Historical Dress Construction Analysis

**File**: `Research/Historical Dress Construction Analysis.md`
**Size**: 215 lines, ~90KB
**Coverage**: 1600-1899 European court dress as engineered composite structures

### 7.1.1 Key Technical Domains

| Domain | Key Findings | Application to Fabricator |
|--------|-------------|---------------------------|
| Silk Biomechanics | Degummed fibroin: E=8-12 GPa, σ=500-700 MPa | Base fabric mechanical spec |
| Metallic Threads | Au-Hg/Ag amalgam, micro-strip winding | Faraday cage thread design |
| CIETA Typologies | 5 structures with mechanical profiles | Weave selection per protection layer |
| Orthotropic Mechanics | Non-linear Poisson, auxetic potential | Pleating & drape simulation |
| Geometric Drafting | Alcega developable surfaces, Garsault scaling | Pattern generation kernel |
| Robe à la Française | 3:1 pleat ratio, load-bearing columns | Watteau back engineering |
| Corset/Crinoline Mechanics | Baleen Euler buckling, steel hoop inertia | Stays & farthingale design |
| Seam Engineering | 18-22 SPI, backstitch=lockstitch, cartridge pleats | Stitch specification per zone |
| Regulatory Constraints | Sumptuary algorithms, guild workflows | Fabrication constraint system |

### 7.1.2 Mathematical Extractions

- **Silk stress-strain**: σ = E·ε (elastic), σ_y = f(ε_p) (plastic)
- **Poisson's ratio**: ν = -ε_t/ε_l, orthotropic Hooke's law
- **Pleat geometry**: depth = (W_unpleated - W_target)/3
- **Euler buckling**: P_cr = π²EI/L² (baleen stays)
- **Hoop inertia**: I = πr³t (crinoline hoops)
- **Seam efficiency**: η = F_seamed/F_unseamed × 100%

## 7.2 Research Document 2: Advanced Textile Stitching and Automation

**File**: `Research/Advanced Textile Stitching and Automation.md`
**Size**: 225+ lines
**Coverage**: ISO 4915 stitch classes, ASTM D1683, robotic assembly, threadless joining

### 7.2.1 Key Technical Domains

| Domain | Key Findings | Application to Fabricator |
|--------|-------------|---------------------------|
| ISO 4915 Stitch Classes | 6 classes with mechanical dominance | Historical ↔ Modern stitch mapping |
| ASTM D1683 Seam Testing | Seam efficiency, 3 failure modes | Historical seam validation |
| Thread Materials | Core-spun Poly-Cotton, extreme threads | Historical thread analogs |
| Needle Thermodynamics | 300-400°C needle, PET melt at 252°C | Beeswax as thermal sink analog |
| Hyperelastic Modeling | Cauchy-Green tensor, Yeoh/Holzapfel | Fabric deformation simulation |
| Robotic Assembly | Sewbo PVOH, KSL 3D, TFP | Automated historical fabrication |
| Threadless Joining | Ultrasonic, RF, Laser | Seamless protective layer integration |
| 3D Knitting/Weaving | Shima Seiki, Multiaxial looms | Seamless historical structures |

### 7.2.2 Critical Mappings

| Historical | Modern Equivalent | Mechanical Proof |
|------------|------------------|------------------|
| Running stitch | ISO 100 Intralooping | Low strength, raveling |
| Backstitch | ISO 300 Lockstitch | Max longitudinal shear |
| Cartridge pleating tension | ISO 400 Chainstitch | Dynamic load distribution |
| Whipstitch | ISO 500 Overedge | Fray prevention |
| N/A | ISO 600 Coverstitch | Multiaxial elasticity |

### 7.2.3 Automation Protocols for Historical Fabrication

1. **Sewbo PVOH Rigidification**: Temporary stiffening → robotic handling → wash out
2. **KSL 3D Sewing Cells**: KUKA + KL-500/504 end-effectors for structural panels
3. **Tailored Fiber Placement**: CNC embroidery with structural rovings (Kevlar/Carbon)
4. **Threadless Joining**: Ultrasonic (thermoplastics), RF (PVC/PU), Laser (surface preservation)
5. **Programmable 3D Knitting**: Shima Seiki WholeGarment → seamless tubes/bifurcations
6. **Multiaxial Weaving**: Active shedding jacquard → non-orthogonal 3D preforms

