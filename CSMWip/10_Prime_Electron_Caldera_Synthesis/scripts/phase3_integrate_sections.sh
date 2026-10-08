#!/bin/bash
# Phase 3: Integrate Caldera Sections into Canonical Article Structure
# Project 10: Prime Electron Caldera Synthesis
# Run from: CSMWip/10_Prime_Electron_Caldera_Synthesis/

set -euo pipefail

PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CALDERA_SECTIONS="$PROJECT_DIR/Caldera_Prime_Pi_Electron/sections"
CALDERA_PIECES="$PROJECT_DIR/Caldera_Prime_Pi_Electron/pieces"

echo "=========================================="
echo "PHASE 3: Integrate Caldera Sections into Articles"
echo "Project 10: Prime Electron Caldera Synthesis"
echo "=========================================="
echo ""

# Section-to-Article mapping
declare -A SECTION_MAP=(
    ["01"]="A_Article01_Worldline"
    ["02"]="A_Article02_CausalGeometry"
    ["03"]="C_Article03_HilbertSpace"
    ["04"]="A_Article20_Worldline"
    ["05"]="C_Article01_HilbertSpace"
    ["06"]="F_Article01_TranscendentPhysics"
    ["07"]="F_Article01_TranscendentPhysics"
    ["08"]="C_Article03_HilbertSpace"
    ["09"]="F_Article01_TranscendentPhysics"
    ["10"]="D_Article04_Couplings"
    ["11"]="S_Article01_Synthesis"
    ["12"]="R_Article01_MathCompendium"
)

# Section-to-piece-prefix mapping (Caldera pieces use different naming)
declare -A PIECE_PREFIX=(
    ["01"]="article1_A1-01"
    ["02"]="article1_A1-02"
    ["03"]="article2_A2-01"
    ["04"]="article2_A2-12"
    ["05"]="article3_A3-01"
    ["06"]="article4_A4-01"
    ["07"]="article5_A5-01"
    ["08"]="article6_A6-07"
    ["09"]="article7_A7-08"
    ["10"]="article8_A8-09"
    ["11"]="article9_A9-10"
    ["12"]="article1_A1-11"
)

# Article titles for README
declare -A SECTION_TITLES=(
    ["01"]="π(x) Axiomatic Foundation"
    ["02"]="Discrete Causal Geometry"
    ["03"]="SJ Vacuum & QFT"
    ["04"]="Topological Graph Invariants"
    ["05"]="Spinor Double Covers"
    ["06"]="Riemann Zeros & Chaos"
    ["07"]="SFF & Holographic Wormholes"
    ["08"]="NCG, Bost-Connes & Adeles"
    ["09"]="p-adic AdS/CFT & Adelic Bulk"
    ["10"]="Gauge Couplings, Koide & 426-Gen"
    ["11"]="Unified Synthesis"
    ["12"]="Mathematical Compendium"
)

echo ">>> Integrating 12 Caldera sections into Canonical article structure..."
echo ""

