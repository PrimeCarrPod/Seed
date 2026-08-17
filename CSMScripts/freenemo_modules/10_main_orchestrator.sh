#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 10: Main Orchestrator — Parallel/Tokenring Execution Entry Point
# Runs: session_init → earthbeat chambers → nemotron API loop → periodic logging
# Supports: single | parallel N | tokenring N | chamber modes
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

# ─── NEMOTRON API LOOP ───────────────────────────────────────────────────────
orch_nemotron_loop() {
    freenemo_banner "🤖 NEMOTRON 3 ULTRA API LOOP — Starting"

    local iteration=0
    while $ORCH_RUNNING; do
        iteration=$((iteration + 1))
        ORCH_ITERATION=$iteration
        freenemo_log "=== Nemotron Loop Iteration $iteration ==="

        # Example: Run a quick nemotron command
        local prompt="System health check: Report current git status, disk usage, and any errors in ${ERROR_LOG_DIR}. Output as JSON."
        local payload=$(nemotron_build_payload "$prompt" false "low" 256 1024 true '{"type": "json_object"}' true)
        
        freenemo_log "Sending request to Nemotron..."
        local start_ms=$(date +%s%3N)
        nemotron_stream_reader "$payload" 60
        local end_ms=$(date +%s%3N)
        local latency=$((end_ms - start_ms))
        
        log_perf_latency "nemotron_api" "$latency" "success"
        log_perf_throughput 0 "$latency"

        # Sleep between iterations (adjustable)
        sleep 10
    done
}

# ─── GITHUB HANDLER INTEGRATION ──────────────────────────────────────────────
orch_github_sync() {
    freenemo_log "Syncing session logs to GitHub..."
    
    # Save main log
    gh_save_file "${SESSION_LOG_DIR}/freenemo.log" "Session log: $(date -u)" "$BRANCH_NAME"
    log_git_push "success" "$BRANCH_NAME" "freenemo.log"

    # Save heartbeat logs
    for hb_log in "${HEARTBEAT_LOG_DIR}"/*.log; do
        [[ -f "$hb_log" ]] || continue
        gh_save_file "$hb_log" "Heartbeat: $(basename "$hb_log")" "$BRANCH_NAME"
        log_git_push "success" "$BRANCH_NAME" "$(basename "$hb_log")"
    done

    # Save git stats
    for gs_log in "${GIT_STATS_LOG_DIR}"/*.log; do
        [[ -f "$gs_log" ]] || continue
        gh_save_file "$gs_log" "GitStats: $(basename "$gs_log")" "$BRANCH_NAME"
    done

    # Save errors
    for err_log in "${ERROR_LOG_DIR}"/*.log; do
        [[ -f "$err_log" ]] || continue
        gh_save_file "$err_log" "Errors: $(basename "$err_log")" "$BRANCH_NAME"
    done

    # Save performance
    for perf_log in "${PERF_LOG_DIR}"/*.log; do
        [[ -f "$perf_log" ]] || continue
        gh_save_file "$perf_log" "Perf: $(basename "$perf_log")" "$BRANCH_NAME"
    done

    freenemo_success "GitHub sync complete"
}

# ─── MAIN ORCHESTRATOR ENTRY ─────────────────────────────────────────────────
freenemo_main() {
    orch_parse_mode "$@"
    
    freenemo_banner "═══════════════════════════════════════════════════════════════"
    freenemo_banner "  FREENEMO v${FREENEMO_VERSION} — Nemotron 3 Ultra Orchestrator"
    freenemo_banner "  Mode: $MODE | Count: $COUNT | Repeat: $REPEAT"
    freenemo_banner "  Session: ${FREENEMO_SESSION_ID} | Agent: ${FREENEMO_AGENT_ID}"
    freenemo_banner "═══════════════════════════════════════════════════════════════"

    # Run the full procedure REPEAT times
    for ((rep=1; rep<=REPEAT; rep++)); do
        freenemo_banner "🔄 PROCEDURE ITERATION $rep / $REPEAT"
        
        # Recovery check at start of each iteration
        repo_recover_load || { freenemo_error "Repo recovery failed"; return 1; }
        
        orch_preflight
        orch_session_init
        orch_launch_earthbeat
        
        # Run nemotron loop in background
        orch_nemotron_loop &
        ORCH_PIDS+=($!)
        
        # GitHub sync loop (every 5 minutes)
        (
            while $ORCH_RUNNING; do
                sleep 300
                orch_github_sync
            done
        ) &
        ORCH_PIDS+=($!)
        
        # Wait for all background processes
        wait
        
        # If not last iteration, brief pause before restart
        if (( rep < REPEAT )); then
            freenemo_log "Iteration $rep complete. Pausing 5s before next iteration..."
            sleep 5
        fi
    done
    
    freenemo_success "All $REPEAT iterations complete"
}