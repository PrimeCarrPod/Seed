#!/bin/bash
# Verify piece reassembly produces identical document
# Usage: ./verify_reassembly.sh <original_doc> <manifest_json>

set -e
ORIGINAL="$1"
MANIFEST="$2"

if [[ ! -f "$ORIGINAL" ]]; then
    echo "❌ Original not found: $ORIGINAL"
    exit 1
fi
if [[ ! -f "$MANIFEST" ]]; then
    echo "❌ Manifest not found: $MANIFEST"
    exit 1
fi

REASSEMBLED="${ORIGINAL%.md}_reassembled.md"

# Source github handler for gh_join_files
source /workspace/app/CSMScripts/freenemo_modules/00_core_config.sh
source /workspace/app/CSMScripts/freenemo_modules/03_github_handler.sh

echo "=== REASSEMBLY VERIFICATION ==="
echo "Original: $ORIGINAL"
echo "Manifest: $MANIFEST"
echo "Reassembled: $REASSEMBLED"
echo ""

gh_join_files "$MANIFEST" "$REASSEMBLED"

echo "Comparing..."
if diff -q "$ORIGINAL" "$REASSEMBLED" >/dev/null; then
    echo "✅ REASSEMBLY PERFECT - 0 bytes difference"
    rm "$REASSEMBLED"
    exit 0
else
    echo "❌ REASSEMBLY MISMATCH"
    echo "Diff stats:"
    diff -u "$ORIGINAL" "$REASSEMBLED" | head -50
    echo ""
    echo "Original lines: $(wc -l < "$ORIGINAL")"
    echo "Reassembled lines: $(wc -l < "$REASSEMBLED")"
    exit 1
fi