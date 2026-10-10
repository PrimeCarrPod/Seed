#!/bin/bash
# Document Quality Check for AegisOutfitFabricator
# Usage: ./check_doc_quality.sh <document_file>

DOC="$1"

if [[ ! -f "$DOC" ]]; then
    echo "❌ Document not found: $DOC"
    exit 1
fi

echo "=== DOCUMENT QUALITY CHECK: $(basename "$DOC") ==="
echo ""

LINES=$(wc -l < "$DOC")
FORMULA_DOLLAR=$(grep -c '\$' "$DOC" 2>/dev/null || true); FORMULA_DOLLAR=${FORMULA_DOLLAR:-0}
FORMULA_BRACKET=$(grep -c '\[' "$DOC" 2>/dev/null || true); FORMULA_BRACKET=${FORMULA_BRACKET:-0}
FORMULA_MATH=$(grep -c -E '[=∈≈→×∝±√∑∫∂∇]' "$DOC" 2>/dev/null || true); FORMULA_MATH=${FORMULA_MATH:-0}
FORMULAS=$((FORMULA_DOLLAR + FORMULA_BRACKET + FORMULA_MATH))
CROSSREFS=$(grep -c 'Research\|CSMFAB078' "$DOC" 2>/dev/null || true); CROSSREFS=${CROSSREFS:-0}
STANDARDS=$(grep -ci 'CIETA\|ASTM\|NIJ\|NFPA\|MIL-STD\|ISO\|IEC' "$DOC" 2>/dev/null || true); STANDARDS=${STANDARDS:-0}
CONFLATION=$(grep -ic 'medieval\|victorian\|edwardian' "$DOC" 2>/dev/null || true); CONFLATION=${CONFLATION:-0}
TBD=$(grep -c 'TBD:RESEARCH' "$DOC" 2>/dev/null || true); TBD=${TBD:-0}
HAS_TRACEABILITY=$(grep -c 'Traceability Matrix' "$DOC" 2>/dev/null || true); HAS_TRACEABILITY=${HAS_TRACEABILITY:-0}

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