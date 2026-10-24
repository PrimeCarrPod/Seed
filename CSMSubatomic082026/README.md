# CSMSubatomic082026 (SubAtomic Prime Electron Foundation)

**Category:** CSMWip | **State:** Part of Another Project | **Files:** 1203+

**Parent Project:** CSMWip

## Summary

# INSTRUCTIONS_WORK_IN_PROGRESS.md — CSMSubatomic082026 — SubAtomic Prime Electron Foundation with SubParticlesV4 upgrade (1203+ files, has TODO, has NEXT)

---

## Architecture & Design — Williams Heuristic

### System Boundaries

The CSMSubatomic082026 project operates within the **CSMWip** domain, functioning as a **Part of Another Project** with 1203+ files. It serves as the canonical repository for the **SubAtomic Prime Electron** framework — a unified particle physics ontology based on Wheeler's one-electron universe (1940) and Gielerak's extensions (2020), integrated with modern experimental data (2022-2026).

### Core Principles

1. **Ontological Unity** — All particles as manifestations of a single electron worldline
2. **Definitive Depth** — 90-minute read standard per document, no "curt" explanations
3. **Version Lineage** — Explicit V1.0 → V2.0 → V4.0 upgrade path with full traceability
4. **Experimental Grounding** — LHC Run 3, KATRIN, LIGO O4, JWST, NIF, FLAG 2024 data integrated
5. **Cross-Domain Synthesis** — Particle physics, cosmology, condensed matter, biology unified

### Component Diagram

```
CSMSubatomic082026
├── SubAtomic.Edu/                    # Educational framework
│   ├── DeepDives/                    # 90-minute definitive documents
│   ├── Glueball_Single_Electron_Theory_Synthesis/  # 14-part synthesis
│   ├── SubParticlesV1/               # V1.0 → V2.0 archive (33 + 4 PDFs)
│   ├── SubParticlesV3/               # V3.0 4-series (56 docs)
│   ├── SubParticlesV4/               # V4.0 current upgrade (37 × 14-part)
│   ├── V4_Particles/                 # V4 particle definitions
│   └── V5_Particles/                 # V5 extensions
├── landolil.engine/                  # Land of Lil game engine
│   ├── LOL_v2_staging/               # 34 particles + glueball worldlines
│   ├── LOL_v3_staging/               # 18 microbe icons + Android bridge
│   └── LOL_v4_staging/               # Merged V4 (TARGET)
├── TardigradiaTGPU/                  # GPU-accelerated visualization
│   ├── TGPU004.htm                   # Next-gen Worldline Engine V4.0
│   └── index_v4.html                 # Main entry point
├── OrganizedLibrary/                 # Curated reference library
│   ├── ConcatenatedMasters/          # Master documents
│   ├── CrossCutting/                 # Cross-domain synthesis
│   └── Particles/                    # Particle reference sheets
├── Prime_Electron_Foundation/        # Core ontology
├── __CURRENT_RELEASES__/             # Release management
├── __CURRENT_WORK_IN_PROGRESS__/     # Active development
└── __WIP__/                          # Work in progress
```

---

## Implementation — Keymaker Protocol

### Technology Stack

| Layer | Technology | Version | Purpose |
|-------|------------|---------|---------|
| Authoring | Markdown + write_large_file.py | — | Chapter-based 14-part documents |
| Visualization | HTML5 + Three.js + Chart.js | Local | WebGL particle rendering |
| Game Engine | Custom (landolil) | v2-v4 | Interactive particle explorer |
| GPU Compute | WebGL2 / WebGPU | — | Worldline simulation |
| Version Control | Git | — | Branching per phase |
| Documentation | Markdown + chunks | — | IncrementalDocumentWriter |
| Build | Custom scripts | — | generate_readme*.sh, compile_radio*.sh |

### Key Files & Directories

