#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 08B: Logging & Session Structure — Periodic Printer & Session Summary
# Terminal printing every N seconds, session summary on exit
# ════════════════════════════════════════════════════════════════════════════

# ─── PERIODIC TERMINAL PRINTING ─────────────────────────────────────────────
# Runs in background, prints summary every N seconds
log_periodic_printer() {
    local interval="${1:-30}"
    log_init_session_dirs
    freenemo_log "Starting periodic terminal printer (every ${interval}s)"

    while true; do
        sleep "${interval}"
        echo "" >&2
        freenemo_banner "📊 PERIODIC STATUS — $(date -u +%H:%M:%S)"
        
        # Heartbeat summary
        if [[ -f "${HEARTBEAT_LOG_DIR}/director_heartbeat.log" ]]; then
            local last_hb=$(tail -1 "${HEARTBEAT_LOG_DIR}/director_heartbeat.log" 2>/dev/null)
            freenemo_log "Last Director HB: ${last_hb}"
        fi

        # Git stats
        local pushes_ok=$(wc -l < "${GIT_STATS_LOG_DIR}/push_success.log" 2>/dev/null || echo 0)
        local pushes_fail=$(wc -l < "${GIT_STATS_LOG_DIR}/push_failure.log" 2>/dev/null || echo 0)
        local pulls_ok=$(wc -l < "${GIT_STATS_LOG_DIR}/pull_success.log" 2>/dev/null || echo 0)
        local pulls_fail=$(wc -l < "${GIT_STATS_LOG_DIR}/pull_failure.log" 2>/dev/null || echo 0)
        local commits=$(cat "${GIT_STATS_LOG_DIR}/commit_count.log" 2>/dev/null || echo 0)
        freenemo_log "Git: ${pushes_ok}✓/${pushes_fail}✗ pushes, ${pulls_ok}✓/${pulls_fail}✗ pulls, ${commits} commits"

        # Errors
        local api_err=$(wc -l < "${ERROR_LOG_DIR}/api_errors.log" 2>/dev/null || echo 0)
        local net_err=$(wc -l < "${ERROR_LOG_DIR}/transport_errors.log" 2>/dev/null || echo 0)
        local git_err=$(wc -l < "${ERROR_LOG_DIR}/git_errors.log" 2>/dev/null || echo 0)
        local parse_err=$(wc -l < "${ERROR_LOG_DIR}/parse_errors.log" 2>/dev/null || echo 0)
        freenemo_log "Errors: API=${api_err} Net=${net_err} Git=${git_err} Parse=${parse_err}"

        # Performance
        local timeouts=$(wc -l < "${PERF_LOG_DIR}/timeout_count.log" 2>/dev/null || echo 0)
        local avg_tps=$(awk '{sum+=$NF} END{if(NR>0) printf "%.1f", sum/NR; else print "0"}' "${PERF_LOG_DIR}/throughput.log" 2>/dev/null || echo 0)
        freenemo_log "Perf: ${timeouts} timeouts, avg ${avg_tps} tok/s"

        # Earthbeat chamber status
        for c in 1 2 3 4; do
            local log="${HEARTBEAT_LOG_DIR}/chamber_${c}.log"
            [[ -f "$log" ]] && local last=$(tail -1 "$log" 2>/dev/null) && freenemo_log "Chamber $c: ${last}" || true
        done
    done
}

# ─── SESSION SUMMARY (on exit) ──────────────────────────────────────────────
log_session_summary() {
    freenemo_banner "📋 SESSION SUMMARY — $(date -u +%Y-%m-%dT%H:%M:%SZ)"
    local duration=$(($(date -u +%s) - FREENEMO_START_TIME))
    freenemo_log "Session duration: ${duration}s"
    freenemo_log "Log directory: ${SESSION_LOG_DIR}"

    [[ -f "${GIT_STATS_LOG_DIR}/commit_count.log" ]] && freenemo_log "Total commits: $(cat "${GIT_STATS_LOG_DIR}/commit_count.log")"
    [[ -f "${PERF_LOG_DIR}/timeout_count.log" ]] && freenemo_log "Total timeouts: $(wc -l < "${PERF_LOG_DIR}/timeout_count.log")"
    [[ -f "${ERROR_LOG_DIR}/api_errors.log" ]] && freenemo_log "Total API errors: $(wc -l < "${ERROR_LOG_DIR}/api_errors.log")"
}