# TODO.md — CSMWip/CSMMinesMagnets

## Master Task Hierarchy (60 Documents × ~15 Subtasks = ~900 Subtasks)

### Phase 0: Project Initialization (Tasks 1-20)

#### 0.1 Project Setup (10 tasks)
- [x] 0.1.1 Create AGENTS.md with project conventions
- [x] 0.1.2 Create TODO.md with full task hierarchy
- [x] 0.1.3 Create memory/ directory for daily logs
- [x] 0.1.4 Create NEXT_runner_001.md with detailed assignments
- [x] 0.1.5 Create RESUME_SESSION_MAGNETS.md
- [x] 0.1.6 Create HEARTBEAT_MAGNETS.md config
- [x] 0.1.7 Create scripts/heartbeat_monitor.py (120s interval)
- [x] 0.1.8 Create scripts/generate_heuristic_intros.sh (CSMOPP adapted)
- [x] 0.1.9 Create scripts/task_timer.py (30s per subtask guard)
- [x] 0.1.10 Test heartbeat + write_large_file.py pipeline

#### 0.2 Research Ingestion (10 tasks)
- [x] 0.2.1 Inventory all Chile/magnet/mining documents in repository
- [x] 0.2.2 Extract key data from CSMEval25 (magnet industry)
- [x] 0.2.3 Extract key data from CSMGlobal-037-Chile (grid/mining exposure)
- [x] 0.2.4 Extract key data from E172-NationalMining (Aegis-Forge specs)
- [x] 0.2.5 Extract key data from **CSMMagTech2026 V2.0** (Fe₁₆N₂ 27 MGOe, MnBi 14 MGOe, AlNiCo 10.5 MGOe AM, Fe-Sn 12 MGOe, MXene-NdFeB +12% Hci, EU CRMA 2024, CSM portfolio strategy)
- [x] 0.2.6 Extract key data from **CSMMagEco2026 V2.0** (12+ US magnet startups, DFARS 2027 Jan deadline, Niron/MP Materials/Noveon/Urban Mining, SmCo Electron Energy, recycling 12t/mo)
- [x] 0.2.7 Map Chilean mining companies: Codelco, Antofagasta, SQM, Albemarle, CAP
- [x] 0.2.8 Map Chilean regulatory framework: Mining Code, Indigenous Law, Environmental Law
- [x] 0.2.9 Map Chilean ports: Antofagasta, Mejillones, San Antonio, Coronel, Punta Arenas
- [x] 0.2.10 Create Research/ index with categorized sources

### Phase 1: Foundation Research — Runner 001 (Tasks 21-65)

#### 1.1 DOC-01: Chilean Magnetic Mineral Landscape (15 tasks)
- [x] 1.1.1 Research Chilean geology: Iron Oxide Copper Gold (IOCG), Iron Oxide Apatite (IOA), porphyry Cu-Mo, REE deposits
- [x] 1.1.2 Map magnetic mineral occurrences: Magnetite, hematite, goethite, pyrrhotite, REE-bearing minerals
- [x] 1.1.3 Document major districts: Iron Belt (El Romeral, El Algarrobo), Andes porphyry belt, Atacama REE
- [x] 1.1.4 Quantify reserves/resources: Codelco (Cu-Mo-Fe), CAP (Fe), SQM/Albemarle (Li), REE prospects
- [x] 1.1.5 Analyze current production vs. potential: Magnetite concentrate grades, REE recovery rates
- [x] 1.1.6 Map infrastructure: Rail (FCAB), ports, power grid, water access per district
- [x] 1.1.7 Document processing status: Direct shipping ore vs. beneficiation vs. hydrometallurgy
- [x] 1.1.8 Identify magnetic separation opportunities: Current vs. Aegis-Forge thermal cascade
- [x] 1.1.9 Cross-reference with Carrington Storm Motors magnet specs (NdFeB, SmCo, FeN, FeCo)
- [x] 1.1.10 Draft DOC-01 full document (≥900 lines, ≥20 formulas, ≥15 refs, ≥8 standards)
- [x] 1.1.11 Generate heuristic intros (Williams, Keymaker, El Segundo, Combined)
- [x] 1.1.12 Split into logical chunks → chunks/DOC-01/
- [x] 1.1.13 Generate manifest & verify integrity
- [x] 1.1.14 Compress FinishedWork original (.gz)
- [x] 1.1.15 Log completion to memory/ + git commit

