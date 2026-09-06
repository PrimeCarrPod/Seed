# INSTRUCTIONS & METHODOLOGY — SubParticlesV4 Creation

## Project Genesis

**Creative Director:** Jason Brodsky (Desktop Support Professional, Comedy Enthusiast, CSM Founder)  
**AI Orchestration:** Kilo (parallel processing, task management, document generation)  
**Deep Research:** Gemini (academic paper synthesis, experimental data compilation)  
**Creative Writing:** GPT (narrative, dialogue, character moments)  
**Version Control:** Git (session branches, incremental commits, audit trail)  
**Logging:** CSMLogs (session tracking, knowledge preservation, quality improvement)

## The Stack
```
Human Creative Director (Jason Brodsky)
    │
    ├── Kilo AI → Orchestration, parallel processing, document generation
    ├── Gemini AI → Deep Research, academic synthesis, experimental data
    ├── GPT → Creative writing, narrative, dialogue
    └── Git Repository → Version control, audit trail, session branches
```

## Discovery Process for Each Document

### Step 1: Source Identification
- Locate V1.0 PDF and V2.0 markdown in `/DeepResearch/SubParticlesV1/`
- Read V2.0 to understand existing depth and structure
- Identify gaps: missing experimental data (2022-2026), missing mathematical formalism, missing one-electron universe integration

### Step 2: Research Augmentation (Gemini)
- Query for 2022-2026 experimental results relevant to topic
- Pull latest lattice QCD, collider data, astrophysical observations
- Compile CODATA 2022, FLAG 2024, PDG 2024 values
- Find theoretical advances: Dyson-Schwinger, AdS/CFT, SMEFT, etc.

### Step 3: V4.0 Structure Design (14 Parts Standard)
```
Part 01: Foundations & Mathematical Framework
Part 02: Field Equations / Core Formalism
Part 03: Spectrum / Solutions / Eigenstates
Part 04: Interactions / Decays / Mixing
Part 05: Effective Field Theory / Low-Energy
Part 06: Renormalization Group / Scale Dependence
Part 07: Lattice / Non-Perturbative / Numerical
Part 08: Collider / Experimental Signatures
Part 09: Precision Tests / Observables
Part 10: Cosmological / Astrophysical Implications
Part 11: Beyond Standard Model / Extensions
Part 12: Theoretical Uncertainties / Open Questions
Part 13: Synthesis / Unified Framework
Part 14: Experimental Roadmap / Future Directions
```

### Step 4: Content Generation (Kilo + Gemini)
- Each part: ~250-350 lines, ~10-15 KB
- Mathematical notation in LaTeX (KaTeX compatible)
- Tables for experimental data, branching ratios, mass spectra
- References section with DOIs, arXiv numbers, years
- One-electron universe perspective integrated in each part

### Step 5: Quality Assurance
- Verify no placeholder text ("TBD", "To be populated", "PLACEHOLDER")
- Check line counts (80-300 lines per document)
- Verify cross-references between parts
- Ensure consistent formatting (headers, tables, equations)

### Step 6: Documentation & Logging
- Log creation in CSMLogs with session ID, branch, timestamp
- Record methodology, sources, decisions
- Update MASTER-TODO-LIST.md

## Special Handling for 4 PDFs Without V2.0

For the 4 PDFs that never received V2.0 treatment:
1. Read the PDF content (via Gemini Deep Research)
2. Design 14-part V4.0 structure from scratch
3. Incorporate all V4.0 standards (depth, math, one-electron universe, 2022-2026 data)
4. Create as if V2.0 never existed — direct V1.0 → V4.0

## LOL_v4_staging Merge Strategy

**Source A: index_v3.html** (working, 34 particles)
- Glueball worldlines (mass 1.7 GeV, J^PC=0^++)
- Swarm mechanics (flocking dynamics)
- Flight controller (Catmull-Rom splines)
- Chart.js metrics (Action, Benevolence, Coherence, Glueball)
- UnrealBloomPass, OrbitControls, EffectComposer

**Source B: tardigradia.html** (working in Android/WebView)
- 18 microbe icons (procedural Canvas API, particle symbols)
- Camera Follow mode (stick to particle, 5s hold, smooth lerp)
- Motion Sensor mode (device accelerometer/gyro via Android bridge)
- Click raycast → detail panel with particle data table
- Android bridge (`LandOLil` interface for native communication)
- 150,000 particle count

**Merge Target: LOL_v4_staging/index_v4.html**
- 34 particle species (all V4.0 particles)
- Microbe icons for all 34 (extended from 18)
- Camera Follow + Motion Sensor + Click Detail
- Android bridge preserved
- Local JS/CSS dependencies (no CDN for offline Android)
- Particle count configurable (200-3000 default, up to 150k)

## TGPU004.htm Design

**Evolution:**
- TGPU00000001.htm → TGPU00000002.htm (V2.0, 18 particles)
- TGPU003.htm (V3.0, 34 particles + glueball + swarm)
- **TGPU004.htm (V4.0, full V4.0 physics integration)**

**V4.0 Features:**
- All 34+ particle species with V4.0 properties
- Glueball worldlines with QCD string tension
- Swarm mechanics with fluid dynamics coupling
- Microbial ecosystem food chain visualization
- One-electron universe worldline topology
- Real-time metrics: Action, Benevolence, Coherence, Glueball energy
- Camera follow, motion sensor, click detail, flight controller
- Android bridge for native deployment
- Local Three.js/Chart.js (offline capable)

## Git Workflow

```
Branch: session/csm-work-in-progress-subparticlesv4-<timestamp>
Commits: Incremental at each milestone
  - Phase 1 complete (Glueball V4.0 Parts 11-14)
  - Phase 2A complete (33 upgrades)
  - Phase 2B complete (4 PDFs)
  - Phase 3 complete (LOL_v4_staging)
  - Phase 4 complete (TGPU004.htm)
  - Phase 5 complete (index_v4.html)
  - Phase 6 complete (CREDITS.md)
  - Phase 7 complete (Final push)
```

## Credits Compilation

Throughout creation, maintain running list in `CREDITS_DRAFT.md`:
- Every referenced paper → authors credited
- Every experimental collaboration → collaboration credited
- Every theoretical framework → originators credited
- Every software library → maintainers credited
- Every AI tool → developers credited
- Human creative director → Jason Brodsky

Final `CREDITS.md` generated at project completion.

---

*Methodology documented for transparency and reproducibility. Every document traces back to this process.*