```
./CSMSubatomic082026/
├── INSTRUCTIONS_WORK_IN_PROGRESS.md  # Phase execution log & methodology
├── README_WORK_IN_PROGRESS.md        # This file (to be replaced by README.md)
├── SubAtomic.Edu/                    # Educational deep dives
│   ├── DeepDives/                    # Individual particle studies
│   ├── SubParticlesV1/               # Legacy V1/V2 archive
│   ├── SubParticlesV3/               # V3.0 intermediate
│   ├── SubParticlesV4/               # Current V4.0 production
│   │   ├── Glueball_Single_Electron_V4.0/  # Parts 01-14
│   │   ├── Axion_Deep_Dive_V4.0/           # 14 parts
│   │   ├── Baryon_One_Particle_Universe_V4.0/  # 14 parts
│   │   └── ... (37 topics × 14 parts = 518 docs)
│   ├── V4_Particles/                 # V4 definitions
│   └── V5_Particles/                 # V5 extensions
├── landolil.engine/                  # Game engine iterations
│   ├── LOL_v2_staging/               # Base particle system
│   ├── LOL_v3_staging/               # Microbe + Android
│   └── LOL_v4_staging/               # Merged target (index_v4.html)
├── TardigradiaTGPU/                  # GPU visualization
│   ├── TGPU004.htm                   # Worldline Engine V4.0
│   ├── index_v4.html                 # Entry point
│   └── CHANGELOG.md                  # Version history
├── OrganizedLibrary/                 # Reference library
│   ├── ConcatenatedMasters/          # Master docs
│   ├── CrossCutting/                 # Synthesis
│   └── Particles/                    # Reference sheets
├── Prime_Electron_Foundation/        # Core ontology
├── __CURRENT_RELEASES__/             # Published releases
├── __CURRENT_WORK_IN_PROGRESS__/     # Active work
└── __WIP__/                          # Scratch space
```

### Configuration

Key configuration files:

- `INSTRUCTIONS_WORK_IN_PROGRESS.md` — Phase execution log, methodology, source locations
- `README_WORK_IN_PROGRESS.md` — Project overview (this file)
- `SubAtomic.Edu/SubParticlesV4/CHANGELOG.md` — Version history
- `landolil.engine/LOL_v4_staging/index_v4.html` — Merged visualization target

### Build & Generation Commands

```bash
# Generate READMEs for all sub-projects
cd /workspace/app/README_GENERATOR
./generate_readme_final.sh

# Compile radio/web visualization
./compile_radio_v3.sh

# Fix and regenerate all documents
./fix_and_regenerate.sh

# Generate all READMEs (simple)
./generate_readme_simple.sh
```

### Environment Variables

```bash
export CSM_ROOT=/workspace/app
export CSM_SUBATOMIC=$CSM_ROOT/CSMSubatomic082026
export SUBPARTICLES_V4=$CSM_SUBATOMIC/SubAtomic.Edu/SubParticlesV4
export LANDOLIL_ENGINE=$CSM_SUBATOMIC/landolil.engine
export TGPU_ENGINE=$CSM_SUBATOMIC/TardigradiaTGPU
```

---

## Operations — El Segundo Protocol

### Session Lifecycle

1. **Startup** — Read `INSTRUCTIONS_WORK_IN_PROGRESS.md` → Check current phase → `NEXT_runner_XXX.md`
2. **Execution** — Process 14-part document upgrades sequentially (90-min per part)
3. **Heartbeat** — Progress output every 2 minutes via `heartbeat-shared` mechanism
4. **Checkpoint** — Update `INSTRUCTIONS_WORK_IN_PROGRESS.md` phase status after each part
5. **Handoff** — Create `NEXT_runner_XXX+1.md` with next part assignment

### Phase Execution Model

| Phase | Description | Target | Status |
|-------|-------------|--------|--------|
| 1 | Glueball V4.0 Parts 11-14 | 4 docs | IN PROGRESS |
| 2A | 33 V2.0 → V4.0 upgrades | 462 docs | PENDING |
| 2B | 4 PDFs → V4.0 from scratch | 56 docs | PENDING |
| 3 | LOL_v4_staging merge | index_v4.html | PENDING |
| 4 | TGPU004.htm engine | Worldline V4.0 | PENDING |
| 5 | index_v4.html entry | Main portal | PENDING |
| 6 | CREDITS.md | Attribution | PENDING |
| 7 | Git push | Branch publish | PENDING |

### Quality Gates

- Each 14-part document must pass "above my pay grade" technical review
- Cross-reference validation across all 37 V4.0 topics
- Mathematical consistency checks for one-electron ontology
- Experimental data citations from 2022-2026 sources
- Visualization renders in LOL_v4_staging and TGPU004.htm
- Manifest verification via `write_large_file.py verify`

---

## Three-Pronged Heuristic Integration

This project employs the **Williams/Keymaker/El Segundo** triad:

### Williams Heuristic — Architectural Clarity

