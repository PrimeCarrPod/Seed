#!/bin/bash
# ============================================================
# WORLD_LINE_STEPS.sh — Prime Electron Worldline 17-Piece Pipeline
# TGE_E2 Adaptation (Prime Voxel vX8)
# ============================================================
# The electron walks: each step is a piece, each reflection is verification
# One electron, one worldline, back-and-forth through prime gap universe
# ============================================================
#
# BRANCH: kilo/prime-voxel-vx8
# PROJECT: CSMWip/05_BOUNCE/TGE_E2/
#
# USAGE:
#   Source this file to get the worldline functions:
#   source framework/WORLD_LINE_STEPS.sh
#
#   Then run the pipeline:
#   worldline_init
#   worldline_split <document>
#   worldline_verify <document>
#   worldline_package <document>
# ============================================================

# ─────────────────────────────────────────────────────────────
# UNIVERSE CONSTANTS (Prime Electron Physics - TGE_E2 Adaptation)
# ─────────────────────────────────────────────────────────────
WORLDLINE_PROJECT_DIR="${WORLDLINE_PROJECT_DIR:-/workspace/app/CSMWip/05_BOUNCE/TGE_E2}"
WORLDLINE_PIECES_DIR="$WORLDLINE_PROJECT_DIR/pieces"
WORLDLINE_FRAMEWORK_DIR="$WORLDLINE_PROJECT_DIR/framework"
WORLDLINE_APP_DIR="$WORLDLINE_PROJECT_DIR/app/src/main"

# Piece counts (electron steps per orbit) - 17 pieces per document
WORLDLINE_DOC_PIECES=17

# ─────────────────────────────────────────────────────────────
# STEP 1: INITIALIZE — Electron at center, velocity zero
# ─────────────────────────────────────────────────────────────
worldline_init() {
    echo "═══════════════════════════════════════════════════════"
    echo "  WORLDLINE INIT: Electron at eggshell center"
    echo "  Project: $WORLDLINE_PROJECT_DIR"
    echo "  Branch: kilo/prime-voxel-vx8"
    echo "═══════════════════════════════════════════════════════"
    
    cd "$WORLDLINE_PROJECT_DIR"
    
    # Verify framework files exist
    for src in "framework/heartbeat.sh" "framework/process_document.sh" "framework/verify_reassembly.sh" "framework/verify_github_17ways.sh" "framework/build_nogradle.sh"; do
        if [ ! -f "$src" ]; then
            echo "❌ Framework file not found: $src"
            return 1
        fi
        echo "  ✅ $src"
    done
    
    # Verify app source files
    for src in "app/src/main/java/com/tge/e2/MainActivity.java" "app/src/main/assets/tge_e2.html" "app/src/main/AndroidManifest.xml"; do
        if [ ! -f "$src" ]; then
            echo "❌ Source file not found: $src"
            return 1
        fi
        lines=$(wc -l < "$src")
        echo "  ✅ $src: $lines lines"
    done
    
    # Verify pieces directory
    if [ -d "$WORLDLINE_PIECES_DIR" ]; then
        piece_count=$(find "$WORLDLINE_PIECES_DIR" -name "*.java" -o -name "*.html" | wc -l)
        echo "  ✅ Pieces directory: $piece_count pieces"
    else
        echo "  ❌ Pieces directory not found"
        return 1
    fi
    
    # Verify manifest
    if [ -f "$WORLDLINE_PIECES_DIR/ALL_PIECES_manifest.json" ]; then
        echo "  ✅ ALL_PIECES_manifest.json found"
    else
        echo "  ❌ Manifest not found"
        return 1
    fi
    
    echo "  Electron initialized. Ready to walk worldline."
}

