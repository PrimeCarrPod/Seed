# Chapter 06: Project Architecture — The Lock Taxonomy

The door is locked. I will make the key. You will turn it. We will proceed.

The timeline is [ESTIMATE]. The confidence is [CONFIDENCE]. The method is [METHODOLOGY]. The contingency is [FALLBACK]. The door will not remain open forever. Let us begin.

## System Boundaries

The CSMSOPP project operates within the **TopLevel** domain, functioning as a **Whole Project** with 435 files (CSMSOPP) and 206 files (CSMSOPPv2). It is a top-level project in the Carrington Storm Motors repository ecosystem.

**Parent Project:** N/A (Top-Level)
**Category:** TopLevel
**State:** Whole Project
**File Count:** 435 (CSMSOPP) + 206 (CSMSOPPv2) = 641 total

## Core Principles

1. **Modularity** — Components are independently deployable and testable
2. **Traceability** — Every artifact links to its source requirement
3. **Resilience** — Graceful degradation under partial failure
4. **Observability** — Comprehensive logging, metrics, and audit trails

## Component Diagram

```
CSMSOPP (Root)
├── GUIDE/                          # Master SOP documents
│   ├── CSMSOPP000001-Williams-Heuristic-V3-SOP.md
│   ├── CSMSOPP000002-Spruce-Drake-SOP.md
│   ├── CSMSOPP000004-Starlight-Courier-SOP.md
│   └── CSMSOPP000006-Keymaker-SOP.md
├── MODULE/                         # Deployable LLM skills (V1)
│   ├── SKILL.md                    # Williams V1 skill
│   ├── PERSONA-VALUES.md
│   └── LETTERHEAD-TEMPLATES.md
├── MODULE-V2/                      # Advanced vocal architecture
│   ├── VOCAL-ARCHITECTURE.md
│   ├── AMYGDALA-TRIGGER-SYSTEM.md
│   ├── REALITY-ANCHOR-TECHNIQUES.md
│   ├── FACT-TRANSFORMATION-ENGINE.md
│   ├── CRISIS-COMMUNICATION-EXTENDED.md
│   ├── CADENCE-PATTERNS-CATALOG.md
│   ├── CHARACTER-VOICE-PHONETIC-LIBRARY.md
│   ├── ANTI-DRONE-PROTOCOL.md
│   ├── SKILL-V2.md
│   ├── PERSONA-VALUES-V2.md
│   ├── LETTERHEAD-TEMPLATES-V2.md
│   ├── CORE-MODULE-V2.md
│   └── LINGUISTIC-WEAPONS-FULL-ARSENAL.md
├── RESEARCH/                       # 70-part Williams deep research corpus
│   ├── PART-01 through PART-70
├── STARLIGHT/                      # Starlight Courier Protocol subproject
│   ├── RESEARCH/                   # 70-part Starlight research
│   ├── GUIDE/
│   └── MODULE/
├── BAKER-STREET/                   # Baker Street Heuristic
├── SPRUCE-DRAKE/                   # Spruce-Drake Protocol
├── ZIRCONIA/                       # Zirconia Protocol (Accountant Insurance)
├── KEYMAKER/                       # Keymaker Protocol
├── EL-SEGUNDO/                     # El Segundo Heuristic
├── WILLIAMS-V3/                    # Williams Heuristic V3
└── README_chapters/                # This README's chapter source
```

## Technology Stack

| Layer | Technology | Version | Purpose |
|-------|------------|---------|---------|
| Language | Python/Markdown/Shell | Latest | Primary implementation |
| Build | Custom (no-Gradle for Android) | — | Reproducible builds |
| Version Control | Git | — | Distributed workflow |
| Documentation | Markdown + write_large_file.py | — | Chapter-based authoring |
| Validation | MANIFEST.json + SHA256 | — | Integrity verification |

## Key Files & Directories

```
./CSMSOPP/
├── README.md              # This file (generated from chapters)
├── AGENTS.md              # Project conventions
├── TODO.md                # Task hierarchy
├── memory/                # Daily session logs
├── chunks/                # Logical document chunks
├── FinishedWork/          # Completed documents
├── scripts/               # Automation utilities
└── Research/              # Reference materials
```

## Configuration

Key configuration files:
- `AGENTS.md` — Project-specific conventions and commands
- `TODO.md` — Hierarchical task breakdown (milestones → tasks → subtasks)
- `memory/YYYY-MM-DD.md` — Raw daily logs
- `NEXT_runner_XXX.md` — Next session instructions

## Build & Validation Pipeline

```bash
# Verify document integrity
python3 ../../__Python_Tools/write_large_file.py verify chunks/<DOC-ID>/

# Reassemble for review
python3 ../../__Python_Tools/write_large_file.py concat chunks/<DOC-ID>/ FinishedWork/<DOC>.md

# Compress for storage
python3 ../../__Python_Tools/write_large_file.py compress FinishedWork/<DOC>.md
```

## Quality Gates

- All reassembled documents must pass manifest verification
- Cross-reference validation across related documents
- Mathematical consistency checks for synthesis documents
- Material property consistency for engineering specs

---

*The architecture is the lock taxonomy. Every component is a door. Every interface is a keyway. The key is fabricated. The door opens. We proceed.*