for sec in {01..12}; do
    target="${SECTION_MAP[$sec]}"
    title="${SECTION_TITLES[$sec]}"
    piece_prefix="${PIECE_PREFIX[$sec]}"
    
    # Previous/Next section (avoid octal interpretation)
    prev_sec=$(printf "%02d" $((10#$sec - 1)))
    next_sec=$(printf "%02d" $((10#$sec + 1)))
    
    echo "--- Processing Section $sec: $title -> $target ---"
    
    # Create directory structure with section subdirectories to avoid conflicts
    mkdir -p "$PROJECT_DIR/$target/section_${sec}"/{full,pieces,zip,intros}
    
    # 1. Copy section master (with COMBINED_INTRO prepended)
    echo "  Copying section master..."
    cp "$CALDERA_SECTIONS/Section_${sec}_"*.md "$PROJECT_DIR/$target/section_${sec}/full/" 2>/dev/null || true
    
    # 2. Copy piece files (13 pieces)
    echo "  Copying 13 piece files (prefix: $piece_prefix)..."
    cp "$CALDERA_PIECES/${piece_prefix}_piece_"*.md "$PROJECT_DIR/$target/section_${sec}/pieces/" 2>/dev/null || true
    
    # Count pieces copied
    PIECE_COUNT=$(ls "$PROJECT_DIR/$target/section_${sec}/pieces/"*.md 2>/dev/null | wc -l)
    echo "    Pieces copied: $PIECE_COUNT"
    
    # 3. Copy zip archive
    echo "  Copying zip archive..."
    cp "$CALDERA_PIECES/${piece_prefix}_pieces.zip" "$PROJECT_DIR/$target/section_${sec}/zip/" 2>/dev/null || true
    
    # 4. Copy intro files (4 files)
    echo "  Copying 4 intro files..."
    cp "$CALDERA_SECTIONS/Section_${sec}_intro_williams.md" "$PROJECT_DIR/$target/section_${sec}/intros/" 2>/dev/null || true
    cp "$CALDERA_SECTIONS/Section_${sec}_intro_keymaker.md" "$PROJECT_DIR/$target/section_${sec}/intros/" 2>/dev/null || true
    cp "$CALDERA_SECTIONS/Section_${sec}_intro_elsegundo.md" "$PROJECT_DIR/$target/section_${sec}/intros/" 2>/dev/null || true
    cp "$CALDERA_SECTIONS/Section_${sec}_COMBINED_INTRO.md" "$PROJECT_DIR/$target/section_${sec}/intros/" 2>/dev/null || true
    
    INTRO_COUNT=$(ls "$PROJECT_DIR/$target/section_${sec}/intros/"*.md 2>/dev/null | wc -l)
    echo "    Intros copied: $INTRO_COUNT"
    
    # 5. Create README.md
    echo "  Creating README.md..."
    cat > "$PROJECT_DIR/$target/section_${sec}/README.md" <<READMEEOF
# $target — Prime Electron Caldera Integration (Section $sec)

**Source:** Caldera Prime Pi Electron, Section $sec  
**Title:** $title  
**Heuristic Intros:** Williams (3¶) + Keymaker (3¶) + El Segundo (3¶) = 9 paragraphs  
**Pieces:** 13 pieces concatenated  
**Compilations:** Clean, ReadAloud (full/intros/sections)

## Contents
- \`full/\` — Complete section with combined intro prepended
- \`pieces/\` — 13 individual piece files
- \`zip/\` — Zipped pieces archive
- \`intros/\` — 4 intro files (williams, keymaker, elsegundo, combined)

## Heuristic Structure
1. **Williams** (¶1-3): Constraint → Necessity → Commitment
2. **Keymaker** (¶4-6): Lock → Key → Turn  
3. **El Segundo** (¶7-9): Mirror → Participation → Protocol

## Cross-References
- Previous section: $prev_sec
- Next section: $next_sec
- Section 11 (Unified Synthesis) integrates all domains
- Section 12 (Mathematical Compendium) provides computational protocols

## Source Files
- Section master: \`Caldera_Prime_Pi_Electron/sections/Section_${sec}_*.md\`
- Pieces: \`Caldera_Prime_Pi_Electron/pieces/${piece_prefix}_piece_*.md\`
- Intros: \`Caldera_Prime_Pi_Electron/sections/Section_${sec}_intro_*.md\`

---
*Generated by Phase 3 integration script*
READMEEOF

    echo "  ✅ Section $sec integrated into $target/section_${sec}"
    echo ""
done

# Also create symlinks or copies at the top level for sections that are unique
echo ">>> Creating top-level symlinks for unique sections..."
for sec in 01 02 04 05 10 11 12; do
    target="${SECTION_MAP[$sec]}"
    if [ -d "$PROJECT_DIR/$target/section_${sec}" ]; then
        # Copy section_XX contents to top-level for unique mappings
        cp -r "$PROJECT_DIR/$target/section_${sec}/full" "$PROJECT_DIR/$target/" 2>/dev/null || true
        cp -r "$PROJECT_DIR/$target/section_${sec}/pieces" "$PROJECT_DIR/$target/" 2>/dev/null || true
        cp -r "$PROJECT_DIR/$target/section_${sec}/zip" "$PROJECT_DIR/$target/" 2>/dev/null || true
        cp -r "$PROJECT_DIR/$target/section_${sec}/intros" "$PROJECT_DIR/$target/" 2>/dev/null || true
        cp "$PROJECT_DIR/$target/section_${sec}/README.md" "$PROJECT_DIR/$target/" 2>/dev/null || true
    fi
done

echo ">>> Verification Summary:"
for sec in {01..12}; do
    target="${SECTION_MAP[$sec]}"
    FULL_COUNT=$(ls "$PROJECT_DIR/$target/section_${sec}/full/"*.md 2>/dev/null | wc -l)
    PIECE_COUNT=$(ls "$PROJECT_DIR/$target/section_${sec}/pieces/"*.md 2>/dev/null | wc -l)
    ZIP_COUNT=$(ls "$PROJECT_DIR/$target/section_${sec}/zip/"*.zip 2>/dev/null | wc -l)
    INTRO_COUNT=$(ls "$PROJECT_DIR/$target/section_${sec}/intros/"*.md 2>/dev/null | wc -l)
    echo "  $target/section_${sec}: full=$FULL_COUNT, pieces=$PIECE_COUNT, zip=$ZIP_COUNT, intros=$INTRO_COUNT"
done

echo ""
echo ">>> Phase 3 Complete. All 12 sections integrated."
echo "=========================================="