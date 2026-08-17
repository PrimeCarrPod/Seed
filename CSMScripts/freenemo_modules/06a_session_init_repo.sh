#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 06A: Session Init — Repo Discovery, Heartbeat Daemon, Repo Validation
# lettherebelight Protocol v5 — Branch lock, immediate heartbeat
# ════════════════════════════════════════════════════════════════════════════

# ─── CONFIG ──────────────────────────────────────────────────────────────────
SI_HEARTBEAT_DIR="CSMGen/CSMAegis/COMMS/HEARTBEATS"
SI_HEARTBEAT_FILE="${SI_HEARTBEAT_DIR}/director-001.txt"
SI_CENSUS_DIR="CSMGen/CSMAegis/COMMS/CENSUS/$(date -u +%Y-%m-%d)"
SI_CENSUS_FILE="${SI_CENSUS_DIR}/census-$(date -u +%H%M).txt"
SI_MAX_PUSH_RETRIES=5
SI_PUSH_RETRY_DELAY=2
SI_MAX_PULL_RETRIES=3
SI_PULL_RETRY_DELAY=3

# ─── REPO DISCOVERY ──────────────────────────────────────────────────────────
si_discover_repo() {
    freenemo_banner "⚡ LET THERE BE LIGHT — Session Init v5"
    freenemo_git_discover_repo || { freenemo_error "Cannot discover git repo"; return 1; }
    [[ -z "$AGENT_ID" ]] && AGENT_ID=$(basename "$REPO_ROOT" | sed 's/^agent_//')
    [[ -z "$SESSION_ID" ]] && SESSION_ID="$AGENT_ID"
    BRANCH_NAME="session/agent_${SESSION_ID}_${FREENEMO_TIMESTAMP}"
    freenemo_log "Repo: $REPO_ROOT | Agent: $AGENT_ID | Session: $SESSION_ID | Branch: $BRANCH_NAME"
    cd "$REPO_ROOT"
}

# ─── HEARTBEAT DAEMON ────────────────────────────────────────────────────────
si_start_heartbeat_daemon() {
    freenemo_banner "💓 HEARTBEAT DAEMON — Continuous Liveness"
    local hb_script="${REPO_ROOT}/CSMScripts/heartbeat-daemon.sh"
    if [[ -f "$hb_script" ]]; then
        bash "$hb_script" &
        HEARTBEAT_PID=$!
        export HEARTBEAT_PID
        freenemo_success "Heartbeat daemon started (PID: $HEARTBEAT_PID)"
        freenemo_log "Heartbeat chars on stderr every ${HEARTBEAT_INTERVAL}s: ${HEARTBEAT_CHARS}"
    else
        freenemo_warn "heartbeat-daemon.sh not found, skipping"
    fi
}

# ─── REPO VALIDATION ────────────────────────────────────────────────────────
si_validate_repo() {
    freenemo_banner "🔍 REPO VALIDATION"
    command -v git >/dev/null 2>&1 || { freenemo_error "git not installed"; return 1; }
    git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { freenemo_error "Not in git work tree"; return 1; }
    freenemo_git_ensure_origin
    local origin_url=$(git remote get-url origin)
    freenemo_log "Origin: $origin_url"
    if ! git ls-remote --heads origin main >/dev/null 2>&1; then
        freenemo_warn "Cannot reach origin/main — local-only mode"
    else
        freenemo_success "Origin reachable"
    fi
    [[ -n "$(git status --short)" ]] && freenemo_warn "Uncommitted changes detected"
}

# ─── BRANCH LOCK ────────────────────────────────────────────────────────────
si_branch_lock() {
    freenemo_banner "🔒 BRANCH LOCK — Checkout main & rebase"
    git show-ref --verify --quiet "refs/heads/main" || { freenemo_warn "Creating main from origin..."; git fetch origin main:main || { freenemo_error "Failed to fetch main"; return 1; }; }
    git checkout main >/dev/null 2>&1 || { freenemo_error "Failed to checkout main"; return 1; }

    pull_fn() { git pull --rebase origin main || { freenemo_warn "Rebase failed, trying merge..."; git merge --abort 2>/dev/null; git rebase --abort 2>/dev/null; git pull origin main; }; }
    freenemo_retry $SI_MAX_PULL_RETRIES $SI_PULL_RETRY_DELAY pull_fn || { freenemo_error "Failed to sync with origin/main"; return 1; }
    freenemo_success "Synced with origin/main"

    if git show-ref --verify --quiet "refs/heads/$BRANCH_NAME"; then
        freenemo_warn "Branch exists, checking out"
        git checkout "$BRANCH_NAME"
    else
        freenemo_log "Creating branch: $BRANCH_NAME"
        git checkout -b "$BRANCH_NAME"
    fi
    freenemo_success "Branch locked: $(git branch --show-current)"
}

# ─── IMMEDIATE HEARTBEAT ────────────────────────────────────────────────────
si_write_heartbeat() {
    freenemo_banner "💓 HEARTBEAT — Write & Push Within 5 Seconds"
    mkdir -p "$SI_HEARTBEAT_DIR"
    cat > "$SI_HEARTBEAT_FILE" <<EOF
[DIRECTOR-001 | $(date -u)] V5 ACTIVE — poll: 15s — branch: $BRANCH_NAME — agent: $AGENT_ID — session: $SESSION_ID
EOF

    git add "$SI_HEARTBEAT_FILE"
    if ! git diff --cached --quiet; then
        git commit -m "[DIRECTOR-001] V5 HEARTBEAT — session $SESSION_ID initiated" >/dev/null || freenemo_warn "Heartbeat commit failed"
        push_fn() { git push origin "$BRANCH_NAME"; }
        freenemo_retry $SI_MAX_PUSH_RETRIES $SI_PUSH_RETRY_DELAY push_fn || { freenemo_warn "Push failed, rebasing..."; git pull --rebase origin main || true; freenemo_retry 2 5 git push origin "$BRANCH_NAME" || freenemo_error "Heartbeat push failed"; }
        freenemo_success "Heartbeat pushed to origin/$BRANCH_NAME"
    else
        freenemo_warn "No changes for heartbeat"
    fi
}