#!/usr/bin/env bash
# Minimal GitHub Handler for AegisOutfitFabricator

GH_LOG_DIR="${REPO_ROOT}/.github_handler"
GH_DIFFICULTY_LOG="${GH_LOG_DIR}/difficulty_log.json"
GH_METHODS_LOG="${GH_LOG_DIR}/methods_log.json"
GH_MERGE_QUEUE="${GH_LOG_DIR}/merge_queue.json"
GH_SPLIT_DIR="${GH_LOG_DIR}/splits"

EASY_THRESHOLD=100
MEDIUM_THRESHOLD=500
HARD_THRESHOLD=2000
EXTREME_THRESHOLD=5000

gh_init() {
    mkdir -p "${GH_LOG_DIR}" "${GH_SPLIT_DIR}"
    [[ -f "${GH_DIFFICULTY_LOG}" ]] || echo '{"files":{}}' > "${GH_DIFFICULTY_LOG}"
    [[ -f "${GH_METHODS_LOG}" ]] || echo '{"methods":[]}' > "${GH_METHODS_LOG}"
    [[ -f "${GH_MERGE_QUEUE}" ]] || echo '{"queue":[]}' > "${GH_MERGE_QUEUE}"
}

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
        easy) echo 3 ;;
        medium) echo 6 ;;
        hard) echo 9 ;;
        *) echo 13 ;;
    esac
}

gh_log_difficulty() {
    local file="$1" diff="$2" lines="$3" strats="$4"
    local entry=$(jq -n --arg f "$file" --arg d "$diff" --arg l "$lines" --arg s "$strats" --arg t "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
        '{file: $f, difficulty: $d, lines: ($l|tonumber), strategies: ($s|tonumber), timestamp: $t}')
    jq --argjson e "$entry" --arg f "$file" '.files[$f] = $e' "${GH_DIFFICULTY_LOG}" > "${GH_DIFFICULTY_LOG}.tmp" && mv "${GH_DIFFICULTY_LOG}.tmp" "${GH_DIFFICULTY_LOG}"
}

gh_log_method() {
    local file="$1" method="$2" success="$3" diff="$4"
    local entry=$(jq -n --arg f "$file" --arg m "$method" --arg s "$success" --arg d "$diff" --arg t "$(date -u +%Y-%m-%dT%H:%M:%SZ)" \
        '{file: $f, method: $m, success: ($s=="true"), difficulty: $d, timestamp: $t}')
    jq --argjson e "$entry" '.methods += [$e]' "${GH_METHODS_LOG}" > "${GH_METHODS_LOG}.tmp" && mv "${GH_METHODS_LOG}.tmp" "${GH_METHODS_LOG}"
}

# Simple save - just use direct push
gh_save_file() {
    local file="$1" msg="${2:-Auto-save: $file}" branch="${3:-$(cd "$REPO_ROOT" && git branch --show-current)}"
    [[ ! -f "$file" ]] && { echo "File not found: $file" >&2; return 1; }
    file=$(realpath "$file")

    gh_init
    local lines=$(wc -l < "$file")
    local diff=$(gh_assess_difficulty "$file")
    local count=$(gh_strategy_count "$diff")

    echo "Saving $file ($lines lines, $diff, $count strategies)"
    gh_log_difficulty "$file" "$diff" "$lines" "$count"

    if (( lines > HARD_THRESHOLD )); then
        echo "Large file ($lines lines), splitting..."
        local parts=($(gh_split_file "$file" 500))
        local all_ok=true
        for p in "${parts[@]}"; do gh_save_file "$p" "Part: $msg" "$branch" || all_ok=false; done
        $all_ok && return 0 || return 1
    fi

    # Simple direct push
    cd "$REPO_ROOT"
    git add "$file"
    git commit -m "$msg"
    git -c http.sslVerify=false push origin "$branch"
    gh_log_method "$file" "direct" "true" "$diff"
    return 0
}

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
