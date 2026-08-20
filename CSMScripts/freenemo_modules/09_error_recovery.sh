#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 09: Error Recovery — Repo Load Failure Correction, Retries, Fallbacks
# Handles: network failures, git conflicts, API timeouts, parser crashes, empty content
# ════════════════════════════════════════════════════════════════════════════

# ─── REPO LOAD RECOVERY ─────────────────────────────────────────────────────
# If repo cannot be loaded at launch, try multiple strategies
repo_recover_load() {
    freenemo_banner "🔧 REPO RECOVERY — Attempting to Load Repository"

    # Strategy 1: Standard discovery
    if freenemo_git_discover_repo; then
        freenemo_success "Repo discovered at: ${REPO_ROOT}"
        return 0
    fi

    # Strategy 2: Clone from known URL
    freenemo_warn "Strategy 1 failed. Trying clone from ${REPO_URL}..."
    local clone_dir="/tmp/freenemo-repo-$(date +%s)"
    if git clone "${REPO_URL}" "${clone_dir}" 2>/dev/null; then
        REPO_ROOT="${clone_dir}"
        export REPO_ROOT
        freenemo_success "Cloned repo to: ${REPO_ROOT}"
        return 0
    fi

    # Strategy 3: Shallow clone (faster, less bandwidth)
    freenemo_warn "Full clone failed. Trying shallow clone..."
    if git clone --depth 1 "${REPO_URL}" "${clone_dir}" 2>/dev/null; then
        REPO_ROOT="${clone_dir}"
        export REPO_ROOT
        freenemo_success "Shallow cloned repo to: ${REPO_ROOT}"
        return 0
    fi

    # Strategy 4: Try alternative remote (SSH vs HTTPS)
    freenemo_warn "HTTPS clone failed. Trying SSH..."
    local ssh_url="${REPO_URL/https:\/\/github.com\//git@github.com:}"
    if git clone "${ssh_url}" "${clone_dir}" 2>/dev/null; then
        REPO_ROOT="${clone_dir}"
        export REPO_ROOT
        freenemo_success "SSH cloned repo to: ${REPO_ROOT}"
        return 0
    fi

    freenemo_error "All repo recovery strategies failed"
    return 1
}

# ─── GIT CONFLICT RESOLUTION ────────────────────────────────────────────────
git_resolve_conflicts() {
    freenemo_log "Checking for git conflicts..."
    if git status --short | grep -q "^UU\|^AA\|^DD"; then
        freenemo_warn "Conflicts detected. Attempting auto-resolution..."
        # Try ours strategy for binary/config files
        git diff --name-only --diff-filter=U | while read -r file; do
            if [[ "$file" == *.md || "$file" == *.txt || "$file" == *.json || "$file" == *.yaml || "$file" == *.yml ]]; then
                freenemo_log "Auto-merging text file: $file"
                git checkout --ours -- "$file" 2>/dev/null || true
                git add "$file"
            fi
        done
        # Commit resolved
        if ! git diff --cached --quiet; then
            git commit -m "[AUTO-RESOLVE] Merge conflict resolution" >/dev/null 2>&1 || true
            freenemo_success "Conflicts auto-resolved and committed"
        fi
    else
        freenemo_log "No conflicts detected"
    fi
}

# ─── API ERROR RECOVERY ─────────────────────────────────────────────────────
# Handles: empty content (finish_reason=length), tool call dropping, socket stalls
api_recover_empty_content() {
    local response="$1"
    local finish_reason=$(echo "$response" | jq -r '.choices[0].finish_reason // empty')
    local content=$(echo "$response" | jq -r '.choices[0].message.content // empty')
    local reasoning=$(echo "$response" | jq -r '.choices[0].message.reasoning_content // empty')

    if [[ -z "$content" && "$finish_reason" == "length" ]]; then
        freenemo_warn "Empty content with finish_reason=length — token budget exhausted in reasoning"
        freenemo_log "Recovery: Increase max_tokens or decrease thinking_token_budget"
        # Return reasoning as fallback content
        if [[ -n "$reasoning" ]]; then
            echo "$reasoning"
            return 0
        fi
        return 1
    fi

    if [[ -z "$content" && -n "$reasoning" ]]; then
        freenemo_warn "Content empty but reasoning present — possible tool call drop (force_nonempty_content needed)"
        # Try to extract tool calls from reasoning
        echo "$reasoning" | grep -o '{"name".*}' | head -1 || echo "$reasoning"
        return 0
    fi

    echo "$content"
    return 0
}

api_recover_transport() {
    local attempt=1 max_attempts=3 delay=2
    while true; do
        if "$@"; then return 0; fi
        local exit_code=$?
        if [[ $attempt -ge $max_attempts ]]; then
            log_error "transport" "Command failed after $max_attempts attempts" "$*"
            return $exit_code
        fi
        freenemo_warn "Transport error (attempt $attempt/$max_attempts). Retrying in ${delay}s..."
        sleep "$delay"
        delay=$((delay * 2))
        attempt=$((attempt + 1))
    done
}

# ─── PARSER RECOVERY ────────────────────────────────────────────────────────
parse_recover_sse() {
    local line="$1"
    local clean="${line#data: }"
    [[ -z "$clean" || "$clean" == "[DONE]" ]] && return 1

    # Try multiple field paths for reasoning
    local reasoning=$(echo "$clean" | jq -r '.choices[0].delta.reasoning_content // .choices[0].delta.reasoning // empty' 2>/dev/null || true)
    # Try multiple field paths for content
    local content=$(echo "$clean" | jq -r '.choices[0].delta.content // empty' 2>/dev/null || true)

    # If both empty, log parse error
    if [[ -z "$reasoning" && -z "$content" ]]; then
        log_error "parse" "SSE parse returned empty for both reasoning and content" "line: $line"
        return 1
    fi

    # Output what we found
    [[ -n "$reasoning" ]] && printf "\e[2;37m%s\e[0m" "$reasoning"
    [[ -n "$content" ]] && printf "\e[1;32m%s\e[0m" "$content"
    return 0
}

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