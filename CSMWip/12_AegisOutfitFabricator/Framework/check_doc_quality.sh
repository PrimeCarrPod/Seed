#!/bin/bash
# Document Quality Check for AegisOutfitFabricator
# Usage: ./check_doc_quality.sh <document_file>

set -e
DOC="$1"

if [[ ! -f "$DOC" ]]; then
    echo "❌ Document not found: $DOC"
    exit 1
fi

echo "=== DOCUMENT QUALITY CHECK: $(basename "$DOC") ==="
echo ""

LINES=$(wc -l < "$DOC")
FORMULAS=$(grep -c '\\$\\|\\\\[' "$DOC" || echo 0)
CROSSREFS=$(grep -c 'Research\\|CSMFAB078' "$DOC" || echo 0)
STANDARDS=$(grep -ci 'CIETA\\|ASTM\\|NIJ\\|NFPA\\|MIL-STD\\|ISO\\|IEC' "$DOC" || echo 0)
CONFLATION=$(grep -ic 'medieval\\|victorian\\|edwardian' "$DOC" || echo 0)
TBD=$(grep -c 'TBD:RESEARCH' "$DOC" || echo 0)
HAS_TRACEABILITY=$(grep -c 'Traceability Matrix' "$DOC" || echo 0)

echo "Lines: $LINES (target: ≥300)"
echo "Formulas: $FORMULAS (target: ≥15)"
echo "Cross-references: $CROSSREFS (target: ≥10)"
echo "Standards cited: $STANDARDS (target: ≥5)"
echo "Conflation flags: $CONFLATION (target: 0)"
echo "TBD markers: $TBD (documented unknowns)"
echo "Traceability matrix: $([ $HAS_TRACEABILITY -gt 0 ] && echo 'YES' || echo 'NO')"
echo ""

PASS=0
FAIL=0

gate() {
    local name="$1"
    local condition="$2"
    echo -n "[$name] "
    if eval "$condition"; then
        echo "✅ PASS"
        ((PASS++))
    else
        echo "❌ FAIL"
        ((FAIL++))
    fi
}

gate "Line count ≥300" "[ $LINES -ge 300 ]"
gate "Formulas ≥15" "[ $FORMULAS -ge 15 ]"
gate "Cross-refs ≥10" "[ $CROSSREFS -ge 10 ]"
gate "Standards ≥5" "[ $STANDARDS -ge 5 ]"
gate "Zero conflation" "[ $CONFLATION -eq 0 ]"
gate "Traceability matrix present" "[ $HAS_TRACEABILITY -gt 0 ]"

echo ""
echo "=== QUALITY GATE: $PASS PASS, $FAIL FAIL ==="
[[ $FAIL -eq 0 ]] && echo "✅ DOCUMENT PASSES ALL QUALITY GATES" || echo "❌ DOCUMENT FAILS QUALITY GATES"
exit $FAIL