# Aegis Outfit Fabricator — Consolidated Specification Set

Renaissance textile engineering specifications for the Aegis Outfit Fabricator:
historical European court dress (1600-1700 CE) engineered to AIMES-DSV equivalent
protective performance across eight editions (RM/RW × TS/TG/SS/SG), a twelve-layer
protective stack, and twelve LES tension zones (1,152 unique parameter sets).

This folder is the **final product set** for the project. It contains the
specification documents, the research inputs they derive from, the master equation
compendium, and the tooling to assemble and verify them. Working material from the
source folder (runner handoffs, heartbeat scripts, session logs, remediation
checklists, duplicated fragmentation) is intentionally not carried over.

- **56 product documents**: 44 `DOC-*` specifications, 4 `MAT-*` material specs,
  3 `SYNTH-*` synthesis documents, 5 `DRAFT-*` drafting kernels, plus 2 `RESEARCH-*`
  inputs.
- **36 of 56** documents pass all five source quality gates. The other 20 fail on
  formula density (14) or cross-reference density (8); none fail on length,
  standards, or conflation.
- **Four declared specifications were never authored**: DOC-41, DOC-43, DOC-45,
  DOC-47. **DOC-14 is missing piece 7.** Both are detailed in
  [SCOPE_GAPS.md](SCOPE_GAPS.md).

## Layout

```
12_AegisOutfitFabricatorConsolidated/
├── README.md                        # this file
├── AGENTS.md                        # working conventions for this folder
├── SCOPE_GAPS.md                    # scope evaluation and gate status
├── MANIFEST.sha256                  # SHA-256 of every file in this folder
├── specifications/
│   ├── core_architecture/           # DOC-01..DOC-10  system .. deployment
│   ├── edition_specifications/      # DOC-11..DOC-20  eight editions, matrix, deltas
│   │   └── chapters/DOC-xx/         # one file per authored piece
│   ├── threat_protection/           # DOC-21..DOC-30  ballistic .. AI/autonomy
│   ├── integration_sustainment/     # DOC-31..DOC-48  manufacturing .. training
│   ├── materials/                   # MAT-01..MAT-04
│   ├── synthesis/                   # SYNTH-01..SYNTH-03
│   └── draft_kernels/               # DRAFT-01..DRAFT-05
├── research/                        # RESEARCH-01 dress construction, RESEARCH-02 stitching
├── compendium/
│   ├── EQUATIONSCOMPLETE_Master_Compendium.md   # all 60 numbered documents in one file
│   └── parts/                       # the same compendium split per document
├── deliverables/
│   └── MASTER_SPECIFICATION.md      # built by tools/assemble.sh
└── tools/
    ├── assemble.sh                  # rebuild the deliverable
    ├── make_manifest.sh             # regenerate MANIFEST.sha256
    ├── verify.sh                    # manifest check + quality-gate report
    ├── quality_gates.js             # gate report driver (--markdown supported)
    ├── quality_gates_doc.js         # per-document measurement
    ├── conflation_scan.js           # explains conflation-flag hits
```

Every product and compendium `.md` has a `.gz` twin for storage; both are covered by the
manifest. The generated deliverable and `MANIFEST.sha256` itself are the only files
without a twin.

## Document map

