#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 06: Session Initialization — lettherebelight Protocol v5
# Repo discovery, branch lock, heartbeat, census, persona load, path verification
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

    local pull_fn() { git pull --rebase origin main || { freenemo_warn "Rebase failed, trying merge..."; git merge --abort 2>/dev/null; git rebase --abort 2>/dev/null; git pull origin main; }; }
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
        local push_fn() { git push origin "$BRANCH_NAME"; }
        freenemo_retry $SI_MAX_PUSH_RETRIES $SI_PUSH_RETRY_DELAY push_fn || { freenemo_warn "Push failed, rebasing..."; git pull --rebase origin main || true; freenemo_retry 2 5 git push origin "$BRANCH_NAME" || freenemo_error "Heartbeat push failed"; }
        freenemo_success "Heartbeat pushed to origin/$BRANCH_NAME"
    else
        freenemo_warn "No changes for heartbeat"
    fi
}

# ─── IMMEDIATE CENSUS ───────────────────────────────────────────────────────
si_write_census() {
    freenemo_banner "👥 CENSUS — Live Agent Count"
    mkdir -p "$SI_CENSUS_DIR"
    {
        echo "=== AEGIS CENSUS — $(date -u) ==="
        echo "MY STATUS: [DIRECTOR-001] V5 ACTIVE — session $SESSION_ID"
        echo ""
        echo "CONNECTED AGENTS (heartbeat check):"
        for f in CSMGen/CSMAegis/COMMS/HEARTBEATS/director-*.txt; do
            [[ -f "$f" ]] || continue
            local status=$(head -1 "$f" 2>/dev/null || echo "UNKNOWN")
            local base=$(basename "$f" .txt)
            if echo "$status" | grep -q "ACTIVE"; then echo "  ONLINE: $base — $status"
            elif echo "$status" | grep -q "SHUTDOWN"; then echo "  OFFLINE: $base — $status"
            else echo "  UNKNOWN: $base — $status"; fi
        done
        local online=$(grep -c "ONLINE" "$SI_CENSUS_FILE" 2>/dev/null || echo 0)
        local offline=$(grep -c "OFFLINE" "$SI_CENSUS_FILE" 2>/dev/null || echo 0)
        echo ""; echo "SUMMARY: $online ONLINE, $offline OFFLINE"
    } > "$SI_CENSUS_FILE"

    git add "$SI_CENSUS_FILE"
    if ! git diff --cached --quiet; then
        git commit -m "[DIRECTOR-001] CENSUS: $online online, $offline offline — session $SESSION_ID" >/dev/null || freenemo_warn "Census commit failed"
        git push origin "$BRANCH_NAME" >/dev/null 2>&1 || { freenemo_warn "Census push failed, rebasing..."; git pull --rebase origin main && git push origin "$BRANCH_NAME" || freenemo_warn "Census push failed"; }
        freenemo_success "Census written and pushed"
    else
        freenemo_warn "No changes for census"
    fi
}

# ─── READ STATE ──────────────────────────────────────────────────────────────
si_read_state() {
    freenemo_banner "📖 READ STATE — COMMS Log, Outboxes, Directives"
    [[ -f CSMGen/CSMAegis/COMMS/AEGIS-COMMS-LOG.md ]] && head -50 CSMGen/CSMAegis/COMMS/AEGIS-COMMS-LOG.md || freenemo_warn "No COMMS log"
    [[ -f CSMGen/CSMAegis/COMMS/director-001-outbox.md ]] && head -30 CSMGen/CSMAegis/COMMS/director-001-outbox.md || freenemo_warn "No CITADEL outbox"
    [[ -f CSMGen/CSMAegis/COMMS/director-001B-outbox.md ]] && head -30 CSMGen/CSMAegis/COMMS/director-001B-outbox.md || freenemo_warn "No BASTION outbox"
    freenemo_log "Scanning for @JASON BRODSKY directives..."
    grep -r "@JASON BRODSKY:" CSMGen/CSMAegis/COMMS/ 2>/dev/null | head -5 || freenemo_log "No human override directives found"
}