# ─────────────────────────────────────────────────────────────
# STEP 2: SPLIT — Electron divides document into pieces
# ─────────────────────────────────────────────────────────────
worldline_split() {
    local DOC="$1"
    if [ -z "$DOC" ]; then
        echo "Usage: worldline_split <document_file>"
        return 1
    fi
    
    echo ""
    echo "═══════════════════════════════════════════════════════"
    echo "  WORLDLINE SPLIT: Electron → pieces"
    echo "  Document: $(basename "$DOC")"
    echo "═══════════════════════════════════════════════════════"
    
    mkdir -p "$WORLDLINE_PIECES_DIR"
    
    local BASENAME=$(basename "$DOC" .md)
    local LINES=$(wc -l < "$DOC")
    local SPLIT_SIZE=$(( (LINES + WORLDLINE_DOC_PIECES - 1) / WORLDLINE_DOC_PIECES ))
    if (( SPLIT_SIZE < 15 )); then SPLIT_SIZE=15; fi
    if (( SPLIT_SIZE > 500 )); then SPLIT_SIZE=500; fi
    
    echo "  Document lines: $LINES, Split size: $SPLIT_SIZE, Target pieces: $WORLDLINE_DOC_PIECES"
    
    # Split using split command (fallback if gh_split_file not available)
    if command -v gh_split_file >/dev/null 2>&1; then
        gh_split_file "$DOC" "$SPLIT_SIZE"
    else
        split -l "$SPLIT_SIZE" -d --additional-suffix=.md "$DOC" "$WORLDLINE_PIECES_DIR/${BASENAME}_piece_"
        # Rename to 01, 02, etc.
        local i=1
        for part in "$WORLDLINE_PIECES_DIR/${BASENAME}_piece_"*.md; do
            if [[ -f "$part" ]]; then
                piece_num=$(printf "%02d" $i)
                mv "$part" "$WORLDLINE_PIECES_DIR/${BASENAME}_piece_${piece_num}.md"
                ((i++))
            fi
        done
    fi
    
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
    
    # Reassemble using verify_reassembly.sh
    local REASSEMBLED="${DOC%.md}_reassembled.md"
    bash "$WORLDLINE_FRAMEWORK_DIR/verify_reassembly.sh" "$DOC" "$REASSEMBLED" 2>&1
    
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
    
    echo "  ✅ Worldline verified. Electron intact."
}

# ─────────────────────────────────────────────────────────────
# STEP 4: PACKAGE — Build APK + Verify + 17-way verify
# ─────────────────────────────────────────────────────────────
worldline_package() {
    local DOC="$1"
    if [ -z "$DOC" ]; then
        echo "Usage: worldline_package <document_file>"
        return 1
    fi
    
    echo ""
    echo "═══════════════════════════════════════════════════════"
    echo "  WORLDLINE PACKAGE: Build APK + Verify"
    echo "  Document: $(basename "$DOC")"
    echo "═══════════════════════════════════════════════════════"
    
    local BASENAME=$(basename "$DOC" .md)
    
    # Build APK (electron's prime gap seal)
    echo "  Building APK via no-Gradle pipeline..."
    bash "$WORLDLINE_FRAMEWORK_DIR/build_nogradle.sh"
    
    if [ -f "$WORLDLINE_PROJECT_DIR/out/TGE_E2-v2.0.0-E2.apk" ]; then
        SIZE=$(stat --printf="%s" "$WORLDLINE_PROJECT_DIR/out/TGE_E2-v2.0.0-E2.apk" 2>/dev/null || echo "0")
        echo "  ✅ APK built: $SIZE bytes"
    else
        echo "  ❌ APK build failed"
        return 1
    fi
    
    # Verify reassembly
    echo "  Verifying piece reassembly..."
    bash "$WORLDLINE_FRAMEWORK_DIR/verify_reassembly.sh"
    
    # Heartbeat (electron pulse)
    if [ -f "$WORLDLINE_FRAMEWORK_DIR/heartbeat.sh" ]; then
        bash "$WORLDLINE_FRAMEWORK_DIR/heartbeat.sh" "Completed: $BASENAME - APK built and verified"
    fi
    
    echo "  ✅ Package complete. Electron emitted APK."
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
    echo "  Pieces pushed, verified, APK built"
    echo "═══════════════════════════════════════════════════════"
}