| ID | Title | Lines | Folder |
|----|-------|-------|--------|
| DOC-01 | Executive Summary & System Architecture | 371 | core_architecture |
| DOC-02 | Historical Context & Design Philosophy | 374 | core_architecture |
| DOC-03 | Material Systems Integration | 381 | core_architecture |
| DOC-04 | Geometric Pattern System | 356 | core_architecture |
| DOC-05 | Structural Framework Specification | 326 | core_architecture |
| DOC-06 | Protective Layer Architecture | 508 | core_architecture |
| DOC-07 | Textile Engineering Specification | 561 | core_architecture |
| DOC-08 | Manufacturing Process Plan | 466 | core_architecture |
| DOC-09 | Quality Assurance & Testing Protocol | 561 | core_architecture |
| DOC-10 | Deployment & Operational Procedures | 700 | core_architecture |
| DOC-11 | RenaissanceMan Tall-Skinny (RM-TS) Edition | 4,601 | edition_specifications |
| DOC-12 | RenaissanceMan Tall-Girthy (RM-TG) Edition | 4,760 | edition_specifications |
| DOC-13 | RenaissanceMan Short-Skinny (RM-SS) Edition | 8,604 | edition_specifications |
| DOC-14 | RenaissanceMan Short-Girthy (RM-SG) Edition | 5,107 | edition_specifications |
| DOC-15 | RenaissanceWoMan Tall-Skinny (RW-TS) Edition | 3,201 | edition_specifications |
| DOC-16 | RenaissanceWoMan Tall-Girthy (RW-TG) Edition | 6,167 | edition_specifications |
| DOC-17 | RenaissanceWoMan Short-Skinny (RW-SS) Edition | 6,158 | edition_specifications |
| DOC-18 | RenaissanceWoMan Short-Girthy (RW-SG) Edition | 6,202 | edition_specifications |
| DOC-19 | Cross-Edition Compatibility Matrix | 4,487 | edition_specifications |
| DOC-20 | Edition Delta Tables | 4,165 | edition_specifications |
| DOC-21 | Ballistic Protection | 550 | threat_protection |
| DOC-22 | Thermal/Fire Protection | 497 | threat_protection |
| DOC-23 | Electrical/GIC Protection | 497 | threat_protection |
| DOC-24 | Chemical/Bio Protection | 324 | threat_protection |
| DOC-25 | Directed Energy Protection | 494 | threat_protection |
| DOC-26 | Blast/Fragmentation Protection | 579 | threat_protection |
| DOC-27 | Environmental Seal | 558 | threat_protection |
| DOC-28 | Power & Thermal Management | 704 | threat_protection |
| DOC-29 | Sensor Suite Integration | 703 | threat_protection |
| DOC-30 | AI/Autonomy Core | 698 | threat_protection |
| DOC-31 | Manufacturing Integration | 527 | integration_sustainment |
| DOC-32 | Quality Assurance | 530 | integration_sustainment |
| DOC-33 | Deployment Integration | 974 | integration_sustainment |
| DOC-34 | Maintenance & Sustainment | 677 | integration_sustainment |
| DOC-35 | Logistics & Supply Chain | 534 | integration_sustainment |
| DOC-36 | Training & Certification | 442 | integration_sustainment |
| DOC-37 | Human Factors & Ergonomics | 418 | integration_sustainment |
| DOC-38 | Medical Integration | 452 | integration_sustainment |
| DOC-39 | Cyber/Information Operations | 521 | integration_sustainment |
| DOC-40 | Test & Evaluation | 446 | integration_sustainment |
| DOC-41 | Program Management | — | **not authored** (compendium stub only) |
| DOC-42 | Configuration Management | 550 | integration_sustainment |
| DOC-43 | System Safety | — | **not authored** (compendium stub only) |
| DOC-44 | Data Management | 516 | integration_sustainment |
| DOC-45 | Supportability / PBL | — | **not authored** (compendium stub only) |
| DOC-46 | ESOH | 541 | integration_sustainment |
| DOC-47 | Cyber Survivability & EMC | — | **not authored** (compendium stub only) |
| DOC-48 | Training Systems & Simulation Integration | 518 | integration_sustainment |
| MAT-01 | Silk Fibroin Engineering Specification | 318 | materials |
| MAT-02 | Structural Foundation Materials | 950 | materials |
| MAT-03 | Protective Layer Integration | 399 | materials |
| MAT-04 | Cross-Property Validation Matrix | 774 | materials |
| SYNTH-01 | Unified Historical-Modern Textile Engineering Theory | 413 | synthesis |
| SYNTH-02 | Protective Layer Adaptation (AIMES → Renaissance) | 442 | synthesis |
| SYNTH-03 | Geometric Drafting Kernel Specification | 651 | synthesis |
| DRAFT-01 | Alcega Developable Surface Engine | 757 | draft_kernels |
| DRAFT-02 | Garsault Proportional Scaling System | 345 | draft_kernels |
| DRAFT-03 | Pleating Kernel | 689 | draft_kernels |
| DRAFT-04 | Farthingale/Pannier Hoop Architecture | 874 | draft_kernels |
| DRAFT-05 | Zero-Waste Nesting Optimizer | 748 | draft_kernels |

## Reading order

1. [DOC-01](specifications/core_architecture/DOC-01_executive_summary_system_architecture.md) — mission, editions, mass budget, layer stack.
2. `SYNTH-01..03` and `MAT-01..04` — theory and material basis.
3. `DRAFT-01..05` — patterning kernels (Alcega, Garsault, pleating, hoops, nesting).
4. `DOC-02..10` — historical context through deployment.
5. `DOC-11..20` — the eight edition books, compatibility matrix, delta tables.
6. `DOC-21..30` — threat-by-threat protection subsystems.
7. `DOC-31..48` — manufacturing, sustainment, program integration, training systems.
8. [compendium](compendium/EQUATIONSCOMPLETE_Master_Compendium.md) — everything above in one file.

## How the edition documents are stored

`DOC-11` through `DOC-20` were authored as numbered pieces that the source pipeline
concatenated into one rolled-up file. In this folder:

- `specifications/edition_specifications/chapters/<DOC>/NN_<title>.md` — one file per
  authored piece. These are the canonical text for assembling.
- `specifications/edition_specifications/<DOC>_<slug>.md` — the ordered roll-up of the
  same pieces, provided for reading.

For DOC-13, DOC-14 and DOC-15 the source had two conflicting assemblies. The roll-ups
and chapters here were rebuilt from the **union of both**, keeping the longest body for
each piece number and ordering pieces 01..NN. Pieces that exist only in the older
assembly are marked with an HTML comment such as
`<!-- restored from original assembly: piece 11 (...) -->`.

`tools/assemble.sh` uses the chapter files for these ten documents and the single file
for every other document, so each section appears exactly once in the deliverable.

## Build and verify

```bash
cd CSMWip/12_AegisOutfitFabricatorConsolidated

# rebuild the single-file deliverable from the product files
bash tools/assemble.sh

# verify checksums and print the quality-gate table
bash tools/verify.sh

# just the gate table (plain or markdown)
node tools/quality_gates.js
node tools/quality_gates.js --markdown

# explain conflation-flag hits for a document
node tools/conflation_scan.js specifications/threat_protection/DOC-21_ballistic_protection_specification.md

# regenerate checksums after editing any file
bash tools/make_manifest.sh
```

`verify.sh` exits non-zero only on a checksum mismatch; gate failures are reported for
information because this folder is a snapshot of authored work.
