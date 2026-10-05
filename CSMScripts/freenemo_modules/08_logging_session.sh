#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 08: Logging & Session Structure — CSMLogs/Sessions/Session'Date-Time'/
# Heartbeat, gitstats, errors, timeouts, performance — periodic terminal printing
# ════════════════════════════════════════════════════════════════════════════

# ─── SESSION LOG STRUCTURE ──────────────────────────────────────────────────
# CSMLogs/
#   Sessions/
#     Session_YYYYMMDD-HHMMSS/
#       freenemo.log           # Main orchestrator log
#       heartbeats/
#         chamber_1.log        # Schumann chamber
#         chamber_2.log        # Geomag chamber
#         chamber_3.log        # Solar chamber
#         chamber_4.log        # Integration chamber
#         director_heartbeat.log  # Main heartbeat daemon
#       gitstats/
#         push_success.log     # Successful pushes
#         push_failure.log     # Failed pushes
#         pull_success.log     # Successful pulls
#         pull_failure.log     # Failed pulls
#         commit_count.log     # Commits per session
#       errors/
#         api_errors.log       # Nemotron API errors
#         transport_errors.log # Network/curl errors
#         git_errors.log       # Git operation errors
#         parse_errors.log     # JSON/stream parse errors
#       performance/
#         latency.log          # Request/response latency
#         token_usage.log      # Input/output tokens per request
#         throughput.log       # Tokens/second
#         timeout_count.log    # --max-time hits

LOG_INIT_DONE=false

log_init_session_dirs() {
    [[ "$LOG_INIT_DONE" == "true" ]] && return 0
    mkdir -p "${HEARTBEAT_LOG_DIR}" "${GIT_STATS_LOG_DIR}" "${ERROR_LOG_DIR}" "${PERF_LOG_DIR}"
    LOG_INIT_DONE=true
    freenemo_log "Session log directories initialized at ${SESSION_LOG_DIR}"
}

# ─── HEARTBEAT LOGGING ──────────────────────────────────────────────────────
log_heartbeat() {
    local chamber="$1" status="$2" detail="$3"
    log_init_session_dirs
    local log_file="${HEARTBEAT_LOG_DIR}/chamber_${chamber}.log"
    echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) | ${chamber} | ${status} | ${detail}" >> "${log_file}"
}

log_director_heartbeat() {
    log_init_session_dirs
    echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) | DIRECTOR | $1" >> "${HEARTBEAT_LOG_DIR}/director_heartbeat.log"
}

# ─── GIT STATS LOGGING ──────────────────────────────────────────────────────
log_git_push() {
    local status="$1" branch="$2" detail="$3"
    log_init_session_dirs
    local log_file="${GIT_STATS_LOG_DIR}/push_${status}.log"
    echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) | branch=${branch} | ${detail}" >> "${log_file}"
    # Also update commit count
    if [[ "$status" == "success" ]]; then
        local count_file="${GIT_STATS_LOG_DIR}/commit_count.log"
        local count=$(cat "${count_file}" 2>/dev/null || echo 0)
        echo $((count + 1)) > "${count_file}"
    fi
}

log_git_pull() {
    local status="$1" detail="$2"
    log_init_session_dirs
    local log_file="${GIT_STATS_LOG_DIR}/pull_${status}.log"
    echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) | ${detail}" >> "${log_file}"
}

# ─── ERROR LOGGING ──────────────────────────────────────────────────────────
log_error() {
    local category="$1" message="$2" context="${3:-}"
    log_init_session_dirs
    local log_file="${ERROR_LOG_DIR}/${category}_errors.log"
    echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) | ${message} | ${context}" >> "${log_file}"
    freenemo_error "[${category}] ${message}"
}

# ─── PERFORMANCE LOGGING ────────────────────────────────────────────────────
log_perf_latency() {
    local endpoint="$1" latency_ms="$2" status="$3"
    log_init_session_dirs
    echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) | ${endpoint} | ${latency_ms}ms | ${status}" >> "${PERF_LOG_DIR}/latency.log"
}

log_perf_tokens() {
    local input_tokens="$1" output_tokens="$2" reasoning_tokens="$3"
    log_init_session_dirs
    echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) | in=${input_tokens} out=${output_tokens} reasoning=${reasoning_tokens}" >> "${PERF_LOG_DIR}/token_usage.log"
}

log_perf_throughput() {
    local tokens="$1" duration_ms="$2"
    local tps=$(awk "BEGIN{printf \"%.2f\", $tokens/($duration_ms/1000)}")
    log_init_session_dirs
    echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) | ${tokens} tokens in ${duration_ms}ms = ${tps} tok/s" >> "${PERF_LOG_DIR}/throughput.log"
}

log_timeout() {
    local operation="$1" timeout_sec="$2"
    log_init_session_dirs
    echo "$(date -u +%Y-%m-%dT%H:%M:%SZ) | ${operation} | timeout=${timeout_sec}s" >> "${PERF_LOG_DIR}/timeout_count.log"
    freenemo_warn "TIMEOUT: ${operation} exceeded ${timeout_sec}s"
}

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