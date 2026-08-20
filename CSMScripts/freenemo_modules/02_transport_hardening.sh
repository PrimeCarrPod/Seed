#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 02: Transport Layer Hardening — TCP/BBR, SSH Multiplexing, cURL Timeouts
# Optimized for trans-oceanic links (Costa Rica → US East Coast: 45-65ms RTT)
# ════════════════════════════════════════════════════════════════════════════

# ─── KERNEL TCP TUNING (requires root) ──────────────────────────────────────
# Expands buffers to 16MB for BDP over ARCOS-1/MAYA-1 submarine cables
# Enables BBR congestion control for bandwidth-modeling over loss-based
transport_tune_kernel() {
    if [[ $EUID -ne 0 ]]; then
        freenemo_warn "Kernel tuning requires root. Skipping (run with sudo for full optimization)."
        return 0
    fi

    freenemo_log "Applying TCP/IP kernel optimizations for LLM streaming..."

    sysctl -w net.ipv4.tcp_rmem="4096 87380 16777216" >/dev/null
    sysctl -w net.ipv4.tcp_wmem="4096 65536 16777216" >/dev/null
    sysctl -w net.ipv4.tcp_congestion_control="bbr" >/dev/null
    sysctl -w net.ipv4.tcp_timestamps=1 >/dev/null

    # Persist across reboots
    cat > /etc/sysctl.d/99-freenemo-llm.conf <<'EOF'
# FreeNemo LLM Streaming Optimizations
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 65536 16777216
net.ipv4.tcp_congestion_control = bbr
net.ipv4.tcp_timestamps = 1
EOF

    freenemo_success "Kernel TCP tuning applied (BBR + 16MB buffers)"
}

# ─── SSH MULTIPLEXING CONFIG ────────────────────────────────────────────────
# Eliminates 200-300ms handshake overhead per command over 65ms links
transport_setup_ssh_multiplexing() {
    local ssh_config="${HOME}/.ssh/config"
    mkdir -p "${HOME}/.ssh/sockets"

    if ! grep -q "ControlMaster auto" "${ssh_config}" 2>/dev/null; then
        cat >> "${ssh_config}" <<'EOF'

# FreeNemo SSH Multiplexing for LLM API Tunnels
Host *
    ControlMaster auto
    ControlPath ~/.ssh/sockets/%r@%h-%p
    ControlPersist 10m
    Ciphers aes128-ctr
    Compression yes
    ServerAliveInterval 30
    ServerAliveCountMax 3
EOF
        freenemo_success "SSH multiplexing configured (~/.ssh/config)"
    else
        freenemo_log "SSH multiplexing already configured"
    fi
}

# ─── CURL TRANSPORT DEFAULTS ────────────────────────────────────────────────
# Layered timeout strategy: fast failover + keepalive + wall-clock bound
export FREENEMO_CURL_OPTS=(
    "--connect-timeout" "5"       # Fail fast if handshake stalls
    "--keepalive-time" "60"       # TCP probes during long reasoning
    "--max-time" "300"            # 5-min absolute wall-clock limit
    "-H" "HTTP-Referer: https://kilo.ai"
    "-H" "X-Title: FreeNemo-Orchestrator"
)

# ─── RESILIENT CURL WRAPPER ─────────────────────────────────────────────────
# Adds retry logic with exponential backoff for transient failures
freenemo_curl() {
    local max_retries=3
    local retry_delay=2
    local attempt=1

    while true; do
        if curl "${FREENEMO_CURL_OPTS[@]}" "$@"; then
            return 0
        fi
        local exit_code=$?
        if [[ $attempt -ge $max_retries ]]; then
            freenemo_error "curl failed after $max_retries attempts (exit: $exit_code)"
            return $exit_code
        fi
        freenemo_warn "curl attempt $attempt/$max_retries failed. Retrying in ${retry_delay}s..."
        sleep "$retry_delay"
        retry_delay=$((retry_delay * 2))
        attempt=$((attempt + 1))
    done
}

# ─── NETWORK HEALTH CHECK ───────────────────────────────────────────────────
transport_check_connectivity() {
    local endpoint="${1:-${NEMOTRON_API_ENDPOINT}}"
    freenemo_log "Checking connectivity to ${endpoint}..."

    if freenemo_curl -s -o /dev/null -w "%{http_code}" --max-time 10 "${endpoint}" | grep -q "^2"; then
        freenemo_success "Endpoint reachable"
        return 0
    else
        freenemo_error "Endpoint unreachable"
        return 1
    fi
}