#### 1.2 DOC-02: Lives of the Extractors — Community Ethnography (15 tasks)
- [x] 1.2.1 Map mining communities: Calama, Antofagasta, Copiapó, Vallenar, Andacollo, Los Andes
- [x] 1.2.2 Document Indigenous territories: Atacameño, Diaguita, Aymara, Mapuche (south)
- [x] 1.2.3 Analyze labor structure: Unionized vs. contractor, gender, migration patterns
- [x] 1.2.4 Document health/environmental burdens: Silicosis, arsenic, water scarcity, tailings
- [x] 1.2.5 Map social license dynamics: Consulta indígena, community agreements, conflicts
- [x] 1.2.6 Document educational/vocational pathways: Technical schools, university mining programs
- [x] 1.2.7 Analyze economic dependency: Municipal budgets, royalties (royalty minera), local procurement
- [x] 1.2.8 Identify community aspirations: Diversification, value-added, environmental remediation
- [x] 1.2.9 Map NGO/civil society actors: OLCA, FIMA, community radio, water defense groups
- [x] 1.2.10 Draft DOC-02 full document (≥900 lines, ≥20 formulas, ≥15 refs, ≥8 standards)
- [x] 1.2.11 Generate heuristic intros (Williams, Keymaker, El Segundo, Combined)
- [x] 1.2.12 Split into logical chunks → chunks/DOC-02/
- [x] 1.2.13 Generate manifest & verify integrity
- [x] 1.2.14 Compress FinishedWork original (.gz)
- [x] 1.2.15 Log completion to memory/ + git commit

#### 1.3 DOC-03: Mutual Benefit Frameworks — Value Return (15 tasks)
- [x] 1.3.1 Analyze Chilean royalty regime: Royalty minera (Law 21,210), ad valorem vs. operating margin
- [ ] 1.3.2 Document community agreement models: Codelco-Andacollo, Antofagasta Minerals models
- [ ] 1.3.3 Design value-return mechanisms: Equity participation, technology transfer, local processing
- [ ] 1.3.4 Map workforce development: Apprenticeships, certifications, magnet manufacturing skills
- [ ] 1.3.5 Design environmental remediation funds: Tailings reprocessing, water restoration, Aegis-Forge deployment
- [ ] 1.3.6 Analyze port/community benefit: Local hiring, supplier development, infrastructure sharing
- [ ] 1.3.7 Document governance structures: Community trusts, development corporations, oversight boards
- [ ] 1.3.8 Design Tardigradia venture alignment: Chilean entity, local board, profit-sharing
- [ ] 1.3.9 Cross-reference with Carrington Storm Motors ESG commitments
- [ ] 1.3.10 Draft DOC-03 full document (≥900 lines, ≥20 formulas, ≥15 refs, ≥8 standards)
- [ ] 1.3.11 Generate heuristic intros (Williams, Keymaker, El Segundo, Combined)
- [ ] 1.3.12 Split into logical chunks → chunks/DOC-03/
- [ ] 1.3.13 Generate manifest & verify integrity
- [ ] 1.3.14 Compress FinishedWork original (.gz)
- [ ] 1.3.15 Log completion to memory/ + git commit

#### 1.4 Runner 001 Wrap-up (5 tasks)
- [ ] 1.4.1 Verify all 3 document chunks + manifests
- [ ] 1.4.2 Update master index: chunks/MASTER_INDEX.json
- [ ] 1.4.3 Create NEXT_runner_002.md handoff
- [ ] 1.4.4 Git: Commit all, tag runner-001-complete
- [ ] 1.4.5 Update RESUME_SESSION_MAGNETS.md for next session

### Phase 2: Brokerage Architecture — Runner 002 (Tasks 66-140)

#### 2.1 DOC-04: Brokerage Protocol — Facilitator to Owner Transition (15 tasks)
#### 2.2 DOC-05: Tardigradia Holding Company — Venture Structure (15 tasks)
#### 2.3 DOC-06: Carrington Storm Motors — Integration Strategy (15 tasks)
#### 2.4 DOC-07: Chilean Regulatory Navigation (15 tasks)
#### 2.5 DOC-08: Port & Logistics Corridors (15 tasks)
#### 2.6 Runner 002 Wrap-up (5 tasks)

