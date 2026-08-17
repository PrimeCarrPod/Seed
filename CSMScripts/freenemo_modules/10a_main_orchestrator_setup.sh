#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 10A: Main Orchestrator — Setup, Preflight, Session Init, Earthbeat Launch
# Global state, signal handling, mode parsing, preflight checks
# ════════════════════════════════════════════════════════════════════════════

# ─── GLOBAL STATE ────────────────────────────────────────────────────────────
ORCH_PIDS=()
ORCH_CHAMBER_PIDS=()
ORCH_RUNNING=true
ORCH_ITERATION=0

# ─── SIGNAL HANDLING ─────────────────────────────────────────────────────────
orch_cleanup() {
    freenemo_log "Shutting down orchestrator..."
    ORCH_RUNNING=false
    for pid in "${ORCH_PIDS[@]}" "${ORCH_CHAMBER_PIDS[@]}"; do
        kill "$pid" 2>/dev/null || true
    done
    wait 2>/dev/null || true
    log_session_summary
    freenemo_success "Orchestrator stopped cleanly"
    exit 0
}
trap orch_cleanup SIGTERM SIGINT EXIT

# ─── MODE PARSING ────────────────────────────────────────────────────────────
orch_parse_mode() {
    MODE="chamber"
    COUNT=4
    TOKENRING=false
    PARALLEL=false
    REPEAT=1  # Number of times to reiterate the full procedure

    if [[ $# -gt 0 ]]; then
        case "$1" in
            chamber) MODE="chamber" ;;
            parallel) PARALLEL=true; MODE="parallel"; [[ $# -ge 2 && "$2" =~ ^[0-9]+$ ]] && COUNT=$2; shift ;;
            tokenring) TOKENRING=true; MODE="tokenring"; [[ $# -ge 2 && "$2" =~ ^[0-9]+$ ]] && COUNT=$2; shift ;;
            repeat) REPEAT="${2:-1}"; shift ;;
            *) [[ "$1" =~ ^[0-9]+$ ]] && COUNT=$1 ;;
        esac
        [[ "$1" == "parallel" && "$2" == "tokenring" ]] && { TOKENRING=true; MODE="tokenring"; [[ $# -ge 3 && "$3" =~ ^[0-9]+$ ]] && COUNT=$3; }
    fi
}

# ─── PRE-FLIGHT CHECKS ───────────────────────────────────────────────────────
orch_preflight() {
    freenemo_banner "🚀 FREENEMO PRE-FLIGHT CHECKS"

    # Transport hardening
    transport_setup_ssh_multiplexing
    transport_tune_kernel

    # vLLM config check
    vllm_check_hardware
    vllm_print_matrix

    # Health check
    health_check_all || freenemo_warn "Health check issues detected, continuing anyway..."

    # Start periodic logger
    log_periodic_printer 30 &
    ORCH_PIDS+=($!)
    freenemo_log "Periodic logger started (PID: $!)"

    freenemo_success "Pre-flight complete"
}

# ─── SESSION INITIALIZATION ──────────────────────────────────────────────────
orch_session_init() {
    freenemo_banner "📋 SESSION INITIALIZATION"
    session_init_main
    freenemo_success "Session initialized"
}

# ─── EARTHBEAT LAUNCHER ──────────────────────────────────────────────────────
orch_launch_earthbeat() {
    freenemo_banner "🌍 LAUNCHING EARTHBEAT — Mode: $MODE"

    case "$MODE" in
        chamber)
            eb_run_chamber_mode &
            ORCH_CHAMBER_PIDS+=($!)
            ;;
        parallel|tokenring)
            eb_run_parallel "$MODE" "$COUNT" &
            ORCH_CHAMBER_PIDS+=($!)
            ;;
    esac

    freenemo_log "Earthbeat launched (PIDs: ${ORCH_CHAMBER_PIDS[*]})"
}