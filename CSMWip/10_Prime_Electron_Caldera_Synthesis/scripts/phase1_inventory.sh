#!/bin/bash
# Phase 1: Document Inventory & Mapping
# Project 10: Prime Electron Caldera Synthesis
# Run from: CSMWip/10_Prime_Electron_Caldera_Synthesis/

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CALDERA_DIR="$PROJECT_DIR/Caldera_Prime_Pi_Electron"
SECTIONS_DIR="$CALDERA_DIR/sections"
PIECES_DIR="$CALDERA_DIR/pieces"
COMPILATIONS_DIR="$CALDERA_DIR/framework/compilations"

echo "=========================================="
echo "PHASE 1: Document Inventory & Mapping"
echo "Project 10: Prime Electron Caldera Synthesis"
echo "=========================================="
echo ""

# 1. Verify Caldera framework completeness
echo ">>> Verifying Caldera framework assets..."
echo ""

# Count section masters
SECTION_COUNT=$(ls "$SECTIONS_DIR"/Section_*_Axiomatic_Foundation.md "$SECTIONS_DIR"/Section_*_Causal_Geometry.md "$SECTIONS_DIR"/Section_*_SJ_Vacuum_QFT.md "$SECTIONS_DIR"/Section_*_Topological_Graph_Invariants.md "$SECTIONS_DIR"/Section_*_Spinor_Double_Covers.md "$SECTIONS_DIR"/Section_*_Riemann_Zeros_Chaos.md "$SECTIONS_DIR"/Section_*_Spectral_Form_Factors.md "$SECTIONS_DIR"/Section_*_Noncommutative_Geometry.md "$SECTIONS_DIR"/Section_*_p_adic_AdS_CFT.md "$SECTIONS_DIR"/Section_*_Gauge_Couplings.md "$SECTIONS_DIR"/Section_*_Unified_Synthesis.md "$SECTIONS_DIR"/Section_*_Mathematical_Compendium.md 2>/dev/null | wc -l)
echo "Section masters found: $SECTION_COUNT (expected: 12)"

# Count COMBINED_INTRO files
COMBINED_INTRO_COUNT=$(ls "$SECTIONS_DIR"/*_COMBINED_INTRO.md 2>/dev/null | wc -l)
echo "COMBINED_INTRO files: $COMBINED_INTRO_COUNT (expected: 12)"

# Count individual intros (williams, keymaker, elsegundo)
WILLIAMS_COUNT=$(ls "$SECTIONS_DIR"/*_intro_williams.md 2>/dev/null | wc -l)
KEYMAKER_COUNT=$(ls "$SECTIONS_DIR"/*_intro_keymaker.md 2>/dev/null | wc -l)
ELSEGUNDO_COUNT=$(ls "$SECTIONS_DIR"/*_intro_elsegundo.md 2>/dev/null | wc -l)
TOTAL_INDIVIDUAL_INTROS=$((WILLIAMS_COUNT + KEYMAKER_COUNT + ELSEGUNDO_COUNT))
echo "Individual intros - Williams: $WILLIAMS_COUNT, Keymaker: $KEYMAKER_COUNT, El Segundo: $ELSEGUNDO_COUNT (expected: 12 each = 36 total)"
echo "Total intro files: $((COMBINED_INTRO_COUNT + TOTAL_INDIVIDUAL_INTROS)) (expected: 48)"

# Count piece files
PIECE_COUNT=$(ls "$PIECES_DIR"/*.md 2>/dev/null | wc -l)
echo "Piece files (*.md): $PIECE_COUNT (expected: 156)"

# Count zip archives
ZIP_COUNT=$(ls "$PIECES_DIR"/*_pieces.zip 2>/dev/null | wc -l)
echo "Zip archives: $ZIP_COUNT (expected: 12+)"

# Count compilations
COMPILATION_COUNT=$(ls "$COMPILATIONS_DIR"/*.md 2>/dev/null | wc -l)
echo "Compilation documents: $COMPILATION_COUNT (expected: 4)"

echo ""
echo ">>> Inventorying Canonical articles across 9 domains (A–I)..."
echo ""

# Count Canonical articles per domain
for domain in A_Article B_Article C_Article D_Article E_Article F_Article G_Article H_Article I_Article; do
    COUNT=$(find "$PROJECT_DIR" -maxdepth 1 -type d -name "${domain}*" 2>/dev/null | wc -l)
    echo "  $domain: $COUNT directories"
done

echo ""
echo ">>> Creating section-to-article mapping matrix..."
cat > "$PROJECT_DIR/SECTION_TO_ARTICLE_MAP.md" <<'MAPEOF'
# Section-to-Article Mapping Matrix
**Project 10: Caldera Prime Pi Electron Incorporation**
**Generated:** $(date -u +"%Y-%m-%d %H:%M:%S UTC")

| Caldera Section | Title | Canonical Domain | Target Article(s) | Status |
|-----------------|-------|------------------|-------------------|--------|
| 01 | π(x) Axiomatic Foundation | A (Worldline) | A_Article01_Worldline, A_Article02_CausalGeometry | ⏳ |
| 02 | Discrete Causal Geometry | A (Worldline) | A_Article01_Worldline, A_Article02_CausalGeometry | ⏳ |
| 03 | SJ Vacuum & QFT | C (HilbertSpace) | C_Article03_HilbertSpace, C_Article13-32 | ⏳ |
| 04 | Topological Graph Invariants | A (Worldline) | A_Article20-22_Worldline | ⏳ |
| 05 | Spinor Double Covers | C (HilbertSpace) | C_Article01_HilbertSpace, C_Article03_HilbertSpace | ⏳ |
| 06 | Riemann Zeros & Chaos | F (Transcendent) | F_Article01-40_TranscendentPhysics | ⏳ |
| 07 | SFF & Holographic Wormholes | F (Transcendent) | F_Article01-40_TranscendentPhysics | ⏳ |
| 08 | NCG, Bost-Connes & Adeles | C (HilbertSpace) | C_Article03_HilbertSpace, C_Article13-32 | ⏳ |
| 09 | p-adic AdS/CFT & Adelic Bulk | F (Transcendent) | F_Article01-40_TranscendentPhysics | ⏳ |
| 10 | Gauge Couplings, Koide & 426-Gen | D (Couplings) | D_Article04_Couplings, D_Article10-40 | ⏳ |
| 11 | Unified Synthesis | All domains | Cross-cutting → S_Article01_Synthesis (NEW) | ⏳ |
| 12 | Mathematical Compendium | All domains | Reference → R_Article01_MathCompendium (NEW) | ⏳ |
| 13 | Master Integration | — | New master doc | ⏳ |

MAPEOF

echo "Mapping matrix created: $PROJECT_DIR/SECTION_TO_ARTICLE_MAP.md"
echo ""
echo ">>> Phase 1 Complete. Ready for Phase 2."
echo "=========================================="