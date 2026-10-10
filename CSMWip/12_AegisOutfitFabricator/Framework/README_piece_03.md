# 6. FRAMEWORK & TOOLING

## 6.1 Framework Directory Structure

```
/workspace/app/CSMWip/12_AegisOutfitFabricator/
├── Framework/                    # All scripts, configs, documentation
│   ├── MASTER_TODO_A.md         # Phase 0-3: Foundation, Research, Materials, Geometry
│   ├── MASTER_TODO_B.md         # Phase 4-6: 150 Document Production Pipeline
│   ├── MASTER_TODO_C.md         # Phase 7-10: GitHub, Quality, Delivery, Closure
│   ├── heartbeat.sh             # Session progress logging (executable)
│   ├── RESUME_SESSION.md        # Session restoration guide
│   ├── NEXT_RUNNER_001.md       # Next session task breakdown (13 pieces)
│   ├── README.md                # This document
│   ├── check_doc_quality.sh     # Document quality gate script
│   ├── verify_github_17ways.sh  # 17-way GitHub verification script
│   ├── verify_reassembly.sh     # Piece reassembly verification
│   ├── process_document.sh      # Complete document pipeline script
│   └── csmlogs/                 # Session logs (auto-generated)
├── Logs/                         # Project logs
│   ├── heartbeat.log            # Continuous heartbeat log
│   └── csmlogs/                 # Session logs
├── Pieces/                       # Document pieces (13 per doc)
│   ├── *_piece_01.md ... *_piece_13.md
│   ├── *_manifest.json
│   └── *_pieces.zip
├── FinishedWork/                 # Clean reassembled documents (150)
│   ├── DOC_01.md ... DOC_50.md
│   ├── FAB-RM-01.md ... FAB-RM-25.md
│   ├── IMG-RM-01.md ... IMG-RM-05.md
│   ├── FAB-RW-01.md ... FAB-RW-25.md
│   ├── IMG-RW-01.md ... IMG-RW-05.md
│   ├── SYNTH-01.md ... SYNTH-03.md
│   ├── MAT-01.md ... MAT-04.md
│   └── DRAFT-01.md ... DRAFT-05.md
├── Research/                     # Seed research documents
│   ├── Historical Dress Construction Analysis.md
│   └── Advanced Textile Stitching and Automation.md
├── CSMFAB001_Aegis_RenaissanceMan/    # RenaissanceMan fabrication workspace
└── CSMFAB002_Aegis_RenaissanceWoMan/  # RenaissanceWoMan fabrication workspace
```

## 6.2 Core Scripts

### 6.2.1 heartbeat.sh
**Purpose**: Continuous session progress logging
**Usage**: `./Framework/heartbeat.sh "Optional note"`
**Logs to**: `Logs/heartbeat.log` + `Logs/csmlogs/session_YYYYMMDD_HHMMSS.md`
**Captures**: Git status, document pipeline counts, framework file presence, research/CSMFAB078 availability

### 6.2.2 RESUME_SESSION.md
**Purpose**: Complete session restoration guide
**Contains**: Environment verification, project structure, required pre-reading, session commands, troubleshooting, escalation criteria

### 6.2.3 NEXT_RUNNER_001.md (13 pieces)
**Purpose**: Next session immediate execution plan
**Parts**: A (Bootstrap), B (Research Extraction), C (Quality Gates + Roadmap)
**Split**: 13 pieces × ~100 lines each + manifest + zip

### 6.2.4 check_doc_quality.sh
**Purpose**: Automated quality gate for every document
**Gates**: 
- Lines ≥ 300
- Formulas ≥ 15 (LaTeX/Unicode)
- Cross-refs ≥ 10 (Research/ + CSMFAB078)
- Standards ≥ 5 (CIETA, ASTM, NIJ, NFPA, MIL-STD, ISO, IEC)
- Conflation = 0 (no medieval/Victorian/Edwardian in Renaissance docs)
- Traceability matrix present

### 6.2.5 verify_github_17ways.sh
**Purpose**: Comprehensive GitHub presence verification
**Methods**: 17 independent verification techniques (see Section 5.4)
**Sample**: Run on first piece of each document

