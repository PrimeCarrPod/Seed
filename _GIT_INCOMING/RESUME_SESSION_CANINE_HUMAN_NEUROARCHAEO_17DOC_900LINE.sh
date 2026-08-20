#!/usr/bin/env bash
# ============================================================
# RESUME_SESSION_CANINE_HUMAN_NEUROARCHAEO_17DOC_900LINE.sh
# Session Resume for: Canine-Human Neurobiology and Archaeogenetics
# 17 Documents × 900 Lines Deep Technical Deep Research
# ============================================================
# Title: SESSION_CANINE_HUMAN_NEUROARCHAEO_17DOC_900LINE
# Created: 2026-08-19
# Purpose: Instant restore for 17-doc deep research pipeline
# ============================================================

set -euo pipefail

# ─── CONFIGURATION ─────────────────────────────────────────
SESSION_TITLE="SESSION_CANINE_HUMAN_NEUROARCHAEO_17DOC_900LINE"
REPO_URL="https://github.com/PrimeCarrPod/SEED.git"
TARGET_BRANCH="main"
WORK_DIR="$(pwd)"
CONTENT_DIR="$WORK_DIR/DeepResearch/Canine-Human_Neurobiology_and_Archaeogenetics/ContentFiles"
PLAN_FILE="$CONTENT_DIR/PLAN_17_Documents.md"
TIMESTAMP=$(date -u +%Y%m%d-%H%M%S)

# ─── COLORS ────────────────────────────────────────────────
RED='\033[0;31m'; GREEN='\033[0;32m'; YELLOW='\033[1;33m'
CYAN='\033[0;36m'; MAGENTA='\033[0;35m'; BOLD='\033[1m'; NC='\033[0m'
log() { echo -e "${CYAN}[RESUME:${SESSION_TITLE}]${NC} $*"; }
success() { echo -e "${GREEN}[✓]${NC} $*"; }
warn() { echo -e "${YELLOW}[!]${NC} $*"; }
error() { echo -e "${RED}[✗]${NC} $*"; }
banner() { echo -e "\n${MAGENTA}${BOLD}$*${NC}\n"; }

# ─── HEARTBEAT ─────────────────────────────────────────────
start_heartbeat() {
    banner "STARTING CONTINUOUS HEARTBEAT"
    bash "$WORK_DIR/heartbeat.sh" &
    HB_PID=$!
    log "Heartbeat daemon: PID $HB_PID"
    success "Heartbeat running"
}

check_heartbeat() {
    if pgrep -f "heartbeat.sh" >/dev/null; then
        success "Heartbeat: RUNNING"
    else
        warn "Heartbeat: STOPPED - restarting"
        start_heartbeat
    fi
}

# ─── VERIFY PLAN ───────────────────────────────────────────
verify_plan() {
    banner "VERIFYING PLAN DOCUMENT"
    if [[ -f "$PLAN_FILE" ]]; then
        success "Plan found: $PLAN_FILE"
        wc -l "$PLAN_FILE"
    else
        error "Plan missing: $PLAN_FILE"
        exit 1
    fi
}

# ─── VERIFY CONTENT STRUCTURE ──────────────────────────────
verify_content_structure() {
    banner "VERIFYING CONTENT FILES STRUCTURE"
    ls -la "$CONTENT_DIR/"
    local doc_count=$(ls "$CONTENT_DIR"/Doc_*.md 2>/dev/null | wc -l)
    log "Documents completed: $doc_count / 17"
}

# ─── GIT STATUS ────────────────────────────────────────────
show_git_status() {
    banner "GIT STATUS"
    cd "$WORK_DIR"
    git status --short
    log "Branch: $(git branch --show-current)"
    log "Commit: $(git log --oneline -1)"
}

# ─── RESUME STATE ──────────────────────────────────────────
save_resume_state() {
    banner "SAVING RESUME STATE"
    cat > "$WORK_DIR/RESUME_STATE_${SESSION_TITLE}.txt" <<EOF
SESSION_TITLE: $SESSION_TITLE
TIMESTAMP: $(date -u +%Y-%m-%dT%H:%M:%SZ)
BRANCH: $(cd "$WORK_DIR" && git branch --show-current)
COMMIT: $(cd "$WORK_DIR" && git rev-parse HEAD)
WORK_DIR: $WORK_DIR
CONTENT_DIR: $CONTENT_DIR
DOCS_COMPLETED: $(ls "$CONTENT_DIR"/Doc_*.md 2>/dev/null | wc -l)
DOCS_TARGET: 17
LINES_PER_DOC: 900
HEARTBEAT_PID: ${HB_PID:-unknown}
NEXT_ACTION: Continue document generation from next incomplete piece
EOF
    success "Resume state saved"
}

# ─── MAIN ──────────────────────────────────────────────────
main() {
    clear
    echo -e "${MAGENTA}${BOLD}"
    cat <<'EOF'
╔══════════════════════════════════════════════════════════════════════════════╗
║  RESUME: SESSION_CANINE_HUMAN_NEUROARCHAEO_17DOC_900LINE                     ║
║  17 Documents × 900 Lines — Deep Technical Deep Research                     ║
║  Canine-Human Neurobiology and Archaeogenetics                               ║
╚══════════════════════════════════════════════════════════════════════════════╝
EOF
    echo -e "${NC}"

    check_heartbeat
    verify_plan
    verify_content_structure
    show_git_status
    save_resume_state

    banner "SESSION RESTORED — READY TO CONTINUE"
    echo "Next: Generate next piece for current document"
    echo "Plan: $PLAN_FILE"
    echo "Content: $CONTENT_DIR"
    echo ""
    echo "To continue Doc 01 Piece 01:"
    echo "  # Edit piece generation script"
    echo "  # Run assembly"
}

main "$@"