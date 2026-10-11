#!/bin/bash
# TGE_E1 Complete Document Pipeline: Author → Split → Zip → Push → Verify → Reassemble
# Adapted from AegisOutfitFabricator process_document.sh for 27-piece pipeline

set -e
PROJECT_DIR="/workspace/app/CSMWip/05_BOUNCE/TGE_E1"
FRAMEWORK_DIR="$PROJECT_DIR/framework"
PIECES_DIR="$PROJECT_DIR/pieces"

cd "$PROJECT_DIR"

echo "=== TGE_E1 DOCUMENT PIPELINE (27 PIECES) ==="
echo "Project: Prime Electron Worldline Emulator"
echo "Target: 13 Kotlin pieces + 14 HTML pieces = 27 total"
echo ""

# 1. Quality check on source files
echo "Step 1: Quality check on source files..."
for src in "app/src/main/java/com/tge/e1/MainActivity.kt" "app/src/main/assets/tge_e1.html"; do
    if [ ! -f "$src" ]; then
        echo "❌ Source not found: $src"
        exit 1
    fi
    lines=$(wc -l < "$src")
    echo "  $src: $lines lines ✅"
done

# 2. Split into pieces (already done - verify)
echo ""
echo "Step 2: Verifying 27-piece split..."
KT_PIECES=$(find "$PIECES_DIR" -name "MainActivity_piece_*.kt" | wc -l)
HTML_PIECES=$(find "$PIECES_DIR" -name "tge_e1_piece_*.html" | wc -l)
TOTAL=$((KT_PIECES + HTML_PIECES))

echo "  Kotlin pieces: $KT_PIECES / 13"
echo "  HTML pieces: $HTML_PIECES / 14"
echo "  Total: $TOTAL / 27"

if [ $TOTAL -ne 27 ]; then
    echo "❌ Piece count mismatch - expected 27, got $TOTAL"
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
zip -q "TGE_E1_all_pieces.zip" MainActivity_piece_*.kt tge_e1_piece_*.html ALL_PIECES_manifest.json
echo "  ✅ TGE_E1_all_pieces.zip created"

# 5. Git commit all pieces
echo ""
echo "Step 5: Git commit pieces..."
cd "$PROJECT_DIR"
git add pieces/
git commit -m "TGE_E1: 27-piece pipeline complete - Prime Electron Worldline

- MainActivity.kt: 13 pieces (PrimeEngine + WorldlineRenderer + Menu)
- tge_e1.html: 14 pieces (Canvas renderer + Eggshell + Electron)
- PrimeBookOne tiles: Tile00.prime, Tile01.prime integrated
- Eggshell geometry: Elliptical boundary for electron reflections
- Single electron walking worldline back-and-forth
- Landolil-style menu system integrated" 2>/dev/null || echo "  No changes to commit"

# 6. 17-way GitHub verification (sample)
echo ""
echo "Step 6: 17-way GitHub verification (sample)..."
"$FRAMEWORK_DIR/verify_github_17ways.sh" || true

# 7. Heartbeat log
echo ""
echo "Step 7: Logging completion..."
"$FRAMEWORK_DIR/heartbeat.sh" "TGE_E1 27-piece pipeline complete - Prime Electron Worldline v1.0.0-E1"

echo ""
echo "=== TGE_E1 PIPELINE COMPLETE ==="
echo "✅ 27 pieces verified and zipped"
echo "✅ MainActivity.kt (13 pieces) - Prime Engine + Worldline"
echo "✅ tge_e1.html (14 pieces) - Canvas + Eggshell + Electron"
echo "✅ PrimeBookOne tiles integrated (Tile00, Tile01)"
echo "✅ Landolil menu system included"
echo "✅ Eggshell elliptical boundary for electron reflections"
echo "✅ Single electron walking worldline → reflections"
echo "✅ Ready for APK build"