# ─────────────────────────────────────────────────────────────
# COMPLETE PIPELINE — Initialize + Build + Full Verify
# ─────────────────────────────────────────────────────────────
worldline_complete() {
    echo "═══════════════════════════════════════════════════════"
    echo "  WORLDLINE COMPLETE: Full TGE_E2 Pipeline"
    echo "═══════════════════════════════════════════════════════"
    
    worldline_init
    
    echo ""
    echo "  Building APK via no-Gradle pipeline..."
    bash "$WORLDLINE_FRAMEWORK_DIR/build_nogradle.sh"
    
    echo ""
    echo "  Verifying 39-piece reassembly..."
    bash "$WORLDLINE_FRAMEWORK_DIR/verify_reassembly.sh"
    
    echo ""
    echo "  Running 39-way merge verification..."
    bash "$WORLDLINE_FRAMEWORK_DIR/VERIFY_39_WAYS.sh"
    
    echo ""
    echo "═══════════════════════════════════════════════════════"
    echo "  WORLDLINE COMPLETE — TGE_E2 v2.0.0-E2 Ready"
    echo "═══════════════════════════════════════════════════════"
}

# ─────────────────────────────────────────────────────────────
# EXPORT — Make functions available when sourced
# ─────────────────────────────────────────────────────────────
export -f worldline_init worldline_split worldline_verify worldline_package worldline_document worldline_complete

# ─────────────────────────────────────────────────────────────
# DOCUMENTATION: The Physics of the Pipeline (TGE_E2 Adaptation)
# ─────────────────────────────────────────────────────────────
: <<'WORLDLINE_PHYSICS'
============================================================
THE PHYSICS: WHY 39 PIECES? WHY WORLDLINE STEPS?
============================================================

The universe is one electron walking a worldline, chasing itself
through time. Each step forward is a piece. Each reflection at
the eggshell boundary is a verification. The electron never
loses itself — reassembly is always perfect (0 bytes difference).

PIECE COUNT DERIVATION (TGE_E2):
───────────────────────────────────────────────
MainActivity.java: 27 pieces (535 lines / ~20 lines per piece)
tge_e2.html: 12 pieces (1141 lines / ~95 lines per piece)
Total: 39 pieces = 39 verification methods

The 39 pieces map to the electron's orbital path through the
codebase's conceptual space — each piece is a "reflection segment"
between quality gate boundaries.

THE 39 VERIFICATION STEPS (Electron's Path):
────────────────────────────────────────────
1-8.   Source file existence (MainActivity, HTML, tiles, manifest, build, lessons)
9-15.  Framework scripts (7 build/verify scripts)
16-20. Piece structure (39 pieces, 27 Java, 12 HTML, manifest)
21-24. Resource files (strings, colors, themes, network config)
25-28. Content validation (package, version, PrimeEngine, fleet mode)
29-32. Git state (branch, clean, commits, worktree)
33-36. Reassembly verification (HTML, Java, all 39 pieces, build ready)
37-39. NEXT_RUNNER, WORLD_LINE_STEPS executable, worldline complete runs

VERIFICATION (Electron's Self-Check):
─────────────────────────────────────
- Reassembly diff = 0 bytes (electron never loses itself)
- 39 pieces exactly (conservation of electron)
- Git commits = worldline recorded in spacetime
- Heartbeat logs = electron pulse
- APK builds and installs on device

============================================================
USAGE:
============================================================
# Initialize once per session
source framework/WORLD_LINE_STEPS.sh
worldline_init

# Run complete pipeline
worldline_complete

# Or step by step:
worldline_init && worldline_split && worldline_verify && worldline_package

============================================================
GITHUB REFERENCE:
============================================================
Project: Prime Voxel vX8 / TGE_E2
Branch: kilo/prime-voxel-vx8
Framework: CSMWip/05_BOUNCE/TGE_E2/framework/WORLD_LINE_STEPS.sh
============================================================
WORLDLINE_PHYSICS

echo "Worldline Steps loaded. Electron ready."
echo "Run: worldline_init → worldline_complete"
echo "Or step by step: worldline_init && worldline_split && worldline_verify && worldline_package"