- **Purpose**: Define the unified particle ontology and its boundaries
- **Method**: One-electron universe as topological framework; 37 topics mapped to 14-part structure
- **Output**: `INSTRUCTIONS_WORK_IN_PROGRESS.md` phase map, `SubAtomic.Edu/` topic taxonomy
- **Applied Here**: Clear V1→V2→V4 lineage; explicit 37×14 document matrix

### Keymaker Protocol — Implementation Precision

- **Purpose**: Define how 518+ documents are authored, verified, and published
- **Method**: `write_large_file.py IncrementalDocumentWriter` for chapter-based authoring; `generate_readme*.sh` for automation
- **Output**: Chunked documents with `MANIFEST.json`; HTML5 visualizations with local deps
- **Applied Here**: 14-part standard; SHA256 manifest verification; local Three.js/Chart.js

### El Segundo Protocol — Operational Excellence

- **Purpose**: Define how the massive upgrade executes across sessions
- **Method**: Phase-gated execution; 90-min per part; heartbeat monitoring; Git branch per phase
- **Output**: `INSTRUCTIONS_WORK_IN_PROGRESS.md` phase log; `NEXT_runner_XXX.md` handoffs
- **Applied Here**: 7-phase plan; session resume via `RESUME_SESSION_*.md`

### Integration Matrix

| Phase | Williams | Keymaker | El Segundo |
|-------|----------|----------|------------|
| Design | Ontology Map | 14-Part Template | Phase Gate |
| Author | Topic Taxonomy | Chunk Pipeline | 90-min Part |
| Verify | Cross-Refs | Manifest SHA256 | Heartbeat |
| Visualize | Worldline Engine | Local Three.js | LOL_v4 Merge |
| Publish | Release Tags | Git Branch | Credits.md |

---

## SubParticlesV4 Specifics

### The 37 V4.0 Topics (14 Parts Each = 518 Documents)

**Core Particle Physics (12):**
1. Glueball_Single_Electron_V4.0
2. Axion_Deep_Dive_V4.0
3. Baryon_One_Particle_Universe_V4.0
4. Chiral_Symmetry_Breaking_V4.0
5. Color_Confinement_V4.0
6. Electroweak_Unification_V4.0
7. Flavor_Oscillations_V4.0
8. Higgs_Mechanism_V4.0
9. Instanton_Vacuum_V4.0
10. Majorana_Neutrino_V4.0
11. Magnetic_Monopole_V4.0
12. Topological_Defect_V4.0

**Cosmology & Astrophysics (8):**
13. CMB_Polarization_V4.0
14. Dark_Matter_Candidates_V4.0
15. Gravitational_Wave_Echoes_V4.0
16. Inflation_Quantum_Fluctuations_V4.0
17. Neutron_Star_Equation_State_V4.0
18. Primordial_Black_Holes_V4.0
19. Reionization_History_V4.0
20. Vacuum_Decay_V4.0

**Condensed Matter & Materials (6):**
21. Anyon_Braiding_V4.0
22. Fractional_Quantum_Hall_V4.0
23. High_Tc_Superconductivity_V4.0
24. Quantum_Spin_Liquid_V4.0
25. Topological_Insulator_V4.0
26. Weyl_Semimetal_V4.0

**Cross-Domain Synthesis (7):**
27. Glueball_Single_Electron_Theory_Synthesis_V4.0
28. Micro_to_Macro_Particle_Physics_V4.0
29. Microbial_Ecosystem_Food_Chains_V4.0
30. Swarm_Mechanics_Fluid_Dynamics_V4.0
31. Biological_Quantum_Coherence_V4.0
32. Consciousness_Field_Theory_V4.0
33. Information_Physics_Entropy_V4.0

**Extensions & Applications (4):**
34. Tardigradia_Extremophile_Physics_V4.0
35. Aegis_Material_Science_V4.0
36. Carr_Pod_Engineering_V4.0
37. Land_of_Lil_Narrative_V4.0

### 14-Part Document Structure (Standard Template)

```
Part 01: Foundations & Historical Context
Part 02: Mathematical Framework
Part 03: Theoretical Foundations
Part 04: Computational Methods
Part 05: Experimental Signatures (Pre-2022)
Part 06: LHC Run 3 Results (2022-2024)
Part 07: KATRIN Neutrino Mass (2022-2024)
Part 08: LIGO O4 Gravitational Waves (2023-2024)
Part 09: JWST Observations (2022-2024)
Part 10: NIF Fusion Results (2022-2024)
Part 11: FLAG 2024 Lattice QCD
Part 12: BSM Searches & Constraints
Part 13: One-Electron Ontology Integration
Part 14: Experimental Signatures & Future Tests
```

