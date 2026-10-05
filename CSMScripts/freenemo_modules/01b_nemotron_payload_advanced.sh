#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 01B: Nemotron 3 Ultra API Payload — Advanced Functions
# Headless mode, quick commands, reasoning sandwich prompt builder
# ════════════════════════════════════════════════════════════════════════════

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