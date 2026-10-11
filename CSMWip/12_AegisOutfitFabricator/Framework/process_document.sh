#!/bin/bash
# Complete Document Pipeline: Author → Split → Zip → Push → Verify → Reassemble
# Usage: ./process_document.sh <document_file> "Commit Message"

set -e
DOC="$1"
MSG="${2:-Auto-save: $(basename "$DOC")}"
BRANCH="kilo/aegis-outfit-fabricator-wip"
REPO_ROOT="/workspace/app/CSMWip/12_AegisOutfitFabricator"

if [[ ! -f "$DOC" ]]; then
    echo "❌ Document not found: $DOC"
    exit 1
fi

cd "$REPO_ROOT"
export REPO_ROOT="$REPO_ROOT"
export KILO_REPO_ROOT="$REPO_ROOT"
source /workspace/app/CSMScripts/freenemo_modules/00_core_config.sh
source /workspace/app/CSMScripts/freenemo_modules/03_github_handler.sh

BASENAME=$(basename "$DOC" .md)
PIECES_DIR="Pieces"
FINISHED_DIR="FinishedWork"

echo "=== PROCESSING DOCUMENT: $BASENAME ==="
echo ""

# 1. Quality check
echo "Step 1: Quality check..."
./Framework/check_doc_quality.sh "$DOC" || exit 1

# 2. Split into pieces (target 13 pieces)
echo "Step 2: Splitting into ~13 pieces..."
LINES=$(wc -l < "$DOC")
SPLIT_SIZE=$(( (LINES + 12) / 13 ))  # Ceiling division to get ~13 pieces
if (( SPLIT_SIZE < 30 )); then SPLIT_SIZE=30; fi  # Minimum 30 lines per piece
if (( SPLIT_SIZE > 500 )); then SPLIT_SIZE=500; fi  # Maximum 500 lines per piece
echo "  Document lines: $LINES, Split size: $SPLIT_SIZE"
gh_split_file "$DOC" "$SPLIT_SIZE"
# Creates .github_handler/splits/BASENAME_part00.md through _part12.md + manifest.json

# Copy pieces to Pieces/ directory with expected naming
echo "  Copying pieces to Pieces/..."
SPLIT_DIR=".github_handler/splits"
for part in "$SPLIT_DIR/${BASENAME}_part"*.md; do
    if [[ -f "$part" ]]; then
        part_num=$(basename "$part" | sed 's/.*_part\([0-9]*\)\.md/\1/')
        # Convert to 2-digit piece number (01-13)
        piece_num=$(printf "%02d" $((10#$part_num + 1)))
        cp "$part" "$PIECES_DIR/${BASENAME}_piece_${piece_num}.md"
    fi
done
# Copy manifest
cp "$SPLIT_DIR/${BASENAME}_manifest.json" "$PIECES_DIR/${BASENAME}_manifest.json"

# 3. Zip pieces
echo "Step 3: Creating zip archive..."
cd "$PIECES_DIR"
zip -q "${BASENAME}_pieces.zip" ${BASENAME}_piece_*.md ${BASENAME}_manifest.json
cd ..

# 4. Push each piece to GitHub
echo "Step 4: Pushing pieces to GitHub (13 strategies each)..."
for p in "$PIECES_DIR/${BASENAME}_piece_"*.md; do
    echo "  Pushing $(basename "$p")..."
    gh_save_file "$p" "Piece: $MSG" "$BRANCH" || exit 1
done

# 5. Push zip archive
echo "Step 5: Pushing zip archive..."
gh_save_file "$PIECES_DIR/${BASENAME}_pieces.zip" "Archive: $MSG" "$BRANCH" || exit 1

# 6. Verify reassembly
echo "Step 6: Verifying reassembly..."
MANIFEST="$PIECES_DIR/${BASENAME}_manifest.json"
./Framework/verify_reassembly.sh "$DOC" "$MANIFEST" || exit 1

# 7. 17-way GitHub verification on first piece (sample)
echo "Step 7: 17-way GitHub verification (sample piece)..."
FIRST_PIECE="$PIECES_DIR/${BASENAME}_piece_01.md"
# Convert to path relative to /workspace/app (the actual git repo root)
REL_FIRST_PIECE="${REPO_ROOT#/workspace/app/}/$FIRST_PIECE"
./Framework/verify_github_17ways.sh "$REL_FIRST_PIECE" || exit 1

# 8. Heartbeat log
echo "Step 8: Logging completion..."
./Framework/heartbeat.sh "Completed document: $BASENAME - all verifications passed"

echo ""
echo "✅ DOCUMENT PIPELINE COMPLETE: $BASENAME"
echo "   Original: $DOC"
echo "   Pieces: 13 pushed to GitHub"
echo "   Archive: $PIECES_DIR/${BASENAME}_pieces.zip"
echo "   Verified: Clean reassembly + 17-way GitHub check"