### Asset Management

Large documents and visualizations use chunked storage:

```bash
# Verify document integrity
python3 ../../__Python_Tools/write_large_file.py verify SubAtomic.Edu/SubParticlesV4/<TOPIC>/

# Reassemble for review
python3 ../../__Python_Tools/write_large_file.py concat SubAtomic.Edu/SubParticlesV4/<TOPIC>/ FinishedWork/<TOPIC>.md

# Compress for storage
python3 ../../__Python_Tools/write_large_file.py compress FinishedWork/<TOPIC>.md
```

---

## Roadmap & Future Work

### Immediate (Phase 1 Completion)

- [ ] Complete Glueball V4.0 Parts 11-14 (BSM Glueballs, QCD Vacuum, Lattice Spectroscopy, Experimental Signatures)
- [ ] Establish `memory/` directory for session logging
- [ ] Create `NEXT_runner_001.md` with Part 11 assignment

### Short Term (Phases 2A-2B)

- [ ] Execute 33 V2.0 → V4.0 upgrades (462 documents) in batches
- [ ] Convert 4 PDFs to V4.0 from scratch (56 documents)
- [ ] Implement cross-reference validation pipeline
- [ ] Set up automated manifest verification

### Medium Term (Phases 3-5)

- [ ] Merge LOL_v2_staging + LOL_v3_staging → LOL_v4_staging/index_v4.html
- [ ] Develop TGPU004.htm Next-Gen Worldline Engine V4.0
- [ ] Create index_v4.html main entry portal
- [ ] Integrate Android bridge for landolil.engine

### Long Term (Ongoing)

- [ ] Complete CREDITS.md with all contributors
- [ ] Git push to `session/csm-work-in-progress-subparticlesv4` branch
- [ ] Quarterly review of experimental data integration
- [ ] Archive completed phases to `FinishedWork/` with compression
- [ ] Extend to V5_Particles for next-gen topics

---

## Appendix — Quick Reference

### Key Commands

```bash
# Session startup
cd /workspace/app/CSMSubatomic082026
cat INSTRUCTIONS_WORK_IN_PROGRESS.md
cat NEXT_runner_001.md
git status

# Document operations
python3 ../../__Python_Tools/write_large_file.py split <input> <chunks_dir>
python3 ../../__Python_Tools/write_large_file.py concat <chunks_dir> <output>
python3 ../../__Python_Tools/write_large_file.py manifest <chunks_dir>
python3 ../../__Python_Tools/write_large_file.py verify <chunks_dir>
python3 ../../__Python_Tools/write_large_file.py compress <file>

# Visualization
cd SubAtomic.Edu/SubParticlesV4
python3 -m http.server 8000  # Serve LOL_v4_staging

# Generation scripts
cd ../../README_GENERATOR
./generate_readme_final.sh

# Git workflow
git add -A && git commit -m '<type>: <description>' && git push
```

### File Locations

- **Project Root**: `./CSMSubatomic082026`
- **Parent Project**: `./CSMWip`
- **V4 Production**: `./SubAtomic.Edu/SubParticlesV4/`
- **Game Engine**: `./landolil.engine/LOL_v4_staging/`
- **GPU Engine**: `./TardigradiaTGPU/`
- **Reference Library**: `./OrganizedLibrary/`
- **Core Ontology**: `./Prime_Electron_Foundation/`
- **Build Tools**: `../../README_GENERATOR/`
- **Shared Utils**: `../../__Python_Tools/write_large_file.py`

### Related Projects

- **Parent**: CSMWip (`./CSMWip`)
- **Game Engine**: landolil (`../../CSMApps/landolil/`)
- **Tardigradia GPU**: TardigradiaTGPU (`../../TardigradiaTGPU/`)
- **Aegis Engineering**: CSMFAB (`../../CSMFAB/`)
- **Prime Book**: PrimeBookOne (`../../PrimeBookOne/`)
- **File Count**: 1203+ files (and growing)
- **Target**: 518 V4.0 documents (37 topics × 14 parts)

---

*README generated for CSMSubatomic082026 — Part of Another Project*
*Category: CSMWip | Files: 1203+ | Parent: CSMWip*
*Generated following 05_BOUNCE/TGE_E5 pattern using write_large_file.py IncrementalDocumentWriter*