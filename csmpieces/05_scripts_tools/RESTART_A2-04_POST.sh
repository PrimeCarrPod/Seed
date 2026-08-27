#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# RESTART SCRIPT — Prime Electron Research 360
# Auto-generated after A2-04 completion
# ════════════════════════════════════════════════════════════════════════════

set -euo pipefail

# Configuration
REPO_ROOT="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_78b0e13f-fdf0-4d4c-8cf7-603d7b61559b"
BRANCH="session/prime-electron-research-360"
WIP_DIR="$REPO_ROOT/CSM_WORK_IN_PROGRESS/c. SM prime electron work in progress"
LOGS_DIR="$REPO_ROOT/CSMLogs/august26"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

log_info() { echo -e "${BLUE}[INFO]${NC} $*"; }
log_success() { echo -e "${GREEN}[SUCCESS]${NC} $*"; }
log_warn() { echo -e "${YELLOW}[WARN]${NC} $*"; }
log_error() { echo -e "${RED}[ERROR]${NC} $*"; }

# ════════════════════════════════════════════════════════════════════════════
# MAIN RESTART SEQUENCE
# ════════════════════════════════════════════════════════════════════════════

main() {
    log_info "════════════════════════════════════════════════════════════════════════════"
    log_info "RESTARTING Prime Electron Research 360 — Post A2-04 Session"
    log_info "════════════════════════════════════════════════════════════════════════════"
    
    cd "$REPO_ROOT"
    
    # Step 1: Verify repository state
    log_info "Step 1: Verifying repository state..."
    if ! git status | grep -q "nothing to commit"; then
        log_warn "Working tree not clean. Stashing changes..."
        git stash push -m "auto-stash before restart $(date -u +%Y%m%dT%H%M%SZ)"
    fi
    
    # Step 2: Checkout correct branch
    log_info "Step 2: Checking out branch $BRANCH..."
    git checkout "$BRANCH"
    git pull --rebase origin "$BRANCH"
    
    # Step 3: Display current status
    log_info "Step 3: Current status..."
    echo "  Branch: $(git branch --show-current)"
    echo "  HEAD: $(git rev-parse --short HEAD)"
    echo "  Last commit: $(git log -1 --pretty=format:'%s')"
    echo ""
    
    # Step 4: Show key files
    log_info "Step 4: Key progress files..."
    echo "  WIP Log: $WIP_DIR/WIP_LOG_Session_001.md"
    echo "  TODO List: $WIP_DIR/ULTRA_MASTER_TODO_LIST.md"
    echo "  Last Resume: $LOGS_DIR/RESUME_SESSION_A2-04_20260821.md"
    echo ""
    
    # Step 5: Verify Article 2 progress
    log_info "Step 5: Article 2 completion status..."
    for f in A2-01 A2-02 A2-03 A2-04; do
        if [[ -f "${f}_"*.md ]]; then
            lines=$(wc -l < "${f}_"*.md 2>/dev/null | head -1)
            echo "  $f: ${lines} lines ✅"
        else
            echo "  $f: NOT FOUND ❌"
        fi
    done
    echo ""
    
    # Step 6: Show next action
    log_info "Step 6: NEXT ACTION — Create A2-05 Tau_Excitation_Gap_6.md"
    echo "  Target: 350+ lines, 12 pieces, zip, commit, push"
    echo "  Focus: Tau mass from {14,18,20,22} record gap cluster straddling d=16 self-dual scale"
    echo "  Key refs: A1-36 (d=16 self-dual), A2-03 (3-gen proof), A2-04 (muon derivation)"
    echo ""
    
    # Step 7: Resumption commands
    log_info "Step 7: Resumption commands for next session:"
    cat << 'EOF'
    
# ════════════════════════════════════════════════════════════════════════════
# COPY-PASTE THESE COMMANDS TO START NEXT SESSION
# ════════════════════════════════════════════════════════════════════════════

cd /workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_3fd48397-7da0-413f-8f78-aebc17d72a18
git checkout session/prime-electron-research-360
cat CSM_WORK_IN_PROGRESS/c.\ SM\ prime\ electron\ work\ in\ progress/WIP_LOG_Session_001.md
cat CSM_WORK_IN_PROGRESS/c.\ SM\ prime\ electron\ work\ in\ progress/ULTRA_MASTER_TODO_LIST.md
cat CSMLogs/august26/RESUME_SESSION_A2-04_20260821.md
# Continue with Article 2: A2-05 Tau_Excitation_Gap_6.md

# ════════════════════════════════════════════════════════════════════════════
EOF
    
    # Step 8: Verification checklist
    log_info "Step 8: Verification checklist (run after each file):"
    cat << 'EOF'
  1. git log --oneline -5
  2. git status
  3. git ls-files | grep A2-XX
  4. wc -l A2-XX_*.md          # Must be ≥350
  5. git ls-remote origin session/prime-electron-research-360
  6. git diff HEAD~1 --name-only
  7. git show --stat HEAD
  8. Check GitHub web UI
  9. git fetch && git log origin/... --oneline
  10. git rev-parse HEAD
  11. ls -la *.zip
  12. unzip -l article2_A2-XX_pieces.zip   # Must show 12 files
  13. cat A2-XX_*.md | head -20
  14. git log --all --oneline | grep A2-XX
  15. git hash-object vs git ls-tree
  16. git reflog -1
EOF
    
    log_success "═════════════════════════════════════════════════════════════════════════════"
    log_success "RESTART COMPLETE — Ready for A2-05 Tau_Excitation_Gap_6.md"
    log_success "════════════════════════════════════════════════════════════════════════════"
}

# Run main
main "$@"