### Phase 3: Technical Specifications — Runner 003 (Tasks 141-215)

#### 3.1 DOC-09: Rare Earth & Critical Mineral Specifications (15 tasks)
#### 3.2 DOC-10: Magnet Manufacturing Supply Chain (15 tasks)
#### 3.3 DOC-11: Geomagnetic Risk & Infrastructure Hardening (15 tasks)
#### 3.4 DOC-12: Financial Instruments (15 tasks)
#### 3.5 DOC-13: CSMOPP Heuristic Personalities (15 tasks)
#### 3.6 DOC-14: Document Conflation Audit (15 tasks)
#### 3.7 DOC-15: Session Resume Framework (15 tasks)
#### 3.8 Runner 003 Wrap-up (5 tasks)

### Phase 4: Regional Deep Dives — Runners 004-006 (Tasks 216-410)

#### 4.1 DOC-16: Norte Grande — Tarapacá & Antofagasta Regions (15 tasks)
#### 4.2 DOC-17: Norte Chico — Atacama & Coquimbo Regions (15 tasks)
#### 4.3 DOC-18: Zona Central — Valparaíso to Biobío (15 tasks)
#### 4.4 DOC-19: Sur — Araucanía to Los Lagos (15 tasks)
#### 4.5 DOC-20: Austral — Aysén & Magallanes (15 tasks)
#### 4.6 DOC-21: Neodymium-Dysprosium Supply Chain Deep Dive (15 tasks)
#### 4.7 DOC-22: Terbium-Samarium-Cobalt Specialty Magnets (15 tasks)
#### 4.8 DOC-23: Iron-Nitride (FeN) Rare-Earth-Free Pathway (15 tasks)
#### 4.9 DOC-24: Copper-Gold-Iron Oxide (IOCG) Magnetic Byproducts (15 tasks)
#### 4.10 DOC-25: Recycling Loops — Urban Mining & Tailings Reprocessing (15 tasks)

### Phase 5: Community-Specific Intelligence — Runners 007-008 (Tasks 411-560)

#### 5.1 DOC-26..35: 10 Community Deep Dives (150 tasks)
- Indigenous territories (3), Mining towns (3), Port cities (2), Academic centers (2)

### Phase 6: Technology Transfer — Runners 009-010 (Tasks 561-710)

#### 6.1 DOC-36..45: 10 Technology Transfer Documents (150 tasks)
- Aegis-Forge deployment, rare-earth-free scaling, recycling, grid hardening

### Phase 7: Strategic Synthesis — Runner 011 (Tasks 711-860)

#### 7.1 DOC-46..55: 10 Synthesis Documents (150 tasks)
- Steering the current, broker-to-owner transition, venture scaling

#### 7.2 DOC-56..60: Final 5 Strategic Synthesis (75 tasks)
- Master integration, handoff to operations, continuity protocol

### Phase 8: Final Integration — Runner 012 (Tasks 861-900)

#### 8.1 Full pipeline verification (20 tasks)
#### 8.2 Master index completion (10 tasks)
#### 8.3 Final git tag & handoff to operations (10 tasks)

---

## Current Sprint: Phase 0 + Phase 1 (Runner 001)

### Immediate Next Actions (This Session)
1. [ ] Create HEARTBEAT_MAGNETS.md
2. [ ] Create scripts/heartbeat_monitor.py
3. [ ] Create scripts/generate_heuristic_intros.sh
4. [ ] Create scripts/task_timer.py
5. [ ] Create NEXT_runner_001.md
6. [ ] Start heartbeat monitor
7. [ ] Begin DOC-01 research & authoring
8. [ ] Git initial commit

### Blockers
- None identified — all tools and references available

### Decisions Log
- 2026-10-22: Project created at CSMWip/CSMMinesMagnets
- 2026-10-22: 60-doc pipeline defined (3 foundation + 12 brokerage + 45 expanded)
- 2026-10-22: Heuristic framework: Williams, Keymaker, El Segundo, Baker Street, SHIELD
- 2026-10-22: Target: Chile magnetic minerals → Tardigradia → Carrington Storm Motors