#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 01: Nemotron 3 Ultra API Payload Optimization
# Dual-stream SSE, reasoning budgets, MTP optimization, tool calling fixes
# ════════════════════════════════════════════════════════════════════════════

# ─── BUILD OPTIMIZED PAYLOAD ────────────────────────────────────────────────
# Uses: enable_thinking, reasoning_effort, thinking_token_budget, force_nonempty_content
# Optimized for Nemotron 3 Ultra: 55B active, 1M context, MTP 5-token draft
nemotron_build_payload() {
    local prompt="$1"
    local thinking="${2:-${NEMOTRON_THINKING_MODE}}"
    local effort="${3:-${NEMOTRON_REASONING_EFFORT}}"
    local budget="${4:-${NEMOTRON_THINKING_BUDGET}}"
    local max_tokens="${5:-${NEMOTRON_MAX_TOKENS}}"
    local force_nonempty="${6:-${NEMOTRON_FORCE_NON_EMPTY}}"
    local response_format="${7:-${NEMOTRON_RESPONSE_FORMAT}}"
    local stream="${8:-true}"

    jq -n \
        --arg model "${NEMOTRON_MODEL}" \
        --arg prompt "${prompt}" \
        --argjson max_tokens "${max_tokens}" \
        --argjson thinking "${thinking}" \
        --arg effort "${effort}" \
        --argjson budget "${budget}" \
        --argjson force_nonempty "${force_nonempty}" \
        --argjson stream "${stream}" \
        --argjson response_format "${response_format}" \
    '{
        model: $model,
        messages: [
            {
                role: "system",
                content: "You are an expert autonomous Linux infrastructure engineer. Emit precise, optimized, syntactically valid bash shell commands without conversational prose. Use Reasoning Sandwich: PLAN → ACTION → VERIFICATION."
            },
            {
                role: "user",
                content: $prompt
            }
        ],
        stream: $stream,
        max_tokens: $max_tokens,
        response_format: $response_format,
        extra_body: {
            chat_template_kwargs: {
                enable_thinking: $thinking,
                reasoning_effort: $effort,
                force_nonempty_content: $force_nonempty
            },
            thinking_token_budget: $budget
        }
    }'
}

# ─── DUAL-STREAM SSE READER ─────────────────────────────────────────────────
# Parses reasoning_content (dimmed) and content (bold) in real-time
nemotron_stream_reader() {
    local payload="$1"
    local timeout="${2:-300}"

    curl -N -s -X POST "${NEMOTRON_API_ENDPOINT}" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer ${NEMOTRON_API_KEY}" \
        -H "HTTP-Referer: https://kilo.ai" \
        -H "X-Title: FreeNemo-Orchestrator" \
        --connect-timeout 5 \
        --keepalive-time 60 \
        --max-time "${timeout}" \
        -d "${payload}" | while IFS= read -r line; do
            clean_line="${line#data: }"
            [[ -z "${clean_line}" ]] && continue
            [[ "${clean_line}" == "[DONE]" ]] && break

            # reasoning_content → dimmed gray (ANSI 2;37m)
            reasoning=$(echo "${clean_line}" | jq -r '.choices[0].delta.reasoning_content // .choices[0].delta.reasoning // empty' 2>/dev/null || true)
            if [[ -n "${reasoning}" ]]; then
                printf "\e[2;37m%s\e[0m" "${reasoning}"
            fi

            # content → bold green (ANSI 1;32m)
            content=$(echo "${clean_line}" | jq -r '.choices[0].delta.content // empty' 2>/dev/null || true)
            if [[ -n "${content}" ]]; then
                printf "\e[1;32m%s\e[0m" "${content}"
            fi
        done
    printf "\n"
}

# ─── HEADLESS NON-STREAM (for patching/diagnostics) ─────────────────────────
nemotron_headless() {
    local prompt="$1"
    local max_tokens="${2:-8192}"
    local budget="${3:-2048}"

    local payload=$(nemotron_build_payload "${prompt}" true "medium" "${budget}" "${max_tokens}" true '{"type": "json_object"}' false)

    local response
    response=$(curl -s -X POST "${NEMOTRON_API_ENDPOINT}" \
        -H "Content-Type: application/json" \
        -H "Authorization: Bearer ${NEMOTRON_API_KEY}" \
        -H "HTTP-Referer: https://kilo.ai" \
        --connect-timeout 5 \
        --max-time 180 \
        -d "${payload}")

    echo "${response}" | jq -r '.choices[0].message.content // empty'
}

# ─── QUICK COMMAND (bypass thinking for trivial tasks) ──────────────────────
nemotron_quick() {
    local prompt="$1"
    local payload=$(nemotron_build_payload "${prompt}" false "low" 256 1024 true '{}' true)
    nemotron_stream_reader "${payload}" 60
}

# ─── REASONING SANDWICH PROMPT BUILDER ──────────────────────────────────────
# Enforces: PLAN → ACTION → VERIFICATION structure
nemotron_sandwich_prompt() {
    local target_file="$1"
    local error_log="$2"
    local context="${3:-}"

    cat <<EOF
Perform autonomous diagnosis and remediation using Reasoning Sandwich Pattern:
1. PLAN: Isolate root cause from error log trace.
2. ACTION: Emit clean POSIX unified diff (diff -u) to patch target file.
3. VERIFICATION: Detail explicit assertion checks to validate the patch.

[TARGET_FILE: ${target_file}]
\`\`\`
$(cat "${target_file}")
\`\`\`

[ERROR_LOGS]
\`\`\`
$(tail -n 250 "${error_log}")
\`\`\`

${context}
EOF
}