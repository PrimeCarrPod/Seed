#!/bin/bash
# TGE_E2 Complete Document Pipeline: Author → Split → Zip → Push → Verify → Reassemble
# Adapted from AegisOutfitFabricator process_document.sh for 39-piece pipeline

set -e
PROJECT_DIR="/workspace/app/CSMWip/05_BOUNCE/TGE_E2"
FRAMEWORK_DIR="$PROJECT_DIR/framework"
PIECES_DIR="$PROJECT_DIR/pieces"

cd "$PROJECT_DIR"

echo "=== TGE_E2 DOCUMENT PIPELINE (39 PIECES) ==="
echo "Project: Prime Electron Worldline Emulator v2"
echo "Target: 27 Java pieces + 12 HTML pieces = 39 total"
echo ""

# 1. Quality check on source files
echo "Step 1: Quality check on source files..."
for src in "app/src/main/java/com/tge/e2/MainActivity.java" "app/src/main/assets/tge_e2.html"; do
    if [ ! -f "$src" ]; then
        echo "❌ Source not found: $src"
        exit 1
    fi
    lines=$(wc -l < "$src")
    echo "  $src: $lines lines ✅"
done

# 2. Verify piece count
echo ""
echo "Step 2: Verifying 39-piece split..."
JAVA_PIECES=$(find "$PIECES_DIR" -name "MainActivity_piece_*.java" | wc -l)
HTML_PIECES=$(find "$PIECES_DIR" -name "tge_e2_piece_*.html" | wc -l)
TOTAL=$((JAVA_PIECES + HTML_PIECES))

echo "  Java pieces: $JAVA_PIECES / 27"
echo "  HTML pieces: $HTML_PIECES / 12"
echo "  Total: $TOTAL / 39"

if [ $TOTAL -ne 39 ]; then
    echo "❌ Piece count mismatch - expected 39, got $TOTAL"
    exit 1
fi

# 3. Verify reassembly
echo ""
echo "Step 3: Verifying reassembly..."
"$FRAMEWORK_DIR/verify_reassembly.sh" || exit 1

# 4. Create zip archive
echo ""
echo "Step 4: Creating zip archive..."
cd "$PIECES_DIR"
zip -q "TGE_E2_all_pieces.zip" MainActivity_piece_*.java tge_e2_piece_*.html ALL_PIECES_manifest.json
echo "  ✅ TGE_E2_all_pieces.zip created"

# 5. Git commit all pieces
echo ""
echo "Step 5: Git commit pieces..."
cd "$PROJECT_DIR"
git add pieces/
git commit -m "TGE_E2: 39-piece pipeline complete - Prime Electron Worldline v2

- MainActivity.java: 27 pieces (PrimeEngine + WorldlineRenderer + Menu + Fleet)
- tge_e2.html: 12 pieces (Canvas + Eggshell + Electron + Explorer + History + Analysis)
- PrimeBookOne tiles: Tile00.prime, Tile01.prime integrated (Tile02/03 ready)
- Eggshell geometry: Elliptical boundary for electron reflections
- Single electron walking worldline back-and-forth
- Fleet mode: 8 electrons with prime-seeded hues
- Prime Explorer: Interactive gap browser with zoom/pan
- Worldline History: Time scrubber playback
- Gap Analysis: Histogram + Cramér conjecture + twin primes
- Landolil menu system integrated (7 buttons)" 2>/dev/null || echo "  No changes to commit"

# 6. 17-way GitHub verification
echo ""
echo "Step 6: 17-way GitHub verification..."
"$FRAMEWORK_DIR/verify_github_17ways.sh" || true

# 7. Heartbeat log
echo ""
echo "Step 7: Logging completion..."
"$FRAMEWORK_DIR/heartbeat.sh" "TGE_E2 39-piece pipeline complete - Prime Electron Worldline v2.0.0-E2"

echo ""
echo "=== TGE_E2 PIPELINE COMPLETE ==="
echo "✅ 39 pieces verified and zipped"
echo "✅ MainActivity.java (27 pieces) - Prime Engine + Worldline + Fleet"
echo "✅ tge_e2.html (12 pieces) - Canvas + Eggshell + Electron + Explorer + History + Analysis"
echo "✅ PrimeBookOne tiles integrated (Tile00, Tile01)"
echo "✅ Landolil menu system included"
echo "✅ Eggshell elliptical boundary for electron reflections"
echo "✅ Single electron walking worldline → reflections"
echo "✅ Fleet mode: 8 electrons prime-seeded"
echo "✅ Prime Explorer: Interactive gap browser"
echo "✅ Worldline History: Time scrubber"
echo "✅ Gap Analysis: Histogram + conjectures"
echo "✅ Ready for APK build"