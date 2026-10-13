#!/bin/bash
# VERIFY_39_WAYS.sh — TGE_E2 Merge Verification (39 Methods)

# set -e  # REMOVED to see all results

PROJECT_DIR="/workspace/app/CSMWip/05_BOUNCE/TGE_E2"
PASSED=0
FAILED=0

check() {
    local name="$1"
    shift
    echo -n "  [$((PASSED+FAILED+1))/39] $name... "
    if "$@" >/dev/null 2>&1; then
        echo "✅ PASS"
        ((PASSED++))
    else
        echo "❌ FAIL"
        ((FAILED++))
    fi
}

echo "═══════════════════════════════════════════════════════"
echo "  TGE_E2 MERGE VERIFICATION — 39 METHODS"
echo "═══════════════════════════════════════════════════════"
echo ""

# 1-8: SOURCE FILE EXISTENCE
check "MainActivity.java exists" test -f "$PROJECT_DIR/app/src/main/java/com/tge/e2/MainActivity.java"
check "TGEApplication.java exists" test -f "$PROJECT_DIR/app/src/main/java/com/tge/e2/TGEApplication.java"
check "tge_e2.html exists" test -f "$PROJECT_DIR/app/src/main/assets/tge_e2.html"
check "Tile00.prime exists" test -f "$PROJECT_DIR/app/src/main/assets/Tile00.prime"
check "Tile01.prime exists" test -f "$PROJECT_DIR/app/src/main/assets/Tile01.prime"
check "AndroidManifest.xml exists" test -f "$PROJECT_DIR/app/src/main/AndroidManifest.xml"
check "build.sh exists" test -f "$PROJECT_DIR/build.sh"
check "LESSONS_LEARNED.md exists" test -f "$PROJECT_DIR/LESSONS_LEARNED.md"

# 9-15: FRAMEWORK SCRIPTS
check "build_nogradle.sh exists" test -f "$PROJECT_DIR/framework/build_nogradle.sh"
check "MASTER_TODO.md exists" test -f "$PROJECT_DIR/framework/MASTER_TODO.md"
check "WORLD_LINE_STEPS.sh exists" test -f "$PROJECT_DIR/framework/WORLD_LINE_STEPS.sh"
check "verify_reassembly.sh exists" test -f "$PROJECT_DIR/framework/verify_reassembly.sh"
check "verify_github_17ways.sh exists" test -f "$PROJECT_DIR/framework/verify_github_17ways.sh"
check "process_document.sh exists" test -f "$PROJECT_DIR/framework/process_document.sh"
check "heartbeat.sh exists" test -f "$PROJECT_DIR/framework/heartbeat.sh"

# 16-20: PIECE STRUCTURE
check "39 pieces total" test "$(find "$PROJECT_DIR/pieces" -name '*.java' -o -name '*.html' | wc -l)" -eq 39
check "27 Java pieces" test "$(find "$PROJECT_DIR/pieces" -name 'MainActivity_piece_*.java' | wc -l)" -eq 27
check "12 HTML pieces" test "$(find "$PROJECT_DIR/pieces" -name 'tge_e2_piece_*.html' | wc -l)" -eq 12
check "Manifest exists" test -f "$PROJECT_DIR/pieces/ALL_PIECES_manifest.json"
check "Manifest valid JSON" python3 -c "import json; json.load(open('$PROJECT_DIR/pieces/ALL_PIECES_manifest.json'))"

# 21-24: RESOURCE FILES
check "strings.xml exists" test -f "$PROJECT_DIR/app/src/main/res/values/strings.xml"
check "colors.xml exists" test -f "$PROJECT_DIR/app/src/main/res/values/colors.xml"
check "themes.xml exists" test -f "$PROJECT_DIR/app/src/main/res/values/themes.xml"
check "network_security_config.xml exists" test -f "$PROJECT_DIR/app/src/main/res/xml/network_security_config.xml"

# 25-28: CONTENT VALIDATION
check "Package com.tge.e2" grep -q 'package com.tge.e2' "$PROJECT_DIR/app/src/main/java/com/tge/e2/MainActivity.java"
check "Version 2.0.0-E2" grep -q 'VERSION_NAME="2.0.0-E2"' "$PROJECT_DIR/framework/build_nogradle.sh"
check "PrimeEngine class" grep -q 'class PrimeEngine' "$PROJECT_DIR/app/src/main/java/com/tge/e2/MainActivity.java"
check "Fleet mode support" grep -q 'fleetMode' "$PROJECT_DIR/app/src/main/assets/tge_e2.html"

# 29-32: GIT STATE
check "On main or feature branch" bash -c "BR=\$(git branch --show-current); [[ \$BR = 'main' || \$BR = kilo/prime-voxel-vx8 ]]"
check "No uncommitted source changes" git diff --quiet CSMWip/05_BOUNCE/TGE_E2/
check "Has TGE_E2 commits" test "$(git log --oneline --all -- CSMWip/05_BOUNCE/TGE_E2/ | wc -l)" -gt 0
check "Clean worktree (source only)" test -z "$(git status --porcelain CSMWip/05_BOUNCE/TGE_E2/)"

# 33-36: REASSEMBLY VERIFICATION
check "HTML reassembly perfect" bash "$PROJECT_DIR/framework/verify_reassembly.sh" 2>&1 | grep -q 'HTML.*Perfect'
check "Java reassembly perfect" bash "$PROJECT_DIR/framework/verify_reassembly.sh" 2>&1 | grep -q 'Java.*Perfect'
check "All 39 pieces verified" bash "$PROJECT_DIR/framework/verify_reassembly.sh" 2>&1 | grep -q '39 pieces verified'
check "Ready for build" bash "$PROJECT_DIR/framework/verify_reassembly.sh" 2>&1 | grep -q 'Ready for build'

# 37-39: NEXT_RUNNER & WORLDLINE
check "NEXT_RUNNER.sh exists" test -f "$PROJECT_DIR/NEXT_RUNNER.sh"
check "WORLD_LINE_STEPS.sh executable" test -x "$PROJECT_DIR/framework/WORLD_LINE_STEPS.sh"
check "Worldline complete runs" bash -c "source '$PROJECT_DIR/framework/WORLD_LINE_STEPS.sh' && worldline_init >/dev/null 2>&1"

echo ""
echo "═══════════════════════════════════════════════════════"
echo "  RESULTS: $PASSED passed, $FAILED failed (39 total)"
echo "═══════════════════════════════════════════════════════"

if [ $FAILED -eq 0 ]; then
    echo "  ✅ ALL 39 VERIFICATIONS PASSED"
    echo "  ✅ READY FOR MERGE TO MAIN"
    exit 0
else
    echo "  ❌ $FAILED VERIFICATIONS FAILED"
    echo "  ❌ DO NOT MERGE"
    exit 1
fi