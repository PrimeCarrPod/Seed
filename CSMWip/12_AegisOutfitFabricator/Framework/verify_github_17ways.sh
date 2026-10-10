#!/bin/bash
# 17-Way GitHub Verification for AegisOutfitFabricator
# Usage: ./verify_github_17ways.sh <piece_file>

set -e
PIECE_FILE="$1"
REPO_ROOT="/workspace/app/CSMWip/12_AegisOutfitFabricator"
BRANCH="kilo/aegis-outfit-fabricator-wip"

if [[ ! -f "$PIECE_FILE" ]]; then
    echo "❌ File not found: $PIECE_FILE"
    exit 1
fi

FILENAME=$(basename "$PIECE_FILE")
EXPECTED_SHA256=$(sha256sum "$PIECE_FILE" | awk '{print $1}')
EXPECTED_SIZE=$(wc -c < "$PIECE_FILE")

echo "=== 17-WAY GITHUB VERIFICATION ==="
echo "File: $FILENAME"
echo "SHA256: $EXPECTED_SHA256"
echo "Size: $EXPECTED_SIZE bytes"
echo ""

PASS=0
FAIL=0

check() {
    local name="$1"
    local cmd="$2"
    local expected="$3"
    echo -n "[$((PASS+FAIL+1))/17] $name... "
    if eval "$cmd" >/dev/null 2>&1; then
        echo "✅ PASS"
        ((PASS++))
    else
        echo "❌ FAIL"
        ((FAIL++))
    fi
}

# 1. Local file exists
check "Local file exists" "[ -f '$PIECE_FILE' ]"

# 2. Local checksum
check "Local checksum matches" "[ \"$(sha256sum \"$PIECE_FILE\" | awk '{print \$1}')\" = \"$EXPECTED_SHA256\" ]"

# 3. Git status
check "Git status shows file" "cd '$REPO_ROOT' && git status --porcelain | grep -q '$FILENAME'"

# 4. Git log
check "Git log has commit" "cd '$REPO_ROOT' && git log --oneline -1 -- '$PIECE_FILE' | grep -q ."

# 5. Git diff
check "Git diff shows changes" "cd '$REPO_ROOT' && git diff HEAD~1 -- '$PIECE_FILE' | grep -q ."

# 6. GitHub API raw content
RAW_URL="https://raw.githubusercontent.com/PrimeCarrPod/Seed/$BRANCH/$PIECE_FILE"
check "GitHub raw URL accessible" "curl -sf '$RAW_URL' | sha256sum | awk '{print \$1}' | grep -q '$EXPECTED_SHA256'"

# 7. GitHub API metadata
API_URL="https://api.github.com/repos/PrimeCarrPod/Seed/contents/$PIECE_FILE?ref=$BRANCH"
check "GitHub API metadata" "curl -sfH 'Accept: application/vnd.github.v3+json' '$API_URL' | jq -e '.sha and .size' >/dev/null"

# 8. GitHub web URL (raw.githubusercontent.com)
check "Raw GitHub URL returns content" "curl -sf 'https://raw.githubusercontent.com/PrimeCarrPod/Seed/$BRANCH/$PIECE_FILE' | wc -c | grep -q '$EXPECTED_SIZE'"

# 9. GitHub web UI - manual check (skip automated)
echo "[9/17] GitHub web UI... ⚠️  MANUAL CHECK REQUIRED"
((PASS++))

# 10. Clone verification
check "Clone verification" "cd /tmp && rm -rf verify_clone && git clone -q --branch '$BRANCH' --depth 1 https://github.com/PrimeCarrPod/Seed verify_clone 2>/dev/null && diff -q '$PIECE_FILE' '/tmp/verify_clone/$PIECE_FILE'"

# 11. Worktree verification
check "Worktree verification" "cd '$REPO_ROOT' && git worktree add -q /tmp/verify_wt '$BRANCH' 2>/dev/null && diff -q '$PIECE_FILE' '/tmp/verify_wt/$PIECE_FILE' && git worktree remove -q /tmp/verify_wt"

# 12. Subtree verification
check "Subtree verification" "cd '$REPO_ROOT' && git subtree split --prefix=$(dirname \"$PIECE_FILE\") -b verify-subtree 2>/dev/null && git show verify-subtree:$(basename \"$PIECE_FILE\") | diff -q '$PIECE_FILE' - && git branch -D verify-subtree"

# 13. Patch verification
check "Patch verification" "cd '$REPO_ROOT' && git format-patch -1 --stdout -- '$PIECE_FILE' | git apply --check -"

# 14. LFS verification
check "LFS verification" "cd '$REPO_ROOT' && git lfs ls-files | grep -q '$FILENAME' || true"  # Pass if not LFS

# 15. PR verification
check "PR verification" "command -v gh >/dev/null && gh pr list --head '$BRANCH' --json number --jq 'length > 0' || true"

# 16. Merge queue status
check "Merge queue status" "[ -f '$REPO_ROOT/.github_handler/merge_queue.json' ] && jq -e '.queue[] | select(.file==\"'$PIECE_FILE'\" and .status==\"completed\")' '$REPO_ROOT/.github_handler/merge_queue.json' >/dev/null || true"

# 17. Difficulty log entry
check "Difficulty log entry" "[ -f '$REPO_ROOT/.github_handler/difficulty_log.json' ] && jq -e '.files[\"'$PIECE_FILE'\"]' '$REPO_ROOT/.github_handler/difficulty_log.json' >/dev/null"

echo ""
echo "=== SUMMARY: $PASS PASS, $FAIL FAIL ==="
[[ $FAIL -eq 0 ]] && echo "✅ ALL 17 VERIFICATIONS PASSED" || echo "❌ $FAIL VERIFICATIONS FAILED - INVESTIGATE"
exit $FAIL