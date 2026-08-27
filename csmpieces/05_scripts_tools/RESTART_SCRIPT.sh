#!/usr/bin/env bash
# ============================================================
# RESTART_SCRIPT.sh — Prime Electron Research 360 Session Restart
# Auto-generated from session state
# ============================================================

set -euo pipefail

# ─── CONFIGURATION ────────────────────────────────────────
WORKSPACE="/workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_289e4c1d-dee3-4d5f-8dda-82eb9065e913"
BRANCH="session/prime-electron-research-360"
SESSION_ID="prime-electron-360-session-013"
NEXT_ARTICLE="A1-28_Worldline_BPS_States.md"
NEXT_PIECE="article1_A1-28_piece_01.md"

# ─── COLORS ───────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
CYAN='\033[0;36m'; MAGENTA='\033[0;35m'; BOLD='\033[1m'; NC='\033[0m'
log() { echo -e "${CYAN}[RESTART]${NC} $*"; }
success() { echo -e "${GREEN}[✓]${NC} $*"; }
warn() { echo -e "${YELLOW}[!]${NC} $*"; }
error() { echo -e "${RED}[✗]${NC} $*"; }
banner() { echo -e "\n${MAGENTA}${BOLD}═══ $* ═══${NC}\n"; }

# ─── HEARTBEAT ────────────────────────────────────────────
start_heartbeat() {
    log "Starting heartbeat..."
    while true; do
        echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) alive" >> "$WORKSPACE/.heartbeat"
        sleep 30
    done &
    HEARTBEAT_PID=$!
    log "Heartbeat started (PID: $HEARTBEAT_PID)"
}

# ─── VERIFICATION ─────────────────────────────────────────
verify_state() {
    banner "VERIFYING REPOSITORY STATE"
    
    cd "$WORKSPACE"
    
    # Check branch
    CURRENT_BRANCH=$(git branch --show-current)
    if [[ "$CURRENT_BRANCH" != "$BRANCH" ]]; then
        warn "Not on $BRANCH, checking out..."
        git checkout "$BRANCH"
    fi
    success "On branch: $BRANCH"
    
    # Check remote sync
    LOCAL_HEAD=$(git rev-parse HEAD)
    REMOTE_HEAD=$(git ls-remote origin "$BRANCH" 2>/dev/null | cut -f1)
    if [[ "$LOCAL_HEAD" == "$REMOTE_HEAD" ]]; then
        success "Local and remote in sync ($LOCAL_HEAD)"
    else
        warn "Mismatch: local=$LOCAL_HEAD, remote=$REMOTE_HEAD"
    fi
    
    # Check key files exist
    for f in \
        "CSM_WORK_IN_PROGRESS/c. SM prime electron work in progress/WIP_LOG_Session_001.md" \
        "CSM_WORK_IN_PROGRESS/c. SM prime electron work in progress/ULTRA_MASTER_TODO_LIST.md" \
        "CSMLogs/august26/RESUME_SESSION_A1-27_20260821.md" \
        "A1-26_Worldline_Supercharges.md" \
        "A1-27_Worldline_Superalgebra.md"; do
        if [[ -f "$f" ]]; then
            success "Found: $f ($(wc -l < "$f") lines)"
        else
            error "Missing: $f"
        fi
    done
    
    # Check git status
    if [[ -z "$(git status --porcelain)" ]]; then
        success "Working tree clean"
    else
        warn "Working tree has changes:"
        git status --short
    fi
}

# ─── CONTEXT DISPLAY ──────────────────────────────────────
show_context() {
    banner "SESSION CONTEXT"
    echo "Workspace: $WORKSPACE"
    echo "Branch: $BRANCH"
    echo "Next Article: $NEXT_ARTICLE"
    echo "Next Piece: $NEXT_PIECE"
    echo ""
    echo "Last 5 commits:"
    git log --oneline -5
    echo ""
    echo "Current TODO status:"
    grep -A 2 "CURRENT STATUS" "CSM_WORK_IN_PROGRESS/c. SM prime electron work in progress/ULTRA_MASTER_TODO_LIST.md" || true
}

# ─── MAIN ─────────────────────────────────────────────────
main() {
    banner "PRIME ELECTRON RESEARCH 360 — SESSION RESTART"
    echo "Session: $SESSION_ID"
    echo "Date: $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    echo ""
    
    # Start heartbeat in background
    start_heartbeat
    
    # Verify state
    verify_state
    
    # Show context
    show_context
    
    # Print quick start commands
    banner "QUICK START COMMANDS"
    cat << 'EOF'
# Copy-paste these commands to resume:

cd /workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/sessions/agent_289e4c1d-dee3-4d5f-8dda-82eb9065e913
git checkout session/prime-electron-research-360

# Read context files
cat CSM_WORK_IN_PROGRESS/c.\ SM\ prime\ electron\ work\ in\ progress/WIP_LOG_Session_001.md
cat CSM_WORK_IN_PROGRESS/c.\ SM\ prime\ electron\ work\ in\ progress/ULTRA_MASTER_TODO_LIST.md
cat CSMLogs/august26/RESUME_SESSION_A1-27_20260821.md

# Begin creating A1-28 pieces
# Target: 12 pieces, ≥350 lines concatenated
# First piece: article1_A1-28_piece_01.md

# After creating all 12 pieces:
# cat article1_A1-28_piece_*.md > A1-28_Worldline_BPS_States.md
# wc -l A1-28_Worldline_BPS_States.md  # Verify ≥350
# zip article1_A1-28_pieces.zip article1_A1-28_piece_*.md
# git add article1_A1-28_piece_*.md A1-28_Worldline_BPS_States.md article1_A1-28_pieces.zip
# git commit -m "Add A1-28: Worldline_BPS_States - 12 pieces, XXX lines concat, zip"
# git push origin session/prime-electron-research-360

# Update logs and push
# git add CSM_WORK_IN_PROGRESS/...
# git commit -m "Update WIP log and ULTRA_MASTER_TODO_LIST for A1-28"
# git push origin session/prime-electron-research-360

# Create next resume session
# bash CSMScripts/Github_Handler.sh save CSMLogs/august26/RESUME_SESSION_A1-28_20260821.md "Add resume session for A1-28" session/prime-electron-research-360
EOF

    banner "READY TO CONTINUE"
    log "Next target: A1-28 Worldline_BPS_States.md (12 pieces, ≥350 lines)"
    log "Key framework: 78 BPS states from record gaps, mass formula M=|Z|/2=39, supermultiplet structure"
    
    # Keep script running to maintain heartbeat
    log "Script running. Press Ctrl+C to stop heartbeat and exit."
    wait $HEARTBEAT_PID
}

# Trap Ctrl+C to cleanup
trap 'kill $HEARTBEAT_PID 2>/dev/null; echo; success "Heartbeat stopped. Session ready for manual continuation."; exit 0' INT TERM

main "$@"