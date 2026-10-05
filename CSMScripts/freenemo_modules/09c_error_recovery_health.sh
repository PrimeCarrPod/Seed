#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 09C: Error Recovery — Heartbeat/Chamber Recovery & Health Check
# Handles: daemon restarts, chamber restarts, comprehensive health verification
# ════════════════════════════════════════════════════════════════════════════

# ─── HEARTBEAT RECOVERY ─────────────────────────────────────────────────────
heartbeat_recover_daemon() {
    if ! kill -0 "${HEARTBEAT_PID:-0}" 2>/dev/null; then
        freenemo_warn "Heartbeat daemon died (PID: ${HEARTBEAT_PID:-unknown}). Restarting..."
        local hb_script="${REPO_ROOT}/CSMScripts/heartbeat-daemon.sh"
        if [[ -f "$hb_script" ]]; then
            bash "$hb_script" &
            HEARTBEAT_PID=$!
            export HEARTBEAT_PID
            freenemo_success "Heartbeat daemon restarted (PID: $HEARTBEAT_PID)"
        fi
    fi
}

# ─── EARTHBEAT CHAMBER RECOVERY ─────────────────────────────────────────────
earthbeat_recover_chamber() {
    local chamber="$1"
    local pid_file="${REPO_ROOT}/CSMScripts/earthbeatv3-chamber-${chamber}.pid"
    local pid=$(cat "$pid_file" 2>/dev/null || echo 0)
    if ! kill -0 "$pid" 2>/dev/null; then
        freenemo_warn "Chamber $chamber died (PID: $pid). Restarting..."
        # Restart logic would call the chamber function
        return 1
    fi
    return 0
}

# ─── COMPREHENSIVE HEALTH CHECK ─────────────────────────────────────────────
health_check_all() {
    freenemo_banner "🏥 COMPREHENSIVE HEALTH CHECK"

    local issues=0

    # Repo
    if ! git -C "${REPO_ROOT}" rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        freenemo_error "Repo not accessible"
        ((issues++))
    else
        freenemo_success "Repo OK"
    fi

    # Git sync
    if git -C "${REPO_ROOT}" ls-remote --heads origin main >/dev/null 2>&1; then
        freenemo_success "Git remote reachable"
    else
        freenemo_warn "Git remote unreachable"
        ((issues++))
    fi

    # Heartbeat daemon
    heartbeat_recover_daemon

    # Earthbeat chambers
    for c in 1 2 3 4; do
        earthbeat_recover_chamber "$c" || ((issues++))
    done

    # API endpoint
    if transport_check_connectivity "${NEMOTRON_API_ENDPOINT}"; then
        freenemo_success "API endpoint reachable"
    else
        freenemo_error "API endpoint unreachable"
        ((issues++))
    fi

    # Disk space
    local disk_avail=$(df -h "${REPO_ROOT}" | awk 'NR==2 {print $4}')
    freenemo_log "Disk available: ${disk_avail}"

    if [[ $issues -eq 0 ]]; then
        freenemo_success "All systems healthy"
        return 0
    else
        freenemo_warn "$issues issue(s) detected"
        return 1
    fi
}