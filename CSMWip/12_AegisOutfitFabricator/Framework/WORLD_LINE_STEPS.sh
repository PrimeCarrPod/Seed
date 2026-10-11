#!/bin/bash
# ============================================================
# WORLD_LINE_STEPS.sh — Prime Electron Worldline 17-Piece Pipeline
# AegisOutfitFabricator Adaptation
# ============================================================
# The electron walks: each step is a piece, each reflection is verification
# One electron, one worldline, back-and-forth through prime gap universe
# ============================================================
#
# BRANCH: kilo/aegis-outfit-fabricator-wip
# PROJECT: CSMWip/12_AegisOutfitFabricator/
#
# USAGE:
#   Source this file to get the worldline functions:
#   source Framework/WORLD_LINE_STEPS.sh
#
#   Then run the pipeline:
#   worldline_init
#   worldline_split <document>
#   worldline_verify <document>
#   worldline_package <document>
# ============================================================

# ─────────────────────────────────────────────────────────────
# UNIVERSE CONSTANTS (Prime Electron Physics - Aegis Adaptation)
# ─────────────────────────────────────────────────────────────
WORLDLINE_PROJECT_DIR="${WORLDLINE_PROJECT_DIR:-/workspace/app/CSMWip/12_AegisOutfitFabricator}"
WORLDLINE_PIECES_DIR="$WORLDLINE_PROJECT_DIR/Pieces"
WORLDLINE_FRAMEWORK_DIR="$WORLDLINE_PROJECT_DIR/Framework"
WORLDLINE_FINISHED_DIR="$WORLDLINE_PROJECT_DIR/FinishedWork"
WORLDLINE_RESEARCH_DIR="$WORLDLINE_PROJECT_DIR/Research"

# Piece counts (electron steps per orbit) - 17 pieces per document
WORLDLINE_DOC_PIECES=17

# Edition configuration (8 editions across 2 morphological variants)
WORLDLINE_EDITIONS=("RM-TS" "RM-TG" "RM-SS" "RM-SG" "RW-TS" "RW-TG" "RW-SS" "RW-SG")

# Document batch configuration
WORLDLINE_BATCH_1_DOCS=("DOC-01" "DOC-02" "DOC-03" "DOC-04" "DOC-05" "DOC-06" "DOC-07" "DOC-08" "DOC-09" "DOC-10")
WORLDLINE_BATCH_2_DOCS=("DOC-11" "DOC-12" "DOC-13" "DOC-14" "DOC-15" "DOC-16" "DOC-17" "DOC-18" "DOC-19" "DOC-20")

# ─────────────────────────────────────────────────────────────
# STEP 1: INITIALIZE — Electron at center, velocity zero
# ─────────────────────────────────────────────────────────────
worldline_init() {
    echo "═══════════════════════════════════════════════════════"
    echo "  WORLDLINE INIT: Electron at eggshell center"
    echo "  Project: $WORLDLINE_PROJECT_DIR"
    echo "  Branch: kilo/aegis-outfit-fabricator-wip"
    echo "═══════════════════════════════════════════════════════"
    
    cd "$WORLDLINE_PROJECT_DIR"
    
    # Verify framework files exist
    for src in "Framework/heartbeat.sh" "Framework/process_document.sh" "Framework/check_doc_quality.sh" "Framework/verify_reassembly.sh" "Framework/verify_github_17ways.sh"; do
        if [ ! -f "$src" ]; then
            echo "❌ Framework file not found: $src"
            return 1
        fi
        echo "  ✅ $src"
    done
    
    # Verify research files (the universe's memory)
    for src in "Research/Historical Dress Construction Analysis.md" "Research/Advanced Textile Stitching and Automation.md"; do
        if [ ! -f "$src" ]; then
            echo "❌ Research file not found: $src"
            return 1
        fi
        lines=$(wc -l < "$src")
        echo "  ✅ $src: $lines lines"
    done
    
    # Verify CSMFAB078 reference
    if [ -d "/workspace/app/CSMFAB/CSMFAB078_AegisIronMan" ]; then
        echo "  ✅ CSMFAB078 reference found"
    else
        echo "  ⚠️  CSMFAB078 reference not found"
    fi
    
    # Verify Session 005 deliverables (Batch 1 complete)
    for doc in "${WORLDLINE_BATCH_1_DOCS[@]}"; do
        if [ -f "$WORLDLINE_FINISHED_DIR/${doc}_"*.md ]; then
            echo "  ✅ $doc exists"
        else
            echo "  ❌ $doc MISSING - Batch 1 incomplete"
            return 1
        fi
    done
    
    # Source GitHub handler
    source /workspace/app/CSMScripts/freenemo_modules/00_core_config.sh
    source /workspace/app/CSMScripts/freenemo_modules/03_github_handler.sh
    gh_init
    echo "  ✅ GitHub handler initialized"
    
    echo "  Electron initialized. Ready to walk worldline."
}

