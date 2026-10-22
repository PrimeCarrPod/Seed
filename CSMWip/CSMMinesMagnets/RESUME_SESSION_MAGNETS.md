# RESUME_SESSION_MAGNETS.md

## Session Context: CSMWip/CSMMinesMagnets

### Project State
- **Runner**: 001 (Initial session — project creation)
- **Phase**: 1 Foundation Research — DOC-01 through DOC-03 (starting)
- **Infrastructure**: Directory structure created, AGENTS.md written
- **Heartbeat**: Not yet started (120-second interval planned)

### What's Done (Project Initialization)
- ✅ **Directory Structure**: Created per AGENTS.md specification
- ✅ **AGENTS.md**: Complete project conventions, 60-doc pipeline defined
- ✅ **Research Baseline**: Identified key Chilean magnet/mining documents in repository
- ✅ **Python Tools**: Verified `__Python_Tools/write_large_file.py` operational

### Research Assets Located (Repository-Wide)
| Asset | Path | Relevance |
|-------|------|-----------|
| CSMEval25 Rare Earth Critical Minerals Mining | `CSMReach/CSMEval/25-Rare-Earth-Critical-Minerals-Mining-and-Magnet-Industry/` | Industry landscape, Niron Magnetics, MP Materials, Aegis-Forge |
| Chile Outreach Briefing | `CSMReach/CSMGeneralOutreach-Global/CSMGlobal-037-Chile/` | Grid vulnerability, mining exposure, Carrington-class threat |
| Chile Email Outreach | `CSMReach/CSMEmailOutgoing/July2026/BATCH-08-Global-Outreach/E-GLOBAL-chile.md` | Distribution channel, contact framework |
| National Mining Association | `CSMReach/CSMEmailOutgoing/July2026/BATCH-16-Untapped-Sectors/E172-NationalMining.md` | Acid-free REE processing, Aegis-Forge specs, CAPEX/OPEX |
| **CSMMagEco2026 V2.0 — US Magnet Startup Ecosystem** | `CSMPro/CSMMag/CSMMagEco2026 New US Magnet Companies Identified/` | **12+ domestic magnet startups, DFARS 2027 deadline, Fe₁₆N₂ 27 MGOe production, SmCo Electron Energy, Urban Mining HPMS 12t/mo, MP Materials Fort Worth, Noveon DFARS-qualified** |
| **CSMMagTech2026 V2.0 — Rare-Earth-Free Magnet Research** | `CSMPro/CSMMag/CSMMagTech 2026 Rare-Earth-Free Magnet Research/` | **Fe₁₆N₂ 27 MGOe, MnBi 14 MGOe, AlNiCo 10.5 MGOe (AM), Fe-Sn 12 MGOe (NIMS), MXene-NdFeB +12% Hci, EU CRMA 2024, CSM portfolio magnet strategy table** |
| Aegis-Forge Separator | `CSMFAB/CSMFAB0108/` (referenced) | Thermal cascade inductive separation, 17-stage, zero liquid waste |

### What's Next (Runner 001)

#### Document Authoring (Priority Order)
1. **DOC-01**: Chilean Magnetic Mineral Landscape — Geological Survey & Resource Mapping
2. **DOC-02**: Lives of the Extractors — Community Ethnography & Human Geography
3. **DOC-03**: Mutual Benefit Frameworks — Value Return to Chilean Communities

#### Infrastructure Setup (Parallel)
1. Create TODO.md with full 60-doc task hierarchy
2. Create NEXT_runner_001.md with detailed assignments
3. Create HEARTBEAT_MAGNETS.md config
4. Create scripts/heartbeat_monitor.py (adapted from Aegis)
5. Create scripts/generate_heuristic_intros.sh (adapted from Aegis)
6. Start heartbeat monitor
7. Git: Initial commit

### Key Commands

```bash
# Resume session
cd /workspace/app/CSMWip/CSMMinesMagnets
cat NEXT_runner_001.md
cat RESUME_SESSION_MAGNETS.md
git status

# Start heartbeat monitor (background)
python3 scripts/heartbeat_monitor.py --interval 120 &
HEARTBEAT_PID=$!

# Verify write_large_file.py works
python3 ../../__Python_Tools/write_large_file.py --help

# Author DOC-01 (Chilean Magnetic Mineral Landscape)
# Key references: Chilean mining code, Sernageomin, USGS, Cochilco, Antofagasta Minerals, Codelco, SQM, Albemarle
# Then chunk & verify:
python3 ../../__Python_Tools/write_large_file.py split \
    FinishedWork/DOC-01_Chilean_Magnetic_Mineral_Landscape.md \
    chunks/DOC-01 chapter .md
python3 ../../__Python_Tools/write_large_file.py verify chunks/DOC-01

# Compress original
python3 ../../__Python_Tools/write_large_file.py compress \
    FinishedWork/DOC-01_Chilean_Magnetic_Mineral_Landscape.md

# Generate heuristic intros
./scripts/generate_heuristic_intros.sh FinishedWork/DOC-01_Chilean_Magnetic_Mineral_Landscape.md
```

### Document Dependencies for DOC-01..03
- **Chilean Mining Code** (Law 18,248 + modifications)
- **Sernageomin** — National Geology and Mining Service datasets
- **Cochilco** — Chilean Copper Commission market intelligence
- **USGS Mineral Commodity Summaries** — Chile chapters (Cu, Li, REE, Fe)
- **Antofagasta Minerals / Codelco / SQM / Albemarle** — Company reports
- **Indigenous Law 19,253** — Consulta indígena requirements
- **Environmental Law 19,300** — SEIA/RCA permitting
- **CSMEval25** — Rare earth & magnet industry baseline
- **CSMGlobal-037-Chile** — Grid vulnerability & mining exposure
- **E172-NationalMining** — Aegis-Forge acid-free processing specs
- **CSMMagEco2026 V2.0** — DFARS 2027, Fe₁₆N₂ 27 MGOe, domestic magnet startup map, recycling
- **CSMMagTech2026 V2.0** — Rare-earth-free magnet performance table, MXene-NdFeB, CRMA, CSM portfolio strategy

### Quality Gates (Every Document)
- Lines: ≥900
- Formulas/Technical specs: ≥20 (LaTeX/Unicode)
- Cross-references: ≥15
- Standards cited: ≥8
- Conflation flags: 0
- TBD markers: Documented as [TBD:RESEARCH]
- Traceability Matrix: Present
- Chunk reassembly: 0 bytes diff
- Manifest checksums: PASS
- Heuristic intros: 4 variants generated

### Heartbeat Monitor
- **Interval**: 120 seconds
- **Output**: Terminal progress every subtask
- **Subtask guard**: 30 seconds max
- **Auto-continue**: No blocking, queue next immediately

### Git Workflow
```bash
# After each document complete
git add chunks/DOC-XX/ FinishedWork/DOC-XX_*.md.gz
git commit -m "runner001: DOC-XX complete - chunked, verified, compressed"
```

### Next Runner Handoff
Create NEXT_runner_002.md with:
- Completed documents list (DOC-01 through DOC-03)
- Next batch assignments (DOC-04 through DOC-08)
- Infrastructure status
- Any blockers or decisions

---

**Resume Command**:
```bash
cd /workspace/app/CSMWip/CSMMinesMagnets
cat NEXT_runner_001.md
cat RESUME_SESSION_MAGNETS.md
git status
python3 scripts/heartbeat_monitor.py --interval 120 &
```