#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 06C: Session Init — Persona Load, Path Verification, Session Banner
# lettherebelight Protocol v5 — Kairos Steele/CITADEL, exports
# ════════════════════════════════════════════════════════════════════════════

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