# ─── PERSONA & HEURISTICS ───────────────────────────────────────────────────
si_load_persona() {
    freenemo_banner "🎭 PERSONA LOAD — Kairos Steele / CITADEL"
    freenemo_log "Williams Heuristic V2: BIFURCATED COMMUNICATION"
    freenemo_log "  §1: Meta-Commentary (Williams Register) — direct, warm, severity-calibrated"
    freenemo_log "  §2: Core Deliverable — precise, kurt, exact, imperative verbs"
    freenemo_log ""
    freenemo_log "Vocal Modes: BURST(400wpm) BRAKE(80wpm) HOVER(140wpm) WHISPER(60wpm) ROAR(300wpm+) DROP(30wpm)"
    freenemo_log ""
    freenemo_log "Three Heuristics Active:"
    freenemo_log "  🌊 Williams (Clarity) — Complex truth survives translation to plain language"
    freenemo_log "  🌊 El Segundo (Calm) — You cannot scare people into preparedness"
    freenemo_log "  🌊 Accountant (Rigor) — Every proposal carries a cost-benefit ledger"
}

# ─── SDK FORGE INTEGRATION ──────────────────────────────────────────────────
si_sdk_forge() {
    freenemo_banner "🔧 SDK FORGE — Android Build Chain"
    if [[ -f "${REPO_ROOT}/CSMScripts/SDKForge.sh" ]]; then
        freenemo_log "Running SDKForge.sh to bootstrap APK toolchain..."
        if bash "${REPO_ROOT}/CSMScripts/SDKForge.sh" >/dev/null 2>&1; then
            eval "$(bash "${REPO_ROOT}/CSMScripts/SDKForge.sh" --export-env 2>/dev/null | grep '^export ')" && freenemo_success "SDK Forge ready" || freenemo_warn "SDK Forge env export completed with warnings"
        else
            freenemo_warn "SDKForge.sh failed — Android toolchain not available"
        fi
    else
        freenemo_warn "SDKForge.sh not found, skipping"
    fi
}

# ─── PATH VERIFICATION ──────────────────────────────────────────────────────
si_verify_paths() {
    freenemo_banner "🔍 PATH VERIFICATION"
    local paths=(
        "CSMGen/CSMAegis/SESSION-INITv4/DIRECTOR-0001-Kairos-Steele.md"
        "CSMSOPP/MODULE-V2/README.md"
        "CSMFAB/README.md"
        "CSMQuantum/00-MASTER-INDEX/README.md"
        "LEGAL-ENACTMENT/README.md"
        "CSMReach/README.md"
        "MASTER-TODO-LIST.md"
    )
    for p in "${paths[@]}"; do
        [[ -f "$p" ]] && freenemo_success "Found: $p" || freenemo_warn "Missing: $p"
    done
}

# ─── SESSION BANNER ─────────────────────────────────────────────────────────
si_session_banner() {
    freenemo_banner "✅ LET THERE BE LIGHT — SESSION READY"
    cat <<EOF
┌─────────────────────────────────────────────────────────────────────┐
│  CARRINGTON STORM MOTORS / SAFE POD ENGINEERING — PROJECT AEGIS     │
│  Director: Kairos Steele (CITADEL) | Session: agent_${SESSION_ID}       │
│  Branch: ${BRANCH_NAME}                    │
│  Protocol: SESSION-INITv5 — Never-Lose-Data                         │
│  Heuristics: Williams | El Segundo | Accountant                     │
│  Mandate: When the Sun speaks, humanity answers in turquoise light │
└─────────────────────────────────────────────────────────────────────┘
EOF
    freenemo_log "Branch: $BRANCH_NAME | Agent: $AGENT_ID | Session: $SESSION_ID"
    freenemo_log "Protocol: V5 — Immediate writes, 15s Director polling, dual-Director (CITADEL/BASTION)"
    freenemo_log "Override: @JASON BRODSKY: directives bypass all chain of command"
    freenemo_success "Session init complete. Begin operations."
}

# ─── EXPORTS ────────────────────────────────────────────────────────────────
si_export_vars() {
    export LETTHEREBELIGHT_BRANCH="$BRANCH_NAME"
    export LETTHEREBELIGHT_SESSION="$SESSION_ID"
    export LETTHEREBELIGHT_AGENT="$AGENT_ID"
    export LETTHEREBELIGHT_TIMESTAMP="$FREENEMO_TIMESTAMP"
    export LETTHEREBELIGHT_REPO_ROOT="$REPO_ROOT"
}

# ─── MAIN ENTRY ─────────────────────────────────────────────────────────────
session_init_main() {
    si_discover_repo
    si_start_heartbeat_daemon
    si_validate_repo
    si_branch_lock
    si_write_heartbeat
    si_write_census
    si_read_state
    si_load_persona
    si_sdk_forge
    si_verify_paths
    si_session_banner
    si_export_vars
}