### 6.2.6 verify_reassembly.sh
**Purpose**: Ensure piece reassembly produces byte-identical document
**Check**: `diff original reassembled` = 0 bytes

### 6.2.7 process_document.sh
**Purpose**: End-to-end document pipeline automation
**Sequence**: Quality → Split → Zip → Push → Verify Reassembly → 17-way Check → Heartbeat

## 6.3 GitHub Handler Integration

**Location**: `/workspace/app/CSMScripts/freenemo_modules/03_github_handler.sh`
**Modules**: 
- `03a_github_handler_core.sh` — Config, difficulty assessment, logging, split/join
- `03b_github_handler_strategies.sh` — 13 strategies + main save function

**Key Functions**:
- `gh_init()` — Initialize .github_handler/ directory structure
- `gh_assess_difficulty(file)` — Returns: easy/medium/hard/extreme
- `gh_split_file(file, max_lines)` — Splits into pieces + manifest
- `gh_join_files(manifest, output)` — Reassembles from pieces
- `gh_save_file(file, msg, branch)` — Tries strategies 1-N until success
- `gh_process_queue()` — Processes manual merge queue

**Log Files** (in `.github_handler/`):
- `difficulty_log.json` — Per-file difficulty, line count, strategy count
- `methods_log.json` — Per-strategy success/failure history
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

---

# 8. FABRICATION VARIANTS

## 8.1 Aegis RenaissanceMan (RM) — 50 Documents

### 8.1.1 Four Editions (Mapped from AIMES LES)

| Edition | Height | Chest | Waist | Shoulder | Sleeve | Inseam | Tile Count |
|---------|--------|-------|-------|----------|--------|--------|------------|
| **RM-TS** | 185-200 cm | 86-96 cm | 71-81 cm | 48-53 cm | 66-71 cm | 84-91 cm | 42 outer + 42 inner |
| **RM-TG** | 185-200 cm | 112-132 cm | 102-122 cm | 53-58 cm | 66-71 cm | 84-91 cm | 56 outer + 56 inner |
| **RM-SS** | 155-170 cm | 76-86 cm | 61-71 cm | 41-46 cm | 56-61 cm | 71-78 cm | 36 outer + 36 inner |
| **RM-SG** | 155-170 cm | 102-122 cm | 92-112 cm | 46-51 cm | 56-61 cm | 71-78 cm | 48 outer + 48 inner |

### 8.1.2 Document Breakdown (50 Total)

**Mechanical Specifications (25 docs)**:
- FAB-RM-01: Master Fabrication Index
- FAB-RM-02 to 05: Edition Pattern Sets (TS, TG, SS, SG)
- FAB-RM-06: Tile Fabrication Drawings
- FAB-RM-07: Lace Routing Diagrams
- FAB-RM-08: Chassis Strut Cut Lists
- FAB-RM-09: Assembly Sequence
- FAB-RM-10: Quality Control Checklist
- FAB-RM-11: Tooling & Fixtures
- FAB-RM-12: Material Kitting
- FAB-RM-13: Production Rate Targets
- FAB-RM-14: Waste Minimization
- FAB-RM-15: Operator Work Instructions
- FAB-RM-16: Maintenance Manual
- FAB-RM-17: Deployment Packaging
- FAB-RM-18: Field Configuration Guide
- FAB-RM-19: Training Curriculum
- FAB-RM-20: Cost Analysis
- FAB-RM-21: Regulatory Compliance
- FAB-RM-22: Supply Chain Security
- FAB-RM-23: Continuous Improvement
- FAB-RM-24: Digital Twin
- FAB-RM-25: Handoff Package

**Image Generation Prompts (5 docs)**:
- IMG-RM-01: Structural Firefighting (1960s Atlas/Delta)
- IMG-RM-02: HazMat/CBRNE (1950s Atomic Energy Commission)
- IMG-RM-03: Electrical Arc Flash (1940s V-2 Peenemünde)
- IMG-RM-04: Military Tactical (1930s Zeppelin/Goddard)
- IMG-RM-05: Carrington Event (Master Palimpsest)

