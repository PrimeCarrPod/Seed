#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 08A: Logging & Session Structure — Core Logging Functions
# CSMLogs/Sessions/Session'Date-Time'/ — Heartbeat, gitstats, errors, performance
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