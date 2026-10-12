#!/bin/bash
# verify_reassembly.sh — TGE_E2 39-Piece Reassembly Verification
# Verifies that all pieces reassemble to match source files exactly

set -e

PROJECT_DIR="/workspace/app/CSMWip/05_BOUNCE/TGE_E2"
PIECES_DIR="$PROJECT_DIR/pieces"
APP_DIR="$PROJECT_DIR/app/src/main"

echo "=== TGE_E2 REASSEMBLY VERIFICATION ==="

# Verify HTML pieces (12 pieces)
echo "Verifying tge_e2.html reassembly (12 pieces)..."
cat "$PIECES_DIR"/tge_e2_piece_01.html \
    "$PIECES_DIR"/tge_e2_piece_02.html \
    "$PIECES_DIR"/tge_e2_piece_03.html \
    "$PIECES_DIR"/tge_e2_piece_04.html \
    "$PIECES_DIR"/tge_e2_piece_05.html \
    "$PIECES_DIR"/tge_e2_piece_06.html \
    "$PIECES_DIR"/tge_e2_piece_07.html \
    "$PIECES_DIR"/tge_e2_piece_08.html \
    "$PIECES_DIR"/tge_e2_piece_09.html \
    "$PIECES_DIR"/tge_e2_piece_10.html \
    "$PIECES_DIR"/tge_e2_piece_11.html \
    "$PIECES_DIR"/tge_e2_piece_12.html > /tmp/tge_e2_reassembled.html

if diff -q "$APP_DIR/assets/tge_e2.html" /tmp/tge_e2_reassembled.html; then
    echo "✅ tge_e2.html: Perfect reassembly (0 bytes difference)"
else
    echo "❌ tge_e2.html: MISMATCH!"
    diff -u "$APP_DIR/assets/tge_e2.html" /tmp/tge_e2_reassembled.html | head -50
    exit 1
fi

# Verify Java pieces (27 pieces)
echo "Verifying MainActivity.java reassembly (27 pieces)..."
cat "$PIECES_DIR"/MainActivity_piece_01.java \
    "$PIECES_DIR"/MainActivity_piece_02.java \
    "$PIECES_DIR"/MainActivity_piece_03.java \
    "$PIECES_DIR"/MainActivity_piece_04.java \
    "$PIECES_DIR"/MainActivity_piece_05.java \
    "$PIECES_DIR"/MainActivity_piece_06.java \
    "$PIECES_DIR"/MainActivity_piece_07.java \
    "$PIECES_DIR"/MainActivity_piece_08.java \
    "$PIECES_DIR"/MainActivity_piece_09.java \
    "$PIECES_DIR"/MainActivity_piece_10.java \
    "$PIECES_DIR"/MainActivity_piece_11.java \
    "$PIECES_DIR"/MainActivity_piece_12.java \
    "$PIECES_DIR"/MainActivity_piece_13.java \
    "$PIECES_DIR"/MainActivity_piece_14.java \
    "$PIECES_DIR"/MainActivity_piece_15.java \
    "$PIECES_DIR"/MainActivity_piece_16.java \
    "$PIECES_DIR"/MainActivity_piece_17.java \
    "$PIECES_DIR"/MainActivity_piece_18.java \
    "$PIECES_DIR"/MainActivity_piece_19.java \
    "$PIECES_DIR"/MainActivity_piece_20.java \
    "$PIECES_DIR"/MainActivity_piece_21.java \
    "$PIECES_DIR"/MainActivity_piece_22.java \
    "$PIECES_DIR"/MainActivity_piece_23.java \
    "$PIECES_DIR"/MainActivity_piece_24.java \
    "$PIECES_DIR"/MainActivity_piece_25.java \
    "$PIECES_DIR"/MainActivity_piece_26.java \
    "$PIECES_DIR"/MainActivity_piece_27.java > /tmp/MainActivity_reassembled.java

if diff -q "$APP_DIR/java/com/tge/e2/MainActivity.java" /tmp/MainActivity_reassembled.java; then
    echo "✅ MainActivity.java: Perfect reassembly (0 bytes difference)"
else
    echo "❌ MainActivity.java: MISMATCH!"
    diff -u "$APP_DIR/java/com/tge/e2/MainActivity.java" /tmp/MainActivity_reassembled.java | head -50
    exit 1
fi

# Count pieces
HTML_COUNT=$(find "$PIECES_DIR" -name "tge_e2_piece_*.html" | wc -l)
JAVA_COUNT=$(find "$PIECES_DIR" -name "MainActivity_piece_*.java" | wc -l)
TOTAL=$((HTML_COUNT + JAVA_COUNT))

echo ""
echo "Piece count verification:"
echo "  HTML pieces: $HTML_COUNT / 12"
echo "  Java pieces: $JAVA_COUNT / 27"
echo "  Total: $TOTAL / 39"

if [ $TOTAL -ne 39 ]; then
    echo "❌ Piece count mismatch - expected 39, got $TOTAL"
    exit 1
fi

echo ""
echo "=== ALL VERIFICATIONS PASSED ==="
echo "✅ 39 pieces verified"
echo "✅ HTML reassembly: perfect"
echo "✅ Java reassembly: perfect"
echo "✅ Ready for build"