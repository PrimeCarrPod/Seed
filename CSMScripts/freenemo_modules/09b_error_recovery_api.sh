#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 09B: Error Recovery — API Error Recovery & Parser Recovery
# Handles: empty content (finish_reason=length), tool call dropping, socket stalls, SSE parsing
# ════════════════════════════════════════════════════════════════════════════

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