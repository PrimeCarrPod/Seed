#!/usr/bin/env bash
# ════════════════════════════════════════════════════════════════════════════
# MODULE 03A: GitHub Handler — Core Config, Difficulty Assessment, Logging
# 3-13 strategies based on file size, auto-split/join, merge queue, success tracking
# ════════════════════════════════════════════════════════════════════════════

# ─── CONFIG ──────────────────────────────────────────────────────────────────
GH_LOG_DIR="${REPO_ROOT}/.github_handler"
GH_DIFFICULTY_LOG_DIR="${GH_LOG_DIR}/difficulty_logs"
GH_METHODS_LOG_DIR="${GH_LOG_DIR}/methods_logs"
GH_MERGE_QUEUE="${GH_LOG_DIR}/merge_queue.json"
GH_SPLIT_DIR="${GH_LOG_DIR}/splits"

# Unique session/process identifier for log file serialization
GH_SESSION_ID="${GH_SESSION_ID:-$(date +%s%N)_$$_${RANDOM}}"

EASY_THRESHOLD=100
MEDIUM_THRESHOLD=500
HARD_THRESHOLD=2000
EXTREME_THRESHOLD=5000

EASY_STRATS=3
MEDIUM_STRATS=6
HARD_STRATS=9
EXTREME_STRATS=13

# ─── INIT ────────────────────────────────────────────────────────────────────
gh_init() {
    mkdir -p "${GH_LOG_DIR}" "${GH_SPLIT_DIR}" "${GH_DIFFICULTY_LOG_DIR}" "${GH_METHODS_LOG_DIR}"
    # No longer need shared log files - each session creates its own
}

# ─── DIFFICULTY ASSESSMENT ──────────────────────────────────────────────────
gh_assess_difficulty() {
    local file="$1" lines=0
    [[ -f "$file" ]] && lines=$(wc -l < "$file")
    if (( lines <= EASY_THRESHOLD )); then echo "easy"
    elif (( lines <= MEDIUM_THRESHOLD )); then echo "medium"
    elif (( lines <= HARD_THRESHOLD )); then echo "hard"
    else echo "extreme"; fi
}

gh_strategy_count() {
    case "$1" in
        easy) echo $EASY_STRATS ;;
        medium) echo $MEDIUM_STRATS ;;
        hard) echo $HARD_STRATS ;;
        *) echo $EXTREME_STRATS ;;
    esac
}

# ─── LOGGING ─────────────────────────────────────────────────────────────────
gh_log_difficulty() {
    local file="$1" diff="$2" lines="$3" strats="$4"
    local entry=$(jq -n --arg f "$file" --arg d "$diff" --arg l "$lines" --arg s "$strats" --arg t "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
        '{file: $f, difficulty: $d, lines: ($l|tonumber), strategies: ($s|tonumber), timestamp: $t}')
    local log_file="${GH_DIFFICULTY_LOG_DIR}/difficulty_${GH_SESSION_ID}.json"
    echo "$entry" > "$log_file"
}

gh_log_method() {
    local file="$1" method="$2" success="$3" diff="$4"
    local entry=$(jq -n --arg f "$file" --arg m "$method" --arg s "$success" --arg d "$diff" --arg t "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
        '{file: $f, method: $m, success: ($s=="true"), difficulty: $d, timestamp: $t}')
    local log_file="${GH_METHODS_LOG_DIR}/methods_${GH_SESSION_ID}.json"
    echo "$entry" > "$log_file"
}

# ─── SPLIT/JOIN ──────────────────────────────────────────────────────────────
gh_split_file() {
    local file="$1" max_lines="${2:-500}"
    local base=$(basename "$file" .md)
    local prefix="${GH_SPLIT_DIR}/${base}_part"
    mkdir -p "${GH_SPLIT_DIR}"
    split -l "$max_lines" -d --additional-suffix=.md "$file" "$prefix"
    local parts=($(ls "${prefix}"* 2>/dev/null | sort))
    jq -n --arg o "$file" --argjson p "$(printf '%s\n' "${parts[@]}" | jq -R . | jq -s .)" '{original:$o,parts:$p,created:now|todateiso8601}' > "${GH_SPLIT_DIR}/${base}_manifest.json"
    printf '%s\n' "${parts[@]}"
}

gh_join_files() {
    local manifest="$1" output="$2"
    local parts=$(jq -r '.parts[]' "$manifest")
    cat $parts > "$output"
}