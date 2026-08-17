#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 10B: Main Orchestrator — Nemotron Loop, GitHub Sync, Main Entry
# API loop, periodic GitHub sync, procedure reiteration
# ════════════════════════════════════════════════════════════════════════════

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