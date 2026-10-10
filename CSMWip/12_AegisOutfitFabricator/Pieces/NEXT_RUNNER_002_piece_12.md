## 📋 NEXT_RUNNER_003 TEMPLATE — SESSION 003 PREPARATION

```markdown
# AegisOutfitFabricator NEXT_RUNNER_003 — PHASE 3: GEOMETRIC PATTERN DRAFTING SYSTEM
**Project:** AegisOutfitFabricator — Historical Renaissance Protective Outfit Fabrication System  
**Session Target:** Complete Geometric Drafting Kernel → Begin Core 50 Document Production (Batch 1)  
**Branch:** `kilo/aegis-outfit-fabricator-wip`  
**Created:** 2026-10-10 (template)  
**Depends On:** MAT-01, MAT-02, MAT-03, MAT-04 complete and verified

---

## 🚀 SESSION 003 — BOOTSTRAP CHECKLIST

### 0. Pre-Session Verification
```bash
cd /workspace/app/CSMWip/12_AegisOutfitFabricator
./Framework/heartbeat.sh "Session 003 start - Phase 3 Geometric Drafting"

# Verify MAT documents exist and passed quality
ls -la FinishedWork/MAT-*.md
./Framework/check_doc_quality.sh FinishedWork/MAT-01_Silk_Fibroin_Engineering_Spec.md
./Framework/check_doc_quality.sh FinishedWork/MAT-02_Structural_Foundation_Materials.md
./Framework/check_doc_quality.sh FinishedWork/MAT-03_Protective_Layer_Integration.md
./Framework/check_doc_quality.sh FinishedWork/MAT-04_Cross_Property_Validation_Matrix.md

# Verify GitHub pieces
ls -la Pieces/MAT-01* Pieces/MAT-02* Pieces/MAT-03* Pieces/MAT-04*
```

### 1. Git Sync
```bash
git fetch origin
git status
# Should be clean, up to date with origin/kilo/aegis-outfit-fabricator-wip
```

### 2. Source Handler
```bash
source /workspace/app/CSMScripts/freenemo_modules/00_core_config.sh
source /workspace/app/CSMScripts/freenemo_modules/03_github_handler.sh
gh_init
```

---

## 🎯 PHASE 3: GEOMETRIC PATTERN DRAFTING — 5 ALGORITHM SPECIFICATIONS

### DRAFT-01: Alcega Developable Surface Engine
**Input:** Anthropometric measurements (bust, waist, hip, shoulder, back length, neck, arm scye, sleeve length, wrist)
**Algorithm:**
1. Define directrix curves from body landmarks (parametric splines)
2. Compute generatrix rulings: planes tangent to pairs of directrices
3. Intersect developable surfaces with 560mm loom width planes
4. Output flat pattern pieces with grain lines, seam allowances (13-40mm per ASTM D1683)
**Math:** Convolute surface S(u,v) = D₁(u) + v(D₂(u) - D₁(u))/|D₂(u) - D₁(u)|
**Output:** Pattern pieces in DXF/SVG + cutting layout

### DRAFT-02: Garsault Proportional Scaling System
**Input:** Base pattern (from DRAFT-01) + target measurements per edition
**Algorithm:** Scaled paper strip → dynamic affine + non-linear correction per panel
**Output:** Edition-specific patterns (TS, TG, SS, SG for RM & RW = 8 total)
**Math:** x' = s_x × x + f_curvature(x,y), y' = s_y × y + f_curvature(x,y)

### DRAFT-03: Pleating Kernel (Watteau Back + Cartridge)
**Watteau Back:** Double box pleat, 3:1 compression ratio, depth = (unpleated - target)/3
**Cartridge Pleating:** S-curve parametric x(t) = A·sin(ωt), y(t) = B·t, perpendicular force alignment
**Load Distribution:** F_pleat = F_total / N_pleats, stress diffusion at anchor points
**Output:** Pleat geometry parameters per panel per edition

### DRAFT-04: Farthingale/Pannier Hoop Architecture
**Hoop Geometry:** Concentric ellipses, moment of inertia I = π(R⁴-r⁴)/4
**Tape Suspension:** Catenary curve y(x) = a cosh(x/a) under load, tension distribution
**Collapse Mechanism:** Nested hoop folding, deployment kinematics
**Output:** Hoop specs, tape routing, deployment sequence per edition

### DRAFT-05: Zero-Waste Nesting Optimizer
**Input:** Pattern pieces + 560mm loom width
**Algorithm:** Guillotine cutting + simulated annealing for optimal packing
**Output:** Cutting plan with <5% waste, offcut catalog for Phoenix Protocol

---

## 🎯 PHASE 4 BATCH 1: CORE DOCUMENTS (DOC-01 to DOC-05)

| Doc ID | Title | Dependencies | Est. Lines |
|--------|-------|--------------|------------|
| DOC-01 | Executive Summary | SYNTH-01,02,03, MAT-01-04 | 300+ |
| DOC-02 | System Architecture | DOC-01, CSMFAB078 §1-3 | 300+ |
| DOC-03 | Research Synthesis Summary | SYNTH-01,02,03 | 300+ |
| DOC-04 | Material Spec Bridge | MAT-01,02,03,04 | 300+ |
| DOC-05 | Geometric Drafting Kernel | DRAFT-01,02,03,04,05 | 300+ |

---

## ⏱️ SESSION 003 TIME BOXING

| Time Block | Activity | Duration |
|------------|----------|----------|
| 0:00-0:15 | Resume verification, heartbeat, quality check MAT docs | 15 min |
| 0:15-1:15 | Write DRAFT-01 (Alcega Developable Surface) | 1 hour |
| 1:15-1:30 | Pipeline: split, push, verify DRAFT-01 | 15 min |
| 1:30-2:30 | Write DRAFT-02 (Garsault Scaling) | 1 hour |
| 2:30-2:45 | Pipeline: split, push, verify DRAFT-02 | 15 min |
| 2:45-3:00 | Break / heartbeat | 15 min |
| 3:00-4:00 | Write DRAFT-03 (Pleating Kernel) | 1 hour |
| 4:00-4:15 | Pipeline: split, push, verify DRAFT-03 | 15 min |
| 4:15-5:15 | Write DRAFT-04 (Hoop Architecture) | 1 hour |
| 5:15-5:30 | Pipeline: split, push, verify DRAFT-04 | 15 min |
| 5:30-5:45 | Break / heartbeat | 15 min |
| 5:45-6:45 | Write DRAFT-05 (Zero-Waste Nesting) | 1 hour |
| 6:45-7:00 | Pipeline: split, push, verify DRAFT-05 | 15 min |
| 7:00-7:30 | Begin DOC-01 (Executive Summary) | 30 min |
| 7:30-7:45 | Pipeline: split, push, verify DOC-01 | 15 min |
| 7:45-8:00 | Session log, create NEXT_RUNNER_004 | 15 min |

**Total: ~8 hours** — 5 DRAFT specs + 1 DOC through pipeline