## 8.2 Aegis RenaissanceWoMan (RW) — 50 Documents

### 8.2.1 Four Editions

| Edition | Height | Bust | Waist | Hip | Shoulder | Sleeve | Inseam |
|---------|--------|------|-------|-----|----------|--------|--------|
| **RW-TS** | 170-185 cm | 86-96 cm | 66-76 cm | 91-101 cm | 39-44 cm | 61-66 cm | 76-83 cm |
| **RW-TG** | 170-185 cm | 106-126 cm | 91-111 cm | 111-131 cm | 44-49 cm | 61-66 cm | 76-83 cm |
| **RW-SS** | 155-165 cm | 76-86 cm | 56-66 cm | 81-91 cm | 36-41 cm | 56-61 cm | 68-74 cm |
| **RW-SG** | 155-165 cm | 96-116 cm | 86-106 cm | 101-121 cm | 41-46 cm | 56-61 cm | 68-74 cm |

### 8.2.2 Document Breakdown (50 Total)

**Mechanical Specifications (25 docs)**:
- FAB-RW-01: Master Fabrication Index
- FAB-RW-02 to 05: Edition Pattern Sets
- FAB-RW-06: Stays/Corset Fabrication (baleen channels, eyelet reinforcement, busk)
- FAB-RW-07: Farthingale/Pannier Fabrication (hoop calculations, tape tension)
- FAB-RW-08: Watteau Back Construction (pleat folding jigs, stitch density maps)
- FAB-RW-09: Cartridge Pleating Skirt (S-curve geometry, waistband integration)
- FAB-RW-10: Detachable Sleeve System (lacing points, protective layer alignment)
- FAB-RW-11: Coif/Headwear Fabrication (protective liner, EMI mesh)
- FAB-RW-12: Assembly Sequence (stays → farthingale → gown → overlayer)
- FAB-RW-13: Quality Control (18-22 SPI, seam efficiency, fit validation)
- FAB-RW-14: Tooling (stays frames, pleating boards, cartridge guides, eyelet presses)
- FAB-RW-15: Material Kitting (silk lot matching, metallic thread spools)
- FAB-RW-16: Production Rate (hand-stitch stations, automated assist)
- FAB-RW-17: Waste Minimization (historical zero-waste, sericin recovery)
- FAB-RW-18: Work Instructions (guild methods, apprentice steps)
- FAB-RW-19: Maintenance (re-boning, re-pressing, metallic thread repair)
- FAB-RW-20: Packaging (acid-free tissue, cedar, humidity control)
- FAB-RW-21: Field Configuration (stays lacing, farthingale adjustment)
- FAB-RW-22: Training (historical tailoring + modern protection)
- FAB-RW-23: Cost Analysis (silk yardage, metallic thread, baleen/steel, labor)
- FAB-RW-24: Compliance (historical accuracy + modern protection)
- FAB-RW-25: Supply Chain (silk farms, thread mills, baleen alternatives)

**Image Generation Prompts (5 docs)**:
- IMG-RW-01: Court Fire Emergency (1890s Lilienthal)
- IMG-RW-02: Alchemical Lab Accident (1870s Jules Verne)
- IMG-RW-03: Ballroom Electrical Catastrophe (1850s Crystal Palace)
- IMG-RW-04: Battlefield Medical (1860s Civil War Telegraphic)
- IMG-RW-05: Solar Storm Court (Master Palimpsest)

## 8.3 Edition Transition Mechanics

**From AIMES LES (CSMFAB078-A §4)**:
- **Phase 1**: De-tension (15s) — release all 12 zone levers
- **Phase 2**: Panel reconfiguration (45s) — add/remove tiles, magnetic alignment
- **Phase 3**: Re-tension (25s) — engage levers in sequence Z3→Z4→Z5→Z6→Z1→Z2→Z7→Z8→Z9→Z10→Z11→Z12
- **Phase 4**: Validation (5s) — SE spot-check, MR pressure, bio-acoustic baseline

**Renaissance Adaptation**:
- Lacing points map to historical cord eyelets
- Tile add/remove = garment alteration (historical practice)
- Transition time target: <90 seconds (same as AIMES)