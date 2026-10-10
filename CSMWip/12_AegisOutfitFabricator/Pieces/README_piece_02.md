## 4.1 Fabricator Chain Topology

```
┌─────────────────────────────────────────────────────────────────┐
│                    AEGIS OUTFIT FABRICATOR                       │
├─────────────────────────────────────────────────────────────────┤
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────────┐  │
│  │   RESEARCH  │→ │  SYNTHESIS  │→ │   MATERIAL SPEC BRIDGE  │  │
│  │  (2 docs)   │  │  (3 SYNTH)  │  │    (4 MAT docs)         │  │
│  └─────────────┘  └─────────────┘  └─────────────────────────┘  │
│         │                │                       │               │
│         ▼                ▼                       ▼               │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │           GEOMETRIC DRAFTING KERNEL (5 DRAFT)           │   │
│  │  Alcega Developable Surfaces + Garsault Proportional +  │   │
│  │  Pleating Kernel + Farthingale Hoop + Zero-Waste Nest  │   │
│  └─────────────────────────────────────────────────────────┘   │
│         │                                                    │   │
│         ▼                                                    │   │
│  ┌─────────────┐  ┌─────────────┐  ┌─────────────────────────┐  │
│  │ CORE 50 DOCS│  │ RM 50 DOCS  │  │ RW 50 DOCS              │  │
│  │ (Architecture,│  │ (4 editions ×│  │ (4 editions ×          │  │
│  │  Specs, Tests,│  │  mechanical + │  │  mechanical +         │  │
│  │  Fabrication) │  │  5 img prompt)│  │  5 img prompt)        │  │
│  └─────────────┘  └─────────────┘  └─────────────────────────┘  │
│         │                │                       │               │
│         └────────────────┼───────────────────────┘               │
│                          ▼                                      │
│  ┌─────────────────────────────────────────────────────────┐   │
│  │           DOCUMENT PRODUCTION PIPELINE                   │   │
│  │  Author → Split(13) → Zip → GitHub(17-way) → Reassemble │   │
│  │         → FinishedWork (forensically clean)              │   │
│  └─────────────────────────────────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────┘
```

## 4.2 Data Flow

```
Research Docs (2)
    │
    ▼
Synthesis Docs (3) ──→ Material Specs (4) ──→ Drafting Kernel (5)
    │                                           │
    │                    ┌──────────────────────┘
    ▼                    ▼
Core 50 ←───────── RM 50 ←───────── RW 50
    │                    │                    │
    └────────────────────┼────────────────────┘
                         ▼
            ┌───────────────────────┐
            │  GitHub Handler       │
            │  (13 strategies,      │
            │   auto-split,         │
            │   merge queue)        │
            └───────────────────────┘
                         │
                         ▼
            ┌───────────────────────┐
            │  Pieces/ (13 per doc) │
            │  Zips/ (1 per doc)    │
            │  FinishedWork/ (150)  │
            └───────────────────────┘
```

## 4.3 Edition Mapping: AIMES LES → Renaissance Editions

| AIMES Edition | RenaissanceMan | RenaissanceWoMan | Key Adaptations |
|---------------|----------------|------------------|-----------------|
| LE-TS | RM-TS | RW-TS | Tall, narrow frame; minimal ceramic tiles |
| LE-TG | RM-TG | RW-TG | Tall, broad frame; expanded torso/thigh tiles |
| LE-SS | RM-SS | RW-SS | Short, narrow frame; reduced tile count |
| LE-SG | RM-SG | RW-SG | Short, broad frame; widened torso, shorter limbs |

**Tile Count Scaling** (ceramic-gilded decorative elements):
- RM-TS: 42 outer + 42 inner | RM-TG: 56 + 56 | RM-SS: 36 + 36 | RM-SG: 48 + 48
- RW editions: Additional stays tiles, farthingale hoop tiles, coif tiles

---

# 5. DOCUMENT PRODUCTION PIPELINE

## 5.1 Pipeline Overview

**Every document follows this exact sequence:**

```
┌────────────────────────────────────────────────────────────────┐
│                    DOCUMENT LIFECYCLE                          │
├────────────────────────────────────────────────────────────────┤
│                                                                │
│  1. AUTHOR                                                     │
│     Write complete document in FinishedWork/                  │
│     Target: 300+ lines, dense technical content               │
│                                                                │