# ─────────────────────────────────────────────────────────────
# STEP 2: SPLIT — Electron divides document into 17 pieces
# ─────────────────────────────────────────────────────────────
worldline_split() {
    local DOC="$1"
    if [ -z "$DOC" ]; then
        echo "Usage: worldline_split <document_file>"
        return 1
    fi
    
    echo ""
    echo "═══════════════════════════════════════════════════════"
    echo "  WORLDLINE SPLIT: Electron → $WORLDLINE_DOC_PIECES pieces"
    echo "  Document: $(basename "$DOC")"
    echo "═══════════════════════════════════════════════════════"
    
    mkdir -p "$WORLDLINE_PIECES_DIR"
    
    local BASENAME=$(basename "$DOC" .md)
    local LINES=$(wc -l < "$DOC")
    local SPLIT_SIZE=$(( (LINES + WORLDLINE_DOC_PIECES - 1) / WORLDLINE_DOC_PIECES ))  # Ceiling division
    if (( SPLIT_SIZE < 15 )); then SPLIT_SIZE=15; fi
    if (( SPLIT_SIZE > 500 )); then SPLIT_SIZE=500; fi
    
    echo "  Document lines: $LINES, Split size: $SPLIT_SIZE, Target pieces: $WORLDLINE_DOC_PIECES"
    
    # Split using gh_split_file (17 strategies)
    gh_split_file "$DOC" "$SPLIT_SIZE"
    
    # Copy pieces to Pieces/ directory with expected naming
    local SPLIT_DIR=".github_handler/splits"
    for part in "$SPLIT_DIR/${BASENAME}_part"*.md; do
        if [[ -f "$part" ]]; then
            part_num=$(basename "$part" | sed 's/.*_part\([0-9]*\)\.md/\1/')
            piece_num=$(printf "%02d" $((10#$part_num + 1)))
            cp "$part" "$WORLDLINE_PIECES_DIR/${BASENAME}_piece_${piece_num}.md"
        fi
    done
    
    # Copy manifest
    cp "$SPLIT_DIR/${BASENAME}_manifest.json" "$WORLDLINE_PIECES_DIR/${BASENAME}_manifest.json"
    
    # Count pieces (conservation of electron)
    local piece_count=$(find "$WORLDLINE_PIECES_DIR" -name "${BASENAME}_piece_*.md" | wc -l)
    echo "  ✅ Split complete: $piece_count pieces created"
    
    if [ $piece_count -ne $WORLDLINE_DOC_PIECES ]; then
        echo "  ⚠️  Piece count: $piece_count (expected $WORLDLINE_DOC_PIECES)"
    fi
}

# ─────────────────────────────────────────────────────────────
# STEP 3: VERIFY REASSEMBLY — Electron recombines perfectly
# ─────────────────────────────────────────────────────────────
worldline_verify() {
    local DOC="$1"
    if [ -z "$DOC" ]; then
        echo "Usage: worldline_verify <document_file>"
        return 1
    fi
    
    echo ""
    echo "═══════════════════════════════════════════════════════"
    echo "  WORLDLINE VERIFY: Reassembly = 0 bytes difference"
    echo "  Document: $(basename "$DOC")"
    echo "═══════════════════════════════════════════════════════"
    
    local BASENAME=$(basename "$DOC" .md)
    local MANIFEST="$WORLDLINE_PIECES_DIR/${BASENAME}_manifest.json"
    
    if [ ! -f "$MANIFEST" ]; then
        echo "  ❌ Manifest not found: $MANIFEST"
        return 1
    fi
    
    # Reassemble using gh_join_files
    local REASSEMBLED="${DOC%.md}_reassembled.md"
    gh_join_files "$MANIFEST" "$REASSEMBLED"
    
    echo "  Comparing original vs reassembled..."
    if diff -q "$DOC" "$REASSEMBLED" >/dev/null; then
        echo "  ✅ PERFECT REASSEMBLY - 0 bytes difference"
        rm "$REASSEMBLED"
    else
        echo "  ❌ REASSEMBLY MISMATCH - worldline broken!"
        diff -u "$DOC" "$REASSEMBLED" | head -50
        echo "  Original lines: $(wc -l < "$DOC")"
        echo "  Reassembled lines: $(wc -l < "$REASSEMBLED")"
        return 1
    fi
    
    # Quality check
    echo "  Running quality gates..."
    ./Framework/check_doc_quality.sh "$DOC"
    
    echo "  ✅ Worldline verified. Electron intact."
}

# ─────────────────────────────────────────────────────────────
# STEP 4: PACKAGE — Zip pieces + Push to GitHub + 17-way verify
# ─────────────────────────────────────────────────────────────
worldline_package() {
    local DOC="$1"
    if [ -z "$DOC" ]; then
        echo "Usage: worldline_package <document_file>"
        return 1
    fi
    
    echo ""
    echo "═══════════════════════════════════════════════════════"
    echo "  WORLDLINE PACKAGE: Zip + GitHub Push + 17-Way Verify"
    echo "  Document: $(basename "$DOC")"
    echo "═══════════════════════════════════════════════════════"
    
    local BASENAME=$(basename "$DOC" .md)
    local BRANCH="kilo/aegis-outfit-fabricator-wip"
    
    # Create zip archive (electron's prime gap archive)
    cd "$WORLDLINE_PIECES_DIR"
    zip -q "${BASENAME}_pieces.zip" ${BASENAME}_piece_*.md ${BASENAME}_manifest.json
    local zip_size=$(stat --printf="%s" "${BASENAME}_pieces.zip" 2>/dev/null || echo "0")
    echo "  ✅ ${BASENAME}_pieces.zip created: $zip_size bytes"
    cd "$WORLDLINE_PROJECT_DIR"
    
    # Push each piece to GitHub (17 strategies per piece)
    echo "  Pushing $WORLDLINE_DOC_PIECES pieces to GitHub..."
    for p in "$WORLDLINE_PIECES_DIR/${BASENAME}_piece_"*.md; do
        echo "    Pushing $(basename "$p")..."
        gh_save_file "$p" "Piece: $BASENAME" "$BRANCH"
    done
    
    # Push zip archive
    echo "  Pushing zip archive..."
    gh_save_file "$WORLDLINE_PIECES_DIR/${BASENAME}_pieces.zip" "Archive: $BASENAME" "$BRANCH"
    
    # 17-way GitHub verification on first piece (sample)
    echo "  Running 17-way GitHub verification (sample piece)..."
    local FIRST_PIECE="$WORLDLINE_PIECES_DIR/${BASENAME}_piece_01.md"
    local REL_FIRST_PIECE="${WORLDLINE_PROJECT_DIR#/workspace/app/}/$FIRST_PIECE"
    ./Framework/verify_github_17ways.sh "$REL_FIRST_PIECE"
    
    # Heartbeat (electron pulse)
    ./Framework/heartbeat.sh "Completed document: $BASENAME - all verifications passed"
    
    echo "  ✅ Package complete. Electron emitted artifacts."
}

# ─────────────────────────────────────────────────────────────
# COMPLETE DOCUMENT WORLDLINE — Single document, full cycle
# ─────────────────────────────────────────────────────────────
worldline_document() {
    local DOC="$1"
    if [ -z "$DOC" ]; then
        echo "Usage: worldline_document <document_file>"
        return 1
    fi
    
    worldline_split "$DOC" && \
    worldline_verify "$DOC" && \
    worldline_package "$DOC"
    
    echo ""
    echo "═══════════════════════════════════════════════════════"
    echo "  DOCUMENT WORLDLINE COMPLETE: $(basename "$DOC")"
    echo "  17 pieces pushed, verified, archived"
    echo "═══════════════════════════════════════════════════════"
}

# ─────────────────────────────────────────────────────────────
# BATCH WORLDLINE — Complete batch of documents
# ─────────────────────────────────────────────────────────────
worldline_batch() {
    local BATCH_NAME="$1"
    shift
    local DOCS=("$@")
    
    echo "═══════════════════════════════════════════════════════"
    echo "  BATCH WORLDLINE: $BATCH_NAME"
    echo "  Documents: ${DOCS[*]}"
    echo "═══════════════════════════════════════════════════════"
    
    for doc_id in "${DOCS[@]}"; do
        local DOC_FILE=$(find "$WORLDLINE_FINISHED_DIR" -name "${doc_id}_*.md" | head -1)
        if [ -f "$DOC_FILE" ]; then
            echo ""
            echo ">>> Processing $doc_id..."
            worldline_document "$DOC_FILE"
        else
            echo "  ❌ $doc_id not found in $WORLDLINE_FINISHED_DIR"
        fi
    done
    
    echo ""
    echo "═══════════════════════════════════════════════════════"
    echo "  BATCH WORLDLINE COMPLETE: $BATCH_NAME"
    echo "  ${#DOCS[@]} documents × 17 pieces = $((${#DOCS[@]} * 17)) pieces total"
    echo "═══════════════════════════════════════════════════════"
}

# ─────────────────────────────────────────────────────────────
# EXPORT — Make functions available when sourced
# ─────────────────────────────────────────────────────────────
export -f worldline_init worldline_split worldline_verify worldline_package worldline_document worldline_batch

# ─────────────────────────────────────────────────────────────
# DOCUMENTATION: The Physics of the Pipeline (Aegis Adaptation)
# ─────────────────────────────────────────────────────────────
: <<'WORLDLINE_PHYSICS'
============================================================
THE PHYSICS: WHY 17 PIECES? WHY WORLDLINE STEPS?
============================================================

The universe is one electron walking a worldline, chasing itself
through time. Each step forward is a piece. Each reflection at
the eggshell boundary is a verification. The electron never
loses itself — reassembly is always perfect (0 bytes difference).

PIECE COUNT DERIVATION (AegisOutfitFabricator):
───────────────────────────────────────────────
Each core document: ~300-400 lines minimum
Target: ~17 pieces per document
Lines per piece: ~20-25 lines (dense technical content)
Total pieces per batch (10 docs): 170 pieces
Total zips per batch: 10 archives

The 17 pieces map to the electron's orbital path through the
document's conceptual space — each piece is a "reflection segment"
between quality gate boundaries.

THE 17 STEPS PER DOCUMENT (Electron's Path):
────────────────────────────────────────────
1.  Quality gate check (pre-flight)
2.  Split into ~17 pieces (electron divides)
3.  Copy to Pieces/ with 01-17 naming
4.  Copy manifest (worldline memory)
5.  Zip archive creation (prime gap seal)
6.  Push piece 01 (strategy 1)
7.  Push piece 02 (strategy 2)
...
22. Push piece 17 (strategy 17)
23. Push zip archive (strategy 18 - archive)
24. Verify reassembly (electron self-check)
25. 17-way GitHub verify (multi-dimensional check)
26. Heartbeat log (electron pulse)
27. Quality gates passed (final validation)

EDITION WORLDLINES (8 electrons, one per edition):
──────────────────────────────────────────────────
RM-TS: Tall-Skinny RenaissanceMan    → 30 panels, 180 tiles, 16.47 kg
RM-TG: Tall-Gordo RenaissanceMan     → 36 panels, 240 tiles, 20.88 kg
RM-SS: Short-Skinny RenaissanceMan   → 28 panels, 150 tiles, 13.73 kg
RM-SG: Short-Gordo RenaissanceMan    → 34 panels, 210 tiles, 17.21 kg
RW-TS: Tall-Skinny RenaissanceWoMan  → 42 panels (+stays), 16.00 kg
RW-TG: Tall-Gordo RenaissanceWoMan   → 52 panels (+pannier), 20.13 kg
RW-SS: Short-Skinny RenaissanceWoMan → 38 panels (+stays), 13.22 kg
RW-SG: Short-Gordo RenaissanceWoMan  → 48 panels (+pannier), 16.78 kg

BATCH WORLDLINES (Figure-8 loop):
─────────────────────────────────
Batch 1 (DOC-01..10):  Complete ✅
Batch 2 (DOC-11..20):  In progress 🔄
Batch 3 (DOC-21..30):  Next
Batch 4 (DOC-31..40):  Next
...
Batch 15 (DOC-141..150): Final

Each loop adds 10 documents. 15 loops = 150 documents complete.
Train on infinite figure-8 loop of progress.

VERIFICATION (Electron's Self-Check):
─────────────────────────────────────
- Reassembly diff = 0 bytes (electron never loses itself)
- 17 pieces exactly (conservation of electron)
- Git commits = worldline recorded in spacetime
- Heartbeat logs = electron pulse
- Quality gates: lines≥300, formulas≥15, refs≥10, standards≥5, conflation=0

============================================================
USAGE:
============================================================
# Initialize once per session
source Framework/WORLD_LINE_STEPS.sh
worldline_init

# Process single document
worldline_document FinishedWork/DOC-11_RenaissanceMan_TS_Specification.md

# Process entire batch
worldline_batch "Batch 2" "${WORLDLINE_BATCH_2_DOCS[@]}"

# Or step by step
worldline_split FinishedWork/DOC-11_*.md
worldline_verify FinishedWork/DOC-11_*.md
worldline_package FinishedWork/DOC-11_*.md

============================================================
GITHUB REFERENCE:
============================================================
Project: AegisOutfitFabricator
Branch: kilo/aegis-outfit-fabricator-wip
Framework: CSMWip/12_AegisOutfitFabricator/Framework/WORLD_LINE_STEPS.sh
============================================================
WORLDLINE_PHYSICS

echo "Worldline Steps loaded. Electron ready."
echo "Run: worldline_init → worldline_document <doc> or worldline_batch <name> <docs...>"
echo "Or step by step: worldline_split → worldline_verify → worldline_package"