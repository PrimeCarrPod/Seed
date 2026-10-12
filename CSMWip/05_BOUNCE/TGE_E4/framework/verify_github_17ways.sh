#!/bin/bash
# verify_github_17ways.sh — TGE_E2 GitHub Verification (17 Methods)
# Adapted from AegisOutfitFabricator for 39-piece pipeline

set -e

PROJECT_DIR="/workspace/app/CSMWip/05_BOUNCE/TGE_E2"
cd "$PROJECT_DIR"

echo "=== TGE_E2 GITHUB VERIFICATION (17 WAYS) ==="

# 1. Git status
echo "1. Git status:"
git status --short | head -20

# 2. Current branch
echo ""
echo "2. Current branch:"
git branch --show-current

# 3. Recent commits
echo ""
echo "3. Recent commits:"
git log --oneline -5

# 4. Piece files tracked
echo ""
echo "4. Piece files in git:"
git ls-files pieces/ | wc -l

# 5. Source files tracked
echo ""
echo "5. Source files in git:"
git ls-files app/src/main/ | wc -l

# 6. Framework scripts tracked
echo ""
echo "6. Framework scripts in git:"
git ls-files framework/ | wc -l

# 7. Manifest exists
echo ""
echo "7. Manifest verification:"
if [ -f pieces/ALL_PIECES_manifest.json ]; then
    echo "  ✅ ALL_PIECES_manifest.json exists"
    python3 -c "
import json
with open('pieces/ALL_PIECES_manifest.json') as f:
    m = json.load(f)
print(f'  Total pieces in manifest: {m[\"total_pieces\"]}')
"
else
    echo "  ❌ Manifest missing"
fi

# 8. HTML piece count
echo ""
echo "8. HTML piece count:"
find pieces/ -name "tge_e2_piece_*.html" | wc -l

# 9. Java piece count
echo ""
echo "9. Java piece count:"
find pieces/ -name "MainActivity_piece_*.java" | wc -l

# 10. Asset files
echo ""
echo "10. Asset files:"
find app/src/main/assets/ -type f | wc -l

# 11. Resource files
echo ""
echo "11. Resource files:"
find app/src/main/res/ -type f | wc -l

# 12. Build script exists
echo ""
echo "12. Build script:"
if [ -x framework/build_nogradle.sh ]; then
    echo "  ✅ build_nogradle.sh executable"
else
    echo "  ❌ build_nogradle.sh missing or not executable"
fi

# 13. Verify script exists
echo ""
echo "13. Verify script:"
if [ -x framework/verify_reassembly.sh ]; then
    echo "  ✅ verify_reassembly.sh executable"
else
    echo "  ❌ verify_reassembly.sh missing or not executable"
fi

# 14. Git diff (uncommitted)
echo ""
echo "14. Uncommitted changes:"
git diff --stat 2>/dev/null | tail -1

# 15. Remote status
echo ""
echo "15. Remote status:"
git remote -v

# 16. Branch upstream
echo ""
echo "16. Upstream tracking:"
git rev-parse --abbrev-ref --symbolic-full-name @{u} 2>/dev/null || echo "  No upstream configured"

# 17. Worktree clean
echo ""
echo "17. Worktree status:"
if [ -z "$(git status --porcelain)" ]; then
    echo "  ✅ Clean worktree"
else
    echo "  ⚠️ Uncommitted changes present"
fi

echo ""
echo "=== 17-WAY VERIFICATION COMPLETE ==="